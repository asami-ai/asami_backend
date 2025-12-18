import 'package:televerse/telegram.dart';
import 'package:televerse/televerse.dart';
import '../../../generated/protocol.dart' hide Message;
import '../messaging_result.dart';
import '../messaging_service_interface.dart';
import 'telegram_service.dart';

/// Adapter for Telegram Service implementing unified interface
class TelegramServiceAdapter implements IMessagingService {
  TelegramServiceAdapter(this._telegramService);

  final TelegramService _telegramService;

  @override
  PlatformType get platformType => PlatformType.telegram;

  // ==================== BASIC MESSAGING ====================

  @override
  Future<MessagingResult> sendText({
    required String recipient,
    required String text,
    bool? previewUrl,
    String? parseMode,
  }) async {
    try {
      final message = await _telegramService.sendTextMessage(
        chatId: int.parse(recipient),
        text: text,
        parseMode: _convertParseMode(parseMode),
        disableWebPagePreview: previewUrl == false,
      );

      return MessagingResult.success(
        messageId: message.messageId.toString(),
        recipient: recipient,
        platform: platformType,
        metadata: {
          'date': message.date.toString(),
          'chat_id': message.chat.id.toString(),
        },
      );
    } catch (e) {
      return MessagingResult.error(
        message: e.toString(),
        platform: platformType,
      );
    }
  }

  @override
  Future<MessagingResult> sendMedia({
    required String recipient,
    required String mediaUrl,
    required MediaType mediaType,
    String? caption,
  }) async {
    try {
      Message message;

      switch (mediaType) {
        case MediaType.image:
          message = await _telegramService.sendPhoto(
            chatId: int.parse(recipient),
            photoUrl: mediaUrl,
            caption: caption,
          );
          break;
        case MediaType.video:
          message = await _telegramService.sendVideo(
            chatId: int.parse(recipient),
            videoUrl: mediaUrl,
            caption: caption,
          );
          break;
        case MediaType.audio:
          message = await _telegramService.sendAudio(
            chatId: int.parse(recipient),
            audioUrl: mediaUrl,
            caption: caption,
          );
          break;
        case MediaType.document:
          message = await _telegramService.sendDocument(
            chatId: int.parse(recipient),
            documentUrl: mediaUrl,
            caption: caption,
          );
          break;
        case MediaType.sticker:
          message = await _telegramService.sendSticker(
            chatId: int.parse(recipient),
            stickerUrl: mediaUrl,
          );
          break;
      }

      return MessagingResult.success(
        messageId: message.messageId.toString(),
        recipient: recipient,
        platform: platformType,
      );
    } catch (e) {
      return MessagingResult.error(
        message: e.toString(),
        platform: platformType,
      );
    }
  }

  // ==================== INTERACTIVE MESSAGES ====================

  @override
  Future<MessagingResult> sendButtons({
    required String recipient,
    required String bodyText,
    required List<MessageButton> buttons,
    String? headerText,
    String? footerText,
    Map<String, dynamic>? headerInteractive
  }) async {
    try {
      final fullText = _combineText(headerText, bodyText, footerText);

      // Convert to Telegram inline keyboard
      List<List<InlineKeyboardButton>> keyboard = [];

      for (var btn in buttons) {
        if (btn.url != null) {
          keyboard.add([InlineKeyboardButton(text: btn.text, url: btn.url!)]);
        } else {
          keyboard.add([
            InlineKeyboardButton(
              text: btn.text,
              callbackData: btn.callbackData ?? btn.id,
            )
          ]);
        }

        // Reorganize keyboard into rows of 2
        // List<List<InlineKeyboardButton>> reorganizedKeyboard = [];
        // for (int i = 0; i < keyboard.length; i += 2) {
        // if (i + 1 < keyboard.length) {
        //   reorganizedKeyboard.add([keyboard[i][0], keyboard[i + 1][0]]);
        // } else {
        //   reorganizedKeyboard.add([keyboard[i][0]]);
        // }
        // }
        // keyboard = reorganizedKeyboard;
      }

      final message = await _telegramService.sendInlineKeyboard(
        chatId: int.parse(recipient),
        text: fullText,
        keyboard: keyboard,
        parseMode: ParseMode.markdown,
      );

      return MessagingResult.success(
        messageId: message.messageId.toString(),
        recipient: recipient,
        platform: platformType,
      );
    } catch (e) {
      return MessagingResult.error(
        message: e.toString(),
        platform: platformType,
      );
    }
  }

