// File: server/lib/src/services/auth/auth_state_manager.dart

// ignore_for_file: constant_identifier_names

import 'dart:convert';
import 'package:asami_server/src/services/dependency_injection.dart';
import 'package:asami_server/src/services/messaging/telegram/telegram_service.dart';
import 'package:asami_server/src/services/messaging/whatsapp/whatsapp_service.dart';
import 'package:serverpod/serverpod.dart' hide Message;
import 'package:televerse/telegram.dart' hide User, Message;
import '../../generated/protocol.dart';
import '../messaging/telegram/telegram_commands_setup.dart';

/// Manages authentication state using temporary conversations
class AuthStateManager {
  /// Get or create temporary auth conversation
  Future<Conversation?> getTempAuthConversation(
    Session session, {
    required PlatformType platform,
    required String platformUserId,
  }) async {
    // Look for existing temp conversation
    final existing = await Conversation.db.findFirstRow(
      session,
      where: (t) =>
          t.userId.equals(null) &
          t.platform.equals(platform) &
          t.platformUserId.equals(platformUserId) &
          t.status.equals(ConversationStatus.waiting_bot),
    );

    if (existing != null) {
      final sessionData = existing.sessionData != null
          ? jsonDecode(existing.sessionData!)
          : <String, dynamic>{};

      // Check if it's a temp auth conversation
      if (sessionData['is_temp_auth_conversation'] == true) {
        return existing;
      }
    }

    return null;
  }

// SHOW WHATSAPP STARTUP MENU
  Future<void> showWhatsappMenu(String from, Session session,
      {bool dBCheck = true,
      String? defaultMessage,
      bool isLogin = false}) async {
    User? user;
    if (dBCheck) {
      user = await User.db.findFirstRow(
        session,
        where: (t) =>
            t.whatsappId.equals(from) & t.whatsappAuthenticated.equals(true),
      );
    }

    final whatsappService = getIt<WhatsAppService>();
    if (user == null) {
      // Show auth menu with image header
      await whatsappService.sendInteractiveReplyButton(
        phoneNumber: from,
        bodyText: defaultMessage ??
            '''
👋 Welcome to Asami!

Your AI-powered shopping assistant. I can help you:
• 🛍️ Discover and buy amazing products
• 🏪 Start selling your own products
• 💬 Get instant support
s
''',
        footerText: 'To get started, please choose an option below:',
        headerInteractive: {
          "type": "image",
          "image": {
            "link": "https://ik.imagekit.io/somtech/asami_banner.jpg",
          }
        },
        interactiveReplyButtons: [
          if (!isLogin)
            {
              'type': 'reply',
              'reply': {
                'id': 'auth_signup_customer',
                'title': '🛍️ Shop as Customer',
              }
            },
          if (!isLogin)
            {
              'type': 'reply',
              'reply': {
                'id': 'auth_signup_vendor',
                'title': '🏪 Sell as Vendor',
              }
            },
          {
            'type': 'reply',
            'reply': {
              'id': 'auth_login',
              'title': isLogin ? '📱 Login' : '📱 I Have an Account',
            }
          },
        ],
      );
      return;
    }

    // Show authenticated menu
    final isVendor = user.userType == UserType.vendor;

    final buttons = [
      {
        'type': 'reply',
        'reply': {
          'id': 'nav_products',
          'title': '🛍️ Products',
        }
      },
      {
        'type': 'reply',
        'reply': {
          'id': 'cart_view',
          'title': '🛒 Cart',
        }
      },
      {
        'type': 'reply',
        'reply': {
          'id': 'nav_orders',
          'title': '📦 Orders',
        }
      },
    ];

    await whatsappService.sendInteractiveReplyButton(
      phoneNumber: from,
      bodyText: isVendor
          ? '''
🏠 *Main Menu*

Quick Actions:
• Browse products to buy
• Manage your cart & orders
• ${isVendor ? 'Check your business analytics' : 'Track deliveries'}

${isVendor ? 'Use /myproducts for vendor tools' : ''}

What would you like to do?
'''
          : '''
🏠 *Main Menu*

What would you like to do?
''',
      footerText: 'Type /help for more options',
      headerInteractive: {"type": "text", "text": "Main Menu"},
      interactiveReplyButtons: buttons,
    );
  }

// SHOW TELEGRAM STARTUP MENU
//   Future<void> showTelegramMenu(String chatId, Session session,
//       {bool dBCheck = true,
//       String? defaultMessage,
//       bool isLogin = false}) async {
//     // Check if user is authenticated
//     User? user;
//     if (dBCheck) {
//       user = await User.db.findFirstRow(
//         session,
//         where: (t) =>
//             t.telegramId.equals(chatId) & t.telegramAuthenticated.equals(true),
//       );
//     }

//     final telegramService = getIt<TelegramService>();
//     if (user == null) {
//       final message = defaultMessage ??
//           '''
// 👋 Welcome to Asami!

// Your AI-powered shopping assistant for discovering products, managing sales, and seamless transactions.

// What would you like to do?
// ''';
//       // Show auth menu
//       final keyboard = [
//         if (!isLogin)
//           [
//             InlineKeyboardButton(
//               text: '🛍️ Shop as Customer',
//               callbackData: 'auth_signup_customer',
//             ),
//           ],
//         if (!isLogin)
//           [
//             InlineKeyboardButton(
//               text: '🏪 Sell as Vendor',
//               callbackData: 'auth_signup_vendor',
//             ),
//           ],
//         [
//           InlineKeyboardButton(
//             text: isLogin ? '📱 Login' : '📱 I Have an Account',
//             callbackData: 'auth_login',
//           ),
//         ],
//       ];

//       await telegramService.sendInlineKeyboard(
//         chatId: int.parse(chatId),
//         text: message,
//         keyboard: keyboard,
//       );
//       return;
//     }

//     // Show authenticated menu
//     final isVendor = user.userType == UserType.vendor;

//     List<List<InlineKeyboardButton>> keyboard = [
//       [
//         InlineKeyboardButton(
//           text: '🛍️ Browse Products',
//           callbackData: 'nav_products',
//         ),
//         InlineKeyboardButton(
//           text: '🛒 My Cart',
//           callbackData: 'cart_view',
//         ),
//       ],
//       [
//         InlineKeyboardButton(
//           text: '📦 My Orders',
//           callbackData: 'nav_orders',
//         ),
//       ],
//     ];

//     if (isVendor) {
//       keyboard.addAll([
//         [
//           InlineKeyboardButton(
//             text: '📊 Analytics',
//             callbackData: 'vendor_analytics',
//           ),
//           InlineKeyboardButton(
//             text: '🏪 My Products',
//             callbackData: 'vendor_products',
//           ),
//         ],
//       ]);
//     }

//     keyboard.add([
//       InlineKeyboardButton(
//         text: '👤 Account',
//         callbackData: 'nav_account',
//       ),
//       InlineKeyboardButton(
//         text: '❓ Help',
//         callbackData: 'nav_help',
//       ),
//     ]);
//     final message = isVendor
//         ? '''
// 🏠 *Main Menu*

// Quick Actions:
// • Browse products to buy
// • Manage your cart & orders
// • ${isVendor ? 'Check your business analytics' : 'Track deliveries'}

// ${isVendor ? 'Use /myproducts for vendor tools' : ''}

// What would you like to do?
// '''
//         : '''
// 🏠 *Main Menu*

// What would you like to do?
// ''';

//     await telegramService.sendInlineKeyboard(
//       chatId: int.parse(chatId),
//       text: message,
//       keyboard: keyboard,
//       parseMode: ParseMode.markdown,
//     );
//   }

