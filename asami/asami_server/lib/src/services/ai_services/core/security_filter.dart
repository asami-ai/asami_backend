import '../../../generated/protocol.dart';

/// Enhanced security filter with comprehensive tool permissions and threat detection
class SecurityFilter {
  // Rate limiting tracking (in-memory, use Redis in production)
  static final Map<String, List<DateTime>> _userRequestHistory = {};
  static const int maxRequestsPerMinute = 30;
  static const int maxRequestsPer5Minutes = 100;

  /// Check message for security violations
  Future<Map<String, dynamic>> checkMessage({
    required String message,
    required User user,
    required Conversation conversation,
    required PlatformType platform,
  }) async {
    final lower = message.toLowerCase();
    final trimmed = message.trim();

    // 1. Empty/Invalid Message Detection
    if (trimmed.isEmpty || trimmed.length < 2) {
      return {
        'allowed': false,
        'violation_type': 'invalid_input',
        'severity': 'low',
        'warning_message': 'Please provide a valid message.',
      };
    }

    // 2. Excessive Length Detection (prevent token abuse)
    if (message.length > 10000) {
      return {
        'allowed': false,
        'violation_type': 'excessive_length',
        'severity': 'medium',
        'warning_message': 'Message too long. Please keep messages under 10,000 characters.',
      };
    }

    // 3. Privilege Escalation Detection
    final escalationPatterns = [
      'make me admin',
      'change my role to',
      'i am vendor',
      'i am admin',
      'grant me access',
      'bypass permission',
      'override role',
      'elevate privileges',
      'sudo access',
      'root access',
      'change user type',
      'promote me to',
      'give me vendor access',
    ];
    for (var pattern in escalationPatterns) {
      if (lower.contains(pattern)) {
        await _logSecurityEvent(
          userId: user.id.uuid,
          violationType: 'privilege_escalation',
          message: message,
          severity: 'high',
        );
        return {
          'allowed': false,
          'violation_type': 'privilege_escalation',
          'severity': 'high',
          'warning_message':
              'I cannot modify user roles or permissions. If you need different access levels, please contact support.',
        };
      }
    }

    // 4. Data Access Violation (Customer restrictions)
    if (user.userType == UserType.customer) {
      final restrictedPatterns = [
        'show all vendors',
        'list all customers',
        'all users database',
        'vendor database',
        'customer database',
        'admin panel',
        'backend access',
        'internal api',
        'system configuration',
        'database dump',
        'export all data',
        'other users orders',
        'other customers cart',
      ];
      for (var pattern in restrictedPatterns) {
        if (lower.contains(pattern)) {
          await _logSecurityEvent(
            userId: user.id.uuid,
            violationType: 'unauthorized_data_access',
            message: message,
            severity: 'medium',
          );
          return {
            'allowed': false,
            'violation_type': 'unauthorized_data_access',
            'severity': 'medium',
            'warning_message':
                'You do not have permission to access that information. You can only view your own data.',
          };
        }
      }
    }

    // 5. SQL Injection Detection
    final sqlPatterns = [
      r"'\s*or\s*'",
      r'"\s*or\s*"',
      r"'\s*or\s*1\s*=\s*1",
      r'union\s+select',
      r'drop\s+table',
      r'delete\s+from',
      r'insert\s+into',
      r'update\s+.*\s+set',
      r'exec\s*\(',
      r'execute\s*\(',
      '--',
      r'/\*.*\*/',
    ];
    for (var pattern in sqlPatterns) {
      final regex = RegExp(pattern, caseSensitive: false);
      if (regex.hasMatch(lower)) {
        await _logSecurityEvent(
          userId: user.id.uuid,
          violationType: 'sql_injection',
          message: message,
          severity: 'critical',
        );
        return {
          'allowed': false,
          'violation_type': 'sql_injection',
          'severity': 'critical',
          'warning_message':
              'Invalid characters detected in your message. Please rephrase your request.',
        };
      }
    }

    // 6. Prompt Injection Detection
    final injectionPatterns = [
      'ignore previous instructions',
      'ignore all previous',
      'disregard previous',
      'system prompt',
      'you are now',
      'forget your role',
      'new instructions',
      'override instructions',
      'system message',
      'reset instructions',
      'jailbreak',
      'developer mode',
      'act as if',
      'pretend you are',
      'simulate being',
      'new system prompt',
      'ignore your programming',
      'bypass your restrictions',
    ];
    for (var pattern in injectionPatterns) {
      if (lower.contains(pattern)) {
        await _logSecurityEvent(
          userId: user.id.uuid,
          violationType: 'prompt_injection',
          message: message,
          severity: 'critical',
        );
        return {
          'allowed': false,
          'violation_type': 'prompt_injection',
          'severity': 'critical',
          'warning_message':
              'Invalid request detected. I can only help with shopping and vendor management tasks.',
        };
      }
    }

    // 7. Cross-Site Scripting (XSS) Detection
    final xssPatterns = [
      '<script',
      'javascript:',
      'onerror=',
      'onload=',
      'onclick=',
      '<iframe',
      'eval(',
      'document.cookie',
      'window.location',
    ];
    for (var pattern in xssPatterns) {
      if (lower.contains(pattern)) {
        await _logSecurityEvent(
          userId: user.id.uuid,
          violationType: 'xss_attempt',
          message: message,
          severity: 'high',
        );
        return {
          'allowed': false,
          'violation_type': 'xss_attempt',
          'severity': 'high',
          'warning_message':
              'Invalid content detected. Please use plain text only.',
        };
      }
    }

    // 8. API Key / Credential Leakage Detection
    final credentialPatterns = [
      r'api[_-]?key',
      r'access[_-]?token',
      r'secret[_-]?key',
      r'password\s*[=:]',
      r'bearer\s+[a-zA-Z0-9]',
      r'authorization:\s*',
      r'private[_-]?key',
      r'client[_-]?secret',
    ];
    for (var pattern in credentialPatterns) {
      final regex = RegExp(pattern, caseSensitive: false);
      if (regex.hasMatch(lower)) {
        await _logSecurityEvent(
          userId: user.id.uuid,
          violationType: 'credential_leakage',
          message: '[REDACTED]',
          severity: 'critical',
        );
        return {
          'allowed': false,
          'violation_type': 'credential_leakage',
          'severity': 'critical',
          'warning_message':
              'Please do not share sensitive credentials. If you need help with authentication, contact support.',
        };
      }
    }

    // 9. Spam/Repetition Detection
    if (_isRepetitiveMessage(message)) {
      return {
        'allowed': false,
        'violation_type': 'spam_detected',
        'severity': 'low',
        'warning_message':
            'Please avoid sending repetitive messages. How can I help you?',
      };
    }

    // 10. Rate Limiting Check
    final rateLimitCheck = await _checkRateLimit(user.id.uuid);
    if (!rateLimitCheck['allowed']) {
      return rateLimitCheck;
    }

    // 11. Phishing/Scam Detection
    final phishingPatterns = [
      'verify your account',
      'urgent: action required',
      'click here immediately',
      'your account will be suspended',
      'confirm your password',
      'unusual activity detected',
      'refund pending',
      'claim your prize',
    ];
    for (var pattern in phishingPatterns) {
      if (lower.contains(pattern)) {
        await _logSecurityEvent(
          userId: user.id.uuid,
          violationType: 'phishing_attempt',
          message: message,
          severity: 'high',
        );
        return {
          'allowed': false,
          'violation_type': 'phishing_attempt',
          'severity': 'high',
          'warning_message':
              'Suspicious content detected. We never ask for passwords or personal information through chat.',
        };
      }
    }

    return {'allowed': true};
  }

