// File: server/lib/src/web/routes/telegram_routes.dart

import 'dart:io';
import 'dart:convert';
import 'package:asami_server/utils/logger/asami_logger.dart';
import 'package:serverpod/serverpod.dart';
import 'package:televerse/telegram.dart';
import '../../services/messaging/telegram/telegram_webhook_handler.dart';

/// Combined route for Telegram webhook (handles both GET and POST)
class TelegramWebhookRoute extends Route {
  @override
  Future<bool> handleCall(Session session, HttpRequest request) async {
    Log.webhook('Telegram', request.method, request.uri.path, session: session);
    
    // Handle GET - info endpoint
    if (request.method == 'GET') {
      final response = {
        'status': 'Telegram webhook endpoint',
        'method': 'POST',
        'path': '/webhooks/telegram',
        'message': 'Send POST requests with Telegram updates to this endpoint',
      };
      
      Log.info('Telegram webhook info requested', data: response, session: session);
      
      request.response.statusCode = 200;
      request.response.headers.contentType = ContentType.json;
      request.response.write(jsonEncode(response));
      await request.response.close();
      return true;  // FIXED: Changed to true
    }
    
    // Handle POST - webhook updates
    if (request.method == 'POST') {
      try {
        Log.request('Received Telegram webhook POST request', session: session);
        
        // Read request body
        final body = await request.cast<List<int>>().transform(utf8.decoder).join();
        
        if (body.isEmpty) {
          Log.warning('Empty request body received', session: session);
          request.response.statusCode = 200;
          request.response.headers.contentType = ContentType.json;
          request.response.write(jsonEncode({'ok': true}));
          await request.response.close();
          return true;  // FIXED: Changed to true
        }
        
        // Parse JSON
        final payload = jsonDecode(body) as Map<String, dynamic>;
        Log.payload('Payload received', payload.keys.toList(), session: session);
        
        // Validate it's a Telegram update
        if (!payload.containsKey('update_id')) {
          Log.warning('Invalid Telegram update - missing update_id', session: session);
          request.response.statusCode = 200;
          request.response.headers.contentType = ContentType.json;
          request.response.write(jsonEncode({'ok': true}));
          await request.response.close();
          return true;  // FIXED: Changed to true
        }
        
        // Parse as Telegram Update
        Log.payload('Telegram payload', payload);
        final update = Update.fromJson(payload);
        Log.success('Update parsed', data: {'update_id': update.updateId}, session: session);
        
        // Get handler from singleton
        final handler = TelegramWebhookHandler.instance;
        
        if (handler == null) {
          Log.error('Telegram webhook handler not initialized', session: session);
          request.response.statusCode = 200;
          request.response.headers.contentType = ContentType.json;
          request.response.write(jsonEncode({'ok': true}));
          await request.response.close();
          return true;  // FIXED: Changed to true
        }
        
        // Process webhook
        final result = await handler.processWebhook(session, payload);
        
        Log.success('Webhook processed', 
          data: {'success': result['success']},
          session: session,
        );
        
        // Always return 200 OK to Telegram
        request.response.statusCode = 200;
        request.response.headers.contentType = ContentType.json;
        request.response.write(jsonEncode({'ok': true}));
        await request.response.close();
        return true;  // FIXED: Changed to true
      } catch (e, stackTrace) {
        Log.error('Error processing Telegram webhook', 
          error: e, 
          stackTrace: stackTrace,
          session: session,
        );
        
        // Still return 200 OK to prevent Telegram from retrying
        request.response.statusCode = 200;
        request.response.headers.contentType = ContentType.json;
        request.response.write(jsonEncode({'ok': true}));
        await request.response.close();
        return true;  // FIXED: Changed to true
      }
    }
    
    // Handle other methods
    Log.warning('Method not allowed: ${request.method}', session: session);
    request.response.statusCode = 405;
    request.response.headers.contentType = ContentType.json;
    request.response.write(jsonEncode({'error': 'Method not allowed. Use GET or POST.'}));
    await request.response.close();
    return true;  // FIXED: Changed to true
  }
}