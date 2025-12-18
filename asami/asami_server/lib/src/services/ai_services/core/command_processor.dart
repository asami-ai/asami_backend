// File: server/lib/src/ai/core/command_processor.dart

import 'package:asami_server/src/services/ai_services/tools/tool_definition.dart';
import 'package:asami_server/utils/logger/asami_logger.dart';

import '../../../generated/protocol.dart';

class CommandProcessor {
  static final Map<String, CommandHandler> _commands = {};
  
   void registerCommand(String command, CommandHandler handler) {
    _commands[command] = handler;
  }

  Future<Map<String, dynamic>?> processCommand({
    required String message,
    required UserType userType,
    required PlatformType platform,
    required ToolExecutionContext context,
  }) async {
    if (!message.startsWith('/')) return null;
    
    final parts = message.split(' ');
    final command = parts[0].substring(1).toLowerCase();
    final args = parts.skip(1).toList();
    Log.info('$parts $command $args');
    final handler = _commands[command];
    if (handler == null) {
      return {
        'success': false,
        'response': 'Unknown command: /$command\nType /help for available commands.',
        'command': command,
      };
    }
  
    // Check permission
    if (!_hasPermission(command, userType)) {
      return {
        'success': false,
        'response': 'You do not have permission to use this command.',
        'command': command,
      };
    }

    return await handler(args, context);
  }

  bool _hasPermission(String command, UserType userType) {
    final permissions = _commandPermissions[command] ?? [];
    return permissions.contains(userType.name);
  }

  static final Map<String, List<String>> _commandPermissions = {
    'products': ['vendor','customer'],
    'myproducts': ['vendor'],
    'sales': ['vendor'],
    'inventory': ['vendor'],
    'subscription': ['vendor'],
    'account':['vendor', 'customer'],
    'analytics': ['vendor'],
    'orders': ['vendor', 'customer'],
    'cart': [ 'vendor','customer'],
    'track':['vendor,customer'],
    'help': ['vendor', 'customer'],
    'start': ['vendor', 'customer'],
    'capabilities': ['vendor', 'customer'],
    'logout':['vendor','customer']
  };
}

typedef CommandHandler = Future<Map<String, dynamic>> Function(
  List<String> args,
  ToolExecutionContext context,
);