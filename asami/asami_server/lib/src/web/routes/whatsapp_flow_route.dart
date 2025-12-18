// File: server/lib/src/web/routes/whatsapp_flow_route.dart

import 'dart:io';
import 'dart:convert';
import 'package:serverpod/serverpod.dart';
import '../../services/messaging/whatsapp/whatsapp_flow_handler.dart';
import 'package:asami_server/utils/logger/asami_logger.dart';

/// Route handler for WhatsApp Flow webhooks
class WhatsAppFlowRoute extends Route {
  final WhatsAppFlowHandler flowHandler = WhatsAppFlowHandler();

  @override
  Future<bool> handleCall(Session session, HttpRequest request) async {
    Log.webhook('WhatsApp Flow', request.method, request.uri.path, session: session);

    if (request.method != 'POST') {
      request.response.statusCode = 405;
      request.response.headers.contentType = ContentType.json;
      request.response.write(jsonEncode({
        'error': 'Method not allowed. Only POST is supported.',
      }));
      await request.response.close();
      return true;
    }

    try {
      // Read request body
      final body = await request.cast<List<int>>().transform(utf8.decoder).join();

      if (body.isEmpty) {
        Log.warning('Empty request body', session: session);
        request.response.statusCode = 400;
        request.response.headers.contentType = ContentType.json;
        request.response.write(jsonEncode({
          'error': 'Empty request body',
        }));
        await request.response.close();
        return true;
      }

      // Parse JSON payload
      final payload = jsonDecode(body) as Map<String, dynamic>;
      Log.payload('WhatsApp Flow payload received', payload.keys.toList(), session: session);

      // Process flow webhook
      final result = await flowHandler.processFlowWebhook(session, payload);

      // Return response
      request.response.statusCode = 200;
      request.response.headers.contentType = ContentType.json;
      request.response.write(jsonEncode(result));
      await request.response.close();

      Log.success('Flow processed', 
        data: {'success': result['success']}, 
        session: session,
      );

      return true;
    } catch (e, stackTrace) {
      Log.error('WhatsApp Flow route error', 
        error: e, 
        stackTrace: stackTrace,
        session: session,
      );

      request.response.statusCode = 500;
      request.response.headers.contentType = ContentType.json;
      request.response.write(jsonEncode({
        'error': 'Internal server error',
        'message': e.toString(),
      }));
      await request.response.close();

      return true;
    }
  }
}