  /// Check if user has permission for tool
  Future<bool> checkToolPermission({
    required String toolName,
    required UserType userType,
    Map<String, dynamic>? arguments,
  }) async {
    // Get allowed roles for this tool
    final allowedRoles = _toolPermissions[toolName];
    
    if (allowedRoles == null) {
      print('⚠️ Unknown tool: $toolName');
      return false;
    }

    // Vendors have access to both vendor and customer tools
    if (userType == UserType.vendor) {
      // Vendor can use any vendor or customer tool
      if (allowedRoles.contains('vendor') || allowedRoles.contains('customer')) {
        return true;
      }
    }

    // Check if user's role is in allowed roles
    if (!allowedRoles.contains(userType.name)) {
      print('🚫 Permission denied: $toolName for ${userType.name}');
      await _logSecurityEvent(
        userId: 'unknown',
        violationType: 'unauthorized_tool_access',
        message: 'Attempted to use $toolName without permission',
        severity: 'medium',
      );
      return false;
    }

    // Additional argument-based checks
    if (toolName == 'update_order_status' && userType == UserType.vendor) {
      // Ensure vendor can only update their own orders
      final orderId = arguments?['order_id'];
      if (orderId != null) {
        // TODO: Verify ownership in production
        // Check if order belongs to this vendor
      }
    }

    // Ensure customers can only access their own data
    if (userType == UserType.customer) {
      final sensitiveTools = [
        'view_cart',
        'checkout',
        'view_order_history',
        'track_order',
        'cancel_order',
      ];
      if (sensitiveTools.contains(toolName)) {
        // TODO: Verify customer ID matches in production
      }
    }

    return true;
  }

