import 'dart:convert';
import 'package:asami_server/src/services/product/product_creation_handler.dart';
import 'package:asami_server/utils/logger/asami_logger.dart';
import 'package:serverpod/serverpod.dart' hide Order, Message;
import '../../../endpoints/user_endpoint.dart';
import '../../../generated/protocol.dart';
import '../../../endpoints/usage_endpoint.dart';
import '../../dependency_injection.dart';
import '../../product/product_creation_state.dart';
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

/// Enhanced Agent System with Complete Usage Tracking Integration
class AgentSystem {
  final AIProvider provider;
  final ToolRegistry toolRegistry;
  final ResponseFormatter responseFormatter;
  final SecurityFilter securityFilter;
  final CommandProcessor commandProcessor;
  final IntentAnalyzer intentAnalyzer;
  final AICacheManager cacheManager;
  final UsageEndpoint usageEndpoint;

  AgentSystem({
    required this.provider,
    required this.toolRegistry,
    required this.responseFormatter,
    required this.securityFilter,
    required this.commandProcessor,
    required this.intentAnalyzer,
    required this.cacheManager,
    required this.usageEndpoint,
  });

  /// Process incoming message through the complete agent pipeline with usage tracking
  Future<Map<String, dynamic>> processMessage({
    required Session session,
    required User user,
    required Conversation conversation,
    required Message message,
    required PlatformType platform,
  }) async {
    final startTime = DateTime.now();

    try {
      Log.info('🤖 Agent: Processing message from ${user.userType.name}');
      Log.info(
          '📝 Message preview: ${message.content.substring(0, message.content.length > 50 ? 50 : message.content.length)}...');

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
        final violationType = securityCheck['violation_type'];
        final severity = securityCheck['severity'];

        Log.info('🚨 Security violation detected');
        Log.info('   Type: $violationType');
        Log.info('   Severity: $severity');
        Log.info('   User: ${user.id.uuid}');

        // Log critical violations
        if (severity == 'critical' || severity == 'high') {
          await _logSecurityIncident(
            session: session,
            user: user,
            conversation: conversation,
            message: message.content,
            violationType: violationType,
            severity: severity,
          );
        }

        return {
          'success': true,
          'response': securityCheck['warning_message'],
          'intent': 'security_violation',
          'blocked': true,
          'metadata': {
            'violation_type': violationType,
            'severity': severity,
            'timestamp': DateTime.now().toIso8601String(),
          },
        };
      }

      // ========== STEP 3.5: CHECK PRODUCT CREATION FLOW (NEW) ==========

      final productCreationHandler = getIt<ProductCreationHandler>();

      if (await productCreationHandler.isInCreationFlow(
          session, conversation.id.uuid)) {
        Log.info('🔒 User in product creation flow - delegating to handler');

        final creationResult =
            await productCreationHandler.processCreationMessage(
          session,
          user: user,
          conversation: conversation,
          message: message,
          platform: platform,
        );

        if (creationResult['blocked'] == true) {
          // State-locked rejection - send error immediately
          Log.info(
              '🚫 Input blocked by state gate: ${creationResult['state']}');

          return {
            'success': true, // Technical success (message was processed)
            'response': creationResult['message'],
            'intent': 'product_creation_blocked',
            'in_creation_flow': true,
            'blocked': true,
            'metadata': {
              'current_state': creationResult['state'],
              'timestamp': DateTime.now().toIso8601String(),
            },
          };
        }

        if (creationResult['ready_to_create'] == true) {
          // Complete product creation
          Log.info('✅ Product creation ready - finalizing...');

          final completionResult =
              await productCreationHandler.completeProductCreation(
            session,
            user: user,
            creationSession:
                ProductCreationSession.fromJson(creationResult['session_data']),
            conversation: conversation,
          );

          return {
            'success': completionResult['success'],
            'response': completionResult['message'],
            'intent': 'product_created',
            'in_creation_flow': false,
            'product_id': completionResult['product_id'],
            'metadata': {
              'timestamp': DateTime.now().toIso8601String(),
            },
          };
        }

        // State progressed normally - return the next prompt
        Log.info('➡️ State progressed to: ${creationResult['state']}');

        return {
          'success': true,
          'response': creationResult['message'],
          'intent': 'product_creation_progress',
          'in_creation_flow': true,
          'metadata': {
            'current_state': creationResult['state'],
            'timestamp': DateTime.now().toIso8601String(),
          },
        };
      }

      // ========== STEP 4: USAGE LIMIT CHECK ==========
      final isToolCallLikely = _isToolCallLikely(message.content);
      final usageLimitCheck = await _checkUsageLimitsBeforeProcessing(
        session: session,
        user: user,
        message: message,
        conversation: conversation,
        isToolCallLikely: isToolCallLikely,
      );

      if (usageLimitCheck['block'] == true) {
        Log.info('🚫 Message blocked due to usage limits');
        Log.info('   Reason: ${usageLimitCheck['reason']}');

        return {
          'success': false,
          'response': usageLimitCheck['response'],
          'limit_exceeded': true,
          'upgrade_available': usageLimitCheck['upgrade_available'] ?? false,
          'throttle_seconds': usageLimitCheck['throttle_seconds'],
          'metadata': {
            'limit_type': usageLimitCheck['reason'],
            'timestamp': DateTime.now().toIso8601String(),
          },
        };
      }

      // Apply throttle if needed
      if (usageLimitCheck['throttle'] == true) {
        final throttleSeconds = usageLimitCheck['throttle_seconds'] ?? 2;
        Log.info('⏱️ Applying throttle: ${throttleSeconds}s');
        await Future.delayed(Duration(seconds: throttleSeconds));
      }

      // Store usage warning if present
      final usageWarning = usageLimitCheck['warning'];
      if (usageWarning != null) {
        Log.info('⚠️ Usage warning: $usageWarning');
      }

      // ========== STEP 5: BUILD CONTEXT ==========
      final conversationHistory = await _buildConversationHistory(
        session,
        conversation,
        maxMessages: 20,
      );

      final userContext = await _getUserContext(session, user);

      // Add usage info to system prompt
      if (usageWarning != null) {
        userContext['usage_warning'] = usageWarning;
      }

      final systemPrompt = SystemPrompts.getPrompt(
        user.userType.name,
        platform.name,
        userContext,
      );

      Log.info('📋 Context built: ${conversationHistory.length} messages');
      Log.info('👤 User context keys: ${userContext.keys.join(', ')}');

      // ========== STEP 6: GET AVAILABLE TOOLS ==========
      final availableTools = _getToolsForUser(user.userType);
      Log.info('🔧 Available tools: ${availableTools.length}');

      if (user.userType == UserType.vendor) {
        Log.info('   Vendor has access to both customer and vendor tools');
      }

      // ========== STEP 7: AI PROCESSING ==========
      final aiRequest = AIRequest(
        systemPrompt: systemPrompt,
        messages: [
          ...conversationHistory,
          AIMessage(
            role: 'user',
            content: message.content,
          ),
        ],
        tools: availableTools,
        temperature: 0.7,
        maxTokens: 4000,
        metadata: {
          'user_id': user.id.uuid,
          'conversation_id': conversation.id.uuid,
          'platform': platform.name,
          'user_type': user.userType.name,
          'usage_class': userContext['usage_class'],
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

      // ========== STEP 8: TOOL EXECUTION ==========
      if (aiResponse.toolCalls != null && aiResponse.toolCalls!.isNotEmpty) {
        Log.info('🔧 Processing ${aiResponse.toolCalls!.length} tool calls');

        // Log each tool call
        for (var toolCall in aiResponse.toolCalls!) {
          Log.info(
              '   → ${toolCall.name}(${toolCall.arguments.keys.join(', ')})');
        }

        final result = await _handleToolCallsWithTracking(
          session: session,
          user: user,
          conversation: conversation,
          toolCalls: aiResponse.toolCalls!,
          platform: platform,
          conversationHistory: conversationHistory,
          aiUsage: aiResponse.usage,
        );

        // Cache tool-based responses (shorter TTL for dynamic data)
        await cacheManager.set(session, cacheKey, result, ttl: 300); // 5 min
        return result;
      }

      // ========== STEP 9: TRACK AI MESSAGE USAGE ==========
      final processingTime =
          DateTime.now().difference(startTime).inMilliseconds;

      await _trackAIMessageUsage(
        session: session,
        user: user,
        conversation: conversation,
        aiUsage: aiResponse.usage ?? {},
        toolCallsCount: 0,
        responseTimeMs: processingTime.toDouble(),
      );

      // ========== STEP 10: RESPONSE FORMATTING ==========
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

      // ========== STEP 11: GET USAGE SUMMARY ==========
      final usageSummary = await _getUserUsageSummary(
        session: session,
        userId: user.id.uuid,
        userType: user.userType,
      );

      final finalResult = {
        'success': true,
        'response': formattedResponse['text'],
        'intent': intent,
        'response_type': formattedResponse['type'],
        'usage_warning': usageWarning,
        'usage_summary': usageSummary['found'] ? usageSummary['summary'] : null,
        'metadata': {
          ...formattedResponse['metadata'],
          'ai_provider': provider.providerName,
          'tools_available': availableTools.length,
          'processing_time_ms': processingTime,
          'cached': false,
        },
        'ai_usage': aiResponse.usage,
        'finish_reason': aiResponse.finishReason,
      };

      // Cache successful responses
      await cacheManager.set(session, cacheKey, finalResult,
          ttl: 600); // 10 min

      Log.info('✅ Message processed successfully in ${processingTime}ms');
      return finalResult;
    } catch (e, stackTrace) {
      Log.info('❌ Agent system error: $e');
      session.log('Agent system error: $e', stackTrace: stackTrace);

      return {
        'success': false,
        'error': e.toString(),
        'response': _getErrorResponse(user.userType),
        'metadata': {
          'error_type': 'system_error',
          'timestamp': DateTime.now().toIso8601String(),
        },
      };
    }
  }

  /// Check usage limits before processing message
  Future<Map<String, dynamic>> _checkUsageLimitsBeforeProcessing({
    required Session session,
    required User user,
    required Message message,
    required Conversation conversation,
    bool isToolCallLikely = false,
  }) async {
    try {
      if (user.userType == UserType.vendor) {
        // Get vendor profile for tier info
        final vendor = await VendorProfile.db.findFirstRow(
          session,
          where: (t) => t.userId.equals(user.id),
        );

        if (vendor == null) {
          return {'allowed': true}; // Fail open
        }

        // Check vendor tool limit for messages that might trigger tools
        if (isToolCallLikely) {
          final limitCheck = await usageEndpoint.checkVendorToolLimit(
            session: session,
            userId: user.id.uuid,
            toolName: 'generic', // Generic check
            tier: vendor.subscriptionTier,
          );

          if (!limitCheck['allowed']) {
            return {
              'allowed': false,
              'block': true,
              'response': limitCheck['message'],
              'reason': limitCheck['reason'] ?? 'limit_exceeded',
              'upgrade_available': true,
              'upgrade_url': limitCheck['upgrade_url'],
            };
          }

          if (limitCheck['in_grace_period'] == true) {
            return {
              'allowed': true,
              'warning': limitCheck['message'],
              'grace_period': true,
              'grace_remaining': limitCheck['grace_remaining'],
            };
          }

          // Check if approaching limit
          if (limitCheck['within_limit'] == true) {
            final remaining = limitCheck['remaining'] ?? 0;
            final limit = limitCheck['limit'] ?? 0;

            if (remaining <= 3 && limit > 0) {
              return {
                'allowed': true,
                'warning': 'You have $remaining tool calls remaining today.',
              };
            }
          }
        }

        return {'allowed': true};
      } else if (user.userType == UserType.customer) {
        // Check customer AI usage
        final usageCheck = await usageEndpoint.checkCustomerAIUsage(
          session: session,
          userId: user.id.uuid,
          conversationId: conversation.id.uuid,
          isToolCall: isToolCallLikely,
        );

        if (!usageCheck['allowed']) {
          return {
            'allowed': false,
            'block': true,
            'response': usageCheck['message'],
            'reason': usageCheck['reason'],
            'throttle': usageCheck['throttle'] ?? false,
            'throttle_seconds': usageCheck['throttle_seconds'],
          };
        }

        // Return throttle info if present
        if (usageCheck['throttle'] == true) {
          return {
            'allowed': true,
            'throttle': true,
            'throttle_seconds': usageCheck['throttle_seconds'] ?? 2,
          };
        }

        // Check if approaching limit (80%)
        final usagePercent = usageCheck['usage_percent'] ?? 0;
        final remaining = usageCheck['remaining'] ?? 0;

        if (usagePercent >= 80) {
          return {
            'allowed': true,
            'warning':
                'You are approaching your daily message limit ($usagePercent% used, $remaining remaining)',
          };
        }

        return {'allowed': true};
      }

      return {'allowed': true};
    } catch (e) {
      Log.info('⚠️ Error checking usage limits: $e');
      return {'allowed': true}; // Fail open
    }
  }

  /// Handle tool calls with complete usage tracking
  Future<Map<String, dynamic>> _handleToolCallsWithTracking({
    required Session session,
    required User user,
    required Conversation conversation,
    required List<ToolCall> toolCalls,
    required PlatformType platform,
    required List<AIMessage> conversationHistory,
    Map<String, dynamic>? aiUsage,
  }) async {
    final toolResults = <AIMessage>[];
    final executedTools = <String>[];
    final failedTools = <Map<String, dynamic>>[];
    SubscriptionTier? tier;

    // Get vendor tier if applicable
    if (user.userType == UserType.vendor) {
      final vendor = await VendorProfile.db.findFirstRow(
        session,
        where: (t) => t.userId.equals(user.id),
      );
      tier = vendor?.subscriptionTier;
    }

    for (var toolCall in toolCalls) {
      final toolStartTime = DateTime.now();
      bool success = false;
      String? errorMessage;

      try {
        Log.info('🔧 Executing tool: ${toolCall.name}');
        Log.info('   Arguments: ${jsonEncode(toolCall.arguments)}');

        // LAYER 1: Permission check
        final hasPermission = await securityFilter.checkToolPermission(
          toolName: toolCall.name,
          userType: user.userType,
          arguments: toolCall.arguments,
        );

        if (!hasPermission) {
          Log.info('🚫 Permission denied for tool: ${toolCall.name}');

          errorMessage = 'You do not have permission to use this function.';

          failedTools.add({
            'tool': toolCall.name,
            'reason': 'permission_denied',
          });

          toolResults.add(AIMessage(
            role: 'tool',
            name: toolCall.name,
            toolCallId: toolCall.id,
            content: jsonEncode({
              'success': false,
              'error': errorMessage,
              'error_code': 'PERMISSION_DENIED',
            }),
          ));

          // Track denied attempt
          await usageEndpoint.trackToolUsage(
            session: session,
            userId: user.id.uuid,
            userType: user.userType,
            toolName: toolCall.name,
            success: false,
            executionTimeMs: 0,
            conversationId: conversation.id.uuid,
            arguments: toolCall.arguments,
            errorMessage: errorMessage,
            tier: tier,
          );

          continue;
        }

        // LAYER 2: Vendor-specific limit check
        if (user.userType == UserType.vendor && tier != null) {
          final limitCheck = await usageEndpoint.checkVendorToolLimit(
            session: session,
            userId: user.id.uuid,
            toolName: toolCall.name,
            tier: tier,
          );

          if (!limitCheck['allowed']) {
            errorMessage = limitCheck['message'];

            Log.info('🚫 Limit exceeded for tool: ${toolCall.name}');
            Log.info('   Reason: ${limitCheck['reason']}');

            failedTools.add({
              'tool': toolCall.name,
              'reason': limitCheck['reason'] ?? 'limit_exceeded',
            });

            toolResults.add(AIMessage(
              role: 'tool',
              name: toolCall.name,
              toolCallId: toolCall.id,
              content: jsonEncode({
                'success': false,
                'error': errorMessage,
                'error_code': 'LIMIT_EXCEEDED',
                'upgrade_url': limitCheck['upgrade_url'],
              }),
            ));

            // Track denied attempt
            await usageEndpoint.trackToolUsage(
              session: session,
              userId: user.id.uuid,
              userType: user.userType,
              toolName: toolCall.name,
              success: false,
              executionTimeMs: 0,
              conversationId: conversation.id.uuid,
              arguments: toolCall.arguments,
              errorMessage: errorMessage,
              tier: tier,
            );

            continue;
          }

          if (limitCheck['in_grace_period'] == true) {
            Log.info(
                '⚠️ Using grace period: ${limitCheck['grace_used']}/${limitCheck['grace_remaining'] + limitCheck['grace_used']}');
          }
        }

        // LAYER 3: Argument validation
        final argumentValidation = await securityFilter.validateToolArguments(
          toolName: toolCall.name,
          arguments: toolCall.arguments,
          user: user,
        );

        if (argumentValidation['valid'] != true) {
          errorMessage = argumentValidation['error'];

          Log.info('⚠️ Invalid arguments for tool: ${toolCall.name}');
          Log.info('   Error: $errorMessage');

          failedTools.add({
            'tool': toolCall.name,
            'reason': 'invalid_arguments',
          });

          toolResults.add(AIMessage(
            role: 'tool',
            name: toolCall.name,
            toolCallId: toolCall.id,
            content: jsonEncode({
              'success': false,
              'error': errorMessage,
              'error_code': 'INVALID_ARGUMENTS',
            }),
          ));

          continue;
        }

        // LAYER 4: Execute tool
        final result = await toolRegistry.execute(
          toolCall.name,
          toolCall.arguments,
          ToolExecutionContext(
            session: session,
            userId: user.id.uuid,
            conversationId: conversation.id.uuid,
            platform: platform.name,
            userType: user.userType.name,
            sessionData: conversation.sessionData != null
                ? jsonDecode(conversation.sessionData!)
                : null,
          ),
        );

        success = result['success'] == true;
        final executionTime =
            DateTime.now().difference(toolStartTime).inMilliseconds;

        Log.info('✅ Tool executed: ${toolCall.name}');
        Log.info('   Execution time: ${executionTime}ms');
        Log.info('   Result: ${success ? 'success' : 'failure'}');

        executedTools.add(toolCall.name);

        // Track successful execution
        await usageEndpoint.trackToolUsage(
          session: session,
          userId: user.id.uuid,
          userType: user.userType,
          toolName: toolCall.name,
          success: success,
          executionTimeMs: executionTime,
          conversationId: conversation.id.uuid,
          arguments: toolCall.arguments,
          errorMessage: success ? null : result['error']?.toString(),
          tier: tier,
        );

        toolResults.add(AIMessage(
          role: 'tool',
          name: toolCall.name,
          toolCallId: toolCall.id,
          content: jsonEncode(result),
        ));
      } catch (e, stackTrace) {
        errorMessage = e.toString();

        Log.info('❌ Tool execution error: ${toolCall.name}');
        Log.info('   Error: $errorMessage');
        session.log('Tool execution error: ${toolCall.name}',
            stackTrace: stackTrace);

        failedTools.add({
          'tool': toolCall.name,
          'reason': 'execution_error',
          'error': errorMessage,
        });

        // Track failed execution
        final executionTime =
            DateTime.now().difference(toolStartTime).inMilliseconds;
        await usageEndpoint.trackToolUsage(
          session: session,
          userId: user.id.uuid,
          userType: user.userType,
          toolName: toolCall.name,
          success: false,
          executionTimeMs: executionTime,
          conversationId: conversation.id.uuid,
          arguments: toolCall.arguments,
          errorMessage: errorMessage,
          tier: tier,
        );

        toolResults.add(AIMessage(
          role: 'tool',
          name: toolCall.name,
          toolCallId: toolCall.id,
          content: jsonEncode({
            'success': false,
            'error': 'Tool execution failed: $errorMessage',
            'error_code': 'EXECUTION_ERROR',
          }),
        ));
      }
    }

    // Log execution summary
    Log.info('📊 Tool execution summary:');
    Log.info('   Successful: ${executedTools.length}');
    Log.info('   Failed: ${failedTools.length}');
    if (failedTools.isNotEmpty) {
      for (var failure in failedTools) {
        Log.info('   ✗ ${failure['tool']}: ${failure['reason']}');
      }
    }

    // Track AI message with tool usage
    await _trackAIMessageUsage(
      session: session,
      user: user,
      conversation: conversation,
      aiUsage: aiUsage ?? {},
      toolCallsCount: toolCalls.length,
      responseTimeMs: 0.0, // Already tracked
    );

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

      // If tools executed successfully, return manual summary
      if (executedTools.isNotEmpty) {
        return {
          'success': true,
          'response': _generateToolSummary(executedTools, failedTools),
          'intent': 'tool_execution',
          'functions_called': executedTools,
          'functions_failed': failedTools,
          'metadata': {
            'ai_followup_failed': true,
            'manual_summary': true,
          },
        };
      }

      return {
        'success': false,
        'error': finalResponse.error,
        'response':
            'I completed the action but encountered an issue generating a response.',
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

    // Get usage summary
    final usageSummary = await _getUserUsageSummary(
      session: session,
      userId: user.id.uuid,
      userType: user.userType,
    );

    return {
      'success': true,
      'response': formattedResponse['text'],
      'intent': intent,
      'response_type': formattedResponse['type'],
      'functions_called': executedTools,
      'functions_failed': failedTools,
      'usage_summary': usageSummary['found'] ? usageSummary['summary'] : null,
      'metadata': {
        ...formattedResponse['metadata'],
        'total_tools': toolCalls.length,
        'successful_tools': executedTools.length,
        'failed_tools': failedTools.length,
      },
    };
  }

  /// Track AI message usage
  Future<void> _trackAIMessageUsage({
    required Session session,
    required User user,
    required Conversation conversation,
    required Map<String, dynamic> aiUsage,
    required int toolCallsCount,
    required double responseTimeMs,
  }) async {
    try {
      final totalTokens = (aiUsage['total_tokens'] as num?)?.toInt() ?? 0;
      final inputTokens = (aiUsage['prompt_tokens'] as num?)?.toInt() ?? 0;
      final outputTokens = (aiUsage['completion_tokens'] as num?)?.toInt() ?? 0;

      await usageEndpoint.trackAIMessage(
        session: session,
        userId: user.id.uuid,
        userType: user.userType,
        conversationId: conversation.id.uuid,
        totalTokens: totalTokens,
        inputTokens: inputTokens,
        outputTokens: outputTokens,
        toolCallsCount: toolCallsCount,
        responseTime: responseTimeMs / 1000, // Convert to seconds
      );

      Log.info(
          '📊 Tracked AI message: $totalTokens tokens, $toolCallsCount tool calls');
    } catch (e) {
      Log.info('⚠️ Error tracking AI message: $e');
    }
  }

  /// Get usage summary for user
  Future<Map<String, dynamic>> _getUserUsageSummary({
    required Session session,
    required String userId,
    required UserType userType,
  }) async {
    try {
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);

      final tracker = await DailyUsageTracker.db.findFirstRow(
        session,
        where: (t) =>
            t.userId.equals(UuidValue.fromString(userId)) &
            t.date.equals(today),
      );

      if (tracker == null) {
        return {
          'found': false,
          'message': 'No usage data for today',
        };
      }

      final summary = {
        'date': tracker.date.toIso8601String(),
        'reset_at': tracker.resetAt.toIso8601String(),
        'tool_calls': {
          'used': tracker.toolCallsCount,
          'limit': tracker.toolCallsLimit,
          'remaining': tracker.toolCallsLimit - tracker.toolCallsCount,
          'percentage':
              ((tracker.toolCallsCount / tracker.toolCallsLimit) * 100).toInt(),
        },
        'ai_messages': {
          'used': tracker.aiMessagesCount,
          'limit': tracker.aiMessagesLimit,
          'remaining': tracker.aiMessagesLimit - tracker.aiMessagesCount,
          'percentage':
              ((tracker.aiMessagesCount / tracker.aiMessagesLimit) * 100)
                  .toInt(),
        },
      };

      if (userType == UserType.vendor) {
        summary['grace_period'] = {
          'active': tracker.isInGracePeriod,
          'used': tracker.gracePeriodUsed,
          'limit': tracker.gracePeriodLimit,
          'remaining': tracker.gracePeriodLimit - tracker.gracePeriodUsed,
        };

        summary['subscription_tier'] =
            tracker.subscriptionTier?.name ?? 'unknown';
      }

      return {
        'found': true,
        'summary': summary,
      };
    } catch (e) {
      Log.info('⚠️ Error getting usage summary: $e');
      return {
        'found': false,
        'error': e.toString(),
      };
    }
  }

  /// Check if message is likely to trigger tool call
  bool _isToolCallLikely(String message) {
    final lower = message.toLowerCase();

    final indicators = [
      'create',
      'add',
      'update',
      'delete',
      'remove',
      'buy',
      'purchase',
      'order',
      'checkout',
      'list',
      'show',
      'display',
      'get',
      'find',
      'search',
      'track',
      'cancel',
      'view my',
      'how many',
      'what are',
      'which',
    ];

    return indicators.any((indicator) => lower.contains(indicator));
  }

  /// Generate manual summary when AI fails
  String _generateToolSummary(
    List<String> executedTools,
    List<Map<String, dynamic>> failedTools,
  ) {
    final buffer = StringBuffer();

    if (executedTools.isNotEmpty) {
      buffer.writeln('✅ Successfully completed:');
      for (var tool in executedTools) {
        buffer.writeln('  • ${_humanizeToolName(tool)}');
      }
    }

    if (failedTools.isNotEmpty) {
      buffer.writeln('\n⚠️ Some actions could not be completed:');
      for (var failure in failedTools) {
        buffer.writeln('  • ${_humanizeToolName(failure['tool'])}');
      }
    }

    return buffer.toString();
  }

  /// Convert tool name to human-readable format
  String _humanizeToolName(String toolName) {
    return toolName
        .replaceAll('_', ' ')
        .split(' ')
        .map((word) => word[0].toUpperCase() + word.substring(1))
        .join(' ');
  }

  /// Build execution context for tools
  ToolExecutionContext _buildContext(
    Session session,
    User user,
    Conversation conversation,
    PlatformType platform,
  ) {
    return ToolExecutionContext(
      session: session,
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
        context['products_remaining'] =
            vendor.productLimit - vendor.currentProductCount;
        context['ai_descriptions_used'] = vendor.aiDescriptionsUsed;
        context['ai_descriptions_limit'] = vendor.aiDescriptionsLimit;
      }
    } else if (user.userType == UserType.customer) {
      final customer = await CustomerProfile.db.findFirstRow(
        session,
        where: (t) => t.userId.equals(user.id),
      );

      if (customer != null) {
        context['total_orders'] = customer.totalOrders;
        context['total_spent'] = customer.totalSpent;
        // context['loyalty_points'] = customer.loyaltyPoints;
      }

      // Get usage pattern
      final pattern = await CustomerUsagePattern.db.findFirstRow(
        session,
        where: (t) => t.userId.equals(user.id),
      );

      if (pattern != null) {
        context['usage_class'] = pattern.usageClass.name;
        context['average_daily_messages'] =
            pattern.averageDailyMessages.toInt();
      }
    }

    return context;
  }

