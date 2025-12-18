// File: server/lib/src/services/messaging/telegram/telegram_webhook_handler.dart

import 'package:asami_server/utils/logger/asami_logger.dart';
import 'package:serverpod/serverpod.dart' hide Order;
import 'package:televerse/telegram.dart';
import 'package:televerse/televerse.dart';
import '../../../endpoints/bot_endpoint.dart';
import '../../../generated/protocol.dart' hide Message;
import '../../auth/auth_state_manager.dart';
import '../../../services/dependency_injection.dart';
import 'telegram_service.dart';
import 'telegram_callback_handler.dart';

/// Handles incoming Telegram webhooks
class TelegramWebhookHandler {
  TelegramWebhookHandler._({
    required this.telegramService,
    required this.botEndpoint,
  }) {
    _instance = this;
    Log.info('✅ TelegramWebhookHandler initialized');
  }

  static TelegramWebhookHandler? _instance;
  static TelegramWebhookHandler? get instance => _instance;

  factory TelegramWebhookHandler({
    required TelegramService telegramService,
    required BotEndpoint botEndpoint,
  }) {
    if (_instance != null) {
      return _instance!;
    }

    return TelegramWebhookHandler._(
      telegramService: telegramService,
      botEndpoint: botEndpoint,
    );
  }

  final TelegramService telegramService;
  final BotEndpoint botEndpoint;

  /// Process incoming webhook update
  Future<Map<String, dynamic>> processWebhook(
    Session session,
    Map<String, dynamic> payload,
  ) async {
    try {
      Log.info('📨 Processing Telegram webhook...');

      // Parse update using televerse
      final update = Update.fromJson(payload);
      Log.info('📦 Update ID: ${update.updateId}');

      // Let televerse handle the update (this triggers bot.command, bot.on, etc.)
      await telegramService.handleUpdate(update);

      // Also process through our bot endpoint
      if (update.message != null) {
        Log.info('💬 Processing message...');
        await _processMessage(session, update.message!);
      } else if (update.callbackQuery != null) {
        Log.info('🔘 Processing callback query...');
        await _processCallbackQuery(session, update.callbackQuery!);
      } else if (update.editedMessage != null) {
        Log.info('✏️ Processing edited message...');
        await _processMessage(session, update.editedMessage!);
      } else {
        Log.info(
            'ℹ️ Update type: ${update.updateId} (not handling this type yet)');
      }

      return {'success': true};
    } catch (e, stackTrace) {
      Log.info('❌ Error processing Telegram webhook: $e');
      Log.error('Stacktrac: ', stackTrace: stackTrace);
      session.log('Telegram webhook error: $e', stackTrace: stackTrace);
      return {
        'success': false,
        'error': e.toString(),
      };
    }
  }

  /// Process regular message
  Future<void> _processMessage(Session session, Message message) async {
    try {
      final chatId = message.chat.id.toString();
      final messageId = message.messageId.toString();
      final from = message.from;

      Log.info(
          '📩 Message from: ${from?.username ?? from?.firstName ?? chatId} with message id $messageId');

      // Extract message content
      String content = '';
      String? mediaUrl;
      MessageType messageType = MessageType.text;

      if (message.text != null) {
        content = message.text!;
        messageType = MessageType.text;
        Log.info('   Text: $content');
      } else if (message.photo != null && message.photo!.isNotEmpty) {
        content = message.caption ?? '[Photo]';
        messageType = MessageType.image;
        mediaUrl = message.photo!.last.fileId;
        Log.info('   Photo with caption: $content');
      } else if (message.video != null) {
        content = message.caption ?? '[Video]';
        messageType = MessageType.video;
        mediaUrl = message.video!.fileId;
        Log.info('   Video with caption: $content');
      } else if (message.audio != null) {
        content = message.caption ?? '[Audio]';
        messageType = MessageType.audio;
        mediaUrl = message.audio!.fileId;
        Log.info('   Audio');
      } else if (message.document != null) {
        content = message.caption ?? '[Document]';
        messageType = MessageType.document;
        mediaUrl = message.document!.fileId;
        Log.info('   Document: ${message.document!.fileName}');
      } else if (message.location != null) {
        content =
            '[Location: ${message.location!.latitude}, ${message.location!.longitude}]';
        messageType = MessageType.location;
        Log.info('   Location');
      } else if (message.sticker != null) {
        content = '[Sticker: ${message.sticker!.emoji}]';
        messageType = MessageType.image;
        Log.info('   Sticker');
      } else {
        content = '[Unsupported message type]';
        Log.info('   ⚠️ Unsupported message type');
        return; // Don't process unsupported types
      }

      // Process with bot endpoint
      Log.info('🤖 Sending to bot endpoint...');
      final response = await botEndpoint.processMessage(
        session,
        platformUserId: chatId,
        platform: PlatformType.telegram,
        messageContent: content,
        messageType: messageType,
        mediaUrl: mediaUrl,
        platformMessageId: messageId,
      );

      if (response['success'] == true) {
        Log.success('✅ Bot processed message successfully');
      } else {
        Log.error('⚠️ Bot processing had issues: ${response['error']}');
      }
    } catch (e, stackTrace) {
      Log.error('❌ Error processing message: $e');
      Log.error(stackTrace.toString());
      session.log('Message processing error: $e', stackTrace: stackTrace);
    }
  }

  /// Process callback query (button click)
  /// This now routes to TelegramCallbackHandler
  Future<void> _processCallbackQuery(
    Session session,
    CallbackQuery callbackQuery,
  ) async {
    try {
      final chatId = callbackQuery.from.id.toString();
      final data = callbackQuery.data ?? '';
      final messageId = callbackQuery.message?.messageId.toString();

      Log.info(
          '📩 Callback query from: ${callbackQuery.from.username ?? chatId}');
      Log.info('   Data: $data');

      // Get auth state manager from DI
      final authStateManager = getIt<AuthStateManager>();

      // Create callback handler instance
      final callbackHandler = TelegramCallbackHandler(
        telegramService: telegramService,
        session: session,
        authStateManager: authStateManager,
      );

      // Process callback through dedicated handler
      await callbackHandler.processCallbackQuery(callbackQuery);

      Log.info('✅ Callback query processed');
    } catch (e, stackTrace) {
      Log.info('❌ Error processing callback query: $e');
      Log.error('Stacktrac: ', stackTrace: stackTrace);

      session.log('Callback query error: $e', stackTrace: stackTrace);
    }
  }
}