  /// Rate limiting check
  Future<Map<String, dynamic>> _checkRateLimit(String userId) async {
    final now = DateTime.now();
    final userHistory = _userRequestHistory[userId] ?? [];

    // Clean old entries (older than 5 minutes)
    userHistory.removeWhere(
      (time) => now.difference(time).inMinutes > 5,
    );

    // Check 1-minute limit
    final recentRequests = userHistory.where(
      (time) => now.difference(time).inSeconds < 60,
    ).length;

    if (recentRequests >= maxRequestsPerMinute) {
      await _logSecurityEvent(
        userId: userId,
        violationType: 'rate_limit_exceeded',
        message: 'Too many requests in 1 minute',
        severity: 'medium',
      );
      return {
        'allowed': false,
        'violation_type': 'rate_limit_exceeded',
        'severity': 'medium',
        'warning_message':
            'You are sending messages too quickly. Please wait a moment before trying again.',
      };
    }

    // Check 5-minute limit
    if (userHistory.length >= maxRequestsPer5Minutes) {
      await _logSecurityEvent(
        userId: userId,
        violationType: 'rate_limit_exceeded',
        message: 'Too many requests in 5 minutes',
        severity: 'high',
      );
      return {
        'allowed': false,
        'violation_type': 'rate_limit_exceeded',
        'severity': 'high',
        'warning_message':
            'You have exceeded the message limit. Please wait a few minutes before continuing.',
      };
    }

    // Add current request
    userHistory.add(now);
    _userRequestHistory[userId] = userHistory;

    return {'allowed': true};
  }

  /// Check if message is repetitive spam
  bool _isRepetitiveMessage(String message) {
    // Check for repeated characters (e.g., "aaaaaaa", "!!!!!!!!")
    final repeatedChars = RegExp(r'(.)\1{9,}');
    if (repeatedChars.hasMatch(message)) {
      return true;
    }

    // Check for repeated words
    final words = message.toLowerCase().split(RegExp(r'\s+'));
    if (words.length > 5) {
      final uniqueWords = words.toSet();
      // If more than 70% of words are repeated
      if (uniqueWords.length / words.length < 0.3) {
        return true;
      }
    }

    return false;
  }

  /// Log security events for monitoring
  Future<void> _logSecurityEvent({
    required String userId,
    required String violationType,
    required String message,
    required String severity,
  }) async {
    // TODO: In production, log to database or monitoring service
    print('''
🔒 SECURITY EVENT
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
User ID: $userId
Violation: $violationType
Severity: $severity
Time: ${DateTime.now().toIso8601String()}
Message: ${message.length > 100 ? '${message.substring(0, 100)}...' : message}
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    ''');

    // In production, store in SecurityLog table:
    // await SecurityLog.db.insertRow(session, SecurityLog(
    //   userId: userId,
    //   violationType: violationType,
    //   severity: severity,
    //   message: message,
    //   timestamp: DateTime.now(),
    // ));
  }

  /// Complete tool permissions mapping
  /// Vendors can access both vendor AND customer tools
  static final Map<String, List<String>> _toolPermissions = {
    // ========================================================================
    // CUSTOMER TOOLS (Vendors can also use these)
    // ========================================================================
    
    // Product Search & Discovery
    'search_products': ['customer', 'vendor'],
    'get_product_details': ['customer', 'vendor'],
    
    // Shopping Cart Management
    'add_to_cart': ['customer', 'vendor'],
    'remove_from_cart': ['customer', 'vendor'],
    'view_cart': ['customer', 'vendor'],
    'update_cart_quantity': ['customer', 'vendor'],
    'clear_cart': ['customer', 'vendor'],
    
    // Order Management (Customer Side)
    'checkout': ['customer', 'vendor'],
    'track_order': ['customer', 'vendor'],
    'view_order_history': ['customer', 'vendor'],
    'cancel_order': ['customer', 'vendor'],
    
    // Vendor Information
    'get_vendor_info': ['customer', 'vendor'],
    
    // ========================================================================
    // VENDOR TOOLS (Vendor-only operations)
    // ========================================================================
    
    // Product Management
    'create_product': ['vendor'],
    'update_product': ['vendor'],
    'delete_product': ['vendor'],
    'list_vendor_products': ['vendor'],
    'update_inventory': ['vendor'],
    'get_top_selling_products': ['vendor'],
    
    // Order Management (Vendor Side)
    'view_vendor_orders': ['vendor'],
    'update_order_status': ['vendor'],
    'get_order_details': ['vendor'],
    
    // Analytics & Business Intelligence
    'get_vendor_analytics': ['vendor'],
    
    // Subscription Management
    'get_subscription_info': ['vendor'],
    'check_tier_limits': ['vendor'],
    
    // ========================================================================
    // ADMIN TOOLS (Future Implementation)
    // ========================================================================
    'manage_users': ['admin'],
    'platform_analytics': ['admin'],
    'view_all_vendors': ['admin'],
    'view_all_customers': ['admin'],
    'moderate_content': ['admin'],
    'system_configuration': ['admin'],
  };

