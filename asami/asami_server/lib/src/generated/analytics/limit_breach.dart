/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../user/user_type.dart' as _i2;
import '../subscription/limit_type.dart' as _i3;
import '../user/subscription_tier.dart' as _i4;
import '../analytics/breach_severity.dart' as _i5;

abstract class LimitBreachLog
    implements _i1.TableRow<_i1.UuidValue>, _i1.ProtocolSerialization {
  LimitBreachLog._({
    _i1.UuidValue? id,
    required this.userId,
    required this.userType,
    required this.limitType,
    required this.attemptedAction,
    required this.currentUsage,
    required this.limitValue,
    this.subscriptionTier,
    this.conversationId,
    required this.actionTaken,
    bool? userNotified,
    required this.severity,
    DateTime? breachedAt,
  })  : id = id ?? _i1.Uuid().v4obj(),
        userNotified = userNotified ?? false,
        breachedAt = breachedAt ?? DateTime.now();

  factory LimitBreachLog({
    _i1.UuidValue? id,
    required _i1.UuidValue userId,
    required _i2.UserType userType,
    required _i3.LimitType limitType,
    required String attemptedAction,
    required int currentUsage,
    required int limitValue,
    _i4.SubscriptionTier? subscriptionTier,
    _i1.UuidValue? conversationId,
    required String actionTaken,
    bool? userNotified,
    required _i5.BreachSeverity severity,
    DateTime? breachedAt,
  }) = _LimitBreachLogImpl;

  factory LimitBreachLog.fromJson(Map<String, dynamic> jsonSerialization) {
    return LimitBreachLog(
      id: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      userId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      userType: _i2.UserType.fromJson((jsonSerialization['userType'] as int)),
      limitType:
          _i3.LimitType.fromJson((jsonSerialization['limitType'] as int)),
      attemptedAction: jsonSerialization['attemptedAction'] as String,
      currentUsage: jsonSerialization['currentUsage'] as int,
      limitValue: jsonSerialization['limitValue'] as int,
      subscriptionTier: jsonSerialization['subscriptionTier'] == null
          ? null
          : _i4.SubscriptionTier.fromJson(
              (jsonSerialization['subscriptionTier'] as int)),
      conversationId: jsonSerialization['conversationId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(
              jsonSerialization['conversationId']),
      actionTaken: jsonSerialization['actionTaken'] as String,
      userNotified: jsonSerialization['userNotified'] as bool,
      severity:
          _i5.BreachSeverity.fromJson((jsonSerialization['severity'] as int)),
      breachedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['breachedAt']),
    );
  }

  static final t = LimitBreachLogTable();

  static const db = LimitBreachLogRepository._();

  @override
  _i1.UuidValue id;

  _i1.UuidValue userId;

  _i2.UserType userType;

  _i3.LimitType limitType;

  String attemptedAction;

  int currentUsage;

  int limitValue;

  _i4.SubscriptionTier? subscriptionTier;

  _i1.UuidValue? conversationId;

  String actionTaken;

  bool userNotified;

  _i5.BreachSeverity severity;

  DateTime breachedAt;

  @override
  _i1.Table<_i1.UuidValue> get table => t;

  /// Returns a shallow copy of this [LimitBreachLog]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  LimitBreachLog copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? userId,
    _i2.UserType? userType,
    _i3.LimitType? limitType,
    String? attemptedAction,
    int? currentUsage,
    int? limitValue,
    _i4.SubscriptionTier? subscriptionTier,
    _i1.UuidValue? conversationId,
    String? actionTaken,
    bool? userNotified,
    _i5.BreachSeverity? severity,
    DateTime? breachedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'userId': userId.toJson(),
      'userType': userType.toJson(),
      'limitType': limitType.toJson(),
      'attemptedAction': attemptedAction,
      'currentUsage': currentUsage,
      'limitValue': limitValue,
      if (subscriptionTier != null)
        'subscriptionTier': subscriptionTier?.toJson(),
      if (conversationId != null) 'conversationId': conversationId?.toJson(),
      'actionTaken': actionTaken,
      'userNotified': userNotified,
      'severity': severity.toJson(),
      'breachedAt': breachedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'id': id.toJson(),
      'userId': userId.toJson(),
      'userType': userType.toJson(),
      'limitType': limitType.toJson(),
      'attemptedAction': attemptedAction,
      'currentUsage': currentUsage,
      'limitValue': limitValue,
      if (subscriptionTier != null)
        'subscriptionTier': subscriptionTier?.toJson(),
      if (conversationId != null) 'conversationId': conversationId?.toJson(),
      'actionTaken': actionTaken,
      'userNotified': userNotified,
      'severity': severity.toJson(),
      'breachedAt': breachedAt.toJson(),
    };
  }

  static LimitBreachLogInclude include() {
    return LimitBreachLogInclude._();
  }

  static LimitBreachLogIncludeList includeList({
    _i1.WhereExpressionBuilder<LimitBreachLogTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<LimitBreachLogTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<LimitBreachLogTable>? orderByList,
    LimitBreachLogInclude? include,
  }) {
    return LimitBreachLogIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(LimitBreachLog.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(LimitBreachLog.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _LimitBreachLogImpl extends LimitBreachLog {
  _LimitBreachLogImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue userId,
    required _i2.UserType userType,
    required _i3.LimitType limitType,
    required String attemptedAction,
    required int currentUsage,
    required int limitValue,
    _i4.SubscriptionTier? subscriptionTier,
    _i1.UuidValue? conversationId,
    required String actionTaken,
    bool? userNotified,
    required _i5.BreachSeverity severity,
    DateTime? breachedAt,
  }) : super._(
          id: id,
          userId: userId,
          userType: userType,
          limitType: limitType,
          attemptedAction: attemptedAction,
          currentUsage: currentUsage,
          limitValue: limitValue,
          subscriptionTier: subscriptionTier,
          conversationId: conversationId,
          actionTaken: actionTaken,
          userNotified: userNotified,
          severity: severity,
          breachedAt: breachedAt,
        );

  /// Returns a shallow copy of this [LimitBreachLog]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  LimitBreachLog copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? userId,
    _i2.UserType? userType,
    _i3.LimitType? limitType,
    String? attemptedAction,
    int? currentUsage,
    int? limitValue,
    Object? subscriptionTier = _Undefined,
    Object? conversationId = _Undefined,
    String? actionTaken,
    bool? userNotified,
    _i5.BreachSeverity? severity,
    DateTime? breachedAt,
  }) {
    return LimitBreachLog(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      userType: userType ?? this.userType,
      limitType: limitType ?? this.limitType,
      attemptedAction: attemptedAction ?? this.attemptedAction,
      currentUsage: currentUsage ?? this.currentUsage,
      limitValue: limitValue ?? this.limitValue,
      subscriptionTier: subscriptionTier is _i4.SubscriptionTier?
          ? subscriptionTier
          : this.subscriptionTier,
      conversationId: conversationId is _i1.UuidValue?
          ? conversationId
          : this.conversationId,
      actionTaken: actionTaken ?? this.actionTaken,
      userNotified: userNotified ?? this.userNotified,
      severity: severity ?? this.severity,
      breachedAt: breachedAt ?? this.breachedAt,
    );
  }
}

