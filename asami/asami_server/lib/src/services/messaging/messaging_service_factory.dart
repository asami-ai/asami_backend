import 'package:asami_server/utils/logger/asami_logger.dart';

import '../../generated/protocol.dart';
import 'messaging_service_interface.dart';
import 'whatsapp/whatsapp_service.dart';
import 'whatsapp/whatsapp_service_adapter.dart';
import 'telegram/telegram_service.dart';
import 'telegram/telegram_service_adapter.dart';

/// Factory to create appropriate messaging service
class MessagingServiceFactory {
  static final Map<PlatformType, IMessagingService> _services = {};
  static bool _initialized = false;

  /// Initialize all services
  static void initialize({
    required TelegramServiceAdapter telegramServiceAdapter,
    required WhatsAppServiceAdapter whatsappServiceAdapter,
    required TelegramService telegramService,
    required WhatsAppService whatsappService,
  }) {
    if (_initialized) {
      Log.info('⚠️ MessagingServiceFactory already initialized');
      return;
    }

    // Register WhatsApp

    register(
      PlatformType.whatsapp,
      whatsappServiceAdapter,
    );
    Log.info('✅ WhatsApp service registered');

    // Register Telegram (if token provided)
    register(
      PlatformType.telegram,
      telegramServiceAdapter,
    );

    // Start the Telegram bot
    telegramService.start().then((_) {
      Log.info('✅ Telegram service registered and started');
    }).catchError((e) {
      Log.info('❌ Failed to start Telegram service: $e');
    });

    _initialized = true;
    Log.info('✅ MessagingServiceFactory initialized');
  }

  /// Register a messaging service
  static void register(PlatformType platform, IMessagingService service) {
    _services[platform] = service;
  }

  /// Get messaging service for a platform
  static IMessagingService getService(PlatformType platform) {
    final service = _services[platform];
    if (service == null) {
      throw Exception('No messaging service registered for $platform '
          'Did you call MessagingServiceFactory.initialize()?');
    }
    return service;
  }

  /// Check if a platform is registered
  static bool isRegistered(PlatformType platform) {
    return _services.containsKey(platform);
  }

  /// Get all registered platforms
  static List<PlatformType> get registeredPlatforms {
    return _services.keys.toList();
  }

  /// Dispose all services
  static void disposeAll() {
    for (var service in _services.values) {
      try {
        service.dispose();
      } catch (e) {
        Log.info('⚠️ Error disposing service: $e');
      }
    }
    _services.clear();
    _initialized = false;
    Log.info('🧹 All messaging services disposed');
  }
}