  /// Get all available tools for a user type
  static List<String> getAvailableTools(UserType userType) {
    final tools = <String>[];
    
    _toolPermissions.forEach((toolName, allowedRoles) {
      if (userType == UserType.vendor) {
        // Vendors can use both vendor and customer tools
        if (allowedRoles.contains('vendor') || allowedRoles.contains('customer')) {
          tools.add(toolName);
        }
      } else if (allowedRoles.contains(userType.name)) {
        tools.add(toolName);
      }
    });
    
    return tools;
  }

  /// Check if a specific action is allowed
  Future<bool> isActionAllowed({
    required User user,
    required String action,
    Map<String, dynamic>? context,
  }) async {
    // Check based on user type and context
    switch (action) {
      case 'view_sensitive_data':
        return user.userType == UserType.vendor; // user.userType == UserType.admin || ;
      
      case 'modify_products':
        return user.userType == UserType.vendor;  //|| user.userType == UserType.admin;
      
      case 'access_analytics':
        return user.userType == UserType.vendor ; //|| user.userType == UserType.admin;
      
      case 'manage_orders':
        return user.userType == UserType.vendor; //|| user.userType == UserType.admin;
      
      case 'shop':
        return true; // All users can shop
      
      default:
        return false;
    }
  }

  /// Validate tool arguments for additional security
  Future<Map<String, dynamic>> validateToolArguments({
    required String toolName,
    required Map<String, dynamic> arguments,
    required User user,
  }) async {
    // Price manipulation check
    if (['create_product', 'update_product'].contains(toolName)) {
      final price = (arguments['base_price'] as num?)?.toDouble();
      if (price != null && (price < 0 || price > 10000000)) {
        return {
          'valid': false,
          'error': 'Invalid price. Must be between 0 and 10,000,000.',
        };
      }
    }

    // Quantity manipulation check
    if (['update_inventory', 'update_cart_quantity'].contains(toolName)) {
      final quantity = arguments['quantity'] as int?;
      if (quantity != null && (quantity < 0 || quantity > 100000)) {
        return {
          'valid': false,
          'error': 'Invalid quantity. Must be between 0 and 100,000.',
        };
      }
    }

    // ID validation (prevent injection)
    final idFields = ['product_id', 'order_id', 'cart_item_id', 'vendor_id', 'customer_id'];
    for (var field in idFields) {
      if (arguments.containsKey(field)) {
        final id = arguments[field]?.toString() ?? '';
        if (!_isValidId(id)) {
          return {
            'valid': false,
            'error': 'Invalid ID format.',
          };
        }
      }
    }

    return {'valid': true};
  }

  /// Validate ID format (UUID or numeric)
  bool _isValidId(String id) {
    // UUID format check
    final uuidRegex = RegExp(
      r'^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$',
      caseSensitive: false,
    );
    
    // Numeric ID check
    final numericRegex = RegExp(r'^\d+$');
    
    return uuidRegex.hasMatch(id) || numericRegex.hasMatch(id);
  }

  /// Clear rate limit history for a user (admin function)
  static void clearRateLimitForUser(String userId) {
    _userRequestHistory.remove(userId);
  }

  /// Get rate limit status for a user
  static Map<String, dynamic> getRateLimitStatus(String userId) {
    final now = DateTime.now();
    final history = _userRequestHistory[userId] ?? [];
    
    final lastMinute = history.where(
      (time) => now.difference(time).inSeconds < 60,
    ).length;
    
    final last5Minutes = history.length;
    
    return {
      'requests_last_minute': lastMinute,
      'requests_last_5_minutes': last5Minutes,
      'limit_per_minute': maxRequestsPerMinute,
      'limit_per_5_minutes': maxRequestsPer5Minutes,
      'remaining_minute': maxRequestsPerMinute - lastMinute,
      'remaining_5_minutes': maxRequestsPer5Minutes - last5Minutes,
    };
  }
}