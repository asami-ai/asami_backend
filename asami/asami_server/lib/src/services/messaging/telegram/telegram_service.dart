// File: server/lib/src/services/messaging/telegram_service.dart

import 'dart:io';
import 'package:televerse/telegram.dart'
    show
        Message,
        ParseMode,
        ChatAction,
        ReplyParameters,
        BotCommand,
        BotCommandScope,
        ChatMember,
        ReplyMarkup,
        MessageEntity,
        InputPollOption,
        PollType,
        DiceEmoji,
        InlineKeyboardMarkup,
        LinkPreviewOptions,
        MessageId,
        InputMedia,
        InlineQueryResult,
        InlineQueryResultsButton,
        ChatFullInfo,
        User,
        BotName,
        BotDescription,
        Update;
import 'package:televerse/televerse.dart';

/// Enhanced Telegram Bot service with full feature support
class TelegramService {
  TelegramService._({
    required String botToken,
    this.webhookUrl,
    this.webhookPort,
  }) : _bot = Bot(botToken);

  factory TelegramService({
    required String botToken,
    String? webhookUrl,
    int? webhookPort,
  }) {
    return TelegramService._(
      botToken: botToken,
      webhookUrl: webhookUrl,
      webhookPort: webhookPort,
    );
  }

  final Bot _bot;
  final String? webhookUrl;
  final int? webhookPort;
  bool _isStarted = false;

  Bot get bot => _bot;
  RawAPI get api => _bot.api;

  // ==================== LIFECYCLE ====================
  /// Start the bot - DO NOT use built-in webhook server
  /// Serverpod will handle the webhook endpoint
  Future<void> start() async {
    if (_isStarted) return;

    try {
      print('🔄 Initializing Telegram bot...');

      // Test connection
      final me = await api.getMe();
      print('✅ Bot authenticated: @${me.username}');

      // Set webhook if URL provided
      if (webhookUrl != null && webhookUrl!.isNotEmpty) {
        await _configureWebhook();
      } else {
        print('⚠️ No webhook URL provided - using polling mode');
        // Start polling (for development)
        await _bot.start();
        print('🤖 Telegram bot started in polling mode');
      }

      _isStarted = true;
      print('✅ Telegram service fully initialized');
    } catch (e, stackTrace) {
      print('❌ Failed to start Telegram bot: $e');
      print('Stack trace: $stackTrace');

      if (e.toString().contains('Network') || e.toString().contains('Dio')) {
        print('');
        print('🔧 NETWORK ERROR - Possible solutions:');
        print('1. Check internet connection');
        print('2. Use VPN if Telegram is blocked');
        print('3. Verify bot token is correct');
        print('');
      }

      rethrow; // Throw for factory to handle
    }
  }

  /// Configure webhook (called by start if webhookUrl is provided)
  Future<void> _configureWebhook() async {
    try {
      print('🔗 Setting webhook URL: $webhookUrl');

      // Delete any existing webhook first
      await api.deleteWebhook(dropPendingUpdates: true);

      // Set new webhook
      final success = await api.setWebhook(
        webhookUrl!,
        allowedUpdates: [
          UpdateType.message,
          UpdateType.editedMessage,
          UpdateType.callbackQuery,
          UpdateType.inlineQuery,
          UpdateType.chosenInlineResult,
          UpdateType.myChatMember,
          UpdateType.chatMember,
        ],
      );

      if (success) {
        print('✅ Webhook configured successfully');

        // Verify webhook
        final info = await api.getWebhookInfo();
        print('📡 Webhook info:');
        print('   URL: ${info.url}');
        print('   Pending updates: ${info.pendingUpdateCount}');
        if (info.lastErrorMessage != null) {
          print('   ⚠️ Last error: ${info.lastErrorMessage}');
        }
      } else {
        print('❌ Failed to set webhook');
      }
    } catch (e) {
      print('❌ Error configuring webhook: $e');
      rethrow;
    }
  }

