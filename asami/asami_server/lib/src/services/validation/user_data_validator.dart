// File: server/lib/src/services/validation/user_data_validator.dart

import 'dart:convert';

import 'package:serverpod/serverpod.dart' hide Order, Message;
import '../../generated/protocol.dart';
import '../dependency_injection.dart';
import '../messaging/whatsapp/whatsapp_service.dart';
import '../messaging/telegram/telegram_service.dart';

/// Validates and collects missing critical user data at checkout
/// Similar to product creation and authentication flows
class UserDataValidator {
  final Session session;

  UserDataValidator(this.session);

  /// Check if user has all required data for purchase
  Future<Map<String, dynamic>> validateForPurchase({
    required User user,
    required Conversation conversation,
  }) async {
    final missingFields = <String>[];

    // Check first name
    if (user.firstName == null || user.firstName!.trim().isEmpty) {
      missingFields.add('first_name');
    }

    // Check last name
    if (user.lastName == null || user.lastName!.trim().isEmpty) {
      missingFields.add('last_name');
    }

    // Check phone (critical for delivery)
    if (user.phoneNumber.isEmpty) {
      missingFields.add('phone_number');
    }

    if (missingFields.isEmpty) {
      return {
        'valid': true,
        'missing_fields': [],
      };
    }

    // Create checkpoint session
    await _createCheckpointSession(
      conversation: conversation,
      missingFields: missingFields,
    );

    return {
      'valid': false,
      'missing_fields': missingFields,
      'checkpoint_active': true,
    };
  }

  /// Create checkpoint session (similar to product creation flow)
  Future<bool> _createCheckpointSession({
    required Conversation conversation,
    required List<String> missingFields,
  }) async {
    try {
      final sessionData = {
        'checkpoint_type': 'user_data_collection',
        'missing_fields': missingFields,
        'current_field_index': 0,
        'collected_data': {},
        'started_at': DateTime.now().toIso8601String(),
      };

      conversation.sessionData = jsonEncode(sessionData);
      await Conversation.db.updateRow(session, conversation);

      return true;
    } catch (e) {
      session.log('Failed to create checkpoint session: $e');
      return false;
    }
  }

  /// Process user input during checkpoint
  Future<Map<String, dynamic>> processCheckpointInput({
    required User user,
    required Conversation conversation,
    required String input,
    required PlatformType platform,
  }) async {
    try {
      final sessionData =
          jsonDecode(conversation.sessionData ?? '{}') as Map<String, dynamic>;

      if (sessionData['checkpoint_type'] != 'user_data_collection') {
        return {
          'success': false,
          'error': 'No active checkpoint',
        };
      }

      final missingFields =
          (sessionData['missing_fields'] as List).cast<String>();
      final currentIndex = sessionData['current_field_index'] as int;
      final collectedData =
          sessionData['collected_data'] as Map<String, dynamic>;

      if (currentIndex >= missingFields.length) {
        return {
          'success': false,
          'error': 'All data collected',
        };
      }

      final currentField = missingFields[currentIndex];

      // Validate input based on field type
      final validation = _validateFieldInput(currentField, input);

      if (!validation['valid']) {
        return {
          'success': false,
          'error': validation['error'],
          'retry': true,
        };
      }

      // Store the validated input
      collectedData[currentField] = validation['value'];
      sessionData['collected_data'] = collectedData;

      // Move to next field
      final nextIndex = currentIndex + 1;
      sessionData['current_field_index'] = nextIndex;

      if (nextIndex >= missingFields.length) {
        // All data collected - apply to user
        return await _completeCheckpoint(
          user: user,
          conversation: conversation,
          collectedData: collectedData,
          platform: platform,
        );
      }

      // Update session and ask for next field
      conversation.sessionData = jsonEncode(sessionData);
      await Conversation.db.updateRow(session, conversation);

      return {
        'success': true,
        'checkpoint_active': true,
        'next_field': missingFields[nextIndex],
        'prompt': _getFieldPrompt(missingFields[nextIndex]),
      };
    } catch (e, stackTrace) {
      session.log('Checkpoint processing error: $e', stackTrace: stackTrace);
      return {
        'success': false,
        'error': 'Failed to process input',
      };
    }
  }

  /// Validate field input
  Map<String, dynamic> _validateFieldInput(String field, String input) {
    final trimmed = input.trim();

    switch (field) {
      case 'first_name':
        if (trimmed.length < 2) {
          return {
            'valid': false,
            'error': 'First name must be at least 2 characters.',
          };
        }
        if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(trimmed)) {
          return {
            'valid': false,
            'error': 'First name should contain only letters.',
          };
        }
        return {
          'valid': true,
          'value': trimmed,
        };

      case 'last_name':
        if (trimmed.length < 2) {
          return {
            'valid': false,
            'error': 'Last name must be at least 2 characters.',
          };
        }
        if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(trimmed)) {
          return {
            'valid': false,
            'error': 'Last name should contain only letters.',
          };
        }
        return {
          'valid': true,
          'value': trimmed,
        };

