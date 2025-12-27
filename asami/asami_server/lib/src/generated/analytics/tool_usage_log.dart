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
import '../user/user_type.dart' as _i2;

abstract class ToolUsageLog
    implements _i1.TableRow<_i1.UuidValue>, _i1.ProtocolSerialization {
  ToolUsageLog._({
    _i1.UuidValue? id,
    required this.userId,
    required this.userType,
    this.conversationId,
    required this.toolName,
    this.toolCategory,
    this.arguments,
    bool? success,
    required this.executionTimeMs,
    this.errorMessage,
    double? costIncurred,
    bool? isBillable,
    this.billingPeriodStart,
    this.billingPeriodEnd,
    bool? wasWithinLimit,
    bool? usedGracePeriod,
    bool? deniedDueToLimit,
    this.platform,
    this.ipAddress,
    this.userAgent,
    DateTime? createdAt,
  }) : id = id ?? _i1.Uuid().v4obj(),
       success = success ?? true,
       costIncurred = costIncurred ?? 0.0,
       isBillable = isBillable ?? false,
       wasWithinLimit = wasWithinLimit ?? true,
       usedGracePeriod = usedGracePeriod ?? false,
       deniedDueToLimit = deniedDueToLimit ?? false,
       createdAt = createdAt ?? DateTime.now();

  factory ToolUsageLog({
    _i1.UuidValue? id,
    required _i1.UuidValue userId,
    required _i2.UserType userType,
    _i1.UuidValue? conversationId,
    required String toolName,
    String? toolCategory,
    String? arguments,
    bool? success,
    required int executionTimeMs,
    String? errorMessage,
    double? costIncurred,
    bool? isBillable,
    DateTime? billingPeriodStart,
    DateTime? billingPeriodEnd,
    bool? wasWithinLimit,
    bool? usedGracePeriod,
    bool? deniedDueToLimit,
    String? platform,
    String? ipAddress,
    String? userAgent,
    DateTime? createdAt,
  }) = _ToolUsageLogImpl;

  factory ToolUsageLog.fromJson(Map<String, dynamic> jsonSerialization) {
    return ToolUsageLog(
      id: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      userId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      userType: _i2.UserType.fromJson(
        (jsonSerialization['userType'] as String),
      ),
      conversationId: jsonSerialization['conversationId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(
              jsonSerialization['conversationId'],
            ),
      toolName: jsonSerialization['toolName'] as String,
      toolCategory: jsonSerialization['toolCategory'] as String?,
      arguments: jsonSerialization['arguments'] as String?,
      success: jsonSerialization['success'] as bool,
      executionTimeMs: jsonSerialization['executionTimeMs'] as int,
      errorMessage: jsonSerialization['errorMessage'] as String?,
      costIncurred: (jsonSerialization['costIncurred'] as num).toDouble(),
      isBillable: jsonSerialization['isBillable'] as bool,
      billingPeriodStart: jsonSerialization['billingPeriodStart'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['billingPeriodStart'],
            ),
      billingPeriodEnd: jsonSerialization['billingPeriodEnd'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['billingPeriodEnd'],
            ),
      wasWithinLimit: jsonSerialization['wasWithinLimit'] as bool,
      usedGracePeriod: jsonSerialization['usedGracePeriod'] as bool,
      deniedDueToLimit: jsonSerialization['deniedDueToLimit'] as bool,
      platform: jsonSerialization['platform'] as String?,
      ipAddress: jsonSerialization['ipAddress'] as String?,
      userAgent: jsonSerialization['userAgent'] as String?,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  static final t = ToolUsageLogTable();

  static const db = ToolUsageLogRepository._();

  @override
  _i1.UuidValue id;

  _i1.UuidValue userId;

  _i2.UserType userType;

  _i1.UuidValue? conversationId;

  String toolName;

  String? toolCategory;

  String? arguments;

  bool success;

  int executionTimeMs;

  String? errorMessage;

  double costIncurred;

  bool isBillable;

  DateTime? billingPeriodStart;

  DateTime? billingPeriodEnd;

  bool wasWithinLimit;

  bool usedGracePeriod;

  bool deniedDueToLimit;

  String? platform;

  String? ipAddress;

  String? userAgent;

  DateTime createdAt;

  @override
  _i1.Table<_i1.UuidValue> get table => t;

  /// Returns a shallow copy of this [ToolUsageLog]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ToolUsageLog copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? userId,
    _i2.UserType? userType,
    _i1.UuidValue? conversationId,
    String? toolName,
    String? toolCategory,
    String? arguments,
    bool? success,
    int? executionTimeMs,
    String? errorMessage,
    double? costIncurred,
    bool? isBillable,
    DateTime? billingPeriodStart,
    DateTime? billingPeriodEnd,
    bool? wasWithinLimit,
    bool? usedGracePeriod,
    bool? deniedDueToLimit,
    String? platform,
    String? ipAddress,
    String? userAgent,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ToolUsageLog',
      'id': id.toJson(),
      'userId': userId.toJson(),
      'userType': userType.toJson(),
      if (conversationId != null) 'conversationId': conversationId?.toJson(),
      'toolName': toolName,
      if (toolCategory != null) 'toolCategory': toolCategory,
      if (arguments != null) 'arguments': arguments,
      'success': success,
      'executionTimeMs': executionTimeMs,
      if (errorMessage != null) 'errorMessage': errorMessage,
      'costIncurred': costIncurred,
      'isBillable': isBillable,
      if (billingPeriodStart != null)
        'billingPeriodStart': billingPeriodStart?.toJson(),
      if (billingPeriodEnd != null)
        'billingPeriodEnd': billingPeriodEnd?.toJson(),
      'wasWithinLimit': wasWithinLimit,
      'usedGracePeriod': usedGracePeriod,
      'deniedDueToLimit': deniedDueToLimit,
      if (platform != null) 'platform': platform,
      if (ipAddress != null) 'ipAddress': ipAddress,
      if (userAgent != null) 'userAgent': userAgent,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ToolUsageLog',
      'id': id.toJson(),
      'userId': userId.toJson(),
      'userType': userType.toJson(),
      if (conversationId != null) 'conversationId': conversationId?.toJson(),
      'toolName': toolName,
      if (toolCategory != null) 'toolCategory': toolCategory,
      if (arguments != null) 'arguments': arguments,
      'success': success,
      'executionTimeMs': executionTimeMs,
      if (errorMessage != null) 'errorMessage': errorMessage,
      'costIncurred': costIncurred,
      'isBillable': isBillable,
      if (billingPeriodStart != null)
        'billingPeriodStart': billingPeriodStart?.toJson(),
      if (billingPeriodEnd != null)
        'billingPeriodEnd': billingPeriodEnd?.toJson(),
      'wasWithinLimit': wasWithinLimit,
      'usedGracePeriod': usedGracePeriod,
      'deniedDueToLimit': deniedDueToLimit,
      if (platform != null) 'platform': platform,
      if (ipAddress != null) 'ipAddress': ipAddress,
      if (userAgent != null) 'userAgent': userAgent,
      'createdAt': createdAt.toJson(),
    };
  }

  static ToolUsageLogInclude include() {
    return ToolUsageLogInclude._();
  }

  static ToolUsageLogIncludeList includeList({
    _i1.WhereExpressionBuilder<ToolUsageLogTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ToolUsageLogTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ToolUsageLogTable>? orderByList,
    ToolUsageLogInclude? include,
  }) {
    return ToolUsageLogIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ToolUsageLog.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ToolUsageLog.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ToolUsageLogImpl extends ToolUsageLog {
  _ToolUsageLogImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue userId,
    required _i2.UserType userType,
    _i1.UuidValue? conversationId,
    required String toolName,
    String? toolCategory,
    String? arguments,
    bool? success,
    required int executionTimeMs,
    String? errorMessage,
    double? costIncurred,
    bool? isBillable,
    DateTime? billingPeriodStart,
    DateTime? billingPeriodEnd,
    bool? wasWithinLimit,
    bool? usedGracePeriod,
    bool? deniedDueToLimit,
    String? platform,
    String? ipAddress,
    String? userAgent,
    DateTime? createdAt,
  }) : super._(
         id: id,
         userId: userId,
         userType: userType,
         conversationId: conversationId,
         toolName: toolName,
         toolCategory: toolCategory,
         arguments: arguments,
         success: success,
         executionTimeMs: executionTimeMs,
         errorMessage: errorMessage,
         costIncurred: costIncurred,
         isBillable: isBillable,
         billingPeriodStart: billingPeriodStart,
         billingPeriodEnd: billingPeriodEnd,
         wasWithinLimit: wasWithinLimit,
         usedGracePeriod: usedGracePeriod,
         deniedDueToLimit: deniedDueToLimit,
         platform: platform,
         ipAddress: ipAddress,
         userAgent: userAgent,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [ToolUsageLog]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ToolUsageLog copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? userId,
    _i2.UserType? userType,
    Object? conversationId = _Undefined,
    String? toolName,
    Object? toolCategory = _Undefined,
    Object? arguments = _Undefined,
    bool? success,
    int? executionTimeMs,
    Object? errorMessage = _Undefined,
    double? costIncurred,
    bool? isBillable,
    Object? billingPeriodStart = _Undefined,
    Object? billingPeriodEnd = _Undefined,
    bool? wasWithinLimit,
    bool? usedGracePeriod,
    bool? deniedDueToLimit,
    Object? platform = _Undefined,
    Object? ipAddress = _Undefined,
    Object? userAgent = _Undefined,
    DateTime? createdAt,
  }) {
    return ToolUsageLog(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      userType: userType ?? this.userType,
      conversationId: conversationId is _i1.UuidValue?
          ? conversationId
          : this.conversationId,
      toolName: toolName ?? this.toolName,
      toolCategory: toolCategory is String? ? toolCategory : this.toolCategory,
      arguments: arguments is String? ? arguments : this.arguments,
      success: success ?? this.success,
      executionTimeMs: executionTimeMs ?? this.executionTimeMs,
      errorMessage: errorMessage is String? ? errorMessage : this.errorMessage,
      costIncurred: costIncurred ?? this.costIncurred,
      isBillable: isBillable ?? this.isBillable,
      billingPeriodStart: billingPeriodStart is DateTime?
          ? billingPeriodStart
          : this.billingPeriodStart,
      billingPeriodEnd: billingPeriodEnd is DateTime?
          ? billingPeriodEnd
          : this.billingPeriodEnd,
      wasWithinLimit: wasWithinLimit ?? this.wasWithinLimit,
      usedGracePeriod: usedGracePeriod ?? this.usedGracePeriod,
      deniedDueToLimit: deniedDueToLimit ?? this.deniedDueToLimit,
      platform: platform is String? ? platform : this.platform,
      ipAddress: ipAddress is String? ? ipAddress : this.ipAddress,
      userAgent: userAgent is String? ? userAgent : this.userAgent,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class ToolUsageLogUpdateTable extends _i1.UpdateTable<ToolUsageLogTable> {
  ToolUsageLogUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> userId(_i1.UuidValue value) =>
      _i1.ColumnValue(
        table.userId,
        value,
      );

  _i1.ColumnValue<_i2.UserType, _i2.UserType> userType(_i2.UserType value) =>
      _i1.ColumnValue(
        table.userType,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> conversationId(
    _i1.UuidValue? value,
  ) => _i1.ColumnValue(
    table.conversationId,
    value,
  );

  _i1.ColumnValue<String, String> toolName(String value) => _i1.ColumnValue(
    table.toolName,
    value,
  );

  _i1.ColumnValue<String, String> toolCategory(String? value) =>
      _i1.ColumnValue(
        table.toolCategory,
        value,
      );

  _i1.ColumnValue<String, String> arguments(String? value) => _i1.ColumnValue(
    table.arguments,
    value,
  );

  _i1.ColumnValue<bool, bool> success(bool value) => _i1.ColumnValue(
    table.success,
    value,
  );

  _i1.ColumnValue<int, int> executionTimeMs(int value) => _i1.ColumnValue(
    table.executionTimeMs,
    value,
  );

  _i1.ColumnValue<String, String> errorMessage(String? value) =>
      _i1.ColumnValue(
        table.errorMessage,
        value,
      );

  _i1.ColumnValue<double, double> costIncurred(double value) => _i1.ColumnValue(
    table.costIncurred,
    value,
  );

  _i1.ColumnValue<bool, bool> isBillable(bool value) => _i1.ColumnValue(
    table.isBillable,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> billingPeriodStart(DateTime? value) =>
      _i1.ColumnValue(
        table.billingPeriodStart,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> billingPeriodEnd(DateTime? value) =>
      _i1.ColumnValue(
        table.billingPeriodEnd,
        value,
      );

  _i1.ColumnValue<bool, bool> wasWithinLimit(bool value) => _i1.ColumnValue(
    table.wasWithinLimit,
    value,
  );

  _i1.ColumnValue<bool, bool> usedGracePeriod(bool value) => _i1.ColumnValue(
    table.usedGracePeriod,
    value,
  );

  _i1.ColumnValue<bool, bool> deniedDueToLimit(bool value) => _i1.ColumnValue(
    table.deniedDueToLimit,
    value,
  );

  _i1.ColumnValue<String, String> platform(String? value) => _i1.ColumnValue(
    table.platform,
    value,
  );

  _i1.ColumnValue<String, String> ipAddress(String? value) => _i1.ColumnValue(
    table.ipAddress,
    value,
  );

  _i1.ColumnValue<String, String> userAgent(String? value) => _i1.ColumnValue(
    table.userAgent,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );
}

class ToolUsageLogTable extends _i1.Table<_i1.UuidValue> {
  ToolUsageLogTable({super.tableRelation})
    : super(tableName: 'tool_usage_logs') {
    updateTable = ToolUsageLogUpdateTable(this);
    userId = _i1.ColumnUuid(
      'userId',
      this,
    );
    userType = _i1.ColumnEnum(
      'userType',
      this,
      _i1.EnumSerialization.byName,
    );
    conversationId = _i1.ColumnUuid(
      'conversationId',
      this,
    );
    toolName = _i1.ColumnString(
      'toolName',
      this,
    );
    toolCategory = _i1.ColumnString(
      'toolCategory',
      this,
    );
    arguments = _i1.ColumnString(
      'arguments',
      this,
    );
    success = _i1.ColumnBool(
      'success',
      this,
      hasDefault: true,
    );
    executionTimeMs = _i1.ColumnInt(
      'executionTimeMs',
      this,
    );
    errorMessage = _i1.ColumnString(
      'errorMessage',
      this,
    );
    costIncurred = _i1.ColumnDouble(
      'costIncurred',
      this,
      hasDefault: true,
    );
    isBillable = _i1.ColumnBool(
      'isBillable',
      this,
      hasDefault: true,
    );
    billingPeriodStart = _i1.ColumnDateTime(
      'billingPeriodStart',
      this,
    );
    billingPeriodEnd = _i1.ColumnDateTime(
      'billingPeriodEnd',
      this,
    );
    wasWithinLimit = _i1.ColumnBool(
      'wasWithinLimit',
      this,
      hasDefault: true,
    );
    usedGracePeriod = _i1.ColumnBool(
      'usedGracePeriod',
      this,
      hasDefault: true,
    );
    deniedDueToLimit = _i1.ColumnBool(
      'deniedDueToLimit',
      this,
      hasDefault: true,
    );
    platform = _i1.ColumnString(
      'platform',
      this,
    );
    ipAddress = _i1.ColumnString(
      'ipAddress',
      this,
    );
    userAgent = _i1.ColumnString(
      'userAgent',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
  }

  late final ToolUsageLogUpdateTable updateTable;

  late final _i1.ColumnUuid userId;

  late final _i1.ColumnEnum<_i2.UserType> userType;

  late final _i1.ColumnUuid conversationId;

  late final _i1.ColumnString toolName;

  late final _i1.ColumnString toolCategory;

  late final _i1.ColumnString arguments;

  late final _i1.ColumnBool success;

  late final _i1.ColumnInt executionTimeMs;

  late final _i1.ColumnString errorMessage;

  late final _i1.ColumnDouble costIncurred;

  late final _i1.ColumnBool isBillable;

  late final _i1.ColumnDateTime billingPeriodStart;

  late final _i1.ColumnDateTime billingPeriodEnd;

  late final _i1.ColumnBool wasWithinLimit;

  late final _i1.ColumnBool usedGracePeriod;

  late final _i1.ColumnBool deniedDueToLimit;

  late final _i1.ColumnString platform;

  late final _i1.ColumnString ipAddress;

  late final _i1.ColumnString userAgent;

  late final _i1.ColumnDateTime createdAt;

  @override
  List<_i1.Column> get columns => [
    id,
    userId,
    userType,
    conversationId,
    toolName,
    toolCategory,
    arguments,
    success,
    executionTimeMs,
    errorMessage,
    costIncurred,
    isBillable,
    billingPeriodStart,
    billingPeriodEnd,
    wasWithinLimit,
    usedGracePeriod,
    deniedDueToLimit,
    platform,
    ipAddress,
    userAgent,
    createdAt,
  ];
}

class ToolUsageLogInclude extends _i1.IncludeObject {
  ToolUsageLogInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<_i1.UuidValue> get table => ToolUsageLog.t;
}

class ToolUsageLogIncludeList extends _i1.IncludeList {
  ToolUsageLogIncludeList._({
    _i1.WhereExpressionBuilder<ToolUsageLogTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ToolUsageLog.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue> get table => ToolUsageLog.t;
}

class ToolUsageLogRepository {
  const ToolUsageLogRepository._();

  /// Returns a list of [ToolUsageLog]s matching the given query parameters.
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
  Future<List<ToolUsageLog>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ToolUsageLogTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ToolUsageLogTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ToolUsageLogTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<ToolUsageLog>(
      where: where?.call(ToolUsageLog.t),
      orderBy: orderBy?.call(ToolUsageLog.t),
      orderByList: orderByList?.call(ToolUsageLog.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [ToolUsageLog] matching the given query parameters.
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
  Future<ToolUsageLog?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ToolUsageLogTable>? where,
    int? offset,
    _i1.OrderByBuilder<ToolUsageLogTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ToolUsageLogTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<ToolUsageLog>(
      where: where?.call(ToolUsageLog.t),
      orderBy: orderBy?.call(ToolUsageLog.t),
      orderByList: orderByList?.call(ToolUsageLog.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [ToolUsageLog] by its [id] or null if no such row exists.
  Future<ToolUsageLog?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<ToolUsageLog>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [ToolUsageLog]s in the list and returns the inserted rows.
  ///
  /// The returned [ToolUsageLog]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<ToolUsageLog>> insert(
    _i1.Session session,
    List<ToolUsageLog> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<ToolUsageLog>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [ToolUsageLog] and returns the inserted row.
  ///
  /// The returned [ToolUsageLog] will have its `id` field set.
  Future<ToolUsageLog> insertRow(
    _i1.Session session,
    ToolUsageLog row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ToolUsageLog>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [ToolUsageLog]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<ToolUsageLog>> update(
    _i1.Session session,
    List<ToolUsageLog> rows, {
    _i1.ColumnSelections<ToolUsageLogTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<ToolUsageLog>(
      rows,
      columns: columns?.call(ToolUsageLog.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ToolUsageLog]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ToolUsageLog> updateRow(
    _i1.Session session,
    ToolUsageLog row, {
    _i1.ColumnSelections<ToolUsageLogTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ToolUsageLog>(
      row,
      columns: columns?.call(ToolUsageLog.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ToolUsageLog] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<ToolUsageLog?> updateById(
    _i1.Session session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<ToolUsageLogUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<ToolUsageLog>(
      id,
      columnValues: columnValues(ToolUsageLog.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [ToolUsageLog]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<ToolUsageLog>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<ToolUsageLogUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<ToolUsageLogTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ToolUsageLogTable>? orderBy,
    _i1.OrderByListBuilder<ToolUsageLogTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<ToolUsageLog>(
      columnValues: columnValues(ToolUsageLog.t.updateTable),
      where: where(ToolUsageLog.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ToolUsageLog.t),
      orderByList: orderByList?.call(ToolUsageLog.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [ToolUsageLog]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<ToolUsageLog>> delete(
    _i1.Session session,
    List<ToolUsageLog> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ToolUsageLog>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [ToolUsageLog].
  Future<ToolUsageLog> deleteRow(
    _i1.Session session,
    ToolUsageLog row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ToolUsageLog>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<ToolUsageLog>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ToolUsageLogTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ToolUsageLog>(
      where: where(ToolUsageLog.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ToolUsageLogTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ToolUsageLog>(
      where: where?.call(ToolUsageLog.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