  /// Handle incoming update (called by webhook handler)
  Future<void> handleUpdate(Update update) async {
    if (!_isStarted) {
      print('⚠️ Bot not started, ignoring update');
      return;
    }

    try {
      // Let televerse handle the update through its normal flow
      await _bot.handleUpdate(update);
    } catch (e, stackTrace) {
      print('❌ Error handling update: $e');
      print(stackTrace);
    }
  }

  /// Check if bot is connected
  Future<bool> isConnected() async {
    if (!_isStarted) return false;

    try {
      await api.getMe().timeout(Duration(seconds: 5));
      return true;
    } catch (e) {
      print('⚠️ Connection check failed: $e');
      return false;
    }
  }

  Future<void> stop() async {
    if (!_isStarted) return;

    try {
      // Delete webhook when stopping
      if (webhookUrl != null) {
        await api.deleteWebhook();
        print('🔗 Webhook deleted');
      }
    } catch (e) {
      print('⚠️ Error deleting webhook: $e');
    }

    _isStarted = false;
    print('🛑 Telegram bot stopped');
  }

  void dispose() {
    stop();
    print('🧹 TelegramService disposed');
  }

  // ==================== HELPER ====================

  void _ensureConnected() {
    if (!_isStarted) {
      throw Exception('Telegram bot is not started');
    }
  }

  // ==================== BASIC MESSAGING ====================

  /// Send text message
  Future<Message> sendTextMessage({
    required dynamic chatId,
    required String text,
    ParseMode? parseMode,
    bool? disableWebPagePreview,
    int? replyToMessageId,
    ReplyMarkup? replyMarkup,
    List<MessageEntity>? entities,
  }) async {
    _ensureConnected();
    return await api.sendMessage(
      ChatID(chatId),
      text,
      parseMode: parseMode,
      entities: entities,
      linkPreviewOptions: disableWebPagePreview == true
          ? LinkPreviewOptions(isDisabled: true)
          : null,
      replyParameters: replyToMessageId != null
          ? ReplyParameters(messageId: replyToMessageId)
          : null,
      replyMarkup: replyMarkup,
    );
  }

  /// Send photo
  Future<Message> sendPhoto({
    required dynamic chatId,
    required String photoUrl,
    String? caption,
    ParseMode? parseMode,
    bool? hasSpoiler,
    ReplyMarkup? replyMarkup,
    int? replyToMessageId,
  }) async {
    _ensureConnected();
    return await api.sendPhoto(
      ChatID(chatId),
      InputFile.fromUrl(photoUrl),
      caption: caption,
      parseMode: parseMode,
      hasSpoiler: hasSpoiler,
      replyMarkup: replyMarkup,
      replyParameters: replyToMessageId != null
          ? ReplyParameters(messageId: replyToMessageId)
          : null,
    );
  }

  /// Send video
  Future<Message> sendVideo({
    required dynamic chatId,
    required String videoUrl,
    String? caption,
    ParseMode? parseMode,
    bool? supportsStreaming,
    bool? hasSpoiler,
    ReplyMarkup? replyMarkup,
  }) async {
    _ensureConnected();
    return await api.sendVideo(
      ChatID(chatId),
      InputFile.fromUrl(videoUrl),
      caption: caption,
      parseMode: parseMode,
      supportsStreaming: supportsStreaming,
      hasSpoiler: hasSpoiler,
      replyMarkup: replyMarkup,
    );
  }

  /// Send audio
  Future<Message> sendAudio({
    required dynamic chatId,
    required String audioUrl,
    String? caption,
    String? performer,
    String? title,
    int? duration,
  }) async {
    _ensureConnected();
    return await api.sendAudio(
      ChatID(chatId),
      InputFile.fromUrl(audioUrl),
      caption: caption,
      performer: performer,
      title: title,
      duration: duration,
    );
  }

  /// Send voice note
  Future<Message> sendVoice({
    required dynamic chatId,
    required String voiceUrl,
    String? caption,
    int? duration,
  }) async {
    _ensureConnected();
    return await api.sendVoice(
      ChatID(chatId),
      InputFile.fromUrl(voiceUrl),
      caption: caption,
      duration: duration,
    );
  }

