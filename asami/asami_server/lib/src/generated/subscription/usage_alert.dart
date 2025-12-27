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
import '../subscription/alert_type.dart' as _i3;
import '../subscription/limit_type.dart' as _i4;

abstract class UsageAlert
    implements _i1.TableRow<_i1.UuidValue>, _i1.ProtocolSerialization {
  UsageAlert._({
    _i1.UuidValue? id,
    required this.userId,
    required this.userType,
    required this.alertType,
    required this.limitType,
    required this.thresholdPercentage,
    required this.currentUsage,
    required this.limitValue,
    required this.title,
    required this.message,
    bool? actionRequired,
    this.actionUrl,
    bool? isRead,
    bool? isDismissed,
    this.deliveryMethod,
    this.sentAt,
    DateTime? createdAt,
  }) : id = id ?? _i1.Uuid().v4obj(),
       actionRequired = actionRequired ?? false,
       isRead = isRead ?? false,
       isDismissed = isDismissed ?? false,
       createdAt = createdAt ?? DateTime.now();

  factory UsageAlert({
    _i1.UuidValue? id,
    required _i1.UuidValue userId,
    required _i2.UserType userType,
    required _i3.AlertType alertType,
    required _i4.LimitType limitType,
    required int thresholdPercentage,
    required int currentUsage,
    required int limitValue,
    required String title,
    required String message,
    bool? actionRequired,
    String? actionUrl,
    bool? isRead,
    bool? isDismissed,
    String? deliveryMethod,
    DateTime? sentAt,
    DateTime? createdAt,
  }) = _UsageAlertImpl;

  factory UsageAlert.fromJson(Map<String, dynamic> jsonSerialization) {
    return UsageAlert(
      id: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      userId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      userType: _i2.UserType.fromJson(
        (jsonSerialization['userType'] as String),
      ),
      alertType: _i3.AlertType.fromJson(
        (jsonSerialization['alertType'] as String),
      ),
      limitType: _i4.LimitType.fromJson(
        (jsonSerialization['limitType'] as String),
      ),
      thresholdPercentage: jsonSerialization['thresholdPercentage'] as int,
      currentUsage: jsonSerialization['currentUsage'] as int,
      limitValue: jsonSerialization['limitValue'] as int,
      title: jsonSerialization['title'] as String,
      message: jsonSerialization['message'] as String,
      actionRequired: jsonSerialization['actionRequired'] as bool,
      actionUrl: jsonSerialization['actionUrl'] as String?,
      isRead: jsonSerialization['isRead'] as bool,
      isDismissed: jsonSerialization['isDismissed'] as bool,
      deliveryMethod: jsonSerialization['deliveryMethod'] as String?,
      sentAt: jsonSerialization['sentAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['sentAt']),
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  static final t = UsageAlertTable();

  static const db = UsageAlertRepository._();

  @override
  _i1.UuidValue id;

  _i1.UuidValue userId;

  _i2.UserType userType;

  _i3.AlertType alertType;

  _i4.LimitType limitType;

  int thresholdPercentage;

  int currentUsage;

  int limitValue;

  String title;

  String message;

  bool actionRequired;

  String? actionUrl;

  bool isRead;

  bool isDismissed;

  String? deliveryMethod;

  DateTime? sentAt;

  DateTime createdAt;

  @override
  _i1.Table<_i1.UuidValue> get table => t;

  /// Returns a shallow copy of this [UsageAlert]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UsageAlert copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? userId,
    _i2.UserType? userType,
    _i3.AlertType? alertType,
    _i4.LimitType? limitType,
    int? thresholdPercentage,
    int? currentUsage,
    int? limitValue,
    String? title,
    String? message,
    bool? actionRequired,
    String? actionUrl,
    bool? isRead,
    bool? isDismissed,
    String? deliveryMethod,
    DateTime? sentAt,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'UsageAlert',
      'id': id.toJson(),
      'userId': userId.toJson(),
      'userType': userType.toJson(),
      'alertType': alertType.toJson(),
      'limitType': limitType.toJson(),
      'thresholdPercentage': thresholdPercentage,
      'currentUsage': currentUsage,
      'limitValue': limitValue,
      'title': title,
      'message': message,
      'actionRequired': actionRequired,
      if (actionUrl != null) 'actionUrl': actionUrl,
      'isRead': isRead,
      'isDismissed': isDismissed,
      if (deliveryMethod != null) 'deliveryMethod': deliveryMethod,
      if (sentAt != null) 'sentAt': sentAt?.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'UsageAlert',
      'id': id.toJson(),
      'userId': userId.toJson(),
      'userType': userType.toJson(),
      'alertType': alertType.toJson(),
      'limitType': limitType.toJson(),
      'thresholdPercentage': thresholdPercentage,
      'currentUsage': currentUsage,
      'limitValue': limitValue,
      'title': title,
      'message': message,
      'actionRequired': actionRequired,
      if (actionUrl != null) 'actionUrl': actionUrl,
      'isRead': isRead,
      'isDismissed': isDismissed,
      if (deliveryMethod != null) 'deliveryMethod': deliveryMethod,
      if (sentAt != null) 'sentAt': sentAt?.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  static UsageAlertInclude include() {
    return UsageAlertInclude._();
  }

  static UsageAlertIncludeList includeList({
    _i1.WhereExpressionBuilder<UsageAlertTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UsageAlertTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UsageAlertTable>? orderByList,
    UsageAlertInclude? include,
  }) {
    return UsageAlertIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(UsageAlert.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(UsageAlert.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UsageAlertImpl extends UsageAlert {
  _UsageAlertImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue userId,
    required _i2.UserType userType,
    required _i3.AlertType alertType,
    required _i4.LimitType limitType,
    required int thresholdPercentage,
    required int currentUsage,
    required int limitValue,
    required String title,
    required String message,
    bool? actionRequired,
    String? actionUrl,
    bool? isRead,
    bool? isDismissed,
    String? deliveryMethod,
    DateTime? sentAt,
    DateTime? createdAt,
  }) : super._(
         id: id,
         userId: userId,
         userType: userType,
         alertType: alertType,
         limitType: limitType,
         thresholdPercentage: thresholdPercentage,
         currentUsage: currentUsage,
         limitValue: limitValue,
         title: title,
         message: message,
         actionRequired: actionRequired,
         actionUrl: actionUrl,
         isRead: isRead,
         isDismissed: isDismissed,
         deliveryMethod: deliveryMethod,
         sentAt: sentAt,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [UsageAlert]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UsageAlert copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? userId,
    _i2.UserType? userType,
    _i3.AlertType? alertType,
    _i4.LimitType? limitType,
    int? thresholdPercentage,
    int? currentUsage,
    int? limitValue,
    String? title,
    String? message,
    bool? actionRequired,
    Object? actionUrl = _Undefined,
    bool? isRead,
    bool? isDismissed,
    Object? deliveryMethod = _Undefined,
    Object? sentAt = _Undefined,
    DateTime? createdAt,
  }) {
    return UsageAlert(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      userType: userType ?? this.userType,
      alertType: alertType ?? this.alertType,
      limitType: limitType ?? this.limitType,
      thresholdPercentage: thresholdPercentage ?? this.thresholdPercentage,
      currentUsage: currentUsage ?? this.currentUsage,
      limitValue: limitValue ?? this.limitValue,
      title: title ?? this.title,
      message: message ?? this.message,
      actionRequired: actionRequired ?? this.actionRequired,
      actionUrl: actionUrl is String? ? actionUrl : this.actionUrl,
      isRead: isRead ?? this.isRead,
      isDismissed: isDismissed ?? this.isDismissed,
      deliveryMethod: deliveryMethod is String?
          ? deliveryMethod
          : this.deliveryMethod,
      sentAt: sentAt is DateTime? ? sentAt : this.sentAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class UsageAlertUpdateTable extends _i1.UpdateTable<UsageAlertTable> {
  UsageAlertUpdateTable(super.table);

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

  _i1.ColumnValue<_i3.AlertType, _i3.AlertType> alertType(
    _i3.AlertType value,
  ) => _i1.ColumnValue(
    table.alertType,
    value,
  );

  _i1.ColumnValue<_i4.LimitType, _i4.LimitType> limitType(
    _i4.LimitType value,
  ) => _i1.ColumnValue(
    table.limitType,
    value,
  );

  _i1.ColumnValue<int, int> thresholdPercentage(int value) => _i1.ColumnValue(
    table.thresholdPercentage,
    value,
  );

  _i1.ColumnValue<int, int> currentUsage(int value) => _i1.ColumnValue(
    table.currentUsage,
    value,
  );

  _i1.ColumnValue<int, int> limitValue(int value) => _i1.ColumnValue(
    table.limitValue,
    value,
  );

  _i1.ColumnValue<String, String> title(String value) => _i1.ColumnValue(
    table.title,
    value,
  );

  _i1.ColumnValue<String, String> message(String value) => _i1.ColumnValue(
    table.message,
    value,
  );

  _i1.ColumnValue<bool, bool> actionRequired(bool value) => _i1.ColumnValue(
    table.actionRequired,
    value,
  );

  _i1.ColumnValue<String, String> actionUrl(String? value) => _i1.ColumnValue(
    table.actionUrl,
    value,
  );

  _i1.ColumnValue<bool, bool> isRead(bool value) => _i1.ColumnValue(
    table.isRead,
    value,
  );

  _i1.ColumnValue<bool, bool> isDismissed(bool value) => _i1.ColumnValue(
    table.isDismissed,
    value,
  );

  _i1.ColumnValue<String, String> deliveryMethod(String? value) =>
      _i1.ColumnValue(
        table.deliveryMethod,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> sentAt(DateTime? value) =>
      _i1.ColumnValue(
        table.sentAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );
}

class UsageAlertTable extends _i1.Table<_i1.UuidValue> {
  UsageAlertTable({super.tableRelation}) : super(tableName: 'usage_alerts') {
    updateTable = UsageAlertUpdateTable(this);
    userId = _i1.ColumnUuid(
      'userId',
      this,
    );
    userType = _i1.ColumnEnum(
      'userType',
      this,
      _i1.EnumSerialization.byName,
    );
    alertType = _i1.ColumnEnum(
      'alertType',
      this,
      _i1.EnumSerialization.byName,
    );
    limitType = _i1.ColumnEnum(
      'limitType',
      this,
      _i1.EnumSerialization.byName,
    );
    thresholdPercentage = _i1.ColumnInt(
      'thresholdPercentage',
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
    title = _i1.ColumnString(
      'title',
      this,
    );
    message = _i1.ColumnString(
      'message',
      this,
    );
    actionRequired = _i1.ColumnBool(
      'actionRequired',
      this,
      hasDefault: true,
    );
    actionUrl = _i1.ColumnString(
      'actionUrl',
      this,
    );
    isRead = _i1.ColumnBool(
      'isRead',
      this,
      hasDefault: true,
    );
    isDismissed = _i1.ColumnBool(
      'isDismissed',
      this,
      hasDefault: true,
    );
    deliveryMethod = _i1.ColumnString(
      'deliveryMethod',
      this,
    );
    sentAt = _i1.ColumnDateTime(
      'sentAt',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
  }

  late final UsageAlertUpdateTable updateTable;

  late final _i1.ColumnUuid userId;

  late final _i1.ColumnEnum<_i2.UserType> userType;

  late final _i1.ColumnEnum<_i3.AlertType> alertType;

  late final _i1.ColumnEnum<_i4.LimitType> limitType;

  late final _i1.ColumnInt thresholdPercentage;

  late final _i1.ColumnInt currentUsage;

  late final _i1.ColumnInt limitValue;

  late final _i1.ColumnString title;

  late final _i1.ColumnString message;

  late final _i1.ColumnBool actionRequired;

  late final _i1.ColumnString actionUrl;

  late final _i1.ColumnBool isRead;

  late final _i1.ColumnBool isDismissed;

  late final _i1.ColumnString deliveryMethod;

  late final _i1.ColumnDateTime sentAt;

  late final _i1.ColumnDateTime createdAt;

  @override
  List<_i1.Column> get columns => [
    id,
    userId,
    userType,
    alertType,
    limitType,
    thresholdPercentage,
    currentUsage,
    limitValue,
    title,
    message,
    actionRequired,
    actionUrl,
    isRead,
    isDismissed,
    deliveryMethod,
    sentAt,
    createdAt,
  ];
}

class UsageAlertInclude extends _i1.IncludeObject {
  UsageAlertInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<_i1.UuidValue> get table => UsageAlert.t;
}

class UsageAlertIncludeList extends _i1.IncludeList {
  UsageAlertIncludeList._({
    _i1.WhereExpressionBuilder<UsageAlertTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(UsageAlert.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue> get table => UsageAlert.t;
}

class UsageAlertRepository {
  const UsageAlertRepository._();

  /// Returns a list of [UsageAlert]s matching the given query parameters.
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
  Future<List<UsageAlert>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UsageAlertTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UsageAlertTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UsageAlertTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<UsageAlert>(
      where: where?.call(UsageAlert.t),
      orderBy: orderBy?.call(UsageAlert.t),
      orderByList: orderByList?.call(UsageAlert.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [UsageAlert] matching the given query parameters.
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
  Future<UsageAlert?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UsageAlertTable>? where,
    int? offset,
    _i1.OrderByBuilder<UsageAlertTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UsageAlertTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<UsageAlert>(
      where: where?.call(UsageAlert.t),
      orderBy: orderBy?.call(UsageAlert.t),
      orderByList: orderByList?.call(UsageAlert.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [UsageAlert] by its [id] or null if no such row exists.
  Future<UsageAlert?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<UsageAlert>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [UsageAlert]s in the list and returns the inserted rows.
  ///
  /// The returned [UsageAlert]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<UsageAlert>> insert(
    _i1.Session session,
    List<UsageAlert> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<UsageAlert>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [UsageAlert] and returns the inserted row.
  ///
  /// The returned [UsageAlert] will have its `id` field set.
  Future<UsageAlert> insertRow(
    _i1.Session session,
    UsageAlert row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<UsageAlert>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [UsageAlert]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<UsageAlert>> update(
    _i1.Session session,
    List<UsageAlert> rows, {
    _i1.ColumnSelections<UsageAlertTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<UsageAlert>(
      rows,
      columns: columns?.call(UsageAlert.t),
      transaction: transaction,
    );
  }

  /// Updates a single [UsageAlert]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<UsageAlert> updateRow(
    _i1.Session session,
    UsageAlert row, {
    _i1.ColumnSelections<UsageAlertTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<UsageAlert>(
      row,
      columns: columns?.call(UsageAlert.t),
      transaction: transaction,
    );
  }

  /// Updates a single [UsageAlert] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<UsageAlert?> updateById(
    _i1.Session session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<UsageAlertUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<UsageAlert>(
      id,
      columnValues: columnValues(UsageAlert.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [UsageAlert]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<UsageAlert>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<UsageAlertUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<UsageAlertTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UsageAlertTable>? orderBy,
    _i1.OrderByListBuilder<UsageAlertTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<UsageAlert>(
      columnValues: columnValues(UsageAlert.t.updateTable),
      where: where(UsageAlert.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(UsageAlert.t),
      orderByList: orderByList?.call(UsageAlert.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [UsageAlert]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<UsageAlert>> delete(
    _i1.Session session,
    List<UsageAlert> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<UsageAlert>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [UsageAlert].
  Future<UsageAlert> deleteRow(
    _i1.Session session,
    UsageAlert row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<UsageAlert>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<UsageAlert>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<UsageAlertTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<UsageAlert>(
      where: where(UsageAlert.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UsageAlertTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<UsageAlert>(
      where: where?.call(UsageAlert.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
