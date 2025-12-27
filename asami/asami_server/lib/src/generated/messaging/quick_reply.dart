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
import '../messaging/platfom_type.dart' as _i3;

abstract class QuickReply
    implements _i1.TableRow<_i1.UuidValue>, _i1.ProtocolSerialization {
  QuickReply._({
    _i1.UuidValue? id,
    required this.intent,
    required this.userType,
    required this.platform,
    required this.title,
    required this.payload,
    this.description,
    this.iconUrl,
    int? displayOrder,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : id = id ?? _i1.Uuid().v4obj(),
       displayOrder = displayOrder ?? 0,
       isActive = isActive ?? true,
       createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory QuickReply({
    _i1.UuidValue? id,
    required String intent,
    required _i2.UserType userType,
    required _i3.PlatformType platform,
    required String title,
    required String payload,
    String? description,
    String? iconUrl,
    int? displayOrder,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _QuickReplyImpl;

  factory QuickReply.fromJson(Map<String, dynamic> jsonSerialization) {
    return QuickReply(
      id: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      intent: jsonSerialization['intent'] as String,
      userType: _i2.UserType.fromJson(
        (jsonSerialization['userType'] as String),
      ),
      platform: _i3.PlatformType.fromJson(
        (jsonSerialization['platform'] as String),
      ),
      title: jsonSerialization['title'] as String,
      payload: jsonSerialization['payload'] as String,
      description: jsonSerialization['description'] as String?,
      iconUrl: jsonSerialization['iconUrl'] as String?,
      displayOrder: jsonSerialization['displayOrder'] as int,
      isActive: jsonSerialization['isActive'] as bool,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
    );
  }

  static final t = QuickReplyTable();

  static const db = QuickReplyRepository._();

  @override
  _i1.UuidValue id;

  String intent;

  _i2.UserType userType;

  _i3.PlatformType platform;

  String title;

  String payload;

  String? description;

  String? iconUrl;

  int displayOrder;

  bool isActive;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _i1.Table<_i1.UuidValue> get table => t;

  /// Returns a shallow copy of this [QuickReply]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  QuickReply copyWith({
    _i1.UuidValue? id,
    String? intent,
    _i2.UserType? userType,
    _i3.PlatformType? platform,
    String? title,
    String? payload,
    String? description,
    String? iconUrl,
    int? displayOrder,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'QuickReply',
      'id': id.toJson(),
      'intent': intent,
      'userType': userType.toJson(),
      'platform': platform.toJson(),
      'title': title,
      'payload': payload,
      if (description != null) 'description': description,
      if (iconUrl != null) 'iconUrl': iconUrl,
      'displayOrder': displayOrder,
      'isActive': isActive,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'QuickReply',
      'id': id.toJson(),
      'intent': intent,
      'userType': userType.toJson(),
      'platform': platform.toJson(),
      'title': title,
      'payload': payload,
      if (description != null) 'description': description,
      if (iconUrl != null) 'iconUrl': iconUrl,
      'displayOrder': displayOrder,
      'isActive': isActive,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static QuickReplyInclude include() {
    return QuickReplyInclude._();
  }

  static QuickReplyIncludeList includeList({
    _i1.WhereExpressionBuilder<QuickReplyTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<QuickReplyTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<QuickReplyTable>? orderByList,
    QuickReplyInclude? include,
  }) {
    return QuickReplyIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(QuickReply.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(QuickReply.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _QuickReplyImpl extends QuickReply {
  _QuickReplyImpl({
    _i1.UuidValue? id,
    required String intent,
    required _i2.UserType userType,
    required _i3.PlatformType platform,
    required String title,
    required String payload,
    String? description,
    String? iconUrl,
    int? displayOrder,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         intent: intent,
         userType: userType,
         platform: platform,
         title: title,
         payload: payload,
         description: description,
         iconUrl: iconUrl,
         displayOrder: displayOrder,
         isActive: isActive,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [QuickReply]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  QuickReply copyWith({
    _i1.UuidValue? id,
    String? intent,
    _i2.UserType? userType,
    _i3.PlatformType? platform,
    String? title,
    String? payload,
    Object? description = _Undefined,
    Object? iconUrl = _Undefined,
    int? displayOrder,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return QuickReply(
      id: id ?? this.id,
      intent: intent ?? this.intent,
      userType: userType ?? this.userType,
      platform: platform ?? this.platform,
      title: title ?? this.title,
      payload: payload ?? this.payload,
      description: description is String? ? description : this.description,
      iconUrl: iconUrl is String? ? iconUrl : this.iconUrl,
      displayOrder: displayOrder ?? this.displayOrder,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class QuickReplyUpdateTable extends _i1.UpdateTable<QuickReplyTable> {
  QuickReplyUpdateTable(super.table);

  _i1.ColumnValue<String, String> intent(String value) => _i1.ColumnValue(
    table.intent,
    value,
  );

  _i1.ColumnValue<_i2.UserType, _i2.UserType> userType(_i2.UserType value) =>
      _i1.ColumnValue(
        table.userType,
        value,
      );

  _i1.ColumnValue<_i3.PlatformType, _i3.PlatformType> platform(
    _i3.PlatformType value,
  ) => _i1.ColumnValue(
    table.platform,
    value,
  );

  _i1.ColumnValue<String, String> title(String value) => _i1.ColumnValue(
    table.title,
    value,
  );

  _i1.ColumnValue<String, String> payload(String value) => _i1.ColumnValue(
    table.payload,
    value,
  );

  _i1.ColumnValue<String, String> description(String? value) => _i1.ColumnValue(
    table.description,
    value,
  );

  _i1.ColumnValue<String, String> iconUrl(String? value) => _i1.ColumnValue(
    table.iconUrl,
    value,
  );

  _i1.ColumnValue<int, int> displayOrder(int value) => _i1.ColumnValue(
    table.displayOrder,
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

class QuickReplyTable extends _i1.Table<_i1.UuidValue> {
  QuickReplyTable({super.tableRelation}) : super(tableName: 'quick_replies') {
    updateTable = QuickReplyUpdateTable(this);
    intent = _i1.ColumnString(
      'intent',
      this,
    );
    userType = _i1.ColumnEnum(
      'userType',
      this,
      _i1.EnumSerialization.byName,
    );
    platform = _i1.ColumnEnum(
      'platform',
      this,
      _i1.EnumSerialization.byName,
    );
    title = _i1.ColumnString(
      'title',
      this,
    );
    payload = _i1.ColumnString(
      'payload',
      this,
    );
    description = _i1.ColumnString(
      'description',
      this,
    );
    iconUrl = _i1.ColumnString(
      'iconUrl',
      this,
    );
    displayOrder = _i1.ColumnInt(
      'displayOrder',
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

  late final QuickReplyUpdateTable updateTable;

  late final _i1.ColumnString intent;

  late final _i1.ColumnEnum<_i2.UserType> userType;

  late final _i1.ColumnEnum<_i3.PlatformType> platform;

  late final _i1.ColumnString title;

  late final _i1.ColumnString payload;

  late final _i1.ColumnString description;

  late final _i1.ColumnString iconUrl;

  late final _i1.ColumnInt displayOrder;

  late final _i1.ColumnBool isActive;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  @override
  List<_i1.Column> get columns => [
    id,
    intent,
    userType,
    platform,
    title,
    payload,
    description,
    iconUrl,
    displayOrder,
    isActive,
    createdAt,
    updatedAt,
  ];
}

class QuickReplyInclude extends _i1.IncludeObject {
  QuickReplyInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<_i1.UuidValue> get table => QuickReply.t;
}

class QuickReplyIncludeList extends _i1.IncludeList {
  QuickReplyIncludeList._({
    _i1.WhereExpressionBuilder<QuickReplyTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(QuickReply.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue> get table => QuickReply.t;
}

class QuickReplyRepository {
  const QuickReplyRepository._();

  /// Returns a list of [QuickReply]s matching the given query parameters.
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
  Future<List<QuickReply>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<QuickReplyTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<QuickReplyTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<QuickReplyTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<QuickReply>(
      where: where?.call(QuickReply.t),
      orderBy: orderBy?.call(QuickReply.t),
      orderByList: orderByList?.call(QuickReply.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [QuickReply] matching the given query parameters.
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
  Future<QuickReply?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<QuickReplyTable>? where,
    int? offset,
    _i1.OrderByBuilder<QuickReplyTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<QuickReplyTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<QuickReply>(
      where: where?.call(QuickReply.t),
      orderBy: orderBy?.call(QuickReply.t),
      orderByList: orderByList?.call(QuickReply.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [QuickReply] by its [id] or null if no such row exists.
  Future<QuickReply?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<QuickReply>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [QuickReply]s in the list and returns the inserted rows.
  ///
  /// The returned [QuickReply]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<QuickReply>> insert(
    _i1.Session session,
    List<QuickReply> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<QuickReply>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [QuickReply] and returns the inserted row.
  ///
  /// The returned [QuickReply] will have its `id` field set.
  Future<QuickReply> insertRow(
    _i1.Session session,
    QuickReply row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<QuickReply>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [QuickReply]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<QuickReply>> update(
    _i1.Session session,
    List<QuickReply> rows, {
    _i1.ColumnSelections<QuickReplyTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<QuickReply>(
      rows,
      columns: columns?.call(QuickReply.t),
      transaction: transaction,
    );
  }

  /// Updates a single [QuickReply]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<QuickReply> updateRow(
    _i1.Session session,
    QuickReply row, {
    _i1.ColumnSelections<QuickReplyTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<QuickReply>(
      row,
      columns: columns?.call(QuickReply.t),
      transaction: transaction,
    );
  }

  /// Updates a single [QuickReply] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<QuickReply?> updateById(
    _i1.Session session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<QuickReplyUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<QuickReply>(
      id,
      columnValues: columnValues(QuickReply.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [QuickReply]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<QuickReply>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<QuickReplyUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<QuickReplyTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<QuickReplyTable>? orderBy,
    _i1.OrderByListBuilder<QuickReplyTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<QuickReply>(
      columnValues: columnValues(QuickReply.t.updateTable),
      where: where(QuickReply.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(QuickReply.t),
      orderByList: orderByList?.call(QuickReply.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [QuickReply]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<QuickReply>> delete(
    _i1.Session session,
    List<QuickReply> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<QuickReply>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [QuickReply].
  Future<QuickReply> deleteRow(
    _i1.Session session,
    QuickReply row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<QuickReply>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<QuickReply>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<QuickReplyTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<QuickReply>(
      where: where(QuickReply.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<QuickReplyTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<QuickReply>(
      where: where?.call(QuickReply.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
