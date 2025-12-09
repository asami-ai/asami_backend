
import 'package:asami_server/src/services/ai_services/models/ai_request.dart';

import 'tool_call.dart';

/// Response from AI provider
class AIResponse {
  final String? text;
  final List<ToolCall>? toolCalls;
  final String? finishReason; // 'stop', 'length', 'tool_calls', 'content_filter'
  final Map<String, dynamic>? usage;
  final Map<String, dynamic>? metadata;
  final bool success;
  final String? error;
  
  AIResponse({
    this.text,
    this.toolCalls,
    this.finishReason,
    this.usage,
    this.metadata,
    required this.success,
    this.error,
  });
  
  factory AIResponse.success({
    String? text,
    List<ToolCall>? toolCalls,
    String? finishReason,
    Map<String, dynamic>? usage,
    Map<String, dynamic>? metadata,
  }) {
    return AIResponse(
      text: text,
      toolCalls: toolCalls,
      finishReason: finishReason,
      usage: usage,
      metadata: metadata,
      success: true,
    );
  }
  
  factory AIResponse.error(String error) {
    return AIResponse(
      success: false,
      error: error,
    );
  }
}
