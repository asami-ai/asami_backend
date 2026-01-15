// File: server/lib/src/web/routes/telegram_routes.dart

import 'dart:convert';
import 'package:asami_server/utils/logger/asami_logger.dart';
import 'package:serverpod/serverpod.dart';
import 'package:televerse/telegram.dart';
import '../../services/messaging/telegram/telegram_webhook_handler.dart';

/// Combined route for Telegram webhook (handles both GET and POST)
class TelegramWebhookRoute extends Route {
  TelegramWebhookRoute() : super(methods: {Method.get, Method.post});
  @override
  Future<Result> handleCall(Session session, Request request) async {
    Log.webhook('Telegram', request.method.value, request.url.path,
        session: session);

    // Handle GET - info endpoint
    if (request.method == Method.get) {
      final response = {
        'status': 'Telegram webhook endpoint',
        'method': 'POST',
        'path': '/webhooks/telegram',
        'message': 'Send POST requests with Telegram updates to this endpoint',
      };

      Log.info('Telegram webhook info requested',
          data: response, session: session);

      return Response.ok(
          body: Body.fromString(jsonEncode(response),
              mimeType: MimeType.json)); // FIXED: Changed to true
    }

    // Handle POST - webhook updates
    if (request.method == Method.post) {
      try {
        Log.webhook('Telegram', 'POST', request.url.path, session: session);

        // Read request body
        final body = await request.readAsString();

        if (body.isEmpty) {
          Log.warning('Empty request body received', session: session);

          return Response.ok(
              body: Body.fromString(jsonEncode(jsonEncode({'ok': true})),
                  mimeType: MimeType.json)); // FIXED: Changed to true
        }
        // Parse JSON
        final payload = jsonDecode(body) as Map<String, dynamic>;
        Log.success('Payload received',
            data: payload.keys.toList(), session: session);

        // Validate it's a Telegram update
        if (!payload.containsKey('update_id')) {
          Log.warning('Invalid Telegram update - missing update_id',
              session: session);
          return Response.ok(
              body: Body.fromString(jsonEncode(jsonEncode({'ok': true})),
                  mimeType: MimeType.json));
          // FIXED: Changed to true
        }

        // Parse as Telegram Update
        Log.success('Telegram payload', data: payload, session: session);
        final update = Update.fromJson(payload);
        Log.success('Update parsed',
            data: {'update_id': update.updateId}, session: session);

        // Get handler from singleton
        final handler = TelegramWebhookHandler.instance;

        if (handler == null) {
          Log.error('Telegram webhook handler not initialized',
              session: session);
          return Response.ok(
              body: Body.fromString(jsonEncode(jsonEncode({'ok': true})),
                  mimeType: MimeType.json));
        }

        // Process webhook
        final result = await handler.processWebhook(session, payload);

        Log.success(
          'Webhook processed',
          data: {'success': result['success']},
          session: session,
        );

        // Always return 200 OK to Telegram
        return Response.ok(
            body: Body.fromString(jsonEncode(jsonEncode({'ok': true})),
                mimeType: MimeType.json));
      } catch (e, stackTrace) {
        Log.error(
          'Error processing Telegram webhook',
          error: e,
          stackTrace: stackTrace,
          session: session,
        );

        // Still return 200 OK to prevent Telegram from retrying
        return Response.ok(
            body: Body.fromString(jsonEncode(jsonEncode({'ok': true})),
                mimeType: MimeType.json));
      }
    }

    // Handle other methods
    Log.warning('Method not allowed: ${request.method}', session: session);

    return Response.badRequest(); // FIXED: Changed to true
  }
}
