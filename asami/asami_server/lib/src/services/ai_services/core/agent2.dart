
import 'dart:convert';
import 'package:asami_server/utils/logger/asami_logger.dart';
import 'package:serverpod/serverpod.dart' hide Order;
import '../../../generated/protocol.dart';
import '../models/tool_call.dart';
import '../providers/ai_provider_interface.dart';
import '../models/ai_request.dart';
import '../models/ai_response.dart';
import '../tools/tool_definition.dart';
import '../tools/tool_registry.dart';
import './security_filter.dart';
import './command_processor.dart';
import './intent_analyzer.dart';
import '../config/system_prompts.dart';
import './ai_cache_manager.dart';
import 'response_formater.dart';

/// Enhanced Agent System - Routes messages through AI with tool use capabilities
class AgentSystem {
  final AIProvider provider;
  final ToolRegistry toolRegistry;
  final ResponseFormatter responseFormatter;
  final SecurityFilter securityFilter;
  final CommandProcessor commandProcessor;
  final IntentAnalyzer intentAnalyzer;
  final AICacheManager cacheManager;

  AgentSystem({
    required this.provider,
    required this.toolRegistry,
    required this.responseFormatter,
    required this.securityFilter,
    required this.commandProcessor,
    required this.intentAnalyzer,
    required this.cacheManager,
  });

  /// Process incoming message through the complete agent pipeline
  Future<Map<String, dynamic>> processMessage({
    required Session session,
    required User user,
    required Conversation conversation,
    required Message message,
    required PlatformType platform,
  }) async {
    try {
      Log.info('🤖 Agent: Processing message from ${user.userType.name}');

      // ========== STEP 1: CHECK CACHE ==========
      final cacheKey = _buildCacheKey(message.content, user.userType);
      final cachedResponse = await cacheManager.get(session, cacheKey);
      
      if (cachedResponse != null) {
        Log.info('💾 Cache hit: Returning cached response');
        return cachedResponse;
      }

      // ========== STEP 2: COMMAND PROCESSING ==========
      final commandResult = await commandProcessor.processCommand(
        message: message.content,
        userType: user.userType,
        platform: platform,
        context: _buildContext(session, user, conversation, platform),
      );

      if (commandResult != null) {
        Log.info('✅ Command executed: ${commandResult['command']}');
        return _formatCommandResponse(commandResult);
      }

      // ========== STEP 3: SECURITY CHECK ==========
      final securityCheck = await securityFilter.checkMessage(
        message: message.content,
        user: user,
        conversation: conversation,
        platform: platform,
      );

      if (!securityCheck['allowed']) {
        Log.info('🚨 Security violation detected: ${securityCheck['violation_type']}');
        return {
          'success': true,
          'response': securityCheck['warning_message'],
          'intent': 'security_violation',
          'metadata': {
            'violation_type': securityCheck['violation_type'],
            'severity': securityCheck['severity'],
          },
        };
      }

      // ========== STEP 4: BUILD CONTEXT ==========
      final conversationHistory = await _buildConversationHistory(
        session,
        conversation,
        maxMessages: 20,
      );

      final userContext = await _getUserContext(session, user);
      final systemPrompt = SystemPrompts.getPrompt(
        user.userType.name,
        platform.name,
        userContext,
      );

      Log.info('📋 Context built: ${conversationHistory.length} messages');

      // ========== STEP 5: AI PROCESSING ==========
      final aiRequest = AIRequest(
        systemPrompt: systemPrompt,
        messages: [
          ...conversationHistory,
          AIMessage(
            role: 'user',
            content: message.content,
          ),
        ],
        tools: _getToolsForUser(user.userType),
        temperature: 0.7,
        maxTokens: 4000,
        metadata: {
          'user_id': user.id.uuid,
          'conversation_id': conversation.id.uuid,
          'platform': platform.name,
        },
      );

      Log.info('🧠 Sending to AI provider: ${provider.providerName}');
      final aiResponse = await provider.chat(aiRequest);

      if (!aiResponse.success) {
        Log.info('❌ AI provider error: ${aiResponse.error}');
        return {
          'success': false,
          'error': aiResponse.error,
          'response': _getErrorResponse(user.userType),
        };
      }

      // Track AI usage
      await _trackAIUsage(session, user, aiResponse);
      
      // ========== STEP 6: TOOL EXECUTION ==========
      if (aiResponse.toolCalls != null && aiResponse.toolCalls!.isNotEmpty) {
        Log.info('🔧 Processing ${aiResponse.toolCalls!.length} tool calls');
        final result = await _handleToolCalls(
          session: session,
          user: user,
          conversation: conversation,
          toolCalls: aiResponse.toolCalls!,
          platform: platform,
          conversationHistory: conversationHistory,
        );
        
        // Cache tool-based responses
        await cacheManager.set(session, cacheKey, result, ttl: 300); // 5 min
        return result;
      }

      // ========== STEP 7: RESPONSE FORMATTING ==========
      final responseText = aiResponse.text ?? '';
      final intent = intentAnalyzer.analyze(responseText, message.content);

      Log.info('📤 Formatting response for ${platform.name}, intent: $intent');

      final formattedResponse = await responseFormatter.format(
        text: responseText,
        platform: platform,
        userType: user.userType,
        intent: intent,
        conversationContext: conversation,
      );

      final finalResult = {
        'success': true,
        'response': formattedResponse['text'],
        'intent': intent,
        'response_type': formattedResponse['type'],
        'metadata': formattedResponse['metadata'],
        'ai_usage': aiResponse.usage,
        'finish_reason': aiResponse.finishReason,
      };

      // Cache successful responses
      await cacheManager.set(session, cacheKey, finalResult, ttl: 600); // 10 min

      return finalResult;

    } catch (e, stackTrace) {
      Log.info('❌ Agent system error: $e');
      session.log('Agent system error: $e', stackTrace: stackTrace);
      return {
        'success': false,
        'error': e.toString(),
        'response': _getErrorResponse(user.userType),
      };
    }
  }

