// File: server/lib/src/services/messaging/messaging_service_interface.dart

import '../../generated/protocol.dart';
import 'messaging_result.dart';

/// Abstract interface for all messaging platforms with full feature support
abstract class IMessagingService {
  /// Get platform type
  PlatformType get platformType;

  // ==================== BASIC MESSAGING ====================

  /// Send a text message
  Future<MessagingResult> sendText({
    required String recipient,
    required String text,
    bool? previewUrl,
    String? parseMode, // markdown, html (platform-specific)
  });

  /// Send a media message (image, video, document, audio, sticker)
  Future<MessagingResult> sendMedia({
    required String recipient,
    required String mediaUrl,
    required MediaType mediaType,
    String? caption,
  });

  // ==================== INTERACTIVE MESSAGES ====================

  /// Send interactive buttons
  /// - WhatsApp: Reply buttons (max 3) or CTA button (1 with URL)
  /// - Telegram: Inline keyboard (unlimited)
  Future<MessagingResult> sendButtons({
    required String recipient,
    required String bodyText,
    required List<MessageButton> buttons,
    String? headerText,
    String? footerText,
    Map<String, dynamic>? headerInteractive
  });

  /// Send interactive list
  /// - WhatsApp: Interactive list (max 10 sections)
  /// - Telegram: Inline keyboard grouped by sections
  Future<MessagingResult> sendList({
    required String recipient,
    required String bodyText,
    required String buttonText,
    required List<ListSection> sections,
    String? headerText,
    String? footerText,
  });

  // ==================== LOCATION ====================

  /// Send location coordinates
  Future<MessagingResult> sendLocation({
    required String recipient,
    required double latitude,
    required double longitude,
    String? name,
    String? address,
  });

  // ==================== MESSAGE ACTIONS ====================

  /// Mark message as read/seen
  /// - WhatsApp: Sends read receipt
  /// - Telegram: Not supported (returns true)
  Future<bool> markAsRead({required String messageId});

  /// Reply to a specific message (contextual reply)
  Future<MessagingResult> replyToMessage({
    required String recipient,
    required String messageId,
    required String text,
    bool? previewUrl,
  });

  /// Send typing/recording indicator
  /// - WhatsApp: typing only
  /// - Telegram: typing, recording, uploading (photo/video/document)
  Future<bool> sendTypingIndicator({
    required String recipient,
    TypingIndicatorType? type,
  });

  // ==================== LIFECYCLE ====================

  /// Dispose resources
  void dispose();
}

/// Extended interface for WhatsApp-specific features
abstract class IWhatsAppMessagingService extends IMessagingService {
  /// Send WhatsApp template message (pre-approved templates)
  /// Templates must be created in WhatsApp Business Manager
  Future<MessagingResult> sendTemplate({
    required String recipient,
    required String templateName,
    required String languageCode,
    List<Map<String, dynamic>>? components, // header, body, buttons
  });

  /// Send WhatsApp Flow message (interactive forms)
  Future<MessagingResult> sendFlow({
    required String recipient,
    required String flowToken,
    required String flowId,
    required String flowCta,
    required String flowActionPayload,
    String? headerText,
    String? bodyText,
    String? footerText,
  });

  /// Send catalog message
  Future<MessagingResult> sendCatalog({
    required String recipient,
    required String productRetailerId,
    String? headerText,
    String? bodyText,
    String? footerText,
  });

  /// Send product message
  Future<MessagingResult> sendProduct({
    required String recipient,
    required String catalogId,
    required String productRetailerId,
    String? bodyText,
    String? footerText,
  });
}

/// Extended interface for Telegram-specific features
abstract class ITelegramMessagingService extends IMessagingService {
  /// Send poll (quiz or regular)
  Future<MessagingResult> sendPoll({
    required String recipient,
    required String question,
    required List<String> options,
    bool? isAnonymous,
    bool? allowsMultipleAnswers,
    int? correctOptionId, // For quiz polls
  });

  /// Send dice/game (🎲, 🎯, 🏀, ⚽, 🎰, 🎳)
  Future<MessagingResult> sendDice({
    required String recipient,
    String emoji, // dice, darts, basketball, football, slot_machine, bowling
  });

  /// Send contact (vCard)
  Future<MessagingResult> sendContact({
    required String recipient,
    required String phoneNumber,
    required String firstName,
    String? lastName,
    String? vcard,
  });

  /// Send venue
  Future<MessagingResult> sendVenue({
    required String recipient,
    required double latitude,
    required double longitude,
    required String title,
    required String address,
    String? foursquareId,
  });

  /// Send media group (album of photos/videos)
  Future<MessagingResult> sendMediaGroup({
    required String recipient,
    required List<MediaGroupItem> media,
  });

  /// Edit message text
  Future<MessagingResult> editMessageText({
    required String recipient,
    required String messageId,
    required String newText,
    String? parseMode,
  });

  /// Edit message reply markup (buttons)
  Future<MessagingResult> editMessageButtons({
    required String recipient,
    required String messageId,
    required List<MessageButton> buttons,
  });

  /// Delete message
  Future<bool> deleteMessage({
    required String recipient,
    required String messageId,
  });
}

