
import 'package:asami_server/src/services/messaging/messaging_result.dart';
import 'package:asami_server/utils/logger/asami_logger.dart';

import '../../../generated/protocol.dart';
import '../messaging_service_interface.dart';
import 'whatsapp_service.dart';
import 'whatsapp_response_types.dart';

/// Adapter for WhatsApp Service implementing unified interface
class WhatsAppServiceAdapter implements IMessagingService {
  WhatsAppServiceAdapter(this._whatsappService);

  final WhatsAppService _whatsappService;

  @override
  PlatformType get platformType => PlatformType.whatsapp;

  // ==================== BASIC MESSAGING ====================

  @override
  Future<MessagingResult> sendText({
    required String recipient,
    required String text,
    bool? previewUrl,
    String? parseMode, // Ignored for WhatsApp
  }) async {
    try {
      final response = await _whatsappService.sendMessage(
        phoneNumber: recipient,
        text: text,
        previewUrl: previewUrl ?? false,
      );

      return _toMessagingResult(response, recipient);
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
      dynamic response;

      switch (mediaType) {
        case MediaType.image:
          response = await _whatsappService.sendImageByUrl(
            phoneNumber: recipient,
            imageUrl: mediaUrl,
            caption: caption,
          );
          break;
        case MediaType.video:
          response = await _whatsappService.sendVideoByUrl(
            phoneNumber: recipient,
            videoUrl: mediaUrl,
            caption: caption,
          );
          break;
        case MediaType.audio:
          response = await _whatsappService.sendAudioByUrl(
            phoneNumber: recipient,
            audioUrl: mediaUrl,
          );
          break;
        case MediaType.document:
          response = await _whatsappService.sendDocumentByUrl(
            phoneNumber: recipient,
            documentUrl: mediaUrl,
            caption: caption,
          );
          break;
        case MediaType.sticker:
          response = await _whatsappService.sendStickerByUrl(
            phoneNumber: recipient,
            stickerUrl: mediaUrl,
          );
          break;
      }

      return _toMessagingResult(response, recipient);
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
      // Check if it's a CTA button (has URL)
      if (buttons.length == 1 && buttons.first.url != null) {
        final response = await _whatsappService.sendCallToActionButton(
          phoneNumber: recipient,
          headerText: headerText,
          bodyText: bodyText,
          footerText: footerText,
          buttonText: buttons.first.text,
          actionUrl: buttons.first.url!,
        );
        return _toMessagingResult(response, recipient);
      }

      // Reply buttons (max 3 buttons for WhatsApp)
      if (buttons.length > 3) {
        return MessagingResult.error(
          message: 'WhatsApp supports maximum 3 reply buttons',
          platform: platformType,
        );
      }

      final interactiveButtons = buttons.map((btn) => {
        'type': 'reply',
        'reply': {
          'id': btn.id,
          'title': btn.text,
        }
      }).toList();

      final response = await _whatsappService.sendInteractiveReplyButton(
        phoneNumber: recipient,
        bodyText: bodyText,
        footerText: footerText ?? headerText ?? '',
        interactiveReplyButtons: interactiveButtons,
        headerInteractive: headerInteractive!
      );
      Log.info(response.getErrorMessage().toString());
      return _toMessagingResult(response, recipient);
    } catch (e) {
      Log.error(e.toString(),);
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
      // WhatsApp supports max 10 sections
      if (sections.length > 10) {
        return MessagingResult.error(
          message: 'WhatsApp supports maximum 10 sections',
          platform: platformType,
        );
      }

      final whatsappSections = sections.map((section) => {
        'title': section.title,
        'rows': section.rows.map((row) => {
          'id': row.id,
          'title': row.title,
          if (row.description != null) 'description': row.description,
        }).toList(),
      }).toList();

      final response = await _whatsappService.sendInteractiveLists(
        phoneNumber: recipient,
        headerText: headerText,
        bodyText: bodyText,
        footerText: footerText,
        buttonText: buttonText,
        sections: whatsappSections,
      );

      return _toMessagingResult(response, recipient);
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
      final response = await _whatsappService.sendLocation(
        phoneNumber: recipient,
        latitude: latitude,
        longitude: longitude,
        name: name,
        address: address,
      );

      return _toMessagingResult(response, recipient);
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
    try {
      final response = await _whatsappService.markAsRead(messageId: messageId);
      return response.isWhatsAppSuccess();
    } catch (e) {
      print('⚠️ Failed to mark as read: $e');
      return false;
    }
  }

  @override
  Future<MessagingResult> replyToMessage({
    required String recipient,
    required String messageId,
    required String text,
    bool? previewUrl,
  }) async {
    try {
      final response = await _whatsappService.replyText(
        phoneNumber: recipient,
        messageId: messageId,
        text: text,
        previewUrl: previewUrl ?? false,
      );

      return _toMessagingResult(response, recipient);
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
      // WhatsApp doesn't support different typing types
      final response = await _whatsappService.sendTypingIndicator(
        messageId: recipient,
      );
      return response.isWhatsAppSuccess();
    } catch (e) {
      print('⚠️ Failed to send typing indicator: $e');
      return false;
    }
  }

  // ==================== TEMPLATES (NEW) ====================

  /// Send WhatsApp template message
  Future<MessagingResult> sendTemplate({
    required String recipient,
    required String templateName,
    required String languageCode,
    List<Map<String, dynamic>>? components,
  }) async {
    try {
      final response = await _whatsappService.sendTemplate(
        phoneNumber: recipient,
        templateName: templateName,
        languageCode: languageCode,
        components: components,
      );

      return _toMessagingResult(response, recipient);
    } catch (e) {
      return MessagingResult.error(
        message: e.toString(),
        platform: platformType,
      );
    }
  }

  /// Send WhatsApp Flow message
  Future<MessagingResult> sendFlow({
    required String recipient,
    required String flowToken,
    required String flowId,
    required String flowCta,
    required Map<String,String> flowActionPayload,
    String? headerText,
    String? bodyText,
    String? footerText,
  }) async {
    try {
      final response = await _whatsappService.sendFlowMessage(
        phoneNumber: recipient,
        flowToken: flowToken,
        flowId: flowId,
        flowCta: flowCta,
        flowActionPayload: flowActionPayload,
        headerText: headerText,
        bodyText: bodyText,
        footerText: footerText,
      );

      return _toMessagingResult(response, recipient);
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
    _whatsappService.dispose();
  }

  // ==================== HELPER METHODS ====================

  /// Convert WhatsApp package response to unified MessagingResult
  MessagingResult _toMessagingResult(dynamic response, String recipient) {
    try {
      if (response.isWhatsAppSuccess()) {
        return MessagingResult.success(
          messageId: response.getWhatsAppMessageId() ?? 'unknown',
          recipient: recipient,
          platform: platformType,
          metadata: {
            'contactId': response.getWhatsAppContactId(),
            'fullResponse': response.getWhatsAppFullResponse(),
          },
        );
      } else {
        return MessagingResult.error(
          message: response.getWhatsAppErrorMessage() ?? 'Unknown error',
          platform: platformType,
          errorCode: response.getWhatsAppErrorCode()?.toString(),
          errorType: response.getWhatsAppErrorType(),
          metadata: {
            'fullResponse': response.getWhatsAppFullResponse(),
          },
        );
      }
    } catch (e) {
      return MessagingResult.error(
        message: 'Failed to parse response: $e',
        platform: platformType,
      );
    }
  }
}
