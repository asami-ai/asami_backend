// File: server/lib/src/ai/utils/provider_logger.dart

import 'dart:convert';

import '../../../../utils/logger/asami_logger.dart';

class ProviderLogger {
  /// Pretty Log.info AI request with structured formatting
  static void logRequest({
    required String provider,
    required Map<String, dynamic> requestBody,
    bool includeFullBody = false,
  }) {
    Log.info('\n${'=' * 60}');
    Log.info('🤖 $provider REQUEST');
    Log.info('=' * 60);
    
    // Extract key information
    final model = requestBody['model'];
    final messages = requestBody['messages'] ?? requestBody['contents'];
    final tools = requestBody['tools'];
    final config = requestBody['generationConfig'];
    
    Log.info('📋 Model: $model');
    
    if (config != null) {
      Log.info('⚙️  Config:');
      Log.info('   - Max Tokens: ${config['maxOutputTokens'] ?? config['max_tokens']}');
      Log.info('   - Temperature: ${config['temperature'] ?? 'default'}');
    }
    
    if (tools != null) {
      final toolList = _extractToolNames(tools);
      Log.info('🔧 Tools Available (${toolList.length}): ${toolList.take(5).join(', ')}${toolList.length > 5 ? '...' : ''}');
    }
    
    if (messages != null) {
      Log.info('\n💬 Conversation (${messages.length} messages):');
      _logMessages(messages, provider);
    }
    
    if (includeFullBody) {
      Log.info('\n📦 Full Request Body:');
      Log.info(JsonEncoder.withIndent('  ').convert(requestBody));
    }
    
    Log.info('=' * 60 + '\n');
  }
  
  /// Pretty Log.info AI response
  static void logResponse({
    required String provider,
    required String responseBody,
    bool includeFullBody = false,
  }) {
    Log.info('\n${'=' * 60}');
    Log.info('📨 $provider RESPONSE');
    Log.info('=' * 60);
    
    try {
      final json = jsonDecode(responseBody);
      
      // Check for errors first
      if (json['error'] != null) {
        Log.info('❌ ERROR:');
        Log.info('   Code: ${json['error']['code']}');
        Log.info('   Message: ${json['error']['message']}');
        Log.info('   Status: ${json['error']['status'] ?? 'N/A'}');
        Log.info('=' * 60 + '\n');
        return;
      }
      
      // Extract response based on provider
      if (provider.contains('Gemini')) {
        _logGeminiResponse(json);
      } else if (provider.contains('OpenAI')) {
        _logOpenAIResponse(json);
      } else if (provider.contains('Claude')) {
        _logClaudeResponse(json);
      }
      
      if (includeFullBody) {
        Log.info('\n📦 Full Response Body:');
        Log.info(JsonEncoder.withIndent('  ').convert(json));
      }
      
    } catch (e) {
      Log.info('⚠️  Failed to parse response: $e');
      Log.info('Raw response: ${responseBody.substring(0, responseBody.length > 500 ? 500 : responseBody.length)}...');
    }
    
    Log.info('=' * 60 + '\n');
  }
  
  static void _logMessages(List<dynamic> messages, String provider) {
    int messageCount = 0;
    
    for (var msg in messages) {
      messageCount++;
      if (messageCount > 10) {
        Log.info('   ... and ${messages.length - 10} more messages');
        break;
      }
      
      final role = msg['role'];
      final parts = msg['parts'];
      final content = msg['content'];
      final toolCalls = msg['tool_calls'];
      
      // Gemini format
      if (parts != null) {
        for (var part in parts) {
          if (part['text'] != null) {
            final text = part['text'] as String;
            final preview = text.length > 80 ? '${text.substring(0, 80)}...' : text;
            Log.info('   [$role] $preview');
          }
          if (part['functionCall'] != null) {
            Log.info('   [$role] 🔧 Function Call: ${part['functionCall']['name']}');
            Log.info('        Args: ${_formatArgs(part['functionCall']['args'])}');
          }
          if (part['functionResponse'] != null) {
            Log.info('   [$role] ✅ Function Response: ${part['functionResponse']['name']}');
          }
        }
      }
      // OpenAI/Claude format
      else if (content != null || toolCalls != null) {
        if (content != null && content is String && content.isNotEmpty) {
          final preview = content.length > 80 ? '${content.substring(0, 80)}...' : content;
          Log.info('   [$role] $preview');
        }
        if (toolCalls != null) {
          for (var tc in toolCalls) {
            final name = tc['function']?['name'] ?? tc['name'];
            Log.info('   [$role] 🔧 Function Call: $name');
          }
        }
      }
    }
  }
  
