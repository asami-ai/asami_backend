// File: server/lib/src/services/messaging/whatsapp_service.dart

import 'dart:io';
import 'package:whatsapp/whatsapp.dart';

/// Complete WhatsApp service with proper response types
/// All methods match the whatsapp package exactly and return correct response types
class WhatsAppService {
  WhatsAppService._({
    required String accessToken,
    required String fromNumberId,
    this.webhookVerifyToken,
  }) : _whatsapp = WhatsApp(accessToken, fromNumberId);

  factory WhatsAppService({
    required String accessToken,
    required String fromNumberId,
    String? webhookVerifyToken,
  }) {
    return WhatsAppService._(
      accessToken: accessToken,
      fromNumberId: fromNumberId,
      webhookVerifyToken: webhookVerifyToken,
    );
  }

  final WhatsApp _whatsapp;
  final String? webhookVerifyToken;

  // ==================== BASIC MESSAGING ====================

  /// Generate WhatsApp direct link
  String getLink({
    required String phoneNumber,
    String? message,
    bool shortLink = false,
    List<String>? bold,
    List<String>? italic,
    List<String>? strikethrough,
    List<String>? monospace,
  }) {
    return _whatsapp.getLink(
      phoneNumber: phoneNumber,
      message: message,
      shortLink: shortLink,
      bold: bold,
      italic: italic,
      strikethrough: strikethrough,
      monospace: monospace,
    );
  }

  /// Send text message
  /// Returns: WhatsAppResponse with messageId and contactId
  Future<WhatsAppResponse> sendMessage({
    required String phoneNumber,
    required String text,
    bool previewUrl = false,
  }) async {
    return await _whatsapp.sendMessage(
      phoneNumber: phoneNumber,
      text: text,
      previewUrl: previewUrl,
    );
  }

  /// Send contact details
  /// Returns: WhatsAppResponse with messageId and contactId
  Future<WhatsAppResponse> sendContactDetails({
    required String phoneNumber,
    String? dateOfBirth,
    List<Map<String, dynamic>>? addresses,
    List<Map<String, dynamic>>? emails,
    Map<String, dynamic>? organization,
    required Map<String, dynamic> person,
    required List<Map<String, dynamic>> phones,
    List<Map<String, dynamic>>? urls,
  }) async {
    return await _whatsapp.sendContactDetails(
      phoneNumber: phoneNumber,
      dateOfBirth: dateOfBirth,
      addresses: addresses,
      emails: emails,
      organization: organization,
      person: person,
      phones: phones,
      urls: urls,
    );
  }

  /// Mark message as read
  /// Returns: WhatsAppSuccessResponse with success indicator
  Future<WhatsAppSuccessResponse> markAsRead({
    required String messageId,
  }) async {
    return await _whatsapp.markAsRead(messageId: messageId);
  }

  /// Send sticker by ID
  /// Returns: WhatsAppResponse with messageId and contactId
  Future<WhatsAppResponse> sendSticker({
    required String phoneNumber,
    required String stickerId,
  }) async {
    return await _whatsapp.sendSticker(
      phoneNumber: phoneNumber,
      stickerId: stickerId,
    );
  }

  /// Send reaction emoji
  /// Returns: WhatsAppResponse with messageId and contactId
  Future<WhatsAppResponse> sendReaction({
    required String phoneNumber,
    required String messageId,
    required String emoji,
  }) async {
    return await _whatsapp.sendReaction(
      phoneNumber: phoneNumber,
      messageId: messageId,
      emoji: emoji,
    );
  }

  /// Send typing indicator
  /// Returns: WhatsAppSuccessResponse with success indicator
  Future<WhatsAppSuccessResponse> sendTypingIndicator({
    required String messageId,
  }) async {
    return await _whatsapp.sendTypingIndicator(messageId: messageId);
  }

  // ==================== IMAGE METHODS ====================

