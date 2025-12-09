import 'package:asami_server/src/services/dependency_injection.dart' show getIt;
import 'package:asami_server/utils/logger/asami_logger.dart';
import 'package:serverpod/serverpod.dart' hide Order;
import '../generated/protocol.dart';
import '../services/ai_services/core/agent_system.dart';
import '../services/messaging/messaging_service_factory.dart';
import '../services/messaging/whatsapp/whatsapp_message_formatter.dart';

class BotEndpoint extends Endpoint {
  /// Process incoming message from any platform
  Future<Map<String, dynamic>> processMessage(
    Session session, {
    required String platformUserId,
    required PlatformType platform,
    required String messageContent,
    MessageType messageType = MessageType.text,
    String? mediaUrl,
    String? platformMessageId,
  }) async {
    try {
      // Verify platform is registered
      if (!MessagingServiceFactory.isRegistered(platform)) {
        return {
          'success': false,
          'error': 'Platform $platform not registered',
        };
      }

      // Get or create user
      final user = await _getOrCreateUser(
        session,
        platformUserId,
        platform,
      );

      if (user == null) {
        return {
          'success': false,
          'error': 'Could not identify user',
        };
      }

      // Get or create conversation
      final conversation = await _getOrCreateConversation(
        session,
        user.id,
        platform,
        platformUserId,
      );

      // Save incoming message
      final message = await _saveMessage(
        session,
        conversationId: conversation.id,
        content: messageContent,
        messageType: messageType,
        platform: platform,
        platformMessageId: platformMessageId,
        mediaUrl: mediaUrl,
        isFromUser: true,
      );

      // Update conversation stats
      conversation.messageCount++;
      conversation.lastMessageAt = DateTime.now();
      conversation.status = ConversationStatus.waiting_bot;
      await Conversation.db.updateRow(session, conversation);
      final messagingService = MessagingServiceFactory.getService(platform);
      await messagingService.markAsRead(messageId: platformMessageId ?? '');
      await messagingService.sendTypingIndicator(recipient: platformMessageId ?? '');

      // ========== PROCESS WITH AI AGENT ==========
      final agentSystem = getIt<AgentSystem>();

      final aiResponse = await agentSystem.processMessage(
        session: session,
        user: user,
        conversation: conversation,
        message: message,
        platform: platform,
      );

      // Send response using the factory
      if (aiResponse['success'] == true && aiResponse['response'] != null) {
        Log.info(aiResponse['response']);

        final sendResult = await messagingService.sendText(
          recipient: platformUserId,
          text: aiResponse['response'],
        );

        if (sendResult.isSuccess) {
          // Save bot response
          await _saveMessage(
            session,
            conversationId: conversation.id,
            content: aiResponse['response'],
            messageType: MessageType.text,
            platform: platform,
            platformMessageId: sendResult.messageId,
            isFromUser: false,
            isFromBot: true,
            aiIntent: aiResponse['intent'],
            aiEntities: aiResponse['entities'],
            functionCalled: aiResponse['function_called'],
            functionResult: aiResponse['function_result'],
          );

          conversation.botResponseCount++;
          conversation.lastIntent = aiResponse['intent'];
          conversation.status = ConversationStatus.waiting_user;
          await Conversation.db.updateRow(session, conversation);

          return {
            'success': true,
            'userId': user.id,
            'conversationId': conversation.id,
            'response': aiResponse['response'],
            'intent': aiResponse['intent'],
            'messageSent': true,
          };
        } else {
          return {
            'success': false,
            'error': 'Failed to send message: ${sendResult.errorMessage}',
          };
        }
      }

      return {
        'success': true,
        'userId': user.id,
        'conversationId': conversation.id,
        'response': null,
        'intent': aiResponse['intent'],
      };
    } catch (e, stackTrace) {
      session.log('Process message error: $e', stackTrace: stackTrace);
      return {
        'success': false,
        'error': e.toString(),
      };
    }
  }

  /// Send formatted message (for AI agent to use)
  Future<bool> sendFormattedMessage(
    Session session, {
    required String platformUserId,
    required PlatformType platform,
    required String message,
    Map<String, dynamic>? interactiveData,
  }) async {
    try {
      if (!MessagingServiceFactory.isRegistered(platform)) {
        session.log('Platform $platform not registered');
        return false;
      }

      final messagingService = MessagingServiceFactory.getService(platform);

      if (interactiveData != null) {
        // Parse interactive data and send appropriately
        // This is a simplified version - expand based on your needs
        final result = await messagingService.sendText(
          recipient: platformUserId,
          text: message,
        );
        return result.isSuccess;
      } else {
        final result = await messagingService.sendText(
          recipient: platformUserId,
          text: message,
        );
        return result.isSuccess;
      }
    } catch (e) {
      session.log('Send formatted message error: $e');
      return false;
    }
  }

  /// Send product list
  Future<bool> sendProductList(
    Session session, {
    required String platformUserId,
    required PlatformType platform,
    required List<Product> products,
  }) async {
    try {
      if (!MessagingServiceFactory.isRegistered(platform)) {
        return false;
      }

      final messagingService = MessagingServiceFactory.getService(platform);

      // Format based on platform
      final formattedMessage = platform == PlatformType.whatsapp
          ? WhatsAppMessageFormatter.formatProductList(products)
          : _formatProductListForTelegram(products);

      final result = await messagingService.sendText(
        recipient: platformUserId,
        text: formattedMessage,
        parseMode: platform == PlatformType.telegram ? 'markdown' : null,
      );

      return result.isSuccess;
    } catch (e) {
      session.log('Send product list error: $e');
      return false;
    }
  }

