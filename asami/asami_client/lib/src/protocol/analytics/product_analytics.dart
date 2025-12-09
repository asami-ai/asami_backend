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
import '../product/product.dart' as _i2;

abstract class ProductAnalytics implements _i1.SerializableModel {
  ProductAnalytics._({
    _i1.UuidValue? id,
    required this.productId,
    this.product,
    required this.vendorId,
    required this.date,
    required this.period,
    int? views,
    int? uniqueViews,
    int? wishlistAdds,
    int? cartAdds,
    int? orderCount,
    int? quantitySold,
    double? revenue,
    double? conversionRate,
    double? bounceRate,
    double? averageTimeOnPage,
    int? newReviews,
    double? averageRating,
    int? searchImpressions,
    int? searchClicks,
    double? searchRanking,
    int? stockLevelStart,
    int? stockLevelEnd,
    int? stockOuts,
    DateTime? createdAt,
  })  : id = id ?? _i1.Uuid().v4obj(),
        views = views ?? 0,
        uniqueViews = uniqueViews ?? 0,
        wishlistAdds = wishlistAdds ?? 0,
        cartAdds = cartAdds ?? 0,
        orderCount = orderCount ?? 0,
        quantitySold = quantitySold ?? 0,
        revenue = revenue ?? 0.0,
        conversionRate = conversionRate ?? 0.0,
        bounceRate = bounceRate ?? 0.0,
        averageTimeOnPage = averageTimeOnPage ?? 0.0,
        newReviews = newReviews ?? 0,
        averageRating = averageRating ?? 0.0,
        searchImpressions = searchImpressions ?? 0,
        searchClicks = searchClicks ?? 0,
        searchRanking = searchRanking ?? 0.0,
        stockLevelStart = stockLevelStart ?? 0,
        stockLevelEnd = stockLevelEnd ?? 0,
        stockOuts = stockOuts ?? 0,
        createdAt = createdAt ?? DateTime.now();

  factory ProductAnalytics({
    _i1.UuidValue? id,
    required _i1.UuidValue productId,
    _i2.Product? product,
    required _i1.UuidValue vendorId,
    required DateTime date,
    required String period,
    int? views,
    int? uniqueViews,
    int? wishlistAdds,
    int? cartAdds,
    int? orderCount,
    int? quantitySold,
    double? revenue,
    double? conversionRate,
    double? bounceRate,
    double? averageTimeOnPage,
    int? newReviews,
    double? averageRating,
    int? searchImpressions,
    int? searchClicks,
    double? searchRanking,
    int? stockLevelStart,
    int? stockLevelEnd,
    int? stockOuts,
    DateTime? createdAt,
  }) = _ProductAnalyticsImpl;

