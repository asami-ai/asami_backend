/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import '../user/vendor_profile.dart' as _i2;

abstract class VendorAnalytics implements _i1.SerializableModel {
  VendorAnalytics._({
    _i1.UuidValue? id,
    required this.vendorId,
    this.vendor,
    required this.date,
    required this.period,
    int? totalOrders,
    int? completedOrders,
    int? cancelledOrders,
    double? totalRevenue,
    double? averageOrderValue,
    int? totalProducts,
    int? activeProducts,
    int? outOfStockProducts,
    int? newProductsAdded,
    int? totalCustomers,
    int? newCustomers,
    int? returningCustomers,
    int? productViews,
    int? wishlistAdds,
    int? cartAdds,
    double? conversionRate,
    int? aiDescriptionsGenerated,
    int? aiQueriesProcessed,
    double? aiCostsIncurred,
    double? fiatPayments,
    double? cryptoPayments,
    double? platformFeesCollected,
    int? newReviews,
    double? averageRatingPeriod,
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : id = id ?? _i1.Uuid().v4obj(),
        totalOrders = totalOrders ?? 0,
        completedOrders = completedOrders ?? 0,
        cancelledOrders = cancelledOrders ?? 0,
        totalRevenue = totalRevenue ?? 0.0,
        averageOrderValue = averageOrderValue ?? 0.0,
        totalProducts = totalProducts ?? 0,
        activeProducts = activeProducts ?? 0,
        outOfStockProducts = outOfStockProducts ?? 0,
        newProductsAdded = newProductsAdded ?? 0,
        totalCustomers = totalCustomers ?? 0,
        newCustomers = newCustomers ?? 0,
        returningCustomers = returningCustomers ?? 0,
        productViews = productViews ?? 0,
        wishlistAdds = wishlistAdds ?? 0,
        cartAdds = cartAdds ?? 0,
        conversionRate = conversionRate ?? 0.0,
        aiDescriptionsGenerated = aiDescriptionsGenerated ?? 0,
        aiQueriesProcessed = aiQueriesProcessed ?? 0,
        aiCostsIncurred = aiCostsIncurred ?? 0.0,
        fiatPayments = fiatPayments ?? 0.0,
        cryptoPayments = cryptoPayments ?? 0.0,
        platformFeesCollected = platformFeesCollected ?? 0.0,
        newReviews = newReviews ?? 0,
        averageRatingPeriod = averageRatingPeriod ?? 0.0,
        createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  factory VendorAnalytics({
    _i1.UuidValue? id,
    required _i1.UuidValue vendorId,
    _i2.VendorProfile? vendor,
    required DateTime date,
    required String period,
    int? totalOrders,
    int? completedOrders,
    int? cancelledOrders,
    double? totalRevenue,
    double? averageOrderValue,
    int? totalProducts,
    int? activeProducts,
    int? outOfStockProducts,
    int? newProductsAdded,
    int? totalCustomers,
    int? newCustomers,
    int? returningCustomers,
    int? productViews,
    int? wishlistAdds,
    int? cartAdds,
    double? conversionRate,
    int? aiDescriptionsGenerated,
    int? aiQueriesProcessed,
    double? aiCostsIncurred,
    double? fiatPayments,
    double? cryptoPayments,
    double? platformFeesCollected,
    int? newReviews,
    double? averageRatingPeriod,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _VendorAnalyticsImpl;

  factory VendorAnalytics.fromJson(Map<String, dynamic> jsonSerialization) {
    return VendorAnalytics(
      id: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      vendorId:
          _i1.UuidValueJsonExtension.fromJson(jsonSerialization['vendorId']),
      vendor: jsonSerialization['vendor'] == null
          ? null
          : _i2.VendorProfile.fromJson(
              (jsonSerialization['vendor'] as Map<String, dynamic>)),
      date: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['date']),
      period: jsonSerialization['period'] as String,
      totalOrders: jsonSerialization['totalOrders'] as int,
      completedOrders: jsonSerialization['completedOrders'] as int,
      cancelledOrders: jsonSerialization['cancelledOrders'] as int,
      totalRevenue: (jsonSerialization['totalRevenue'] as num).toDouble(),
      averageOrderValue:
          (jsonSerialization['averageOrderValue'] as num).toDouble(),
      totalProducts: jsonSerialization['totalProducts'] as int,
      activeProducts: jsonSerialization['activeProducts'] as int,
      outOfStockProducts: jsonSerialization['outOfStockProducts'] as int,
      newProductsAdded: jsonSerialization['newProductsAdded'] as int,
      totalCustomers: jsonSerialization['totalCustomers'] as int,
      newCustomers: jsonSerialization['newCustomers'] as int,
      returningCustomers: jsonSerialization['returningCustomers'] as int,
      productViews: jsonSerialization['productViews'] as int,
      wishlistAdds: jsonSerialization['wishlistAdds'] as int,
      cartAdds: jsonSerialization['cartAdds'] as int,
      conversionRate: (jsonSerialization['conversionRate'] as num).toDouble(),
      aiDescriptionsGenerated:
          jsonSerialization['aiDescriptionsGenerated'] as int,
      aiQueriesProcessed: jsonSerialization['aiQueriesProcessed'] as int,
      aiCostsIncurred: (jsonSerialization['aiCostsIncurred'] as num).toDouble(),
      fiatPayments: (jsonSerialization['fiatPayments'] as num).toDouble(),
      cryptoPayments: (jsonSerialization['cryptoPayments'] as num).toDouble(),
      platformFeesCollected:
          (jsonSerialization['platformFeesCollected'] as num).toDouble(),
      newReviews: jsonSerialization['newReviews'] as int,
      averageRatingPeriod:
          (jsonSerialization['averageRatingPeriod'] as num).toDouble(),
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _i1.UuidValue id;

  _i1.UuidValue vendorId;

  _i2.VendorProfile? vendor;

  DateTime date;

  String period;

  int totalOrders;

  int completedOrders;

  int cancelledOrders;

  double totalRevenue;

  double averageOrderValue;

  int totalProducts;

  int activeProducts;

  int outOfStockProducts;

  int newProductsAdded;

  int totalCustomers;

  int newCustomers;

  int returningCustomers;

  int productViews;

  int wishlistAdds;

  int cartAdds;

  double conversionRate;

  int aiDescriptionsGenerated;

  int aiQueriesProcessed;

  double aiCostsIncurred;

  double fiatPayments;

  double cryptoPayments;

  double platformFeesCollected;

  int newReviews;

  double averageRatingPeriod;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [VendorAnalytics]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  VendorAnalytics copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? vendorId,
    _i2.VendorProfile? vendor,
    DateTime? date,
    String? period,
    int? totalOrders,
    int? completedOrders,
    int? cancelledOrders,
    double? totalRevenue,
    double? averageOrderValue,
    int? totalProducts,
    int? activeProducts,
    int? outOfStockProducts,
    int? newProductsAdded,
    int? totalCustomers,
    int? newCustomers,
    int? returningCustomers,
    int? productViews,
    int? wishlistAdds,
    int? cartAdds,
    double? conversionRate,
    int? aiDescriptionsGenerated,
    int? aiQueriesProcessed,
    double? aiCostsIncurred,
    double? fiatPayments,
    double? cryptoPayments,
    double? platformFeesCollected,
    int? newReviews,
    double? averageRatingPeriod,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'vendorId': vendorId.toJson(),
      if (vendor != null) 'vendor': vendor?.toJson(),
      'date': date.toJson(),
      'period': period,
      'totalOrders': totalOrders,
      'completedOrders': completedOrders,
      'cancelledOrders': cancelledOrders,
      'totalRevenue': totalRevenue,
      'averageOrderValue': averageOrderValue,
      'totalProducts': totalProducts,
      'activeProducts': activeProducts,
      'outOfStockProducts': outOfStockProducts,
      'newProductsAdded': newProductsAdded,
      'totalCustomers': totalCustomers,
      'newCustomers': newCustomers,
      'returningCustomers': returningCustomers,
      'productViews': productViews,
      'wishlistAdds': wishlistAdds,
      'cartAdds': cartAdds,
      'conversionRate': conversionRate,
      'aiDescriptionsGenerated': aiDescriptionsGenerated,
      'aiQueriesProcessed': aiQueriesProcessed,
      'aiCostsIncurred': aiCostsIncurred,
      'fiatPayments': fiatPayments,
      'cryptoPayments': cryptoPayments,
      'platformFeesCollected': platformFeesCollected,
      'newReviews': newReviews,
      'averageRatingPeriod': averageRatingPeriod,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _VendorAnalyticsImpl extends VendorAnalytics {
  _VendorAnalyticsImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue vendorId,
    _i2.VendorProfile? vendor,
    required DateTime date,
    required String period,
    int? totalOrders,
    int? completedOrders,
    int? cancelledOrders,
    double? totalRevenue,
    double? averageOrderValue,
    int? totalProducts,
    int? activeProducts,
    int? outOfStockProducts,
    int? newProductsAdded,
    int? totalCustomers,
    int? newCustomers,
    int? returningCustomers,
    int? productViews,
    int? wishlistAdds,
    int? cartAdds,
    double? conversionRate,
    int? aiDescriptionsGenerated,
    int? aiQueriesProcessed,
    double? aiCostsIncurred,
    double? fiatPayments,
    double? cryptoPayments,
    double? platformFeesCollected,
    int? newReviews,
    double? averageRatingPeriod,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
          id: id,
          vendorId: vendorId,
          vendor: vendor,
          date: date,
          period: period,
          totalOrders: totalOrders,
          completedOrders: completedOrders,
          cancelledOrders: cancelledOrders,
          totalRevenue: totalRevenue,
          averageOrderValue: averageOrderValue,
          totalProducts: totalProducts,
          activeProducts: activeProducts,
          outOfStockProducts: outOfStockProducts,
          newProductsAdded: newProductsAdded,
          totalCustomers: totalCustomers,
          newCustomers: newCustomers,
          returningCustomers: returningCustomers,
          productViews: productViews,
          wishlistAdds: wishlistAdds,
          cartAdds: cartAdds,
          conversionRate: conversionRate,
          aiDescriptionsGenerated: aiDescriptionsGenerated,
          aiQueriesProcessed: aiQueriesProcessed,
          aiCostsIncurred: aiCostsIncurred,
          fiatPayments: fiatPayments,
          cryptoPayments: cryptoPayments,
          platformFeesCollected: platformFeesCollected,
          newReviews: newReviews,
          averageRatingPeriod: averageRatingPeriod,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  /// Returns a shallow copy of this [VendorAnalytics]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  VendorAnalytics copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? vendorId,
    Object? vendor = _Undefined,
    DateTime? date,
    String? period,
    int? totalOrders,
    int? completedOrders,
    int? cancelledOrders,
    double? totalRevenue,
    double? averageOrderValue,
    int? totalProducts,
    int? activeProducts,
    int? outOfStockProducts,
    int? newProductsAdded,
    int? totalCustomers,
    int? newCustomers,
    int? returningCustomers,
    int? productViews,
    int? wishlistAdds,
    int? cartAdds,
    double? conversionRate,
    int? aiDescriptionsGenerated,
    int? aiQueriesProcessed,
    double? aiCostsIncurred,
    double? fiatPayments,
    double? cryptoPayments,
    double? platformFeesCollected,
    int? newReviews,
    double? averageRatingPeriod,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return VendorAnalytics(
      id: id ?? this.id,
      vendorId: vendorId ?? this.vendorId,
      vendor: vendor is _i2.VendorProfile? ? vendor : this.vendor?.copyWith(),
      date: date ?? this.date,
      period: period ?? this.period,
      totalOrders: totalOrders ?? this.totalOrders,
      completedOrders: completedOrders ?? this.completedOrders,
      cancelledOrders: cancelledOrders ?? this.cancelledOrders,
      totalRevenue: totalRevenue ?? this.totalRevenue,
      averageOrderValue: averageOrderValue ?? this.averageOrderValue,
      totalProducts: totalProducts ?? this.totalProducts,
      activeProducts: activeProducts ?? this.activeProducts,
      outOfStockProducts: outOfStockProducts ?? this.outOfStockProducts,
      newProductsAdded: newProductsAdded ?? this.newProductsAdded,
      totalCustomers: totalCustomers ?? this.totalCustomers,
      newCustomers: newCustomers ?? this.newCustomers,
      returningCustomers: returningCustomers ?? this.returningCustomers,
      productViews: productViews ?? this.productViews,
      wishlistAdds: wishlistAdds ?? this.wishlistAdds,
      cartAdds: cartAdds ?? this.cartAdds,
      conversionRate: conversionRate ?? this.conversionRate,
      aiDescriptionsGenerated:
          aiDescriptionsGenerated ?? this.aiDescriptionsGenerated,
      aiQueriesProcessed: aiQueriesProcessed ?? this.aiQueriesProcessed,
      aiCostsIncurred: aiCostsIncurred ?? this.aiCostsIncurred,
      fiatPayments: fiatPayments ?? this.fiatPayments,
      cryptoPayments: cryptoPayments ?? this.cryptoPayments,
      platformFeesCollected:
          platformFeesCollected ?? this.platformFeesCollected,
      newReviews: newReviews ?? this.newReviews,
      averageRatingPeriod: averageRatingPeriod ?? this.averageRatingPeriod,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
