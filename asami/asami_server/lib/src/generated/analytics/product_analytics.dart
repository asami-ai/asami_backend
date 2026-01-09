/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member
// ignore_for_file: unnecessary_null_comparison

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../product/product.dart' as _i2;
import 'package:asami_server/src/generated/protocol.dart' as _i3;

abstract class ProductAnalytics
    implements _i1.TableRow<_i1.UuidValue>, _i1.ProtocolSerialization {
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
  }) : id = id ?? _i1.Uuid().v4obj(),
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
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      productId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['productId'],
      ),
      product: jsonSerialization['product'] == null
          ? null
          : _i3.Protocol().deserialize<_i2.Product>(
              jsonSerialization['product'],
            ),
      vendorId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['vendorId'],
      ),
      date: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['date']),
      period: jsonSerialization['period'] as String,
      views: jsonSerialization['views'] as int?,
      uniqueViews: jsonSerialization['uniqueViews'] as int?,
      wishlistAdds: jsonSerialization['wishlistAdds'] as int?,
      cartAdds: jsonSerialization['cartAdds'] as int?,
      orderCount: jsonSerialization['orderCount'] as int?,
      quantitySold: jsonSerialization['quantitySold'] as int?,
      revenue: (jsonSerialization['revenue'] as num?)?.toDouble(),
      conversionRate: (jsonSerialization['conversionRate'] as num?)?.toDouble(),
      bounceRate: (jsonSerialization['bounceRate'] as num?)?.toDouble(),
      averageTimeOnPage: (jsonSerialization['averageTimeOnPage'] as num?)
          ?.toDouble(),
      newReviews: jsonSerialization['newReviews'] as int?,
      averageRating: (jsonSerialization['averageRating'] as num?)?.toDouble(),
      searchImpressions: jsonSerialization['searchImpressions'] as int?,
      searchClicks: jsonSerialization['searchClicks'] as int?,
      searchRanking: (jsonSerialization['searchRanking'] as num?)?.toDouble(),
      stockLevelStart: jsonSerialization['stockLevelStart'] as int?,
      stockLevelEnd: jsonSerialization['stockLevelEnd'] as int?,
      stockOuts: jsonSerialization['stockOuts'] as int?,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  static final t = ProductAnalyticsTable();

  static const db = ProductAnalyticsRepository._();

  @override
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

  @override
  _i1.Table<_i1.UuidValue> get table => t;

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
      '__className__': 'ProductAnalytics',
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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ProductAnalytics',
      'id': id.toJson(),
      'productId': productId.toJson(),
      if (product != null) 'product': product?.toJsonForProtocol(),
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

  static ProductAnalyticsInclude include({_i2.ProductInclude? product}) {
    return ProductAnalyticsInclude._(product: product);
  }

  static ProductAnalyticsIncludeList includeList({
    _i1.WhereExpressionBuilder<ProductAnalyticsTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProductAnalyticsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProductAnalyticsTable>? orderByList,
    ProductAnalyticsInclude? include,
  }) {
    return ProductAnalyticsIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ProductAnalytics.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ProductAnalytics.t),
      include: include,
    );
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