  /// Get tools available for user type
  List<ToolDefinition> _getToolsForUser(UserType userType) {
    if (userType == UserType.vendor) {
      // Vendors get both customer and vendor tools
      final customerTools = toolRegistry.getToolsForRole('customer');
      final vendorTools = toolRegistry.getToolsForRole('vendor');
      return [...customerTools, ...vendorTools];
    } else if (userType == UserType.customer) {
      return toolRegistry.getToolsForRole('customer');
    } else {
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

  /// Log security incident
  Future<void> _logSecurityIncident({
    required Session session,
    required User user,
    required Conversation conversation,
    required String message,
    required String violationType,
    required String severity,
  }) async {
    try {
      // TODO: Create SecurityIncident table in your protocol
      // await SecurityIncident.db.insertRow(session, SecurityIncident(
      //   id: Uuid().v4obj(),
      //   userId: user.id,
      //   conversationId: conversation.id,
      //   message: message.length > 500 ? message.substring(0, 500) : message,
      //   violationType: violationType,
      //   severity: severity,
      //   platform: conversation.platform.name,
      //   createdAt: DateTime.now(),
      // ));

      Log.info('🔒 Security incident logged: $violationType ($severity)');
    } catch (e) {
      Log.info('⚠️ Failed to log security incident: $e');
    }
  }

  /// Get system health status
  Map<String, dynamic> getHealthStatus() {
    final registryHealth = toolRegistry.checkHealth();

    return {
      'provider': provider.providerName,
      'tools_registered': toolRegistry.getRegisteredToolCount(),
      'tools_by_role': toolRegistry.getToolCountByRole(),
      'registry_healthy': registryHealth['healthy'],
      'cache_manager': 'active',
      'security_filter': 'active',
      'usage_tracking': 'active',
      'status': registryHealth['healthy'] ? 'healthy' : 'degraded',
    };
  }

  /// Dispose resources
  Future<void> dispose() async {
    await provider.dispose();
    Log.info('🔌 Agent system disposed');
  }
}