  /// Send image by media ID
  /// Returns: WhatsAppResponse with messageId and contactId
  Future<WhatsAppResponse> sendImageById({
    required String phoneNumber,
    required String imageId,
    String? caption,
  }) async {
    return await _whatsapp.sendImageById(
      phoneNumber: phoneNumber,
      imageId: imageId,
      caption: caption,
    );
  }

  /// Send image by URL
  /// Returns: WhatsAppResponse with messageId and contactId
  Future<WhatsAppResponse> sendImageByUrl({
    required String phoneNumber,
    required String imageUrl,
    String? caption,
  }) async {
    return await _whatsapp.sendImageByUrl(
      phoneNumber: phoneNumber,
      imageUrl: imageUrl,
      caption: caption,
    );
  }

  // ==================== AUDIO METHODS ====================

  /// Send audio by media ID
  /// Returns: WhatsAppResponse with messageId and contactId
  Future<WhatsAppResponse> sendAudioById({
    required String phoneNumber,
    required String audioId,
  }) async {
    return await _whatsapp.sendAudioById(
      phoneNumber: phoneNumber,
      audioId: audioId,
    );
  }

  /// Send audio by URL
  /// Returns: WhatsAppResponse with messageId and contactId
  Future<WhatsAppResponse> sendAudioByUrl({
    required String phoneNumber,
    required String audioUrl,
  }) async {
    return await _whatsapp.sendAudioByUrl(
      phoneNumber: phoneNumber,
      audioUrl: audioUrl,
    );
  }

  // ==================== VIDEO METHODS ====================

  /// Send video by URL
  /// Returns: WhatsAppResponse with messageId and contactId
  Future<WhatsAppResponse> sendVideoByUrl({
    required String phoneNumber,
    required String videoUrl,
    String? caption,
  }) async {
    return await _whatsapp.sendVideoByUrl(
      phoneNumber: phoneNumber,
      videoUrl: videoUrl,
      caption: caption,
    );
  }

  // ==================== STICKER METHODS ====================

  /// Send sticker by URL
  /// Returns: WhatsAppResponse with messageId and contactId
  Future<WhatsAppResponse> sendStickerByUrl({
    required String phoneNumber,
    required String stickerUrl,
  }) async {
    return await _whatsapp.sendStickerByUrl(
      phoneNumber: phoneNumber,
      stickerUrl: stickerUrl,
    );
  }

  // ==================== DOCUMENT METHODS ====================

  /// Send document by URL
  /// Returns: WhatsAppResponse with messageId and contactId
  Future<WhatsAppResponse> sendDocumentByUrl({
    required String phoneNumber,
    required String documentUrl,
    String? caption,
    String? fileName,
  }) async {
    return await _whatsapp.sendDocumentByUrl(
      phoneNumber: phoneNumber,
      documentUrl: documentUrl,
      caption: caption,
      filename: fileName,
    );
  }

  // ==================== LOCATION METHODS ====================

  /// Request location from user
  /// Returns: WhatsAppResponse with messageId and contactId
  Future<WhatsAppResponse> sendLocationRequest({
    required String phoneNumber,
    required String text,
  }) async {
    return await _whatsapp.sendLocationRequest(
      phoneNumber: phoneNumber,
      text: text,
    );
  }

  /// Send location to user
  /// Returns: WhatsAppResponse with messageId and contactId
  Future<WhatsAppResponse> sendLocation({
    required String phoneNumber,
    required double latitude,
    required double longitude,
    String? name,
    String? address,
  }) async {
    return await _whatsapp.sendLocation(
      phoneNumber: phoneNumber,
      latitude: latitude,
      longitude: longitude,
      name: name,
      address: address,
    );
  }

  // ==================== MEDIA MANAGEMENT ====================

  /// Upload media by URL
  /// Returns: WhatsAppMediaUploadResponse with mediaId
  Future<WhatsAppMediaUploadResponse> uploadMediaFileByUrl({
    required String fileUrl,
    required String fileType,
  }) async {
    return await _whatsapp.uploadMediaFileByUrl(
      fileUrl: fileUrl,
      fileType: fileType,
    );
  }

  /// Get auto file type from URL/filename
  String getAutoFileType({required String filePath}) {
    return _whatsapp.getAutoFileType(filePath: filePath);
  }