  factory ProductAnalytics.fromJson(Map<String, dynamic> jsonSerialization) {
    return ProductAnalytics(
      id: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      productId:
          _i1.UuidValueJsonExtension.fromJson(jsonSerialization['productId']),
      product: jsonSerialization['product'] == null
          ? null
          : _i2.Product.fromJson(
              (jsonSerialization['product'] as Map<String, dynamic>)),
      vendorId:
          _i1.UuidValueJsonExtension.fromJson(jsonSerialization['vendorId']),
      date: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['date']),
      period: jsonSerialization['period'] as String,
      views: jsonSerialization['views'] as int,
      uniqueViews: jsonSerialization['uniqueViews'] as int,
      wishlistAdds: jsonSerialization['wishlistAdds'] as int,
      cartAdds: jsonSerialization['cartAdds'] as int,
      orderCount: jsonSerialization['orderCount'] as int,
      quantitySold: jsonSerialization['quantitySold'] as int,
      revenue: (jsonSerialization['revenue'] as num).toDouble(),
      conversionRate: (jsonSerialization['conversionRate'] as num).toDouble(),
      bounceRate: (jsonSerialization['bounceRate'] as num).toDouble(),
      averageTimeOnPage:
          (jsonSerialization['averageTimeOnPage'] as num).toDouble(),
      newReviews: jsonSerialization['newReviews'] as int,
      averageRating: (jsonSerialization['averageRating'] as num).toDouble(),
      searchImpressions: jsonSerialization['searchImpressions'] as int,
      searchClicks: jsonSerialization['searchClicks'] as int,
      searchRanking: (jsonSerialization['searchRanking'] as num).toDouble(),
      stockLevelStart: jsonSerialization['stockLevelStart'] as int,
      stockLevelEnd: jsonSerialization['stockLevelEnd'] as int,
      stockOuts: jsonSerialization['stockOuts'] as int,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _i1.UuidValue id;

  _i1.UuidValue productId;

  _i2.Product? product;

  _i1.UuidValue vendorId;

  DateTime date;

  String period;

  int views;

  int uniqueViews;

  int wishlistAdds;

  int cartAdds;

  int orderCount;

  int quantitySold;

  double revenue;

  double conversionRate;

  double bounceRate;

  double averageTimeOnPage;

  int newReviews;

  double averageRating;

  int searchImpressions;

  int searchClicks;

  double searchRanking;

  int stockLevelStart;

  int stockLevelEnd;

  int stockOuts;

  DateTime createdAt;

  /// Returns a shallow copy of this [ProductAnalytics]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ProductAnalytics copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? productId,
    _i2.Product? product,
    _i1.UuidValue? vendorId,
    DateTime? date,
    String? period,
    int? views,
    int? uniqueViews,
    int? wishlistAdds,
    int? cartAdds,
    int? orderCount,
    int? quantitySold,
    double? revenue,
    double? conversionRate,
    double? bounceRate,
    double? averageTimeOnPage,
    int? newReviews,
    double? averageRating,
    int? searchImpressions,
    int? searchClicks,
    double? searchRanking,
    int? stockLevelStart,
    int? stockLevelEnd,
    int? stockOuts,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'productId': productId.toJson(),
      if (product != null) 'product': product?.toJson(),
      'vendorId': vendorId.toJson(),
      'date': date.toJson(),
      'period': period,
      'views': views,
      'uniqueViews': uniqueViews,
      'wishlistAdds': wishlistAdds,
      'cartAdds': cartAdds,
      'orderCount': orderCount,
      'quantitySold': quantitySold,
      'revenue': revenue,
      'conversionRate': conversionRate,
      'bounceRate': bounceRate,
      'averageTimeOnPage': averageTimeOnPage,
      'newReviews': newReviews,
      'averageRating': averageRating,
      'searchImpressions': searchImpressions,
      'searchClicks': searchClicks,
      'searchRanking': searchRanking,
      'stockLevelStart': stockLevelStart,
      'stockLevelEnd': stockLevelEnd,
      'stockOuts': stockOuts,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ProductAnalyticsImpl extends ProductAnalytics {
  _ProductAnalyticsImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue productId,
    _i2.Product? product,
    required _i1.UuidValue vendorId,
    required DateTime date,
    required String period,
    int? views,
    int? uniqueViews,
    int? wishlistAdds,
    int? cartAdds,
    int? orderCount,
    int? quantitySold,
    double? revenue,
    double? conversionRate,
    double? bounceRate,
    double? averageTimeOnPage,
    int? newReviews,
    double? averageRating,
    int? searchImpressions,
    int? searchClicks,
    double? searchRanking,
    int? stockLevelStart,
    int? stockLevelEnd,
    int? stockOuts,
    DateTime? createdAt,
  }) : super._(
          id: id,
          productId: productId,
          product: product,
          vendorId: vendorId,
          date: date,
          period: period,
          views: views,
          uniqueViews: uniqueViews,
          wishlistAdds: wishlistAdds,
          cartAdds: cartAdds,
          orderCount: orderCount,
          quantitySold: quantitySold,
          revenue: revenue,
          conversionRate: conversionRate,
          bounceRate: bounceRate,
          averageTimeOnPage: averageTimeOnPage,
          newReviews: newReviews,
          averageRating: averageRating,
          searchImpressions: searchImpressions,
          searchClicks: searchClicks,
          searchRanking: searchRanking,
          stockLevelStart: stockLevelStart,
          stockLevelEnd: stockLevelEnd,
          stockOuts: stockOuts,
          createdAt: createdAt,
        );

  /// Returns a shallow copy of this [ProductAnalytics]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ProductAnalytics copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? productId,
    Object? product = _Undefined,
    _i1.UuidValue? vendorId,
    DateTime? date,
    String? period,
    int? views,
    int? uniqueViews,
    int? wishlistAdds,
    int? cartAdds,
    int? orderCount,
    int? quantitySold,
    double? revenue,
    double? conversionRate,
    double? bounceRate,
    double? averageTimeOnPage,
    int? newReviews,
    double? averageRating,
    int? searchImpressions,
    int? searchClicks,
    double? searchRanking,
    int? stockLevelStart,
    int? stockLevelEnd,
    int? stockOuts,
    DateTime? createdAt,
  }) {
    return ProductAnalytics(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      product: product is _i2.Product? ? product : this.product?.copyWith(),
      vendorId: vendorId ?? this.vendorId,
      date: date ?? this.date,
      period: period ?? this.period,
      views: views ?? this.views,
      uniqueViews: uniqueViews ?? this.uniqueViews,
      wishlistAdds: wishlistAdds ?? this.wishlistAdds,
      cartAdds: cartAdds ?? this.cartAdds,
      orderCount: orderCount ?? this.orderCount,
      quantitySold: quantitySold ?? this.quantitySold,
      revenue: revenue ?? this.revenue,
      conversionRate: conversionRate ?? this.conversionRate,
      bounceRate: bounceRate ?? this.bounceRate,
      averageTimeOnPage: averageTimeOnPage ?? this.averageTimeOnPage,
      newReviews: newReviews ?? this.newReviews,
      averageRating: averageRating ?? this.averageRating,
      searchImpressions: searchImpressions ?? this.searchImpressions,
      searchClicks: searchClicks ?? this.searchClicks,
      searchRanking: searchRanking ?? this.searchRanking,
      stockLevelStart: stockLevelStart ?? this.stockLevelStart,
      stockLevelEnd: stockLevelEnd ?? this.stockLevelEnd,
      stockOuts: stockOuts ?? this.stockOuts,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
