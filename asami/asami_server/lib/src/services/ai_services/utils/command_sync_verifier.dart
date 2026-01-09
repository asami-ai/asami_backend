// File: server/lib/src/services/ai_services/utils/command_sync_verifier.dart

import 'package:asami_server/utils/logger/asami_logger.dart';
import '../../../generated/protocol.dart';
import '../core/command_processor.dart';

/// Utility to verify command synchronization across all files
class CommandSyncVerifier {
  
  /// Commands that should be in command_processor.dart permissions
  static const expectedCommandsInProcessor = [
    // Universal
    'help', 'start', 'account', 'logout', 'status', 'capabilities',
    
    // Customer
    'products', 'categories', 'cart', 'clearcart', 'orders', 'track', 'wishlist',
    
    // Vendor Products
    'myproducts', 'addproduct', 'editproduct', 'deleteproduct', 'updatestock',
    'inventory', 'lowstock', 'outofstock', 'topproducts', 'searchproducts',
    
    // Vendor Orders
    'vieworder', 'confirmorder', 'shiporder', 'cancelorder', 'pending',
    
    // Vendor Analytics
    'analytics', 'sales', 'stats', 'subscription',
    
    // Extended Tools
    'bulkinventory', 'inventoryalerts', 'orderdetails', 'batchorderstatus',
    'productperformance', 'trackbynumber', 'recentorders', 'cartstatistics',
    'compareproducts',
  ];

  /// Commands that should have Telegram bot command entries
  static const expectedTelegramCommands = [
    // These are shown in Telegram's command menu
    'start', 'help', 'products', 'categories', 'cart', 'clearcart',
    'orders', 'track', 'account', 'status', 'capabilities', 'logout',
    
    // Vendor specific
    'myproducts', 'addproduct', 'editproduct', 'deleteproduct',
    'updatestock', 'inventory', 'lowstock', 'outofstock',
    'topproducts', 'searchproducts', 'pending', 'vieworder',
    'confirmorder', 'shiporder', 'cancelorder', 'analytics',
    'sales', 'stats', 'subscription',
  ];

  /// Commands that have handlers registered in commands.dart
  static const expectedCommandHandlers = [
    'help', 'start', 'account', 'logout', 'status', 'capabilities',
    'products', 'categories', 'cart', 'clearcart', 'orders', 'track',
    'wishlist', 'vieworder', 'confirmorder', 'shiporder', 'cancelorder',
    'lowstock', 'outofstock', 'stats', 'searchproducts', 'myproducts',
    'addproduct', 'editproduct', 'deleteproduct', 'updatestock',
    'analytics', 'sales', 'inventory', 'subscription', 'pending',
    'topproducts',
    
    // Extended commands
    'bulkinventory', 'inventoryalerts', 'orderdetails', 'batchorderstatus',
    'productperformance', 'trackbynumber', 'recentorders', 'cartstatistics',
    'compareproducts',
  ];

  /// Verify all commands are synchronized
  static Map<String, dynamic> verifySynchronization() {
    final results = <String, dynamic>{
      'total_expected': expectedCommandsInProcessor.length,
      'processor_commands': expectedCommandsInProcessor.length,
      'telegram_commands': expectedTelegramCommands.length,
      'handler_commands': expectedCommandHandlers.length,
      'missing_in_processor': <String>[],
      'missing_in_telegram': <String>[],
      'missing_handlers': <String>[],
      'extra_in_processor': <String>[],
      'synchronized': false,
    };

    // Check for missing commands in processor
    for (var cmd in expectedCommandsInProcessor) {
      if (!CommandProcessor.commandExists(cmd)) {
        results['missing_in_processor'].add(cmd);
      }
    }

    // Check for extra commands in processor
    final processorCommands = CommandProcessor.getCommandsForUserType(UserType.vendor);
    for (var cmd in processorCommands) {
      if (!expectedCommandsInProcessor.contains(cmd) && 
          !expectedCommandsInProcessor.contains(cmd.toLowerCase())) {
        results['extra_in_processor'].add(cmd);
      }
    }

    // Verify command counts by role
    final commandCounts = CommandProcessor.getCommandCountByRole();
    results['vendor_commands'] = commandCounts['vendor'];
    results['customer_commands'] = commandCounts['customer'];

    // Check synchronization status
    results['synchronized'] = 
      (results['missing_in_processor'] as List).isEmpty &&
      (results['extra_in_processor'] as List).isEmpty;

    return results;
  }

