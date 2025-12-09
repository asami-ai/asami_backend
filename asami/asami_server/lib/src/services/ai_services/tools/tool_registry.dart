// File: server/lib/src/ai/tools/tool_registry.dart

import 'package:asami_server/src/services/ai_services/tools/tool_definition.dart';

class ToolRegistry {
  final Map<String, ToolDefinition> _definitions = {};
  final Map<String, ToolHandler> _handlers = {};
  final Map<String, List<String>> _rolePermissions = {
    'customer': [],
    'vendor': [],
    'admin': [],
  };

  void register({
    required ToolDefinition definition,
    required ToolHandler handler,
    required List<String> allowedRoles,
  }) {
    _definitions[definition.name] = definition;
    _handlers[definition.name] = handler;
    
    for (var role in allowedRoles) {
      _rolePermissions[role]?.add(definition.name);
    }
  }

  List<ToolDefinition> getToolsForRole(String role) {
    final toolNames = _rolePermissions[role] ?? [];
    return toolNames.map((name) => _definitions[name]!).toList();
  }

  Future<Map<String, dynamic>> execute(
    String toolName,
    Map<String, dynamic> arguments,
    ToolExecutionContext context,
  ) async {
    final handler = _handlers[toolName];
    if (handler == null) {
      throw Exception('Tool not found: $toolName');
    }
    return await handler(arguments, context);
  }
}