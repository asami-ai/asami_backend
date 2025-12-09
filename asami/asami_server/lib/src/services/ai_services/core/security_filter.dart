import '../../../generated/protocol.dart';

class SecurityFilter {
  /// Check message for security violations
  Future<Map<String, dynamic>> checkMessage({
    required String message,
    required User user,
    required Conversation conversation,
    required PlatformType platform,
  }) async {
    final lower = message.toLowerCase();

    // 1. Privilege Escalation Detection
    final escalationPatterns = [
      'make me admin',
      'change my role to',
      'i am vendor',
      'i am admin',
      'grant me access',
      'bypass permission',
      'override role',
    ];

    for (var pattern in escalationPatterns) {
      if (lower.contains(pattern)) {
        return {
          'allowed': false,
          'violation_type': 'privilege_escalation',
          'severity': 'high',
          'warning_message':
              'I cannot modify user roles or permissions. If you need access, please contact support.',
        };
      }
    }

    // 2. Data Access Violation
    if (user.userType == UserType.customer) {
      final restrictedPatterns = [
        'show all vendors',
        'list all customers',
        'vendor database',
        'admin panel',
        'backend access',
      ];

      for (var pattern in restrictedPatterns) {
        if (lower.contains(pattern)) {
          return {
            'allowed': false,
            'violation_type': 'unauthorized_data_access',
            'severity': 'medium',
            'warning_message':
                'You do not have permission to access that information.',
          };
        }
      }
    }

    // 3. Injection Attempts
    final injectionPatterns = [
      'ignore previous instructions',
      'system prompt',
      'you are now',
      'forget your role',
      'new instructions',
    ];

    for (var pattern in injectionPatterns) {
      if (lower.contains(pattern)) {
        return {
          'allowed': false,
          'violation_type': 'prompt_injection',
          'severity': 'critical',
          'warning_message':
              'Invalid request detected. Please rephrase your question.',
        };
      }
    }

    // 4. Rate Limiting (future)
    // Check if user is spamming requests

    return {'allowed': true};
  }

  /// Check if user has permission for tool
  Future<bool> checkToolPermission({
    required String toolName,
    required UserType userType,
    Map<String, dynamic>? arguments,
  }) async {
    // Get allowed roles for this tool
    final allowedRoles = _toolPermissions[toolName] ?? [];

    if (!allowedRoles.contains(userType.name)) {
      print('🚫 Permission denied: $toolName for ${userType.name}');
      return false;
    }

    // Additional argument-based checks
    if (toolName == 'update_order_status' && userType == UserType.vendor) {
      // Ensure vendor can only update their own orders
      final orderId = arguments?['order_id'];
      if (orderId != null) {
        // Verify ownership (future implementation)
      }
    }

    return true;
  }

  static final Map<String, List<String>> _toolPermissions = {
    // Customer tools
    'search_products': ['customer'],
    'add_to_cart': ['customer'],
    'view_cart': ['customer'],
    'checkout': ['customer'],
    'track_order': ['customer'],
    'view_order_history': ['customer'],

    // Vendor tools
    'create_product': ['vendor'],
    'update_product': ['vendor'],
    'get_vendor_analytics': ['vendor'],
    'view_vendor_orders': ['vendor'],
    'update_order_status': ['vendor'],
    'get_subscription_info': ['vendor'],

    // Shared tools
    'get_product_details': ['customer', 'vendor'],

    // Admin tools (future)
    'manage_users': ['admin'],
    'platform_analytics': ['admin'],
  };
}