  /// Create new temporary auth conversation
  Future<Conversation> createTempAuthConversation(
    Session session, {
    required PlatformType platform,
    required String platformUserId,
    required AuthState initialState,
    UserType userType = UserType.customer,
    Map<String, dynamic>? initialData,
  }) async {
    final tempUserId = Uuid().v4obj();

    final sessionData = {
      'is_temp_auth_conversation': true,
      'auth_state': initialState.name,
      'created_at': DateTime.now().toIso8601String(),
      ...?initialData,
    };

    final conversation = Conversation(
      // userId: tempUserId, // Temporary user ID
      platform: platform,
      platformUserId: platformUserId,
      userType: userType,
      status: ConversationStatus.waiting_bot,
      sessionData: jsonEncode(sessionData),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    return await Conversation.db.insertRow(session, conversation);
  }

  /// Get current auth state from conversation
  AuthState? getCurrentState(Conversation conversation) {
    if (conversation.sessionData == null) return null;

    final sessionData = jsonDecode(conversation.sessionData!);
    final stateString = sessionData['auth_state'] as String?;

    if (stateString == null) return null;

    try {
      return AuthState.values.firstWhere((e) => e.name == stateString);
    } catch (e) {
      return null;
    }
  }

  /// Update auth state and data
  Future<Conversation> updateState(
    Session session, {
    required Conversation conversation,
    required AuthState newState,
    Map<String, dynamic>? additionalData,
  }) async {
    final sessionData = conversation.sessionData != null
        ? jsonDecode(conversation.sessionData!)
        : <String, dynamic>{};

    sessionData['auth_state'] = newState.name;
    sessionData['last_updated'] = DateTime.now().toIso8601String();

    if (additionalData != null) {
      sessionData.addAll(additionalData);
    }

    conversation.sessionData = jsonEncode(sessionData);
    conversation.updatedAt = DateTime.now();

    return await Conversation.db.updateRow(session, conversation);
  }

  /// Get session data from conversation
  Map<String, dynamic> getSessionData(Conversation conversation) {
    if (conversation.sessionData == null) return {};
    return jsonDecode(conversation.sessionData!);
  }

  /// Increment verification attempts
  Future<int> incrementAttempts(
    Session session,
    Conversation conversation,
  ) async {
    final sessionData = getSessionData(conversation);
    final attempts = (sessionData['auth_attempts'] as int?) ?? 0;
    final newAttempts = attempts + 1;

    await updateState(
      session,
      conversation: conversation,
      newState: getCurrentState(conversation) ?? AuthState.NEW_USER_DETECTED,
      additionalData: {'auth_attempts': newAttempts},
    );

    return newAttempts;
  }

  /// Check if code is expired
  bool isCodeExpired(Conversation conversation) {
    final sessionData = getSessionData(conversation);
    final sentAtStr = sessionData['auth_code_sent_at'] as String?;

    if (sentAtStr == null) return true;

    final sentAt = DateTime.parse(sentAtStr);
    final now = DateTime.now();
    final difference = now.difference(sentAt);

    return difference.inMinutes >= 10;
  }

  /// Check if user should be rate limited
  bool shouldRateLimit(Conversation conversation) {
    final sessionData = getSessionData(conversation);
    final attempts = (sessionData['auth_attempts'] as int?) ?? 0;
    return attempts >= 5;
  }

  /// Complete authentication and convert temp conversation to permanent
  Future<Conversation> completeAuthentication(
    Session session, {
    required Conversation tempConversation,
    required User authenticatedUser,
  }) async {
    session.log(
        '🎯 Completing authentication for user ${authenticatedUser.id.uuid}');
    // Update conversation with real user ID
    tempConversation.userId = authenticatedUser.id;
    tempConversation.status = ConversationStatus.active;

    authenticatedUser.status = UserStatus.active;

    // Remove temp auth markers but keep useful data
    final sessionData = getSessionData(tempConversation);
    sessionData.remove('is_temp_auth_conversation');
    sessionData.remove('auth_state');
    sessionData.remove('temp_user_id');
    sessionData['authenticated'] = true;
    sessionData['authenticated_at'] = DateTime.now().toIso8601String();

    tempConversation.sessionData = jsonEncode(sessionData);
    tempConversation.updatedAt = DateTime.now();
    await User.db.updateRow(session, authenticatedUser);

    // 2. ✅ NEW: Update Telegram commands for this user
    await _updateTelegramCommandsAfterAuth(
      session,
      authenticatedUser: authenticatedUser,
      platform: tempConversation.platform,
      platformUserId: tempConversation.platformUserId,
    );
    return await Conversation.db.updateRow(session, tempConversation);
  }

  /// ✅ NEW: Show Telegram menu with inline keyboard
  Future<void> showTelegramMenu(
    String chatID,
    Session session, {
    bool dBCheck = true,
    bool isLogin = false,
    String? defaultMessage,
  }) async {
    try {
      // Check if user is authenticated
      User? existingUser;
      if (dBCheck) {
        existingUser = await User.db.findFirstRow(
          session,
          where: (t) =>
              t.telegramId.equals(chatID) &
              t.telegramAuthenticated.equals(true),
        );
      }
      final telegramService = getIt<TelegramService>();

      final isVendor = existingUser?.userType == UserType.vendor;

      if (existingUser != null && existingUser.emailVerified) {
        // User is already authenticated, show main menu
        await telegramService.sendInlineKeyboard(
          chatId: int.parse(chatID),
          text: defaultMessage ??
              '''
👋 Welcome back, ${existingUser.firstName ?? 'there'}!

Choose an option below or type /help to see all commands:
''',
          parseMode: ParseMode.markdown,
          keyboard: TelegramCommandsSetup.createMainMenu(isVendor),
        );

        // ✅ Update their commands
        await TelegramCommandsSetup.updateUserCommands(
          telegramService,
          int.parse(chatID),
          isVendor,
        );
      } else {
        // Show auth menu
        final keyboard = [
          if (!isLogin) ...[
            [
              InlineKeyboardButton(
                text: '🛍️ Shop as Customer',
                callbackData: 'auth_customer',
              ),
            ],
            [
              InlineKeyboardButton(
                text: '🪐 Sell as Vendor',
                callbackData: 'auth_vendor',
              ),
            ],
          ],
          [
            InlineKeyboardButton(
              text: '🔐 Login to Existing Account',
              callbackData: 'auth_login',
            ),
          ]
        ];

        await telegramService.sendInlineKeyboard(
          chatId: int.parse(chatID),
          text: defaultMessage ??
              '''
👋 Welcome to Asami!

${isLogin ? '🔐 Please login to continue.' : '✨ Get started by choosing your account type:'}
''',
          parseMode: ParseMode.markdown,
          keyboard: keyboard,
        );
      }
    } catch (e, stackTrace) {
      session.log('Error showing Telegram menu: $e', stackTrace: stackTrace);
    }
  }

  /// Delete temporary conversation (cleanup on failure/cancellation)
  Future<bool> deleteTempConversation(
    Session session,
    Conversation conversation,
  ) async {
    try {
      // Delete associated messages
      await Message.db.deleteWhere(
        session,
        where: (t) => t.conversationId.equals(conversation.id),
      );

      // Delete conversation
      await Conversation.db.deleteRow(session, conversation);
      return true;
    } catch (e) {
      session.log('Error deleting temp conversation: $e');
      return false;
    }
  }

  /// Get human-readable state description
  String getStateDescription(AuthState state) {
    switch (state) {
      case AuthState.NEW_USER_DETECTED:
        return 'New user - showing welcome options';
      case AuthState.RETURNING_USER_DETECTED:
        return 'Returning user - prompting for login';
      case AuthState.SIGNUP_AWAITING_USER_TYPE:
        return 'Waiting for user to choose Customer/Vendor';
      case AuthState.SIGNUP_AWAITING_EMAIL:
        return 'Waiting for email address';
      case AuthState.SIGNUP_AWAITING_NAME:
        return 'Waiting for name input';
      case AuthState.SIGNUP_AWAITING_CODE:
        return 'Waiting for verification code';
      case AuthState.SIGNUP_COMPLETED:
        return 'Signup completed successfully';
      case AuthState.LOGIN_AWAITING_EMAIL:
        return 'Waiting for login email';
      case AuthState.LOGIN_AWAITING_CODE:
        return 'Waiting for login verification code';
      case AuthState.LOGIN_COMPLETED:
        return 'Login completed successfully';
      case AuthState.CROSS_PLATFORM_AUTH_DETECTED:
        return 'User exists on another platform';
      case AuthState.CROSS_PLATFORM_AWAITING_CODE:
        return 'Waiting for cross-platform verification';
      case AuthState.AUTHENTICATED:
        return 'User is authenticated';
      case AuthState.CODE_EXPIRED:
        return 'Verification code has expired';
      case AuthState.TOO_MANY_ATTEMPTS:
        return 'Too many failed attempts';
      case AuthState.EMAIL_ALREADY_EXISTS:
        return 'Email is already registered';
    }
  }

  /// Format time remaining for code expiry
  String getTimeRemaining(Conversation conversation) {
    final sessionData = getSessionData(conversation);
    final sentAtStr = sessionData['auth_code_sent_at'] as String?;

    if (sentAtStr == null) return '0:00';

    final sentAt = DateTime.parse(sentAtStr);
    final expiresAt = sentAt.add(Duration(minutes: 10));
    final now = DateTime.now();
    final remaining = expiresAt.difference(now);

    if (remaining.isNegative) return '0:00';

    final minutes = remaining.inMinutes;
    final seconds = remaining.inSeconds % 60;

    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  /// ✅ NEW: Update Telegram bot commands after successful authentication
  Future<void> _updateTelegramCommandsAfterAuth(
    Session session, {
    required User authenticatedUser,
    required PlatformType platform,
    required String platformUserId,
  }) async {
    if (platform != PlatformType.telegram) return;

    try {
      final telegramService = getIt<TelegramService>();
      final userId = int.parse(platformUserId);
      final isVendor = authenticatedUser.userType == UserType.vendor;

      // Update commands for this specific user
      await TelegramCommandsSetup.updateUserCommands(
        telegramService,
        userId,
        isVendor,
      );

      session.log(
          '✅ Updated Telegram commands for user $userId (${isVendor ? 'vendor' : 'customer'})');
    } catch (e, stackTrace) {
      session.log('⚠️ Failed to update Telegram commands: $e',
          stackTrace: stackTrace);
      // Don't fail auth if command update fails
    }
  }
}

/// Authentication states for the signup/login flow
enum AuthState {
  // Initial detection
  NEW_USER_DETECTED,
  RETURNING_USER_DETECTED,

  // Signup flow
  SIGNUP_AWAITING_USER_TYPE,
  SIGNUP_AWAITING_EMAIL,
  SIGNUP_AWAITING_NAME,
  SIGNUP_AWAITING_CODE,
  SIGNUP_COMPLETED,

  // Login flow
  LOGIN_AWAITING_EMAIL,
  LOGIN_AWAITING_CODE,
  LOGIN_COMPLETED,

  // Cross-platform auth
  CROSS_PLATFORM_AUTH_DETECTED,
  CROSS_PLATFORM_AWAITING_CODE,

  // Authenticated
  AUTHENTICATED,

  // Error states
  CODE_EXPIRED,
  TOO_MANY_ATTEMPTS,
  EMAIL_ALREADY_EXISTS,
}
