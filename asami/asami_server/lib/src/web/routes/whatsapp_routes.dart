// File: server/lib/src/web/routes/whatsapp_routes.dart

import 'dart:io';
import 'dart:convert';
import 'package:asami_server/src/services/messaging/whatsapp/whatsapp_webhook_handler.dart';
import 'package:asami_server/utils/logger/asami_logger.dart';
import 'package:serverpod/serverpod.dart';

/// Combined route for WhatsApp webhook (handles both GET and POST)
class WhatsAppWebhookRoute extends Route {
  @override
  Future<bool> handleCall(Session session, HttpRequest request) async {
    Log.webhook('WhatsApp', request.method, request.uri.path, session: session);

    // Handle GET - webhook verification
    if (request.method == 'GET') {
      try {
        // Extract query parameters
        final mode = request.uri.queryParameters['hub.mode'];
        final token = request.uri.queryParameters['hub.verify_token'];
        final challenge = request.uri.queryParameters['hub.challenge'];

        Log.verification('WhatsApp', 
          params: {
            'mode': mode ?? 'null',
            'token': token != null ? '${token.substring(0, 5)}***' : 'null',
            'challenge': challenge ?? 'null',
          },
          session: session,
        );

        // Get handler
        final handler = WhatsAppWebhookHandler.instance;
        if (handler == null) {
          Log.error('WhatsApp webhook handler not initialized', session: session);
          request.response.statusCode = 200;
          request.response.headers.contentType = ContentType.json;
          request.response.write(jsonEncode({'ok': true}));
          await request.response.close();
          return true;  // FIXED: Changed to true
        }

        // Verify webhook
        final result = handler.verifyWebhook(
          mode: mode,
          token: token,
          challenge: challenge,
        );

        if (result['success'] == true) {
          Log.success('WhatsApp webhook verified', session: session);
          // Return the challenge as plain text
          request.response.statusCode = 200;
          request.response.headers.contentType = ContentType.text;
          request.response.write(result['challenge'] ?? '');
          await request.response.close();
          return true;  // FIXED: Changed to true
        } else {
          Log.error('WhatsApp webhook verification failed', session: session);
          request.response.statusCode = 403;
          request.response.headers.contentType = ContentType.text;
          request.response.write('Verification failed');
          await request.response.close();
          return true;  // FIXED: Changed to true
        }
      } catch (e, stackTrace) {
        Log.error('WhatsApp verification error', 
          error: e, 
          stackTrace: stackTrace,
          session: session,
        );
        request.response.statusCode = 500;
        request.response.headers.contentType = ContentType.text;
        request.response.write('Internal error');
        await request.response.close();
        return true;  // FIXED: Changed to true
      }
    }

    // Handle POST - webhook messages
    if (request.method == 'POST') {
      try {
        Log.request('Received WhatsApp webhook POST request', session: session);

        // Read the request body
        final body = await request.cast<List<int>>().transform(utf8.decoder).join();

        if (body.isEmpty) {
          Log.warning('Empty request body received', session: session);
          request.response.statusCode = 200;
          request.response.headers.contentType = ContentType.json;
          request.response.write(jsonEncode({'success': true, 'message': 'Empty body'}));
          await request.response.close();
          return true;  // FIXED: Changed to true
        }

        // Parse JSON
        final payload = jsonDecode(body) as Map<String, dynamic>;
        Log.payload('Payload received', payload.keys.toList(), session: session);

        // Get handler
        final handler = WhatsAppWebhookHandler.instance;
        if (handler == null) {
          Log.error('WhatsApp webhook handler not initialized', session: session);
          request.response.statusCode = 200;
          request.response.headers.contentType = ContentType.json;
          request.response.write(jsonEncode({'ok': true}));
          await request.response.close();
          return true;  // FIXED: Changed to true
        }

        // Process webhook
        final result = await handler.processWebhook(session, payload);

        Log.success('WhatsApp webhook processed', 
          data: {'success': result['success']},
          session: session,
        );

        // Return JSON response
        request.response.statusCode = 200;
        request.response.headers.contentType = ContentType.json;
        request.response.write(jsonEncode(result));
        await request.response.close();
        return true;  // FIXED: Changed to true
      } catch (e, stackTrace) {
        Log.error('WhatsApp webhook error', 
          error: e, 
          stackTrace: stackTrace,
          session: session,
        );

        request.response.statusCode = 500;
        request.response.headers.contentType = ContentType.json;
        request.response.write(jsonEncode({'success': false, 'error': e.toString()}));
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