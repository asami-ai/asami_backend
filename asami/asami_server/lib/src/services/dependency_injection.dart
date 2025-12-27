import 'package:asami_server/src/endpoints/usage_endpoint.dart';
import 'package:asami_server/src/services/messaging/whatsapp/whatsapp_webhook_handler.dart';
import 'package:asami_server/src/services/product/product_creation_handler.dart';
import 'package:asami_server/src/services/product/product_creation_state.dart';
import 'package:asami_server/utils/logger/asami_logger.dart';
import 'package:get_it/get_it.dart';
import 'package:serverpod/serverpod.dart';
import '../endpoints/bot_endpoint.dart';
import '../generated/protocol.dart';
import 'ai_services/config/commands.dart';
import 'ai_services/providers/ai_provider_interface.dart';
import 'ai_services/providers/claude_provider.dart';
import 'ai_services/providers/openai_provider.dart';
import 'ai_services/providers/gemini_provider.dart';
import 'ai_services/providers/grok_provider.dart';
import 'ai_services/core/agent_system.dart';
import 'ai_services/core/security_filter.dart';
import 'ai_services/core/command_processor.dart';
import 'ai_services/core/intent_analyzer.dart';
import 'ai_services/core/response_formater.dart';
import 'ai_services/core/ai_cache_manager.dart';
import 'ai_services/tools/tool_registry.dart';
import 'ai_services/tools/customer_tools.dart';
import 'ai_services/tools/vendor_tools.dart';
import 'auth/auth_state_manager.dart';
import 'catalog/meta_catalog_service.dart';
import 'media/enanced_media_services.dart';
import 'messaging/messaging_service_factory.dart';
import 'messaging/telegram/telegram_callback_handler.dart';
import 'messaging/telegram/telegram_webhook_handler.dart';
import 'messaging/whatsapp/whatsapp_service.dart';
import 'messaging/whatsapp/whatsapp_service_adapter.dart';
import 'messaging/telegram/telegram_service.dart';
import 'messaging/telegram/telegram_service_adapter.dart';

final getIt = GetIt.instance;

/// Sets up all dependency injection for the server
Future<void> setupDependencyInjection({
  required String whatsappAccessToken,
  required String whatsappFromNumberId,
  String? whatsappWebhookVerifyToken,
  String? telegramBotToken,
  String? openaiApiKey,
  String? telegramWebhookUrl,
  String? aiProvider,
  String? claudeApiKey,
  String? geminiApiKey,
  String? grokApiKey,
  String? metaAccessToken,
  String? metaCatalogId,
}) async {
  Log.info('🔧 Setting up dependency injection...');

  await _setupAIProvider(
    providerType: aiProvider ?? 'claude',
    claudeApiKey: claudeApiKey,
    openaiApiKey: openaiApiKey,
    geminiApiKey: geminiApiKey,
    grokApiKey: grokApiKey,
  );

  await _setupToolRegistry();
  await _setupCommandProcessor();
  await _setupAgentComponents();
  await _setupAgentSystem();

  await _setupMessagingServices(
    whatsappAccessToken: whatsappAccessToken,
    whatsappFromNumberId: whatsappFromNumberId,
    whatsappWebhookVerifyToken: whatsappWebhookVerifyToken,
    telegramBotToken: telegramBotToken,
    telegramWebhookUrl: telegramWebhookUrl,
  );

  await _initializeMetaService(metaAccessToken ?? '', metaCatalogId ??'');

  await _setupProductCreationHandler();

  Log.info('\n✅ Dependency injection setup complete!\n');
}

// ==================== AI PROVIDER SETUP ====================

Future<void> _setupAIProvider({
  required String providerType,
  String? claudeApiKey,
  String? openaiApiKey,
  String? geminiApiKey,
  String? grokApiKey,
}) async {
  Log.info('\n📡 Configuring AI Provider...');

  // Register all provider factories
  AIProviderFactory.register('claude', () => ClaudeProvider());
  AIProviderFactory.register('openai', () => OpenAIProvider());
  AIProviderFactory.register('gemini', () => GeminiProvider());
  AIProviderFactory.register('grok', () => GrokProvider());

  Log.info('   Selected Provider: $providerType');

  // Create and initialize provider
  final provider = AIProviderFactory.create(providerType);
  final credentials = _getProviderCredentials(
    providerType,
    claudeApiKey: claudeApiKey,
    openaiApiKey: openaiApiKey,
    geminiApiKey: geminiApiKey,
    grokApiKey: grokApiKey,
  );

  await provider.initialize(credentials);

  // Health check
  final isHealthy = await provider.healthCheck();
  Log.info(isHealthy
      ? '   ✅ Provider health check passed'
      : '   ⚠️ Warning: Provider health check failed');

  getIt.registerSingleton<AIProvider>(provider);
  Log.info('   ✅ ${provider.providerName} initialized');
}

