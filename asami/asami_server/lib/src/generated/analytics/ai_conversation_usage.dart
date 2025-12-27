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

abstract class AIConversationUsage
    implements _i1.TableRow<_i1.UuidValue>, _i1.ProtocolSerialization {
  AIConversationUsage._({
    _i1.UuidValue? id,
    required this.userId,
    required this.conversationId,
    int? messageCount,
    int? totalTokens,
    int? inputTokens,
    int? outputTokens,
    int? toolCallsInConversation,
    this.uniqueToolsUsed,
    double? estimatedCost,
    double? averageResponseTime,
    this.userSatisfactionRating,
    required this.date,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : id = id ?? _i1.Uuid().v4obj(),
       messageCount = messageCount ?? 0,
       totalTokens = totalTokens ?? 0,
       inputTokens = inputTokens ?? 0,
       outputTokens = outputTokens ?? 0,
       toolCallsInConversation = toolCallsInConversation ?? 0,
       estimatedCost = estimatedCost ?? 0.0,
       averageResponseTime = averageResponseTime ?? 0.0,
       createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory AIConversationUsage({
    _i1.UuidValue? id,
    required _i1.UuidValue userId,
    required _i1.UuidValue conversationId,
    int? messageCount,
    int? totalTokens,
    int? inputTokens,
    int? outputTokens,
    int? toolCallsInConversation,
    String? uniqueToolsUsed,
    double? estimatedCost,
    double? averageResponseTime,
    double? userSatisfactionRating,
    required DateTime date,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _AIConversationUsageImpl;

  factory AIConversationUsage.fromJson(Map<String, dynamic> jsonSerialization) {
    return AIConversationUsage(
      id: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      userId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      conversationId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['conversationId'],
      ),
      messageCount: jsonSerialization['messageCount'] as int,
      totalTokens: jsonSerialization['totalTokens'] as int,
      inputTokens: jsonSerialization['inputTokens'] as int,
      outputTokens: jsonSerialization['outputTokens'] as int,
      toolCallsInConversation:
          jsonSerialization['toolCallsInConversation'] as int,
      uniqueToolsUsed: jsonSerialization['uniqueToolsUsed'] as String?,
      estimatedCost: (jsonSerialization['estimatedCost'] as num).toDouble(),
      averageResponseTime: (jsonSerialization['averageResponseTime'] as num)
          .toDouble(),
      userSatisfactionRating:
          (jsonSerialization['userSatisfactionRating'] as num?)?.toDouble(),
      date: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['date']),
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
    );
  }

  static final t = AIConversationUsageTable();

  static const db = AIConversationUsageRepository._();

  @override
  _i1.UuidValue id;

  _i1.UuidValue userId;

  _i1.UuidValue conversationId;

  int messageCount;

  int totalTokens;

  int inputTokens;

  int outputTokens;

  int toolCallsInConversation;

  String? uniqueToolsUsed;

  double estimatedCost;

  double averageResponseTime;

  double? userSatisfactionRating;

  DateTime date;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _i1.Table<_i1.UuidValue> get table => t;

  /// Returns a shallow copy of this [AIConversationUsage]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  AIConversationUsage copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? userId,
    _i1.UuidValue? conversationId,
    int? messageCount,
    int? totalTokens,
    int? inputTokens,
    int? outputTokens,
    int? toolCallsInConversation,
    String? uniqueToolsUsed,
    double? estimatedCost,
    double? averageResponseTime,
    double? userSatisfactionRating,
    DateTime? date,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AIConversationUsage',
      'id': id.toJson(),
      'userId': userId.toJson(),
      'conversationId': conversationId.toJson(),
      'messageCount': messageCount,
      'totalTokens': totalTokens,
      'inputTokens': inputTokens,
      'outputTokens': outputTokens,
      'toolCallsInConversation': toolCallsInConversation,
      if (uniqueToolsUsed != null) 'uniqueToolsUsed': uniqueToolsUsed,
      'estimatedCost': estimatedCost,
      'averageResponseTime': averageResponseTime,
      if (userSatisfactionRating != null)
        'userSatisfactionRating': userSatisfactionRating,
      'date': date.toJson(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'AIConversationUsage',
      'id': id.toJson(),
      'userId': userId.toJson(),
      'conversationId': conversationId.toJson(),
      'messageCount': messageCount,
      'totalTokens': totalTokens,
      'inputTokens': inputTokens,
      'outputTokens': outputTokens,
      'toolCallsInConversation': toolCallsInConversation,
      if (uniqueToolsUsed != null) 'uniqueToolsUsed': uniqueToolsUsed,
      'estimatedCost': estimatedCost,
      'averageResponseTime': averageResponseTime,
      if (userSatisfactionRating != null)
        'userSatisfactionRating': userSatisfactionRating,
      'date': date.toJson(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static AIConversationUsageInclude include() {
    return AIConversationUsageInclude._();
  }

  static AIConversationUsageIncludeList includeList({
    _i1.WhereExpressionBuilder<AIConversationUsageTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AIConversationUsageTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AIConversationUsageTable>? orderByList,
    AIConversationUsageInclude? include,
  }) {
    return AIConversationUsageIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(AIConversationUsage.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(AIConversationUsage.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AIConversationUsageImpl extends AIConversationUsage {
  _AIConversationUsageImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue userId,
    required _i1.UuidValue conversationId,
    int? messageCount,
    int? totalTokens,
    int? inputTokens,
    int? outputTokens,
    int? toolCallsInConversation,
    String? uniqueToolsUsed,
    double? estimatedCost,
    double? averageResponseTime,
    double? userSatisfactionRating,
    required DateTime date,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         userId: userId,
         conversationId: conversationId,
         messageCount: messageCount,
         totalTokens: totalTokens,
         inputTokens: inputTokens,
         outputTokens: outputTokens,
         toolCallsInConversation: toolCallsInConversation,
         uniqueToolsUsed: uniqueToolsUsed,
         estimatedCost: estimatedCost,
         averageResponseTime: averageResponseTime,
         userSatisfactionRating: userSatisfactionRating,
         date: date,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [AIConversationUsage]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  AIConversationUsage copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? userId,
    _i1.UuidValue? conversationId,
    int? messageCount,
    int? totalTokens,
    int? inputTokens,
    int? outputTokens,
    int? toolCallsInConversation,
    Object? uniqueToolsUsed = _Undefined,
    double? estimatedCost,
    double? averageResponseTime,
    Object? userSatisfactionRating = _Undefined,
    DateTime? date,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return AIConversationUsage(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      conversationId: conversationId ?? this.conversationId,
      messageCount: messageCount ?? this.messageCount,
      totalTokens: totalTokens ?? this.totalTokens,
      inputTokens: inputTokens ?? this.inputTokens,
      outputTokens: outputTokens ?? this.outputTokens,
      toolCallsInConversation:
          toolCallsInConversation ?? this.toolCallsInConversation,
      uniqueToolsUsed: uniqueToolsUsed is String?
          ? uniqueToolsUsed
          : this.uniqueToolsUsed,
      estimatedCost: estimatedCost ?? this.estimatedCost,
      averageResponseTime: averageResponseTime ?? this.averageResponseTime,
      userSatisfactionRating: userSatisfactionRating is double?
          ? userSatisfactionRating
          : this.userSatisfactionRating,
      date: date ?? this.date,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class AIConversationUsageUpdateTable
    extends _i1.UpdateTable<AIConversationUsageTable> {
  AIConversationUsageUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> userId(_i1.UuidValue value) =>
      _i1.ColumnValue(
        table.userId,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> conversationId(
    _i1.UuidValue value,
  ) => _i1.ColumnValue(
    table.conversationId,
    value,
  );

  _i1.ColumnValue<int, int> messageCount(int value) => _i1.ColumnValue(
    table.messageCount,
    value,
  );

  _i1.ColumnValue<int, int> totalTokens(int value) => _i1.ColumnValue(
    table.totalTokens,
    value,
  );

  _i1.ColumnValue<int, int> inputTokens(int value) => _i1.ColumnValue(
    table.inputTokens,
    value,
  );

  _i1.ColumnValue<int, int> outputTokens(int value) => _i1.ColumnValue(
    table.outputTokens,
    value,
  );

  _i1.ColumnValue<int, int> toolCallsInConversation(int value) =>
      _i1.ColumnValue(
        table.toolCallsInConversation,
        value,
      );

  _i1.ColumnValue<String, String> uniqueToolsUsed(String? value) =>
      _i1.ColumnValue(
        table.uniqueToolsUsed,
        value,
      );

  _i1.ColumnValue<double, double> estimatedCost(double value) =>
      _i1.ColumnValue(
        table.estimatedCost,
        value,
      );

  _i1.ColumnValue<double, double> averageResponseTime(double value) =>
      _i1.ColumnValue(
        table.averageResponseTime,
        value,
      );

  _i1.ColumnValue<double, double> userSatisfactionRating(double? value) =>
      _i1.ColumnValue(
        table.userSatisfactionRating,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> date(DateTime value) => _i1.ColumnValue(
    table.date,
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

class AIConversationUsageTable extends _i1.Table<_i1.UuidValue> {
  AIConversationUsageTable({super.tableRelation})
    : super(tableName: 'ai_conversation_usage') {
    updateTable = AIConversationUsageUpdateTable(this);
    userId = _i1.ColumnUuid(
      'userId',
      this,
    );
    conversationId = _i1.ColumnUuid(
      'conversationId',
      this,
    );
    messageCount = _i1.ColumnInt(
      'messageCount',
      this,
      hasDefault: true,
    );
    totalTokens = _i1.ColumnInt(
      'totalTokens',
      this,
      hasDefault: true,
    );
    inputTokens = _i1.ColumnInt(
      'inputTokens',
      this,
      hasDefault: true,
    );
    outputTokens = _i1.ColumnInt(
      'outputTokens',
      this,
      hasDefault: true,
    );
    toolCallsInConversation = _i1.ColumnInt(
      'toolCallsInConversation',
      this,
      hasDefault: true,
    );
    uniqueToolsUsed = _i1.ColumnString(
      'uniqueToolsUsed',
      this,
    );
    estimatedCost = _i1.ColumnDouble(
      'estimatedCost',
      this,
      hasDefault: true,
    );
    averageResponseTime = _i1.ColumnDouble(
      'averageResponseTime',
      this,
      hasDefault: true,
    );
    userSatisfactionRating = _i1.ColumnDouble(
      'userSatisfactionRating',
      this,
    );
    date = _i1.ColumnDateTime(
      'date',
      this,
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

  late final AIConversationUsageUpdateTable updateTable;

  late final _i1.ColumnUuid userId;

  late final _i1.ColumnUuid conversationId;

  late final _i1.ColumnInt messageCount;

  late final _i1.ColumnInt totalTokens;

  late final _i1.ColumnInt inputTokens;

  late final _i1.ColumnInt outputTokens;

  late final _i1.ColumnInt toolCallsInConversation;

  late final _i1.ColumnString uniqueToolsUsed;

  late final _i1.ColumnDouble estimatedCost;

  late final _i1.ColumnDouble averageResponseTime;

  late final _i1.ColumnDouble userSatisfactionRating;

  late final _i1.ColumnDateTime date;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  @override
  List<_i1.Column> get columns => [
    id,
    userId,
    conversationId,
    messageCount,
    totalTokens,
    inputTokens,
    outputTokens,
    toolCallsInConversation,
    uniqueToolsUsed,
    estimatedCost,
    averageResponseTime,
    userSatisfactionRating,
    date,
    createdAt,
    updatedAt,
  ];
}

class AIConversationUsageInclude extends _i1.IncludeObject {
  AIConversationUsageInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<_i1.UuidValue> get table => AIConversationUsage.t;
}

class AIConversationUsageIncludeList extends _i1.IncludeList {
  AIConversationUsageIncludeList._({
    _i1.WhereExpressionBuilder<AIConversationUsageTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(AIConversationUsage.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue> get table => AIConversationUsage.t;
}

class AIConversationUsageRepository {
  const AIConversationUsageRepository._();

  /// Returns a list of [AIConversationUsage]s matching the given query parameters.
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
  Future<List<AIConversationUsage>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AIConversationUsageTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AIConversationUsageTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AIConversationUsageTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<AIConversationUsage>(
      where: where?.call(AIConversationUsage.t),
      orderBy: orderBy?.call(AIConversationUsage.t),
      orderByList: orderByList?.call(AIConversationUsage.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [AIConversationUsage] matching the given query parameters.
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
  Future<AIConversationUsage?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AIConversationUsageTable>? where,
    int? offset,
    _i1.OrderByBuilder<AIConversationUsageTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AIConversationUsageTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<AIConversationUsage>(
      where: where?.call(AIConversationUsage.t),
      orderBy: orderBy?.call(AIConversationUsage.t),
      orderByList: orderByList?.call(AIConversationUsage.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [AIConversationUsage] by its [id] or null if no such row exists.
  Future<AIConversationUsage?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<AIConversationUsage>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [AIConversationUsage]s in the list and returns the inserted rows.
  ///
  /// The returned [AIConversationUsage]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<AIConversationUsage>> insert(
    _i1.Session session,
    List<AIConversationUsage> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<AIConversationUsage>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [AIConversationUsage] and returns the inserted row.
  ///
  /// The returned [AIConversationUsage] will have its `id` field set.
  Future<AIConversationUsage> insertRow(
    _i1.Session session,
    AIConversationUsage row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<AIConversationUsage>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [AIConversationUsage]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<AIConversationUsage>> update(
    _i1.Session session,
    List<AIConversationUsage> rows, {
    _i1.ColumnSelections<AIConversationUsageTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<AIConversationUsage>(
      rows,
      columns: columns?.call(AIConversationUsage.t),
      transaction: transaction,
    );
  }

  /// Updates a single [AIConversationUsage]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<AIConversationUsage> updateRow(
    _i1.Session session,
    AIConversationUsage row, {
    _i1.ColumnSelections<AIConversationUsageTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<AIConversationUsage>(
      row,
      columns: columns?.call(AIConversationUsage.t),
      transaction: transaction,
    );
  }

  /// Updates a single [AIConversationUsage] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<AIConversationUsage?> updateById(
    _i1.Session session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<AIConversationUsageUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<AIConversationUsage>(
      id,
      columnValues: columnValues(AIConversationUsage.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [AIConversationUsage]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<AIConversationUsage>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<AIConversationUsageUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<AIConversationUsageTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AIConversationUsageTable>? orderBy,
    _i1.OrderByListBuilder<AIConversationUsageTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<AIConversationUsage>(
      columnValues: columnValues(AIConversationUsage.t.updateTable),
      where: where(AIConversationUsage.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(AIConversationUsage.t),
      orderByList: orderByList?.call(AIConversationUsage.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [AIConversationUsage]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<AIConversationUsage>> delete(
    _i1.Session session,
    List<AIConversationUsage> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<AIConversationUsage>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [AIConversationUsage].
  Future<AIConversationUsage> deleteRow(
    _i1.Session session,
    AIConversationUsage row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<AIConversationUsage>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<AIConversationUsage>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<AIConversationUsageTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<AIConversationUsage>(
      where: where(AIConversationUsage.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AIConversationUsageTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<AIConversationUsage>(
      where: where?.call(AIConversationUsage.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