class LimitBreachLogTable extends _i1.Table<_i1.UuidValue> {
  LimitBreachLogTable({super.tableRelation})
      : super(tableName: 'limit_breach_logs') {
    userId = _i1.ColumnUuid(
      'userId',
      this,
    );
    userType = _i1.ColumnEnum(
      'userType',
      this,
      _i1.EnumSerialization.byIndex,
    );
    limitType = _i1.ColumnEnum(
      'limitType',
      this,
      _i1.EnumSerialization.byIndex,
    );
    attemptedAction = _i1.ColumnString(
      'attemptedAction',
      this,
    );
    currentUsage = _i1.ColumnInt(
      'currentUsage',
      this,
    );
    limitValue = _i1.ColumnInt(
      'limitValue',
      this,
    );
    subscriptionTier = _i1.ColumnEnum(
      'subscriptionTier',
      this,
      _i1.EnumSerialization.byIndex,
    );
    conversationId = _i1.ColumnUuid(
      'conversationId',
      this,
    );
    actionTaken = _i1.ColumnString(
      'actionTaken',
      this,
    );
    userNotified = _i1.ColumnBool(
      'userNotified',
      this,
      hasDefault: true,
    );
    severity = _i1.ColumnEnum(
      'severity',
      this,
      _i1.EnumSerialization.byIndex,
    );
    breachedAt = _i1.ColumnDateTime(
      'breachedAt',
      this,
      hasDefault: true,
    );
  }

