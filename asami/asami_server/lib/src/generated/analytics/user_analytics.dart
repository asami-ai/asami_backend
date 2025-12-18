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
import '../product/product.dart' as _i3;
import '../user/vendor_profile.dart' as _i4;
import '../messaging/platfom_type.dart' as _i5;
import '../messaging/conversation.dart' as _i6;

abstract class UserActivity
    implements _i1.TableRow<_i1.UuidValue>, _i1.ProtocolSerialization {
  UserActivity._({
    _i1.UuidValue? id,
    required this.userId,
    this.user,
    required this.activityType,
    this.productId,
    this.product,
    this.vendorId,
    this.vendor,
    this.categoryName,
    this.searchQuery,
    required this.platform,
    this.conversationId,
    this.conversation,
    this.latitude,
    this.longitude,
    this.city,
    this.state,
    this.country,
    this.sessionId,
    this.metadata,
    this.durationSeconds,
    DateTime? createdAt,
  })  : id = id ?? _i1.Uuid().v4obj(),
        createdAt = createdAt ?? DateTime.now();

  factory UserActivity({
    _i1.UuidValue? id,
    required _i1.UuidValue userId,
    _i2.User? user,
    required String activityType,
    _i1.UuidValue? productId,
    _i3.Product? product,
    _i1.UuidValue? vendorId,
    _i4.VendorProfile? vendor,
    String? categoryName,
    String? searchQuery,
    required _i5.PlatformType platform,
    _i1.UuidValue? conversationId,
    _i6.Conversation? conversation,
    double? latitude,
    double? longitude,
    String? city,
    String? state,
    String? country,
    String? sessionId,
    String? metadata,
    int? durationSeconds,
    DateTime? createdAt,
  }) = _UserActivityImpl;

  factory UserActivity.fromJson(Map<String, dynamic> jsonSerialization) {
    return UserActivity(
      id: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      userId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      user: jsonSerialization['user'] == null
          ? null
          : _i2.User.fromJson(
              (jsonSerialization['user'] as Map<String, dynamic>)),
      activityType: jsonSerialization['activityType'] as String,
      productId: jsonSerialization['productId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['productId']),
      product: jsonSerialization['product'] == null
          ? null
          : _i3.Product.fromJson(
              (jsonSerialization['product'] as Map<String, dynamic>)),
      vendorId: jsonSerialization['vendorId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['vendorId']),
      vendor: jsonSerialization['vendor'] == null
          ? null
          : _i4.VendorProfile.fromJson(
              (jsonSerialization['vendor'] as Map<String, dynamic>)),
      categoryName: jsonSerialization['categoryName'] as String?,
      searchQuery: jsonSerialization['searchQuery'] as String?,
      platform:
          _i5.PlatformType.fromJson((jsonSerialization['platform'] as int)),
      conversationId: jsonSerialization['conversationId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(
              jsonSerialization['conversationId']),
      conversation: jsonSerialization['conversation'] == null
          ? null
          : _i6.Conversation.fromJson(
              (jsonSerialization['conversation'] as Map<String, dynamic>)),
      latitude: (jsonSerialization['latitude'] as num?)?.toDouble(),
      longitude: (jsonSerialization['longitude'] as num?)?.toDouble(),
      city: jsonSerialization['city'] as String?,
      state: jsonSerialization['state'] as String?,
      country: jsonSerialization['country'] as String?,
      sessionId: jsonSerialization['sessionId'] as String?,
      metadata: jsonSerialization['metadata'] as String?,
      durationSeconds: jsonSerialization['durationSeconds'] as int?,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  static final t = UserActivityTable();

  static const db = UserActivityRepository._();

  @override
  _i1.UuidValue id;

  _i1.UuidValue userId;

  _i2.User? user;

  String activityType;

  _i1.UuidValue? productId;

  _i3.Product? product;

  _i1.UuidValue? vendorId;

  _i4.VendorProfile? vendor;

  String? categoryName;

  String? searchQuery;

  _i5.PlatformType platform;

  _i1.UuidValue? conversationId;

  _i6.Conversation? conversation;

  double? latitude;

  double? longitude;

  String? city;

  String? state;

  String? country;

  String? sessionId;

  String? metadata;

  int? durationSeconds;

  DateTime createdAt;

  @override
  _i1.Table<_i1.UuidValue> get table => t;

  /// Returns a shallow copy of this [UserActivity]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UserActivity copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? userId,
    _i2.User? user,
    String? activityType,
    _i1.UuidValue? productId,
    _i3.Product? product,
    _i1.UuidValue? vendorId,
    _i4.VendorProfile? vendor,
    String? categoryName,
    String? searchQuery,
    _i5.PlatformType? platform,
    _i1.UuidValue? conversationId,
    _i6.Conversation? conversation,
    double? latitude,
    double? longitude,
    String? city,
    String? state,
    String? country,
    String? sessionId,
    String? metadata,
    int? durationSeconds,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'userId': userId.toJson(),
      if (user != null) 'user': user?.toJson(),
      'activityType': activityType,
      if (productId != null) 'productId': productId?.toJson(),
      if (product != null) 'product': product?.toJson(),
      if (vendorId != null) 'vendorId': vendorId?.toJson(),
      if (vendor != null) 'vendor': vendor?.toJson(),
      if (categoryName != null) 'categoryName': categoryName,
      if (searchQuery != null) 'searchQuery': searchQuery,
      'platform': platform.toJson(),
      if (conversationId != null) 'conversationId': conversationId?.toJson(),
      if (conversation != null) 'conversation': conversation?.toJson(),
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (city != null) 'city': city,
      if (state != null) 'state': state,
      if (country != null) 'country': country,
      if (sessionId != null) 'sessionId': sessionId,
      if (metadata != null) 'metadata': metadata,
      if (durationSeconds != null) 'durationSeconds': durationSeconds,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'id': id.toJson(),
      'userId': userId.toJson(),
      if (user != null) 'user': user?.toJsonForProtocol(),
      'activityType': activityType,
      if (productId != null) 'productId': productId?.toJson(),
      if (product != null) 'product': product?.toJsonForProtocol(),
      if (vendorId != null) 'vendorId': vendorId?.toJson(),
      if (vendor != null) 'vendor': vendor?.toJsonForProtocol(),
      if (categoryName != null) 'categoryName': categoryName,
      if (searchQuery != null) 'searchQuery': searchQuery,
      'platform': platform.toJson(),
      if (conversationId != null) 'conversationId': conversationId?.toJson(),
      if (conversation != null)
        'conversation': conversation?.toJsonForProtocol(),
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (city != null) 'city': city,
      if (state != null) 'state': state,
      if (country != null) 'country': country,
      if (sessionId != null) 'sessionId': sessionId,
      if (metadata != null) 'metadata': metadata,
      if (durationSeconds != null) 'durationSeconds': durationSeconds,
      'createdAt': createdAt.toJson(),
    };
  }

  static UserActivityInclude include({
    _i2.UserInclude? user,
    _i3.ProductInclude? product,
    _i4.VendorProfileInclude? vendor,
    _i6.ConversationInclude? conversation,
  }) {
    return UserActivityInclude._(
      user: user,
      product: product,
      vendor: vendor,
      conversation: conversation,
    );
  }

  static UserActivityIncludeList includeList({
    _i1.WhereExpressionBuilder<UserActivityTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserActivityTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserActivityTable>? orderByList,
    UserActivityInclude? include,
  }) {
    return UserActivityIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(UserActivity.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(UserActivity.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserActivityImpl extends UserActivity {
  _UserActivityImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue userId,
    _i2.User? user,
    required String activityType,
    _i1.UuidValue? productId,
    _i3.Product? product,
    _i1.UuidValue? vendorId,
    _i4.VendorProfile? vendor,
    String? categoryName,
    String? searchQuery,
    required _i5.PlatformType platform,
    _i1.UuidValue? conversationId,
    _i6.Conversation? conversation,
    double? latitude,
    double? longitude,
    String? city,
    String? state,
    String? country,
    String? sessionId,
    String? metadata,
    int? durationSeconds,
    DateTime? createdAt,
  }) : super._(
          id: id,
          userId: userId,
          user: user,
          activityType: activityType,
          productId: productId,
          product: product,
          vendorId: vendorId,
          vendor: vendor,
          categoryName: categoryName,
          searchQuery: searchQuery,
          platform: platform,
          conversationId: conversationId,
          conversation: conversation,
          latitude: latitude,
          longitude: longitude,
          city: city,
          state: state,
          country: country,
          sessionId: sessionId,
          metadata: metadata,
          durationSeconds: durationSeconds,
          createdAt: createdAt,
        );

  /// Returns a shallow copy of this [UserActivity]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UserActivity copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? userId,
    Object? user = _Undefined,
    String? activityType,
    Object? productId = _Undefined,
    Object? product = _Undefined,
    Object? vendorId = _Undefined,
    Object? vendor = _Undefined,
    Object? categoryName = _Undefined,
    Object? searchQuery = _Undefined,
    _i5.PlatformType? platform,
    Object? conversationId = _Undefined,
    Object? conversation = _Undefined,
    Object? latitude = _Undefined,
    Object? longitude = _Undefined,
    Object? city = _Undefined,
    Object? state = _Undefined,
    Object? country = _Undefined,
    Object? sessionId = _Undefined,
    Object? metadata = _Undefined,
    Object? durationSeconds = _Undefined,
    DateTime? createdAt,
  }) {
    return UserActivity(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      user: user is _i2.User? ? user : this.user?.copyWith(),
      activityType: activityType ?? this.activityType,
      productId: productId is _i1.UuidValue? ? productId : this.productId,
      product: product is _i3.Product? ? product : this.product?.copyWith(),
      vendorId: vendorId is _i1.UuidValue? ? vendorId : this.vendorId,
      vendor: vendor is _i4.VendorProfile? ? vendor : this.vendor?.copyWith(),
      categoryName: categoryName is String? ? categoryName : this.categoryName,
      searchQuery: searchQuery is String? ? searchQuery : this.searchQuery,
      platform: platform ?? this.platform,
      conversationId: conversationId is _i1.UuidValue?
          ? conversationId
          : this.conversationId,
      conversation: conversation is _i6.Conversation?
          ? conversation
          : this.conversation?.copyWith(),
      latitude: latitude is double? ? latitude : this.latitude,
      longitude: longitude is double? ? longitude : this.longitude,
      city: city is String? ? city : this.city,
      state: state is String? ? state : this.state,
      country: country is String? ? country : this.country,
      sessionId: sessionId is String? ? sessionId : this.sessionId,
      metadata: metadata is String? ? metadata : this.metadata,
      durationSeconds:
          durationSeconds is int? ? durationSeconds : this.durationSeconds,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class UserActivityTable extends _i1.Table<_i1.UuidValue> {
  UserActivityTable({super.tableRelation}) : super(tableName: 'user_activity') {
    userId = _i1.ColumnUuid(
      'userId',
      this,
    );
    activityType = _i1.ColumnString(
      'activityType',
      this,
    );
    productId = _i1.ColumnUuid(
      'productId',
      this,
    );
    vendorId = _i1.ColumnUuid(
      'vendorId',
      this,
    );
    categoryName = _i1.ColumnString(
      'categoryName',
      this,
    );
    searchQuery = _i1.ColumnString(
      'searchQuery',
      this,
    );
    platform = _i1.ColumnEnum(
      'platform',
      this,
      _i1.EnumSerialization.byIndex,
    );
    conversationId = _i1.ColumnUuid(
      'conversationId',
      this,
    );
    latitude = _i1.ColumnDouble(
      'latitude',
      this,
    );
    longitude = _i1.ColumnDouble(
      'longitude',
      this,
    );
    city = _i1.ColumnString(
      'city',
      this,
    );
    state = _i1.ColumnString(
      'state',
      this,
    );
    country = _i1.ColumnString(
      'country',
      this,
    );
    sessionId = _i1.ColumnString(
      'sessionId',
      this,
    );
    metadata = _i1.ColumnString(
      'metadata',
      this,
    );
    durationSeconds = _i1.ColumnInt(
      'durationSeconds',
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

  late final _i1.ColumnString activityType;

  late final _i1.ColumnUuid productId;

  _i3.ProductTable? _product;

  late final _i1.ColumnUuid vendorId;

  _i4.VendorProfileTable? _vendor;

  late final _i1.ColumnString categoryName;

  late final _i1.ColumnString searchQuery;

  late final _i1.ColumnEnum<_i5.PlatformType> platform;

  late final _i1.ColumnUuid conversationId;

  _i6.ConversationTable? _conversation;

  late final _i1.ColumnDouble latitude;

  late final _i1.ColumnDouble longitude;

  late final _i1.ColumnString city;

  late final _i1.ColumnString state;

  late final _i1.ColumnString country;

  late final _i1.ColumnString sessionId;

  late final _i1.ColumnString metadata;

  late final _i1.ColumnInt durationSeconds;

  late final _i1.ColumnDateTime createdAt;

  _i2.UserTable get user {
    if (_user != null) return _user!;
    _user = _i1.createRelationTable(
      relationFieldName: 'user',
      field: UserActivity.t.userId,
      foreignField: _i2.User.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserTable(tableRelation: foreignTableRelation),
    );
    return _user!;
  }

  _i3.ProductTable get product {
    if (_product != null) return _product!;
    _product = _i1.createRelationTable(
      relationFieldName: 'product',
      field: UserActivity.t.productId,
      foreignField: _i3.Product.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.ProductTable(tableRelation: foreignTableRelation),
    );
    return _product!;
  }

  _i4.VendorProfileTable get vendor {
    if (_vendor != null) return _vendor!;
    _vendor = _i1.createRelationTable(
      relationFieldName: 'vendor',
      field: UserActivity.t.vendorId,
      foreignField: _i4.VendorProfile.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.VendorProfileTable(tableRelation: foreignTableRelation),
    );
    return _vendor!;
  }

  _i6.ConversationTable get conversation {
    if (_conversation != null) return _conversation!;
    _conversation = _i1.createRelationTable(
      relationFieldName: 'conversation',
      field: UserActivity.t.conversationId,
      foreignField: _i6.Conversation.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i6.ConversationTable(tableRelation: foreignTableRelation),
    );
    return _conversation!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        userId,
        activityType,
        productId,
        vendorId,
        categoryName,
        searchQuery,
        platform,
        conversationId,
        latitude,
        longitude,
        city,
        state,
        country,
        sessionId,
        metadata,
        durationSeconds,
        createdAt,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'user') {
      return user;
    }
    if (relationField == 'product') {
      return product;
    }
    if (relationField == 'vendor') {
      return vendor;
    }
    if (relationField == 'conversation') {
      return conversation;
    }
    return null;
  }
}

class UserActivityInclude extends _i1.IncludeObject {
  UserActivityInclude._({
    _i2.UserInclude? user,
    _i3.ProductInclude? product,
    _i4.VendorProfileInclude? vendor,
    _i6.ConversationInclude? conversation,
  }) {
    _user = user;
    _product = product;
    _vendor = vendor;
    _conversation = conversation;
  }

  _i2.UserInclude? _user;

  _i3.ProductInclude? _product;

  _i4.VendorProfileInclude? _vendor;

  _i6.ConversationInclude? _conversation;

  @override
  Map<String, _i1.Include?> get includes => {
        'user': _user,
        'product': _product,
        'vendor': _vendor,
        'conversation': _conversation,
      };

  @override
  _i1.Table<_i1.UuidValue> get table => UserActivity.t;
}

class UserActivityIncludeList extends _i1.IncludeList {
  UserActivityIncludeList._({
    _i1.WhereExpressionBuilder<UserActivityTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(UserActivity.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue> get table => UserActivity.t;
}

class UserActivityRepository {
  const UserActivityRepository._();

  final attachRow = const UserActivityAttachRowRepository._();

  final detachRow = const UserActivityDetachRowRepository._();

  /// Returns a list of [UserActivity]s matching the given query parameters.
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
  Future<List<UserActivity>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserActivityTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserActivityTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserActivityTable>? orderByList,
    _i1.Transaction? transaction,
    UserActivityInclude? include,
  }) async {
    return session.db.find<UserActivity>(
      where: where?.call(UserActivity.t),
      orderBy: orderBy?.call(UserActivity.t),
      orderByList: orderByList?.call(UserActivity.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [UserActivity] matching the given query parameters.
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
  Future<UserActivity?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserActivityTable>? where,
    int? offset,
    _i1.OrderByBuilder<UserActivityTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserActivityTable>? orderByList,
    _i1.Transaction? transaction,
    UserActivityInclude? include,
  }) async {
    return session.db.findFirstRow<UserActivity>(
      where: where?.call(UserActivity.t),
      orderBy: orderBy?.call(UserActivity.t),
      orderByList: orderByList?.call(UserActivity.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [UserActivity] by its [id] or null if no such row exists.
  Future<UserActivity?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
    UserActivityInclude? include,
  }) async {
    return session.db.findById<UserActivity>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [UserActivity]s in the list and returns the inserted rows.
  ///
  /// The returned [UserActivity]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<UserActivity>> insert(
    _i1.Session session,
    List<UserActivity> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<UserActivity>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [UserActivity] and returns the inserted row.
  ///
  /// The returned [UserActivity] will have its `id` field set.
  Future<UserActivity> insertRow(
    _i1.Session session,
    UserActivity row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<UserActivity>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [UserActivity]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<UserActivity>> update(
    _i1.Session session,
    List<UserActivity> rows, {
    _i1.ColumnSelections<UserActivityTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<UserActivity>(
      rows,
      columns: columns?.call(UserActivity.t),
      transaction: transaction,
    );
  }

  /// Updates a single [UserActivity]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<UserActivity> updateRow(
    _i1.Session session,
    UserActivity row, {
    _i1.ColumnSelections<UserActivityTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<UserActivity>(
      row,
      columns: columns?.call(UserActivity.t),
      transaction: transaction,
    );
  }

  /// Deletes all [UserActivity]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<UserActivity>> delete(
    _i1.Session session,
    List<UserActivity> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<UserActivity>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [UserActivity].
  Future<UserActivity> deleteRow(
    _i1.Session session,
    UserActivity row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<UserActivity>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<UserActivity>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<UserActivityTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<UserActivity>(
      where: where(UserActivity.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserActivityTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<UserActivity>(
      where: where?.call(UserActivity.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class UserActivityAttachRowRepository {
  const UserActivityAttachRowRepository._();

  /// Creates a relation between the given [UserActivity] and [User]
  /// by setting the [UserActivity]'s foreign key `userId` to refer to the [User].
  Future<void> user(
    _i1.Session session,
    UserActivity userActivity,
    _i2.User user, {
    _i1.Transaction? transaction,
  }) async {
    if (userActivity.id == null) {
      throw ArgumentError.notNull('userActivity.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $userActivity = userActivity.copyWith(userId: user.id);
    await session.db.updateRow<UserActivity>(
      $userActivity,
      columns: [UserActivity.t.userId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [UserActivity] and [Product]
  /// by setting the [UserActivity]'s foreign key `productId` to refer to the [Product].
  Future<void> product(
    _i1.Session session,
    UserActivity userActivity,
    _i3.Product product, {
    _i1.Transaction? transaction,
  }) async {
    if (userActivity.id == null) {
      throw ArgumentError.notNull('userActivity.id');
    }
    if (product.id == null) {
      throw ArgumentError.notNull('product.id');
    }

    var $userActivity = userActivity.copyWith(productId: product.id);
    await session.db.updateRow<UserActivity>(
      $userActivity,
      columns: [UserActivity.t.productId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [UserActivity] and [VendorProfile]
  /// by setting the [UserActivity]'s foreign key `vendorId` to refer to the [VendorProfile].
  Future<void> vendor(
    _i1.Session session,
    UserActivity userActivity,
    _i4.VendorProfile vendor, {
    _i1.Transaction? transaction,
  }) async {
    if (userActivity.id == null) {
      throw ArgumentError.notNull('userActivity.id');
    }
    if (vendor.id == null) {
      throw ArgumentError.notNull('vendor.id');
    }

    var $userActivity = userActivity.copyWith(vendorId: vendor.id);
    await session.db.updateRow<UserActivity>(
      $userActivity,
      columns: [UserActivity.t.vendorId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [UserActivity] and [Conversation]
  /// by setting the [UserActivity]'s foreign key `conversationId` to refer to the [Conversation].
  Future<void> conversation(
    _i1.Session session,
    UserActivity userActivity,
    _i6.Conversation conversation, {
    _i1.Transaction? transaction,
  }) async {
    if (userActivity.id == null) {
      throw ArgumentError.notNull('userActivity.id');
    }
    if (conversation.id == null) {
      throw ArgumentError.notNull('conversation.id');
    }

    var $userActivity = userActivity.copyWith(conversationId: conversation.id);
    await session.db.updateRow<UserActivity>(
      $userActivity,
      columns: [UserActivity.t.conversationId],
      transaction: transaction,
    );
  }
}

class UserActivityDetachRowRepository {
  const UserActivityDetachRowRepository._();

  /// Detaches the relation between this [UserActivity] and the [Product] set in `product`
  /// by setting the [UserActivity]'s foreign key `productId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> product(
    _i1.Session session,
    UserActivity useractivity, {
    _i1.Transaction? transaction,
  }) async {
    if (useractivity.id == null) {
      throw ArgumentError.notNull('useractivity.id');
    }

    var $useractivity = useractivity.copyWith(productId: null);
    await session.db.updateRow<UserActivity>(
      $useractivity,
      columns: [UserActivity.t.productId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [UserActivity] and the [VendorProfile] set in `vendor`
  /// by setting the [UserActivity]'s foreign key `vendorId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> vendor(
    _i1.Session session,
    UserActivity useractivity, {
    _i1.Transaction? transaction,
  }) async {
    if (useractivity.id == null) {
      throw ArgumentError.notNull('useractivity.id');
    }

    var $useractivity = useractivity.copyWith(vendorId: null);
    await session.db.updateRow<UserActivity>(
      $useractivity,
      columns: [UserActivity.t.vendorId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [UserActivity] and the [Conversation] set in `conversation`
  /// by setting the [UserActivity]'s foreign key `conversationId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> conversation(
    _i1.Session session,
    UserActivity useractivity, {
    _i1.Transaction? transaction,
  }) async {
    if (useractivity.id == null) {
      throw ArgumentError.notNull('useractivity.id');
    }

    var $useractivity = useractivity.copyWith(conversationId: null);
    await session.db.updateRow<UserActivity>(
      $useractivity,
      columns: [UserActivity.t.conversationId],
      transaction: transaction,
    );
  }
}
