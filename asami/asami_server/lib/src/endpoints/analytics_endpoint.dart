// File: server/lib/src/endpoints/analytics_endpoint.dart

import 'package:serverpod/serverpod.dart' hide Order;
import '../generated/protocol.dart';

class AnalyticsEndpoint extends Endpoint {
  /// Get vendor analytics for a specific period
  Future<VendorAnalytics?> getVendorAnalytics(
    Session session, {
    required UuidValue vendorId,
    required DateTime date,
    String period = 'daily',
  }) async {
    return await VendorAnalytics.db.findFirstRow(
      session,
      where: (t) =>
          t.vendorId.equals(vendorId) &
          t.date.equals(date) &
          t.period.equals(period),
    );
  }

  /// Get vendor analytics for date range
  Future<List<VendorAnalytics>> getVendorAnalyticsRange(
    Session session, {
    required UuidValue vendorId,
    required DateTime startDate,
    required DateTime endDate,
    String period = 'daily',
  }) async {
    return await VendorAnalytics.db.find(
      session,
      where: (t) =>
          t.vendorId.equals(vendorId) &
          t.period.equals(period) &
          t.date.between(startDate, endDate),
      orderBy: (t) => t.date,
      orderDescending: false,
    );
  }

  /// Generate vendor dashboard summary
  Future<Map<String, dynamic>> getVendorDashboard(
    Session session,
    UuidValue vendorId,
  ) async {
    final vendor = await VendorProfile.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(vendorId),
    );

    if (vendor == null) return {};

    // Get today's analytics
    final today = DateTime.now();
    final todayAnalytics = await getVendorAnalytics(
      session,
      vendorId: vendorId,
      date: DateTime(today.year, today.month, today.day),
      period: 'daily',
    );

    // Get this week's data
    final weekStart = today.subtract(Duration(days: 7));
    final weekAnalytics = await getVendorAnalyticsRange(
      session,
      vendorId: vendorId,
      startDate: weekStart,
      endDate: today,
      period: 'daily',
    );

    // Get pending orders
    final pendingOrders = await Order.db.count(
      session,
      where: (t) =>
          t.vendorId.equals(vendorId) & t.status.equals(OrderStatus.pending),
    );

    // Get low stock products
    final lowStockProducts = await Product.db.find(
      session,
      where: (t) =>
          t.vendorId.equals(vendorId) &
          (t.quantity < 5) &
          t.isActive.equals(true),
    );

    // Calculate week totals
    double weekRevenue = 0;
    int weekOrders = 0;
    for (var analytics in weekAnalytics) {
      weekRevenue += analytics.totalRevenue;
      weekOrders += analytics.totalOrders;
    }