// ==================== DATA MODELS ====================

/// Media type enum for cross-platform compatibility
enum MediaType {
  image,
  video,
  audio,
  document,
  sticker,
}

/// Typing indicator types
enum TypingIndicatorType {
  typing,
  recording,
  uploadingPhoto,
  uploadingVideo,
  uploadingDocument,
}

/// Unified button model
class MessageButton {
  final String id;
  final String text;
  final String? url; // For CTA/URL buttons
  final String? callbackData; // For Telegram callback buttons
  final String? phoneNumber; // For call buttons
  
  MessageButton({
    required this.id,
    required this.text,
    this.url,
    this.callbackData,
    this.phoneNumber,
  });

  /// Create a URL button
  factory MessageButton.url(String text, String url) {
    return MessageButton(
      id: 'url_${DateTime.now().millisecondsSinceEpoch}',
      text: text,
      url: url,
    );
  }

  /// Create a callback button
  factory MessageButton.callback(String text, String callbackData) {
    return MessageButton(
      id: callbackData,
      text: text,
      callbackData: callbackData,
    );
  }

  /// Create a call button
  factory MessageButton.call(String text, String phoneNumber) {
    return MessageButton(
      id: 'call_${DateTime.now().millisecondsSinceEpoch}',
      text: text,
      phoneNumber: phoneNumber,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'text': text,
    if (url != null) 'url': url,
    if (callbackData != null) 'callback_data': callbackData,
    if (phoneNumber != null) 'phone_number': phoneNumber,
  };
}

/// Unified list section model
class ListSection {
  final String title;
  final List<ListItem> rows;

  ListSection({
    required this.title,
    required this.rows,
  });

  Map<String, dynamic> toJson() => {
    'title': title,
    'rows': rows.map((r) => r.toJson()).toList(),
  };
}

/// Unified list item model
class ListItem {
  final String id;
  final String title;
  final String? description;

  ListItem({
    required this.id,
    required this.title,
    this.description,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    if (description != null) 'description': description,
  };
}

/// Media group item (for Telegram albums)
class MediaGroupItem {
  final MediaType type; // image or video only
  final String url;
  final String? caption;

  MediaGroupItem({
    required this.type,
    required this.url,
    this.caption,
  });

  Map<String, dynamic> toJson() => {
    'type': type.name,
    'url': url,
    if (caption != null) 'caption': caption,
  };
}

/// Template component for WhatsApp templates
class TemplateComponent {
  final String type; // header, body, button
  final Map<String, dynamic> parameters;

  TemplateComponent({
    required this.type,
    required this.parameters,
  });

  Map<String, dynamic> toJson() => {
    'type': type,
    'parameters': parameters,
  };
}

// ==================== FEATURE AVAILABILITY ====================

/// Check which features are supported by each platform
class PlatformFeatures {
  static const whatsappFeatures = {
    'templates': true, // ✅ Pre-approved message templates
    'flows': true, // ✅ Interactive forms
    'lists': true, // ✅ Up to 10 sections
    'buttons': true, // ✅ Up to 3 reply buttons or 1 CTA
    'location': true, // ✅ Send/request location
    'contacts': true, // ✅ Send contact vCard
    'catalogs': true, // ✅ Product catalogs
    'media': true, // ✅ Image, video, audio, document
    'stickers': true, // ✅ Stickers
    'reactions': true, // ✅ Emoji reactions
    'typing': true, // ✅ Typing indicator
    'readReceipts': true, // ✅ Mark as read
    'mediaGroups': false, // ❌ No albums
    'polls': false, // ❌ No polls
    'editMessages': false, // ❌ Cannot edit sent messages
    'deleteMessages': false, // ❌ Cannot delete sent messages
    'forwardMessages': false, // ❌ Cannot forward programmatically
  };

  static const telegramFeatures = {
    'templates': false, // ❌ No template system
    'flows': false, // ❌ No flow system (use inline keyboards)
    'lists': false, // ❌ No native lists (use inline keyboards)
    'buttons': true, // ✅ Unlimited inline/reply buttons
    'location': true, // ✅ Send location
    'contacts': true, // ✅ Send contact
    'catalogs': false, // ❌ No native catalog
    'media': true, // ✅ Image, video, audio, document, voice
    'stickers': true, // ✅ Stickers and custom sticker packs
    'reactions': false, // ❌ Bots cannot send reactions
    'typing': true, // ✅ Multiple typing indicators
    'readReceipts': false, // ❌ Bots cannot send read receipts
    'mediaGroups': true, // ✅ Albums up to 10 items
    'polls': true, // ✅ Regular and quiz polls
    'editMessages': true, // ✅ Edit sent messages
    'deleteMessages': true, // ✅ Delete sent messages
    'forwardMessages': true, // ✅ Forward messages
    'games': true, // ✅ Send dice/games
    'invoices': true, // ✅ Payment system
  };

  static bool isFeatureSupported(PlatformType platform, String feature) {
    switch (platform) {
      case PlatformType.whatsapp:
        return whatsappFeatures[feature] ?? false;
      case PlatformType.telegram:
        return telegramFeatures[feature] ?? false;
      default:
        return false;
    }
  }
}