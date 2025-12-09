/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: unnecessary_null_comparison

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../user/user.dart' as _i2;
import '../messaging/platfom_type.dart' as _i3;

abstract class Notification
    implements _i1.TableRow<_i1.UuidValue>, _i1.ProtocolSerialization {
  Notification._({
    _i1.UuidValue? id,
    required this.userId,
    this.user,
    required this.title,
    required this.message,
    required this.type,
    this.platform,
    this.actionUrl,
    this.actionData,
    bool? isSent,
    bool? isDelivered,
    bool? isRead,
    bool? isFailed,
    this.errorMessage,
    int? priority,
    this.scheduledFor,
    DateTime? createdAt,
    this.sentAt,
    this.deliveredAt,
    this.readAt,
  })  : id = id ?? _i1.Uuid().v4obj(),
        isSent = isSent ?? false,
        isDelivered = isDelivered ?? false,
        isRead = isRead ?? false,
        isFailed = isFailed ?? false,
        priority = priority ?? 0,
        createdAt = createdAt ?? DateTime.now();

  factory Notification({
    _i1.UuidValue? id,
    required _i1.UuidValue userId,
    _i2.User? user,
    required String title,
    required String message,
    required String type,
    _i3.PlatformType? platform,
    String? actionUrl,
    String? actionData,
    bool? isSent,
    bool? isDelivered,
    bool? isRead,
    bool? isFailed,
    String? errorMessage,
    int? priority,
    DateTime? scheduledFor,
    DateTime? createdAt,
    DateTime? sentAt,
    DateTime? deliveredAt,
    DateTime? readAt,
  }) = _NotificationImpl;

  factory Notification.fromJson(Map<String, dynamic> jsonSerialization) {
    return Notification(
      id: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      userId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      user: jsonSerialization['user'] == null
          ? null
          : _i2.User.fromJson(
              (jsonSerialization['user'] as Map<String, dynamic>)),
      title: jsonSerialization['title'] as String,
      message: jsonSerialization['message'] as String,
      type: jsonSerialization['type'] as String,
      platform: jsonSerialization['platform'] == null
          ? null
          : _i3.PlatformType.fromJson((jsonSerialization['platform'] as int)),
      actionUrl: jsonSerialization['actionUrl'] as String?,
      actionData: jsonSerialization['actionData'] as String?,
      isSent: jsonSerialization['isSent'] as bool,
      isDelivered: jsonSerialization['isDelivered'] as bool,
      isRead: jsonSerialization['isRead'] as bool,
      isFailed: jsonSerialization['isFailed'] as bool,
      errorMessage: jsonSerialization['errorMessage'] as String?,
      priority: jsonSerialization['priority'] as int,
      scheduledFor: jsonSerialization['scheduledFor'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['scheduledFor']),
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      sentAt: jsonSerialization['sentAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['sentAt']),
      deliveredAt: jsonSerialization['deliveredAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['deliveredAt']),
      readAt: jsonSerialization['readAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['readAt']),
    );
  }

  static final t = NotificationTable();

  static const db = NotificationRepository._();

  @override
  _i1.UuidValue id;

  _i1.UuidValue userId;

  _i2.User? user;

  String title;

  String message;

  String type;

  _i3.PlatformType? platform;

  String? actionUrl;

  String? actionData;

  bool isSent;

  bool isDelivered;

  bool isRead;

  bool isFailed;

  String? errorMessage;

  int priority;

  DateTime? scheduledFor;

  DateTime createdAt;

  DateTime? sentAt;

  DateTime? deliveredAt;

  DateTime? readAt;

  @override
  _i1.Table<_i1.UuidValue> get table => t;

  /// Returns a shallow copy of this [Notification]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Notification copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? userId,
    _i2.User? user,
    String? title,
    String? message,
    String? type,
    _i3.PlatformType? platform,
    String? actionUrl,
    String? actionData,
    bool? isSent,
    bool? isDelivered,
    bool? isRead,
    bool? isFailed,
    String? errorMessage,
    int? priority,
    DateTime? scheduledFor,
    DateTime? createdAt,
    DateTime? sentAt,
    DateTime? deliveredAt,
    DateTime? readAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'userId': userId.toJson(),
      if (user != null) 'user': user?.toJson(),
      'title': title,
      'message': message,
      'type': type,
      if (platform != null) 'platform': platform?.toJson(),
      if (actionUrl != null) 'actionUrl': actionUrl,
      if (actionData != null) 'actionData': actionData,
      'isSent': isSent,
      'isDelivered': isDelivered,
      'isRead': isRead,
      'isFailed': isFailed,
      if (errorMessage != null) 'errorMessage': errorMessage,
      'priority': priority,
      if (scheduledFor != null) 'scheduledFor': scheduledFor?.toJson(),
      'createdAt': createdAt.toJson(),
      if (sentAt != null) 'sentAt': sentAt?.toJson(),
      if (deliveredAt != null) 'deliveredAt': deliveredAt?.toJson(),
      if (readAt != null) 'readAt': readAt?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'id': id.toJson(),
      'userId': userId.toJson(),
      if (user != null) 'user': user?.toJsonForProtocol(),
      'title': title,
      'message': message,
      'type': type,
      if (platform != null) 'platform': platform?.toJson(),
      if (actionUrl != null) 'actionUrl': actionUrl,
      if (actionData != null) 'actionData': actionData,
      'isSent': isSent,
      'isDelivered': isDelivered,
      'isRead': isRead,
      'isFailed': isFailed,
      if (errorMessage != null) 'errorMessage': errorMessage,
      'priority': priority,
      if (scheduledFor != null) 'scheduledFor': scheduledFor?.toJson(),
      'createdAt': createdAt.toJson(),
      if (sentAt != null) 'sentAt': sentAt?.toJson(),
      if (deliveredAt != null) 'deliveredAt': deliveredAt?.toJson(),
      if (readAt != null) 'readAt': readAt?.toJson(),
    };
  }

  static NotificationInclude include({_i2.UserInclude? user}) {
    return NotificationInclude._(user: user);
  }

  static NotificationIncludeList includeList({
    _i1.WhereExpressionBuilder<NotificationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<NotificationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<NotificationTable>? orderByList,
    NotificationInclude? include,
  }) {
    return NotificationIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Notification.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Notification.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _NotificationImpl extends Notification {
  _NotificationImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue userId,
    _i2.User? user,
    required String title,
    required String message,
    required String type,
    _i3.PlatformType? platform,
    String? actionUrl,
    String? actionData,
    bool? isSent,
    bool? isDelivered,
    bool? isRead,
    bool? isFailed,
    String? errorMessage,
    int? priority,
    DateTime? scheduledFor,
    DateTime? createdAt,
    DateTime? sentAt,
    DateTime? deliveredAt,
    DateTime? readAt,
  }) : super._(
          id: id,
          userId: userId,
          user: user,
          title: title,
          message: message,
          type: type,
          platform: platform,
          actionUrl: actionUrl,
          actionData: actionData,
          isSent: isSent,
          isDelivered: isDelivered,
          isRead: isRead,
          isFailed: isFailed,
          errorMessage: errorMessage,
          priority: priority,
          scheduledFor: scheduledFor,
          createdAt: createdAt,
          sentAt: sentAt,
          deliveredAt: deliveredAt,
          readAt: readAt,
        );

  /// Returns a shallow copy of this [Notification]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Notification copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? userId,
    Object? user = _Undefined,
    String? title,
    String? message,
    String? type,
    Object? platform = _Undefined,
    Object? actionUrl = _Undefined,
    Object? actionData = _Undefined,
    bool? isSent,
    bool? isDelivered,
    bool? isRead,
    bool? isFailed,
    Object? errorMessage = _Undefined,
    int? priority,
    Object? scheduledFor = _Undefined,
    DateTime? createdAt,
    Object? sentAt = _Undefined,
    Object? deliveredAt = _Undefined,
    Object? readAt = _Undefined,
  }) {
    return Notification(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      user: user is _i2.User? ? user : this.user?.copyWith(),
      title: title ?? this.title,
      message: message ?? this.message,
      type: type ?? this.type,
      platform: platform is _i3.PlatformType? ? platform : this.platform,
      actionUrl: actionUrl is String? ? actionUrl : this.actionUrl,
      actionData: actionData is String? ? actionData : this.actionData,
      isSent: isSent ?? this.isSent,
      isDelivered: isDelivered ?? this.isDelivered,
      isRead: isRead ?? this.isRead,
      isFailed: isFailed ?? this.isFailed,
      errorMessage: errorMessage is String? ? errorMessage : this.errorMessage,
      priority: priority ?? this.priority,
      scheduledFor:
          scheduledFor is DateTime? ? scheduledFor : this.scheduledFor,
      createdAt: createdAt ?? this.createdAt,
      sentAt: sentAt is DateTime? ? sentAt : this.sentAt,
      deliveredAt: deliveredAt is DateTime? ? deliveredAt : this.deliveredAt,
      readAt: readAt is DateTime? ? readAt : this.readAt,
    );
  }
}

