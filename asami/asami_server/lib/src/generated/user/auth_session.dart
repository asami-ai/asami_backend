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

abstract class AuthSession
    implements _i1.TableRow<_i1.UuidValue>, _i1.ProtocolSerialization {
  AuthSession._({
    _i1.UuidValue? id,
    required this.userId,
    this.user,
    required this.platform,
    required this.platformUserId,
    bool? isActive,
    DateTime? loginAt,
    this.logoutAt,
    this.expiresAt,
    this.deviceInfo,
    this.ipAddress,
    this.userAgent,
    this.lastActivityAt,
    DateTime? createdAt,
  })  : id = id ?? _i1.Uuid().v4obj(),
        isActive = isActive ?? true,
        loginAt = loginAt ?? DateTime.now(),
        createdAt = createdAt ?? DateTime.now();

  factory AuthSession({
    _i1.UuidValue? id,
    required _i1.UuidValue userId,
    _i2.User? user,
    required _i3.PlatformType platform,
    required String platformUserId,
    bool? isActive,
    DateTime? loginAt,
    DateTime? logoutAt,
    DateTime? expiresAt,
    String? deviceInfo,
    String? ipAddress,
    String? userAgent,
    DateTime? lastActivityAt,
    DateTime? createdAt,
  }) = _AuthSessionImpl;

  factory AuthSession.fromJson(Map<String, dynamic> jsonSerialization) {
    return AuthSession(
      id: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      userId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      user: jsonSerialization['user'] == null
          ? null
          : _i2.User.fromJson(
              (jsonSerialization['user'] as Map<String, dynamic>)),
      platform:
          _i3.PlatformType.fromJson((jsonSerialization['platform'] as int)),
      platformUserId: jsonSerialization['platformUserId'] as String,
      isActive: jsonSerialization['isActive'] as bool,
      loginAt: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['loginAt']),
      logoutAt: jsonSerialization['logoutAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['logoutAt']),
      expiresAt: jsonSerialization['expiresAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['expiresAt']),
      deviceInfo: jsonSerialization['deviceInfo'] as String?,
      ipAddress: jsonSerialization['ipAddress'] as String?,
      userAgent: jsonSerialization['userAgent'] as String?,
      lastActivityAt: jsonSerialization['lastActivityAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastActivityAt']),
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  static final t = AuthSessionTable();

  static const db = AuthSessionRepository._();

  @override
  _i1.UuidValue id;

  _i1.UuidValue userId;

  _i2.User? user;

  _i3.PlatformType platform;

  String platformUserId;

  bool isActive;

  DateTime loginAt;

  DateTime? logoutAt;

  DateTime? expiresAt;

  String? deviceInfo;

  String? ipAddress;

  String? userAgent;

  DateTime? lastActivityAt;

  DateTime createdAt;

  @override
  _i1.Table<_i1.UuidValue> get table => t;

  /// Returns a shallow copy of this [AuthSession]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  AuthSession copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? userId,
    _i2.User? user,
    _i3.PlatformType? platform,
    String? platformUserId,
    bool? isActive,
    DateTime? loginAt,
    DateTime? logoutAt,
    DateTime? expiresAt,
    String? deviceInfo,
    String? ipAddress,
    String? userAgent,
    DateTime? lastActivityAt,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'userId': userId.toJson(),
      if (user != null) 'user': user?.toJson(),
      'platform': platform.toJson(),
      'platformUserId': platformUserId,
      'isActive': isActive,
      'loginAt': loginAt.toJson(),
      if (logoutAt != null) 'logoutAt': logoutAt?.toJson(),
      if (expiresAt != null) 'expiresAt': expiresAt?.toJson(),
      if (deviceInfo != null) 'deviceInfo': deviceInfo,
      if (ipAddress != null) 'ipAddress': ipAddress,
      if (userAgent != null) 'userAgent': userAgent,
      if (lastActivityAt != null) 'lastActivityAt': lastActivityAt?.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'id': id.toJson(),
      'userId': userId.toJson(),
      if (user != null) 'user': user?.toJsonForProtocol(),
      'platform': platform.toJson(),
      'platformUserId': platformUserId,
      'isActive': isActive,
      'loginAt': loginAt.toJson(),
      if (logoutAt != null) 'logoutAt': logoutAt?.toJson(),
      if (expiresAt != null) 'expiresAt': expiresAt?.toJson(),
      if (deviceInfo != null) 'deviceInfo': deviceInfo,
      if (ipAddress != null) 'ipAddress': ipAddress,
      if (userAgent != null) 'userAgent': userAgent,
      if (lastActivityAt != null) 'lastActivityAt': lastActivityAt?.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  static AuthSessionInclude include({_i2.UserInclude? user}) {
    return AuthSessionInclude._(user: user);
  }

  static AuthSessionIncludeList includeList({
    _i1.WhereExpressionBuilder<AuthSessionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AuthSessionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AuthSessionTable>? orderByList,
    AuthSessionInclude? include,
  }) {
    return AuthSessionIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(AuthSession.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(AuthSession.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AuthSessionImpl extends AuthSession {
  _AuthSessionImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue userId,
    _i2.User? user,
    required _i3.PlatformType platform,
    required String platformUserId,
    bool? isActive,
    DateTime? loginAt,
    DateTime? logoutAt,
    DateTime? expiresAt,
    String? deviceInfo,
    String? ipAddress,
    String? userAgent,
    DateTime? lastActivityAt,
    DateTime? createdAt,
  }) : super._(
          id: id,
          userId: userId,
          user: user,
          platform: platform,
          platformUserId: platformUserId,
          isActive: isActive,
          loginAt: loginAt,
          logoutAt: logoutAt,
          expiresAt: expiresAt,
          deviceInfo: deviceInfo,
          ipAddress: ipAddress,
          userAgent: userAgent,
          lastActivityAt: lastActivityAt,
          createdAt: createdAt,
        );

  /// Returns a shallow copy of this [AuthSession]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  AuthSession copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? userId,
    Object? user = _Undefined,
    _i3.PlatformType? platform,
    String? platformUserId,
    bool? isActive,
    DateTime? loginAt,
    Object? logoutAt = _Undefined,
    Object? expiresAt = _Undefined,
    Object? deviceInfo = _Undefined,
    Object? ipAddress = _Undefined,
    Object? userAgent = _Undefined,
    Object? lastActivityAt = _Undefined,
    DateTime? createdAt,
  }) {
    return AuthSession(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      user: user is _i2.User? ? user : this.user?.copyWith(),
      platform: platform ?? this.platform,
      platformUserId: platformUserId ?? this.platformUserId,
      isActive: isActive ?? this.isActive,
      loginAt: loginAt ?? this.loginAt,
      logoutAt: logoutAt is DateTime? ? logoutAt : this.logoutAt,
      expiresAt: expiresAt is DateTime? ? expiresAt : this.expiresAt,
      deviceInfo: deviceInfo is String? ? deviceInfo : this.deviceInfo,
      ipAddress: ipAddress is String? ? ipAddress : this.ipAddress,
      userAgent: userAgent is String? ? userAgent : this.userAgent,
      lastActivityAt:
          lastActivityAt is DateTime? ? lastActivityAt : this.lastActivityAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class AuthSessionTable extends _i1.Table<_i1.UuidValue> {
  AuthSessionTable({super.tableRelation}) : super(tableName: 'auth_sessions') {
    userId = _i1.ColumnUuid(
      'userId',
      this,
    );
    platform = _i1.ColumnEnum(
      'platform',
      this,
      _i1.EnumSerialization.byIndex,
    );
    platformUserId = _i1.ColumnString(
      'platformUserId',
      this,
    );
    isActive = _i1.ColumnBool(
      'isActive',
      this,
      hasDefault: true,
    );
    loginAt = _i1.ColumnDateTime(
      'loginAt',
      this,
      hasDefault: true,
    );
    logoutAt = _i1.ColumnDateTime(
      'logoutAt',
      this,
    );
    expiresAt = _i1.ColumnDateTime(
      'expiresAt',
      this,
    );
    deviceInfo = _i1.ColumnString(
      'deviceInfo',
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
    lastActivityAt = _i1.ColumnDateTime(
      'lastActivityAt',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
  }

  late final _i1.ColumnUuid userId;

  _i2.UserTable? _user;

  late final _i1.ColumnEnum<_i3.PlatformType> platform;

  late final _i1.ColumnString platformUserId;

  late final _i1.ColumnBool isActive;

  late final _i1.ColumnDateTime loginAt;

  late final _i1.ColumnDateTime logoutAt;

  late final _i1.ColumnDateTime expiresAt;

  late final _i1.ColumnString deviceInfo;

  late final _i1.ColumnString ipAddress;

  late final _i1.ColumnString userAgent;

  late final _i1.ColumnDateTime lastActivityAt;

  late final _i1.ColumnDateTime createdAt;

  _i2.UserTable get user {
    if (_user != null) return _user!;
    _user = _i1.createRelationTable(
      relationFieldName: 'user',
      field: AuthSession.t.userId,
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
        platform,
        platformUserId,
        isActive,
        loginAt,
        logoutAt,
        expiresAt,
        deviceInfo,
        ipAddress,
        userAgent,
        lastActivityAt,
        createdAt,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'user') {
      return user;
    }
    return null;
  }
}

class AuthSessionInclude extends _i1.IncludeObject {
  AuthSessionInclude._({_i2.UserInclude? user}) {
    _user = user;
  }

  _i2.UserInclude? _user;

  @override
  Map<String, _i1.Include?> get includes => {'user': _user};

  @override
  _i1.Table<_i1.UuidValue> get table => AuthSession.t;
}

class AuthSessionIncludeList extends _i1.IncludeList {
  AuthSessionIncludeList._({
    _i1.WhereExpressionBuilder<AuthSessionTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(AuthSession.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue> get table => AuthSession.t;
}

class AuthSessionRepository {
  const AuthSessionRepository._();

  final attachRow = const AuthSessionAttachRowRepository._();

  /// Returns a list of [AuthSession]s matching the given query parameters.
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
  Future<List<AuthSession>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AuthSessionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AuthSessionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AuthSessionTable>? orderByList,
    _i1.Transaction? transaction,
    AuthSessionInclude? include,
  }) async {
    return session.db.find<AuthSession>(
      where: where?.call(AuthSession.t),
      orderBy: orderBy?.call(AuthSession.t),
      orderByList: orderByList?.call(AuthSession.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [AuthSession] matching the given query parameters.
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
  Future<AuthSession?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AuthSessionTable>? where,
    int? offset,
    _i1.OrderByBuilder<AuthSessionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AuthSessionTable>? orderByList,
    _i1.Transaction? transaction,
    AuthSessionInclude? include,
  }) async {
    return session.db.findFirstRow<AuthSession>(
      where: where?.call(AuthSession.t),
      orderBy: orderBy?.call(AuthSession.t),
      orderByList: orderByList?.call(AuthSession.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [AuthSession] by its [id] or null if no such row exists.
  Future<AuthSession?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
    AuthSessionInclude? include,
  }) async {
    return session.db.findById<AuthSession>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [AuthSession]s in the list and returns the inserted rows.
  ///
  /// The returned [AuthSession]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<AuthSession>> insert(
    _i1.Session session,
    List<AuthSession> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<AuthSession>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [AuthSession] and returns the inserted row.
  ///
  /// The returned [AuthSession] will have its `id` field set.
  Future<AuthSession> insertRow(
    _i1.Session session,
    AuthSession row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<AuthSession>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [AuthSession]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<AuthSession>> update(
    _i1.Session session,
    List<AuthSession> rows, {
    _i1.ColumnSelections<AuthSessionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<AuthSession>(
      rows,
      columns: columns?.call(AuthSession.t),
      transaction: transaction,
    );
  }

  /// Updates a single [AuthSession]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<AuthSession> updateRow(
    _i1.Session session,
    AuthSession row, {
    _i1.ColumnSelections<AuthSessionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<AuthSession>(
      row,
      columns: columns?.call(AuthSession.t),
      transaction: transaction,
    );
  }

  /// Deletes all [AuthSession]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<AuthSession>> delete(
    _i1.Session session,
    List<AuthSession> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<AuthSession>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [AuthSession].
  Future<AuthSession> deleteRow(
    _i1.Session session,
    AuthSession row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<AuthSession>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<AuthSession>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<AuthSessionTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<AuthSession>(
      where: where(AuthSession.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AuthSessionTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<AuthSession>(
      where: where?.call(AuthSession.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class AuthSessionAttachRowRepository {
  const AuthSessionAttachRowRepository._();

  /// Creates a relation between the given [AuthSession] and [User]
  /// by setting the [AuthSession]'s foreign key `userId` to refer to the [User].
  Future<void> user(
    _i1.Session session,
    AuthSession authSession,
    _i2.User user, {
    _i1.Transaction? transaction,
  }) async {
    if (authSession.id == null) {
      throw ArgumentError.notNull('authSession.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $authSession = authSession.copyWith(userId: user.id);
    await session.db.updateRow<AuthSession>(
      $authSession,
      columns: [AuthSession.t.userId],
      transaction: transaction,
    );
  }
}
