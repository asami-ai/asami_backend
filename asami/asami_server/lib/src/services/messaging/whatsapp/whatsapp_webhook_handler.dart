// File: server/lib/src/services/messaging/whatsapp/whatsapp_webhook_handler.dart

import 'package:asami_server/utils/logger/asami_logger.dart';
import 'package:serverpod/serverpod.dart' hide Order;
import '../../../endpoints/bot_endpoint.dart';
import '../../../generated/protocol.dart';

/// Handles incoming WhatsApp webhooks (Singleton)
class WhatsAppWebhookHandler {
  WhatsAppWebhookHandler._({
    required this.botEndpoint,
    this.verifyToken,
  }) {
    _instance = this;
    Log.info('✅ WhatsAppWebhookHandler initialized');
  }

  static WhatsAppWebhookHandler? _instance;
  static WhatsAppWebhookHandler? get instance => _instance;

  factory WhatsAppWebhookHandler({
    required BotEndpoint botEndpoint,
    String? verifyToken,
  }) {
    if (_instance != null) {
      return _instance!;
    }
    
    return WhatsAppWebhookHandler._(
      botEndpoint: botEndpoint,
      verifyToken: verifyToken,
    );
  }

  final BotEndpoint botEndpoint;
  final String? verifyToken;

  /// Verify webhook (GET request from WhatsApp)
  Map<String, dynamic> verifyWebhook({
    required String? mode,
    required String? token,
    required String? challenge,
  }) {
    Log.info('🔍 WhatsApp webhook verification:');
    Log.info('   Mode: $mode');
    Log.info('   Token match: ${token == verifyToken}');
    
    if (mode == 'subscribe' && token == verifyToken) {
      Log.info('✅ WhatsApp webhook verified successfully');
      return {
        'success': true,
        'challenge': challenge,
      };
    } else {
      Log.info('❌ WhatsApp webhook verification failed');
      if (mode != 'subscribe') {
        Log.info('   ⚠️ Expected mode "subscribe", got: $mode');
      }
      if (token != verifyToken) {
        Log.info('   ⚠️ Token mismatch');
      }
      return {
        'success': false,
        'error': 'Verification failed',
      };
    }
  }

  /// Process incoming webhook (POST request from WhatsApp)
  Future<Map<String, dynamic>> processWebhook(
    Session session,
    Map<String, dynamic> payload,
  ) async {
    try {
      Log.info('📨 Processing WhatsApp webhook...');
      Log.info('📦 Payload structure: ${payload.keys.toList()}');
      
      // Extract entry array
      final entries = payload['entry'] as List?;
      if (entries == null || entries.isEmpty) {
        Log.info('ℹ️ No entries to process');
        return {'success': true, 'message': 'No entries to process'};
      }

      Log.info('📋 Processing ${entries.length} entries');

      // Process each entry
      int messagesProcessed = 0;
      int statusesProcessed = 0;

      for (var entry in entries) {
        final changes = entry['changes'] as List?;
        if (changes == null) {
          Log.info('⚠️ Entry has no changes');
          continue;
        }

        for (var change in changes) {
          final value = change['value'] as Map<String, dynamic>?;
          if (value == null) {
            Log.info('⚠️ Change has no value');
            continue;
          }

          // Process messages
          final messages = value['messages'] as List?;
          if (messages != null) {
            for (var message in messages) {
              await _processMessage(session, message, value);
              messagesProcessed++;
            }
          }

          // Process statuses (delivery, read receipts)
          final statuses = value['statuses'] as List?;
          if (statuses != null) {
            for (var status in statuses) {
              await _processStatus(session, status);
              statusesProcessed++;
            }
          }
        }
      }

      Log.info('✅ Processed $messagesProcessed messages, $statusesProcessed statuses');
      return {
        'success': true,
        'messages_processed': messagesProcessed,
        'statuses_processed': statusesProcessed,
      };
    } catch (e, stackTrace) {
      Log.info('❌ Error processing WhatsApp webhook: $e');
      Log.error( 'Stacktrace',stackTrace:  stackTrace);
      session.log('WhatsApp webhook error: $e', stackTrace: stackTrace);
      return {
        'success': false,
        'error': e.toString(),
      };
    }
  }