  /// Get media details
  /// Returns: WhatsAppMediaGetResponse with URL, MIME type, size, SHA-256
  Future<WhatsAppMediaGetResponse> getMedia({
    required String mediaId,
  }) async {
    return await _whatsapp.getMedia(mediaId: mediaId);
  }

  /// Delete media
  /// Returns: WhatsAppMediaDeleteResponse with deletion status
  Future<WhatsAppMediaDeleteResponse> deleteMedia({
    required String mediaId,
  }) async {
    return await _whatsapp.deleteMedia(mediaId: mediaId);
  }

  // ==================== CATALOG & PRODUCTS ====================

  /// Send catalog message
  /// Returns: WhatsAppResponse with messageId and contactId
  Future<WhatsAppResponse> sendCatalogMessage({
    required String phoneNumber,
    required String productRetailerId,
    String? headerText,
    String? bodyText,
    String? footerText,
  }) async {
    return await _whatsapp.sendCatalogMessage(
      phoneNumber: phoneNumber,
      productRetailerId: productRetailerId,
      headerText: headerText,
      bodyText: bodyText,
      footerText: footerText,
    );
  }

  /// Send product message
  /// Returns: WhatsAppResponse with messageId and contactId
  Future<WhatsAppResponse> sendProductMessage({
    required String phoneNumber,
    required String catalogId,
    required String productRetailerId,
    String? bodyText,
    String? footerText,
  }) async {
    return await _whatsapp.sendProductMessage(
      phoneNumber: phoneNumber,
      catalogId: catalogId,
      productRetailerId: productRetailerId,
      bodyText: bodyText,
      footerText: footerText,
    );
  }

  // ==================== FLOWS ====================

  /// Send flow message
  /// Returns: WhatsAppResponse with messageId and contactId
  Future<WhatsAppResponse> sendFlowMessage({
    required String phoneNumber,
    required String flowToken,
    required String flowId,
    required String flowCta,
    required Map<String, dynamic> flowActionPayload,
    String? headerText,
    String? bodyText,
    String? footerText,
  }) async {
    return await _whatsapp.sendFlowMessage(
      phoneNumber: phoneNumber,
      flowToken: flowToken,
      flowId: flowId,
      flowCta: flowCta,
      flowActionPayload: flowActionPayload,
      headerText: headerText,
      bodyText: bodyText,
      footerText: footerText,
    );
  }

  // ==================== INTERACTIVE MESSAGES ====================

  /// Send call-to-action button
  /// Returns: WhatsAppResponse with messageId and contactId
  Future<WhatsAppResponse> sendCallToActionButton({
    required String phoneNumber,
    String? headerText,
    required String bodyText,
    String? footerText,
    required String buttonText,
    required String actionUrl,
  }) async {
    return await _whatsapp.sendCallToActionButton(
      phoneNumber: phoneNumber,
      headerText: headerText,
      bodyText: bodyText,
      footerText: footerText,
      buttonText: buttonText,
      actionUrl: actionUrl,
    );
  }

  /// Send interactive list
  /// Returns: WhatsAppResponse with messageId and contactId
  Future<WhatsAppResponse> sendInteractiveLists({
    required String phoneNumber,
    String? headerText,
    required String bodyText,
    String? footerText,
    required String buttonText,
    required List<Map<String, dynamic>> sections,
  }) async {
    return await _whatsapp.sendInteractiveLists(
      phoneNumber: phoneNumber,
      headerText: headerText,
      bodyText: bodyText,
      footerText: footerText,
      buttonText: buttonText,
      sections: sections,
    );
  }

  /// Send interactive reply buttons
  /// Returns: WhatsAppResponse with messageId and contactId
  Future<WhatsAppResponse> sendInteractiveReplyButton({
    required String phoneNumber,
    required Map<String, dynamic> headerInteractive,
    required String bodyText,
    required String footerText,
    required List<Map<String, dynamic>> interactiveReplyButtons,
  }) async {
    return await _whatsapp.sendInteractiveReplyButton(
      phoneNumber: phoneNumber,
      headerInteractive: headerInteractive,
      bodyText: bodyText,
      footerText: footerText,
      interactiveReplyButtons: interactiveReplyButtons,
    );
  }

