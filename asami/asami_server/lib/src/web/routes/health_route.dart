import 'dart:convert';
import 'package:asami_server/utils/logger/asami_logger.dart';
import 'package:serverpod/serverpod.dart';

/// Health check route updated to use the modern Request/Response pattern
class HealthCheckRoute extends Route {
  @override
  Future<Result> handleCall(Session session, Request request) async {
    final responseData = {
      'status': 'healthy',
      'service': 'Asami E-commerce Platform',
      'version': '1.0.0',
      'timestamp': DateTime.now().toIso8601String(),
      'platform': {
        'whatsapp': 'enabled',
        'telegram': 'enabled',
      },
    };

    Log.info('Health check requested', data: responseData, session: session);

    return Response.ok(
      body: Body.fromString(jsonEncode(responseData), mimeType: MimeType.json),
    );
  }
}