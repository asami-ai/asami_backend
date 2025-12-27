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

abstract class CustomerAIPolicy
    implements _i1.TableRow<_i1.UuidValue>, _i1.ProtocolSerialization {
  CustomerAIPolicy._({
    _i1.UuidValue? id,
    required this.policyName,
    this.description,
    int? dailyMessageLimit,
    int? dailyToolCallLimit,
    bool? requireExplicitIntent,
    double? minimumConfidenceScore,
    int? throttleAfterCount,
    int? throttleDelaySeconds,
    bool? enableProgressiveRestrictions,
    this.restrictionThresholds,
    double? maxDailyCost,
    double? warnAtCostPercentage,
    bool? isActive,
    bool? isDefault,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : id = id ?? _i1.Uuid().v4obj(),
       dailyMessageLimit = dailyMessageLimit ?? 100,
       dailyToolCallLimit = dailyToolCallLimit ?? 20,
       requireExplicitIntent = requireExplicitIntent ?? true,
       minimumConfidenceScore = minimumConfidenceScore ?? 0.8,
       throttleAfterCount = throttleAfterCount ?? 50,
       throttleDelaySeconds = throttleDelaySeconds ?? 2,
       enableProgressiveRestrictions = enableProgressiveRestrictions ?? true,
       maxDailyCost = maxDailyCost ?? 1.0,
       warnAtCostPercentage = warnAtCostPercentage ?? 0.8,
       isActive = isActive ?? true,
       isDefault = isDefault ?? false,
       createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory CustomerAIPolicy({
    _i1.UuidValue? id,
    required String policyName,
    String? description,
    int? dailyMessageLimit,
    int? dailyToolCallLimit,
    bool? requireExplicitIntent,
    double? minimumConfidenceScore,
    int? throttleAfterCount,
    int? throttleDelaySeconds,
    bool? enableProgressiveRestrictions,
    String? restrictionThresholds,
    double? maxDailyCost,
    double? warnAtCostPercentage,
    bool? isActive,
    bool? isDefault,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _CustomerAIPolicyImpl;

  factory CustomerAIPolicy.fromJson(Map<String, dynamic> jsonSerialization) {
    return CustomerAIPolicy(
      id: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      policyName: jsonSerialization['policyName'] as String,
      description: jsonSerialization['description'] as String?,
      dailyMessageLimit: jsonSerialization['dailyMessageLimit'] as int,
      dailyToolCallLimit: jsonSerialization['dailyToolCallLimit'] as int,
      requireExplicitIntent: jsonSerialization['requireExplicitIntent'] as bool,
      minimumConfidenceScore:
          (jsonSerialization['minimumConfidenceScore'] as num).toDouble(),
      throttleAfterCount: jsonSerialization['throttleAfterCount'] as int,
      throttleDelaySeconds: jsonSerialization['throttleDelaySeconds'] as int,
      enableProgressiveRestrictions:
          jsonSerialization['enableProgressiveRestrictions'] as bool,
      restrictionThresholds:
          jsonSerialization['restrictionThresholds'] as String?,
      maxDailyCost: (jsonSerialization['maxDailyCost'] as num).toDouble(),
      warnAtCostPercentage: (jsonSerialization['warnAtCostPercentage'] as num)
          .toDouble(),
      isActive: jsonSerialization['isActive'] as bool,
      isDefault: jsonSerialization['isDefault'] as bool,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
    );
  }

  static final t = CustomerAIPolicyTable();

  static const db = CustomerAIPolicyRepository._();

  @override
  _i1.UuidValue id;

  String policyName;

  String? description;

  int dailyMessageLimit;

  int dailyToolCallLimit;

  bool requireExplicitIntent;

  double minimumConfidenceScore;

  int throttleAfterCount;

  int throttleDelaySeconds;

  bool enableProgressiveRestrictions;

  String? restrictionThresholds;

  double maxDailyCost;

  double warnAtCostPercentage;

  bool isActive;

  bool isDefault;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _i1.Table<_i1.UuidValue> get table => t;

  /// Returns a shallow copy of this [CustomerAIPolicy]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CustomerAIPolicy copyWith({
    _i1.UuidValue? id,
    String? policyName,
    String? description,
    int? dailyMessageLimit,
    int? dailyToolCallLimit,
    bool? requireExplicitIntent,
    double? minimumConfidenceScore,
    int? throttleAfterCount,
    int? throttleDelaySeconds,
    bool? enableProgressiveRestrictions,
    String? restrictionThresholds,
    double? maxDailyCost,
    double? warnAtCostPercentage,
    bool? isActive,
    bool? isDefault,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CustomerAIPolicy',
      'id': id.toJson(),
      'policyName': policyName,
      if (description != null) 'description': description,
      'dailyMessageLimit': dailyMessageLimit,
      'dailyToolCallLimit': dailyToolCallLimit,
      'requireExplicitIntent': requireExplicitIntent,
      'minimumConfidenceScore': minimumConfidenceScore,
      'throttleAfterCount': throttleAfterCount,
      'throttleDelaySeconds': throttleDelaySeconds,
      'enableProgressiveRestrictions': enableProgressiveRestrictions,
      if (restrictionThresholds != null)
        'restrictionThresholds': restrictionThresholds,
      'maxDailyCost': maxDailyCost,
      'warnAtCostPercentage': warnAtCostPercentage,
      'isActive': isActive,
      'isDefault': isDefault,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CustomerAIPolicy',
      'id': id.toJson(),
      'policyName': policyName,
      if (description != null) 'description': description,
      'dailyMessageLimit': dailyMessageLimit,
      'dailyToolCallLimit': dailyToolCallLimit,
      'requireExplicitIntent': requireExplicitIntent,
      'minimumConfidenceScore': minimumConfidenceScore,
      'throttleAfterCount': throttleAfterCount,
      'throttleDelaySeconds': throttleDelaySeconds,
      'enableProgressiveRestrictions': enableProgressiveRestrictions,
      if (restrictionThresholds != null)
        'restrictionThresholds': restrictionThresholds,
      'maxDailyCost': maxDailyCost,
      'warnAtCostPercentage': warnAtCostPercentage,
      'isActive': isActive,
      'isDefault': isDefault,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static CustomerAIPolicyInclude include() {
    return CustomerAIPolicyInclude._();
  }

  static CustomerAIPolicyIncludeList includeList({
    _i1.WhereExpressionBuilder<CustomerAIPolicyTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CustomerAIPolicyTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CustomerAIPolicyTable>? orderByList,
    CustomerAIPolicyInclude? include,
  }) {
    return CustomerAIPolicyIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CustomerAIPolicy.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(CustomerAIPolicy.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CustomerAIPolicyImpl extends CustomerAIPolicy {
  _CustomerAIPolicyImpl({
    _i1.UuidValue? id,
    required String policyName,
    String? description,
    int? dailyMessageLimit,
    int? dailyToolCallLimit,
    bool? requireExplicitIntent,
    double? minimumConfidenceScore,
    int? throttleAfterCount,
    int? throttleDelaySeconds,
    bool? enableProgressiveRestrictions,
    String? restrictionThresholds,
    double? maxDailyCost,
    double? warnAtCostPercentage,
    bool? isActive,
    bool? isDefault,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         policyName: policyName,
         description: description,
         dailyMessageLimit: dailyMessageLimit,
         dailyToolCallLimit: dailyToolCallLimit,
         requireExplicitIntent: requireExplicitIntent,
         minimumConfidenceScore: minimumConfidenceScore,
         throttleAfterCount: throttleAfterCount,
         throttleDelaySeconds: throttleDelaySeconds,
         enableProgressiveRestrictions: enableProgressiveRestrictions,
         restrictionThresholds: restrictionThresholds,
         maxDailyCost: maxDailyCost,
         warnAtCostPercentage: warnAtCostPercentage,
         isActive: isActive,
         isDefault: isDefault,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [CustomerAIPolicy]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CustomerAIPolicy copyWith({
    _i1.UuidValue? id,
    String? policyName,
    Object? description = _Undefined,
    int? dailyMessageLimit,
    int? dailyToolCallLimit,
    bool? requireExplicitIntent,
    double? minimumConfidenceScore,
    int? throttleAfterCount,
    int? throttleDelaySeconds,
    bool? enableProgressiveRestrictions,
    Object? restrictionThresholds = _Undefined,
    double? maxDailyCost,
    double? warnAtCostPercentage,
    bool? isActive,
    bool? isDefault,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return CustomerAIPolicy(
      id: id ?? this.id,
      policyName: policyName ?? this.policyName,
      description: description is String? ? description : this.description,
      dailyMessageLimit: dailyMessageLimit ?? this.dailyMessageLimit,
      dailyToolCallLimit: dailyToolCallLimit ?? this.dailyToolCallLimit,
      requireExplicitIntent:
          requireExplicitIntent ?? this.requireExplicitIntent,
      minimumConfidenceScore:
          minimumConfidenceScore ?? this.minimumConfidenceScore,
      throttleAfterCount: throttleAfterCount ?? this.throttleAfterCount,
      throttleDelaySeconds: throttleDelaySeconds ?? this.throttleDelaySeconds,
      enableProgressiveRestrictions:
          enableProgressiveRestrictions ?? this.enableProgressiveRestrictions,
      restrictionThresholds: restrictionThresholds is String?
          ? restrictionThresholds
          : this.restrictionThresholds,
      maxDailyCost: maxDailyCost ?? this.maxDailyCost,
      warnAtCostPercentage: warnAtCostPercentage ?? this.warnAtCostPercentage,
      isActive: isActive ?? this.isActive,
      isDefault: isDefault ?? this.isDefault,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class CustomerAIPolicyUpdateTable
    extends _i1.UpdateTable<CustomerAIPolicyTable> {
  CustomerAIPolicyUpdateTable(super.table);

  _i1.ColumnValue<String, String> policyName(String value) => _i1.ColumnValue(
    table.policyName,
    value,
  );

  _i1.ColumnValue<String, String> description(String? value) => _i1.ColumnValue(
    table.description,
    value,
  );

  _i1.ColumnValue<int, int> dailyMessageLimit(int value) => _i1.ColumnValue(
    table.dailyMessageLimit,
    value,
  );

  _i1.ColumnValue<int, int> dailyToolCallLimit(int value) => _i1.ColumnValue(
    table.dailyToolCallLimit,
    value,
  );

  _i1.ColumnValue<bool, bool> requireExplicitIntent(bool value) =>
      _i1.ColumnValue(
        table.requireExplicitIntent,
        value,
      );

  _i1.ColumnValue<double, double> minimumConfidenceScore(double value) =>
      _i1.ColumnValue(
        table.minimumConfidenceScore,
        value,
      );

  _i1.ColumnValue<int, int> throttleAfterCount(int value) => _i1.ColumnValue(
    table.throttleAfterCount,
    value,
  );

  _i1.ColumnValue<int, int> throttleDelaySeconds(int value) => _i1.ColumnValue(
    table.throttleDelaySeconds,
    value,
  );

  _i1.ColumnValue<bool, bool> enableProgressiveRestrictions(bool value) =>
      _i1.ColumnValue(
        table.enableProgressiveRestrictions,
        value,
      );

  _i1.ColumnValue<String, String> restrictionThresholds(String? value) =>
      _i1.ColumnValue(
        table.restrictionThresholds,
        value,
      );

  _i1.ColumnValue<double, double> maxDailyCost(double value) => _i1.ColumnValue(
    table.maxDailyCost,
    value,
  );

  _i1.ColumnValue<double, double> warnAtCostPercentage(double value) =>
      _i1.ColumnValue(
        table.warnAtCostPercentage,
        value,
      );

  _i1.ColumnValue<bool, bool> isActive(bool value) => _i1.ColumnValue(
    table.isActive,
    value,
  );

  _i1.ColumnValue<bool, bool> isDefault(bool value) => _i1.ColumnValue(
    table.isDefault,
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

class CustomerAIPolicyTable extends _i1.Table<_i1.UuidValue> {
  CustomerAIPolicyTable({super.tableRelation})
    : super(tableName: 'customer_ai_policies') {
    updateTable = CustomerAIPolicyUpdateTable(this);
    policyName = _i1.ColumnString(
      'policyName',
      this,
    );
    description = _i1.ColumnString(
      'description',
      this,
    );
    dailyMessageLimit = _i1.ColumnInt(
      'dailyMessageLimit',
      this,
      hasDefault: true,
    );
    dailyToolCallLimit = _i1.ColumnInt(
      'dailyToolCallLimit',
      this,
      hasDefault: true,
    );
    requireExplicitIntent = _i1.ColumnBool(
      'requireExplicitIntent',
      this,
      hasDefault: true,
    );
    minimumConfidenceScore = _i1.ColumnDouble(
      'minimumConfidenceScore',
      this,
      hasDefault: true,
    );
    throttleAfterCount = _i1.ColumnInt(
      'throttleAfterCount',
      this,
      hasDefault: true,
    );
    throttleDelaySeconds = _i1.ColumnInt(
      'throttleDelaySeconds',
      this,
      hasDefault: true,
    );
    enableProgressiveRestrictions = _i1.ColumnBool(
      'enableProgressiveRestrictions',
      this,
      hasDefault: true,
    );
    restrictionThresholds = _i1.ColumnString(
      'restrictionThresholds',
      this,
    );
    maxDailyCost = _i1.ColumnDouble(
      'maxDailyCost',
      this,
      hasDefault: true,
    );
    warnAtCostPercentage = _i1.ColumnDouble(
      'warnAtCostPercentage',
      this,
      hasDefault: true,
    );
    isActive = _i1.ColumnBool(
      'isActive',
      this,
      hasDefault: true,
    );
    isDefault = _i1.ColumnBool(
      'isDefault',
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

  late final CustomerAIPolicyUpdateTable updateTable;

  late final _i1.ColumnString policyName;

  late final _i1.ColumnString description;

  late final _i1.ColumnInt dailyMessageLimit;

  late final _i1.ColumnInt dailyToolCallLimit;

  late final _i1.ColumnBool requireExplicitIntent;

  late final _i1.ColumnDouble minimumConfidenceScore;

  late final _i1.ColumnInt throttleAfterCount;

  late final _i1.ColumnInt throttleDelaySeconds;

  late final _i1.ColumnBool enableProgressiveRestrictions;

  late final _i1.ColumnString restrictionThresholds;

  late final _i1.ColumnDouble maxDailyCost;

  late final _i1.ColumnDouble warnAtCostPercentage;

  late final _i1.ColumnBool isActive;

  late final _i1.ColumnBool isDefault;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  @override
  List<_i1.Column> get columns => [
    id,
    policyName,
    description,
    dailyMessageLimit,
    dailyToolCallLimit,
    requireExplicitIntent,
    minimumConfidenceScore,
    throttleAfterCount,
    throttleDelaySeconds,
    enableProgressiveRestrictions,
    restrictionThresholds,
    maxDailyCost,
    warnAtCostPercentage,
    isActive,
    isDefault,
    createdAt,
    updatedAt,
  ];
}

class CustomerAIPolicyInclude extends _i1.IncludeObject {
  CustomerAIPolicyInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<_i1.UuidValue> get table => CustomerAIPolicy.t;
}

class CustomerAIPolicyIncludeList extends _i1.IncludeList {
  CustomerAIPolicyIncludeList._({
    _i1.WhereExpressionBuilder<CustomerAIPolicyTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(CustomerAIPolicy.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue> get table => CustomerAIPolicy.t;
}

class CustomerAIPolicyRepository {
  const CustomerAIPolicyRepository._();

  /// Returns a list of [CustomerAIPolicy]s matching the given query parameters.
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
  Future<List<CustomerAIPolicy>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CustomerAIPolicyTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CustomerAIPolicyTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CustomerAIPolicyTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<CustomerAIPolicy>(
      where: where?.call(CustomerAIPolicy.t),
      orderBy: orderBy?.call(CustomerAIPolicy.t),
      orderByList: orderByList?.call(CustomerAIPolicy.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [CustomerAIPolicy] matching the given query parameters.
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
  Future<CustomerAIPolicy?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CustomerAIPolicyTable>? where,
    int? offset,
    _i1.OrderByBuilder<CustomerAIPolicyTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CustomerAIPolicyTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<CustomerAIPolicy>(
      where: where?.call(CustomerAIPolicy.t),
      orderBy: orderBy?.call(CustomerAIPolicy.t),
      orderByList: orderByList?.call(CustomerAIPolicy.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [CustomerAIPolicy] by its [id] or null if no such row exists.
  Future<CustomerAIPolicy?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<CustomerAIPolicy>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [CustomerAIPolicy]s in the list and returns the inserted rows.
  ///
  /// The returned [CustomerAIPolicy]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<CustomerAIPolicy>> insert(
    _i1.Session session,
    List<CustomerAIPolicy> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<CustomerAIPolicy>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [CustomerAIPolicy] and returns the inserted row.
  ///
  /// The returned [CustomerAIPolicy] will have its `id` field set.
  Future<CustomerAIPolicy> insertRow(
    _i1.Session session,
    CustomerAIPolicy row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<CustomerAIPolicy>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [CustomerAIPolicy]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<CustomerAIPolicy>> update(
    _i1.Session session,
    List<CustomerAIPolicy> rows, {
    _i1.ColumnSelections<CustomerAIPolicyTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<CustomerAIPolicy>(
      rows,
      columns: columns?.call(CustomerAIPolicy.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CustomerAIPolicy]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<CustomerAIPolicy> updateRow(
    _i1.Session session,
    CustomerAIPolicy row, {
    _i1.ColumnSelections<CustomerAIPolicyTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<CustomerAIPolicy>(
      row,
      columns: columns?.call(CustomerAIPolicy.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CustomerAIPolicy] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<CustomerAIPolicy?> updateById(
    _i1.Session session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<CustomerAIPolicyUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<CustomerAIPolicy>(
      id,
      columnValues: columnValues(CustomerAIPolicy.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [CustomerAIPolicy]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<CustomerAIPolicy>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<CustomerAIPolicyUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<CustomerAIPolicyTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CustomerAIPolicyTable>? orderBy,
    _i1.OrderByListBuilder<CustomerAIPolicyTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<CustomerAIPolicy>(
      columnValues: columnValues(CustomerAIPolicy.t.updateTable),
      where: where(CustomerAIPolicy.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CustomerAIPolicy.t),
      orderByList: orderByList?.call(CustomerAIPolicy.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [CustomerAIPolicy]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<CustomerAIPolicy>> delete(
    _i1.Session session,
    List<CustomerAIPolicy> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<CustomerAIPolicy>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [CustomerAIPolicy].
  Future<CustomerAIPolicy> deleteRow(
    _i1.Session session,
    CustomerAIPolicy row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<CustomerAIPolicy>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<CustomerAIPolicy>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<CustomerAIPolicyTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<CustomerAIPolicy>(
      where: where(CustomerAIPolicy.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CustomerAIPolicyTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<CustomerAIPolicy>(
      where: where?.call(CustomerAIPolicy.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