  // ==================== USER MANAGEMENT ====================

  /// Block users
  /// Returns: WhatsAppBlockedUsersResponse with operation result
  Future<WhatsAppBlockedUsersResponse> blockUsers({
    required List<String> users,
  }) async {
    return await _whatsapp.blockUsers(users: users);
  }

  /// Unblock users
  /// Returns: WhatsAppBlockedUsersResponse with operation result
  Future<WhatsAppBlockedUsersResponse> unblockUsers({
    required List<String> users,
  }) async {
    return await _whatsapp.unblockUsers(users: users);
  }

  /// Get blocked users
  /// Returns: WhatsAppGetBlockedUsersResponse with list and cursors
  Future<WhatsAppGetBlockedUsersResponse> getBlockedUsers() async {
    return await _whatsapp.getBlockedUsers();
  }

  // ==================== ACCOUNT VERIFICATION ====================

  /// Request verification code
  /// Returns: WhatsAppResponse with response details
  Future<WhatsAppResponse> requestCode({
    required String codeMethod,
    required String language,
  }) async {
    return await _whatsapp.requestCode(
      codeMethod: codeMethod,
      language: language,
    );
  }

  /// Verify code
  /// Returns: WhatsAppResponse with response details
  Future<WhatsAppResponse> verifyCode({
    required int code,
  }) async {
    return await _whatsapp.verifyCode(code: code);
  }

  /// Register number
  /// Returns: WhatsAppSuccessResponse with success indicator
  Future<WhatsAppSuccessResponse> register({
    required int code,
  }) async {
    return await _whatsapp.register(pin: code);
  }

  /// Deregister number
  /// Returns: WhatsAppSuccessResponse with success indicator
  Future<WhatsAppSuccessResponse> deRegister() async {
    return await _whatsapp.deRegister();
  }

  // ==================== BUSINESS PROFILE ====================

  /// Get business profile
  /// Returns: WhatsAppBusinessAccountResponse with profile data
  Future<WhatsAppBusinessAccountResponse> getBusinessProfile({
    List<String>? scope,
  }) async {
    return await _whatsapp.getBusinessProfile(scope: scope);
  }

  /// Update business profile
  /// Returns: WhatsAppSuccessResponse with success indicator
  Future<WhatsAppSuccessResponse> updateBusinessProfile({
    String? about,
    String? address,
    String? description,
    String? industry,
    String? email,
    List<String>? websites,
    String? profilePictureHandle,
  }) async {
    return await _whatsapp.updateBusinessProfile(
      about: about,
      address: address,
      description: description,
      industry: industry,
      email: email,
      websites: websites,
      profilePictureHandle: profilePictureHandle,
    );
  }

  // ==================== ACCOUNT MIGRATION ====================

  /// Register account after migration
  /// Returns: WhatsAppSuccessResponse with success indicator
  Future<WhatsAppSuccessResponse> accountMigrationRegister({
    required String digitsPinCode,
    required String backupData,
    required String password,
  }) async {
    return await _whatsapp.accountMigrationRegister(
      digitsPinCode: digitsPinCode,
      backupData: backupData,
      password: password,
    );
  }

  // ==================== RESUMABLE UPLOADS ====================

  /// Create resumable upload session
  /// Returns: WhatsAppResumableUploadResponse with session details
  Future<WhatsAppResumableUploadResponse> createResumableUploadSession({
    required int fileLength,
    required String fileType,
    required String fileName,
  }) async {
    return await _whatsapp.createResumableUploadSession(
      fileLength: fileLength,
      fileType: fileType,
      fileName: fileName,
    );
  }

