// File: server/lib/src/web/routes/health_route.dart

import 'dart:io';
import 'dart:convert';
import 'package:asami_server/utils/logger/asami_logger.dart';
import 'package:serverpod/serverpod.dart';

/// Health check route
class HealthCheckRoute extends Route {
  @override
  Future<bool> handleCall(Session session, HttpRequest request) async {
    final response = {
      'status': 'healthy',
      'service': 'Asami E-commerce Platform',
      'version': '1.0.0',
      'timestamp': DateTime.now().toIso8601String(),
      'platform': {
        'whatsapp': 'enabled',
        'telegram': 'enabled',
      },
    };

    Log.info('Health check requested', data: response, session: session);

    request.response.statusCode = 200;
    request.response.headers.contentType = ContentType.json;
    request.response.write(jsonEncode(response));
    await request.response.close();
    return true;
  }
}