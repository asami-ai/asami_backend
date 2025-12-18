// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'dart:convert';

import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

/// Comprehensive usage tracking and billing service
class UsageEndpoint extends Endpoint {
  // =========================================================================
  // VENDOR TIER LIMITS (Configurable)
  // =========================================================================

   Map<SubscriptionTier, Map<String, int>> TIER_LIMITS = {
    SubscriptionTier.freemium: {
      'daily_tool_calls': 15,
      'monthly_tool_calls': 300,
      'product_limit': 20,
      'ai_descriptions': 50,
      'grace_period': 5,
    },
    SubscriptionTier.pro: {
      'daily_tool_calls': 50,
      'monthly_tool_calls': 1200,
      'product_limit': 100,
      'ai_descriptions': 200,
      'grace_period': 10,
    },
    SubscriptionTier.pro_max: {
      'daily_tool_calls': 100,
      'monthly_tool_calls': 2500,
      'product_limit': -1, // Unlimited
      'ai_descriptions': 500,
      'grace_period': 20,
    },
  };

  // Tools allowed after limit for freemium (read-only operations)
   List<String> GRACE_PERIOD_TOOLS = [
    'list_vendor_products',
    'get_vendor_analytics',
    'view_vendor_orders',
    'get_order_details',
    'get_subscription_info',
    'check_tier_limits',
    'get_top_selling_products',
    // Customer tools (vendors can still shop)
    'search_products',
    'get_product_details',
    'view_cart',
    'track_order',
    'view_order_history',
    'get_vendor_info',
  ];

  // Write operations that count toward grace period
   List<String> WRITE_OPERATIONS = [
    'create_product',
    'update_product',
    'delete_product',
    'update_inventory',
    'update_order_status',
    'add_to_cart',
    'checkout',
  ];

  // =========================================================================
  // CHECK VENDOR TOOL USAGE LIMIT
  // =========================================================================

  Future<Map<String, dynamic>> checkVendorToolLimit({
    required Session session,
    required String userId,
    required String toolName,
    required SubscriptionTier tier,
  }) async {
    try {
      // Get or create today's Tooler
      final tracker = await _getOrCreateDailyTracker(
        session: session,
        userId: userId,
        userType: UserType.vendor,
        tier: tier,
      );

      final limits = TIER_LIMITS[tier]!;
      final dailyLimit = limits['daily_tool_calls']!;
      final gracePeriodLimit = limits['grace_period']!;

      // Check if within normal limit
      if (tracker.toolCallsCount < dailyLimit) {
        return {
          'allowed': true,
          'within_limit': true,
          'remaining': dailyLimit - tracker.toolCallsCount,
          'limit': dailyLimit,
          'grace_period_available': false,
        };
      }

      // Check if tool is allowed in grace period
      if (GRACE_PERIOD_TOOLS.contains(toolName)) {
        return {
          'allowed': true,
          'within_limit': false,
          'in_grace_period': true,
          'is_read_only': true,
          'message':
              'You have reached your daily tool call limit. Only read-only operations are available.',
        };
      }

      // Check if write operation and within grace period
      if (WRITE_OPERATIONS.contains(toolName)) {
        if (tracker.gracePeriodUsed < gracePeriodLimit) {
          // For create_product, check product limit
          if (toolName == 'create_product') {
            final vendor = await VendorProfile.db.findFirstRow(
              session,
              where: (t) => t.userId.equals(UuidValue.fromString(userId)),
            );

            if (vendor != null &&
                vendor.currentProductCount >= limits['product_limit']!) {
              return {
                'allowed': false,
                'within_limit': false,
                'reason': 'product_limit_reached',
                'message':
                    'You have reached your product limit of ${limits['product_limit']}. Upgrade to add more products.',
              };
            }
          }

          return {
            'allowed': true,
            'within_limit': false,
            'in_grace_period': true,
            'grace_used': tracker.gracePeriodUsed,
            'grace_remaining': gracePeriodLimit - tracker.gracePeriodUsed,
            'message':
                'Using grace period allowance (${tracker.gracePeriodUsed + 1}/$gracePeriodLimit)',
          };
        }
      }

      // Hard limit reached
      return {
        'allowed': false,
        'within_limit': false,
        'grace_period_exhausted': true,
        'limit': dailyLimit,
        'message':
            'Daily tool call limit reached. Limit resets at midnight or upgrade your plan.',
        'upgrade_url': '/subscription/upgrade',
      };
    } catch (e) {
      session.log('Error checking vendor tool limit: $e');
      // Fail open - allow the operation
      return {'allowed': true, 'error': true};
    }
  }

