// File: server/lib/src/ai/tools/tool_registry.dart
import 'package:asami_server/src/services/ai_services/tools/tool_definition.dart';

/// Enhanced Tool Registry with utility methods and better organization
class ToolRegistry {
  final Map<String, ToolDefinition> _definitions = {};
  final Map<String, ToolHandler> _handlers = {};
  final Map<String, List<String>> _rolePermissions = {
    'customer': [],
    'vendor': [],
    'admin': [],
  };

  /// Register a tool with its handler and permissions
  void register({
    required ToolDefinition definition,
    required ToolHandler handler,
    required List<String> allowedRoles,
  }) {
    _definitions[definition.name] = definition;
    _handlers[definition.name] = handler;
    
    for (var role in allowedRoles) {
      if (_rolePermissions.containsKey(role)) {
        _rolePermissions[role]!.add(definition.name);
      }
    }
  }

  /// Get all tools available for a specific role
  List<ToolDefinition> getToolsForRole(String role) {
    final toolNames = _rolePermissions[role] ?? [];
    return toolNames.map((name) => _definitions[name]!).toList();
  }

  /// Execute a tool with the given arguments and context
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

  /// Get total number of registered tools
  int getRegisteredToolCount() {
    return _definitions.length;
  }

  /// Get all registered tool names
  List<String> getAllToolNames() {
    return _definitions.keys.toList();
  }

  /// Get tool definition by name
  ToolDefinition? getToolDefinition(String toolName) {
    return _definitions[toolName];
  }

  /// Check if a tool is registered
  bool isToolRegistered(String toolName) {
    return _definitions.containsKey(toolName);
  }

  /// Get tools count by role
  Map<String, int> getToolCountByRole() {
    return _rolePermissions.map((role, tools) => MapEntry(role, tools.length));
  }

  /// Get all tools available for a role (by name only)
  List<String> getToolNamesForRole(String role) {
    return _rolePermissions[role] ?? [];
  }

  /// Check if a role has access to a specific tool
  bool hasAccess(String role, String toolName) {
    return _rolePermissions[role]?.contains(toolName) ?? false;
  }

  /// Get roles that have access to a specific tool
  List<String> getRolesForTool(String toolName) {
    final roles = <String>[];
    _rolePermissions.forEach((role, tools) {
      if (tools.contains(toolName)) {
        roles.add(role);
      }
    });
    return roles;
  }

  /// Get detailed registry statistics
  Map<String, dynamic> getStatistics() {
    return {
      'total_tools': _definitions.length,
      'total_roles': _rolePermissions.length,
      'tools_by_role': getToolCountByRole(),
      'roles': _rolePermissions.keys.toList(),
      'most_common_tools': _getMostCommonTools(),
    };
  }

  /// Get tools that are available to multiple roles
  List<String> _getMostCommonTools() {
    final toolRoleCounts = <String, int>{};
    
    _rolePermissions.forEach((role, tools) {
      for (var tool in tools) {
        toolRoleCounts[tool] = (toolRoleCounts[tool] ?? 0) + 1;
      }
    });

    // Return tools accessible by 2+ roles
    return toolRoleCounts.entries
        .where((entry) => entry.value >= 2)
        .map((entry) => entry.key)
        .toList();
  }

  /// Get tools unique to a specific role
  List<String> getUniqueToolsForRole(String role) {
    final roleTools = _rolePermissions[role] ?? [];
    final otherRoles = _rolePermissions.keys.where((r) => r != role);
    final otherTools = otherRoles
        .expand((r) => _rolePermissions[r] ?? [])
        .toSet();

    return roleTools.where((tool) => !otherTools.contains(tool)).toList();
  }

  /// Get shared tools between two roles
  List<String> getSharedTools(String role1, String role2) {
    final tools1 = (_rolePermissions[role1] ?? []).toSet();
    final tools2 = (_rolePermissions[role2] ?? []).toSet();
    return tools1.intersection(tools2).toList();
  }

  /// Validate that all required tools are registered
  bool validateTools(List<String> requiredTools) {
    return requiredTools.every((tool) => _definitions.containsKey(tool));
  }