Map<String, String> _getProviderCredentials(
  String providerType, {
  String? claudeApiKey,
  String? openaiApiKey,
  String? geminiApiKey,
  String? grokApiKey,
}) {
  switch (providerType) {
    case 'openai':
      if (openaiApiKey == null || openaiApiKey.isEmpty) {
        throw Exception('OpenAI API key is required');
      }
      return {'api_key': openaiApiKey, 'model': 'gpt-5-mini-2025-08-07'};

    case 'gemini':
      if (geminiApiKey == null || geminiApiKey.isEmpty) {
        throw Exception('Gemini API key is required');
      }
      return {'api_key': geminiApiKey, 'model': 'gemini-2.5-flash'};

    case 'grok':
      if (grokApiKey == null || grokApiKey.isEmpty) {
        throw Exception('Grok API key is required');
      }
      return {'api_key': grokApiKey, 'model': 'grok-beta'};

    case 'claude':
    default:
      if (claudeApiKey == null || claudeApiKey.isEmpty) {
        throw Exception('Claude API key is required');
      }
      return {'api_key': claudeApiKey, 'model': 'claude-sonnet-4-20250514'};
  }
}

// ==================== TOOL REGISTRY SETUP ====================

Future<void> _setupToolRegistry() async {
  Log.info('\n🔧 Setting up Tool Registry...');

  final toolRegistry = ToolRegistry();
  final provider = getIt<AIProvider>();

  // Register customer and vendor tools
  CustomerTools.registerAll(toolRegistry);
  VendorTools.registerAll(toolRegistry);

  final customerToolCount = toolRegistry.getToolsForRole('customer').length;
  final vendorToolCount = toolRegistry.getToolsForRole('vendor').length;

  Log.info('   ✅ Customer tools registered ($customerToolCount tools)');
  Log.info('   ✅ Vendor tools registered ($vendorToolCount tools)');

  // Register tools with AI provider
  final allTools = [
    ...toolRegistry.getToolsForRole('customer'),
    ...toolRegistry.getToolsForRole('vendor'),
  ];
  provider.registerTools(allTools);
  Log.info('   ✅ Tools registered with AI provider (${allTools.length} total)');

  getIt.registerSingleton<ToolRegistry>(toolRegistry);
}

// ==================== COMMAND PROCESSOR SETUP ====================

Future<void> _setupCommandProcessor() async {
  Log.info('\n⌨️  Setting up Command Processor...');

  final commandProcessor = CommandProcessor();
  registerAllCommands(commandProcessor);

  getIt.registerSingleton<CommandProcessor>(commandProcessor);
  Log.info('   ✅ All commands registered');
}

// ==================== AGENT COMPONENTS SETUP ====================

Future<void> _setupAgentComponents() async {
  Log.info('\n🤖 Setting up Agent System components...');

  final securityFilter = SecurityFilter();
  final intentAnalyzer = IntentAnalyzer();
  final responseFormatter = ResponseFormatter();
  final cacheManager = AICacheManager();
  final authStateManager = AuthStateManager();

  getIt.registerSingleton<SecurityFilter>(securityFilter);
  getIt.registerSingleton<IntentAnalyzer>(intentAnalyzer);
  getIt.registerSingleton<ResponseFormatter>(responseFormatter);
  getIt.registerSingleton<AICacheManager>(cacheManager);
  getIt.registerSingleton(authStateManager);

  Log.info('   ✅ Security filter ready');
  Log.info('   ✅ Intent analyzer ready');
  Log.info('   ✅ Response formatter ready');
  Log.info('   ✅ Cache manager ready');
  Log.info('   ✅ Auth state manager ready');
}

// ==================== AGENT SYSTEM SETUP ====================

Future<void> _setupAgentSystem() async {
  Log.info('\n🧠 Initializing Agent System...');

  final agentSystem = AgentSystem(
      provider: getIt<AIProvider>(),
      toolRegistry: getIt<ToolRegistry>(),
      responseFormatter: getIt<ResponseFormatter>(),
      securityFilter: getIt<SecurityFilter>(),
      commandProcessor: getIt<CommandProcessor>(),
      intentAnalyzer: getIt<IntentAnalyzer>(),
      cacheManager: getIt<AICacheManager>(),
      usageEndpoint: UsageEndpoint());

  getIt.registerSingleton<AgentSystem>(agentSystem);
  Log.info('   ✅ Agent System ready');
}