  // =========================================================================
  // CHECK CUSTOMER AI USAGE
  // =========================================================================

  Future<Map<String, dynamic>> checkCustomerAIUsage({
    required Session session,
    required String userId,
    required String conversationId,
    bool isToolCall = false,
  }) async {
    try {
      // Get customer usage pattern
      final pattern = await _getOrCreateUsagePattern(session, userId);

      // Get or create daily tracker
      final tracker = await _getOrCreateDailyTracker(
        session: session,
        userId: userId,
        userType: UserType.customer,
        tier: null,
      );

      // Check for abuse
      if (pattern.isAbuser) {
        await _logLimitBreach(
          session: session,
          userId: userId,
          userType: UserType.customer,
          limitType: LimitType.ai_conversations,
          attemptedAction: isToolCall ? 'tool_call' : 'message',
          currentUsage: tracker.aiMessagesCount,
          limitValue: tracker.aiMessagesLimit,
          severity: BreachSeverity.hard,
        );

        return {
          'allowed': false,
          'reason': 'abuse_detected',
          'throttle': true,
          'throttle_seconds': 60,
          'message': 'Unusual activity detected. Please slow down.',
        };
      }

      // Tool call specific checks
      if (isToolCall) {
        // Require explicit intent for tool calls (confidence scoring)
        final shouldThrottle = await _shouldThrottleToolCall(
          session,
          userId,
          pattern,
        );

        if (shouldThrottle) {
          return {
            'allowed': true,
            'throttle': true,
            'throttle_seconds': 2,
            'reason': 'rate_limiting',
            'message': 'Processing...',
          };
        }

        // Check daily tool call limit
        if (tracker.toolCallsCount >= tracker.toolCallsLimit) {
          return {
            'allowed': false,
            'reason': 'daily_tool_limit',
            'limit': tracker.toolCallsLimit,
            'message':
                'You have reached your daily tool usage limit. Please try again tomorrow.',
          };
        }
      }

      // Check daily message limit
      if (tracker.aiMessagesCount >= tracker.aiMessagesLimit) {
        return {
          'allowed': false,
          'reason': 'daily_message_limit',
          'limit': tracker.aiMessagesLimit,
          'message':
              'You have reached your daily message limit. Please try again tomorrow.',
        };
      }

      // Check if approaching limit (80%)
      final messageUsagePercent =
          (tracker.aiMessagesCount / tracker.aiMessagesLimit) * 100;
      if (messageUsagePercent >= 80 && !tracker.softLimitWarned) {
        await _sendUsageAlert(
          session: session,
          userId: userId,
          userType: UserType.customer,
          alertType: AlertType.soft_limit_approaching,
          limitType: LimitType.ai_conversations,
          currentUsage: tracker.aiMessagesCount,
          limitValue: tracker.aiMessagesLimit,
        );

        // Update tracker
        tracker.softLimitWarned = true;
        await DailyUsageTracker.db.updateRow(session, tracker);
      }

      return {
        'allowed': true,
        'remaining': tracker.aiMessagesLimit - tracker.aiMessagesCount,
        'usage_percent': messageUsagePercent.toInt(),
      };
    } catch (e) {
      session.log('Error checking customer AI usage: $e');
      return {'allowed': true, 'error': true};
    }
  }

  // =========================================================================
  // TRACK TOOL USAGE
  // =========================================================================