class NotificationTable extends _i1.Table<_i1.UuidValue> {
  NotificationTable({super.tableRelation}) : super(tableName: 'notifications') {
    userId = _i1.ColumnUuid(
      'userId',
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
    type = _i1.ColumnString(
      'type',
      this,
    );
    platform = _i1.ColumnEnum(
      'platform',
      this,
      _i1.EnumSerialization.byIndex,
    );
    actionUrl = _i1.ColumnString(
      'actionUrl',
      this,
    );
    actionData = _i1.ColumnString(
      'actionData',
      this,
    );
    isSent = _i1.ColumnBool(
      'isSent',
      this,
      hasDefault: true,
    );
    isDelivered = _i1.ColumnBool(
      'isDelivered',
      this,
      hasDefault: true,
    );
    isRead = _i1.ColumnBool(
      'isRead',
      this,
      hasDefault: true,
    );
    isFailed = _i1.ColumnBool(
      'isFailed',
      this,
      hasDefault: true,
    );
    errorMessage = _i1.ColumnString(
      'errorMessage',
      this,
    );
    priority = _i1.ColumnInt(
      'priority',
      this,
      hasDefault: true,
    );
    scheduledFor = _i1.ColumnDateTime(
      'scheduledFor',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
    sentAt = _i1.ColumnDateTime(
      'sentAt',
      this,
    );
    deliveredAt = _i1.ColumnDateTime(
      'deliveredAt',
      this,
    );
    readAt = _i1.ColumnDateTime(
      'readAt',
      this,
    );
  }

  late final _i1.ColumnUuid userId;

  _i2.UserTable? _user;

  late final _i1.ColumnString title;

  late final _i1.ColumnString message;

  late final _i1.ColumnString type;

  late final _i1.ColumnEnum<_i3.PlatformType> platform;

  late final _i1.ColumnString actionUrl;

  late final _i1.ColumnString actionData;

  late final _i1.ColumnBool isSent;

  late final _i1.ColumnBool isDelivered;

  late final _i1.ColumnBool isRead;

  late final _i1.ColumnBool isFailed;

  late final _i1.ColumnString errorMessage;

  late final _i1.ColumnInt priority;

  late final _i1.ColumnDateTime scheduledFor;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime sentAt;

  late final _i1.ColumnDateTime deliveredAt;

  late final _i1.ColumnDateTime readAt;

  _i2.UserTable get user {
    if (_user != null) return _user!;
    _user = _i1.createRelationTable(
      relationFieldName: 'user',
      field: Notification.t.userId,
      foreignField: _i2.User.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserTable(tableRelation: foreignTableRelation),
    );
    return _user!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        userId,
        title,
        message,
        type,
        platform,
        actionUrl,
        actionData,
        isSent,
        isDelivered,
        isRead,
        isFailed,
        errorMessage,
        priority,
        scheduledFor,
        createdAt,
        sentAt,
        deliveredAt,
        readAt,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'user') {
      return user;
    }
    return null;
  }
}

class NotificationInclude extends _i1.IncludeObject {
  NotificationInclude._({_i2.UserInclude? user}) {
    _user = user;
  }

