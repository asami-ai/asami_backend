// File: server/lib/src/endpoints/mobile_messaging_endpoint.dart

import 'dart:async';
import 'dart:convert';
import 'package:serverpod/serverpod.dart' hide Order, Message;
import '../generated/protocol.dart';
import '../services/mobile/gen_ui_builder.dart';
import '../services/mobile/mobile_auth_service.dart';
import '../services/ai_services/core/agent_system.dart';
import '../services/dependency_injection.dart';

/// Mobile messaging endpoint with GenUI and streaming support
class MobileMessagingEndpoint extends Endpoint {
  
  /// Send message from mobile app (with streaming support)
  Stream<GenUIResponse> sendMessage(
    Session session,
    MobileMessageRequest request,
  ) async* {
    try {
      // Validate mobile session
      final authService = MobileAuthService(session);
      final mobileSession = await authService.validateToken(request.accessToken);
      
      if (mobileSession == null) {
        yield GenUIResponse(
          success: false,
          error: 'Invalid or expired session',
          requiresAuth: true,
        );
        return;
      }

      // Get user and conversation
      final user = await User.db.findById(session, mobileSession.userId);
      if (user == null) {
        yield GenUIResponse(
          success: false,
          error: 'User not found',
        );
        return;
      }

      final conversation = await _getOrCreateConversation(
        session,
        user: user,
        deviceId: request.deviceId,
      );

      // Create incoming message record
      final messageId = Uuid().v4obj();
      final genUIMessage = GenUIMessage(
        id: messageId,
        conversationId: conversation.id,
        isFromUser: true,
        messageType: GenUIMessageType.text_only,
        textContent: request.message,
        sourcePlatform: PlatformType.mobile,
        processingStatus: MessageProcessingStatus.pending,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await GenUIMessage.db.insertRow(session, genUIMessage);

      // Send initial "processing" response
      yield GenUIResponse(
        success: true,
        messageId: messageId.uuid,
        status: 'processing',
        isStreaming: true,
      );

      // Process with AI (with streaming)
      final agentSystem = getIt<AgentSystem>();
      
      // Check if we should use custom AI or agent system
      if (request.useCustomAI == true) {
        // Use custom AI bypass
        yield* _processWithCustomAI(
          session: session,
          user: user,
          conversation: conversation,
          message: request.message,
          messageId: messageId,
        );
      } else {
        // Use full agent system with tools
        yield* _processWithAgentSystem(
          session: session,
          user: user,
          conversation: conversation,
          message: request.message,
          messageId: messageId,
          agentSystem: agentSystem,
        );
      }

    } catch (e, stackTrace) {
      session.log('Mobile messaging error: $e', stackTrace: stackTrace);
      yield GenUIResponse(
        success: false,
        error: e.toString(),
      );
    }
  }

  /// Process with full agent system (streaming)
  Stream<GenUIResponse> _processWithAgentSystem({
    required Session session,
    required User user,
    required Conversation conversation,
    required String message,
    required UuidValue messageId,
    required AgentSystem agentSystem,
  }) async* {
    // Convert user message to old Message format for compatibility
    final legacyMessage = Message(
      conversationId: conversation.id,
      platform: PlatformType.mobile,
      messageType: MessageType.text,
      content: message,
      isFromUser: true,
      createdAt: DateTime.now(),
    );

    // Process through agent system
    final result = await agentSystem.processMessage(
      session: session,
      user: user,
      conversation: conversation,
      message: legacyMessage,
      platform: PlatformType.mobile,
    );

    // Build GenUI response from agent result
    final genUIBuilder = GenUIBuilder();
    final uiComponents = await genUIBuilder.buildFromAgentResponse(
      session: session,
      agentResponse: result,
      userType: user.userType,
    );

    // Update message with response
    final genUIMessage = await GenUIMessage.db.findById(session, messageId);
    if (genUIMessage != null) {
      genUIMessage.textContent = result['response'];
      genUIMessage.markdownContent = result['response']; // Can be enhanced
      genUIMessage.messageType = uiComponents.isEmpty 
          ? GenUIMessageType.text_only 
          : GenUIMessageType.text_with_ui;
      genUIMessage.uiComponents = jsonEncode(uiComponents);
      genUIMessage.aiIntent = result['intent'];
      genUIMessage.toolsCalled = result['functions_called'] != null 
          ? List<String>.from(result['functions_called'])
          : null;
      genUIMessage.processingStatus = MessageProcessingStatus.completed;
      genUIMessage.updatedAt = DateTime.now();
      
      await GenUIMessage.db.updateRow(session, genUIMessage);
    }

    // Send final response
    yield GenUIResponse(
      success: true,
      messageId: messageId.uuid,
      status: 'completed',
      messageType: uiComponents.isEmpty ? 'text_only' : 'text_with_ui',
      textContent: result['response'],
      markdownContent: result['response'],
      uiComponents: uiComponents,
      intent: result['intent'],
      metadata: {
        'functions_called': result['functions_called'] ?? [],
        'processing_time_ms': result['metadata']?['processing_time_ms'],
      },
    );
  }

  /// Process with custom AI (bypassing agent system)
  Stream<GenUIResponse> _processWithCustomAI({
    required Session session,
    required User user,
    required Conversation conversation,
    required String message,
    required UuidValue messageId,
  }) async* {
    // This allows direct AI integration without agent system overhead
    // Useful for simple queries or custom AI implementations
    
    final provider = getIt<AIProvider>();
    
    // Build simple request
    final request = AIRequest(
      systemPrompt: _buildSimpleSystemPrompt(user.userType),
      messages: [
        AIMessage(role: 'user', content: message),
      ],
      temperature: 0.7,
      maxTokens: 2000,
    );

    // Get AI response
    final aiResponse = await provider.chat(request);
    
    if (!aiResponse.success) {
      yield GenUIResponse(
        success: false,
        error: aiResponse.error,
      );
      return;
    }

    // Update message
    final genUIMessage = await GenUIMessage.db.findById(session, messageId);
    if (genUIMessage != null) {
      genUIMessage.textContent = aiResponse.text;
      genUIMessage.markdownContent = aiResponse.text;
      genUIMessage.messageType = GenUIMessageType.text_only;
      genUIMessage.processingStatus = MessageProcessingStatus.completed;
      genUIMessage.updatedAt = DateTime.now();
      
      await GenUIMessage.db.updateRow(session, genUIMessage);
    }

    // Send response
    yield GenUIResponse(
      success: true,
      messageId: messageId.uuid,
      status: 'completed',
      messageType: 'text_only',
      textContent: aiResponse.text,
      markdownContent: aiResponse.text,
    );
  }

  /// Get conversation history for mobile
  Future<List<GenUIMessage>> getConversationHistory(
    Session session,
    String accessToken, {
    int limit = 50,
    String? before,
  }) async {
    final authService = MobileAuthService(session);
    final mobileSession = await authService.validateToken(accessToken);
    
    if (mobileSession == null) {
      throw Exception('Invalid session');
    }

    final conversation = await Conversation.db.findFirstRow(
      session,
      where: (t) => 
        t.userId.equals(mobileSession.userId) & 
        t.platform.equals(PlatformType.mobile),
    );

    if (conversation == null) {
      return [];
    }

    WhereExpressionBuilder<GenUIMessageTable>? whereClause;
    whereClause = (t) => t.conversationId.equals(conversation.id);

    if (before != null) {
      final beforeMessage = await GenUIMessage.db.findById(
        session,
        UuidValue.fromString(before),
      );
      if (beforeMessage != null) {
        whereClause = (t) => 
          t.conversationId.equals(conversation.id) & 
          t.createdAt.isBefore(beforeMessage.createdAt);
      }
    }

    return await GenUIMessage.db.find(
      session,
      where: whereClause,
      orderBy: (t) => t.createdAt,
      orderDescending: true,
      limit: limit,
    );
  }

  /// Get or create mobile conversation
  Future<Conversation> _getOrCreateConversation(
    Session session, {
    required User user,
    required String deviceId,
  }) async {
    var conversation = await Conversation.db.findFirstRow(
      session,
      where: (t) => 
        t.userId.equals(user.id) & 
        t.platform.equals(PlatformType.mobile) &
        t.platformUserId.equals(deviceId),
    );

    if (conversation != null) return conversation;

    conversation = Conversation(
      userId: user.id,
      platform: PlatformType.mobile,
      platformUserId: deviceId,
      userType: user.userType,
      status: ConversationStatus.active,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    return await Conversation.db.insertRow(session, conversation);
  }

  /// Build simple system prompt for custom AI
  String _buildSimpleSystemPrompt(UserType userType) {
    if (userType == UserType.vendor) {
      return '''
You are Asami, a helpful business assistant for vendors.

Help vendors manage their products, orders, and analytics.
Be concise and professional.
''';
    }

    return '''
You are Asami, a helpful shopping assistant.

Help customers find products, manage their cart, and track orders.
Be friendly and concise.
''';
  }
}

/// Mobile message request
class MobileMessageRequest {
  final String accessToken;
  final String deviceId;
  final String message;
  final bool? useCustomAI;

  MobileMessageRequest({
    required this.accessToken,
    required this.deviceId,
    required this.message,
    this.useCustomAI,
  });

  factory MobileMessageRequest.fromJson(Map<String, dynamic> json) {
    return MobileMessageRequest(
      accessToken: json['access_token'],
      deviceId: json['device_id'],
      message: json['message'],
      useCustomAI: json['use_custom_ai'],
    );
  }
}

/// GenUI Response (streamed)
class GenUIResponse {
  final bool success;
  final String? messageId;
  final String? status;
  final bool? isStreaming;
  final String? messageType;
  final String? textContent;
  final String? markdownContent;
  final List<Map<String, dynamic>>? uiComponents;
  final String? intent;
  final String? error;
  final bool? requiresAuth;
  final Map<String, dynamic>? metadata;

  GenUIResponse({
    required this.success,
    this.messageId,
    this.status,
    this.isStreaming,
    this.messageType,
    this.textContent,
    this.markdownContent,
    this.uiComponents,
    this.intent,
    this.error,
    this.requiresAuth,
    this.metadata,
  });

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      if (messageId != null) 'message_id': messageId,
      if (status != null) 'status': status,
      if (isStreaming != null) 'is_streaming': isStreaming,
      if (messageType != null) 'message_type': messageType,
      if (textContent != null) 'text_content': textContent,
      if (markdownContent != null) 'markdown_content': markdownContent,
      if (uiComponents != null) 'ui_components': uiComponents,
      if (intent != null) 'intent': intent,
      if (error != null) 'error': error,
      if (requiresAuth != null) 'requires_auth': requiresAuth,
      if (metadata != null) 'metadata': metadata,
    };
  }
}