  Future<void> trackToolUsage({
    required Session session,
    required String userId,
    required UserType userType,
    required String toolName,
    required bool success,
    required int executionTimeMs,
    String? conversationId,
    Map<String, dynamic>? arguments,
    String? errorMessage,
    SubscriptionTier? tier,
  }) async {
    try {
      final now = DateTime.now();

      // Update daily tracker
      final tracker = await _getOrCreateDailyTracker(
        session: session,
        userId: userId,
        userType: userType,
        tier: tier,
      );

      tracker.toolCallsCount++;

      // Check if using grace period
      final isGracePeriod = userType == UserType.vendor &&
          tracker.toolCallsCount > tracker.toolCallsLimit &&
          WRITE_OPERATIONS.contains(toolName);

      if (isGracePeriod) {
        tracker.gracePeriodUsed++;
        tracker.isInGracePeriod = true;
      }

      tracker.updatedAt = now;
      await DailyUsageTracker.db.updateRow(session, tracker);

      // Determine cost
      double cost = 0.0;
      bool isBillable = false;

      if (userType == UserType.vendor && tier != null) {
        final limits = TIER_LIMITS[tier]!;
        final dailyLimit = limits['daily_tool_calls']!;

        // Charge for overage
        if (tracker.toolCallsCount > dailyLimit) {
          final tierFeature = await TierFeature.db.findFirstRow(
            session,
            where: (t) => t.tier.equals(tier),
          );
          cost = tierFeature?.overageToolCallPrice ?? 0.01;
          isBillable = true;
        }
      }

      // Log detailed usage
      final usageLog = ToolUsageLog(
        id: Uuid().v4obj(),
        userId: UuidValue.fromString(userId),
        userType: userType,
        conversationId: conversationId != null
            ? UuidValue.fromString(conversationId)
            : null,
        toolName: toolName,
        toolCategory: _categorizeTools(toolName),
        arguments: arguments != null ? jsonEncode(arguments) : null,
        success: success,
        executionTimeMs: executionTimeMs,
        errorMessage: errorMessage,
        costIncurred: cost,
        isBillable: isBillable,
        billingPeriodStart: DateTime(now.year, now.month, 1),
        billingPeriodEnd: DateTime(now.year, now.month + 1, 0),
        wasWithinLimit: tracker.toolCallsCount <= tracker.toolCallsLimit,
        usedGracePeriod: isGracePeriod,
        deniedDueToLimit: false,
        createdAt: now,
      );

      await ToolUsageLog.db.insertRow(session, usageLog);

      // Create usage record for billing if billable
      if (isBillable && userType == UserType.vendor) {
        await _createUsageRecord(
          session: session,
          vendorId: userId,
          usageType: 'tool_call_overage',
          quantity: 1,
          unitPrice: cost,
          totalAmount: cost,
        );
      }
    } catch (e) {
      session.log('Error tracking tool usage: $e');
    }
  }

  // =========================================================================
  // TRACK AI MESSAGE
  // =========================================================================

  Future<void> trackAIMessage({
    required Session session,
    required String userId,
    required UserType userType,
    required String conversationId,
    required int totalTokens,
    required int inputTokens,
    required int outputTokens,
    int? toolCallsCount,
    double? responseTime,
  }) async {
    try {
      final now = DateTime.now();

      // Update daily tracker
      final tracker = await _getOrCreateDailyTracker(
        session: session,
        userId: userId,
        userType: userType,
        tier: null,
      );

      tracker.aiMessagesCount++;
      tracker.updatedAt = now;
      await DailyUsageTracker.db.updateRow(session, tracker);

      // Update conversation usage
      var conversationUsage = await AIConversationUsage.db.findFirstRow(
        session,
        where: (t) =>
            t.userId.equals(UuidValue.fromString(userId)) &
            t.conversationId.equals(UuidValue.fromString(conversationId)) &
            t.date.equals(DateTime(now.year, now.month, now.day)),
      );

      if (conversationUsage == null) {
        conversationUsage = AIConversationUsage(
          id: Uuid().v4obj(),
          userId: UuidValue.fromString(userId),
          conversationId: UuidValue.fromString(conversationId),
          messageCount: 1,
          totalTokens: totalTokens,
          inputTokens: inputTokens,
          outputTokens: outputTokens,
          toolCallsInConversation: toolCallsCount ?? 0,
          estimatedCost: totalTokens * 0.00001,
          averageResponseTime: responseTime ?? 0.0,
          date: DateTime(now.year, now.month, now.day),
          createdAt: now,
          updatedAt: now,
        );
        await AIConversationUsage.db.insertRow(session, conversationUsage);
      } else {
        conversationUsage.messageCount++;
        conversationUsage.totalTokens += totalTokens;
        conversationUsage.inputTokens += inputTokens;
        conversationUsage.outputTokens += outputTokens;
        if (toolCallsCount != null) {
          conversationUsage.toolCallsInConversation += toolCallsCount;
        }
        conversationUsage.estimatedCost += totalTokens * 0.00001;
        conversationUsage.updatedAt = now;
        await AIConversationUsage.db.updateRow(session, conversationUsage);
      }

      // Update usage pattern for customers
      if (userType == UserType.customer) {
        await _updateUsagePattern(session, userId);
      }
    } catch (e) {
      session.log('Error tracking AI message: $e');
    }
  }