  /// Send document
  Future<Message> sendDocument({
    required dynamic chatId,
    required String documentUrl,
    String? caption,
    String? fileName,
    bool? disableContentTypeDetection,
  }) async {
    _ensureConnected();
    return await api.sendDocument(
      ChatID(chatId),
      InputFile.fromUrl(documentUrl),
      caption: caption,
      disableContentTypeDetection: disableContentTypeDetection,
    );
  }

  /// Send sticker
  Future<Message> sendSticker({
    required dynamic chatId,
    required String stickerUrl,
    String? emoji,
  }) async {
    _ensureConnected();
    return await api.sendSticker(
      ChatID(chatId),
      InputFile.fromUrl(stickerUrl),
      emoji: emoji,
    );
  }

  /// Send animation (GIF)
  Future<Message> sendAnimation({
    required dynamic chatId,
    required String animationUrl,
    String? caption,
    int? duration,
    int? width,
    int? height,
  }) async {
    _ensureConnected();
    return await api.sendAnimation(
      ChatID(chatId),
      InputFile.fromUrl(animationUrl),
      caption: caption,
      duration: duration,
      width: width,
      height: height,
    );
  }

  // ==================== LOCATION & CONTACT ====================

  /// Send location
  Future<Message> sendLocation({
    required dynamic chatId,
    required double latitude,
    required double longitude,
    double? horizontalAccuracy,
    int? livePeriod,
    int? heading,
    int? proximityAlertRadius,
  }) async {
    _ensureConnected();
    return await api.sendLocation(
      ChatID(chatId),
      latitude,
      longitude,
      horizontalAccuracy: horizontalAccuracy,
      livePeriod: livePeriod,
      heading: heading,
      proximityAlertRadius: proximityAlertRadius,
    );
  }

  /// Send venue
  Future<Message> sendVenue({
    required dynamic chatId,
    required double latitude,
    required double longitude,
    required String title,
    required String address,
    String? foursquareId,
    String? foursquareType,
  }) async {
    _ensureConnected();
    return await api.sendVenue(
      ChatID(chatId),
      latitude,
      longitude,
      title,
      address,
      foursquareId: foursquareId,
      foursquareType: foursquareType,
    );
  }

  /// Send contact
  Future<Message> sendContact({
    required dynamic chatId,
    required String phoneNumber,
    required String firstName,
    String? lastName,
    String? vcard,
  }) async {
    _ensureConnected();
    return await api.sendContact(
      ChatID(chatId),
      phoneNumber,
      firstName,
      lastName: lastName,
      vcard: vcard,
    );
  }

  // ==================== INTERACTIVE MESSAGES ====================

  /// Send inline keyboard
  Future<Message> sendInlineKeyboard({
    required dynamic chatId,
    required String text,
    required InlineKeyboard keyboard,
    ParseMode? parseMode,
  }) async {
    _ensureConnected();
    return await api.sendMessage(
      ChatID(chatId),
      text,
      parseMode: parseMode,
      replyMarkup: keyboard,
    );
  }

  /// Send reply keyboard
  Future<Message> sendReplyKeyboard({
    required dynamic chatId,
    required String text,
    required Keyboard keyboard,
    ParseMode? parseMode,
  }) async {
    _ensureConnected();
    return await api.sendMessage(
      ChatID(chatId),
      text,
      parseMode: parseMode,
      replyMarkup: keyboard,
    );
  }

  /// Send poll
  Future<Message> sendPoll({
    required dynamic chatId,
    required String question,
    required List<InputPollOption> options,
    bool? isAnonymous,
    PollType type = PollType.regular,
    bool? allowsMultipleAnswers,
    int? correctOptionId,
    String? explanation,
    ParseMode? explanationParseMode,
    int? openPeriod,
    DateTime? closeDate,
    bool? isClosed,
  }) async {
    _ensureConnected();
    return await api.sendPoll(
      ChatID(chatId),
      question,
      options,
      isAnonymous: isAnonymous,
      type: type,
      allowsMultipleAnswers: allowsMultipleAnswers,
      correctOptionId: correctOptionId,
      explanation: explanation,
      explanationParseMode: explanationParseMode,
      openPeriod: openPeriod,
      closeDate: closeDate,
      isClosed: isClosed,
    );
  }

