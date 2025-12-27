// File: server/lib/server.dart

import 'dart:convert';
import 'dart:io';

import 'package:asami_server/src/web/routes/health_route.dart';
import 'package:asami_server/src/web/routes/root.dart';
import 'package:asami_server/src/web/routes/telegram_routes.dart';
import 'package:asami_server/src/web/routes/whatsapp_flow_route.dart';
import 'package:asami_server/src/web/routes/whatsapp_routes.dart';
import 'package:asami_server/utils/logger/asami_logger.dart';
import 'package:serverpod/serverpod.dart';

import 'src/generated/endpoints.dart';
import 'src/generated/protocol.dart';
import 'src/services/dependency_injection.dart';
import 'src/services/jobs/register_usage.dart';

void run(List<String> args) async {
  final pod = Serverpod(args, Protocol(), Endpoints());

  _logServerConfiguration(pod);

  final config = _loadConfiguration(pod);
  _validateConfiguration(config);

  final webhookUrls = _buildWebhookUrls(pod.config.webServer);
  _logWebhookUrls(webhookUrls, config.ngrokUrl);

  await _setupDependencies(config, webhookUrls);

  _configureRoutes(pod);

  await _startServer(pod, webhookUrls, config.webPort);
}

// ==================== CONFIGURATION ====================

class _ServerConfig {
  final String whatsappToken;
  final String whatsappFromId;
  final String? whatsappVerifyToken;
  final String? telegramToken;
  final String? ngrokUrl;
  final String aiProvider;
  final String? claudeKey;
  final String? openaiKey;
  final String? geminiKey;
  final String? grokKey;
  final String? metaAccessToken;
  final String? metaCatalogId;
  final int webPort;

  _ServerConfig({
    required this.whatsappToken,
    required this.whatsappFromId,
    this.whatsappVerifyToken,
    this.telegramToken,
    this.ngrokUrl,
    required this.aiProvider,
    this.claudeKey,
    this.openaiKey,
    this.geminiKey,
    this.grokKey,
    this.metaAccessToken,
    this.metaCatalogId,
    required this.webPort,
  });
}

class _WebhookUrls {
  final String telegram;
  final String whatsapp;

  _WebhookUrls({required this.telegram, required this.whatsapp});
}

_ServerConfig _loadConfiguration(Serverpod pod) {
  return _ServerConfig(
    whatsappToken: pod.getPassword('whatsappAccessToken') ?? '',
    whatsappFromId: pod.getPassword('whatsappFromNumberId') ?? '',
    whatsappVerifyToken: pod.getPassword('whatsappWebhookVerifyToken'),
    telegramToken: pod.getPassword('telegramBotToken'),
    ngrokUrl: pod.getPassword('ngrok'),
    aiProvider: pod.getPassword('aiProvider') ?? 'claude',
    claudeKey: pod.getPassword('claudeApiKey'),
    openaiKey: pod.getPassword('openaiApiKey'),
    geminiKey: pod.getPassword('geminiApiKey'),
    grokKey: pod.getPassword('grokApiKey'),
    metaAccessToken: pod.getPassword('metaAccessToken'),
    metaCatalogId: pod.getPassword('metaCatalogId'),
    webPort: pod.config.webServer?.publicPort ?? 8082,
  );
}

void _validateConfiguration(_ServerConfig config) {
  if (config.whatsappToken.isEmpty || config.whatsappFromId.isEmpty) {
    Log.startupWarning('WhatsApp credentials missing');
  }

  if (config.whatsappVerifyToken == null) {
    Log.startupWarning('WhatsApp webhook verify token missing');
  }

  if (config.telegramToken == null) {
    Log.startupWarning('Telegram bot token missing');
  }

  if (config.ngrokUrl == null) {
    Log.startupWarning('Ngrok URL missing - webhooks will not work');
  }

  Log.info(''); // Empty line for readability
}

_WebhookUrls _buildWebhookUrls(ServerConfig? webServer) {
  final host = webServer?.publicHost ?? 'localhost';
  final port = webServer?.publicPort ?? 8082;
  final scheme = webServer?.publicScheme ?? 'http';

  String buildUrl(String path) {
    if ((port == 80 && scheme == 'http') ||
        (port == 443 && scheme == 'https')) {
      return '$scheme://$host$path';
    }
    return '$scheme://$host:$port$path';
  }

  return _WebhookUrls(
    telegram: buildUrl('/webhooks/telegram'),
    whatsapp: buildUrl('/webhooks/whatsapp'),
  );
}

// ==================== LOGGING ====================

void _logServerConfiguration(Serverpod pod) {
  Log.startup('Server configuration:');
  Log.startupInfo(
      'API Server: ${pod.config.apiServer.publicHost}:${pod.config.apiServer.port}');
  Log.startupInfo(
      'Web Server: ${pod.config.webServer?.publicHost}:${pod.config.webServer?.port}');
  Log.startupInfo(
      'Insights: ${pod.config.insightsServer?.publicHost}:${pod.config.insightsServer?.port}');
}