  /// Send order confirmation
  Future<bool> sendOrderConfirmation(
    Session session, {
    required String platformUserId,
    required PlatformType platform,
    required Order order,
    required List<OrderItem> items,
  }) async {
    try {
      if (!MessagingServiceFactory.isRegistered(platform)) {
        return false;
      }

      final messagingService = MessagingServiceFactory.getService(platform);

      final formattedMessage = WhatsAppMessageFormatter.formatOrderConfirmation(
        order,
        items,
      );

      final result = await messagingService.sendText(
        recipient: platformUserId,
        text: formattedMessage,
        parseMode: platform == PlatformType.telegram ? 'markdown' : null,
      );

      return result.isSuccess;
    } catch (e) {
      session.log('Send order confirmation error: $e');
      return false;
    }
  }

  // ==================== PRIVATE HELPER METHODS ====================

  Future<User?> _getOrCreateUser(
    Session session,
    String platformUserId,
    PlatformType platform,
  ) async {
    User? user;

    if (platform == PlatformType.whatsapp) {
      user = await User.db.findFirstRow(
        session,
        where: (t) => t.whatsappId.equals(platformUserId),
      );
    } else if (platform == PlatformType.telegram) {
      user = await User.db.findFirstRow(
        session,
        where: (t) => t.telegramId.equals(platformUserId),
      );
    }

    if (user != null) {
      user.lastActiveAt = DateTime.now();
      await User.db.updateRow(session, user);
      return user;
    }

    // Create new user
    final now = DateTime.now();
    user = User(
      userType: UserType.customer,
      phoneNumber: platformUserId,
      countryCode: '+0',
      whatsappId: platform == PlatformType.whatsapp ? platformUserId : null,
      telegramId: platform == PlatformType.telegram ? platformUserId : null,
      status: UserStatus.active,
      isPhoneVerified: true,
      createdAt: now,
      updatedAt: now,
      lastActiveAt: now,
    );

    final created = await User.db.insertRow(session, user);

    // Create customer profile
    final profile = CustomerProfile(
      userId: created.id!,
      createdAt: now,
      updatedAt: now,
    );
    await CustomerProfile.db.insertRow(session, profile);

    return created;
  }

  Future<Conversation> _getOrCreateConversation(
    Session session,
    UuidValue userId,
    PlatformType platform,
    String platformUserId,
  ) async {
    var conversation = await Conversation.db.findFirstRow(
      session,
      where: (t) =>
          t.userId.equals(userId) &
          t.platform.equals(platform) &
          t.status.notEquals(ConversationStatus.archived),
    );

    if (conversation != null) return conversation;

    final user = await User.db.findById(session, userId);

    conversation = Conversation(
      userId: userId,
      platform: platform,
      platformUserId: platformUserId,
      userType: user?.userType ?? UserType.customer,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    return await Conversation.db.insertRow(session, conversation);
  }

  Future<Message> _saveMessage(
    Session session, {
    required UuidValue conversationId,
    required String content,
    required MessageType messageType,
    required PlatformType platform,
    String? platformMessageId,
    String? mediaUrl,
    bool isFromUser = false,
    bool isFromBot = false,
    String? aiIntent,
    String? aiEntities,
    String? functionCalled,
    String? functionResult,
  }) async {
    final message = Message(
      conversationId: conversationId,
      platform: platform,
      platformMessageId: platformMessageId,
      messageType: messageType,
      content: content,
      mediaUrl: mediaUrl,
      isFromBot: isFromBot,
      isFromUser: isFromUser,
      aiIntent: aiIntent,
      aiEntities: aiEntities,
      functionCalled: functionCalled,
      functionResult: functionResult,
      isProcessedByAi: isFromUser,
      createdAt: DateTime.now(),
    );

    return await Message.db.insertRow(session, message);
  }

  Future<Map<String, dynamic>> _processWithAI(
    Session session, {
    required User user,
    required Conversation conversation,
    required Message message,
  }) async {
    try {
      // TODO: Implement actual AI processing
      // This is a placeholder implementation

      final content = message.content.toLowerCase();

      if (content.contains('search') || content.contains('find')) {
        return {
          'success': true,
          'intent': 'search_products',
          'response':
              'I\'ll help you search for products. What are you looking for?',
          'function_called': 'search_products',
        };
      } else if (content.contains('cart')) {
        return {
          'success': true,
          'intent': 'view_cart',
          'response': 'Let me show you your cart...',
          'function_called': 'view_cart',
        };
      } else {
        return {
          'success': true,
          'intent': 'greeting',
          'response': 'Hello! 👋 I\'m Asami. How can I help you today?',
        };
      }
    } catch (e, stackTrace) {
      session.log('AI processing error: $e', stackTrace: stackTrace);
      return {
        'success': false,
        'error': e.toString(),
        'response':
            'I apologize, but I encountered an issue. Please try again.',
        'intent': 'error',
      };
    }
  }

  String _formatProductListForTelegram(List<Product> products) {
    if (products.isEmpty) {
      return "I couldn't find any products. Try different keywords? 🔍";
    }

    final buffer = StringBuffer();
    buffer.writeln('🛍️ *Here are some products:*\n');

    for (var i = 0; i < products.length && i < 10; i++) {
      final product = products[i];
      buffer.writeln('${i + 1}. *${product.name}*');
      buffer.writeln(
          '💰 ${product.currency} ${product.basePrice.toStringAsFixed(2)}');
      if (product.quantity > 0) {
        buffer.writeln('📦 In Stock');
      }
      buffer.writeln('');
    }

    return buffer.toString();
  }
}
