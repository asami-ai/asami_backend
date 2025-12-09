// File: server/lib/src/services/messaging/whatsapp_response_types.dart

/// Type aliases for WhatsApp package responses
/// These match the actual response types from the whatsapp package
library;


// Base response class - all responses extend this
typedef WhatsAppResponse = dynamic; // From package has: isSuccess(), getMessageId(), getContactId(), getErrorMessage(), getErrorCode(), getErrorType(), getFullResponse()

typedef WhatsAppSuccessResponse = dynamic; // From package has: isSuccess(), getFullResponse(), getErrorMessage(), getErrorCode(), getErrorType()

typedef WhatsAppMediaUploadResponse = dynamic; // From package has: isSuccess(), getMediaId(), getFullResponse(), getErrorMessage(), getErrorCode(), getErrorType()

typedef WhatsAppMediaGetResponse = dynamic; // From package has: isSuccess(), getMediaUrl(), getMediaMimeType(), getMediaSha256(), getMediaFileSize(), getFullResponse()

typedef WhatsAppMediaDeleteResponse = dynamic; // From package has: isSuccess(), getFullResponse(), getErrorMessage()

typedef WhatsAppBusinessAccountResponse = dynamic; // From package has: isSuccess(), getAbout(), getAddress(), getDescription(), getEmail(), getProfilePictureUrl(), getVertical(), getWebsites(), getFullResponse()

typedef WhatsAppBlockedUsersResponse = dynamic; // From package has: isSuccess(), isSomeSuccess(), getUsersList(), getFullResponse()

typedef WhatsAppGetBlockedUsersResponse = dynamic; // From package has: isSuccess(), getUsersList(), getCursorBefore(), getCursorAfter(), getFullResponse()

typedef WhatsAppResumableUploadResponse = dynamic; // From package has: isSuccess(), getId(), getH(), getFileOffset(), getFullResponse()

/// Helper extension to safely extract data from WhatsApp responses
extension WhatsAppResponseExtensions on dynamic {
  /// Check if the operation was successful
  bool isWhatsAppSuccess() {
    try {
      return this.isSuccess() == true;
    } catch (e) {
      return false;
    }
  }

  /// Get message ID safely
  String? getWhatsAppMessageId() {
    try {
      return this.getMessageId() as String?;
    } catch (e) {
      return null;
    }
  }

  /// Get contact ID safely
  String? getWhatsAppContactId() {
    try {
      return this.getContactId() as String?;
    } catch (e) {
      return null;
    }
  }

  /// Get error message safely
  String? getWhatsAppErrorMessage() {
    try {
      return this.getErrorMessage() as String?;
    } catch (e) {
      return null;
    }
  }

  /// Get error code safely
  int? getWhatsAppErrorCode() {
    try {
      return this.getErrorCode() as int?;
    } catch (e) {
      return null;
    }
  }

  /// Get error type safely
  String? getWhatsAppErrorType() {
    try {
      return this.getErrorType() as String?;
    } catch (e) {
      return null;
    }
  }

  /// Get full response safely
  Map<String, dynamic>? getWhatsAppFullResponse() {
    try {
      return this.getFullResponse() as Map<String, dynamic>?;
    } catch (e) {
      return null;
    }
  }

  /// Get media ID safely (for media responses)
  String? getWhatsAppMediaId() {
    try {
      return this.getMediaId() as String?;
    } catch (e) {
      return null;
    }
  }

  /// Get media URL safely (for media get responses)
  String? getWhatsAppMediaUrl() {
    try {
      return this.getMediaUrl() as String?;
    } catch (e) {
      return null;
    }
  }

  /// Get media MIME type safely
  String? getWhatsAppMediaMimeType() {
    try {
      return this.getMediaMimeType() as String?;
    } catch (e) {
      return null;
    }
  }

  /// Get media SHA256 safely
  String? getWhatsAppMediaSha256() {
    try {
      return this.getMediaSha256() as String?;
    } catch (e) {
      return null;
    }
  }

  /// Get media file size safely
  int? getWhatsAppMediaFileSize() {
    try {
      return this.getMediaFileSize() as int?;
    } catch (e) {
      return null;
    }
  }

  /// Get business profile about
  String getWhatsAppAbout() {
    try {
      return this.getAbout() as String? ?? '';
    } catch (e) {
      return '';
    }
  }

  /// Get business profile address
  String getWhatsAppAddress() {
    try {
      return this.getAddress() as String? ?? '';
    } catch (e) {
      return '';
    }
  }

  /// Get business profile description
  String getWhatsAppDescription() {
    try {
      return this.getDescription() as String? ?? '';
    } catch (e) {
      return '';
    }
  }

  /// Get business profile email
  String getWhatsAppEmail() {
    try {
      return this.getEmail() as String? ?? '';
    } catch (e) {
      return '';
    }
  }

  /// Get business profile picture URL
  String getWhatsAppProfilePictureUrl() {
    try {
      return this.getProfilePictureUrl() as String? ?? '';
    } catch (e) {
      return '';
    }
  }

  /// Get business vertical
  String getWhatsAppVertical() {
    try {
      return this.getVertical() as String? ?? '';
    } catch (e) {
      return '';
    }
  }

  /// Get business websites
  String getWhatsAppWebsites() {
    try {
      return this.getWebsites() as String? ?? '';
    } catch (e) {
      return '';
    }
  }

  /// Check if some users operation succeeded
  bool isWhatsAppSomeSuccess() {
    try {
      return this.isSomeSuccess() == true;
    } catch (e) {
      return false;
    }
  }

  /// Get users list
  List<dynamic> getWhatsAppUsersList() {
    try {
      return this.getUsersList() as List<dynamic>? ?? [];
    } catch (e) {
      return [];
    }
  }

  /// Get cursor before (pagination)
  String? getWhatsAppCursorBefore() {
    try {
      return this.getCursorBefore() as String?;
    } catch (e) {
      return null;
    }
  }

  /// Get cursor after (pagination)
  String? getWhatsAppCursorAfter() {
    try {
      return this.getCursorAfter() as String?;
    } catch (e) {
      return null;
    }
  }

  /// Get resumable upload ID
  String? getWhatsAppResumableId() {
    try {
      return this.getId() as String?;
    } catch (e) {
      return null;
    }
  }

  /// Get resumable upload H value
  String? getWhatsAppResumableH() {
    try {
      return this.getH() as String?;
    } catch (e) {
      return null;
    }
  }

  /// Get file offset
  int? getWhatsAppFileOffset() {
    try {
      return this.getFileOffset() as int?;
    } catch (e) {
      return null;
    }
  }
}