void _logWebhookUrls(_WebhookUrls urls, String? ngrokUrl) {
  Log.startup('🔗 Webhook URLs:');
  Log.startupInfo('WhatsApp: ${urls.whatsapp}');
  Log.startupInfo('Telegram: ${urls.telegram}');
  Log.info(''); // Empty line for readability
}

// ==================== DEPENDENCY INJECTION ====================

Future<void> _setupDependencies(
    _ServerConfig config, _WebhookUrls webhookUrls) async {
  try {
    await setupDependencyInjection(
      whatsappAccessToken: config.whatsappToken,
      whatsappFromNumberId: config.whatsappFromId,
      whatsappWebhookVerifyToken: config.whatsappVerifyToken,
      telegramBotToken: config.telegramToken,
      telegramWebhookUrl: webhookUrls.telegram,
      aiProvider: config.aiProvider,
      claudeApiKey: config.claudeKey,
      openaiApiKey: config.openaiKey,
      geminiApiKey: config.geminiKey,
      grokApiKey: config.grokKey,

    );
    Log.startupSuccess('✅ Dependency injection configured');
    Log.info(''); // Empty line for readability
  } catch (e, stackTrace) {
    Log.startupError('Failed to setup dependency injection', error: e);
    Log.error('Error stackTrace', stackTrace: stackTrace);
    rethrow;
  }
}

// ==================== ROUTE CONFIGURATION ====================

void _configureRoutes(Serverpod pod) {
  Log.startup('🛣️ Configuring routes:');

  // Health check
  pod.webServer.addRoute(HealthCheckRoute(), '/health');
  Log.startupInfo('✅ /health');

  // WhatsApp webhook
  pod.webServer.addRoute(WhatsAppWebhookRoute(), '/webhooks/whatsapp');
  Log.startupInfo('✅ /webhooks/whatsapp (GET, POST)');

  // Telegram webhook
  pod.webServer.addRoute(TelegramWebhookRoute(), '/webhooks/telegram');
  Log.startupInfo('✅ /webhooks/telegram (GET, POST)');
  pod.webServer.fallbackRoute = _NotFoundRoute();
  // whatsapp flow route
  // pod.webServer.addRoute(WhatsAppFlowRoute(), '/webhooks/whatsapp/flow');
  // Log.startupInfo('✅ /webhooks/whatsapp/flow (POST)');

  // Root routes (OPTIONAL - comment out to restrict access)
  pod.webServer.addRoute(RouteRoot(), '/');
  pod.webServer.addRoute(RouteRoot(), '/index.html');
  Log.startupInfo('✅ / and /index.html');

  // Static files (OPTIONAL - comment out to restrict access)
  // pod.webServer.addRoute(
  //   StaticRoute.directory(Directory('static')),
  //   '/*',
  // );
  // Log.startupInfo('✅ Static files: /*');

  // ALTERNATIVE: Uncomment to block all other routes
  // pod.webServer.addRoute(_NotFoundRoute(), '/*');
  // Log.startupInfo('✅ All other routes blocked');

  Log.info(''); // Empty line for readability
}

// ==================== SERVER STARTUP ====================

Future<void> _startServer(
    Serverpod pod, _WebhookUrls webhookUrls, int webPort) async {
  try {
    await pod.start().then((p) async {
      await initializeTierFeatures();
    });
    await registerUsageFutureCalls(pod);
    _logServerStartup(webhookUrls, webPort);
  } catch (e, stackTrace) {
    Log.startupError('');
    Log.startupError('FATAL ERROR: Failed to start server', error: e);
    Log.error('Error stackTrace', stackTrace: stackTrace);
    Log.info('');
    rethrow;
  }
}

void _logServerStartup(_WebhookUrls webhookUrls, int webPort) {
  Log.info('');
  Log.startupSuccess('Asami Server started successfully! 🚀');
  Log.info('');

  Log.startup('📡 Endpoints Ready:');
  Log.startupInfo('Health:    http://localhost:$webPort/health');
  Log.startupInfo('WhatsApp:  ${webhookUrls.whatsapp}');
  Log.startupInfo('Telegram:  ${webhookUrls.telegram}');
  Log.info('');

  Log.startup('🧪 Test Locally:');
  Log.startupInfo('curl http://localhost:$webPort/health');
  Log.startupInfo('curl http://localhost:$webPort/webhooks/telegram');
  Log.startupInfo('curl http://localhost:$webPort/webhooks/whatsapp');
  Log.info('');
}

// ==================== UTILITY ROUTES ====================

/// Route that returns 404 for all requests (use to block unwanted routes)
class _NotFoundRoute extends Route {
  @override
  Future<Response> handleCall(Session session, Request request) async {
    return Response.notFound(
        body: Body.fromString(
            '{"message": "This endpoint does not exist. Only /webhooks/telegram and /webhooks/whatsapp are available."}'));
  }
}

/// Names of all future calls in the server
enum FutureCallNames { birthdayReminder }
