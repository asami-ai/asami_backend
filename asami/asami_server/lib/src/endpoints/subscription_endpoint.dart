
// File: server/lib/src/endpoints/subscription_endpoint.dart

import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class SubscriptionEndpoint extends Endpoint {
  /// Get vendor subscription
  Future<Subscription?> getVendorSubscription(
    Session session,
    UuidValue vendorId,
  ) async {
    return await Subscription.db.findFirstRow(
      session,
      where: (t) => 
          t.vendorId.equals(vendorId) & 
          t.status.equals('active'),
    );
  }

  /// Upgrade/change subscription tier
  Future<Subscription?> changeTier(
    Session session, {
    required UuidValue vendorId,
    required SubscriptionTier newTier,
  }) async {
    final vendor = await VendorProfile.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(vendorId),
    );

    if (vendor == null) return null;

    // Get current subscription
    var subscription = await getVendorSubscription(session, vendorId);

    final now = DateTime.now();
    final periodEnd = DateTime(now.year, now.month + 1, now.day);

    // Determine limits based on tier
    int productLimit;
    int aiLimit;
    double transactionFee;
    double amount;

    switch (newTier) {
      case SubscriptionTier.freemium:
        productLimit = 20;
        aiLimit = 50;
        transactionFee = 0.05;
        amount = 0.0;
        break;
      case SubscriptionTier.pro:
        productLimit = -1; // Unlimited
        aiLimit = -1;
        transactionFee = 0.02;
        amount = 0.0; // Pay as you use
        break;
      case SubscriptionTier.pro_max:
        productLimit = -1;
        aiLimit = -1;
        transactionFee = 0.0;
        amount = 99.0;
        break;
    }

    if (subscription == null) {
      // Create new subscription
      final subscriptionId = Uuid().v4obj();
      subscription = Subscription(
        id: subscriptionId,
        vendorId: vendorId,
        tier: newTier,
        amount: amount,
        currentPeriodStart: now,
        currentPeriodEnd: periodEnd,
        productLimit: productLimit,
        aiDescriptionsLimit: aiLimit,
        platformTransactionFee: transactionFee,
        createdAt: now,
        updatedAt: now,
      );

      subscription = await Subscription.db.insertRow(session, subscription);
    } else {
      // Update existing
      subscription.tier = newTier;
      subscription.amount = amount;
      subscription.productLimit = productLimit;
      subscription.aiDescriptionsLimit = aiLimit;
      subscription.platformTransactionFee = transactionFee;
      subscription.updatedAt = now;

      subscription = await Subscription.db.updateRow(session, subscription);
    }

    // Update vendor profile
    vendor.subscriptionTier = newTier;
    vendor.productLimit = productLimit;
    vendor.aiDescriptionsLimit = aiLimit;
    vendor.platformTransactionFee = transactionFee;
    vendor.updatedAt = now;
    await VendorProfile.db.updateRow(session, vendor);

    // Log event
    await _logSubscriptionEvent(
      session,
      subscriptionId: subscription.id,
      vendorId: vendorId,
      eventType: 'tier_changed',
      tier: newTier,
    );

    return subscription;
  }

  /// Get usage records for billing period
  Future<List<UsageRecord>> getUsageRecords(
    Session session, {
    required UuidValue vendorId,
    required DateTime periodStart,
    required DateTime periodEnd,
  }) async {
    return await UsageRecord.db.find(
      session,
      where: (t) => 
          t.vendorId.equals(vendorId) &
          t.billingPeriodStart.equals(periodStart) &
          t.billingPeriodEnd.equals(periodEnd),
    );
  }

  /// Generate invoice for subscription period
  Future<SubscriptionInvoice?> generateInvoice(
    Session session, {
    required UuidValue subscriptionId,
    required DateTime periodStart,
    required DateTime periodEnd,
  }) async {
    final subscription = await Subscription.db.findFirstRow(
      session,
      where: (t) => t.id.equals(subscriptionId),
    );

    if (subscription == null) return null;

    // Get usage for period
    final usage = await getUsageRecords(
      session,
      vendorId: subscription.vendorId,
      periodStart: periodStart,
      periodEnd: periodEnd,
    );

    final usageCharges = usage.fold(0.0, (sum, u) => sum + u.totalAmount);
    final subscriptionAmount = subscription.amount;
    final totalAmount = subscriptionAmount + usageCharges;

    final invoiceId = Uuid().v4obj();
    final invoiceNumber = 'INV-${DateTime.now().millisecondsSinceEpoch}';

    final invoice = SubscriptionInvoice(
      id: invoiceId,
      invoiceNumber: invoiceNumber,
      subscriptionId: subscriptionId,
      vendorId: subscription.vendorId,
      amount: totalAmount,
      subscriptionAmount: subscriptionAmount,
      usageCharges: usageCharges,
      periodStart: periodStart,
      periodEnd: periodEnd,
      dueDate: periodEnd.add(Duration(days: 7)),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    final created = await SubscriptionInvoice.db.insertRow(session, invoice);

    // Mark usage as billed
    for (var u in usage) {
      u.invoiceId = invoiceId;
      u.isBilled = true;
      u.billedAt = DateTime.now();
      await UsageRecord.db.updateRow(session, u);
    }

    return created;
  }

  /// Check if vendor can perform action based on tier limits
  Future<Map<String, dynamic>> checkTierLimits(
    Session session,
    UuidValue vendorId,
  ) async {
    final vendor = await VendorProfile.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(vendorId),
    );

    if (vendor == null) {
      return {'allowed': false, 'reason': 'Vendor not found'};
    }

    final canAddProduct = vendor.productLimit == -1 || 
        vendor.currentProductCount < vendor.productLimit;
    
    final canUseAi = vendor.aiDescriptionsLimit == -1 || 
        vendor.aiDescriptionsUsed < vendor.aiDescriptionsLimit;

    return {
      'tier': vendor.subscriptionTier.name,
      'can_add_product': canAddProduct,
      'products_remaining': vendor.productLimit == -1 
          ? -1 
          : vendor.productLimit - vendor.currentProductCount,
      'can_use_ai': canUseAi,
      'ai_descriptions_remaining': vendor.aiDescriptionsLimit == -1 
          ? -1 
          : vendor.aiDescriptionsLimit - vendor.aiDescriptionsUsed,
      'transaction_fee': vendor.platformTransactionFee,
    };
  }

  // Private helper
  Future<void> _logSubscriptionEvent(
    Session session, {
    required UuidValue subscriptionId,
    required UuidValue vendorId,
    required String eventType,
    SubscriptionTier? tier,
    SubscriptionTier? previousTier,
  }) async {
    final eventId = Uuid().v4obj();
    final event = SubscriptionEvent(
      eventId: eventId,
      subscriptionId: subscriptionId,
      vendorId: vendorId,
      eventType: eventType,
      tier: tier,
      previousTier: previousTier,
      createdAt: DateTime.now(),
    );

    await SubscriptionEvent.db.insertRow(session, event);
  }
}