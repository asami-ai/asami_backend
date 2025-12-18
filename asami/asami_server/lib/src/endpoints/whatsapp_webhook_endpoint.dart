import 'package:asami_server/src/services/dependency_injection.dart';
import 'package:asami_server/src/services/messaging/whatsapp/whatsapp_service.dart';
import 'package:serverpod/serverpod.dart';
import '../services/messaging/whatsapp/whatsapp_webhook_handler.dart';
import 'bot_endpoint.dart';

/// Endpoint to handle WhatsApp webhook callbacks
/// This is called from the web routes, not directly via RPC
class WhatsAppWebhookEndpoint extends Endpoint {
  WhatsAppWebhookHandler? _handler;

  WhatsAppWebhookHandler _getHandler(Session session) {
    if (_handler == null) {
      final verifyToken = session.serverpod.getPassword('whatsappWebhookVerifyToken');
      _handler = WhatsAppWebhookHandler(
        botEndpoint: BotEndpoint(),
        verifyToken: verifyToken,
        whatsappService: _getWhatsappService()
      );
    }
    return _handler!;
  }

  /// Handle webhook verification (GET request)
  /// Called from WhatsAppVerifyRoute
  Future<Map<String, dynamic>> verifyWebhook(
    Session session, {
    String? mode,
    String? token,
    String? challenge,
  }) async {
    final handler = _getHandler(session);
    return handler.verifyWebhook(
      mode: mode,
      token: token,
      challenge: challenge,
    );
  }

  /// Handle incoming webhook (POST request)
  /// Called from WhatsAppWebhookRoute
  Future<Map<String, dynamic>> processWebhook(
    Session session,
    Map<String, dynamic> payload,
  ) async {
    final handler = _getHandler(session);
    return await handler.processWebhook(session, payload);
  }

  WhatsAppService _getWhatsappService() =>getIt<WhatsAppService>();
}