// ==================== MESSAGING SERVICES SETUP ====================

Future<void> _setupMessagingServices({
  required String whatsappAccessToken,
  required String whatsappFromNumberId,
  String? whatsappWebhookVerifyToken,
  String? telegramBotToken,
  String? telegramWebhookUrl,
}) async {
  Log.info('\n💬 Setting up Messaging Services...');

  // WhatsApp Setup
  await _setupWhatsApp(
    accessToken: whatsappAccessToken,
    fromNumberId: whatsappFromNumberId,
    verifyToken: whatsappWebhookVerifyToken,
  );

  // Telegram Setup
  await _setupTelegram(
    botToken: telegramBotToken,
    webhookUrl: telegramWebhookUrl,
  );

  // Initialize Messaging Service Factory
  _initializeMessagingFactory();
}

Future<void> _setupWhatsApp({
  required String accessToken,
  required String fromNumberId,
  String? verifyToken,
}) async {
  final whatsappService = WhatsAppService(
    accessToken: accessToken,
    fromNumberId: fromNumberId,
    webhookVerifyToken: verifyToken,
  );

  final whatsappAdapter = WhatsAppServiceAdapter(whatsappService);

  getIt.registerSingleton<WhatsAppService>(whatsappService);
  getIt.registerSingleton<WhatsAppServiceAdapter>(whatsappAdapter);

  // Initialize webhook handler
  if (accessToken.isNotEmpty) {
    try {
      WhatsAppWebhookHandler(
          botEndpoint: BotEndpoint(),
          verifyToken: verifyToken,
          whatsappService: getIt());
      Log.info('   ✅ WhatsApp service configured');
    } catch (e) {
      Log.info('   ⚠️ Failed to initialize WhatsApp webhook handler: $e');
    }
  }
}

Future<void> _setupTelegram({
  String? botToken,
  String? webhookUrl,
}) async {
  if (botToken == null || botToken.isEmpty) {
    Log.info('   ⚠️ Telegram bot token not provided, skipping Telegram setup');
    return;
  }

  try {
    final telegramService = TelegramService(
      botToken: botToken,
      webhookUrl: webhookUrl,
    );

    final telegramAdapter = TelegramServiceAdapter(telegramService);

    getIt.registerSingleton<TelegramService>(telegramService);
    getIt.registerSingleton<TelegramServiceAdapter>(telegramAdapter);

    await telegramService.start();

    // Initialize webhook handler
    TelegramWebhookHandler(
      telegramService: telegramService,
      botEndpoint: BotEndpoint(),
    );

    Log.info('   ✅ Telegram service configured and started');
  } catch (e) {
    Log.info('   ⚠️ Failed to initialize Telegram: $e');
  }
}

Future<void> _initializeMetaService(
    String metaAccessToken, String metaCatalogId) async {
  try {
    // Add Meta Catalog Service
    final metaCatalogService = MetaCatalogService(
      accessToken: metaAccessToken,
      catalogId: metaCatalogId,
    );

    final enhancedMediaService = EnhancedMediaService(
      whatsappService: getIt<WhatsAppService>(),
      telegramService: getIt<TelegramService>(),
    );
    getIt.registerLazySingleton<MetaCatalogService>(() => metaCatalogService);
    getIt.registerLazySingleton<EnhancedMediaService>(
        () => enhancedMediaService);
  } catch (e, stack) {
    Log.error('Error during tier initialization', error: e, stackTrace: stack);
  } finally {}
}

// ==================== PRODUCT CREATION HANDLER SETUP (NEW) ====================

Future<void> _setupProductCreationHandler() async {
  try {
    Log.info('\n🏭 Setting up Product Creation Handler...');

    final stateManager =
        getIt.registerLazySingleton<ProductCreationStateManager>(
            () => ProductCreationStateManager());

    final productCreationHandler = ProductCreationHandler(
        mediaService: getIt<EnhancedMediaService>(),
        stateManager: getIt<ProductCreationStateManager>());

    getIt.registerLazySingleton<ProductCreationHandler>(
        () => productCreationHandler);

    Log.info('   ✅ Product creation handler factory ready');
  } catch (e, stack) {
    Log.error('Error during tier initialization', error: e, stackTrace: stack);
  } finally {}
}

