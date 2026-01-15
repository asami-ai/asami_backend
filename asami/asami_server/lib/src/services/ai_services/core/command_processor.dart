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
    
    Log.info('Command: /$command, Args: $args');
    
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

  /// Get all registered commands for a user type
  static List<String> getCommandsForUserType(UserType userType) {
    return _commandPermissions.entries
        .where((entry) => entry.value.contains(userType.name))
        .map((entry) => entry.key)
        .toList();
  }

  /// Get command count by role
  static Map<String, int> getCommandCountByRole() {
    final counts = <String, int>{
      'customer': 0,
      'vendor': 0,
      'admin': 0,
    };

    for (var permissions in _commandPermissions.values) {
      for (var role in permissions) {
        counts[role] = (counts[role] ?? 0) + 1;
      }
    }

    return counts;
  }

  /// Complete command permissions mapping
  static final Map<String, List<String>> _commandPermissions = {
    // ==================== UNIVERSAL COMMANDS ====================
    'help': ['vendor', 'customer', 'admin'],
    'start': ['vendor', 'customer', 'admin'],
    'account': ['vendor', 'customer', 'admin'],
    'logout': ['vendor', 'customer', 'admin'],
    'status': ['vendor', 'customer', 'admin'],
    'capabilities': ['vendor', 'customer', 'admin'],
    
    // ==================== CUSTOMER COMMANDS ====================
    'products': ['vendor', 'customer'],
    'categories': ['customer'],
    'cart': ['vendor', 'customer'],
    'clearcart': ['customer'],
    'orders': ['vendor', 'customer'],
    'track': ['vendor', 'customer'],
    'wishlist': ['customer'],
    
    // ==================== VENDOR PRODUCT COMMANDS ====================
    'myproducts': ['vendor'],
    'addproduct': ['vendor'],
    'editproduct': ['vendor'],
    'deleteproduct': ['vendor'],
    'updatestock': ['vendor'],
    'inventory': ['vendor'],
    'lowstock': ['vendor'],
    'outofstock': ['vendor'],
    'topproducts': ['vendor'],
    'searchproducts': ['vendor'],
    
    // ==================== VENDOR ORDER COMMANDS ====================
    'vieworder': ['vendor'],
    'confirmorder': ['vendor'],
    'shiporder': ['vendor'],
    'cancelorder': ['vendor', 'customer'],
    'pending': ['vendor'],
    
    // ==================== VENDOR ANALYTICS COMMANDS ====================
    'analytics': ['vendor'],
    'sales': ['vendor'],
    'stats': ['vendor'],
    'subscription': ['vendor'],
    
    // ==================== EXTENDED TOOL COMMANDS ====================
    // These map to the tools registered in the tool registry
    'bulkinventory': ['vendor'],
    'inventoryalerts': ['vendor'],
    'orderdetails': ['vendor'],
    'batchorderstatus': ['vendor'],
    'productperformance': ['vendor'],
    'trackbynumber': ['vendor', 'customer'],
    'recentorders': ['vendor', 'customer'],
    'cartstatistics': ['vendor', 'customer'],
    'compareproducts': ['vendor', 'customer'],
    
    // ==================== ADMIN COMMANDS (Future) ====================
    'manageusers': ['admin'],
    'platformanalytics': ['admin'],
    'viewallvendors': ['admin'],
    'viewallcustomers': ['admin'],
    'moderatecontent': ['admin'],
    'systemconfig': ['admin'],


    // ====================== PAYMENT/ ORDER COMMANDS ====================
    'wallet' : ['vendor'],
    'withdraw' : ['vendor'],
    'setupbank': ['vendor'],
    'received' : ['vendor', 'customer'],
    'return' : ['vendor,customer'],
    
  };

  /// Check if a command exists
  static bool commandExists(String command) {
    return _commandPermissions.containsKey(command.toLowerCase());
  }

  /// Get command description (for help text generation)
  static String? getCommandDescription(String command) {
    return _commandDescriptions[command.toLowerCase()];
  }

  /// Command descriptions for dynamic help generation
  static final Map<String, String> _commandDescriptions = {
    // Universal
    'help': 'Show available commands and help information',
    'start': 'Show main menu and quick actions',
    'account': 'View account information and settings',
    'logout': 'Sign out from the current platform',
    'status': 'View your current status and statistics',
    'capabilities': 'See what I can do for you',
    
    // Customer
    'products': 'Search and browse products',
    'categories': 'Browse product categories',
    'cart': 'View your shopping cart',
    'clearcart': 'Empty your shopping cart',
    'orders': 'View order history',
    'track': 'Track an order by number',
    'wishlist': 'View saved products (coming soon)',
    
    // Vendor - Products
    'myproducts': 'View your product catalog',
    'addproduct': 'Add a new product',
    'editproduct': 'Edit an existing product',
    'deleteproduct': 'Delete a product',
    'updatestock': 'Update product inventory',
    'inventory': 'View inventory status',
    'lowstock': 'View low stock alerts',
    'outofstock': 'View out of stock items',
    'topproducts': 'View best-selling products',
    'searchproducts': 'Search your products',
    
    // Vendor - Orders
    'vieworder': 'View detailed order information',
    'confirmorder': 'Confirm a pending order',
    'shiporder': 'Mark order as shipped',
    'cancelorder': 'Cancel an order',
    'pending': 'View pending orders',
    
    // Vendor - Analytics
    'analytics': 'View full business dashboard',
    'sales': 'View sales data and reports',
    'stats': 'View quick business statistics',
    'subscription': 'View subscription tier and limits',
    
    // Extended Commands
    'bulkinventory': 'Update inventory for multiple products',
    'inventoryalerts': 'Get inventory alerts and notifications',
    'orderdetails': 'Get full order details',
    'batchorderstatus': 'Update status for multiple orders',
    'productperformance': 'View product performance metrics',
    'trackbynumber': 'Track order by order number',
    'recentorders': 'View recent orders',
    'cartstatistics': 'View cart statistics and insights',
    'compareproducts': 'Compare multiple products',
  };
}

typedef CommandHandler = Future<Map<String, dynamic>> Function(
  List<String> args,
  ToolExecutionContext context,
);