  /// Handle tool calls from AI with proper permission checking
  Future<Map<String, dynamic>> _handleToolCalls({
    required Session session,
    required User user,
    required Conversation conversation,
    required List<ToolCall> toolCalls,
    required PlatformType platform,
    required List<AIMessage> conversationHistory,
  }) async {
    final toolResults = <AIMessage>[];
    final executedTools = <String>[];

    for (var toolCall in toolCalls) {
      try {
        Log.info('🔧 Executing tool: ${toolCall.name}');

        final hasPermission = await securityFilter.checkToolPermission(
          toolName: toolCall.name,
          userType: user.userType,
          arguments: toolCall.arguments,
        );

        if (!hasPermission) {
          Log.info('🚫 Permission denied for tool: ${toolCall.name}');
          toolResults.add(AIMessage(
            role: 'tool',
            name: toolCall.name,
            toolCallId: toolCall.id,
            content: jsonEncode({
              'success': false,
              'error': 'You do not have permission to use this function.',
              'error_code': 'PERMISSION_DENIED',
            }),
          ));
          continue;
        }

        final result = await toolRegistry.execute(
          toolCall.name,
          toolCall.arguments,
          ToolExecutionContext(
            session: session, // NOW PASSING SESSION
            userId: user.id.uuid,
            conversationId: conversation.id.uuid,
            platform: platform.name,
            userType: user.userType.name,
            sessionData: conversation.sessionData != null
                ? jsonDecode(conversation.sessionData!)
                : null,
          ),
        );

        Log.info('✅ Tool executed successfully: ${toolCall.name}');
        executedTools.add(toolCall.name);

        toolResults.add(AIMessage(
          role: 'tool',
          name: toolCall.name,
          toolCallId: toolCall.id,
          content: jsonEncode(result),
        ));
      } catch (e, stackTrace) {
        Log.info('❌ Tool execution error: ${toolCall.name} - $e');
        session.log('Tool execution error: ${toolCall.name}', stackTrace: stackTrace);

        toolResults.add(AIMessage(
          role: 'tool',
          name: toolCall.name,
          toolCallId: toolCall.id,
          content: jsonEncode({
            'success': false,
            'error': 'Failed to execute function: ${e.toString()}',
            'error_code': 'TOOL_EXECUTION_ERROR',
          }),
        ));
      }
    }

    // Send tool results back to AI
    final followUpRequest = AIRequest(
      messages: [
        ...conversationHistory,
        AIMessage(
          role: 'assistant',
          content: '',
          toolCalls: toolCalls,
        ),
        ...toolResults,
      ],
      tools: _getToolsForUser(user.userType),
      temperature: 0.7,
      maxTokens: 4000,
    );

    Log.info('🧠 Sending tool results back to AI');
    final finalResponse = await provider.chat(followUpRequest);

    if (!finalResponse.success) {
      Log.info('❌ AI follow-up error: ${finalResponse.error}');
      return {
        'success': false,
        'error': finalResponse.error,
        'response': 'I completed the action but encountered an issue generating a response.',
      };
    }

    final responseText = finalResponse.text ?? '';
    final intent = intentAnalyzer.analyze(responseText, '');

    final formattedResponse = await responseFormatter.format(
      text: responseText,
      platform: platform,
      userType: user.userType,
      intent: intent,
      conversationContext: conversation,
    );

    return {
      'success': true,
      'response': formattedResponse['text'],
      'intent': intent,
      'response_type': formattedResponse['type'],
      'functions_called': executedTools,
      'function_results': toolResults.map((r) => r.content).toList(),
      'metadata': formattedResponse['metadata'],
    };
  }