  /// Process individual message
  Future<void> _processMessage(
    Session session,
    Map<String, dynamic> message,
    Map<String, dynamic> value,
  ) async {
    try {
      final from = message['from'] as String?;
      final messageId = message['id'] as String?;
      final timestamp = message['timestamp'] as String?;
      final type = message['type'] as String?;

      if (from == null || messageId == null || type == null) {
        Log.info('⚠️ Incomplete message data, skipping');
        return;
      }

      Log.info('📩 Message from: $from (type: $type)');

      // Extract message content based on type
      String content = '';
      String? mediaUrl;
      MessageType messageType = MessageType.text;

      switch (type) {
        case 'text':
          content = message['text']?['body'] ?? '';
          messageType = MessageType.text;
          Log.info('   Text: $content');
          break;
        
        case 'image':
          content = message['image']?['caption'] ?? '[Image]';
          mediaUrl = message['image']?['id'];
          messageType = MessageType.image;
          Log.info('   Image (ID: $mediaUrl)');
          break;
        
        case 'video':
          content = message['video']?['caption'] ?? '[Video]';
          mediaUrl = message['video']?['id'];
          messageType = MessageType.video;
          Log.info('   Video (ID: $mediaUrl)');
          break;
        
        case 'audio':
          content = message['audio']?['caption'] ?? '[Audio]';
          mediaUrl = message['audio']?['id'];
          messageType = MessageType.audio;
          Log.info('   Audio (ID: $mediaUrl)');
          break;
        
        case 'document':
          final fileName = message['document']?['filename'] ?? 'document';
          content = message['document']?['caption'] ?? '[$fileName]';
          mediaUrl = message['document']?['id'];
          messageType = MessageType.document;
          Log.info('   Document: $fileName (ID: $mediaUrl)');
          break;
        
        case 'location':
          final lat = message['location']?['latitude'];
          final lng = message['location']?['longitude'];
          final name = message['location']?['name'];
          content = name != null 
              ? '[Location: $name ($lat, $lng)]'
              : '[Location: $lat, $lng]';
          messageType = MessageType.location;
          Log.info('   Location: $lat, $lng');
          break;
        
        case 'button':
          final buttonText = message['button']?['text'];
          final buttonPayload = message['button']?['payload'];
          content = buttonText ?? buttonPayload ?? '[Button Response]';
          messageType = MessageType.interactive;
          Log.info('   Button: $content');
          break;
        
        case 'interactive':
          final interactive = message['interactive'];
          if (interactive != null) {
            final type = interactive['type'];
            
            if (type == 'list_reply') {
              final listReply = interactive['list_reply'];
              content = listReply?['title'] ?? listReply?['id'] ?? '[List Selection]';
              Log.info('   List selection: $content');
            } else if (type == 'button_reply') {
              final buttonReply = interactive['button_reply'];
              content = buttonReply?['title'] ?? buttonReply?['id'] ?? '[Button Click]';
              Log.info('   Button reply: $content');
            } else {
              content = '[Interactive: $type]';
              Log.info('   Interactive type: $type');
            }
          }
          messageType = MessageType.interactive;
          break;
        
        case 'sticker':
          content = '[Sticker]';
          mediaUrl = message['sticker']?['id'];
          messageType = MessageType.image;
          Log.info('   Sticker (ID: $mediaUrl)');
          break;
        
        case 'contacts':
          final contacts = message['contacts'] as List?;
          if (contacts != null && contacts.isNotEmpty) {
            final contact = contacts[0];
            final name = contact['name']?['formatted_name'] ?? 'Contact';
            content = '[Contact: $name]';
          } else {
            content = '[Contact]';
          }
          messageType = MessageType.text;
          Log.info('   Contact shared');
          break;
        
        default:
          content = '[Unsupported message type: $type]';
          Log.info('⚠️ Unsupported message type: $type');
          // Don't process unsupported types
          return;
      }

      // Process with bot endpoint
      Log.info('🤖 Sending to bot endpoint...');
      final response = await botEndpoint.processMessage(
        session,
        platformUserId: from,
        platform: PlatformType.whatsapp,
        messageContent: content,
        messageType: messageType,
        mediaUrl: mediaUrl,
        platformMessageId: messageId,
      );

      if (response['success'] == true) {
        Log.info('✅ Bot processed message successfully');
        if (response['response'] != null) {
          Log.info('   Response: ${response['response']}');
        }
      } else {
        Log.info('⚠️ Bot processing had issues: ${response['error']}');
      }
    } catch (e, stackTrace) {
      Log.info('❌ Error processing message: $e');
    Log.error( 'Stacktrace',stackTrace:  stackTrace);
      session.log('WhatsApp message processing error: $e', stackTrace: stackTrace);
    }
  }

  /// Process status updates (delivered, read, sent)
  Future<void> _processStatus(
    Session session,
    Map<String, dynamic> status,
  ) async {
    try {
      final messageId = status['id'] as String?;
      final statusValue = status['status'] as String?;
      final timestamp = status['timestamp'] as String?;
      final recipient = status['recipient_id'] as String?;

      if (messageId == null || statusValue == null) {
        Log.info('⚠️ Incomplete status data');
        return;
      }

      Log.info('📊 Status update: $messageId → $statusValue');

      // Update message status in database
      final message = await Message.db.findFirstRow(
        session,
        where: (t) => t.platformMessageId.equals(messageId),
      );

      if (message != null) {
        bool updated = false;
        
        switch (statusValue) {
          case 'sent':
            Log.info('   ✉️ Message sent');
            // Message was sent from our server
            break;
            
          case 'delivered':
            message.isDelivered = true;
            message.deliveredAt = DateTime.now();
            updated = true;
            Log.info('   ✅ Message delivered');
            break;
            
          case 'read':
            message.isRead = true;
            message.readAt = DateTime.now();
            message.isDelivered = true; // If read, it was also delivered
            message.deliveredAt ??= DateTime.now();
            updated = true;
            Log.info('   👁️ Message read');
            break;
            
          case 'failed':
            message.isFailed = true;
            final errors = status['errors'];
            if (errors != null) {
              message.errorMessage = errors.toString();
              Log.info('   ❌ Message failed: ${message.errorMessage}');
            } else {
              message.errorMessage = 'Message delivery failed';
              Log.info('   ❌ Message failed');
            }
            updated = true;
            break;
            
          default:
            Log.info('   ⚠️ Unknown status: $statusValue');
        }

        if (updated) {
          await Message.db.updateRow(session, message);
          Log.info('   💾 Database updated');
        }
      } else {
        Log.info('   ⚠️ Message not found in database');
      }
    } catch (e, stackTrace) {
      Log.info('⚠️ Error processing status: $e');
    Log.error( 'Stacktrace',stackTrace:  stackTrace);
      session.log('WhatsApp status processing error: $e', stackTrace: stackTrace);
    }
  }
}