  /// Get tools by category (if tools have categories)
  Map<String, List<String>> getToolsByCategory() {
    final categories = <String, List<String>>{};
    
    _definitions.forEach((name, definition) {
      final category = _inferCategory(name);
      if (!categories.containsKey(category)) {
        categories[category] = [];
      }
      categories[category]!.add(name);
    });

    return categories;
  }

  /// Infer category from tool name
  String _inferCategory(String toolName) {
    if (toolName.contains('cart') || toolName.contains('checkout')) {
      return 'Shopping';
    } else if (toolName.contains('product') || toolName.contains('inventory')) {
      return 'Product Management';
    } else if (toolName.contains('order')) {
      return 'Order Management';
    } else if (toolName.contains('search') || toolName.contains('get_')) {
      return 'Search & Retrieval';
    } else if (toolName.contains('analytics') || toolName.contains('subscription')) {
      return 'Business Intelligence';
    } else if (toolName.contains('vendor')) {
      return 'Vendor Operations';
    } else if (toolName.contains('customer')) {
      return 'Customer Operations';
    }
    return 'General';
  }

  /// Clear all registrations (useful for testing)
  void clear() {
    _definitions.clear();
    _handlers.clear();
    _rolePermissions.forEach((role, tools) => tools.clear());
  }

  /// Get a human-readable summary of the registry
  String getSummary() {
    final buffer = StringBuffer();
    buffer.writeln('📊 Tool Registry Summary');
    buffer.writeln('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
    buffer.writeln('Total Tools: ${_definitions.length}');
    buffer.writeln('');
    
    _rolePermissions.forEach((role, tools) {
      buffer.writeln('$role: ${tools.length} tools');
      if (tools.isNotEmpty) {
        final uniqueTools = getUniqueToolsForRole(role);
        if (uniqueTools.isNotEmpty) {
          buffer.writeln('  Unique: ${uniqueTools.length}');
        }
      }
    });
    
    buffer.writeln('');
    buffer.writeln('Categories:');
    final categories = getToolsByCategory();
    categories.forEach((category, tools) {
      buffer.writeln('  $category: ${tools.length}');
    });
    
    buffer.writeln('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
    
    return buffer.toString();
  }

  /// Export tool definitions as JSON (useful for documentation)
  Map<String, dynamic> exportDefinitions() {
    return {
      'tools': _definitions.map((name, definition) => MapEntry(
        name,
        {
          'name': definition.name,
          'description': definition.description,
          'parameters': definition.parameters.map((key, param) => MapEntry(
            key,
            {
              'type': param.type,
              'description': param.description,
              'required': definition.requiredParameters?.contains(key),
              'default': param.defaultValue,
            },
          )),
          'required_parameters': definition.requiredParameters,
          'roles': getRolesForTool(name),
        },
      )),
      'roles': _rolePermissions,
      'statistics': getStatistics(),
    };
  }

  /// Batch register tools (useful for setup)
  void registerBatch(List<ToolRegistration> registrations) {
    for (var registration in registrations) {
      register(
        definition: registration.definition,
        handler: registration.handler,
        allowedRoles: registration.allowedRoles,
      );
    }
  }

  /// Check registry health (verify all handlers are present)
  Map<String, dynamic> checkHealth() {
    final missingHandlers = <String>[];
    final missingDefinitions = <String>[];

    // Check for definitions without handlers
    _definitions.forEach((name, definition) {
      if (!_handlers.containsKey(name)) {
        missingHandlers.add(name);
      }
    });

    // Check for handlers without definitions
    _handlers.forEach((name, handler) {
      if (!_definitions.containsKey(name)) {
        missingDefinitions.add(name);
      }
    });

    final isHealthy = missingHandlers.isEmpty && missingDefinitions.isEmpty;

    return {
      'healthy': isHealthy,
      'total_tools': _definitions.length,
      'missing_handlers': missingHandlers,
      'missing_definitions': missingDefinitions,
      'roles_configured': _rolePermissions.length,
    };
  }
}

/// Helper class for batch registration
class ToolRegistration {
  final ToolDefinition definition;
  final ToolHandler handler;
  final List<String> allowedRoles;

  ToolRegistration({
    required this.definition,
    required this.handler,
    required this.allowedRoles,
  });
}