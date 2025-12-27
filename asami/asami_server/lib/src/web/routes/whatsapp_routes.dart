import 'dart:convert';
import 'package:asami_server/src/services/messaging/whatsapp/whatsapp_webhook_handler.dart';
import 'package:asami_server/utils/logger/asami_logger.dart';
import 'package:serverpod/serverpod.dart';

/// Combined route for WhatsApp webhook (handles both GET and POST)
class WhatsAppWebhookRoute extends Route {
  WhatsAppWebhookRoute():super(methods: {Method.get, Method.post});
  @override
  Future<Result> handleCall(Session session, Request request) async {
    Log.webhook('WhatsApp', request.method.value, request.url.path, session: session);

    // Handle GET - WhatsApp/Meta webhook verification
    if (request.method == Method.get) {
      try {
        final queryParams = request.url.queryParameters;
        final mode = queryParams['hub.mode'];
        final token = queryParams['hub.verify_token'];
        final challenge = queryParams['hub.challenge'];

        Log.verification('WhatsApp', 
          params: {
            'mode': mode ?? 'null',
            'token': token != null ? '${token.substring(0, 5)}***' : 'null',
            'challenge': challenge ?? 'null',
          },
          session: session,
        );

        final handler = WhatsAppWebhookHandler.instance;
        if (handler == null) {
          Log.error('WhatsApp webhook handler not initialized', session: session);
          return Response.ok(body: Body.fromString('Handler not ready', mimeType: MimeType.plainText));
        }

        final result = handler.verifyWebhook(
          mode: mode,
          token: token,
          challenge: challenge,
        );

        if (result['success'] == true) {
          Log.success('WhatsApp webhook verified', session: session);
          // Return the challenge as PLAIN TEXT (Requirement for Meta)
          return Response.ok(
            body: Body.fromString(result['challenge'] ?? '', mimeType: MimeType.plainText),
          );
        } else {
          Log.error('WhatsApp webhook verification failed', session: session);
          return Response.forbidden();
        }
      } catch (e, stackTrace) {
        Log.error('WhatsApp verification error', error: e, stackTrace: stackTrace, session: session);
        return Response.internalServerError();
      }
    }

    // Handle POST - Webhook messages
    if (request.method == Method.post) {
      try {
        final body = await request.readAsString();

        if (body.isEmpty) {
          return Response.ok(
            body: Body.fromString(jsonEncode({'ok': true}), mimeType: MimeType.json),
          );
        }

        final payload = jsonDecode(body) as Map<String, dynamic>;
        final handler = WhatsAppWebhookHandler.instance;
        
        if (handler == null) {
          Log.error('WhatsApp webhook handler not initialized', session: session);
          return Response.ok(body: Body.fromString(jsonEncode({'ok': true}), mimeType: MimeType.json));
        }

        final result = await handler.processWebhook(session, payload);

        Log.success('WhatsApp webhook processed', 
          data: {'success': result['success']},
          session: session,
        );

        return Response.ok(
          body: Body.fromString(jsonEncode(result), mimeType: MimeType.json),
        );
      } catch (e, stackTrace) {
        Log.error('WhatsApp webhook error', error: e, stackTrace: stackTrace, session: session);
        // Always return 200 to Meta to avoid retry loops
        return Response.ok(
          body: Body.fromString(jsonEncode({'ok': true}), mimeType: MimeType.json),
        );
      }
    }

    return Response.badRequest();
  }
}