      case 'phone_number':
        // Remove spaces and special characters
        final cleaned = trimmed.replaceAll(RegExp(r'[\s\-\(\)]'), '');
        if (cleaned.length < 10) {
          return {
            'valid': false,
            'error': 'Please enter a valid phone number (at least 10 digits).',
          };
        }
        if (!RegExp(r'^\+?\d{10,15}$').hasMatch(cleaned)) {
          return {
            'valid': false,
            'error':
                'Invalid phone number format. Use digits only (with optional +).',
          };
        }
        return {
          'valid': true,
          'value': cleaned,
        };

      default:
        return {
          'valid': true,
          'value': trimmed,
        };
    }
  }

  /// Get prompt for next field
  String _getFieldPrompt(String field) {
    switch (field) {
      case 'first_name':
        return '''
📝 *Almost there!*

To complete your purchase, please provide your *first name*.

Example: John
''';

      case 'last_name':
        return '''
📝 *One more thing...*

Please provide your *last name*.

Example: Doe
''';

      case 'phone_number':
        return '''
📱 *Contact Information*

Please provide your *phone number* for delivery updates.

Example: +2348012345678 or 08012345678
''';

      default:
        return 'Please provide the requested information.';
    }
  }

  /// Complete checkpoint and update user
  Future<Map<String, dynamic>> _completeCheckpoint({
    required User user,
    required Conversation conversation,
    required Map<String, dynamic> collectedData,
    required PlatformType platform,
  }) async {
    try {
      // Update user with collected data
      if (collectedData.containsKey('first_name')) {
        user.firstName = collectedData['first_name'] as String;
      }

      if (collectedData.containsKey('last_name')) {
        user.lastName = collectedData['last_name'] as String;
      }

      if (collectedData.containsKey('phone_number')) {
        user.phoneNumber = collectedData['phone_number'] as String;
      }

      user.updatedAt = DateTime.now();
      await User.db.updateRow(session, user);

      // Clear checkpoint session
      final sessionData =
          jsonDecode(conversation.sessionData ?? '{}') as Map<String, dynamic>;
      sessionData.remove('checkpoint_type');
      sessionData.remove('missing_fields');
      sessionData.remove('current_field_index');
      sessionData.remove('collected_data');
      sessionData.remove('started_at');

      conversation.sessionData = jsonEncode(sessionData);
      await Conversation.db.updateRow(session, conversation);

      // Send confirmation
      await _sendCheckpointCompletionMessage(
        user: user,
        platform: platform,
      );

      session.log('✅ User data checkpoint completed for ${user.id.uuid}');

      return {
        'success': true,
        'checkpoint_complete': true,
        'user': user,
        'message': 'Information collected successfully!',
      };
    } catch (e, stackTrace) {
      session.log('Checkpoint completion error: $e', stackTrace: stackTrace);
      return {
        'success': false,
        'error': 'Failed to save information',
      };
    }
  }

  /// Send completion confirmation
  Future<void> _sendCheckpointCompletionMessage({
    required User user,
    required PlatformType platform,
  }) async {
    final message = '''
✅ *Information Updated!*

Thank you, ${user.firstName} ${user.lastName}!

Your purchase is being processed now...
''';

    if (platform == PlatformType.whatsapp && user.whatsappId != null) {
      final whatsappService = getIt<WhatsAppService>();
      await whatsappService.sendMessage(
        phoneNumber: user.whatsappId!,
        text: message,
      );
    } else if (platform == PlatformType.telegram && user.telegramId != null) {
      final telegramService = getIt<TelegramService>();
      await telegramService.sendTextMessage(
        chatId: int.parse(user.telegramId!),
        text: message,
      );
    }
  }

  /// Initiate checkpoint with first prompt
  Future<Map<String, dynamic>> initiateCheckpoint({
    required User user,
    required Conversation conversation,
    required List<String> missingFields,
    required PlatformType platform,
  }) async {
    try {
      await _createCheckpointSession(
        conversation: conversation,
        missingFields: missingFields,
      );

      final firstField = missingFields.first;
      final prompt = '''
🔒 *Before You Checkout*

We need a bit more information to process your order securely.

${_getFieldPrompt(firstField)}

_Your data is safe and only used for delivery._
''';

      // Send prompt
      if (platform == PlatformType.whatsapp && user.whatsappId != null) {
        final whatsappService = getIt<WhatsAppService>();
        await whatsappService.sendMessage(
          phoneNumber: user.whatsappId!,
          text: prompt,
        );
      } else if (platform == PlatformType.telegram && user.telegramId != null) {
        final telegramService = getIt<TelegramService>();
        await telegramService.sendTextMessage(
          chatId: int.parse(user.telegramId!),
          text: prompt,
        );
      }

      return {
        'success': true,
        'checkpoint_initiated': true,
        'first_field': firstField,
      };
    } catch (e, stackTrace) {
      session.log('Checkpoint initiation error: $e', stackTrace: stackTrace);
      return {
        'success': false,
        'error': 'Failed to initiate checkpoint',
      };
    }
  }

  /// Check if conversation is in checkpoint mode
  Future<bool> isInCheckpoint(Conversation conversation) async {
    try {
      if (conversation.sessionData == null) return false;

      final sessionData =
          jsonDecode(conversation.sessionData!) as Map<String, dynamic>;
      return sessionData['checkpoint_type'] == 'user_data_collection';
    } catch (e) {
      return false;
    }
  }
}
