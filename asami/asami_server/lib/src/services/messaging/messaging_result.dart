// Unified result type for all messaging operations across platforms

import '../../generated/protocol.dart';

/// Unified result for all messaging operations
class MessagingResult {
  final bool success;
  final String? messageId;
  final String? recipient;
  final String? errorMessage;
  final String? errorCode;
  final String? errorType;
  final PlatformType platform;
  final Map<String, dynamic>? metadata;

  const MessagingResult._({
    required this.success,
    required this.platform,
    this.messageId,
    this.recipient,
    this.errorMessage,
    this.errorCode,
    this.errorType,
    this.metadata,
  });

  factory MessagingResult.success({
    required String messageId,
    required String recipient,
    required PlatformType platform,
    Map<String, dynamic>? metadata,
  }) {
    return MessagingResult._(
      success: true,
      messageId: messageId,
      recipient: recipient,
      platform: platform,
      metadata: metadata,
    );
  }

  factory MessagingResult.error({
    required String message,
    required PlatformType platform,
    String? errorCode,
    String? errorType,
    Map<String, dynamic>? metadata,
  }) {
    return MessagingResult._(
      success: false,
      platform: platform,
      errorMessage: message,
      errorCode: errorCode,
      errorType: errorType,
      metadata: metadata,
    );
  }

  bool get isSuccess => success;
  bool get isError => !success;

  @override
  String toString() {
    if (success) {
      return 'MessagingResult.success(messageId: $messageId, platform: $platform)';
    } else {
      return 'MessagingResult.error(message: $errorMessage, code: $errorCode)';
    }
  }
}