// File: server/lib/src/ai/providers/gemini_provider.dart

import 'dart:convert';
import 'package:asami_server/utils/logger/asami_logger.dart';
import 'package:http/http.dart' as http;
import '../utils/provider_logging.dart';
import 'ai_provider_interface.dart';
import '../models/ai_request.dart';
import '../models/ai_response.dart';
import '../models/tool_call.dart';
import '../tools/tool_definition.dart';

/// Google Gemini Provider Implementation
class GeminiProvider implements AIProvider {
  String? _apiKey;
  String _baseUrl = 'https://generativelanguage.googleapis.com/v1beta';
  String _model = 'gemini-2.5-flash';
  List<ToolDefinition> _tools = [];

  @override
  String get providerId => 'gemini';

  @override
  String get providerName => 'Gemini (Google)';

  @override
  bool get supportsFunctionCalling => true;

  @override
  bool get supportsStreaming => true;

  @override
  int get maxContextTokens => 1000000; // Gemini 1.5 Pro

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
      throw Exception('Gemini API key is required');
    }
  }

  @override
  void registerTools(List<ToolDefinition> tools) {
    _tools = tools;
  }

  @override
  Future<AIResponse> chat(AIRequest request) async {
    try {
      final endpoint = '$_baseUrl/models/$_model:generateContent';

      final requestBody = _buildRequestBody(request);
      
      // Use new logger
      ProviderLogger.logRequest(
        provider: 'Gemini',
        requestBody: requestBody,
        includeFullBody: false, // Set to true for debugging
      );

      final response = await http.post(
        Uri.parse('$endpoint?key=$_apiKey'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(requestBody),
      );

      // Use new logger for response
      ProviderLogger.logResponse(
        provider: 'Gemini',
        responseBody: response.body,
        includeFullBody: response.statusCode != 200,
      );

      if (response.statusCode != 200) {
        return AIResponse.error(
          'Gemini API error: ${response.statusCode} - ${response.body}',
        );
      }

      return _parseResponse(response.body);
    } catch (e, stackTrace) {
      Log.info('❌ Gemini Exception: $e');
      Log.info('Stack trace: $stackTrace');
      return AIResponse.error('Gemini API request failed: $e');
    }
  }

  @override
  Stream<AIResponse> chatStream(AIRequest request) async* {
    try {
      final endpoint = '$_baseUrl/models/$_model:streamGenerateContent';
      
      final response = await http.post(
        Uri.parse('$endpoint?key=$_apiKey&alt=sse'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(_buildRequestBody(request)),
      );

      if (response.statusCode != 200) {
        yield AIResponse.error('Gemini streaming error: ${response.statusCode}');
        return;
      }

      final lines = response.body.split('\n');
      for (var line in lines) {
        if (line.startsWith('data: ')) {
          final data = line.substring(6);
          try {
            final json = jsonDecode(data);
            final candidate = json['candidates']?[0];
            
            if (candidate != null) {
              final content = candidate['content'];
              String? text;
              List<ToolCall>? toolCalls;

              if (content['parts'] != null) {
                for (var part in content['parts']) {
                  if (part['text'] != null) {
                    text = (text ?? '') + part['text'];
                  }
                  if (part['functionCall'] != null) {
                    toolCalls ??= [];
                    toolCalls.add(ToolCall(
                      id: DateTime.now().millisecondsSinceEpoch.toString(),
                      name: part['functionCall']['name'],
                      arguments: part['functionCall']['args'] ?? {},
                    ));
                  }
                }
              }

              yield AIResponse.success(
                text: text,
                toolCalls: toolCalls,
                finishReason: candidate['finishReason'],
              );
            }
          } catch (e) {
            continue;
          }
        }
      }
    } catch (e) {
      yield AIResponse.error('Gemini streaming failed: $e');
    }
  }

  Map<String, dynamic> _buildRequestBody(AIRequest request) {
    final contents = <Map<String, dynamic>>[];

    // Gemini combines system prompt with first user message
    String? systemPrompt = request.systemPrompt;
    bool systemPromptAdded = false;

    for (var i = 0; i < request.messages.length; i++) {
      final msg = request.messages[i];
      
      // Skip tool response messages - they're handled differently
      if (msg.role == 'tool') {
        // Tool responses must come AFTER the model's function call
        // and be wrapped as a 'user' role message
        try {
          final responseData = jsonDecode(msg.content);
          contents.add({
            'role': 'user',
            'parts': [
              {
                'functionResponse': {
                  'name': msg.name!,
                  'response': responseData,
                },
              }
            ],
          });
        } catch (e) {
          // If not valid JSON, wrap it
          contents.add({
            'role': 'user',
            'parts': [
              {
                'functionResponse': {
                  'name': msg.name!,
                  'response': {'result': msg.content},
                },
              }
            ],
          });
        }
        continue;
      }

      final parts = <Map<String, dynamic>>[];

      // Add system prompt to first user message only once
      if (!systemPromptAdded && msg.role == 'user' && systemPrompt != null && systemPrompt.isNotEmpty) {
        parts.add({'text': '$systemPrompt\n\n${msg.content}'});
        systemPromptAdded = true;
      } else if (msg.content.isNotEmpty) {
        parts.add({'text': msg.content});
      }

      // Handle tool calls from assistant
      if (msg.toolCalls != null && msg.toolCalls!.isNotEmpty) {
        for (var tc in msg.toolCalls!) {
          final sanitizedArgs = _sanitizeArguments(tc.arguments);
          parts.add({
            'functionCall': {
              'name': tc.name,
              'args': sanitizedArgs,
            },
          });
        }
      }

      // Only add if we have parts
      if (parts.isNotEmpty) {
        contents.add({
          'role': _convertRole(msg.role),
          'parts': parts,
        });
      }
    }

    // Build generation config with proper type conversions
    final generationConfig = <String, dynamic>{
      'maxOutputTokens': (request.maxTokens ?? 4000).toInt(),
    };

    if (request.temperature != null) {
      generationConfig['temperature'] = request.temperature!.toDouble();
    }

    final body = <String, dynamic>{
      'contents': contents,
      'generationConfig': generationConfig,
    };

    if (_tools.isNotEmpty) {
      body['tools'] = [
        {
          'functionDeclarations': _tools.map((t) => t.toGeminiFormat()).toList(),
        }
      ];
    }

    return body;
  }

  /// Sanitize arguments to ensure correct types for Gemini
  Map<String, dynamic> _sanitizeArguments(Map<String, dynamic> args) {
    final sanitized = <String, dynamic>{};
    
    args.forEach((key, value) {
      if (value is num) {
        // Check if the parameter should be an int or double based on context
        // For Gemini, integers should be int, floats should be double
        if (value is double && value == value.toInt()) {
          // It's a whole number stored as double, convert to int
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

  String _convertRole(String role) {
    switch (role) {
      case 'assistant':
        return 'model';
      case 'system':
      case 'user':
        return 'user';
      case 'tool':
        // Tool responses are handled separately and should use 'user' role
        return 'user';
      default:
        return 'user';
    }
  }

  AIResponse _parseResponse(String responseBody) {
    try {
      final json = jsonDecode(responseBody);
      
      // Check for errors
      if (json['error'] != null) {
        return AIResponse.error(
          'Gemini API error: ${json['error']['message'] ?? 'Unknown error'}',
        );
      }

      final candidates = json['candidates'];
      if (candidates == null || candidates.isEmpty) {
        return AIResponse.error('No candidates in Gemini response');
      }

      final candidate = candidates[0];
      final content = candidate['content'];

      String? text;
      List<ToolCall>? toolCalls;

      if (content['parts'] != null) {
        for (var part in content['parts']) {
          if (part['text'] != null) {
            text = (text ?? '') + part['text'];
          }

          if (part['functionCall'] != null) {
            toolCalls ??= [];
            toolCalls.add(ToolCall(
              id: DateTime.now().millisecondsSinceEpoch.toString(),
              name: part['functionCall']['name'],
              arguments: part['functionCall']['args'] ?? {},
            ));
          }
        }
      }

      return AIResponse.success(
        text: text,
        toolCalls: toolCalls,
        finishReason: candidate['finishReason'],
        usage: json['usageMetadata'],
      );
    } catch (e, stackTrace) {
      print('❌ Parse error: $e');
      print('Stack trace: $stackTrace');
      return AIResponse.error('Failed to parse Gemini response: $e');
    }
  }

  @override
  Future<bool> healthCheck() async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/models/$_model?key=$_apiKey'),
      );
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  @override
  int estimateTokens(String text) {
    // Gemini: ~4 characters per token
    return (text.length / 4).ceil();
  }

  @override
  Future<void> dispose() async {
    // Clean up resources
  }
}