  /// Build execution context for tools (NOW WITH SESSION)
  ToolExecutionContext _buildContext(
    Session session,
    User user,
    Conversation conversation,
    PlatformType platform,
  ) {
    return ToolExecutionContext(
      session: session, // ADDED SESSION
      userId: user.id.uuid,
      conversationId: conversation.id.uuid,
      platform: platform.name,
      userType: user.userType.name,
      sessionData: conversation.sessionData != null
          ? jsonDecode(conversation.sessionData!)
          : null,
    );
  }

  /// Build conversation history
  Future<List<AIMessage>> _buildConversationHistory(
    Session session,
    Conversation conversation, {
    int maxMessages = 20,
  }) async {
    final messages = await Message.db.find(
      session,
      where: (t) => t.conversationId.equals(conversation.id),
      orderBy: (t) => t.createdAt,
      orderDescending: true,
      limit: maxMessages,
    );

    return messages.reversed.map((m) {
      return AIMessage(
        role: m.isFromUser ? 'user' : 'assistant',
        content: m.content,
      );
    }).toList();
  }

  /// Get user context for personalization
  Future<Map<String, dynamic>> _getUserContext(
    Session session,
    User user,
  ) async {
    final context = <String, dynamic>{
      'user_name': user.firstName ?? 'there',
      'user_type': user.userType.name,
    };

    if (user.userType == UserType.vendor) {
      final vendor = await VendorProfile.db.findFirstRow(
        session,
        where: (t) => t.userId.equals(user.id),
      );

      if (vendor != null) {
        context['business_name'] = vendor.businessName;
        context['subscription_tier'] = vendor.subscriptionTier.name;
        context['total_products'] = vendor.totalProducts;
        context['product_limit'] = vendor.productLimit;
      }
    } else if (user.userType == UserType.customer) {
      final customer = await CustomerProfile.db.findFirstRow(
        session,
        where: (t) => t.userId.equals(user.id),
      );

      if (customer != null) {
        context['total_orders'] = customer.totalOrders;
        context['total_spent'] = customer.totalSpent;
      }
    }

    return context;
  }

  /// Get tools available for user type
  List<ToolDefinition> _getToolsForUser(UserType userType) {
    switch (userType) {
      case UserType.customer:
        return toolRegistry.getToolsForRole('customer');
      case UserType.vendor:
        return toolRegistry.getToolsForRole('vendor');
      default:
        return [];
    }
  }

  /// Get appropriate error response
  String _getErrorResponse(UserType userType) {
    switch (userType) {
      case UserType.customer:
        return 'I apologize, but I encountered a temporary issue. Please try again, or type "help" for assistance.';
      case UserType.vendor:
        return 'I encountered a technical issue processing your request. Please try again. If the problem persists, contact support.';
      default:
        return 'An error occurred. Please try again.';
    }
  }

  /// Format command response
  Map<String, dynamic> _formatCommandResponse(Map<String, dynamic> result) {
    return {
      'success': true,
      'response': result['response'],
      'intent': 'command_execution',
      'command': result['command'],
      'metadata': result['metadata'] ?? {},
    };
  }

  /// Build cache key
  String _buildCacheKey(String message, UserType userType) {
    return 'ai_response:${userType.name}:${message.hashCode}';
  }

  /// Track AI usage for analytics
  Future<void> _trackAIUsage(
    Session session,
    User user,
    AIResponse aiResponse,
  ) async {
    if (aiResponse.usage == null) return;

    try {
      // Track for vendor billing if they're on pay-as-you-go
      if (user.userType == UserType.vendor) {
        final vendor = await VendorProfile.db.findFirstRow(
          session,
          where: (t) => t.userId.equals(user.id),
        );

        if (vendor != null && vendor.subscriptionTier == SubscriptionTier.pro) {
          // Create usage record for billing
          final usageId = Uuid().v4obj();
          final now = DateTime.now();
          
          final usage = UsageRecord(
            id: usageId,
            vendorId: user.id,
            usageType: 'ai_conversation',
            quantity: (aiResponse.usage!['total_tokens'] as num?)?.toInt() ?? 0,
            unitPrice: 0.001, // $0.001 per token
            totalAmount: ((aiResponse.usage!['total_tokens'] as num?)?.toDouble() ?? 0) * 0.001,
            billingPeriodStart: DateTime(now.year, now.month, 1),
            billingPeriodEnd: DateTime(now.year, now.month + 1, 0),
            createdAt: now,
          );

          await UsageRecord.db.insertRow(session, usage);
        }
      }
    } catch (e) {
      Log.info('⚠️ Failed to track AI usage: $e');
    }
  }

  /// Dispose resources
  Future<void> dispose() async {
    await provider.dispose();
  }
}