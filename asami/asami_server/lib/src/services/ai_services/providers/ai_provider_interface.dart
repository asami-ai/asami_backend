// File: server/lib/src/ai/providers/ai_provider_interface.dart

import '../models/ai_request.dart';
import '../models/ai_response.dart';
import '../tools/tool_definition.dart';

/// Base interface for all AI providers (Claude, ChatGPT, Gemini, Grok, etc.)
abstract class AIProvider {
  /// Unique identifier for this provider
  String get providerId;
  
  /// Human-readable name
  String get providerName;
  
  /// Whether this provider supports function calling
  bool get supportsFunctionCalling;
  
  /// Whether this provider supports streaming responses
  bool get supportsStreaming;
  
  /// Maximum context window size in tokens
  int get maxContextTokens;
  
  /// Initialize the provider with API credentials
  Future<void> initialize(Map<String, String> credentials);
  
  /// Send a chat completion request
  Future<AIResponse> chat(AIRequest request);
  
  /// Send a chat completion request with streaming
  Stream<AIResponse> chatStream(AIRequest request);
  
  /// Register available tools/functions with the provider
  void registerTools(List<ToolDefinition> tools);
  
  /// Check if provider is healthy and available
  Future<bool> healthCheck();
  
  /// Get estimated token count for text
  int estimateTokens(String text);
  
  /// Clean up resources
  Future<void> dispose();
}

/// Factory for creating AI provider instances
class AIProviderFactory {
  static final Map<String, AIProvider Function()> _providers = {};
  
  /// Register a provider factory
  static void register(String providerId, AIProvider Function() factory) {
    _providers[providerId] = factory;
  }
  
  /// Create a provider instance
  static AIProvider create(String providerId) {
    final factory = _providers[providerId];
    if (factory == null) {
      throw Exception('AI provider not registered: $providerId');
    }
    return factory();
  }
  
  /// Get list of registered providers
  static List<String> getRegisteredProviders() {
    return _providers.keys.toList();
  }
}