// File: server/lib/src/services/messaging/telegram/telegram_callback_handler.dart

import 'package:asami_server/utils/logger/asami_logger.dart';
import 'package:serverpod/serverpod.dart' hide Order, Message;
import 'package:televerse/telegram.dart' hide User;
import '../../../endpoints/auth_endpoint.dart';
import '../../../endpoints/bot_endpoint.dart';
import '../../../generated/protocol.dart';
import '../../auth/auth_state_manager.dart';
import 'telegram_service.dart';

class TelegramCallbackHandler {
  final TelegramService telegramService;
  final Session session;
  final AuthStateManager authStateManager;

  TelegramCallbackHandler({
    required this.telegramService,
    required this.session,
    required this.authStateManager,
  });

  /// ✅ UPDATED: Process callback queries through bot endpoint
  Future<void> processCallbackQuery(CallbackQuery callbackQuery) async {
    final chatId = callbackQuery.from.id.toString();
    final data = callbackQuery.data ?? '';
    try {
      Log.info('📱 Processing callback: $data from user $chatId');

      // Answer callback query immediately to remove loading state
      await telegramService.answerCallbackQuery(
        callbackQueryId: callbackQuery.id,
        text: '⏳ Processing...',
      );
      // If in auth flow, handle auth-specific callbacks
      if (data.startsWith('auth_')) {
        await _handleAuthCallback(callbackQuery, chatId, data);
      }

      // ==================== COMMAND ROUTING ====================
      // ✅ NEW: Route all callbacks starting with / through bot endpoint
      else if (data.startsWith('/')) {
        Log.info('🎯 Routing callback as command: $data');

        // Process as regular command through bot endpoint
        final botEndpoint = BotEndpoint();
        final response = await botEndpoint.processMessage(
          session,
          platformUserId: chatId,
          platform: PlatformType.telegram,
          messageContent: data, // Send as command
          messageType: MessageType.text,
          platformMessageId: callbackQuery.message?.messageId.toString(),
        );

        if (response['success'] == true) {
          Log.success('✅ Command callback processed successfully');
        } else {
          Log.error(
              '⚠️ Command callback processing failed: ${response['error']}');

          // Send error message
          await telegramService.sendTextMessage(
            chatId: int.parse(chatId),
            text: '❌ An error occurred. Please try again.',
          );
        }
        return;
      }

      // ==================== NON-COMMAND CALLBACKS ====================
      // Handle other callback types (if any)
      Log.info('ℹ️ Non-command callback: $data');

      // Could be used for pagination, confirmations, etc.
      await telegramService.answerCallbackQuery(
        callbackQueryId: callbackQuery.id,
        text: 'Feature not implemented yet',
        showAlert: false,
      );
    } catch (e, stackTrace) {
      Log.error('❌ Error processing callback query: $e',
          stackTrace: stackTrace);
      session.log('Callback error: $e', stackTrace: stackTrace);
      await _sendMessage(chatId, '❌ Something went wrong. Please try again.');
      // Answer with error
      try {
        await telegramService.answerCallbackQuery(
          callbackQueryId: callbackQuery.id,
          text: '❌ An error occurred',
          showAlert: false,
        );
      } catch (e, stackTrace) {
        session.log('Callback error: $e', stackTrace: stackTrace);
        await _sendMessage(chatId, '❌ Something went wrong. Please try again.');
      }
    }
  }
  // ==================== AUTHENTICATION CALLBACKS ====================

  Future<void> _handleAuthCallback(
    CallbackQuery query,
    String chatId,
    String data,
  ) async {
    // Check if user is already logged in and prevent button action
    final user = await User.db
        .findFirstRow(session, where: (t) => t.telegramId.equals(chatId));

    if (user != null && user.telegramAuthenticated) {
      await _sendMessage(chatId, '''
    Action can't be performed.
    if you're in a registration process, continue by providing required credentials, or
    Type /help for available commands.
    ''');
      return;
    }
    // Check if user already has a temp auth conversation
    final tempConversation = await authStateManager.getTempAuthConversation(
      session,
      platform: PlatformType.telegram,
      platformUserId: chatId,
    );

    if (data == 'auth_customer') {
      await _handleShopCustomerCallback(chatId, tempConversation);
    } else if (data == 'auth_vendor') {
      await _handleSellVendorCallback(chatId, tempConversation);
    } else if (data == 'auth_login') {
      await _handleLoginCallback(chatId, tempConversation);
    } else if (data == 'auth_resend_code') {
      await _handleResendCodeCallback(chatId, tempConversation);
    }
  }

