/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: unnecessary_null_comparison

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../user/vendor_profile.dart' as _i2;

abstract class VendorAnalytics
    implements _i1.TableRow<_i1.UuidValue>, _i1.ProtocolSerialization {
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

  static final t = VendorAnalyticsTable();

  static const db = VendorAnalyticsRepository._();

  @override
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

  @override
  _i1.Table<_i1.UuidValue> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'id': id.toJson(),
      'vendorId': vendorId.toJson(),
      if (vendor != null) 'vendor': vendor?.toJsonForProtocol(),
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

  static VendorAnalyticsInclude include({_i2.VendorProfileInclude? vendor}) {
    return VendorAnalyticsInclude._(vendor: vendor);
  }

  static VendorAnalyticsIncludeList includeList({
    _i1.WhereExpressionBuilder<VendorAnalyticsTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<VendorAnalyticsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<VendorAnalyticsTable>? orderByList,
    VendorAnalyticsInclude? include,
  }) {
    return VendorAnalyticsIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(VendorAnalytics.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(VendorAnalytics.t),
      include: include,
    );
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

class VendorAnalyticsTable extends _i1.Table<_i1.UuidValue> {
  VendorAnalyticsTable({super.tableRelation})
      : super(tableName: 'vendor_analytics') {
    vendorId = _i1.ColumnUuid(
      'vendorId',
      this,
    );
    date = _i1.ColumnDateTime(
      'date',
      this,
    );
    period = _i1.ColumnString(
      'period',
      this,
    );
    totalOrders = _i1.ColumnInt(
      'totalOrders',
      this,
      hasDefault: true,
    );
    completedOrders = _i1.ColumnInt(
      'completedOrders',
      this,
      hasDefault: true,
    );
    cancelledOrders = _i1.ColumnInt(
      'cancelledOrders',
      this,
      hasDefault: true,
    );
    totalRevenue = _i1.ColumnDouble(
      'totalRevenue',
      this,
      hasDefault: true,
    );
    averageOrderValue = _i1.ColumnDouble(
      'averageOrderValue',
      this,
      hasDefault: true,
    );
    totalProducts = _i1.ColumnInt(
      'totalProducts',
      this,
      hasDefault: true,
    );
    activeProducts = _i1.ColumnInt(
      'activeProducts',
      this,
      hasDefault: true,
    );
    outOfStockProducts = _i1.ColumnInt(
      'outOfStockProducts',
      this,
      hasDefault: true,
    );
    newProductsAdded = _i1.ColumnInt(
      'newProductsAdded',
      this,
      hasDefault: true,
    );
    totalCustomers = _i1.ColumnInt(
      'totalCustomers',
      this,
      hasDefault: true,
    );
    newCustomers = _i1.ColumnInt(
      'newCustomers',
      this,
      hasDefault: true,
    );
    returningCustomers = _i1.ColumnInt(
      'returningCustomers',
      this,
      hasDefault: true,
    );
    productViews = _i1.ColumnInt(
      'productViews',
      this,
      hasDefault: true,
    );
    wishlistAdds = _i1.ColumnInt(
      'wishlistAdds',
      this,
      hasDefault: true,
    );
    cartAdds = _i1.ColumnInt(
      'cartAdds',
      this,
      hasDefault: true,
    );
    conversionRate = _i1.ColumnDouble(
      'conversionRate',
      this,
      hasDefault: true,
    );
    aiDescriptionsGenerated = _i1.ColumnInt(
      'aiDescriptionsGenerated',
      this,
      hasDefault: true,
    );
    aiQueriesProcessed = _i1.ColumnInt(
      'aiQueriesProcessed',
      this,
      hasDefault: true,
    );
    aiCostsIncurred = _i1.ColumnDouble(
      'aiCostsIncurred',
      this,
      hasDefault: true,
    );
    fiatPayments = _i1.ColumnDouble(
      'fiatPayments',
      this,
      hasDefault: true,
    );
    cryptoPayments = _i1.ColumnDouble(
      'cryptoPayments',
      this,
      hasDefault: true,
    );
    platformFeesCollected = _i1.ColumnDouble(
      'platformFeesCollected',
      this,
      hasDefault: true,
    );
    newReviews = _i1.ColumnInt(
      'newReviews',
      this,
      hasDefault: true,
    );
    averageRatingPeriod = _i1.ColumnDouble(
      'averageRatingPeriod',
      this,
      hasDefault: true,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
    updatedAt = _i1.ColumnDateTime(
      'updatedAt',
      this,
      hasDefault: true,
    );
  }

  late final _i1.ColumnUuid vendorId;

  _i2.VendorProfileTable? _vendor;

  late final _i1.ColumnDateTime date;

  late final _i1.ColumnString period;

  late final _i1.ColumnInt totalOrders;

  late final _i1.ColumnInt completedOrders;

  late final _i1.ColumnInt cancelledOrders;

  late final _i1.ColumnDouble totalRevenue;

  late final _i1.ColumnDouble averageOrderValue;

  late final _i1.ColumnInt totalProducts;

  late final _i1.ColumnInt activeProducts;

  late final _i1.ColumnInt outOfStockProducts;

  late final _i1.ColumnInt newProductsAdded;

  late final _i1.ColumnInt totalCustomers;

  late final _i1.ColumnInt newCustomers;

  late final _i1.ColumnInt returningCustomers;

  late final _i1.ColumnInt productViews;

  late final _i1.ColumnInt wishlistAdds;

  late final _i1.ColumnInt cartAdds;

  late final _i1.ColumnDouble conversionRate;

  late final _i1.ColumnInt aiDescriptionsGenerated;

  late final _i1.ColumnInt aiQueriesProcessed;

  late final _i1.ColumnDouble aiCostsIncurred;

  late final _i1.ColumnDouble fiatPayments;

  late final _i1.ColumnDouble cryptoPayments;

  late final _i1.ColumnDouble platformFeesCollected;

  late final _i1.ColumnInt newReviews;

  late final _i1.ColumnDouble averageRatingPeriod;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  _i2.VendorProfileTable get vendor {
    if (_vendor != null) return _vendor!;
    _vendor = _i1.createRelationTable(
      relationFieldName: 'vendor',
      field: VendorAnalytics.t.vendorId,
      foreignField: _i2.VendorProfile.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.VendorProfileTable(tableRelation: foreignTableRelation),
    );
    return _vendor!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        vendorId,
        date,
        period,
        totalOrders,
        completedOrders,
        cancelledOrders,
        totalRevenue,
        averageOrderValue,
        totalProducts,
        activeProducts,
        outOfStockProducts,
        newProductsAdded,
        totalCustomers,
        newCustomers,
        returningCustomers,
        productViews,
        wishlistAdds,
        cartAdds,
        conversionRate,
        aiDescriptionsGenerated,
        aiQueriesProcessed,
        aiCostsIncurred,
        fiatPayments,
        cryptoPayments,
        platformFeesCollected,
        newReviews,
        averageRatingPeriod,
        createdAt,
        updatedAt,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'vendor') {
      return vendor;
    }
    return null;
  }
}

class VendorAnalyticsInclude extends _i1.IncludeObject {
  VendorAnalyticsInclude._({_i2.VendorProfileInclude? vendor}) {
    _vendor = vendor;
  }

  _i2.VendorProfileInclude? _vendor;

  @override
  Map<String, _i1.Include?> get includes => {'vendor': _vendor};

  @override
  _i1.Table<_i1.UuidValue> get table => VendorAnalytics.t;
}

class VendorAnalyticsIncludeList extends _i1.IncludeList {
  VendorAnalyticsIncludeList._({
    _i1.WhereExpressionBuilder<VendorAnalyticsTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(VendorAnalytics.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue> get table => VendorAnalytics.t;
}

class VendorAnalyticsRepository {
  const VendorAnalyticsRepository._();

  final attachRow = const VendorAnalyticsAttachRowRepository._();

  /// Returns a list of [VendorAnalytics]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<VendorAnalytics>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<VendorAnalyticsTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<VendorAnalyticsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<VendorAnalyticsTable>? orderByList,
    _i1.Transaction? transaction,
    VendorAnalyticsInclude? include,
  }) async {
    return session.db.find<VendorAnalytics>(
      where: where?.call(VendorAnalytics.t),
      orderBy: orderBy?.call(VendorAnalytics.t),
      orderByList: orderByList?.call(VendorAnalytics.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [VendorAnalytics] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<VendorAnalytics?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<VendorAnalyticsTable>? where,
    int? offset,
    _i1.OrderByBuilder<VendorAnalyticsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<VendorAnalyticsTable>? orderByList,
    _i1.Transaction? transaction,
    VendorAnalyticsInclude? include,
  }) async {
    return session.db.findFirstRow<VendorAnalytics>(
      where: where?.call(VendorAnalytics.t),
      orderBy: orderBy?.call(VendorAnalytics.t),
      orderByList: orderByList?.call(VendorAnalytics.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [VendorAnalytics] by its [id] or null if no such row exists.
  Future<VendorAnalytics?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
    VendorAnalyticsInclude? include,
  }) async {
    return session.db.findById<VendorAnalytics>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [VendorAnalytics]s in the list and returns the inserted rows.
  ///
  /// The returned [VendorAnalytics]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<VendorAnalytics>> insert(
    _i1.Session session,
    List<VendorAnalytics> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<VendorAnalytics>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [VendorAnalytics] and returns the inserted row.
  ///
  /// The returned [VendorAnalytics] will have its `id` field set.
  Future<VendorAnalytics> insertRow(
    _i1.Session session,
    VendorAnalytics row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<VendorAnalytics>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [VendorAnalytics]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<VendorAnalytics>> update(
    _i1.Session session,
    List<VendorAnalytics> rows, {
    _i1.ColumnSelections<VendorAnalyticsTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<VendorAnalytics>(
      rows,
      columns: columns?.call(VendorAnalytics.t),
      transaction: transaction,
    );
  }

  /// Updates a single [VendorAnalytics]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<VendorAnalytics> updateRow(
    _i1.Session session,
    VendorAnalytics row, {
    _i1.ColumnSelections<VendorAnalyticsTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<VendorAnalytics>(
      row,
      columns: columns?.call(VendorAnalytics.t),
      transaction: transaction,
    );
  }

  /// Deletes all [VendorAnalytics]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<VendorAnalytics>> delete(
    _i1.Session session,
    List<VendorAnalytics> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<VendorAnalytics>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [VendorAnalytics].
  Future<VendorAnalytics> deleteRow(
    _i1.Session session,
    VendorAnalytics row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<VendorAnalytics>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<VendorAnalytics>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<VendorAnalyticsTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<VendorAnalytics>(
      where: where(VendorAnalytics.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<VendorAnalyticsTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<VendorAnalytics>(
      where: where?.call(VendorAnalytics.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class VendorAnalyticsAttachRowRepository {
  const VendorAnalyticsAttachRowRepository._();

  /// Creates a relation between the given [VendorAnalytics] and [VendorProfile]
  /// by setting the [VendorAnalytics]'s foreign key `vendorId` to refer to the [VendorProfile].
  Future<void> vendor(
    _i1.Session session,
    VendorAnalytics vendorAnalytics,
    _i2.VendorProfile vendor, {
    _i1.Transaction? transaction,
  }) async {
    if (vendorAnalytics.id == null) {
      throw ArgumentError.notNull('vendorAnalytics.id');
    }
    if (vendor.id == null) {
      throw ArgumentError.notNull('vendor.id');
    }

    var $vendorAnalytics = vendorAnalytics.copyWith(vendorId: vendor.id);
    await session.db.updateRow<VendorAnalytics>(
      $vendorAnalytics,
      columns: [VendorAnalytics.t.vendorId],
      transaction: transaction,
    );
  }
}
