// File: server/lib/src/ai/providers/openai_provider.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../utils/provider_logging.dart';
import 'ai_provider_interface.dart';
import '../models/ai_request.dart';
import '../models/ai_response.dart';
import '../models/tool_call.dart';
import '../tools/tool_definition.dart';

/// OpenAI (ChatGPT) Provider Implementation
class OpenAIProvider implements AIProvider {
  String? _apiKey;
  String _baseUrl = 'https://api.openai.com/v1';
  String _model = 'gpt-4o-mini';
  List<ToolDefinition> _tools = [];

  @override
  String get providerId => 'openai';

  @override
  String get providerName => 'ChatGPT (OpenAI)';

  @override
  bool get supportsFunctionCalling => true;

  @override
  bool get supportsStreaming => true;

  @override
  int get maxContextTokens => 128000; // GPT-4 Turbo

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
      throw Exception('OpenAI API key is required');
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
        provider: 'OpenAI',
        requestBody: requestBody,
        includeFullBody: false,
      );

      final response = await http.post(
        Uri.parse('$_baseUrl/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_apiKey',
        },
        body: jsonEncode(requestBody),
      );

      ProviderLogger.logResponse(
        provider: 'OpenAI',
        responseBody: response.body,
        includeFullBody: response.statusCode != 200,
      );

      if (response.statusCode != 200) {
        return AIResponse.error(
          'OpenAI API error: ${response.statusCode} - ${response.body}',
        );
      }

      return _parseResponse(response.body);
    } catch (e) {
      return AIResponse.error('OpenAI API request failed: $e');
    }
  }

  @override
  Stream<AIResponse> chatStream(AIRequest request) async* {
    try {
      final requestBody = _buildRequestBody(request);
      requestBody['stream'] = true;

      final client = http.Client();
      final streamRequest = http.Request(
        'POST',
        Uri.parse('$_baseUrl/chat/completions'),
      );
      streamRequest.headers.addAll({
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_apiKey',
      });
      streamRequest.body = jsonEncode(requestBody);

      final streamedResponse = await client.send(streamRequest);

      await for (var chunk in streamedResponse.stream.transform(utf8.decoder)) {
        final lines = chunk.split('\n');
        for (var line in lines) {
          if (line.startsWith('data: ')) {
            final data = line.substring(6);
            if (data.trim() == '[DONE]') continue;
            
            try {
              final json = jsonDecode(data);
              final delta = json['choices']?[0]?['delta'];
              
              if (delta != null) {
                String? text;
                List<ToolCall>? toolCalls;

                if (delta['content'] != null) {
                  text = delta['content'];
                }

                if (delta['tool_calls'] != null) {
                  toolCalls = _parseToolCalls(delta['tool_calls']);
                }

                yield AIResponse.success(
                  text: text,
                  toolCalls: toolCalls,
                  finishReason: json['choices']?[0]?['finish_reason'],
                );
              }
            } catch (e) {
              continue;
            }
          }
        }
      }

      client.close();
    } catch (e) {
      yield AIResponse.error('OpenAI streaming failed: $e');
    }
  }

  Map<String, dynamic> _buildRequestBody(AIRequest request) {
    final messages = <Map<String, dynamic>>[];

    // Add system prompt if provided
    if (request.systemPrompt != null) {
      messages.add({
        'role': 'system',
        'content': request.systemPrompt,
      });
    }

    // Add conversation messages
    for (var msg in request.messages) {
      final message = <String, dynamic>{
        'role': msg.role,
      };

      if (msg.content.isNotEmpty) {
        message['content'] = msg.content;
      }

      if (msg.toolCalls != null && msg.toolCalls!.isNotEmpty) {
        message['tool_calls'] = msg.toolCalls!.map((tc) => {
          'id': tc.id,
          'type': 'function',
          'function': {
            'name': tc.name,
            'arguments': jsonEncode(_sanitizeArguments(tc.arguments)), // FIXED: Sanitize args
          },
        }).toList();
      }

      if (msg.toolCallId != null) {
        message['tool_call_id'] = msg.toolCallId;
        message['role'] = 'tool';
        message['name'] = msg.name;
      }

      messages.add(message);
    }

    final body = <String, dynamic>{
      'model': _model,
      'messages': messages,
      'max_tokens': (request.maxTokens ?? 4000).toInt(), // FIXED: Ensure int
    };

    if (request.temperature != null) {
      body['temperature'] = request.temperature!.toDouble(); // FIXED: Ensure double
    }

    if (_tools.isNotEmpty) {
      body['tools'] = _tools.map((t) => t.toOpenAIFormat()).toList();
      body['tool_choice'] = 'auto';
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
          'OpenAI API error: ${json['error']['message'] ?? 'Unknown error'}',
        );
      }

      final choice = json['choices'][0];
      final message = choice['message'];

      String? text = message['content'];
      List<ToolCall>? toolCalls;

      if (message['tool_calls'] != null) {
        toolCalls = _parseToolCalls(message['tool_calls']);
      }

      return AIResponse.success(
        text: text,
        toolCalls: toolCalls,
        finishReason: choice['finish_reason'],
        usage: json['usage'],
      );
    } catch (e) {
      return AIResponse.error('Failed to parse OpenAI response: $e');
    }
  }

  List<ToolCall> _parseToolCalls(List<dynamic> toolCallsJson) {
    return toolCallsJson.map((tc) {
      final function = tc['function'];
      return ToolCall(
        id: tc['id'],
        name: function['name'],
        arguments: jsonDecode(function['arguments']),
      );
    }).toList();
  }

  @override
  Future<bool> healthCheck() async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/models'),
        headers: {
          'Authorization': 'Bearer $_apiKey',
        },
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