void _initializeMessagingFactory() {
  Log.info('\n🏭 Initializing Messaging Service Factory...');

  MessagingServiceFactory.initialize(
    whatsappServiceAdapter: getIt<WhatsAppServiceAdapter>(),
    telegramServiceAdapter: getIt<TelegramServiceAdapter>(),
    whatsappService: getIt<WhatsAppService>(),
    telegramService: getIt<TelegramService>(),
  );

  final platforms =
      MessagingServiceFactory.registeredPlatforms.map((p) => p.name).join(', ');

  Log.info('   ✅ Messaging Service Factory initialized');
  Log.info('   📱 Registered platforms: $platforms');
}

// In a setup endpoint or initialization script
Future<void> initializeTierFeatures() async {
  var session = await Serverpod.instance.createSession();

  try {
    // 1. Fetch all existing tiers from the database
    final existingTiers = await TierFeature.db.find(session);

    // 2. Map them to a set of tiers for easy lookup
    final existingTierTypes = existingTiers.map((t) => t.tier).toSet();

    final tiersToCreate = [
      TierFeature(
        id: Uuid().v4obj(),
        tier: SubscriptionTier.freemium,
        dailyToolCallLimit: 15,
        monthlyToolCallLimit: 300,
        dailyAIMessageLimit: 100,
        monthlyAIMessageLimit: 2000,
        productLimit: 20,
        aiDescriptionLimit: 50,
        allowBulkOperations: false,
        allowAdvancedAnalytics: false,
        allowAPIAccess: false,
        allowWhiteLabel: false,
        supportPriority: 'standard',
        supportResponseTime: 24,
        monthlyPrice: 0.0,
        yearlyPrice: 0.0,
        platformTransactionFee: 0.05,
        overageToolCallPrice: 0.01,
        overageAIMessagePrice: 0.001,
        overageProductPrice: 1.0,
        overageAIDescriptionPrice: 0.1,
        isActive: true,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      TierFeature(
        id: Uuid().v4obj(),
        tier: SubscriptionTier.pro,
        dailyToolCallLimit: 50,
        monthlyToolCallLimit: 1200,
        dailyAIMessageLimit: 200,
        monthlyAIMessageLimit: 5000,
        productLimit: 100,
        aiDescriptionLimit: 200,
        allowBulkOperations: true,
        allowAdvancedAnalytics: true,
        allowAPIAccess: false,
        allowWhiteLabel: false,
        supportPriority: 'priority',
        supportResponseTime: 12,
        monthlyPrice: 29.99,
        yearlyPrice: 299.99,
        platformTransactionFee: 0.03,
        overageToolCallPrice: 0.008,
        overageAIMessagePrice: 0.0008,
        overageProductPrice: 0.5,
        overageAIDescriptionPrice: 0.08,
        isActive: true,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      TierFeature(
        id: Uuid().v4obj(),
        tier: SubscriptionTier.pro_max,
        dailyToolCallLimit: 100,
        monthlyToolCallLimit: 2500,
        dailyAIMessageLimit: 500,
        monthlyAIMessageLimit: 12000,
        productLimit: -1, // Unlimited
        aiDescriptionLimit: 500,
        allowBulkOperations: true,
        allowAdvancedAnalytics: true,
        allowAPIAccess: true,
        allowWhiteLabel: true,
        supportPriority: 'premium',
        supportResponseTime: 4,
        monthlyPrice: 99.99,
        yearlyPrice: 999.99,
        platformTransactionFee: 0.02,
        overageToolCallPrice: 0.005,
        overageAIMessagePrice: 0.0005,
        overageProductPrice: 0.0,
        overageAIDescriptionPrice: 0.05,
        isActive: true,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    ];

    int createdCount = 0;

    // 3. Loop through our desired tiers and only insert if missing
    for (var tier in tiersToCreate) {
      if (!existingTierTypes.contains(tier.tier)) {
        await TierFeature.db.insertRow(session, tier);
        createdCount++;
        Log.info('Created tier: ${tier.tier.name}');
      }
    }

    if (createdCount == 0) {
      Log.info('All tier features already exist. Skipping initialization.');
    } else {
      Log.success('Initialized $createdCount new tier features.');
    }
  } catch (e, stack) {
    Log.error('Error during tier initialization', error: e, stackTrace: stack);
  } finally {
    await session.close();
  }
}

// ==================== CLEANUP ====================

/// Cleanup all dependencies
void disposeDependencies() {
  if (getIt.isRegistered<WhatsAppService>()) {
    getIt<WhatsAppService>().dispose();
  }

  if (getIt.isRegistered<TelegramService>()) {
    getIt<TelegramService>().dispose();
  }

  MessagingServiceFactory.disposeAll();
  getIt.reset();

  Log.info('🧹 Dependencies disposed');
}
