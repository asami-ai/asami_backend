// File: server/lib/src/ai/providers/claude_provider.dart

import 'dart:convert';
import 'package:asami_server/src/services/ai_services/models/tool_call.dart';
import 'package:http/http.dart' as http;
import '../utils/provider_logging.dart';
import 'ai_provider_interface.dart';
import '../models/ai_request.dart';
import '../models/ai_response.dart';
import '../tools/tool_definition.dart';

class ClaudeProvider implements AIProvider {
  String? _apiKey;
  String _baseUrl = 'https://api.anthropic.com/v1';
  String _model = 'claude-sonnet-4-20250514';
  List<ToolDefinition> _tools = [];
  
  @override
  String get providerId => 'claude';
  
  @override
  String get providerName => 'Claude (Anthropic)';
  
  @override
  bool get supportsFunctionCalling => true;
  
  @override
  bool get supportsStreaming => true;
  
  @override
  int get maxContextTokens => 200000;
  
  @override
  Future<void> initialize(Map<String, String> credentials) async {
    _apiKey = credentials['api_key'];
    if (credentials.containsKey('base_url')) {
      _baseUrl = credentials['base_url']!;
    }
    if (credentials.containsKey('model')) {
      _model = credentials['model']!;
    }
    
    if (_apiKey == null) {
      throw Exception('Claude API key is required');
    }
  }
  
  @override
  void registerTools(List<ToolDefinition> tools) {
    _tools = tools;
  }
  
  @override
  Future<AIResponse> chat(AIRequest request) async {
    try {
      final requestBody = _buildRequestBody(request);
      
      ProviderLogger.logRequest(
        provider: 'Claude',
        requestBody: requestBody,
        includeFullBody: false,
      );

      final response = await http.post(
        Uri.parse('$_baseUrl/messages'),
        headers: {
          'Content-Type': 'application/json',
          'x-api-key': _apiKey!,
          'anthropic-version': '2023-06-01',
        },
        body: jsonEncode(requestBody),
      );
      
      ProviderLogger.logResponse(
        provider: 'Claude',
        responseBody: response.body,
        includeFullBody: response.statusCode != 200,
      );

      if (response.statusCode != 200) {
        return AIResponse.error(
          'Claude API error: ${response.statusCode} - ${response.body}',
        );
      }
      
      return _parseResponse(response.body);
    } catch (e) {
      return AIResponse.error('Claude API request failed: $e');
    }
  }
  
  @override
  Stream<AIResponse> chatStream(AIRequest request) async* {
    throw UnimplementedError('Streaming not yet implemented');
  }
  
  Map<String, dynamic> _buildRequestBody(AIRequest request) {
    final messages = <Map<String, dynamic>>[];

    // Build messages array
    for (var msg in request.messages) {
      // Skip system messages (handled separately)
      if (msg.role == 'system') continue;

      final content = <dynamic>[];

      // Add text content
      if (msg.content.isNotEmpty) {
        content.add({
          'type': 'text',
          'text': msg.content,
        });
      }

      // Handle tool calls (from assistant)
      if (msg.toolCalls != null && msg.toolCalls!.isNotEmpty) {
        for (var tc in msg.toolCalls!) {
          content.add({
            'type': 'tool_use',
            'id': tc.id,
            'name': tc.name,
            'input': _sanitizeArguments(tc.arguments), // FIXED: Sanitize args
          });
        }
      }

      // Handle tool results
      if (msg.role == 'tool' && msg.toolCallId != null) {
        try {
          final result = jsonDecode(msg.content);
          content.add({
            'type': 'tool_result',
            'tool_use_id': msg.toolCallId,
            'content': jsonEncode(result),
          });
        } catch (e) {
          content.add({
            'type': 'tool_result',
            'tool_use_id': msg.toolCallId,
            'content': msg.content,
          });
        }
      }

      if (content.isNotEmpty) {
        messages.add({
          'role': msg.role == 'assistant' ? 'assistant' : 'user',
          'content': content,
        });
      }
    }

    final body = <String, dynamic>{
      'model': _model,
      'max_tokens': (request.maxTokens ?? 4000).toInt(), // FIXED: Ensure int
      'messages': messages,
    };
    
    if (request.systemPrompt != null) {
      body['system'] = request.systemPrompt;
    }
    
    if (request.temperature != null) {
      body['temperature'] = request.temperature!.toDouble(); // FIXED: Ensure double
    }
    
    if (_tools.isNotEmpty) {
      body['tools'] = _tools.map((t) => t.toAnthropicFormat()).toList();
    }
    
    return body;
  }

  /// Sanitize arguments to ensure correct types
  Map<String, dynamic> _sanitizeArguments(Map<String, dynamic> args) {
    final sanitized = <String, dynamic>{};
    
    args.forEach((key, value) {
      if (value is num) {
        // Convert to appropriate type
        if (value is double && value == value.toInt()) {
          sanitized[key] = value.toInt();
        } else if (value is int) {
          sanitized[key] = value;
        } else {
          sanitized[key] = value.toDouble();
        }
      } else if (value is Map) {
        sanitized[key] = _sanitizeArguments(value.cast<String, dynamic>());
      } else if (value is List) {
        sanitized[key] = value.map((item) {
          if (item is Map) {
            return _sanitizeArguments(item.cast<String, dynamic>());
          }
          return item;
        }).toList();
      } else {
        sanitized[key] = value;
      }
    });

    return sanitized;
  }
  
  AIResponse _parseResponse(String responseBody) {
    try {
      final json = jsonDecode(responseBody);
      
      if (json['error'] != null) {
        return AIResponse.error(
          'Claude API error: ${json['error']['message'] ?? 'Unknown error'}',
        );
      }

      String? text;
      List<ToolCall>? toolCalls;
      
      for (var content in json['content']) {
        if (content['type'] == 'text') {
          text = content['text'];
        } else if (content['type'] == 'tool_use') {
          toolCalls ??= [];
          toolCalls.add(ToolCall(
            id: content['id'],
            name: content['name'],
            arguments: content['input'],
          ));
        }
      }
      
      return AIResponse.success(
        text: text,
        toolCalls: toolCalls,
        finishReason: json['stop_reason'],
        usage: json['usage'],
      );
    } catch (e) {
      return AIResponse.error('Failed to parse Claude response: $e');
    }
  }
  
  @override
  Future<bool> healthCheck() async {
    try {
      final response = await http.get(
        Uri.parse('https://status.anthropic.com/api/v2/status.json'),
      );
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
  
  @override
  int estimateTokens(String text) {
    return (text.length / 4).ceil();
  }
  
  @override
  Future<void> dispose() async {
    // Clean up resources
  }
}