  /// Send dice
  Future<Message> sendDice({
    required dynamic chatId,
    DiceEmoji emoji = DiceEmoji.dice,
  }) async {
    _ensureConnected();
    return await api.sendDice(
      ChatID(chatId),
      emoji: emoji,
    );
  }

  // ==================== MESSAGE ACTIONS ====================

  /// Send chat action (typing indicator)
  Future<bool> sendChatAction({
    required dynamic chatId,
    required ChatAction action,
  }) async {
    _ensureConnected();
    return await api.sendChatAction(
      ChatID(chatId),
      action,
    );
  }

  /// Edit message text
  Future<Message> editMessageText({
    required dynamic chatId,
    required int messageId,
    required String text,
    ParseMode? parseMode,
    InlineKeyboardMarkup? replyMarkup,
    LinkPreviewOptions? linkPreviewOptions,
  }) async {
    _ensureConnected();
    return await api.editMessageText(
      ChatID(chatId),
      messageId,
      text,
      parseMode: parseMode,
      replyMarkup: replyMarkup,
      linkPreviewOptions: linkPreviewOptions,
    );
  }

  /// Edit message caption
  Future<Message> editMessageCaption({
    required dynamic chatId,
    required int messageId,
    String? caption,
    ParseMode? parseMode,
    InlineKeyboardMarkup? replyMarkup,
  }) async {
    _ensureConnected();
    return await api.editMessageCaption(
      ChatID(chatId),
      messageId,
      caption: caption,
      parseMode: parseMode,
      replyMarkup: replyMarkup,
    );
  }

  /// Edit message reply markup
  Future<Message> editMessageReplyMarkup({
    required dynamic chatId,
    required int messageId,
    InlineKeyboardMarkup? replyMarkup,
  }) async {
    _ensureConnected();
    return await api.editMessageReplyMarkup(
      ChatID(chatId),
      messageId,
      replyMarkup: replyMarkup,
    );
  }

  /// Delete message
  Future<bool> deleteMessage({
    required dynamic chatId,
    required int messageId,
  }) async {
    _ensureConnected();
    return await api.deleteMessage(
      ChatID(chatId),
      messageId,
    );
  }

  /// Forward message
  Future<Message> forwardMessage({
    required dynamic chatId,
    required dynamic fromChatId,
    required int messageId,
    bool? disableNotification,
    bool? protectContent,
  }) async {
    _ensureConnected();
    return await api.forwardMessage(
      ChatID(chatId),
      ChatID(fromChatId),
      messageId,
      disableNotification: disableNotification,
      protectContent: protectContent,
    );
  }

  /// Copy message
  Future<MessageId> copyMessage({
    required dynamic chatId,
    required dynamic fromChatId,
    required int messageId,
    String? caption,
    ParseMode? parseMode,
  }) async {
    _ensureConnected();
    return await api.copyMessage(
      ChatID(chatId),
      ChatID(fromChatId),
      messageId,
      caption: caption,
      parseMode: parseMode,
    );
  }

  // ==================== MEDIA GROUP ====================

  /// Send media group (album)
  Future<List<Message>> sendMediaGroup({
    required dynamic chatId,
    required List<InputMedia> media,
    bool? disableNotification,
    bool? protectContent,
    int? replyToMessageId,
  }) async {
    _ensureConnected();
    return await api.sendMediaGroup(
      ChatID(chatId),
      media,
      disableNotification: disableNotification,
      protectContent: protectContent,
      replyParameters: replyToMessageId != null
          ? ReplyParameters(messageId: replyToMessageId)
          : null,
    );
  }

  // ==================== CALLBACK QUERIES ====================

  /// Answer callback query
  Future<bool> answerCallbackQuery({
    required String callbackQueryId,
    String? text,
    bool? showAlert,
    String? url,
    int? cacheTime,
  }) async {
    return await api.answerCallbackQuery(
      callbackQueryId,
      text: text,
      showAlert: showAlert ?? false,
      url: url,
      cacheTime: cacheTime ?? 0,
    );
  }

  // ==================== INLINE QUERIES ====================