class ProductAnalyticsUpdateTable
    extends _i1.UpdateTable<ProductAnalyticsTable> {
  ProductAnalyticsUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> productId(
    _i1.UuidValue value,
  ) => _i1.ColumnValue(
    table.productId,
    value,
  );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> vendorId(_i1.UuidValue value) =>
      _i1.ColumnValue(
        table.vendorId,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> date(DateTime value) => _i1.ColumnValue(
    table.date,
    value,
  );

  _i1.ColumnValue<String, String> period(String value) => _i1.ColumnValue(
    table.period,
    value,
  );

  _i1.ColumnValue<int, int> views(int value) => _i1.ColumnValue(
    table.views,
    value,
  );

  _i1.ColumnValue<int, int> uniqueViews(int value) => _i1.ColumnValue(
    table.uniqueViews,
    value,
  );

  _i1.ColumnValue<int, int> wishlistAdds(int value) => _i1.ColumnValue(
    table.wishlistAdds,
    value,
  );

  _i1.ColumnValue<int, int> cartAdds(int value) => _i1.ColumnValue(
    table.cartAdds,
    value,
  );

  _i1.ColumnValue<int, int> orderCount(int value) => _i1.ColumnValue(
    table.orderCount,
    value,
  );

  _i1.ColumnValue<int, int> quantitySold(int value) => _i1.ColumnValue(
    table.quantitySold,
    value,
  );

  _i1.ColumnValue<double, double> revenue(double value) => _i1.ColumnValue(
    table.revenue,
    value,
  );

  _i1.ColumnValue<double, double> conversionRate(double value) =>
      _i1.ColumnValue(
        table.conversionRate,
        value,
      );

  _i1.ColumnValue<double, double> bounceRate(double value) => _i1.ColumnValue(
    table.bounceRate,
    value,
  );

  _i1.ColumnValue<double, double> averageTimeOnPage(double value) =>
      _i1.ColumnValue(
        table.averageTimeOnPage,
        value,
      );

  _i1.ColumnValue<int, int> newReviews(int value) => _i1.ColumnValue(
    table.newReviews,
    value,
  );

  _i1.ColumnValue<double, double> averageRating(double value) =>
      _i1.ColumnValue(
        table.averageRating,
        value,
      );

  _i1.ColumnValue<int, int> searchImpressions(int value) => _i1.ColumnValue(
    table.searchImpressions,
    value,
  );

  _i1.ColumnValue<int, int> searchClicks(int value) => _i1.ColumnValue(
    table.searchClicks,
    value,
  );

  _i1.ColumnValue<double, double> searchRanking(double value) =>
      _i1.ColumnValue(
        table.searchRanking,
        value,
      );

  _i1.ColumnValue<int, int> stockLevelStart(int value) => _i1.ColumnValue(
    table.stockLevelStart,
    value,
  );

  _i1.ColumnValue<int, int> stockLevelEnd(int value) => _i1.ColumnValue(
    table.stockLevelEnd,
    value,
  );

  _i1.ColumnValue<int, int> stockOuts(int value) => _i1.ColumnValue(
    table.stockOuts,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );
}

class ProductAnalyticsTable extends _i1.Table<_i1.UuidValue> {
  ProductAnalyticsTable({super.tableRelation})
    : super(tableName: 'product_analytics') {
    updateTable = ProductAnalyticsUpdateTable(this);
    productId = _i1.ColumnUuid(
      'productId',
      this,
    );
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
    views = _i1.ColumnInt(
      'views',
      this,
      hasDefault: true,
    );
    uniqueViews = _i1.ColumnInt(
      'uniqueViews',
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
    orderCount = _i1.ColumnInt(
      'orderCount',
      this,
      hasDefault: true,
    );
    quantitySold = _i1.ColumnInt(
      'quantitySold',
      this,
      hasDefault: true,
    );
    revenue = _i1.ColumnDouble(
      'revenue',
      this,
      hasDefault: true,
    );
    conversionRate = _i1.ColumnDouble(
      'conversionRate',
      this,
      hasDefault: true,
    );
    bounceRate = _i1.ColumnDouble(
      'bounceRate',
      this,
      hasDefault: true,
    );
    averageTimeOnPage = _i1.ColumnDouble(
      'averageTimeOnPage',
      this,
      hasDefault: true,
    );
    newReviews = _i1.ColumnInt(
      'newReviews',
      this,
      hasDefault: true,
    );
    averageRating = _i1.ColumnDouble(
      'averageRating',
      this,
      hasDefault: true,
    );
    searchImpressions = _i1.ColumnInt(
      'searchImpressions',
      this,
      hasDefault: true,
    );
    searchClicks = _i1.ColumnInt(
      'searchClicks',
      this,
      hasDefault: true,
    );
    searchRanking = _i1.ColumnDouble(
      'searchRanking',
      this,
      hasDefault: true,
    );
    stockLevelStart = _i1.ColumnInt(
      'stockLevelStart',
      this,
      hasDefault: true,
    );
    stockLevelEnd = _i1.ColumnInt(
      'stockLevelEnd',
      this,
      hasDefault: true,
    );
    stockOuts = _i1.ColumnInt(
      'stockOuts',
      this,
      hasDefault: true,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
  }

  late final ProductAnalyticsUpdateTable updateTable;

  late final _i1.ColumnUuid productId;

  _i2.ProductTable? _product;

  late final _i1.ColumnUuid vendorId;

  late final _i1.ColumnDateTime date;

  late final _i1.ColumnString period;

  late final _i1.ColumnInt views;

  late final _i1.ColumnInt uniqueViews;

  late final _i1.ColumnInt wishlistAdds;

  late final _i1.ColumnInt cartAdds;

  late final _i1.ColumnInt orderCount;

  late final _i1.ColumnInt quantitySold;

  late final _i1.ColumnDouble revenue;

  late final _i1.ColumnDouble conversionRate;

  late final _i1.ColumnDouble bounceRate;

  late final _i1.ColumnDouble averageTimeOnPage;

  late final _i1.ColumnInt newReviews;

  late final _i1.ColumnDouble averageRating;

  late final _i1.ColumnInt searchImpressions;

  late final _i1.ColumnInt searchClicks;

  late final _i1.ColumnDouble searchRanking;

  late final _i1.ColumnInt stockLevelStart;

  late final _i1.ColumnInt stockLevelEnd;

  late final _i1.ColumnInt stockOuts;

  late final _i1.ColumnDateTime createdAt;

  _i2.ProductTable get product {
    if (_product != null) return _product!;
    _product = _i1.createRelationTable(
      relationFieldName: 'product',
      field: ProductAnalytics.t.productId,
      foreignField: _i2.Product.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.ProductTable(tableRelation: foreignTableRelation),
    );
    return _product!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    productId,
    vendorId,
    date,
    period,
    views,
    uniqueViews,
    wishlistAdds,
    cartAdds,
    orderCount,
    quantitySold,
    revenue,
    conversionRate,
    bounceRate,
    averageTimeOnPage,
    newReviews,
    averageRating,
    searchImpressions,
    searchClicks,
    searchRanking,
    stockLevelStart,
    stockLevelEnd,
    stockOuts,
    createdAt,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'product') {
      return product;
    }
    return null;
  }
}

class ProductAnalyticsInclude extends _i1.IncludeObject {
  ProductAnalyticsInclude._({_i2.ProductInclude? product}) {
    _product = product;
  }

  _i2.ProductInclude? _product;

  @override
  Map<String, _i1.Include?> get includes => {'product': _product};

  @override
  _i1.Table<_i1.UuidValue> get table => ProductAnalytics.t;
}

class ProductAnalyticsIncludeList extends _i1.IncludeList {
  ProductAnalyticsIncludeList._({
    _i1.WhereExpressionBuilder<ProductAnalyticsTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ProductAnalytics.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue> get table => ProductAnalytics.t;
}

class ProductAnalyticsRepository {
  const ProductAnalyticsRepository._();

  final attachRow = const ProductAnalyticsAttachRowRepository._();

  /// Returns a list of [ProductAnalytics]s matching the given query parameters.
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
  Future<List<ProductAnalytics>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProductAnalyticsTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProductAnalyticsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProductAnalyticsTable>? orderByList,
    _i1.Transaction? transaction,
    ProductAnalyticsInclude? include,
  }) async {
    return session.db.find<ProductAnalytics>(
      where: where?.call(ProductAnalytics.t),
      orderBy: orderBy?.call(ProductAnalytics.t),
      orderByList: orderByList?.call(ProductAnalytics.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [ProductAnalytics] matching the given query parameters.
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
  Future<ProductAnalytics?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProductAnalyticsTable>? where,
    int? offset,
    _i1.OrderByBuilder<ProductAnalyticsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProductAnalyticsTable>? orderByList,
    _i1.Transaction? transaction,
    ProductAnalyticsInclude? include,
  }) async {
    return session.db.findFirstRow<ProductAnalytics>(
      where: where?.call(ProductAnalytics.t),
      orderBy: orderBy?.call(ProductAnalytics.t),
      orderByList: orderByList?.call(ProductAnalytics.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [ProductAnalytics] by its [id] or null if no such row exists.
  Future<ProductAnalytics?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
    ProductAnalyticsInclude? include,
  }) async {
    return session.db.findById<ProductAnalytics>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [ProductAnalytics]s in the list and returns the inserted rows.
  ///
  /// The returned [ProductAnalytics]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<ProductAnalytics>> insert(
    _i1.Session session,
    List<ProductAnalytics> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<ProductAnalytics>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [ProductAnalytics] and returns the inserted row.
  ///
  /// The returned [ProductAnalytics] will have its `id` field set.
  Future<ProductAnalytics> insertRow(
    _i1.Session session,
    ProductAnalytics row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ProductAnalytics>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [ProductAnalytics]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<ProductAnalytics>> update(
    _i1.Session session,
    List<ProductAnalytics> rows, {
    _i1.ColumnSelections<ProductAnalyticsTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<ProductAnalytics>(
      rows,
      columns: columns?.call(ProductAnalytics.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ProductAnalytics]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ProductAnalytics> updateRow(
    _i1.Session session,
    ProductAnalytics row, {
    _i1.ColumnSelections<ProductAnalyticsTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ProductAnalytics>(
      row,
      columns: columns?.call(ProductAnalytics.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ProductAnalytics] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<ProductAnalytics?> updateById(
    _i1.Session session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<ProductAnalyticsUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<ProductAnalytics>(
      id,
      columnValues: columnValues(ProductAnalytics.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [ProductAnalytics]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<ProductAnalytics>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<ProductAnalyticsUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<ProductAnalyticsTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProductAnalyticsTable>? orderBy,
    _i1.OrderByListBuilder<ProductAnalyticsTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<ProductAnalytics>(
      columnValues: columnValues(ProductAnalytics.t.updateTable),
      where: where(ProductAnalytics.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ProductAnalytics.t),
      orderByList: orderByList?.call(ProductAnalytics.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [ProductAnalytics]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<ProductAnalytics>> delete(
    _i1.Session session,
    List<ProductAnalytics> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ProductAnalytics>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [ProductAnalytics].
  Future<ProductAnalytics> deleteRow(
    _i1.Session session,
    ProductAnalytics row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ProductAnalytics>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<ProductAnalytics>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ProductAnalyticsTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ProductAnalytics>(
      where: where(ProductAnalytics.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProductAnalyticsTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ProductAnalytics>(
      where: where?.call(ProductAnalytics.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class ProductAnalyticsAttachRowRepository {
  const ProductAnalyticsAttachRowRepository._();

  /// Creates a relation between the given [ProductAnalytics] and [Product]
  /// by setting the [ProductAnalytics]'s foreign key `productId` to refer to the [Product].
  Future<void> product(
    _i1.Session session,
    ProductAnalytics productAnalytics,
    _i2.Product product, {
    _i1.Transaction? transaction,
  }) async {
    if (productAnalytics.id == null) {
      throw ArgumentError.notNull('productAnalytics.id');
    }
    if (product.id == null) {
      throw ArgumentError.notNull('product.id');
    }

    var $productAnalytics = productAnalytics.copyWith(productId: product.id);
    await session.db.updateRow<ProductAnalytics>(
      $productAnalytics,
      columns: [ProductAnalytics.t.productId],
      transaction: transaction,
    );
  }
}
