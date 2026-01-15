import 'dart:convert';
import 'package:asami_server/src/services/payment/paystack_webhook_handler.dart';
import 'package:asami_server/utils/logger/asami_logger.dart';
import 'package:serverpod/serverpod.dart';

/// Route for Paystack webhook (handles POST)
class PaystackWebhookRoute extends Route {
  PaystackWebhookRoute():super(methods: {Method.post});
  @override
  Future<Result> handleCall(Session session, Request request) async {
    Log.webhook('Paystack', request.method.value, request.url.path, session: session);

    // Handle POST - Webhook events
    if (request.method == Method.post) {
      try {
        final body = await request.readAsString();

        if (body.isEmpty) {
          return Response.ok(
            body: Body.fromString(jsonEncode({'ok': true}), mimeType: MimeType.json),
          );
        }

        final payload = jsonDecode(body) as Map<String, dynamic>;
        final signature = request.headers['x-paystack-signature']?.first ?? '';
        final handler = PaystackWebhookHandler.instance;

        final result = await handler.processWebhook(session, payload, signature);

        Log.success('Paystack webhook processed', 
          data: {'success': result['success']},
          session: session,
        );

        return Response.ok(
          body: Body.fromString(jsonEncode(result), mimeType: MimeType.json),
        );
      } catch (e, stackTrace) {
        Log.error('Paystack webhook error', error: e, stackTrace: stackTrace, session: session);
        // Always return 200 to Paystack to avoid retry loops
        return Response.ok(
          body: Body.fromString(jsonEncode({'ok': true}), mimeType: MimeType.json),
        );
      }
    }

    return Response.badRequest();
  }
}