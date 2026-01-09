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
import '../subscription/limit_type.dart' as _i3;

abstract class ToolUsageLimit
    implements _i1.TableRow<_i1.UuidValue>, _i1.ProtocolSerialization {
  ToolUsageLimit._({
    _i1.UuidValue? id,
    required this.tier,
    required this.limitType,
    required this.dailyLimit,
    this.monthlyLimit,
    bool? allowGracePeriod,
    int? gracePeriodActions,
    this.restrictedTools,
    this.allowedToolsAfterLimit,
    double? costPerUsage,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : id = id ?? _i1.Uuid().v4obj(),
       allowGracePeriod = allowGracePeriod ?? true,
       gracePeriodActions = gracePeriodActions ?? 5,
       costPerUsage = costPerUsage ?? 0.0,
       isActive = isActive ?? true,
       createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory ToolUsageLimit({
    _i1.UuidValue? id,
    required _i2.SubscriptionTier tier,
    required _i3.LimitType limitType,
    required int dailyLimit,
    int? monthlyLimit,
    bool? allowGracePeriod,
    int? gracePeriodActions,
    String? restrictedTools,
    String? allowedToolsAfterLimit,
    double? costPerUsage,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _ToolUsageLimitImpl;

  factory ToolUsageLimit.fromJson(Map<String, dynamic> jsonSerialization) {
    return ToolUsageLimit(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      tier: _i2.SubscriptionTier.fromJson(
        (jsonSerialization['tier'] as String),
      ),
      limitType: _i3.LimitType.fromJson(
        (jsonSerialization['limitType'] as String),
      ),
      dailyLimit: jsonSerialization['dailyLimit'] as int,
      monthlyLimit: jsonSerialization['monthlyLimit'] as int?,
      allowGracePeriod: jsonSerialization['allowGracePeriod'] as bool?,
      gracePeriodActions: jsonSerialization['gracePeriodActions'] as int?,
      restrictedTools: jsonSerialization['restrictedTools'] as String?,
      allowedToolsAfterLimit:
          jsonSerialization['allowedToolsAfterLimit'] as String?,
      costPerUsage: (jsonSerialization['costPerUsage'] as num?)?.toDouble(),
      isActive: jsonSerialization['isActive'] as bool?,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  static final t = ToolUsageLimitTable();

  static const db = ToolUsageLimitRepository._();

  @override
  _i1.UuidValue id;

  _i2.SubscriptionTier tier;

  _i3.LimitType limitType;

  int dailyLimit;

  int? monthlyLimit;

  bool allowGracePeriod;

  int gracePeriodActions;

  String? restrictedTools;

  String? allowedToolsAfterLimit;

  double costPerUsage;

  bool isActive;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _i1.Table<_i1.UuidValue> get table => t;

  /// Returns a shallow copy of this [ToolUsageLimit]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ToolUsageLimit copyWith({
    _i1.UuidValue? id,
    _i2.SubscriptionTier? tier,
    _i3.LimitType? limitType,
    int? dailyLimit,
    int? monthlyLimit,
    bool? allowGracePeriod,
    int? gracePeriodActions,
    String? restrictedTools,
    String? allowedToolsAfterLimit,
    double? costPerUsage,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ToolUsageLimit',
      'id': id.toJson(),
      'tier': tier.toJson(),
      'limitType': limitType.toJson(),
      'dailyLimit': dailyLimit,
      if (monthlyLimit != null) 'monthlyLimit': monthlyLimit,
      'allowGracePeriod': allowGracePeriod,
      'gracePeriodActions': gracePeriodActions,
      if (restrictedTools != null) 'restrictedTools': restrictedTools,
      if (allowedToolsAfterLimit != null)
        'allowedToolsAfterLimit': allowedToolsAfterLimit,
      'costPerUsage': costPerUsage,
      'isActive': isActive,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ToolUsageLimit',
      'id': id.toJson(),
      'tier': tier.toJson(),
      'limitType': limitType.toJson(),
      'dailyLimit': dailyLimit,
      if (monthlyLimit != null) 'monthlyLimit': monthlyLimit,
      'allowGracePeriod': allowGracePeriod,
      'gracePeriodActions': gracePeriodActions,
      if (restrictedTools != null) 'restrictedTools': restrictedTools,
      if (allowedToolsAfterLimit != null)
        'allowedToolsAfterLimit': allowedToolsAfterLimit,
      'costPerUsage': costPerUsage,
      'isActive': isActive,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static ToolUsageLimitInclude include() {
    return ToolUsageLimitInclude._();
  }

  static ToolUsageLimitIncludeList includeList({
    _i1.WhereExpressionBuilder<ToolUsageLimitTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ToolUsageLimitTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ToolUsageLimitTable>? orderByList,
    ToolUsageLimitInclude? include,
  }) {
    return ToolUsageLimitIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ToolUsageLimit.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ToolUsageLimit.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ToolUsageLimitImpl extends ToolUsageLimit {
  _ToolUsageLimitImpl({
    _i1.UuidValue? id,
    required _i2.SubscriptionTier tier,
    required _i3.LimitType limitType,
    required int dailyLimit,
    int? monthlyLimit,
    bool? allowGracePeriod,
    int? gracePeriodActions,
    String? restrictedTools,
    String? allowedToolsAfterLimit,
    double? costPerUsage,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         tier: tier,
         limitType: limitType,
         dailyLimit: dailyLimit,
         monthlyLimit: monthlyLimit,
         allowGracePeriod: allowGracePeriod,
         gracePeriodActions: gracePeriodActions,
         restrictedTools: restrictedTools,
         allowedToolsAfterLimit: allowedToolsAfterLimit,
         costPerUsage: costPerUsage,
         isActive: isActive,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [ToolUsageLimit]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ToolUsageLimit copyWith({
    _i1.UuidValue? id,
    _i2.SubscriptionTier? tier,
    _i3.LimitType? limitType,
    int? dailyLimit,
    Object? monthlyLimit = _Undefined,
    bool? allowGracePeriod,
    int? gracePeriodActions,
    Object? restrictedTools = _Undefined,
    Object? allowedToolsAfterLimit = _Undefined,
    double? costPerUsage,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ToolUsageLimit(
      id: id ?? this.id,
      tier: tier ?? this.tier,
      limitType: limitType ?? this.limitType,
      dailyLimit: dailyLimit ?? this.dailyLimit,
      monthlyLimit: monthlyLimit is int? ? monthlyLimit : this.monthlyLimit,
      allowGracePeriod: allowGracePeriod ?? this.allowGracePeriod,
      gracePeriodActions: gracePeriodActions ?? this.gracePeriodActions,
      restrictedTools: restrictedTools is String?
          ? restrictedTools
          : this.restrictedTools,
      allowedToolsAfterLimit: allowedToolsAfterLimit is String?
          ? allowedToolsAfterLimit
          : this.allowedToolsAfterLimit,
      costPerUsage: costPerUsage ?? this.costPerUsage,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class ToolUsageLimitUpdateTable extends _i1.UpdateTable<ToolUsageLimitTable> {
  ToolUsageLimitUpdateTable(super.table);

  _i1.ColumnValue<_i2.SubscriptionTier, _i2.SubscriptionTier> tier(
    _i2.SubscriptionTier value,
  ) => _i1.ColumnValue(
    table.tier,
    value,
  );

  _i1.ColumnValue<_i3.LimitType, _i3.LimitType> limitType(
    _i3.LimitType value,
  ) => _i1.ColumnValue(
    table.limitType,
    value,
  );

  _i1.ColumnValue<int, int> dailyLimit(int value) => _i1.ColumnValue(
    table.dailyLimit,
    value,
  );

  _i1.ColumnValue<int, int> monthlyLimit(int? value) => _i1.ColumnValue(
    table.monthlyLimit,
    value,
  );

  _i1.ColumnValue<bool, bool> allowGracePeriod(bool value) => _i1.ColumnValue(
    table.allowGracePeriod,
    value,
  );

  _i1.ColumnValue<int, int> gracePeriodActions(int value) => _i1.ColumnValue(
    table.gracePeriodActions,
    value,
  );

  _i1.ColumnValue<String, String> restrictedTools(String? value) =>
      _i1.ColumnValue(
        table.restrictedTools,
        value,
      );

  _i1.ColumnValue<String, String> allowedToolsAfterLimit(String? value) =>
      _i1.ColumnValue(
        table.allowedToolsAfterLimit,
        value,
      );

  _i1.ColumnValue<double, double> costPerUsage(double value) => _i1.ColumnValue(
    table.costPerUsage,
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

class ToolUsageLimitTable extends _i1.Table<_i1.UuidValue> {
  ToolUsageLimitTable({super.tableRelation})
    : super(tableName: 'tool_usage_limits') {
    updateTable = ToolUsageLimitUpdateTable(this);
    tier = _i1.ColumnEnum(
      'tier',
      this,
      _i1.EnumSerialization.byName,
    );
    limitType = _i1.ColumnEnum(
      'limitType',
      this,
      _i1.EnumSerialization.byName,
    );
    dailyLimit = _i1.ColumnInt(
      'dailyLimit',
      this,
    );
    monthlyLimit = _i1.ColumnInt(
      'monthlyLimit',
      this,
    );
    allowGracePeriod = _i1.ColumnBool(
      'allowGracePeriod',
      this,
      hasDefault: true,
    );
    gracePeriodActions = _i1.ColumnInt(
      'gracePeriodActions',
      this,
      hasDefault: true,
    );
    restrictedTools = _i1.ColumnString(
      'restrictedTools',
      this,
    );
    allowedToolsAfterLimit = _i1.ColumnString(
      'allowedToolsAfterLimit',
      this,
    );
    costPerUsage = _i1.ColumnDouble(
      'costPerUsage',
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

  late final ToolUsageLimitUpdateTable updateTable;

  late final _i1.ColumnEnum<_i2.SubscriptionTier> tier;

  late final _i1.ColumnEnum<_i3.LimitType> limitType;

  late final _i1.ColumnInt dailyLimit;

  late final _i1.ColumnInt monthlyLimit;

  late final _i1.ColumnBool allowGracePeriod;

  late final _i1.ColumnInt gracePeriodActions;

  late final _i1.ColumnString restrictedTools;

  late final _i1.ColumnString allowedToolsAfterLimit;

  late final _i1.ColumnDouble costPerUsage;

  late final _i1.ColumnBool isActive;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  @override
  List<_i1.Column> get columns => [
    id,
    tier,
    limitType,
    dailyLimit,
    monthlyLimit,
    allowGracePeriod,
    gracePeriodActions,
    restrictedTools,
    allowedToolsAfterLimit,
    costPerUsage,
    isActive,
    createdAt,
    updatedAt,
  ];
}

class ToolUsageLimitInclude extends _i1.IncludeObject {
  ToolUsageLimitInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<_i1.UuidValue> get table => ToolUsageLimit.t;
}

class ToolUsageLimitIncludeList extends _i1.IncludeList {
  ToolUsageLimitIncludeList._({
    _i1.WhereExpressionBuilder<ToolUsageLimitTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ToolUsageLimit.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue> get table => ToolUsageLimit.t;
}

class ToolUsageLimitRepository {
  const ToolUsageLimitRepository._();

  /// Returns a list of [ToolUsageLimit]s matching the given query parameters.
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
  Future<List<ToolUsageLimit>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ToolUsageLimitTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ToolUsageLimitTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ToolUsageLimitTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<ToolUsageLimit>(
      where: where?.call(ToolUsageLimit.t),
      orderBy: orderBy?.call(ToolUsageLimit.t),
      orderByList: orderByList?.call(ToolUsageLimit.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [ToolUsageLimit] matching the given query parameters.
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
  Future<ToolUsageLimit?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ToolUsageLimitTable>? where,
    int? offset,
    _i1.OrderByBuilder<ToolUsageLimitTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ToolUsageLimitTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<ToolUsageLimit>(
      where: where?.call(ToolUsageLimit.t),
      orderBy: orderBy?.call(ToolUsageLimit.t),
      orderByList: orderByList?.call(ToolUsageLimit.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [ToolUsageLimit] by its [id] or null if no such row exists.
  Future<ToolUsageLimit?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<ToolUsageLimit>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [ToolUsageLimit]s in the list and returns the inserted rows.
  ///
  /// The returned [ToolUsageLimit]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<ToolUsageLimit>> insert(
    _i1.Session session,
    List<ToolUsageLimit> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<ToolUsageLimit>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [ToolUsageLimit] and returns the inserted row.
  ///
  /// The returned [ToolUsageLimit] will have its `id` field set.
  Future<ToolUsageLimit> insertRow(
    _i1.Session session,
    ToolUsageLimit row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ToolUsageLimit>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [ToolUsageLimit]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<ToolUsageLimit>> update(
    _i1.Session session,
    List<ToolUsageLimit> rows, {
    _i1.ColumnSelections<ToolUsageLimitTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<ToolUsageLimit>(
      rows,
      columns: columns?.call(ToolUsageLimit.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ToolUsageLimit]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ToolUsageLimit> updateRow(
    _i1.Session session,
    ToolUsageLimit row, {
    _i1.ColumnSelections<ToolUsageLimitTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ToolUsageLimit>(
      row,
      columns: columns?.call(ToolUsageLimit.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ToolUsageLimit] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<ToolUsageLimit?> updateById(
    _i1.Session session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<ToolUsageLimitUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<ToolUsageLimit>(
      id,
      columnValues: columnValues(ToolUsageLimit.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [ToolUsageLimit]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<ToolUsageLimit>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<ToolUsageLimitUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<ToolUsageLimitTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ToolUsageLimitTable>? orderBy,
    _i1.OrderByListBuilder<ToolUsageLimitTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<ToolUsageLimit>(
      columnValues: columnValues(ToolUsageLimit.t.updateTable),
      where: where(ToolUsageLimit.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ToolUsageLimit.t),
      orderByList: orderByList?.call(ToolUsageLimit.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [ToolUsageLimit]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<ToolUsageLimit>> delete(
    _i1.Session session,
    List<ToolUsageLimit> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ToolUsageLimit>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [ToolUsageLimit].
  Future<ToolUsageLimit> deleteRow(
    _i1.Session session,
    ToolUsageLimit row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ToolUsageLimit>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<ToolUsageLimit>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ToolUsageLimitTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ToolUsageLimit>(
      where: where(ToolUsageLimit.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ToolUsageLimitTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ToolUsageLimit>(
      where: where?.call(ToolUsageLimit.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