  Future<void> _handleShopCustomerCallback(
    String chatId,
    Conversation? tempConversation,
  ) async {
    // Create or update temp conversation for customer signup
    if (tempConversation == null) {
      tempConversation = await authStateManager.createTempAuthConversation(
        session,
        platform: PlatformType.telegram,
        platformUserId: chatId,
        initialState: AuthState.SIGNUP_AWAITING_EMAIL,
        userType: UserType.customer,
        initialData: {
          'selected_user_type': 'customer',
        },
      );
    } else {
      await authStateManager.updateState(
        session,
        conversation: tempConversation,
        newState: AuthState.SIGNUP_AWAITING_EMAIL,
        additionalData: {
          'selected_user_type': 'customer',
        },
      );
    }

    await _sendMessage(chatId, '''
🛍️ Perfect! Let's create your shopping account. 

📧 Please send me your email address to get started:
''');
  }

  Future<void> _handleSellVendorCallback(
    String chatId,
    Conversation? tempConversation,
  ) async {
    // Create or update temp conversation for vendor signup
    if (tempConversation == null) {
      tempConversation = await authStateManager.createTempAuthConversation(
        session,
        platform: PlatformType.telegram,
        platformUserId: chatId,
        initialState: AuthState.SIGNUP_AWAITING_EMAIL,
        userType: UserType.vendor,
        initialData: {
          'selected_user_type': 'vendor',
        },
      );
    } else {
      await authStateManager.updateState(
        session,
        conversation: tempConversation,
        newState: AuthState.SIGNUP_AWAITING_EMAIL,
        additionalData: {
          'selected_user_type': 'vendor',
        },
      );
    }

    await _sendMessage(chatId, '''
🏪 Great! Let's set up your vendor account.

Your email will be used to:
• Sync your account across platforms
• Send order notifications  
• Manage your business

📧 Please send me your email address:
''');
  }

  Future<void> _handleLoginCallback(
    String chatId,
    Conversation? tempConversation,
  ) async {
    final user = await User.db
        .findFirstRow(session, where: (t) => t.telegramId.equals(chatId));
    if (user != null && user.email != null) {
      await AuthEndpoint().initiateLogin(
        session,
        email: user.email ?? '',
      );
      // Create or update temp conversation for login
      if (tempConversation == null) {
        tempConversation = await authStateManager.createTempAuthConversation(
          session,
          platform: PlatformType.telegram,
          platformUserId: chatId,
          initialState: AuthState.LOGIN_AWAITING_CODE,
          userType: user.userType,
          initialData: {
            'is_login': true,
            'auth_email': user.email,
            'auth_code_sent_at': DateTime.now().toIso8601String(),
            'auth_attempts': 0,
          },
        );
      } else {
        await authStateManager.updateState(
          session,
          conversation: tempConversation,
          newState: AuthState.LOGIN_AWAITING_CODE,
          additionalData: {
            'is_login': true,
            'auth_email': user.email,
            'auth_code_sent_at': DateTime.now().toIso8601String(),
            'auth_attempts': 0,
          },
        );
      }

      await _sendMessage(chatId, '''
 🔐 I've sent a 6-digit verification code to ${user.email}

Please reply with the code (expires in 10 minutes)

Reply "resend" for a new code.
''');
    } else {
      if (tempConversation == null) {
        tempConversation = await authStateManager.createTempAuthConversation(
          session,
          platform: PlatformType.telegram,
          platformUserId: chatId,
          initialState: AuthState.LOGIN_AWAITING_EMAIL,
          userType: UserType.customer,
          initialData: {'is_login': true},
        );
      } else {
        await authStateManager.updateState(
          session,
          conversation: tempConversation,
          newState: AuthState.LOGIN_AWAITING_EMAIL,
          additionalData: {'is_login': true},
        );
      }

      await _sendMessage(chatId, '''
📱 Welcome back!

📧 Please send me your email address to log in:
''');
    }
  }

  Future<void> _handleResendCodeCallback(
    String chatId,
    Conversation? tempConversation,
  ) async {
    if (tempConversation == null) {
      await _sendMessage(chatId, '❌ No active verification session.');
      return;
    }

    final sessionData = authStateManager.getSessionData(tempConversation);
    final email = sessionData['auth_email'] as String?;

    if (email == null) {
      await _sendMessage(chatId, '❌ Email not found. Please start over.');
      return;
    }

    // Import AuthEndpoint dynamically to avoid circular dependencies
    // The bot_endpoint will handle the actual resend
    await _sendMessage(chatId, '''
🔄 Processing resend request for $email...

Please wait a moment.
''');
  }

  Future<void> _sendMessage(String chatId, String text) async {
    await telegramService.sendTextMessage(
      chatId: int.parse(chatId),
      text: text,
      parseMode: ParseMode.markdown,
    );
  }
}