  // =========================================================================
  // RESET DAILY LIMITS
  // =========================================================================

  Future<void> resetDailyLimits(Session session) async {
    try {
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);

      // Find all trackers that need reset
      final trackers = await DailyUsageTracker.db.find(
        session,
        where: (t) => t.resetAt.between(
          DateTime(now.year, now.month, now.day - 1),
          today,
        ),
      );

      session.log('Resetting ${trackers.length} daily limits');

      for (var tracker in trackers) {
        // Send reset notification
        if (tracker.hardLimitReached) {
          await _sendUsageAlert(
            session: session,
            userId: tracker.userId.uuid,
            userType: tracker.userType,
            alertType: AlertType.limit_reset,
            limitType: LimitType.tool_calls,
            currentUsage: 0,
            limitValue: tracker.toolCallsLimit,
          );
        }

        // Create new tracker for today
        await _getOrCreateDailyTracker(
          session: session,
          userId: tracker.userId.uuid,
          userType: tracker.userType,
          tier: tracker.subscriptionTier,
        );
      }

      session.log('Daily limits reset completed');
    } catch (e) {
      session.log('Error resetting daily limits: $e');
    }
  }

  // =========================================================================
  // GENERATE MONTHLY BILLING
  // =========================================================================

  Future<void> generateMonthlyBilling({
    required Session session,
    required String vendorId,
  }) async {
    try {
      final now = DateTime.now();
      final periodStart = DateTime(now.year, now.month - 1, 1);
      final periodEnd = DateTime(now.year, now.month, 0, 23, 59, 59);

      // Get vendor
      final vendor = await VendorProfile.db.findFirstRow(
        session,
        where: (t) => t.userId.equals(UuidValue.fromString(vendorId)),
      );

      if (vendor == null) return;

      // Get subscription
      final subscription = await Subscription.db.findFirstRow(
        session,
        where: (t) =>
            t.vendorId.equals(UuidValue.fromString(vendorId)) &
            t.status.equals('active'),
      );

      if (subscription == null) return;

      // Get tier limits
      final tierFeature = await TierFeature.db.findFirstRow(
        session,
        where: (t) => t.tier.equals(vendor.subscriptionTier),
      );

      if (tierFeature == null) return;

      // Get usage records for the period
      final toolUsage = await ToolUsageLog.db.find(
        session,
        where: (t) =>
            t.userId.equals(UuidValue.fromString(vendorId)) &
            t.createdAt.between(periodStart, periodEnd),
      );

      final totalToolCalls = toolUsage.length;
      final monthlyLimit =
          TIER_LIMITS[vendor.subscriptionTier]!['monthly_tool_calls']!;
      final toolCallsOverage =
          totalToolCalls > monthlyLimit ? totalToolCalls - monthlyLimit : 0;

      // Calculate costs
      final baseAmount = subscription.amount;
      final toolCallsOverageCost =
          toolCallsOverage * tierFeature.overageToolCallPrice;
      final totalAmount = baseAmount + toolCallsOverageCost;

      // Create billing summary
      final summary = BillingCycleSummary(
        id: Uuid().v4obj(),
        vendorId: UuidValue.fromString(vendorId),
        periodStart: periodStart,
        periodEnd: periodEnd,
        billingCycle: subscription.billingCycle,
        subscriptionTier: vendor.subscriptionTier,
        baseSubscriptionAmount: baseAmount,
        totalToolCalls: totalToolCalls,
        toolCallsIncluded: monthlyLimit,
        toolCallsOverage: toolCallsOverage,
        toolCallsOverageCost: toolCallsOverageCost,
        totalAmount: totalAmount,
        status: 'finalized',
        createdAt: now,
        updatedAt: now,
      );

      await BillingCycleSummary.db.insertRow(session, summary);

      session.log(
          'Generated billing for vendor $vendorId: \$${totalAmount.toStringAsFixed(2)}');
    } catch (e) {
      session.log('Error generating monthly billing: $e');
    }
  }

  // =========================================================================
  // HELPER METHODS
  // =========================================================================

  Future<DailyUsageTracker> _getOrCreateDailyTracker({
    required Session session,
    required String userId,
    required UserType userType,
    SubscriptionTier? tier,
  }) async {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final tomorrow = DateTime(now.year, now.month, now.day + 1);

    var tracker = await DailyUsageTracker.db.findFirstRow(
      session,
      where: (t) =>
          t.userId.equals(UuidValue.fromString(userId)) & t.date.equals(today),
    );

    if (tracker == null) {
      // Determine limits based on user type
      int toolCallsLimit = 20; // Default for customers
      int aiMessagesLimit = 100;
      int gracePeriodLimit = 0;

      if (userType == UserType.vendor && tier != null) {
        final limits = TIER_LIMITS[tier]!;
        toolCallsLimit = limits['daily_tool_calls']!;
        aiMessagesLimit = 200;
        gracePeriodLimit = limits['grace_period']!;
      }

      tracker = DailyUsageTracker(
        id: Uuid().v4obj(),
        userId: UuidValue.fromString(userId),
        userType: userType,
        date: today,
        resetAt: tomorrow,
        toolCallsCount: 0,
        toolCallsLimit: toolCallsLimit,
        aiMessagesCount: 0,
        aiMessagesLimit: aiMessagesLimit,
        productsCreatedCount: 0,
        productsCreatedLimit:
            tier != null ? TIER_LIMITS[tier]!['product_limit']! : 0,
        aiDescriptionsCount: 0,
        aiDescriptionsLimit:
            tier != null ? TIER_LIMITS[tier]!['ai_descriptions']! : 0,
        analyticsQueriesCount: 0,
        analyticsQueriesLimit: 50,
        isInGracePeriod: false,
        gracePeriodUsed: 0,
        gracePeriodLimit: gracePeriodLimit,
        subscriptionTier: tier,
        softLimitWarned: false,
        hardLimitReached: false,
        createdAt: now,
        updatedAt: now,
      );

      await DailyUsageTracker.db.insertRow(session, tracker);
    }

    return tracker;
  }

  Future<CustomerUsagePattern> _getOrCreateUsagePattern(
    Session session,
    String userId,
  ) async {
    var pattern = await CustomerUsagePattern.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(UuidValue.fromString(userId)),
    );

    if (pattern == null) {
      pattern = CustomerUsagePattern(
        id: Uuid().v4obj(),
        userId: UuidValue.fromString(userId),
        averageDailyMessages: 0.0,
        averageDailyToolCalls: 0.0,
        usageClass: UsageClass.light,
        isAbuser: false,
        abuseScore: 0.0,
        toolSuccessRate: 1.0,
        averageToolExecutionTime: 0.0,
        averageConversationLength: 0.0,
        repetitiveQueryScore: 0.0,
        shouldThrottle: false,
        currentThrottleDelay: 0,
        analysisCount: 0,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
      await CustomerUsagePattern.db.insertRow(session, pattern);
    }

    return pattern;
  }

  Future<bool> _shouldThrottleToolCall(
    Session session,
    String userId,
    CustomerUsagePattern pattern,
  ) async {
    // Check if user is in heavy/excessive class
    if (pattern.usageClass == UsageClass.heavy ||
        pattern.usageClass == UsageClass.excessive) {
      return true;
    }

    // Check recent tool call frequency
    final now = DateTime.now();
    final recentCalls = await ToolUsageLog.db.find(
      session,
      where: (t) =>
          t.userId.equals(UuidValue.fromString(userId)) &
          t.createdAt.between(
            now.subtract(Duration(minutes: 1)),
            now,
          ),
    );

    // Throttle if more than 10 calls in last minute
    return recentCalls.length > 10;
  }

  Future<void> _updateUsagePattern(
    Session session,
    String userId,
  ) async {
    // TODO: Implement ML-based pattern analysis
    // For now, simple heuristic
  }

  Future<void> _createUsageRecord({
    required Session session,
    required String vendorId,
    required String usageType,
    required int quantity,
    required double unitPrice,
    required double totalAmount,
  }) async {
    final now = DateTime.now();

    final usage = UsageRecord(
      id: Uuid().v4obj(),
      vendorId: UuidValue.fromString(vendorId),
      usageType: usageType,
      quantity: quantity,
      unitPrice: unitPrice,
      totalAmount: totalAmount,
      currency: 'USD',
      billingPeriodStart: DateTime(now.year, now.month, 1),
      billingPeriodEnd: DateTime(now.year, now.month + 1, 0),
      isBilled: false,
      createdAt: now,
    );

    await UsageRecord.db.insertRow(session, usage);
  }

  Future<void> _logLimitBreach({
    required Session session,
    required String userId,
    required UserType userType,
    required LimitType limitType,
    required String attemptedAction,
    required int currentUsage,
    required int limitValue,
    required BreachSeverity severity,
  }) async {
    final breach = LimitBreachLog(
      id: Uuid().v4obj(),
      userId: UuidValue.fromString(userId),
      userType: userType,
      limitType: limitType,
      attemptedAction: attemptedAction,
      currentUsage: currentUsage,
      limitValue: limitValue,
      actionTaken: severity == BreachSeverity.hard ? 'blocked' : 'allowed',
      userNotified: false,
      severity: severity,
      breachedAt: DateTime.now(),
    );

    await LimitBreachLog.db.insertRow(session, breach);
  }

  Future<void> _sendUsageAlert({
    required Session session,
    required String userId,
    required UserType userType,
    required AlertType alertType,
    required LimitType limitType,
    required int currentUsage,
    required int limitValue,
  }) async {
    final alert = UsageAlert(
      id: Uuid().v4obj(),
      userId: UuidValue.fromString(userId),
      userType: userType,
      alertType: alertType,
      limitType: limitType,
      thresholdPercentage: ((currentUsage / limitValue) * 100).toInt(),
      currentUsage: currentUsage,
      limitValue: limitValue,
      title: _getAlertTitle(alertType),
      message: _getAlertMessage(alertType, currentUsage, limitValue),
      actionRequired: alertType == AlertType.hard_limit_reached,
      isRead: false,
      isDismissed: false,
      createdAt: DateTime.now(),
    );

    await UsageAlert.db.insertRow(session, alert);
  }

  String _categorizeTools(String toolName) {
    if (toolName.contains('product')) return 'Product Management';
    if (toolName.contains('order')) return 'Order Management';
    if (toolName.contains('cart') || toolName.contains('checkout')) {
      return 'Shopping';
    }
    if (toolName.contains('analytics') || toolName.contains('subscription')) {
      return 'Business Intelligence';
    }
    return 'General';
  }

  String _getAlertTitle(AlertType type) {
    switch (type) {
      case AlertType.soft_limit_approaching:
        return 'Approaching Usage Limit';
      case AlertType.soft_limit_reached:
        return 'Usage Limit Reached';
      case AlertType.hard_limit_reached:
        return 'Daily Limit Exceeded';
      case AlertType.grace_period_activated:
        return 'Grace Period Active';
      case AlertType.limit_reset:
        return 'Limits Reset';
      case AlertType.upgrade_recommended:
        return 'Consider Upgrading';
      case AlertType.cost_threshold:
        return 'Cost Alert';
    }
  }

  String _getAlertMessage(AlertType type, int current, int limit) {
    switch (type) {
      case AlertType.soft_limit_approaching:
        return 'You have used $current of $limit daily tool calls (${((current / limit) * 100).toInt()}%).';
      case AlertType.soft_limit_reached:
        return 'You have reached your daily limit of $limit tool calls.';
      case AlertType.hard_limit_reached:
        return 'Daily limit exceeded. Limit resets at midnight or upgrade your plan.';
      default:
        return 'Usage notification';
    }
  }
}
