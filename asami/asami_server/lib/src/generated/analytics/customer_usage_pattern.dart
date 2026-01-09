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
import '../subscription/usage_class.dart' as _i2;

abstract class CustomerUsagePattern
    implements _i1.TableRow<_i1.UuidValue>, _i1.ProtocolSerialization {
  CustomerUsagePattern._({
    _i1.UuidValue? id,
    required this.userId,
    double? averageDailyMessages,
    double? averageDailyToolCalls,
    this.peakUsageHour,
    required this.usageClass,
    bool? isAbuser,
    double? abuseScore,
    double? toolSuccessRate,
    double? averageToolExecutionTime,
    double? averageConversationLength,
    double? repetitiveQueryScore,
    bool? shouldThrottle,
    this.throttleReason,
    int? currentThrottleDelay,
    this.lastAnalyzedAt,
    int? analysisCount,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : id = id ?? _i1.Uuid().v4obj(),
       averageDailyMessages = averageDailyMessages ?? 0.0,
       averageDailyToolCalls = averageDailyToolCalls ?? 0.0,
       isAbuser = isAbuser ?? false,
       abuseScore = abuseScore ?? 0.0,
       toolSuccessRate = toolSuccessRate ?? 1.0,
       averageToolExecutionTime = averageToolExecutionTime ?? 0.0,
       averageConversationLength = averageConversationLength ?? 0.0,
       repetitiveQueryScore = repetitiveQueryScore ?? 0.0,
       shouldThrottle = shouldThrottle ?? false,
       currentThrottleDelay = currentThrottleDelay ?? 0,
       analysisCount = analysisCount ?? 0,
       createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory CustomerUsagePattern({
    _i1.UuidValue? id,
    required _i1.UuidValue userId,
    double? averageDailyMessages,
    double? averageDailyToolCalls,
    int? peakUsageHour,
    required _i2.UsageClass usageClass,
    bool? isAbuser,
    double? abuseScore,
    double? toolSuccessRate,
    double? averageToolExecutionTime,
    double? averageConversationLength,
    double? repetitiveQueryScore,
    bool? shouldThrottle,
    String? throttleReason,
    int? currentThrottleDelay,
    DateTime? lastAnalyzedAt,
    int? analysisCount,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _CustomerUsagePatternImpl;

  factory CustomerUsagePattern.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return CustomerUsagePattern(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      userId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      averageDailyMessages: (jsonSerialization['averageDailyMessages'] as num?)
          ?.toDouble(),
      averageDailyToolCalls:
          (jsonSerialization['averageDailyToolCalls'] as num?)?.toDouble(),
      peakUsageHour: jsonSerialization['peakUsageHour'] as int?,
      usageClass: _i2.UsageClass.fromJson(
        (jsonSerialization['usageClass'] as String),
      ),
      isAbuser: jsonSerialization['isAbuser'] as bool?,
      abuseScore: (jsonSerialization['abuseScore'] as num?)?.toDouble(),
      toolSuccessRate: (jsonSerialization['toolSuccessRate'] as num?)
          ?.toDouble(),
      averageToolExecutionTime:
          (jsonSerialization['averageToolExecutionTime'] as num?)?.toDouble(),
      averageConversationLength:
          (jsonSerialization['averageConversationLength'] as num?)?.toDouble(),
      repetitiveQueryScore: (jsonSerialization['repetitiveQueryScore'] as num?)
          ?.toDouble(),
      shouldThrottle: jsonSerialization['shouldThrottle'] as bool?,
      throttleReason: jsonSerialization['throttleReason'] as String?,
      currentThrottleDelay: jsonSerialization['currentThrottleDelay'] as int?,
      lastAnalyzedAt: jsonSerialization['lastAnalyzedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastAnalyzedAt'],
            ),
      analysisCount: jsonSerialization['analysisCount'] as int?,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  static final t = CustomerUsagePatternTable();

  static const db = CustomerUsagePatternRepository._();

  @override
  _i1.UuidValue id;

  _i1.UuidValue userId;

  double averageDailyMessages;

  double averageDailyToolCalls;

  int? peakUsageHour;

  _i2.UsageClass usageClass;

  bool isAbuser;

  double abuseScore;

  double toolSuccessRate;

  double averageToolExecutionTime;

  double averageConversationLength;

  double repetitiveQueryScore;

  bool shouldThrottle;

  String? throttleReason;

  int currentThrottleDelay;

  DateTime? lastAnalyzedAt;

  int analysisCount;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _i1.Table<_i1.UuidValue> get table => t;

  /// Returns a shallow copy of this [CustomerUsagePattern]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CustomerUsagePattern copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? userId,
    double? averageDailyMessages,
    double? averageDailyToolCalls,
    int? peakUsageHour,
    _i2.UsageClass? usageClass,
    bool? isAbuser,
    double? abuseScore,
    double? toolSuccessRate,
    double? averageToolExecutionTime,
    double? averageConversationLength,
    double? repetitiveQueryScore,
    bool? shouldThrottle,
    String? throttleReason,
    int? currentThrottleDelay,
    DateTime? lastAnalyzedAt,
    int? analysisCount,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CustomerUsagePattern',
      'id': id.toJson(),
      'userId': userId.toJson(),
      'averageDailyMessages': averageDailyMessages,
      'averageDailyToolCalls': averageDailyToolCalls,
      if (peakUsageHour != null) 'peakUsageHour': peakUsageHour,
      'usageClass': usageClass.toJson(),
      'isAbuser': isAbuser,
      'abuseScore': abuseScore,
      'toolSuccessRate': toolSuccessRate,
      'averageToolExecutionTime': averageToolExecutionTime,
      'averageConversationLength': averageConversationLength,
      'repetitiveQueryScore': repetitiveQueryScore,
      'shouldThrottle': shouldThrottle,
      if (throttleReason != null) 'throttleReason': throttleReason,
      'currentThrottleDelay': currentThrottleDelay,
      if (lastAnalyzedAt != null) 'lastAnalyzedAt': lastAnalyzedAt?.toJson(),
      'analysisCount': analysisCount,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CustomerUsagePattern',
      'id': id.toJson(),
      'userId': userId.toJson(),
      'averageDailyMessages': averageDailyMessages,
      'averageDailyToolCalls': averageDailyToolCalls,
      if (peakUsageHour != null) 'peakUsageHour': peakUsageHour,
      'usageClass': usageClass.toJson(),
      'isAbuser': isAbuser,
      'abuseScore': abuseScore,
      'toolSuccessRate': toolSuccessRate,
      'averageToolExecutionTime': averageToolExecutionTime,
      'averageConversationLength': averageConversationLength,
      'repetitiveQueryScore': repetitiveQueryScore,
      'shouldThrottle': shouldThrottle,
      if (throttleReason != null) 'throttleReason': throttleReason,
      'currentThrottleDelay': currentThrottleDelay,
      if (lastAnalyzedAt != null) 'lastAnalyzedAt': lastAnalyzedAt?.toJson(),
      'analysisCount': analysisCount,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static CustomerUsagePatternInclude include() {
    return CustomerUsagePatternInclude._();
  }

  static CustomerUsagePatternIncludeList includeList({
    _i1.WhereExpressionBuilder<CustomerUsagePatternTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CustomerUsagePatternTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CustomerUsagePatternTable>? orderByList,
    CustomerUsagePatternInclude? include,
  }) {
    return CustomerUsagePatternIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CustomerUsagePattern.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(CustomerUsagePattern.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CustomerUsagePatternImpl extends CustomerUsagePattern {
  _CustomerUsagePatternImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue userId,
    double? averageDailyMessages,
    double? averageDailyToolCalls,
    int? peakUsageHour,
    required _i2.UsageClass usageClass,
    bool? isAbuser,
    double? abuseScore,
    double? toolSuccessRate,
    double? averageToolExecutionTime,
    double? averageConversationLength,
    double? repetitiveQueryScore,
    bool? shouldThrottle,
    String? throttleReason,
    int? currentThrottleDelay,
    DateTime? lastAnalyzedAt,
    int? analysisCount,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         userId: userId,
         averageDailyMessages: averageDailyMessages,
         averageDailyToolCalls: averageDailyToolCalls,
         peakUsageHour: peakUsageHour,
         usageClass: usageClass,
         isAbuser: isAbuser,
         abuseScore: abuseScore,
         toolSuccessRate: toolSuccessRate,
         averageToolExecutionTime: averageToolExecutionTime,
         averageConversationLength: averageConversationLength,
         repetitiveQueryScore: repetitiveQueryScore,
         shouldThrottle: shouldThrottle,
         throttleReason: throttleReason,
         currentThrottleDelay: currentThrottleDelay,
         lastAnalyzedAt: lastAnalyzedAt,
         analysisCount: analysisCount,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [CustomerUsagePattern]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CustomerUsagePattern copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? userId,
    double? averageDailyMessages,
    double? averageDailyToolCalls,
    Object? peakUsageHour = _Undefined,
    _i2.UsageClass? usageClass,
    bool? isAbuser,
    double? abuseScore,
    double? toolSuccessRate,
    double? averageToolExecutionTime,
    double? averageConversationLength,
    double? repetitiveQueryScore,
    bool? shouldThrottle,
    Object? throttleReason = _Undefined,
    int? currentThrottleDelay,
    Object? lastAnalyzedAt = _Undefined,
    int? analysisCount,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return CustomerUsagePattern(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      averageDailyMessages: averageDailyMessages ?? this.averageDailyMessages,
      averageDailyToolCalls:
          averageDailyToolCalls ?? this.averageDailyToolCalls,
      peakUsageHour: peakUsageHour is int? ? peakUsageHour : this.peakUsageHour,
      usageClass: usageClass ?? this.usageClass,
      isAbuser: isAbuser ?? this.isAbuser,
      abuseScore: abuseScore ?? this.abuseScore,
      toolSuccessRate: toolSuccessRate ?? this.toolSuccessRate,
      averageToolExecutionTime:
          averageToolExecutionTime ?? this.averageToolExecutionTime,
      averageConversationLength:
          averageConversationLength ?? this.averageConversationLength,
      repetitiveQueryScore: repetitiveQueryScore ?? this.repetitiveQueryScore,
      shouldThrottle: shouldThrottle ?? this.shouldThrottle,
      throttleReason: throttleReason is String?
          ? throttleReason
          : this.throttleReason,
      currentThrottleDelay: currentThrottleDelay ?? this.currentThrottleDelay,
      lastAnalyzedAt: lastAnalyzedAt is DateTime?
          ? lastAnalyzedAt
          : this.lastAnalyzedAt,
      analysisCount: analysisCount ?? this.analysisCount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class CustomerUsagePatternUpdateTable
    extends _i1.UpdateTable<CustomerUsagePatternTable> {
  CustomerUsagePatternUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> userId(_i1.UuidValue value) =>
      _i1.ColumnValue(
        table.userId,
        value,
      );

  _i1.ColumnValue<double, double> averageDailyMessages(double value) =>
      _i1.ColumnValue(
        table.averageDailyMessages,
        value,
      );

  _i1.ColumnValue<double, double> averageDailyToolCalls(double value) =>
      _i1.ColumnValue(
        table.averageDailyToolCalls,
        value,
      );

  _i1.ColumnValue<int, int> peakUsageHour(int? value) => _i1.ColumnValue(
    table.peakUsageHour,
    value,
  );

  _i1.ColumnValue<_i2.UsageClass, _i2.UsageClass> usageClass(
    _i2.UsageClass value,
  ) => _i1.ColumnValue(
    table.usageClass,
    value,
  );

  _i1.ColumnValue<bool, bool> isAbuser(bool value) => _i1.ColumnValue(
    table.isAbuser,
    value,
  );

  _i1.ColumnValue<double, double> abuseScore(double value) => _i1.ColumnValue(
    table.abuseScore,
    value,
  );

  _i1.ColumnValue<double, double> toolSuccessRate(double value) =>
      _i1.ColumnValue(
        table.toolSuccessRate,
        value,
      );

  _i1.ColumnValue<double, double> averageToolExecutionTime(double value) =>
      _i1.ColumnValue(
        table.averageToolExecutionTime,
        value,
      );

  _i1.ColumnValue<double, double> averageConversationLength(double value) =>
      _i1.ColumnValue(
        table.averageConversationLength,
        value,
      );

  _i1.ColumnValue<double, double> repetitiveQueryScore(double value) =>
      _i1.ColumnValue(
        table.repetitiveQueryScore,
        value,
      );

  _i1.ColumnValue<bool, bool> shouldThrottle(bool value) => _i1.ColumnValue(
    table.shouldThrottle,
    value,
  );

  _i1.ColumnValue<String, String> throttleReason(String? value) =>
      _i1.ColumnValue(
        table.throttleReason,
        value,
      );

  _i1.ColumnValue<int, int> currentThrottleDelay(int value) => _i1.ColumnValue(
    table.currentThrottleDelay,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> lastAnalyzedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.lastAnalyzedAt,
        value,
      );

  _i1.ColumnValue<int, int> analysisCount(int value) => _i1.ColumnValue(
    table.analysisCount,
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

class CustomerUsagePatternTable extends _i1.Table<_i1.UuidValue> {
  CustomerUsagePatternTable({super.tableRelation})
    : super(tableName: 'customer_usage_patterns') {
    updateTable = CustomerUsagePatternUpdateTable(this);
    userId = _i1.ColumnUuid(
      'userId',
      this,
    );
    averageDailyMessages = _i1.ColumnDouble(
      'averageDailyMessages',
      this,
      hasDefault: true,
    );
    averageDailyToolCalls = _i1.ColumnDouble(
      'averageDailyToolCalls',
      this,
      hasDefault: true,
    );
    peakUsageHour = _i1.ColumnInt(
      'peakUsageHour',
      this,
    );
    usageClass = _i1.ColumnEnum(
      'usageClass',
      this,
      _i1.EnumSerialization.byName,
    );
    isAbuser = _i1.ColumnBool(
      'isAbuser',
      this,
      hasDefault: true,
    );
    abuseScore = _i1.ColumnDouble(
      'abuseScore',
      this,
      hasDefault: true,
    );
    toolSuccessRate = _i1.ColumnDouble(
      'toolSuccessRate',
      this,
      hasDefault: true,
    );
    averageToolExecutionTime = _i1.ColumnDouble(
      'averageToolExecutionTime',
      this,
      hasDefault: true,
    );
    averageConversationLength = _i1.ColumnDouble(
      'averageConversationLength',
      this,
      hasDefault: true,
    );
    repetitiveQueryScore = _i1.ColumnDouble(
      'repetitiveQueryScore',
      this,
      hasDefault: true,
    );
    shouldThrottle = _i1.ColumnBool(
      'shouldThrottle',
      this,
      hasDefault: true,
    );
    throttleReason = _i1.ColumnString(
      'throttleReason',
      this,
    );
    currentThrottleDelay = _i1.ColumnInt(
      'currentThrottleDelay',
      this,
      hasDefault: true,
    );
    lastAnalyzedAt = _i1.ColumnDateTime(
      'lastAnalyzedAt',
      this,
    );
    analysisCount = _i1.ColumnInt(
      'analysisCount',
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

  late final CustomerUsagePatternUpdateTable updateTable;

  late final _i1.ColumnUuid userId;

  late final _i1.ColumnDouble averageDailyMessages;

  late final _i1.ColumnDouble averageDailyToolCalls;

  late final _i1.ColumnInt peakUsageHour;

  late final _i1.ColumnEnum<_i2.UsageClass> usageClass;

  late final _i1.ColumnBool isAbuser;

  late final _i1.ColumnDouble abuseScore;

  late final _i1.ColumnDouble toolSuccessRate;

  late final _i1.ColumnDouble averageToolExecutionTime;

  late final _i1.ColumnDouble averageConversationLength;

  late final _i1.ColumnDouble repetitiveQueryScore;

  late final _i1.ColumnBool shouldThrottle;

  late final _i1.ColumnString throttleReason;

  late final _i1.ColumnInt currentThrottleDelay;

  late final _i1.ColumnDateTime lastAnalyzedAt;

  late final _i1.ColumnInt analysisCount;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  @override
  List<_i1.Column> get columns => [
    id,
    userId,
    averageDailyMessages,
    averageDailyToolCalls,
    peakUsageHour,
    usageClass,
    isAbuser,
    abuseScore,
    toolSuccessRate,
    averageToolExecutionTime,
    averageConversationLength,
    repetitiveQueryScore,
    shouldThrottle,
    throttleReason,
    currentThrottleDelay,
    lastAnalyzedAt,
    analysisCount,
    createdAt,
    updatedAt,
  ];
}

class CustomerUsagePatternInclude extends _i1.IncludeObject {
  CustomerUsagePatternInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<_i1.UuidValue> get table => CustomerUsagePattern.t;
}

class CustomerUsagePatternIncludeList extends _i1.IncludeList {
  CustomerUsagePatternIncludeList._({
    _i1.WhereExpressionBuilder<CustomerUsagePatternTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(CustomerUsagePattern.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue> get table => CustomerUsagePattern.t;
}

class CustomerUsagePatternRepository {
  const CustomerUsagePatternRepository._();

  /// Returns a list of [CustomerUsagePattern]s matching the given query parameters.
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
  Future<List<CustomerUsagePattern>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CustomerUsagePatternTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CustomerUsagePatternTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CustomerUsagePatternTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<CustomerUsagePattern>(
      where: where?.call(CustomerUsagePattern.t),
      orderBy: orderBy?.call(CustomerUsagePattern.t),
      orderByList: orderByList?.call(CustomerUsagePattern.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [CustomerUsagePattern] matching the given query parameters.
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
  Future<CustomerUsagePattern?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CustomerUsagePatternTable>? where,
    int? offset,
    _i1.OrderByBuilder<CustomerUsagePatternTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CustomerUsagePatternTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<CustomerUsagePattern>(
      where: where?.call(CustomerUsagePattern.t),
      orderBy: orderBy?.call(CustomerUsagePattern.t),
      orderByList: orderByList?.call(CustomerUsagePattern.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [CustomerUsagePattern] by its [id] or null if no such row exists.
  Future<CustomerUsagePattern?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<CustomerUsagePattern>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [CustomerUsagePattern]s in the list and returns the inserted rows.
  ///
  /// The returned [CustomerUsagePattern]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<CustomerUsagePattern>> insert(
    _i1.Session session,
    List<CustomerUsagePattern> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<CustomerUsagePattern>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [CustomerUsagePattern] and returns the inserted row.
  ///
  /// The returned [CustomerUsagePattern] will have its `id` field set.
  Future<CustomerUsagePattern> insertRow(
    _i1.Session session,
    CustomerUsagePattern row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<CustomerUsagePattern>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [CustomerUsagePattern]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<CustomerUsagePattern>> update(
    _i1.Session session,
    List<CustomerUsagePattern> rows, {
    _i1.ColumnSelections<CustomerUsagePatternTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<CustomerUsagePattern>(
      rows,
      columns: columns?.call(CustomerUsagePattern.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CustomerUsagePattern]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<CustomerUsagePattern> updateRow(
    _i1.Session session,
    CustomerUsagePattern row, {
    _i1.ColumnSelections<CustomerUsagePatternTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<CustomerUsagePattern>(
      row,
      columns: columns?.call(CustomerUsagePattern.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CustomerUsagePattern] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<CustomerUsagePattern?> updateById(
    _i1.Session session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<CustomerUsagePatternUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<CustomerUsagePattern>(
      id,
      columnValues: columnValues(CustomerUsagePattern.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [CustomerUsagePattern]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<CustomerUsagePattern>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<CustomerUsagePatternUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<CustomerUsagePatternTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CustomerUsagePatternTable>? orderBy,
    _i1.OrderByListBuilder<CustomerUsagePatternTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<CustomerUsagePattern>(
      columnValues: columnValues(CustomerUsagePattern.t.updateTable),
      where: where(CustomerUsagePattern.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CustomerUsagePattern.t),
      orderByList: orderByList?.call(CustomerUsagePattern.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [CustomerUsagePattern]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<CustomerUsagePattern>> delete(
    _i1.Session session,
    List<CustomerUsagePattern> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<CustomerUsagePattern>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [CustomerUsagePattern].
  Future<CustomerUsagePattern> deleteRow(
    _i1.Session session,
    CustomerUsagePattern row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<CustomerUsagePattern>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<CustomerUsagePattern>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<CustomerUsagePatternTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<CustomerUsagePattern>(
      where: where(CustomerUsagePattern.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CustomerUsagePatternTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<CustomerUsagePattern>(
      where: where?.call(CustomerUsagePattern.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