  /// Upload file via resumable session
  /// Returns: WhatsAppResumableUploadResponse with upload status
  Future<WhatsAppResumableUploadResponse> uploadResumableFile({
    required String uploadId,
    required File file,
    required String fileType,
  }) async {
    return await _whatsapp.uploadResumableFile(
      uploadId: uploadId,
      file: file,
      fileType: fileType,
    );
  }

  /// Upload file by URL via resumable session
  /// Returns: WhatsAppResumableUploadResponse with upload status
  Future<WhatsAppResumableUploadResponse> uploadResumableFileByUrl({
    required String uploadId,
    required String fileUrl,
    required String fileType,
  }) async {
    return await _whatsapp.uploadResumableFileByUrl(
      uploadId: uploadId,
      fileUrl: fileUrl,
      fileType: fileType,
    );
  }

  /// Get resumable upload session info
  /// Returns: WhatsAppResumableUploadResponse with session status
  Future<WhatsAppResumableUploadResponse> getResumableUploadSession({
    required String uploadId,
  }) async {
    return await _whatsapp.getResumableUploadSession(uploadId: uploadId);
  }

  /// Create and upload resumable file in one call
  /// Returns: WhatsAppResumableUploadResponse with final upload result
  Future<WhatsAppResumableUploadResponse> createUploadResumableFile({
    required int fileLength,
    File? file,
    required String fileUrl,
    required String fileType,
    required String fileName,
  }) async {
    return await _whatsapp.createUploadResumableFile(
      fileLength: fileLength,
      file: file,
      fileUrl: fileUrl,
      fileType: fileType,
      fileName: fileName,
    );
  }

  // ==================== REPLY TO MESSAGE ====================

  /// Reply to a specific message with text
  /// Returns: WhatsAppResponse with messageId and contactId
  Future<WhatsAppResponse> replyText({
    required String phoneNumber,
    required String messageId,
    required String text,
    bool previewUrl = false,
  }) async {
    return await _whatsapp.reply(
      phoneNumber: phoneNumber,
      messageId: messageId,
      reply: {
        "type": "text",
        "text": {"preview_url": previewUrl, "body": text}
      },
    );
  }

  /// Reply with image by ID
  /// Returns: WhatsAppResponse with messageId and contactId
  Future<WhatsAppResponse> replyImageById({
    required String phoneNumber,
    required String messageId,
    required String imageId,
  }) async {
    return await _whatsapp.reply(
      phoneNumber: phoneNumber,
      messageId: messageId,
      reply: {
        "type": "image",
        "image": {"id": imageId}
      },
    );
  }

// reply().imageById(imageId)
  /// Reply with image by URL
  /// Returns: WhatsAppResponse with messageId and contactId
  Future<WhatsAppResponse> replyImageByUrl({
    required String phoneNumber,
    required String messageId,
    required String imageUrl,
  }) async {
    return await _whatsapp.reply(
      phoneNumber: phoneNumber,
      messageId: messageId,
      reply: {
        "type": "image",
        "image": {"link": imageUrl}
      },
    );
  }

  // ==================== CUSTOM REQUEST ====================

  /// Send custom API request
  /// Returns: Raw response
  Future<dynamic> sendCustomRequest({
    required String path,
    required Map<String, dynamic> payload,
  }) async {
    return await _whatsapp.sendCustomRequest(
      path: path,
      payload: payload,
    );
  }

  // ==================== TEMPLATES (IMPORTANT) ====================

  /// Send template message
  /// Returns: WhatsAppResponse with messageId and contactId
  Future<WhatsAppResponse> sendTemplate({
    required String phoneNumber,
    required String templateName,
    required String languageCode,
    List<Map<String, dynamic>>? components,
  }) async {
    return await _whatsapp.sendCustomRequest(
      path: '/messages',
      payload: {
        'messaging_product': 'whatsapp',
        'to': phoneNumber,
        'type': 'template',
        'template': {
          'name': templateName,
          'language': {
            'code': languageCode,
          },
          if (components != null) 'components': components,
        },
      },
    );
  }

  // ==================== UTILITY METHODS ====================

  void dispose() {
    // _whatsapp.dispose();
    print('🧹 WhatsAppService disposed');
  }
}