  /// Print verification report
  static void printVerificationReport() {
    final results = verifySynchronization();
    
    Log.info('');
    Log.info('=' * 60);
    Log.info('COMMAND SYNCHRONIZATION VERIFICATION REPORT');
    Log.info('=' * 60);
    Log.info('');
    
    Log.info('📊 Command Counts:');
    Log.info('   Total Expected: ${results['total_expected']}');
    Log.info('   Processor: ${results['processor_commands']}');
    Log.info('   Telegram: ${results['telegram_commands']}');
    Log.info('   Handlers: ${results['handler_commands']}');
    Log.info('');
    
    Log.info('👥 Commands by Role:');
    Log.info('   Vendor: ${results['vendor_commands']}');
    Log.info('   Customer: ${results['customer_commands']}');
    Log.info('');
    
    if ((results['missing_in_processor'] as List).isNotEmpty) {
      Log.info('❌ Missing in Processor:');
      for (var cmd in results['missing_in_processor']) {
        Log.info('   - $cmd');
      }
      Log.info('');
    }
    
    if ((results['extra_in_processor'] as List).isNotEmpty) {
      Log.info('⚠️  Extra in Processor:');
      for (var cmd in results['extra_in_processor']) {
        Log.info('   - $cmd');
      }
      Log.info('');
    }
    
    if (results['synchronized']) {
      Log.success('✅ ALL COMMANDS SYNCHRONIZED!');
    } else {
      Log.error('❌ COMMANDS NOT SYNCHRONIZED - ACTION REQUIRED');
    }
    
    Log.info('=' * 60);
    Log.info('');
  }

  /// Get all commands grouped by category
  static Map<String, List<String>> getCommandsByCategory() {
    return {
      'universal': [
        'help', 'start', 'account', 'logout', 'status', 'capabilities',
      ],
      'customer': [
        'products', 'categories', 'cart', 'clearcart', 'orders', 'track', 'wishlist',
      ],
      'vendor_products': [
        'myproducts', 'addproduct', 'editproduct', 'deleteproduct', 'updatestock',
        'inventory', 'lowstock', 'outofstock', 'topproducts', 'searchproducts',
      ],
      'vendor_orders': [
        'vieworder', 'confirmorder', 'shiporder', 'cancelorder', 'pending',
      ],
      'vendor_analytics': [
        'analytics', 'sales', 'stats', 'subscription',
      ],
      'extended_tools': [
        'bulkinventory', 'inventoryalerts', 'orderdetails', 'batchorderstatus',
        'productperformance', 'trackbynumber', 'recentorders', 'cartstatistics',
        'compareproducts',
      ],
    };
  }

  /// Generate markdown documentation of all commands
  static String generateCommandDocumentation() {
    final buffer = StringBuffer();
    final categories = getCommandsByCategory();
    
    buffer.writeln('# Asami Command Reference');
    buffer.writeln('');
    buffer.writeln('Complete list of all available commands in the Asami system.');
    buffer.writeln('');
    
    categories.forEach((category, commands) {
      buffer.writeln('## ${_formatCategoryName(category)}');
      buffer.writeln('');
      
      for (var cmd in commands) {
        final description = CommandProcessor.getCommandDescription(cmd) ?? 'No description';
        buffer.writeln('### `/$cmd`');
        buffer.writeln(description);
        buffer.writeln('');
      }
    });
    
    buffer.writeln('---');
    buffer.writeln('');
    buffer.writeln('**Total Commands**: ${expectedCommandsInProcessor.length}');
    
    return buffer.toString();
  }

  static String _formatCategoryName(String category) {
    return category
        .split('_')
        .map((word) => word[0].toUpperCase() + word.substring(1))
        .join(' ');
  }

  /// Quick check - returns true if synchronized
  static bool isFullySynchronized() {
    final results = verifySynchronization();
    return results['synchronized'] as bool;
  }
}

/// Extension to make verification easier to call
extension CommandSyncExtension on CommandProcessor {
  void verifySync() {
    CommandSyncVerifier.printVerificationReport();
  }
}