  static void _logGeminiResponse(Map<String, dynamic> json) {
    final candidates = json['candidates'];
    if (candidates == null || candidates.isEmpty) {
      Log.info('⚠️  No candidates in response');
      return;
    }
    
    final candidate = candidates[0];
    final content = candidate['content'];
    final parts = content['parts'];
    
    if (parts != null) {
      for (var part in parts) {
        if (part['text'] != null) {
          Log.info('💬 Text Response:');
          Log.info('   ${part['text']}');
        }
        if (part['functionCall'] != null) {
          Log.info('🔧 Function Call:');
          Log.info('   Name: ${part['functionCall']['name']}');
          Log.info('   Args: ${_formatArgs(part['functionCall']['args'])}');
        }
      }
    }
    
    Log.info('🏁 Finish Reason: ${candidate['finishReason']}');
    
    if (json['usageMetadata'] != null) {
      final usage = json['usageMetadata'];
      Log.info('📊 Token Usage:');
      Log.info('   Prompt: ${usage['promptTokenCount']}');
      Log.info('   Response: ${usage['candidatesTokenCount']}');
      Log.info('   Total: ${usage['totalTokenCount']}');
    }
  }
  
  static void _logOpenAIResponse(Map<String, dynamic> json) {
    final choice = json['choices']?[0];
    if (choice == null) {
      Log.info('⚠️  No choices in response');
      return;
    }
    
    final message = choice['message'];
    
    if (message['content'] != null) {
      Log.info('💬 Text Response:');
      Log.info('   ${message['content']}');
    }
    
    if (message['tool_calls'] != null) {
      Log.info('🔧 Function Calls:');
      for (var tc in message['tool_calls']) {
        Log.info('   Name: ${tc['function']['name']}');
        Log.info('   Args: ${tc['function']['arguments']}');
      }
    }
    
    Log.info('🏁 Finish Reason: ${choice['finish_reason']}');
    
    if (json['usage'] != null) {
      final usage = json['usage'];
      Log.info('📊 Token Usage:');
      Log.info('   Prompt: ${usage['prompt_tokens']}');
      Log.info('   Response: ${usage['completion_tokens']}');
      Log.info('   Total: ${usage['total_tokens']}');
    }
  }
  
  static void _logClaudeResponse(Map<String, dynamic> json) {
    final content = json['content'];
    
    if (content != null) {
      for (var item in content) {
        if (item['type'] == 'text') {
          Log.info('💬 Text Response:');
          Log.info('   ${item['text']}');
        }
        if (item['type'] == 'tool_use') {
          Log.info('🔧 Function Call:');
          Log.info('   Name: ${item['name']}');
          Log.info('   Args: ${_formatArgs(item['input'])}');
        }
      }
    }
    
    Log.info('🏁 Stop Reason: ${json['stop_reason']}');
    
    if (json['usage'] != null) {
      final usage = json['usage'];
      Log.info('📊 Token Usage:');
      Log.info('   Input: ${usage['input_tokens']}');
      Log.info('   Output: ${usage['output_tokens']}');
    }
  }
  
  static List<String> _extractToolNames(dynamic tools) {
    final names = <String>[];
    
    if (tools is List) {
      for (var tool in tools) {
        if (tool['functionDeclarations'] != null) {
          // Gemini format
          for (var func in tool['functionDeclarations']) {
            names.add(func['name']);
          }
        } else if (tool['function'] != null) {
          // OpenAI format
          names.add(tool['function']['name']);
        } else if (tool['name'] != null) {
          // Claude format
          names.add(tool['name']);
        }
      }
    }
    
    return names;
  }
  
  static String _formatArgs(dynamic args) {
    if (args == null) return '{}';
    if (args is String) return args;
    
    try {
      final json = args as Map<String, dynamic>;
      if (json.isEmpty) return '{}';
      
      final entries = json.entries.take(3).map((e) {
        final value = e.value.toString();
        final preview = value.length > 30 ? '${value.substring(0, 30)}...' : value;
        return '${e.key}: $preview';
      }).join(', ');
      
      return json.length > 3 ? '{$entries, ...}' : '{$entries}';
    } catch (e) {
      return args.toString();
    }
  }
}