import 'dart:convert';
import 'package:serverpod/serverpod.dart';
import '../../services/messaging/whatsapp/whatsapp_flow_handler.dart';
import 'package:asami_server/utils/logger/asami_logger.dart';

/// Route handler for WhatsApp Flow webhooks
class WhatsAppFlowRoute extends Route {
  final WhatsAppFlowHandler flowHandler = WhatsAppFlowHandler();
  WhatsAppFlowRoute():super(methods: {Method.post});

  @override
  Future<Result> handleCall(Session session, Request request) async {
    Log.webhook('WhatsApp Flow', request.method.value, request.url.path, session: session);

    if (request.method != Method.post) {
      Log.warning('Method not allowed: ${request.method}', session: session);
      return Response.unauthorized(); // Or Response.badRequest()
    }

    try {
      // Read request body using Serverpod's helper
      final body = await request.readAsString();

      if (body.isEmpty) {
        Log.warning('Empty request body', session: session);
        return Response.ok(
          body: Body.fromString(jsonEncode({'error': 'Empty request body'}), 
          mimeType: MimeType.json),
        );
      }

      // Parse JSON payload
      final payload = jsonDecode(body) as Map<String, dynamic>;
      Log.payload('WhatsApp Flow payload received', payload.keys.toList(), session: session);

      // Process flow webhook
      final result = await flowHandler.processFlowWebhook(session, payload);

      Log.success('Flow processed', 
        data: {'success': result['success']}, 
        session: session,
      );

      return Response.ok(
        body: Body.fromString(jsonEncode(result), mimeType: MimeType.json),
      );
    } catch (e, stackTrace) {
      Log.error('WhatsApp Flow route error', 
        error: e, 
        stackTrace: stackTrace,
        session: session,
      );

      return Response.internalServerError();
    }
  }
}