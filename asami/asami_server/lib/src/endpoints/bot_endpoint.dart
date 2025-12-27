// File: server/lib/src/endpoints/bot_endpoint.dart

import 'dart:convert';
import 'dart:io';

import 'package:asami_server/src/services/auth/auth_state_manager.dart';
import 'package:asami_server/utils/logger/asami_logger.dart';
import 'package:serverpod/serverpod.dart' hide Order, Message;
import '../generated/protocol.dart';
import '../services/ai_services/core/agent_system.dart';
import '../services/dependency_injection.dart';
import '../services/messaging/messaging_service_factory.dart';
import '../services/messaging/messaging_service_interface.dart';
import '../services/messaging/whatsapp/whatsapp_message_formatter.dart';
import 'auth_endpoint.dart';

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
      Log.info(
          '📨 Processing message from $platformUserId on ${platform.name}');
      // SEND TYPING INDICATOR

      final messagingService = MessagingServiceFactory.getService(platform);
      await messagingService.markAsRead(messageId: platformMessageId ?? '');
      await messagingService.sendTypingIndicator(
          recipient: platformMessageId ?? '');

      // ========== STEP 1: CHECK FOR TEMP AUTH CONVERSATION ==========
      final authStateManager = getIt<AuthStateManager>();
      final tempConversation = await authStateManager.getTempAuthConversation(
        session,
        platform: platform,
        platformUserId: platformUserId,
      );

      // If temp conversation exists, route to auth flow handler
      if (tempConversation != null) {
        Log.info('🔐 User in authentication flow');
        return await _processAuthFlow(
          session,
          tempConversation,
          messageContent,
          platform,
          platformUserId,
        );
      }

      // ========== STEP 1: CHECK AUTHENTICATION ==========
      final authCheck = await AuthEndpoint().checkAuth(
        session,
        platform: platform,
        platformUserId: platformUserId,
      );

      User? user;
      Conversation? conversation;

      if (authCheck['authenticated'] == true) {
        // User is authenticated
        user = authCheck['user'] as User;
        Log.info('✅ User authenticated: ${user.email}');

        // IMPORTANT: Check if email is verified
        if (!user.emailVerified) {
          Log.info('📧 Email not verified, prompting for code');
          return await _handleUnverifiedUser(
            session,
            user,
            platform,
            platformUserId,
          );
        }
      } else if (authCheck['known_user'] == true) {
        // User exists on another platform, needs cross-platform auth
        Log.info('🔄 User already exists needs to sign in');
        return await _handleSigninDetected(
          session,
          platform,
          platformUserId,
          authCheck['user_email'],
        );
      } else {
        // New user - show welcome and auth options
        Log.info('👤 New user detected');
        return await _handleNewUser(session, platform, platformUserId);
      }

      // ========== STEP 2: GET OR CREATE CONVERSATION ==========
      conversation = await _getOrCreateConversation(
        session,
        user.id,
        platform,
        platformUserId,
      );

      // ========== STEP 3: SAVE INCOMING MESSAGE ==========
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

      // ========== STEP 4: UPDATE CONVERSATION STATS ==========
      conversation.messageCount++;
      conversation.lastMessageAt = DateTime.now();
      conversation.status = ConversationStatus.waiting_bot;
      await Conversation.db.updateRow(session, conversation);

      // ========== STEP 5: PROCESS WITH AI ==========
      final aiResponse = await _processWithAI(session,
          user: user,
          conversation: conversation,
          message: message,
          platform: platform);

      // ========== STEP 6: SEND RESPONSE ==========
      if (aiResponse['success'] == true && aiResponse['response'] != null) {
        Log.info('💬 Sending response: ${aiResponse['response']}');

        final messagingService = MessagingServiceFactory.getService(platform);

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
            'userId': user.id.uuid,
            'conversationId': conversation.id.uuid,
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
        'userId': user.id.uuid,
        'conversationId': conversation.id.uuid,
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

  // ==================== AUTH FLOW PROCESSOR ====================

  /// Process message when user is in authentication flow

  Future<Map<String, dynamic>> _processAuthFlow(
    Session session,
    Conversation tempConversation,
    String messageContent,
    PlatformType platform,
    String platformUserId,
  ) async {
    final authStateManager = getIt<AuthStateManager>();
    final currentState = authStateManager.getCurrentState(tempConversation);

    if (currentState == null) {
      return {
        'success': false,
        'response': 'Authentication state error. Please start over.',
      };
    }

    Log.info('📍 Auth state: ${currentState.name}');

    switch (currentState) {
      case AuthState.SIGNUP_AWAITING_CODE:
        return await _handleSignupCodeInput(
          session,
          tempConversation,
          messageContent,
          platform,
          platformUserId,
        );

      case AuthState.LOGIN_AWAITING_EMAIL || AuthState.SIGNUP_AWAITING_EMAIL:
        return await _handleLoginEmailInput(session, tempConversation,
            messageContent, platform, platformUserId, currentState);

      case AuthState.LOGIN_AWAITING_CODE:
        return await _handleLoginCodeInput(
          session,
          tempConversation,
          messageContent,
          platform,
          platformUserId,
        );

      case AuthState.CROSS_PLATFORM_AWAITING_CODE:
        return await _handleCrossPlatformCodeInput(
          session,
          tempConversation,
          messageContent,
          platform,
          platformUserId,
        );

      default:
        return {
          'success': false,
          'response': 'Unknown authentication state.',
        };
    }
  }

// ==================== UNVERIFIED USER HANDLER ====================

  /// Handle user who is registered but email not verified
  Future<Map<String, dynamic>> _handleUnverifiedUser(
    Session session,
    User user,
    PlatformType platform,
    String platformUserId,
  ) async {
    final authStateManager = getIt<AuthStateManager>();
    final messagingService = MessagingServiceFactory.getService(platform);

    // Create or get temp conversation
    var tempConversation = await authStateManager.getTempAuthConversation(
      session,
      platform: platform,
      platformUserId: platformUserId,
    );

    if (tempConversation == null) {
      // Create temp conversation
      tempConversation = await authStateManager.createTempAuthConversation(
        session,
        platform: platform,
        platformUserId: platformUserId,
        initialState: AuthState.SIGNUP_AWAITING_CODE,
        userType: user.userType,
        initialData: {
          'auth_email': user.email,
          'temp_user_id': user.id.uuid,
          'auth_code_sent_at': DateTime.now().toIso8601String(),
        },
      );

      // Send new verification code
      final authService = AuthEndpoint();
      await authService.resendCode(session, email: user.email!);
    }

    await messagingService.sendText(
      recipient: platformUserId,
      text: '''
📧 Welcome back!

I see you started registration but haven't verified your email yet.

I've sent a verification code to ${user.email}

Please reply with the 6-digit code (expires in 10 minutes)

Reply "resend" for a new code.
''',
    );

    return {
      'success': true,
      'response': 'Verification code sent',
      'requires_verification': true,
    };
  }

  // ==================== AUTHENTICATION HANDLERS ====================

  /// Handle signup verification code input
  Future<Map<String, dynamic>> _handleSignupCodeInput(
    Session session,
    Conversation tempConversation,
    String code,
    PlatformType platform,
    String platformUserId,
  ) async {
    final authStateManager = getIt<AuthStateManager>();
    final messagingService = MessagingServiceFactory.getService(platform);

    // Check for resend request
    if (code.toLowerCase() == 'resend') {
      final sessionData = authStateManager.getSessionData(tempConversation);
      final email = sessionData['auth_email'] as String;

      final result = await AuthEndpoint().resendCode(session, email: email);

      if (result['success']) {
        await authStateManager.updateState(
          session,
          conversation: tempConversation,
          newState: AuthState.SIGNUP_AWAITING_CODE,
          additionalData: {
            'auth_code_sent_at': DateTime.now().toIso8601String(),
            'auth_attempts': 0, // Reset attempts
          },
        );

        await messagingService.sendText(
          recipient: platformUserId,
          text: '🔄 New code sent to $email. Please check your inbox.',
        );
      } else {
        await messagingService.sendText(
          recipient: platformUserId,
          text: '❌ ${result['message']}',
        );
      }

      return {'success': true, 'response': null};
    }

    // Validate code format
    if (code.length != 6 || !RegExp(r'^\d{6}$').hasMatch(code)) {
      await messagingService.sendText(
        recipient: platformUserId,
        text:
            '❌ Please enter a valid 6-digit code.\n\nReply "resend" for a new code.',
      );
      return {'success': true, 'response': null};
    }

    // Check rate limiting
    if (authStateManager.shouldRateLimit(tempConversation)) {
      await messagingService.sendText(
        recipient: platformUserId,
        text: '🚫 Too many attempts. Please try again in 15 minutes.',
      );
      return {'success': true, 'response': null};
    }

    // Check if code expired
    if (authStateManager.isCodeExpired(tempConversation)) {
      await messagingService.sendText(
        recipient: platformUserId,
        text: '⏰ Code expired. Reply "resend" to get a new one.',
      );
      return {'success': true, 'response': null};
    }

    // Verify code
    final sessionData = authStateManager.getSessionData(tempConversation);
    final email = sessionData['auth_email'] as String;

    final result = await AuthEndpoint().verifySignupCode(
      session,
      email: email,
      code: code,
      platform: platform,
      platformUserId: platformUserId,
    );

    if (!result['success']) {
      await authStateManager.incrementAttempts(session, tempConversation);

      final attemptsRemaining = result['attempts_remaining'];
      await messagingService.sendText(
        recipient: platformUserId,
        text: '''
❌ Invalid code. ${attemptsRemaining != null ? '$attemptsRemaining attempts remaining.' : ''}

Reply "resend" to get a new code.
''',
      );
      return {'success': true, 'response': null};
    }

    // Success! Convert temp conversation to permanent
    final authenticatedUser = result['user'] as User;
    await authStateManager.completeAuthentication(
      session,
      tempConversation: tempConversation,
      authenticatedUser: authenticatedUser,
    );

    // Send welcome message
    final welcomeMessage = '''
🎉 Account created successfully!

Welcome to Asami, ${authenticatedUser.firstName ?? 'there'}!

${authenticatedUser.userType == UserType.vendor ? '''
🏪 Your vendor account is ready! You can now:
• Add products to your catalog
• Manage orders
• Track your sales

Type /help to see all vendor commands.
''' : '''
🛍️ You're all set to start shopping!

Browse products, add to cart, and checkout seamlessly.

Type /products to start shopping or /help for more options.
'''}
''';

    await messagingService.sendText(
      recipient: platformUserId,
      text: welcomeMessage,
    );

    return {
      'success': true,
      'response': welcomeMessage,
      'intent': 'authentication_complete',
      'user': authenticatedUser,
    };
  }

  /// Handle login email input
  Future<Map<String, dynamic>> _handleLoginEmailInput(
      Session session,
      Conversation tempConversation,
      String email,
      PlatformType platform,
      String platformUserId,
      AuthState currentState) async {
    final authStateManager = getIt<AuthStateManager>();
    final messagingService = MessagingServiceFactory.getService(platform);

    // Validate email format
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(email.trim())) {
      await messagingService.sendText(
        recipient: platformUserId,
        text: '''
❌ That doesn't look like a valid email address.

Please use the format: name@example.com
''',
      );
      return {'success': true, 'response': null};
    }

    final cleanEmail = email.trim();

    // Initiate login (sends verification code)
    final result = currentState == AuthState.LOGIN_AWAITING_EMAIL
        ? await AuthEndpoint().initiateLogin(
            session,
            email: cleanEmail,
          )
        : await AuthEndpoint().initiateSignup(
            session,
            userType: tempConversation.userType,
            platform: tempConversation.platform,
            platformUserId: tempConversation.platformUserId,
            email: cleanEmail,
          );

    if (!result['success']) {
      if (result['error'] == 'user_not_found') {
        await messagingService.sendText(
          recipient: platformUserId,
          text: '''
📧 No account found with this email.

Would you like to create a new account? Type /start to begin.
''',
        );
      } else if (result['error'] == 'email_send_failed') {
        await AuthEndpoint().deleteTempUser(session, email: email);
        await messagingService.sendText(
          recipient: platformUserId,
          text: '❌ ${result['message']}\n\nPlease try again.',
        );
      } else {
        await messagingService.sendText(
          recipient: platformUserId,
          text: '❌ ${result['message']}\n\nPlease try again.',
        );
      }
      return {'success': true, 'response': null};
    }

    // Update temp conversation state
    await authStateManager.updateState(
      session,
      conversation: tempConversation,
      newState: currentState == AuthState.LOGIN_AWAITING_EMAIL
          ? AuthState.LOGIN_AWAITING_CODE
          : AuthState.SIGNUP_AWAITING_CODE,
      additionalData: {
        'auth_email': cleanEmail,
        'auth_code_sent_at': DateTime.now().toIso8601String(),
        'auth_attempts': 0,
      },
    );

    await messagingService.sendText(
      recipient: platformUserId,
      text: '''
🔐 I've sent a 6-digit verification code to $cleanEmail

Please reply with the code (expires in 10 minutes)

Reply "resend" for a new code.
''',
    );

    return {
      'success': true,
      'response': 'Verification code sent',
      'intent': 'email_provided',
    };
  }

  /// Handle login verification code input
  Future<Map<String, dynamic>> _handleLoginCodeInput(
    Session session,
    Conversation tempConversation,
    String code,
    PlatformType platform,
    String platformUserId,
  ) async {
    final authStateManager = getIt<AuthStateManager>();
    final messagingService = MessagingServiceFactory.getService(platform);

    // Check for resend request
    if (code.toLowerCase() == 'resend') {
      final sessionData = authStateManager.getSessionData(tempConversation);
      final email = sessionData['auth_email'] as String;

      final result = await AuthEndpoint().resendCode(session, email: email);

      if (result['success']) {
        await authStateManager.updateState(
          session,
          conversation: tempConversation,
          newState: AuthState.LOGIN_AWAITING_CODE,
          additionalData: {
            'auth_code_sent_at': DateTime.now().toIso8601String(),
            'auth_attempts': 0,
          },
        );

        await messagingService.sendText(
          recipient: platformUserId,
          text: '🔄 New code sent to $email. Please check your inbox.',
        );
      } else {
        await messagingService.sendText(
          recipient: platformUserId,
          text: '❌ ${result['message']}',
        );
      }

      return {'success': true, 'response': null};
    }

    // Validate code format
    if (code.length != 6 || !RegExp(r'^\d{6}$').hasMatch(code)) {
      await messagingService.sendText(
        recipient: platformUserId,
        text:
            '❌ Please enter a valid 6-digit code.\n\nReply "resend" for a new code.',
      );
      return {'success': true, 'response': null};
    }

    // Check rate limiting
    if (authStateManager.shouldRateLimit(tempConversation)) {
      await messagingService.sendText(
        recipient: platformUserId,
        text: '🚫 Too many attempts. Please try again in 15 minutes.',
      );
      return {'success': true, 'response': null};
    }

    // Check if code expired
    if (authStateManager.isCodeExpired(tempConversation)) {
      await messagingService.sendText(
        recipient: platformUserId,
        text: '⏰ Code expired. Reply "resend" to get a new one.',
      );
      return {'success': true, 'response': null};
    }

    // Verify code
    final sessionData = authStateManager.getSessionData(tempConversation);
    final email = sessionData['auth_email'] as String;

    final result = await AuthEndpoint().verifyLoginCode(
      session,
      email: email,
      code: code,
      platform: platform,
      platformUserId: platformUserId,
    );

    if (!result['success']) {
      await authStateManager.incrementAttempts(session, tempConversation);

      final attemptsRemaining = result['attempts_remaining'];
      await messagingService.sendText(
        recipient: platformUserId,
        text: '''
❌ Invalid code. ${attemptsRemaining != null ? '$attemptsRemaining attempts remaining.' : ''}

Reply "resend" to get a new code.
''',
      );
      return {'success': true, 'response': null};
    }

    // Success! Convert temp conversation to permanent
    final authenticatedUser = result['user'] as User;
    await authStateManager.completeAuthentication(
      session,
      tempConversation: tempConversation,
      authenticatedUser: authenticatedUser,
    );

    // Send welcome back message
    final welcomeMessage = '''
✅ Welcome back, ${authenticatedUser.firstName ?? 'there'}!

You're now logged in on ${platform.name}. Your account is synced across all platforms.

What would you like to do today?
''';

    await messagingService.sendText(
      recipient: platformUserId,
      text: welcomeMessage,
    );

    return {
      'success': true,
      'response': welcomeMessage,
      'intent': 'authentication_complete',
      'user': authenticatedUser,
    };
  }

  /// Handle cross-platform authentication code input
  Future<Map<String, dynamic>> _handleCrossPlatformCodeInput(
    Session session,
    Conversation tempConversation,
    String code,
    PlatformType platform,
    String platformUserId,
  ) async {
    // Cross-platform auth uses same logic as login
    return await _handleLoginCodeInput(
      session,
      tempConversation,
      code,
      platform,
      platformUserId,
    );
  }

  // ==================== NEW USER / CROSS-PLATFORM HANDLERS ====================
  /// Handle new user - show welcome and signup/login options
  Future<Map<String, dynamic>> _handleNewUser(
    Session session,
    PlatformType platform,
    String platformUserId,
  ) async {
    final messagingService = MessagingServiceFactory.getService(platform);

    if (platform == PlatformType.whatsapp) {
      // WhatsApp: Send template with buttons
      await getIt<AuthStateManager>()
          .showWhatsappMenu(platformUserId, session, dBCheck:  false);
    } else if (platform == PlatformType.telegram) {
      // Telegram: Send message with inline keyboard
      await getIt<AuthStateManager>()
          .showTelegramMenu(platformUserId, session,dBCheck:  false);
    }

    return {
      'success': true,
      'state': 'awaiting_user_type_selection',
      'message': 'Welcome message sent',
    };
  }

  /// Handle cross-platform authentication
  Future<Map<String, dynamic>> _handleSigninDetected(
    Session session,
    PlatformType platform,
    String platformUserId,
    String? userEmail,
  ) async {
    final messagingService = MessagingServiceFactory.getService(platform);

    final message = '''
👋 Welcome back!

I see you're already registered${userEmail != null ? ' as $userEmail' : ''}.

To Login, please verify your email address.
''';

    if (platform == PlatformType.whatsapp) {
      // WhatsApp: Send template with buttons
      await getIt<AuthStateManager>().showWhatsappMenu(platformUserId, session, dBCheck: false, isLogin: true, defaultMessage: message);
    } else if (platform == PlatformType.telegram) {
      // Telegram: Send message with inline keyboard
      await getIt<AuthStateManager>().showTelegramMenu(platformUserId, session, dBCheck: false, isLogin: true, defaultMessage: message);
    }
    return {
      'success': true,
      'state': 'awaiting_email_for_login',
      'message': 'Prompted for cross-platform auth',
    };
  }

  // ==================== CONVERSATION STATE HANDLERS ====================

  /// Handle authentication flow states
  Future<Map<String, dynamic>> _handleAuthenticationState(
    Session session,
    User user,
    Conversation conversation,
    String messageContent,
    PlatformType platform,
    String platformUserId,
  ) async {
    final sessionData = conversation.sessionData != null
        ? jsonDecode(conversation.sessionData!)
        : <String, dynamic>{};

    final state = sessionData['auth_state'] as String?;

    switch (state) {
      case 'awaiting_user_type':
        return await _handleUserTypeSelection(
          session,
          user,
          conversation,
          messageContent,
          platform,
          platformUserId,
        );

      case 'awaiting_email':
        return await _handleEmailInput(
          session,
          user,
          conversation,
          messageContent,
          platform,
          platformUserId,
        );

      case 'awaiting_verification_code':
        return await _handleVerificationCode(
          session,
          user,
          conversation,
          messageContent,
          platform,
          platformUserId,
        );

      case 'awaiting_phone':
        return await _handlePhoneInput(
          session,
          user,
          conversation,
          messageContent,
          platform,
          platformUserId,
        );

      default:
        return {
          'success': true,
          'response': null,
        };
    }
  }

  /// Handle user type selection (Customer/Vendor)
  Future<Map<String, dynamic>> _handleUserTypeSelection(
    Session session,
    User user,
    Conversation conversation,
    String messageContent,
    PlatformType platform,
    String platformUserId,
  ) async {
    final messagingService = MessagingServiceFactory.getService(platform);
    final content = messageContent.toLowerCase();

    UserType? userType;
    if (content.contains('shop') || content.contains('customer')) {
      userType = UserType.customer;
    } else if (content.contains('sell') || content.contains('vendor')) {
      userType = UserType.vendor;
    }

    if (userType == null) {
      await messagingService.sendText(
        recipient: platformUserId,
        text: 'Please choose either "Shop" or "Sell" to continue.',
      );
      return {'success': true, 'response': null};
    }

    // Update session data
    final sessionData = conversation.sessionData != null
        ? jsonDecode(conversation.sessionData!)
        : <String, dynamic>{};
    sessionData['selected_user_type'] = userType.name;
    sessionData['auth_state'] = 'awaiting_email';
    conversation.sessionData = jsonEncode(sessionData);
    await Conversation.db.updateRow(session, conversation);

    // Prompt for email
    final message = userType == UserType.vendor
        ? '''
🏪 Great! Let's set up your vendor account.

To get started, I'll need your email address. This will be used to:
• Sync your account across platforms
• Send order notifications
• Provide account recovery

📧 Please send me your email address:
'''
        : '''
🛍️ Perfect! Let's create your shopping account.

📧 Please send me your email address to get started:
''';

    await messagingService.sendText(
      recipient: platformUserId,
      text: message,
    );

    return {
      'success': true,
      'response': message,
      'intent': 'user_type_selected',
    };
  }

  /// Handle email input
  Future<Map<String, dynamic>> _handleEmailInput(
    Session session,
    User user,
    Conversation conversation,
    String messageContent,
    PlatformType platform,
    String platformUserId,
  ) async {
    final messagingService = MessagingServiceFactory.getService(platform);
    final email = messageContent.trim();

    // Validate email format
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(email)) {
      await messagingService.sendText(
        recipient: platformUserId,
        text: '''
❌ That doesn't look like a valid email address.

Please use the format: name@example.com
''',
      );
      return {'success': true, 'response': null};
    }

    // Get session data
    final sessionData = conversation.sessionData != null
        ? jsonDecode(conversation.sessionData!)
        : <String, dynamic>{};

    final isLogin = sessionData['is_login'] == true;

    if (isLogin) {
      // LOGIN FLOW
      final result = await AuthEndpoint().initiateLogin(session, email: email);

      if (!result['success']) {
        await messagingService.sendText(
          recipient: platformUserId,
          text:
              '❌ ${result['message']}\n\nPlease try again or use "Signup" to create a new account.',
        );
        return {'success': true, 'response': null};
      }

      sessionData['auth_email'] = email;
      sessionData['auth_state'] = 'awaiting_verification_code';
      conversation.sessionData = jsonEncode(sessionData);
      await Conversation.db.updateRow(session, conversation);

      await messagingService.sendText(
        recipient: platformUserId,
        text: '''
🔐 I've sent a 6-digit verification code to $email

Please reply with the code (expires in 10 minutes)

Didn't receive it? Reply "resend" to get a new code.
''',
      );
    } else {
      // SIGNUP FLOW
      final userType = sessionData['selected_user_type'] == 'vendor'
          ? UserType.vendor
          : UserType.customer;

      final result = await AuthEndpoint().initiateSignup(
        session,
        email: email,
        userType: userType,
        platform: platform,
        platformUserId: platformUserId,
      );

      if (!result['success']) {
        if (result['error'] == 'email_exists') {
          await messagingService.sendText(
            recipient: platformUserId,
            text: '''
📧 This email is already registered.

Would you like to login instead? Reply "login" to sign in.
''',
          );
        } else {
          await messagingService.sendText(
            recipient: platformUserId,
            text: '❌ ${result['message']}\n\nPlease try again.',
          );
        }
        return {'success': true, 'response': null};
      }

      sessionData['auth_email'] = email;
      sessionData['auth_user_id'] = result['user_id'];
      sessionData['auth_state'] = 'awaiting_verification_code';
      conversation.sessionData = jsonEncode(sessionData);
      await Conversation.db.updateRow(session, conversation);

      await messagingService.sendText(
        recipient: platformUserId,
        text: '''
✅ Almost there!

🔐 I've sent a 6-digit verification code to $email

Please reply with the code (expires in 10 minutes)

Didn't receive it? Reply "resend" to get a new code.
''',
      );
    }

    return {
      'success': true,
      'response': 'Verification code sent',
      'intent': 'email_provided',
    };
  }

  /// Handle verification code
  Future<Map<String, dynamic>> _handleVerificationCode(
    Session session,
    User user,
    Conversation conversation,
    String messageContent,
    PlatformType platform,
    String platformUserId,
  ) async {
    final messagingService = MessagingServiceFactory.getService(platform);
    final code = messageContent.trim();

    // Check for resend request
    if (code.toLowerCase() == 'resend') {
      final sessionData = jsonDecode(conversation.sessionData!);
      final email = sessionData['auth_email'] as String;

      final result = await AuthEndpoint().resendCode(session, email: email);

      if (result['success']) {
        await messagingService.sendText(
          recipient: platformUserId,
          text: '🔄 New code sent to $email. Please check your inbox.',
        );
      } else {
        await messagingService.sendText(
          recipient: platformUserId,
          text: '❌ ${result['message']}',
        );
      }

      return {'success': true, 'response': null};
    }

    // Validate code format
    if (code.length != 6 || !RegExp(r'^\d{6}$').hasMatch(code)) {
      await messagingService.sendText(
        recipient: platformUserId,
        text:
            '❌ Please enter a valid 6-digit code.\n\nReply "resend" to get a new code.',
      );
      return {'success': true, 'response': null};
    }

    // Verify code
    final sessionData = jsonDecode(conversation.sessionData!);
    final email = sessionData['auth_email'] as String;
    final isLogin = sessionData['is_login'] == true;

    Map<String, dynamic> result;

    if (isLogin) {
      result = await AuthEndpoint().verifyLoginCode(
        session,
        email: email,
        code: code,
        platform: platform,
        platformUserId: platformUserId,
      );
    } else {
      result = await AuthEndpoint().verifySignupCode(
        session,
        email: email,
        code: code,
        platform: platform,
        platformUserId: platformUserId,
      );
    }

    if (!result['success']) {
      final attemptsRemaining = result['attempts_remaining'];
      await messagingService.sendText(
        recipient: platformUserId,
        text: '''
❌ Invalid code. ${attemptsRemaining != null ? '$attemptsRemaining attempts remaining.' : ''}

${result['message']}

Reply "resend" to get a new code.
''',
      );
      return {'success': true, 'response': null};
    }

    // Success! Clear auth state
    final authenticatedUser = result['user'] as User;
    sessionData.remove('auth_state');
    sessionData.remove('auth_email');
    sessionData.remove('auth_user_id');
    sessionData['authenticated'] = true;
    conversation.sessionData = jsonEncode(sessionData);
    conversation.userId = authenticatedUser.id;
    await Conversation.db.updateRow(session, conversation);

    // Send welcome message
    final welcomeMessage = isLogin
        ? '''
✅ Welcome back, ${authenticatedUser.firstName ?? 'there'}!

You're now logged in on ${platform.name}. Your account is synced across all platforms.

What would you like to do today?
'''
        : '''
🎉 Account created successfully!

Welcome to Asami, ${authenticatedUser.firstName ?? 'there'}!

${authenticatedUser.userType == UserType.vendor ? '''
🏪 Your vendor account is ready! You can now:
• Add products to your catalog
• Manage orders
• Track your sales

Type /help to see all vendor commands.
''' : '''
🛍️ You're all set to start shopping!

Browse products, add to cart, and checkout seamlessly.

Type /products to start shopping or /help for more options.
'''}
''';

    await messagingService.sendText(
      recipient: platformUserId,
      text: welcomeMessage,
    );

    if (platform == PlatformType.whatsapp) {
      // WhatsApp: Send template with buttons
      await getIt<AuthStateManager>().showWhatsappMenu(platformUserId, session);
    } else if (platform == PlatformType.telegram) {
      // Telegram: Send message with inline keyboard
      await getIt<AuthStateManager>().showTelegramMenu(platformUserId, session);
    }

    return {
      'success': true,
      'response': welcomeMessage,
      'intent': 'authentication_complete',
      'user': authenticatedUser,
    };
  }

  /// Handle phone number input (optional)
  Future<Map<String, dynamic>> _handlePhoneInput(
    Session session,
    User user,
    Conversation conversation,
    String messageContent,
    PlatformType platform,
    String platformUserId,
  ) async {
    final messagingService = MessagingServiceFactory.getService(platform);
    final phone = messageContent.trim();

    // Update user phone
    user.phoneNumber = phone;
    await User.db.updateRow(session, user);

    // Clear phone state
    final sessionData = jsonDecode(conversation.sessionData!);
    sessionData.remove('auth_state');
    conversation.sessionData = jsonEncode(sessionData);
    await Conversation.db.updateRow(session, conversation);

    await messagingService.sendText(
      recipient: platformUserId,
      text: "✅ Phone number saved! You're all set.",
    );

    return {
      'success': true,
      'response': 'Phone number saved',
      'intent': 'phone_provided',
    };
  }

  // ==================== EXISTING HELPER METHODS (UPDATED) ====================

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

  Future<Map<String, dynamic>> _processWithAI(Session session,
      {required User user,
      required Conversation conversation,
      required Message message,
      required PlatformType platform}) async {
    try {
      // // Check if in auth flow
      // final sessionData = conversation.sessionData != null
      //     ? jsonDecode(conversation.sessionData!)
      //     : <String, dynamic>{};

      // if (sessionData.containsKey('auth_state')) {
      //   // Handle authentication flow
      //   return await _handleAuthenticationState(
      //     session,
      //     user,
      //     conversation,
      //     message.content,
      //     conversation.platform,
      //     conversation.platformUserId,
      //   );
      // }

      // ========== PROCESS WITH AI AGENT ==========
      final agentSystem = getIt<AgentSystem>();

      return await agentSystem.processMessage(
        session: session,
        user: user,
        conversation: conversation,
        message: message,
        platform: platform,
      );
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

//       // ========== PROCESS WITH AI AGENT ==========
//       final agentSystem = getIt<AgentSystem>();

//       final aiResponse = await agentSystem.processMessage(
//         session: session,
//         user: user,
//         conversation: conversation,
//         message: message,
//         platform: platform,
//       );