  @override
  Future<MessagingResult> sendList({
    required String recipient,
    required String bodyText,
    required String buttonText,
    required List<ListSection> sections,
    String? headerText,
    String? footerText,
  }) async {
    try {
      // Telegram doesn't have native lists, convert to inline keyboard
      // Convert to Telegram inline keyboard
      List<List<InlineKeyboardButton>> keyboard = [];
      final fullText = _combineText(headerText, bodyText, footerText);

      for (var section in sections) {
        // Add section title as a label (non-clickable)
        keyboard.add([
          InlineKeyboardButton(
            text: '📂 ${section.title}',
            callbackData: 'section_${section.title}',
          ),
        ]);

        // Add items
        for (var item in section.rows) {
          keyboard.add([
            InlineKeyboardButton(
              text: item.title,
              callbackData: item.id,
            ),
          ]);
        }
      }

      final message = await _telegramService.sendInlineKeyboard(
        chatId: int.parse(recipient),
        text: fullText,
        keyboard: keyboard,
        parseMode: ParseMode.markdown,
      );

      return MessagingResult.success(
        messageId: message.messageId.toString(),
        recipient: recipient,
        platform: platformType,
      );
    } catch (e) {
      return MessagingResult.error(
        message: e.toString(),
        platform: platformType,
      );
    }
  }

  // ==================== LOCATION ====================

  @override
  Future<MessagingResult> sendLocation({
    required String recipient,
    required double latitude,
    required double longitude,
    String? name,
    String? address,
  }) async {
    try {
      final message = await _telegramService.sendLocation(
        chatId: int.parse(recipient),
        latitude: latitude,
        longitude: longitude,
      );

      // If name/address provided, send as separate message
      if (name != null || address != null) {
        final locationText = [
          if (name != null) '📍 *$name*',
          if (address != null) address,
        ].join('\n');

        await _telegramService.sendTextMessage(
          chatId: int.parse(recipient),
          text: locationText,
          parseMode: ParseMode.markdown,
        );
      }

      return MessagingResult.success(
        messageId: message.messageId.toString(),
        recipient: recipient,
        platform: platformType,
      );
    } catch (e) {
      return MessagingResult.error(
        message: e.toString(),
        platform: platformType,
      );
    }
  }

  // ==================== MESSAGE ACTIONS ====================

  @override
  Future<bool> markAsRead({required String messageId}) async {
    // Telegram doesn't have read receipts for bots
    return true;
  }

  @override
  Future<MessagingResult> replyToMessage({
    required String recipient,
    required String messageId,
    required String text,
    bool? previewUrl,
  }) async {
    try {
      final message = await _telegramService.sendTextMessage(
        chatId: int.parse(recipient),
        text: text,
        replyToMessageId: int.tryParse(messageId),
        disableWebPagePreview: previewUrl == false,
      );

      return MessagingResult.success(
        messageId: message.messageId.toString(),
        recipient: recipient,
        platform: platformType,
      );
    } catch (e) {
      return MessagingResult.error(
        message: e.toString(),
        platform: platformType,
      );
    }
  }

  @override
  Future<bool> sendTypingIndicator({
    required String recipient,
    TypingIndicatorType? type,
  }) async {
    try {
      final action = _convertTypingType(type);
      return await _telegramService.sendChatAction(
        chatId: int.parse(recipient),
        action: action,
      );
    } catch (e) {
      print('⚠️ Failed to send typing indicator: $e');
      return false;
    }
  }

  // ==================== TELEGRAM-SPECIFIC (NEW) ====================

  /// Send poll
  Future<MessagingResult> sendPoll({
    required String recipient,
    required String question,
    required List<String> options,
    bool? isAnonymous,
    bool? allowsMultipleAnswers,
    int? correctOptionId,
  }) async {
    try {
      final inputOptions =
          options.map((opt) => InputPollOption(text: opt)).toList();

      final message = await _telegramService.sendPoll(
        chatId: int.parse(recipient),
        question: question,
        options: inputOptions,
        isAnonymous: isAnonymous,
        allowsMultipleAnswers: allowsMultipleAnswers,
        correctOptionId: correctOptionId,
      );

      return MessagingResult.success(
        messageId: message.messageId.toString(),
        recipient: recipient,
        platform: platformType,
      );
    } catch (e) {
      return MessagingResult.error(
        message: e.toString(),
        platform: platformType,
      );
    }
  }

  // ==================== LIFECYCLE ====================

  @override
  void dispose() {
    _telegramService.dispose();
  }

  // ==================== HELPER METHODS ====================

  ParseMode? _convertParseMode(String? mode) {
    if (mode == null) return null;
    switch (mode.toLowerCase()) {
      case 'markdown':
        return ParseMode.markdown;
      case 'html':
        return ParseMode.html;
      default:
        return null;
    }
  }

  ChatAction _convertTypingType(TypingIndicatorType? type) {
    switch (type) {
      case TypingIndicatorType.recording:
        return ChatAction.recordVoice;
      case TypingIndicatorType.uploadingPhoto:
        return ChatAction.uploadPhoto;
      case TypingIndicatorType.uploadingVideo:
        return ChatAction.uploadVideo;
      case TypingIndicatorType.uploadingDocument:
        return ChatAction.uploadDocument;
      case TypingIndicatorType.typing:
      default:
        return ChatAction.typing;
    }
  }

  String _combineText(String? header, String body, String? footer) {
    final parts = <String>[];
    if (header != null && header.isNotEmpty) {
      parts.add('*$header*\n');
    }
    parts.add(body);
    if (footer != null && footer.isNotEmpty) {
      parts.add('\n\n_${footer}_');
    }
    return parts.join();
  }
}
