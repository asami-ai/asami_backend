/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member
// ignore_for_file: unnecessary_null_comparison

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../user/user.dart' as _i2;
import 'package:asami_server/src/generated/protocol.dart' as _i3;

abstract class CustomerProfile
    implements _i1.TableRow<_i1.UuidValue>, _i1.ProtocolSerialization {
  CustomerProfile._({
    _i1.UuidValue? id,
    required this.userId,
    this.user,
    this.preferredPaymentMethod,
    this.savedAddresses,
    this.favoriteVendors,
    int? totalOrders,
    double? totalSpent,
    double? averageOrderValue,
    this.lastOrderAt,
    int? wishlistCount,
    int? reviewsGiven,
    double? averageRating,
    this.searchHistory,
    this.viewedProducts,
    this.preferredCategories,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : id = id ?? _i1.Uuid().v4obj(),
       totalOrders = totalOrders ?? 0,
       totalSpent = totalSpent ?? 0.0,
       averageOrderValue = averageOrderValue ?? 0.0,
       wishlistCount = wishlistCount ?? 0,
       reviewsGiven = reviewsGiven ?? 0,
       averageRating = averageRating ?? 0.0,
       createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory CustomerProfile({
    _i1.UuidValue? id,
    required _i1.UuidValue userId,
    _i2.User? user,
    String? preferredPaymentMethod,
    List<String>? savedAddresses,
    List<String>? favoriteVendors,
    int? totalOrders,
    double? totalSpent,
    double? averageOrderValue,
    DateTime? lastOrderAt,
    int? wishlistCount,
    int? reviewsGiven,
    double? averageRating,
    List<String>? searchHistory,
    List<String>? viewedProducts,
    List<String>? preferredCategories,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _CustomerProfileImpl;

  factory CustomerProfile.fromJson(Map<String, dynamic> jsonSerialization) {
    return CustomerProfile(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      userId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      user: jsonSerialization['user'] == null
          ? null
          : _i3.Protocol().deserialize<_i2.User>(jsonSerialization['user']),
      preferredPaymentMethod:
          jsonSerialization['preferredPaymentMethod'] as String?,
      savedAddresses: jsonSerialization['savedAddresses'] == null
          ? null
          : _i3.Protocol().deserialize<List<String>>(
              jsonSerialization['savedAddresses'],
            ),
      favoriteVendors: jsonSerialization['favoriteVendors'] == null
          ? null
          : _i3.Protocol().deserialize<List<String>>(
              jsonSerialization['favoriteVendors'],
            ),
      totalOrders: jsonSerialization['totalOrders'] as int?,
      totalSpent: (jsonSerialization['totalSpent'] as num?)?.toDouble(),
      averageOrderValue: (jsonSerialization['averageOrderValue'] as num?)
          ?.toDouble(),
      lastOrderAt: jsonSerialization['lastOrderAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastOrderAt'],
            ),
      wishlistCount: jsonSerialization['wishlistCount'] as int?,
      reviewsGiven: jsonSerialization['reviewsGiven'] as int?,
      averageRating: (jsonSerialization['averageRating'] as num?)?.toDouble(),
      searchHistory: jsonSerialization['searchHistory'] == null
          ? null
          : _i3.Protocol().deserialize<List<String>>(
              jsonSerialization['searchHistory'],
            ),
      viewedProducts: jsonSerialization['viewedProducts'] == null
          ? null
          : _i3.Protocol().deserialize<List<String>>(
              jsonSerialization['viewedProducts'],
            ),
      preferredCategories: jsonSerialization['preferredCategories'] == null
          ? null
          : _i3.Protocol().deserialize<List<String>>(
              jsonSerialization['preferredCategories'],
            ),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  static final t = CustomerProfileTable();

  static const db = CustomerProfileRepository._();

  @override
  _i1.UuidValue id;

  _i1.UuidValue userId;

  _i2.User? user;

  String? preferredPaymentMethod;

  List<String>? savedAddresses;

  List<String>? favoriteVendors;

  int totalOrders;

  double totalSpent;

  double averageOrderValue;

  DateTime? lastOrderAt;

  int wishlistCount;

  int reviewsGiven;

  double? averageRating;

  List<String>? searchHistory;

  List<String>? viewedProducts;

  List<String>? preferredCategories;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _i1.Table<_i1.UuidValue> get table => t;

  /// Returns a shallow copy of this [CustomerProfile]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CustomerProfile copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? userId,
    _i2.User? user,
    String? preferredPaymentMethod,
    List<String>? savedAddresses,
    List<String>? favoriteVendors,
    int? totalOrders,
    double? totalSpent,
    double? averageOrderValue,
    DateTime? lastOrderAt,
    int? wishlistCount,
    int? reviewsGiven,
    double? averageRating,
    List<String>? searchHistory,
    List<String>? viewedProducts,
    List<String>? preferredCategories,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CustomerProfile',
      'id': id.toJson(),
      'userId': userId.toJson(),
      if (user != null) 'user': user?.toJson(),
      if (preferredPaymentMethod != null)
        'preferredPaymentMethod': preferredPaymentMethod,
      if (savedAddresses != null) 'savedAddresses': savedAddresses?.toJson(),
      if (favoriteVendors != null) 'favoriteVendors': favoriteVendors?.toJson(),
      'totalOrders': totalOrders,
      'totalSpent': totalSpent,
      'averageOrderValue': averageOrderValue,
      if (lastOrderAt != null) 'lastOrderAt': lastOrderAt?.toJson(),
      'wishlistCount': wishlistCount,
      'reviewsGiven': reviewsGiven,
      if (averageRating != null) 'averageRating': averageRating,
      if (searchHistory != null) 'searchHistory': searchHistory?.toJson(),
      if (viewedProducts != null) 'viewedProducts': viewedProducts?.toJson(),
      if (preferredCategories != null)
        'preferredCategories': preferredCategories?.toJson(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CustomerProfile',
      'id': id.toJson(),
      'userId': userId.toJson(),
      if (user != null) 'user': user?.toJsonForProtocol(),
      if (preferredPaymentMethod != null)
        'preferredPaymentMethod': preferredPaymentMethod,
      if (savedAddresses != null) 'savedAddresses': savedAddresses?.toJson(),
      if (favoriteVendors != null) 'favoriteVendors': favoriteVendors?.toJson(),
      'totalOrders': totalOrders,
      'totalSpent': totalSpent,
      'averageOrderValue': averageOrderValue,
      if (lastOrderAt != null) 'lastOrderAt': lastOrderAt?.toJson(),
      'wishlistCount': wishlistCount,
      'reviewsGiven': reviewsGiven,
      if (averageRating != null) 'averageRating': averageRating,
      if (searchHistory != null) 'searchHistory': searchHistory?.toJson(),
      if (viewedProducts != null) 'viewedProducts': viewedProducts?.toJson(),
      if (preferredCategories != null)
        'preferredCategories': preferredCategories?.toJson(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static CustomerProfileInclude include({_i2.UserInclude? user}) {
    return CustomerProfileInclude._(user: user);
  }

  static CustomerProfileIncludeList includeList({
    _i1.WhereExpressionBuilder<CustomerProfileTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CustomerProfileTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CustomerProfileTable>? orderByList,
    CustomerProfileInclude? include,
  }) {
    return CustomerProfileIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CustomerProfile.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(CustomerProfile.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CustomerProfileImpl extends CustomerProfile {
  _CustomerProfileImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue userId,
    _i2.User? user,
    String? preferredPaymentMethod,
    List<String>? savedAddresses,
    List<String>? favoriteVendors,
    int? totalOrders,
    double? totalSpent,
    double? averageOrderValue,
    DateTime? lastOrderAt,
    int? wishlistCount,
    int? reviewsGiven,
    double? averageRating,
    List<String>? searchHistory,
    List<String>? viewedProducts,
    List<String>? preferredCategories,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         userId: userId,
         user: user,
         preferredPaymentMethod: preferredPaymentMethod,
         savedAddresses: savedAddresses,
         favoriteVendors: favoriteVendors,
         totalOrders: totalOrders,
         totalSpent: totalSpent,
         averageOrderValue: averageOrderValue,
         lastOrderAt: lastOrderAt,
         wishlistCount: wishlistCount,
         reviewsGiven: reviewsGiven,
         averageRating: averageRating,
         searchHistory: searchHistory,
         viewedProducts: viewedProducts,
         preferredCategories: preferredCategories,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [CustomerProfile]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CustomerProfile copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? userId,
    Object? user = _Undefined,
    Object? preferredPaymentMethod = _Undefined,
    Object? savedAddresses = _Undefined,
    Object? favoriteVendors = _Undefined,
    int? totalOrders,
    double? totalSpent,
    double? averageOrderValue,
    Object? lastOrderAt = _Undefined,
    int? wishlistCount,
    int? reviewsGiven,
    Object? averageRating = _Undefined,
    Object? searchHistory = _Undefined,
    Object? viewedProducts = _Undefined,
    Object? preferredCategories = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return CustomerProfile(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      user: user is _i2.User? ? user : this.user?.copyWith(),
      preferredPaymentMethod: preferredPaymentMethod is String?
          ? preferredPaymentMethod
          : this.preferredPaymentMethod,
      savedAddresses: savedAddresses is List<String>?
          ? savedAddresses
          : this.savedAddresses?.map((e0) => e0).toList(),
      favoriteVendors: favoriteVendors is List<String>?
          ? favoriteVendors
          : this.favoriteVendors?.map((e0) => e0).toList(),
      totalOrders: totalOrders ?? this.totalOrders,
      totalSpent: totalSpent ?? this.totalSpent,
      averageOrderValue: averageOrderValue ?? this.averageOrderValue,
      lastOrderAt: lastOrderAt is DateTime? ? lastOrderAt : this.lastOrderAt,
      wishlistCount: wishlistCount ?? this.wishlistCount,
      reviewsGiven: reviewsGiven ?? this.reviewsGiven,
      averageRating: averageRating is double?
          ? averageRating
          : this.averageRating,
      searchHistory: searchHistory is List<String>?
          ? searchHistory
          : this.searchHistory?.map((e0) => e0).toList(),
      viewedProducts: viewedProducts is List<String>?
          ? viewedProducts
          : this.viewedProducts?.map((e0) => e0).toList(),
      preferredCategories: preferredCategories is List<String>?
          ? preferredCategories
          : this.preferredCategories?.map((e0) => e0).toList(),
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class CustomerProfileUpdateTable extends _i1.UpdateTable<CustomerProfileTable> {
  CustomerProfileUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> userId(_i1.UuidValue value) =>
      _i1.ColumnValue(
        table.userId,
        value,
      );

  _i1.ColumnValue<String, String> preferredPaymentMethod(String? value) =>
      _i1.ColumnValue(
        table.preferredPaymentMethod,
        value,
      );

  _i1.ColumnValue<List<String>, List<String>> savedAddresses(
    List<String>? value,
  ) => _i1.ColumnValue(
    table.savedAddresses,
    value,
  );

  _i1.ColumnValue<List<String>, List<String>> favoriteVendors(
    List<String>? value,
  ) => _i1.ColumnValue(
    table.favoriteVendors,
    value,
  );

  _i1.ColumnValue<int, int> totalOrders(int value) => _i1.ColumnValue(
    table.totalOrders,
    value,
  );

  _i1.ColumnValue<double, double> totalSpent(double value) => _i1.ColumnValue(
    table.totalSpent,
    value,
  );

  _i1.ColumnValue<double, double> averageOrderValue(double value) =>
      _i1.ColumnValue(
        table.averageOrderValue,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> lastOrderAt(DateTime? value) =>
      _i1.ColumnValue(
        table.lastOrderAt,
        value,
      );

  _i1.ColumnValue<int, int> wishlistCount(int value) => _i1.ColumnValue(
    table.wishlistCount,
    value,
  );

  _i1.ColumnValue<int, int> reviewsGiven(int value) => _i1.ColumnValue(
    table.reviewsGiven,
    value,
  );

  _i1.ColumnValue<double, double> averageRating(double? value) =>
      _i1.ColumnValue(
        table.averageRating,
        value,
      );

  _i1.ColumnValue<List<String>, List<String>> searchHistory(
    List<String>? value,
  ) => _i1.ColumnValue(
    table.searchHistory,
    value,
  );

  _i1.ColumnValue<List<String>, List<String>> viewedProducts(
    List<String>? value,
  ) => _i1.ColumnValue(
    table.viewedProducts,
    value,
  );

  _i1.ColumnValue<List<String>, List<String>> preferredCategories(
    List<String>? value,
  ) => _i1.ColumnValue(
    table.preferredCategories,
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

class CustomerProfileTable extends _i1.Table<_i1.UuidValue> {
  CustomerProfileTable({super.tableRelation})
    : super(tableName: 'customer_profiles') {
    updateTable = CustomerProfileUpdateTable(this);
    userId = _i1.ColumnUuid(
      'userId',
      this,
    );
    preferredPaymentMethod = _i1.ColumnString(
      'preferredPaymentMethod',
      this,
    );
    savedAddresses = _i1.ColumnSerializable<List<String>>(
      'savedAddresses',
      this,
    );
    favoriteVendors = _i1.ColumnSerializable<List<String>>(
      'favoriteVendors',
      this,
    );
    totalOrders = _i1.ColumnInt(
      'totalOrders',
      this,
      hasDefault: true,
    );
    totalSpent = _i1.ColumnDouble(
      'totalSpent',
      this,
      hasDefault: true,
    );
    averageOrderValue = _i1.ColumnDouble(
      'averageOrderValue',
      this,
      hasDefault: true,
    );
    lastOrderAt = _i1.ColumnDateTime(
      'lastOrderAt',
      this,
    );
    wishlistCount = _i1.ColumnInt(
      'wishlistCount',
      this,
      hasDefault: true,
    );
    reviewsGiven = _i1.ColumnInt(
      'reviewsGiven',
      this,
      hasDefault: true,
    );
    averageRating = _i1.ColumnDouble(
      'averageRating',
      this,
      hasDefault: true,
    );
    searchHistory = _i1.ColumnSerializable<List<String>>(
      'searchHistory',
      this,
    );
    viewedProducts = _i1.ColumnSerializable<List<String>>(
      'viewedProducts',
      this,
    );
    preferredCategories = _i1.ColumnSerializable<List<String>>(
      'preferredCategories',
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

  late final CustomerProfileUpdateTable updateTable;

  late final _i1.ColumnUuid userId;

  _i2.UserTable? _user;

  late final _i1.ColumnString preferredPaymentMethod;

  late final _i1.ColumnSerializable<List<String>> savedAddresses;

  late final _i1.ColumnSerializable<List<String>> favoriteVendors;

  late final _i1.ColumnInt totalOrders;

  late final _i1.ColumnDouble totalSpent;

  late final _i1.ColumnDouble averageOrderValue;

  late final _i1.ColumnDateTime lastOrderAt;

  late final _i1.ColumnInt wishlistCount;

  late final _i1.ColumnInt reviewsGiven;

  late final _i1.ColumnDouble averageRating;

  late final _i1.ColumnSerializable<List<String>> searchHistory;

  late final _i1.ColumnSerializable<List<String>> viewedProducts;

  late final _i1.ColumnSerializable<List<String>> preferredCategories;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  _i2.UserTable get user {
    if (_user != null) return _user!;
    _user = _i1.createRelationTable(
      relationFieldName: 'user',
      field: CustomerProfile.t.userId,
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
    preferredPaymentMethod,
    savedAddresses,
    favoriteVendors,
    totalOrders,
    totalSpent,
    averageOrderValue,
    lastOrderAt,
    wishlistCount,
    reviewsGiven,
    averageRating,
    searchHistory,
    viewedProducts,
    preferredCategories,
    createdAt,
    updatedAt,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'user') {
      return user;
    }
    return null;
  }
}

class CustomerProfileInclude extends _i1.IncludeObject {
  CustomerProfileInclude._({_i2.UserInclude? user}) {
    _user = user;
  }

  _i2.UserInclude? _user;

  @override
  Map<String, _i1.Include?> get includes => {'user': _user};

  @override
  _i1.Table<_i1.UuidValue> get table => CustomerProfile.t;
}

class CustomerProfileIncludeList extends _i1.IncludeList {
  CustomerProfileIncludeList._({
    _i1.WhereExpressionBuilder<CustomerProfileTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(CustomerProfile.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue> get table => CustomerProfile.t;
}

class CustomerProfileRepository {
  const CustomerProfileRepository._();

  final attachRow = const CustomerProfileAttachRowRepository._();

  /// Returns a list of [CustomerProfile]s matching the given query parameters.
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
  Future<List<CustomerProfile>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CustomerProfileTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CustomerProfileTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CustomerProfileTable>? orderByList,
    _i1.Transaction? transaction,
    CustomerProfileInclude? include,
  }) async {
    return session.db.find<CustomerProfile>(
      where: where?.call(CustomerProfile.t),
      orderBy: orderBy?.call(CustomerProfile.t),
      orderByList: orderByList?.call(CustomerProfile.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [CustomerProfile] matching the given query parameters.
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
  Future<CustomerProfile?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CustomerProfileTable>? where,
    int? offset,
    _i1.OrderByBuilder<CustomerProfileTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CustomerProfileTable>? orderByList,
    _i1.Transaction? transaction,
    CustomerProfileInclude? include,
  }) async {
    return session.db.findFirstRow<CustomerProfile>(
      where: where?.call(CustomerProfile.t),
      orderBy: orderBy?.call(CustomerProfile.t),
      orderByList: orderByList?.call(CustomerProfile.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [CustomerProfile] by its [id] or null if no such row exists.
  Future<CustomerProfile?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
    CustomerProfileInclude? include,
  }) async {
    return session.db.findById<CustomerProfile>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [CustomerProfile]s in the list and returns the inserted rows.
  ///
  /// The returned [CustomerProfile]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<CustomerProfile>> insert(
    _i1.Session session,
    List<CustomerProfile> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<CustomerProfile>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [CustomerProfile] and returns the inserted row.
  ///
  /// The returned [CustomerProfile] will have its `id` field set.
  Future<CustomerProfile> insertRow(
    _i1.Session session,
    CustomerProfile row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<CustomerProfile>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [CustomerProfile]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<CustomerProfile>> update(
    _i1.Session session,
    List<CustomerProfile> rows, {
    _i1.ColumnSelections<CustomerProfileTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<CustomerProfile>(
      rows,
      columns: columns?.call(CustomerProfile.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CustomerProfile]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<CustomerProfile> updateRow(
    _i1.Session session,
    CustomerProfile row, {
    _i1.ColumnSelections<CustomerProfileTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<CustomerProfile>(
      row,
      columns: columns?.call(CustomerProfile.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CustomerProfile] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<CustomerProfile?> updateById(
    _i1.Session session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<CustomerProfileUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<CustomerProfile>(
      id,
      columnValues: columnValues(CustomerProfile.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [CustomerProfile]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<CustomerProfile>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<CustomerProfileUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<CustomerProfileTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CustomerProfileTable>? orderBy,
    _i1.OrderByListBuilder<CustomerProfileTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<CustomerProfile>(
      columnValues: columnValues(CustomerProfile.t.updateTable),
      where: where(CustomerProfile.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CustomerProfile.t),
      orderByList: orderByList?.call(CustomerProfile.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [CustomerProfile]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<CustomerProfile>> delete(
    _i1.Session session,
    List<CustomerProfile> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<CustomerProfile>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [CustomerProfile].
  Future<CustomerProfile> deleteRow(
    _i1.Session session,
    CustomerProfile row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<CustomerProfile>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<CustomerProfile>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<CustomerProfileTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<CustomerProfile>(
      where: where(CustomerProfile.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CustomerProfileTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<CustomerProfile>(
      where: where?.call(CustomerProfile.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class CustomerProfileAttachRowRepository {
  const CustomerProfileAttachRowRepository._();

  /// Creates a relation between the given [CustomerProfile] and [User]
  /// by setting the [CustomerProfile]'s foreign key `userId` to refer to the [User].
  Future<void> user(
    _i1.Session session,
    CustomerProfile customerProfile,
    _i2.User user, {
    _i1.Transaction? transaction,
  }) async {
    if (customerProfile.id == null) {
      throw ArgumentError.notNull('customerProfile.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $customerProfile = customerProfile.copyWith(userId: user.id);
    await session.db.updateRow<CustomerProfile>(
      $customerProfile,
      columns: [CustomerProfile.t.userId],
      transaction: transaction,
    );
  }
}