  /// Answer inline query
  Future<bool> answerInlineQuery({
    required String inlineQueryId,
    required List<InlineQueryResult> results,
    int? cacheTime,
    bool? isPersonal,
    String? nextOffset,
    InlineQueryResultsButton? button,
  }) async {
    return await api.answerInlineQuery(
      inlineQueryId,
      results,
      cacheTime: cacheTime,
      isPersonal: isPersonal,
      nextOffset: nextOffset,
      button: button,
    );
  }

  // ==================== FILE OPERATIONS ====================

  /// Get file information
  Future<dynamic> getFile({
    required String fileId,
  }) async {
    return await api.getFile(fileId);
  }

  /// Download file
  Future<File?> downloadFile({
    required String fileId,
    required String savePath,
  }) async {
    final file = await api.getFile(fileId);
    final downloadedFile = await file.download(path: savePath);
    return downloadedFile;
  }

  // ==================== CHAT MANAGEMENT ====================

  /// Get chat information
  Future<ChatFullInfo> getChat({
    required dynamic chatId,
  }) async {
    _ensureConnected();
    return await api.getChat(ChatID(chatId));
  }

  /// Get chat member
  Future<ChatMember> getChatMember({
    required dynamic chatId,
    required int userId,
  }) async {
    _ensureConnected();
    return await api.getChatMember(
      ChatID(chatId),
      userId,
    );
  }

  /// Get chat administrators
  Future<List<ChatMember>> getChatAdministrators({
    required dynamic chatId,
  }) async {
    _ensureConnected();
    return await api.getChatAdministrators(ChatID(chatId));
  }

  /// Get chat member count
  Future<int> getChatMemberCount({
    required dynamic chatId,
  }) async {
    _ensureConnected();
    return await api.getChatMemberCount(ChatID(chatId));
  }

  /// Ban chat member
  Future<bool> banChatMember({
    required dynamic chatId,
    required int userId,
    DateTime? untilDate,
    bool? revokeMessages,
  }) async {
    _ensureConnected();
    return await api.banChatMember(
      ChatID(chatId),
      userId,
      untilDate: untilDate,
      revokeMessages: revokeMessages,
    );
  }

  /// Unban chat member
  Future<bool> unbanChatMember({
    required dynamic chatId,
    required int userId,
    bool? onlyIfBanned,
  }) async {
    _ensureConnected();
    return await api.unbanChatMember(
      ChatID(chatId),
      userId,
      onlyIfBanned: onlyIfBanned,
    );
  }

  // ==================== BOT COMMANDS ====================

  /// Set bot commands
  Future<bool> setMyCommands({
    required List<BotCommand> commands,
    BotCommandScope? scope,
    String? languageCode,
  }) async {
    return await api.setMyCommands(
      commands,
      scope: scope,
      languageCode: languageCode,
    );
  }

  /// Get bot commands
  Future<List<BotCommand>> getMyCommands({
    BotCommandScope? scope,
    String? languageCode,
  }) async {
    return await api.getMyCommands(
      scope: scope,
      languageCode: languageCode,
    );
  }

  /// Delete bot commands
  Future<bool> deleteMyCommands({
    BotCommandScope? scope,
    String? languageCode,
  }) async {
    return await api.deleteMyCommands(
      scope: scope,
      languageCode: languageCode,
    );
  }

  // ==================== BOT INFO ====================

  /// Get bot information
  Future<User> getMe() async {
    return await api.getMe();
  }

  /// Set bot name
  Future<bool> setMyName({
    String? name,
    String? languageCode,
  }) async {
    return await api.setMyName(
      name: name,
      languageCode: languageCode,
    );
  }

  /// Get bot name
  Future<BotName> getMyName({
    String? languageCode,
  }) async {
    return await api.getMyName(
      languageCode: languageCode,
    );
  }

  /// Set bot description
  Future<bool> setMyDescription({
    String? description,
    String? languageCode,
  }) async {
    return await api.setMyDescription(
      description: description,
      languageCode: languageCode,
    );
  }

  /// Get bot description
  Future<BotDescription> getMyDescription({
    String? languageCode,
  }) async {
    return await api.getMyDescription(
      languageCode: languageCode,
    );
  }
}
