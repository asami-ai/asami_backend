// File: server/lib/src/ai/models/ai_request.dart

import '../tools/tool_definition.dart';
import 'tool_call.dart';

/// Represents a message in the conversation
class AIMessage {
  final String role; // 'user', 'assistant', 'system', 'tool'
  final String content;
  final String? name; // For tool responses
  final String? toolCallId; // For tool responses
  final List<ToolCall>? toolCalls; // For assistant tool calls

  AIMessage({
    required this.role,
    required this.content,
    this.name,
    this.toolCallId,
    this.toolCalls,
  });

  Map<String, dynamic> toJson() => {
        'role': role,
        'content': content,
        if (name != null) 'name': name,
        if (toolCallId != null) 'tool_call_id': toolCallId,
        if (toolCalls != null)
          'tool_calls': toolCalls!.map((t) => t.toJson()).toList(),
      };
}


/// Request to AI provider
class AIRequest {
  final List<AIMessage> messages;
  final List<ToolDefinition>? tools;
  final String? systemPrompt;
  final double? temperature;
  final int? maxTokens;
  final bool? stream;
  final Map<String, dynamic>? metadata;

  AIRequest({
    required this.messages,
    this.tools,
    this.systemPrompt,
    this.temperature,
    this.maxTokens,
    this.stream,
    this.metadata,
  });
}