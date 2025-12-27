/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../user/subscription_tier.dart' as _i2;

abstract class TierFeature
    implements _i1.TableRow<_i1.UuidValue>, _i1.ProtocolSerialization {
  TierFeature._({
    _i1.UuidValue? id,
    required this.tier,
    required this.dailyToolCallLimit,
    required this.monthlyToolCallLimit,
    required this.dailyAIMessageLimit,
    required this.monthlyAIMessageLimit,
    required this.productLimit,
    required this.aiDescriptionLimit,
    bool? allowBulkOperations,
    bool? allowAdvancedAnalytics,
    bool? allowAPIAccess,
    bool? allowWhiteLabel,
    String? supportPriority,
    int? supportResponseTime,
    required this.monthlyPrice,
    required this.yearlyPrice,
    required this.platformTransactionFee,
    double? overageToolCallPrice,
    double? overageAIMessagePrice,
    double? overageProductPrice,
    double? overageAIDescriptionPrice,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : id = id ?? _i1.Uuid().v4obj(),
       allowBulkOperations = allowBulkOperations ?? false,
       allowAdvancedAnalytics = allowAdvancedAnalytics ?? false,
       allowAPIAccess = allowAPIAccess ?? false,
       allowWhiteLabel = allowWhiteLabel ?? false,
       supportPriority = supportPriority ?? 'standard',
       supportResponseTime = supportResponseTime ?? 24,
       overageToolCallPrice = overageToolCallPrice ?? 0.01,
       overageAIMessagePrice = overageAIMessagePrice ?? 0.001,
       overageProductPrice = overageProductPrice ?? 1.0,
       overageAIDescriptionPrice = overageAIDescriptionPrice ?? 0.1,
       isActive = isActive ?? true,
       createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory TierFeature({
    _i1.UuidValue? id,
    required _i2.SubscriptionTier tier,
    required int dailyToolCallLimit,
    required int monthlyToolCallLimit,
    required int dailyAIMessageLimit,
    required int monthlyAIMessageLimit,
    required int productLimit,
    required int aiDescriptionLimit,
    bool? allowBulkOperations,
    bool? allowAdvancedAnalytics,
    bool? allowAPIAccess,
    bool? allowWhiteLabel,
    String? supportPriority,
    int? supportResponseTime,
    required double monthlyPrice,
    required double yearlyPrice,
    required double platformTransactionFee,
    double? overageToolCallPrice,
    double? overageAIMessagePrice,
    double? overageProductPrice,
    double? overageAIDescriptionPrice,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _TierFeatureImpl;

  factory TierFeature.fromJson(Map<String, dynamic> jsonSerialization) {
    return TierFeature(
      id: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      tier: _i2.SubscriptionTier.fromJson(
        (jsonSerialization['tier'] as String),
      ),
      dailyToolCallLimit: jsonSerialization['dailyToolCallLimit'] as int,
      monthlyToolCallLimit: jsonSerialization['monthlyToolCallLimit'] as int,
      dailyAIMessageLimit: jsonSerialization['dailyAIMessageLimit'] as int,
      monthlyAIMessageLimit: jsonSerialization['monthlyAIMessageLimit'] as int,
      productLimit: jsonSerialization['productLimit'] as int,
      aiDescriptionLimit: jsonSerialization['aiDescriptionLimit'] as int,
      allowBulkOperations: jsonSerialization['allowBulkOperations'] as bool,
      allowAdvancedAnalytics:
          jsonSerialization['allowAdvancedAnalytics'] as bool,
      allowAPIAccess: jsonSerialization['allowAPIAccess'] as bool,
      allowWhiteLabel: jsonSerialization['allowWhiteLabel'] as bool,
      supportPriority: jsonSerialization['supportPriority'] as String,
      supportResponseTime: jsonSerialization['supportResponseTime'] as int,
      monthlyPrice: (jsonSerialization['monthlyPrice'] as num).toDouble(),
      yearlyPrice: (jsonSerialization['yearlyPrice'] as num).toDouble(),
      platformTransactionFee:
          (jsonSerialization['platformTransactionFee'] as num).toDouble(),
      overageToolCallPrice: (jsonSerialization['overageToolCallPrice'] as num)
          .toDouble(),
      overageAIMessagePrice: (jsonSerialization['overageAIMessagePrice'] as num)
          .toDouble(),
      overageProductPrice: (jsonSerialization['overageProductPrice'] as num)
          .toDouble(),
      overageAIDescriptionPrice:
          (jsonSerialization['overageAIDescriptionPrice'] as num).toDouble(),
      isActive: jsonSerialization['isActive'] as bool,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
    );
  }

  static final t = TierFeatureTable();

  static const db = TierFeatureRepository._();

  @override
  _i1.UuidValue id;

  _i2.SubscriptionTier tier;

  int dailyToolCallLimit;

  int monthlyToolCallLimit;

  int dailyAIMessageLimit;

  int monthlyAIMessageLimit;

  int productLimit;

  int aiDescriptionLimit;

  bool allowBulkOperations;

  bool allowAdvancedAnalytics;

  bool allowAPIAccess;

  bool allowWhiteLabel;

  String supportPriority;

  int supportResponseTime;

  double monthlyPrice;

  double yearlyPrice;

  double platformTransactionFee;

  double overageToolCallPrice;

  double overageAIMessagePrice;

  double overageProductPrice;

  double overageAIDescriptionPrice;

  bool isActive;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _i1.Table<_i1.UuidValue> get table => t;

  /// Returns a shallow copy of this [TierFeature]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  TierFeature copyWith({
    _i1.UuidValue? id,
    _i2.SubscriptionTier? tier,
    int? dailyToolCallLimit,
    int? monthlyToolCallLimit,
    int? dailyAIMessageLimit,
    int? monthlyAIMessageLimit,
    int? productLimit,
    int? aiDescriptionLimit,
    bool? allowBulkOperations,
    bool? allowAdvancedAnalytics,
    bool? allowAPIAccess,
    bool? allowWhiteLabel,
    String? supportPriority,
    int? supportResponseTime,
    double? monthlyPrice,
    double? yearlyPrice,
    double? platformTransactionFee,
    double? overageToolCallPrice,
    double? overageAIMessagePrice,
    double? overageProductPrice,
    double? overageAIDescriptionPrice,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'TierFeature',
      'id': id.toJson(),
      'tier': tier.toJson(),
      'dailyToolCallLimit': dailyToolCallLimit,
      'monthlyToolCallLimit': monthlyToolCallLimit,
      'dailyAIMessageLimit': dailyAIMessageLimit,
      'monthlyAIMessageLimit': monthlyAIMessageLimit,
      'productLimit': productLimit,
      'aiDescriptionLimit': aiDescriptionLimit,
      'allowBulkOperations': allowBulkOperations,
      'allowAdvancedAnalytics': allowAdvancedAnalytics,
      'allowAPIAccess': allowAPIAccess,
      'allowWhiteLabel': allowWhiteLabel,
      'supportPriority': supportPriority,
      'supportResponseTime': supportResponseTime,
      'monthlyPrice': monthlyPrice,
      'yearlyPrice': yearlyPrice,
      'platformTransactionFee': platformTransactionFee,
      'overageToolCallPrice': overageToolCallPrice,
      'overageAIMessagePrice': overageAIMessagePrice,
      'overageProductPrice': overageProductPrice,
      'overageAIDescriptionPrice': overageAIDescriptionPrice,
      'isActive': isActive,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'TierFeature',
      'id': id.toJson(),
      'tier': tier.toJson(),
      'dailyToolCallLimit': dailyToolCallLimit,
      'monthlyToolCallLimit': monthlyToolCallLimit,
      'dailyAIMessageLimit': dailyAIMessageLimit,
      'monthlyAIMessageLimit': monthlyAIMessageLimit,
      'productLimit': productLimit,
      'aiDescriptionLimit': aiDescriptionLimit,
      'allowBulkOperations': allowBulkOperations,
      'allowAdvancedAnalytics': allowAdvancedAnalytics,
      'allowAPIAccess': allowAPIAccess,
      'allowWhiteLabel': allowWhiteLabel,
      'supportPriority': supportPriority,
      'supportResponseTime': supportResponseTime,
      'monthlyPrice': monthlyPrice,
      'yearlyPrice': yearlyPrice,
      'platformTransactionFee': platformTransactionFee,
      'overageToolCallPrice': overageToolCallPrice,
      'overageAIMessagePrice': overageAIMessagePrice,
      'overageProductPrice': overageProductPrice,
      'overageAIDescriptionPrice': overageAIDescriptionPrice,
      'isActive': isActive,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static TierFeatureInclude include() {
    return TierFeatureInclude._();
  }

  static TierFeatureIncludeList includeList({
    _i1.WhereExpressionBuilder<TierFeatureTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TierFeatureTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TierFeatureTable>? orderByList,
    TierFeatureInclude? include,
  }) {
    return TierFeatureIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(TierFeature.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(TierFeature.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _TierFeatureImpl extends TierFeature {
  _TierFeatureImpl({
    _i1.UuidValue? id,
    required _i2.SubscriptionTier tier,
    required int dailyToolCallLimit,
    required int monthlyToolCallLimit,
    required int dailyAIMessageLimit,
    required int monthlyAIMessageLimit,
    required int productLimit,
    required int aiDescriptionLimit,
    bool? allowBulkOperations,
    bool? allowAdvancedAnalytics,
    bool? allowAPIAccess,
    bool? allowWhiteLabel,
    String? supportPriority,
    int? supportResponseTime,
    required double monthlyPrice,
    required double yearlyPrice,
    required double platformTransactionFee,
    double? overageToolCallPrice,
    double? overageAIMessagePrice,
    double? overageProductPrice,
    double? overageAIDescriptionPrice,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         tier: tier,
         dailyToolCallLimit: dailyToolCallLimit,
         monthlyToolCallLimit: monthlyToolCallLimit,
         dailyAIMessageLimit: dailyAIMessageLimit,
         monthlyAIMessageLimit: monthlyAIMessageLimit,
         productLimit: productLimit,
         aiDescriptionLimit: aiDescriptionLimit,
         allowBulkOperations: allowBulkOperations,
         allowAdvancedAnalytics: allowAdvancedAnalytics,
         allowAPIAccess: allowAPIAccess,
         allowWhiteLabel: allowWhiteLabel,
         supportPriority: supportPriority,
         supportResponseTime: supportResponseTime,
         monthlyPrice: monthlyPrice,
         yearlyPrice: yearlyPrice,
         platformTransactionFee: platformTransactionFee,
         overageToolCallPrice: overageToolCallPrice,
         overageAIMessagePrice: overageAIMessagePrice,
         overageProductPrice: overageProductPrice,
         overageAIDescriptionPrice: overageAIDescriptionPrice,
         isActive: isActive,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [TierFeature]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  TierFeature copyWith({
    _i1.UuidValue? id,
    _i2.SubscriptionTier? tier,
    int? dailyToolCallLimit,
    int? monthlyToolCallLimit,
    int? dailyAIMessageLimit,
    int? monthlyAIMessageLimit,
    int? productLimit,
    int? aiDescriptionLimit,
    bool? allowBulkOperations,
    bool? allowAdvancedAnalytics,
    bool? allowAPIAccess,
    bool? allowWhiteLabel,
    String? supportPriority,
    int? supportResponseTime,
    double? monthlyPrice,
    double? yearlyPrice,
    double? platformTransactionFee,
    double? overageToolCallPrice,
    double? overageAIMessagePrice,
    double? overageProductPrice,
    double? overageAIDescriptionPrice,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return TierFeature(
      id: id ?? this.id,
      tier: tier ?? this.tier,
      dailyToolCallLimit: dailyToolCallLimit ?? this.dailyToolCallLimit,
      monthlyToolCallLimit: monthlyToolCallLimit ?? this.monthlyToolCallLimit,
      dailyAIMessageLimit: dailyAIMessageLimit ?? this.dailyAIMessageLimit,
      monthlyAIMessageLimit:
          monthlyAIMessageLimit ?? this.monthlyAIMessageLimit,
      productLimit: productLimit ?? this.productLimit,
      aiDescriptionLimit: aiDescriptionLimit ?? this.aiDescriptionLimit,
      allowBulkOperations: allowBulkOperations ?? this.allowBulkOperations,
      allowAdvancedAnalytics:
          allowAdvancedAnalytics ?? this.allowAdvancedAnalytics,
      allowAPIAccess: allowAPIAccess ?? this.allowAPIAccess,
      allowWhiteLabel: allowWhiteLabel ?? this.allowWhiteLabel,
      supportPriority: supportPriority ?? this.supportPriority,
      supportResponseTime: supportResponseTime ?? this.supportResponseTime,
      monthlyPrice: monthlyPrice ?? this.monthlyPrice,
      yearlyPrice: yearlyPrice ?? this.yearlyPrice,
      platformTransactionFee:
          platformTransactionFee ?? this.platformTransactionFee,
      overageToolCallPrice: overageToolCallPrice ?? this.overageToolCallPrice,
      overageAIMessagePrice:
          overageAIMessagePrice ?? this.overageAIMessagePrice,
      overageProductPrice: overageProductPrice ?? this.overageProductPrice,
      overageAIDescriptionPrice:
          overageAIDescriptionPrice ?? this.overageAIDescriptionPrice,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class TierFeatureUpdateTable extends _i1.UpdateTable<TierFeatureTable> {
  TierFeatureUpdateTable(super.table);

  _i1.ColumnValue<_i2.SubscriptionTier, _i2.SubscriptionTier> tier(
    _i2.SubscriptionTier value,
  ) => _i1.ColumnValue(
    table.tier,
    value,
  );

  _i1.ColumnValue<int, int> dailyToolCallLimit(int value) => _i1.ColumnValue(
    table.dailyToolCallLimit,
    value,
  );

  _i1.ColumnValue<int, int> monthlyToolCallLimit(int value) => _i1.ColumnValue(
    table.monthlyToolCallLimit,
    value,
  );

  _i1.ColumnValue<int, int> dailyAIMessageLimit(int value) => _i1.ColumnValue(
    table.dailyAIMessageLimit,
    value,
  );

  _i1.ColumnValue<int, int> monthlyAIMessageLimit(int value) => _i1.ColumnValue(
    table.monthlyAIMessageLimit,
    value,
  );

  _i1.ColumnValue<int, int> productLimit(int value) => _i1.ColumnValue(
    table.productLimit,
    value,
  );

  _i1.ColumnValue<int, int> aiDescriptionLimit(int value) => _i1.ColumnValue(
    table.aiDescriptionLimit,
    value,
  );

  _i1.ColumnValue<bool, bool> allowBulkOperations(bool value) =>
      _i1.ColumnValue(
        table.allowBulkOperations,
        value,
      );

  _i1.ColumnValue<bool, bool> allowAdvancedAnalytics(bool value) =>
      _i1.ColumnValue(
        table.allowAdvancedAnalytics,
        value,
      );

  _i1.ColumnValue<bool, bool> allowAPIAccess(bool value) => _i1.ColumnValue(
    table.allowAPIAccess,
    value,
  );

  _i1.ColumnValue<bool, bool> allowWhiteLabel(bool value) => _i1.ColumnValue(
    table.allowWhiteLabel,
    value,
  );

  _i1.ColumnValue<String, String> supportPriority(String value) =>
      _i1.ColumnValue(
        table.supportPriority,
        value,
      );

  _i1.ColumnValue<int, int> supportResponseTime(int value) => _i1.ColumnValue(
    table.supportResponseTime,
    value,
  );

  _i1.ColumnValue<double, double> monthlyPrice(double value) => _i1.ColumnValue(
    table.monthlyPrice,
    value,
  );

  _i1.ColumnValue<double, double> yearlyPrice(double value) => _i1.ColumnValue(
    table.yearlyPrice,
    value,
  );

  _i1.ColumnValue<double, double> platformTransactionFee(double value) =>
      _i1.ColumnValue(
        table.platformTransactionFee,
        value,
      );

  _i1.ColumnValue<double, double> overageToolCallPrice(double value) =>
      _i1.ColumnValue(
        table.overageToolCallPrice,
        value,
      );

  _i1.ColumnValue<double, double> overageAIMessagePrice(double value) =>
      _i1.ColumnValue(
        table.overageAIMessagePrice,
        value,
      );

  _i1.ColumnValue<double, double> overageProductPrice(double value) =>
      _i1.ColumnValue(
        table.overageProductPrice,
        value,
      );

  _i1.ColumnValue<double, double> overageAIDescriptionPrice(double value) =>
      _i1.ColumnValue(
        table.overageAIDescriptionPrice,
        value,
      );

  _i1.ColumnValue<bool, bool> isActive(bool value) => _i1.ColumnValue(
    table.isActive,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> updatedAt(DateTime value) =>
      _i1.ColumnValue(
        table.updatedAt,
        value,
      );
}

class TierFeatureTable extends _i1.Table<_i1.UuidValue> {
  TierFeatureTable({super.tableRelation}) : super(tableName: 'tier_features') {
    updateTable = TierFeatureUpdateTable(this);
    tier = _i1.ColumnEnum(
      'tier',
      this,
      _i1.EnumSerialization.byName,
    );
    dailyToolCallLimit = _i1.ColumnInt(
      'dailyToolCallLimit',
      this,
    );
    monthlyToolCallLimit = _i1.ColumnInt(
      'monthlyToolCallLimit',
      this,
    );
    dailyAIMessageLimit = _i1.ColumnInt(
      'dailyAIMessageLimit',
      this,
    );
    monthlyAIMessageLimit = _i1.ColumnInt(
      'monthlyAIMessageLimit',
      this,
    );
    productLimit = _i1.ColumnInt(
      'productLimit',
      this,
    );
    aiDescriptionLimit = _i1.ColumnInt(
      'aiDescriptionLimit',
      this,
    );
    allowBulkOperations = _i1.ColumnBool(
      'allowBulkOperations',
      this,
      hasDefault: true,
    );
    allowAdvancedAnalytics = _i1.ColumnBool(
      'allowAdvancedAnalytics',
      this,
      hasDefault: true,
    );
    allowAPIAccess = _i1.ColumnBool(
      'allowAPIAccess',
      this,
      hasDefault: true,
    );
    allowWhiteLabel = _i1.ColumnBool(
      'allowWhiteLabel',
      this,
      hasDefault: true,
    );
    supportPriority = _i1.ColumnString(
      'supportPriority',
      this,
      hasDefault: true,
    );
    supportResponseTime = _i1.ColumnInt(
      'supportResponseTime',
      this,
      hasDefault: true,
    );
    monthlyPrice = _i1.ColumnDouble(
      'monthlyPrice',
      this,
    );
    yearlyPrice = _i1.ColumnDouble(
      'yearlyPrice',
      this,
    );
    platformTransactionFee = _i1.ColumnDouble(
      'platformTransactionFee',
      this,
    );
    overageToolCallPrice = _i1.ColumnDouble(
      'overageToolCallPrice',
      this,
      hasDefault: true,
    );
    overageAIMessagePrice = _i1.ColumnDouble(
      'overageAIMessagePrice',
      this,
      hasDefault: true,
    );
    overageProductPrice = _i1.ColumnDouble(
      'overageProductPrice',
      this,
      hasDefault: true,
    );
    overageAIDescriptionPrice = _i1.ColumnDouble(
      'overageAIDescriptionPrice',
      this,
      hasDefault: true,
    );
    isActive = _i1.ColumnBool(
      'isActive',
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

  late final TierFeatureUpdateTable updateTable;

  late final _i1.ColumnEnum<_i2.SubscriptionTier> tier;

  late final _i1.ColumnInt dailyToolCallLimit;

  late final _i1.ColumnInt monthlyToolCallLimit;

  late final _i1.ColumnInt dailyAIMessageLimit;

  late final _i1.ColumnInt monthlyAIMessageLimit;

  late final _i1.ColumnInt productLimit;

  late final _i1.ColumnInt aiDescriptionLimit;

  late final _i1.ColumnBool allowBulkOperations;

  late final _i1.ColumnBool allowAdvancedAnalytics;

  late final _i1.ColumnBool allowAPIAccess;

  late final _i1.ColumnBool allowWhiteLabel;

  late final _i1.ColumnString supportPriority;

  late final _i1.ColumnInt supportResponseTime;

  late final _i1.ColumnDouble monthlyPrice;

  late final _i1.ColumnDouble yearlyPrice;

  late final _i1.ColumnDouble platformTransactionFee;

  late final _i1.ColumnDouble overageToolCallPrice;

  late final _i1.ColumnDouble overageAIMessagePrice;

  late final _i1.ColumnDouble overageProductPrice;

  late final _i1.ColumnDouble overageAIDescriptionPrice;

  late final _i1.ColumnBool isActive;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  @override
  List<_i1.Column> get columns => [
    id,
    tier,
    dailyToolCallLimit,
    monthlyToolCallLimit,
    dailyAIMessageLimit,
    monthlyAIMessageLimit,
    productLimit,
    aiDescriptionLimit,
    allowBulkOperations,
    allowAdvancedAnalytics,
    allowAPIAccess,
    allowWhiteLabel,
    supportPriority,
    supportResponseTime,
    monthlyPrice,
    yearlyPrice,
    platformTransactionFee,
    overageToolCallPrice,
    overageAIMessagePrice,
    overageProductPrice,
    overageAIDescriptionPrice,
    isActive,
    createdAt,
    updatedAt,
  ];
}

class TierFeatureInclude extends _i1.IncludeObject {
  TierFeatureInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<_i1.UuidValue> get table => TierFeature.t;
}

class TierFeatureIncludeList extends _i1.IncludeList {
  TierFeatureIncludeList._({
    _i1.WhereExpressionBuilder<TierFeatureTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(TierFeature.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue> get table => TierFeature.t;
}

class TierFeatureRepository {
  const TierFeatureRepository._();

  /// Returns a list of [TierFeature]s matching the given query parameters.
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
  Future<List<TierFeature>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TierFeatureTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TierFeatureTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TierFeatureTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<TierFeature>(
      where: where?.call(TierFeature.t),
      orderBy: orderBy?.call(TierFeature.t),
      orderByList: orderByList?.call(TierFeature.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [TierFeature] matching the given query parameters.
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
  Future<TierFeature?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TierFeatureTable>? where,
    int? offset,
    _i1.OrderByBuilder<TierFeatureTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TierFeatureTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<TierFeature>(
      where: where?.call(TierFeature.t),
      orderBy: orderBy?.call(TierFeature.t),
      orderByList: orderByList?.call(TierFeature.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [TierFeature] by its [id] or null if no such row exists.
  Future<TierFeature?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<TierFeature>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [TierFeature]s in the list and returns the inserted rows.
  ///
  /// The returned [TierFeature]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<TierFeature>> insert(
    _i1.Session session,
    List<TierFeature> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<TierFeature>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [TierFeature] and returns the inserted row.
  ///
  /// The returned [TierFeature] will have its `id` field set.
  Future<TierFeature> insertRow(
    _i1.Session session,
    TierFeature row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<TierFeature>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [TierFeature]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<TierFeature>> update(
    _i1.Session session,
    List<TierFeature> rows, {
    _i1.ColumnSelections<TierFeatureTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<TierFeature>(
      rows,
      columns: columns?.call(TierFeature.t),
      transaction: transaction,
    );
  }

  /// Updates a single [TierFeature]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<TierFeature> updateRow(
    _i1.Session session,
    TierFeature row, {
    _i1.ColumnSelections<TierFeatureTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<TierFeature>(
      row,
      columns: columns?.call(TierFeature.t),
      transaction: transaction,
    );
  }

  /// Updates a single [TierFeature] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<TierFeature?> updateById(
    _i1.Session session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<TierFeatureUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<TierFeature>(
      id,
      columnValues: columnValues(TierFeature.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [TierFeature]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<TierFeature>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<TierFeatureUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<TierFeatureTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TierFeatureTable>? orderBy,
    _i1.OrderByListBuilder<TierFeatureTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<TierFeature>(
      columnValues: columnValues(TierFeature.t.updateTable),
      where: where(TierFeature.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(TierFeature.t),
      orderByList: orderByList?.call(TierFeature.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [TierFeature]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<TierFeature>> delete(
    _i1.Session session,
    List<TierFeature> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<TierFeature>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [TierFeature].
  Future<TierFeature> deleteRow(
    _i1.Session session,
    TierFeature row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<TierFeature>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<TierFeature>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<TierFeatureTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<TierFeature>(
      where: where(TierFeature.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TierFeatureTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<TierFeature>(
      where: where?.call(TierFeature.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
