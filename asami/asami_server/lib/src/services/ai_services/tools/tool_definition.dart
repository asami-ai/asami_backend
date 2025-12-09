import 'package:serverpod/serverpod.dart';

/// Provider-neutral tool definition
class ToolDefinition {
  final String name;
  final String description;
  final Map<String, ToolParameter> parameters;
  final List<String>? requiredParameters;
  final bool? strict;

  ToolDefinition({
    required this.name,
    required this.description,
    required this.parameters,
    this.requiredParameters,
    this.strict,
  });

  /// Convert to OpenAI format
  Map<String, dynamic> toOpenAIFormat() {
    return {
      'type': 'function',
      'function': {
        'name': name,
        'description': description,
        'parameters': {
          'type': 'object',
          'properties': parameters.map(
            (key, value) => MapEntry(key, value.toJson()),
          ),
          'required': requiredParameters ?? [],
        },
        if (strict != null) 'strict': strict,
      },
    };
  }

  /// Convert to Anthropic format
  Map<String, dynamic> toAnthropicFormat() {
    return {
      'name': name,
      'description': description,
      'input_schema': {
        'type': 'object',
        'properties': parameters.map(
          (key, value) => MapEntry(key, value.toJson()),
        ),
        'required': requiredParameters ?? [],
      },
    };
  }

  /// Convert to Gemini format
  Map<String, dynamic> toGeminiFormat() {
    return {
      'name': name,
      'description': description,
      'parameters': {
        'type': 'object',
        'properties': parameters.map(
          (key, value) => MapEntry(key, value.toJson()),
        ),
        'required': requiredParameters ?? [],
      },
    };
  }
}

/// Parameter definition for tools
class ToolParameter {
  final String type;
  final String? description;
  final List<String>? enumValues;
  final Map<String, ToolParameter>? properties;
  final ToolParameter? items;
  final dynamic defaultValue;

  ToolParameter({
    required this.type,
    this.description,
    this.enumValues,
    this.properties,
    this.items,
    this.defaultValue,
  });

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{
      'type': type,
    };
    if (description != null) json['description'] = description;
    if (enumValues != null) json['enum'] = enumValues;
    if (properties != null) {
      json['properties'] = properties!.map(
        (key, value) => MapEntry(key, value.toJson()),
      );
    }
    if (items != null) json['items'] = items!.toJson();
    if (defaultValue != null) json['default'] = defaultValue;
    return json;
  }
}

/// Tool execution handler
typedef ToolHandler = Future<Map<String, dynamic>> Function(
  Map<String, dynamic> arguments,
  ToolExecutionContext context,
);

/// Context provided during tool execution (UPDATED - Added session)
class ToolExecutionContext {
  final Session? session; // NEW: Added session for database access
  final String userId;
  final String conversationId;
  final String platform;
  final String userType;
  final Map<String, dynamic>? sessionData;

  ToolExecutionContext({
    this.session,
    required this.userId,
    required this.conversationId,
    required this.platform,
    required this.userType,
    this.sessionData,
  });
}