  late final _i1.ColumnUuid userId;

  late final _i1.ColumnEnum<_i2.UserType> userType;

  late final _i1.ColumnEnum<_i3.LimitType> limitType;

  late final _i1.ColumnString attemptedAction;

  late final _i1.ColumnInt currentUsage;

  late final _i1.ColumnInt limitValue;

  late final _i1.ColumnEnum<_i4.SubscriptionTier> subscriptionTier;

  late final _i1.ColumnUuid conversationId;

  late final _i1.ColumnString actionTaken;

  late final _i1.ColumnBool userNotified;

  late final _i1.ColumnEnum<_i5.BreachSeverity> severity;

  late final _i1.ColumnDateTime breachedAt;

  @override
  List<_i1.Column> get columns => [
        id,
        userId,
        userType,
        limitType,
        attemptedAction,
        currentUsage,
        limitValue,
        subscriptionTier,
        conversationId,
        actionTaken,
        userNotified,
        severity,
        breachedAt,
      ];
}

class LimitBreachLogInclude extends _i1.IncludeObject {
  LimitBreachLogInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<_i1.UuidValue> get table => LimitBreachLog.t;
}

class LimitBreachLogIncludeList extends _i1.IncludeList {
  LimitBreachLogIncludeList._({
    _i1.WhereExpressionBuilder<LimitBreachLogTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(LimitBreachLog.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue> get table => LimitBreachLog.t;
}

class LimitBreachLogRepository {
  const LimitBreachLogRepository._();

  /// Returns a list of [LimitBreachLog]s matching the given query parameters.
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
  Future<List<LimitBreachLog>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<LimitBreachLogTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<LimitBreachLogTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<LimitBreachLogTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<LimitBreachLog>(
      where: where?.call(LimitBreachLog.t),
      orderBy: orderBy?.call(LimitBreachLog.t),
      orderByList: orderByList?.call(LimitBreachLog.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [LimitBreachLog] matching the given query parameters.
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
  Future<LimitBreachLog?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<LimitBreachLogTable>? where,
    int? offset,
    _i1.OrderByBuilder<LimitBreachLogTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<LimitBreachLogTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<LimitBreachLog>(
      where: where?.call(LimitBreachLog.t),
      orderBy: orderBy?.call(LimitBreachLog.t),
      orderByList: orderByList?.call(LimitBreachLog.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [LimitBreachLog] by its [id] or null if no such row exists.
  Future<LimitBreachLog?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<LimitBreachLog>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [LimitBreachLog]s in the list and returns the inserted rows.
  ///
  /// The returned [LimitBreachLog]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<LimitBreachLog>> insert(
    _i1.Session session,
    List<LimitBreachLog> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<LimitBreachLog>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [LimitBreachLog] and returns the inserted row.
  ///
  /// The returned [LimitBreachLog] will have its `id` field set.
  Future<LimitBreachLog> insertRow(
    _i1.Session session,
    LimitBreachLog row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<LimitBreachLog>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [LimitBreachLog]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<LimitBreachLog>> update(
    _i1.Session session,
    List<LimitBreachLog> rows, {
    _i1.ColumnSelections<LimitBreachLogTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<LimitBreachLog>(
      rows,
      columns: columns?.call(LimitBreachLog.t),
      transaction: transaction,
    );
  }

  /// Updates a single [LimitBreachLog]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<LimitBreachLog> updateRow(
    _i1.Session session,
    LimitBreachLog row, {
    _i1.ColumnSelections<LimitBreachLogTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<LimitBreachLog>(
      row,
      columns: columns?.call(LimitBreachLog.t),
      transaction: transaction,
    );
  }

  /// Deletes all [LimitBreachLog]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<LimitBreachLog>> delete(
    _i1.Session session,
    List<LimitBreachLog> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<LimitBreachLog>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [LimitBreachLog].
  Future<LimitBreachLog> deleteRow(
    _i1.Session session,
    LimitBreachLog row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<LimitBreachLog>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<LimitBreachLog>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<LimitBreachLogTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<LimitBreachLog>(
      where: where(LimitBreachLog.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<LimitBreachLogTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<LimitBreachLog>(
      where: where?.call(LimitBreachLog.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