    return {
      'vendor': vendor,
      'today': todayAnalytics,
      'week_summary': {
        'revenue': weekRevenue,
        'orders': weekOrders,
        'average_order_value': weekOrders > 0 ? weekRevenue / weekOrders : 0,
      },
      'pending_orders_count': pendingOrders,
      'low_stock_products': lowStockProducts,
      'subscription_status': {
        'tier': vendor.subscriptionTier.name,
        'products_used': vendor.currentProductCount,
        'products_limit': vendor.productLimit,
        'ai_descriptions_used': vendor.aiDescriptionsUsed,
        'ai_descriptions_limit': vendor.aiDescriptionsLimit,
      },
    };
  }

  /// Get product analytics
  Future<List<ProductAnalytics>> getProductAnalytics(
    Session session, {
    required UuidValue productId,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    return await ProductAnalytics.db.find(
      session,
      where: (t) =>
          t.productId.equals(productId) & t.date.between(startDate, endDate),
      orderBy: (t) => t.date,
    );
  }

  /// Get top selling products for vendor
  Future<List<Product>> getTopSellingProducts(
    Session session, {
    required UuidValue vendorId,
    int limit = 10,
  }) async {
    return await Product.db.find(
      session,
      where: (t) => t.vendorId.equals(vendorId) & t.isActive.equals(true),
      orderBy: (t) => t.orderCount,
      orderDescending: true,
      limit: limit,
    );
  }

  /// Get revenue breakdown by payment method
  Future<Map<String, double>> getPaymentMethodBreakdown(
    Session session, {
    required UuidValue vendorId,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    final orders = await Order.db.find(
      session,
      where: (t) =>
          t.vendorId.equals(vendorId) &
          t.paymentStatus.equals(PaymentStatus.completed) &
          t.createdAt.between(startDate, endDate),
    );

    final breakdown = <String, double>{};
    for (var order in orders) {
      final method = order.paymentMethod.name;
      breakdown[method] = (breakdown[method] ?? 0) + order.totalAmount;
    }

    return breakdown;
  }

  /// Record daily analytics (should be run by a scheduled job)
  Future<void> recordDailyAnalytics(Session session, DateTime date) async {
    // Get all active vendors
    final vendors = await VendorProfile.db.find(
      session,
      where: (t) => t.isVerified.equals(true),
    );

    for (var vendor in vendors) {
      await _generateVendorDailyAnalytics(session, vendor.userId, date);
    }

    // Generate platform-wide analytics
    await _generatePlatformAnalytics(session, date);
  }

  // Private helper methods
  Future<void> _generateVendorDailyAnalytics(
    Session session,
    UuidValue vendorId,
    DateTime date,
  ) async {
    final dayStart = DateTime(date.year, date.month, date.day);
    final dayEnd = dayStart.add(Duration(days: 1));

    // Get orders for the day
    final orders = await Order.db.find(
      session,
      where: (t) =>
          t.vendorId.equals(vendorId) & t.createdAt.between(dayStart, dayEnd),
    );

    final completedOrders =
        orders.where((o) => o.status == OrderStatus.delivered).length;
    final cancelledOrders =
        orders.where((o) => o.status == OrderStatus.cancelled).length;
    final totalRevenue = orders.fold(0.0, (sum, o) => sum + o.totalAmount);
    final avgOrderValue =
        orders.isNotEmpty ? totalRevenue / orders.length : 0.0;

    // Get product metrics
    final products = await Product.db.find(
      session,
      where: (t) => t.vendorId.equals(vendorId),
    );

    final activeProducts = products.where((p) => p.isActive).length;
    final outOfStockProducts =
        products.where((p) => p.status == ProductStatus.out_of_stock).length;

    // Get new products added today
    final newProducts = await Product.db.count(
      session,
      where: (t) =>
          t.vendorId.equals(vendorId) & t.createdAt.between(dayStart, dayEnd),
    );

    // Get AI usage
    final aiUsage = await UsageRecord.db.find(
      session,
      where: (t) =>
          t.vendorId.equals(vendorId) & t.createdAt.between(dayStart, dayEnd),
    );

    final aiDescriptions =
        aiUsage.where((u) => u.usageType == 'product_description').length;
    final aiCosts = aiUsage.fold(0.0, (sum, u) => sum + u.totalAmount);

    // Create analytics record
    final analyticsId = Uuid().v4obj();
    final analytics = VendorAnalytics(
      id: analyticsId,
      vendorId: vendorId,
      date: dayStart,
      period: 'daily',
      totalOrders: orders.length,
      completedOrders: completedOrders,
      cancelledOrders: cancelledOrders,
      totalRevenue: totalRevenue,
      averageOrderValue: avgOrderValue,
      totalProducts: products.length,
      activeProducts: activeProducts,
      outOfStockProducts: outOfStockProducts,
      newProductsAdded: newProducts,
      aiDescriptionsGenerated: aiDescriptions,
      aiCostsIncurred: aiCosts,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    await VendorAnalytics.db.insertRow(session, analytics);
  }

  Future<void> _generatePlatformAnalytics(
    Session session,
    DateTime date,
  ) async {
    final dayStart = DateTime(date.year, date.month, date.day);
    final dayEnd = dayStart.add(Duration(days: 1));

    // Count users
    final totalUsers = await User.db.count(session);
    final newUsers = await User.db.count(
      session,
      where: (t) => t.createdAt.between(dayStart, dayEnd),
    );
    final totalCustomers = await User.db.count(
      session,
      where: (t) => t.userType.equals(UserType.customer),
    );
    final totalVendors = await User.db.count(
      session,
      where: (t) => t.userType.equals(UserType.vendor),
    );

    // Order metrics
    final orders = await Order.db.find(
      session,
      where: (t) => t.createdAt.between(dayStart, dayEnd),
    );

    final totalRevenue = orders.fold(0.0, (sum, o) => sum + o.totalAmount);
    final platformFees = orders.fold(0.0, (sum, o) => sum + o.platformFee);

    // Product metrics
    final totalProducts = await Product.db.count(session);
    final activeProducts = await Product.db.count(
      session,
      where: (t) => t.isActive.equals(true),
    );

    // Create analytics
    final analyticsId = Uuid().v4obj();
    final analytics = PlatformAnalytics(
      id: analyticsId,
      date: dayStart,
      period: 'daily',
      totalUsers: totalUsers,
      newUsers: newUsers,
      totalCustomers: totalCustomers,
      totalVendors: totalVendors,
      totalOrders: orders.length,
      totalRevenue: totalRevenue,
      platformFeesCollected: platformFees,
      totalProducts: totalProducts,
      activeProducts: activeProducts,
      createdAt: DateTime.now(),
    );

    await PlatformAnalytics.db.insertRow(session, analytics);
  }
}
