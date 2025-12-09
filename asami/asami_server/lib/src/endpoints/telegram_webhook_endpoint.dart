import 'package:asami_server/src/generated/messaging/platfom_type.dart';
import 'package:asami_server/src/services/dependency_injection.dart';
import 'package:asami_server/src/services/messaging/messaging_service_factory.dart';
import 'package:serverpod/serverpod.dart';
import '../services/messaging/telegram/telegram_webhook_handler.dart';
import '../services/messaging/telegram/telegram_service.dart';
import 'bot_endpoint.dart';

class TelegramWebhookEndpoint extends Endpoint {
  TelegramWebhookHandler? _handler;

  // final adapter = MessagingServiceFactory.getService(PlatformType.telegram);
  // This is a bit hacky but necessary to access the underlying service
  // In production, you might want a cleaner way to access this
  TelegramService getTelegramService() {
    // Access the telegram service from the factory
    return getIt<TelegramService>();
  }

  TelegramWebhookHandler _getHandler(Session session) {
    if (_handler == null) {
      final service = getTelegramService();
      _handler = TelegramWebhookHandler(
        botEndpoint: BotEndpoint(),
        telegramService: service,
      );
    }
    return _handler!;
  }

  /// Process webhook (POST request)
  Future<Map<String, dynamic>> processWebhook(
    Session session,
    Map<String, dynamic> payload,
  ) async {
    return await _getHandler(session).processWebhook(session, payload);
  }
}