  _i2.UserInclude? _user;

  @override
  Map<String, _i1.Include?> get includes => {'user': _user};

  @override
  _i1.Table<_i1.UuidValue> get table => Notification.t;
}

class NotificationIncludeList extends _i1.IncludeList {
  NotificationIncludeList._({
    _i1.WhereExpressionBuilder<NotificationTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Notification.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue> get table => Notification.t;
}

class NotificationRepository {
  const NotificationRepository._();

  final attachRow = const NotificationAttachRowRepository._();

  /// Returns a list of [Notification]s matching the given query parameters.
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
  Future<List<Notification>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<NotificationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<NotificationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<NotificationTable>? orderByList,
    _i1.Transaction? transaction,
    NotificationInclude? include,
  }) async {
    return session.db.find<Notification>(
      where: where?.call(Notification.t),
      orderBy: orderBy?.call(Notification.t),
      orderByList: orderByList?.call(Notification.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Notification] matching the given query parameters.
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
  Future<Notification?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<NotificationTable>? where,
    int? offset,
    _i1.OrderByBuilder<NotificationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<NotificationTable>? orderByList,
    _i1.Transaction? transaction,
    NotificationInclude? include,
  }) async {
    return session.db.findFirstRow<Notification>(
      where: where?.call(Notification.t),
      orderBy: orderBy?.call(Notification.t),
      orderByList: orderByList?.call(Notification.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Notification] by its [id] or null if no such row exists.
  Future<Notification?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
    NotificationInclude? include,
  }) async {
    return session.db.findById<Notification>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Notification]s in the list and returns the inserted rows.
  ///
  /// The returned [Notification]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Notification>> insert(
    _i1.Session session,
    List<Notification> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Notification>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Notification] and returns the inserted row.
  ///
  /// The returned [Notification] will have its `id` field set.
  Future<Notification> insertRow(
    _i1.Session session,
    Notification row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Notification>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Notification]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Notification>> update(
    _i1.Session session,
    List<Notification> rows, {
    _i1.ColumnSelections<NotificationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Notification>(
      rows,
      columns: columns?.call(Notification.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Notification]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Notification> updateRow(
    _i1.Session session,
    Notification row, {
    _i1.ColumnSelections<NotificationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Notification>(
      row,
      columns: columns?.call(Notification.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Notification]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Notification>> delete(
    _i1.Session session,
    List<Notification> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Notification>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Notification].
  Future<Notification> deleteRow(
    _i1.Session session,
    Notification row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Notification>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Notification>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<NotificationTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Notification>(
      where: where(Notification.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<NotificationTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Notification>(
      where: where?.call(Notification.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class NotificationAttachRowRepository {
  const NotificationAttachRowRepository._();

  /// Creates a relation between the given [Notification] and [User]
  /// by setting the [Notification]'s foreign key `userId` to refer to the [User].
  Future<void> user(
    _i1.Session session,
    Notification notification,
    _i2.User user, {
    _i1.Transaction? transaction,
  }) async {
    if (notification.id == null) {
      throw ArgumentError.notNull('notification.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $notification = notification.copyWith(userId: user.id);
    await session.db.updateRow<Notification>(
      $notification,
      columns: [Notification.t.userId],
      transaction: transaction,
    );
  }
}
