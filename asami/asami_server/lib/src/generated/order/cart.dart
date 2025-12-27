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

abstract class Cart
    implements _i1.TableRow<_i1.UuidValue>, _i1.ProtocolSerialization {
  Cart._({
    _i1.UuidValue? id,
    required this.customerId,
    this.customer,
    this.sessionId,
    bool? isActive,
    int? itemCount,
    double? subtotal,
    this.convertedToOrderId,
    DateTime? createdAt,
    DateTime? updatedAt,
    this.expiresAt,
  }) : id = id ?? _i1.Uuid().v4obj(),
       isActive = isActive ?? true,
       itemCount = itemCount ?? 0,
       subtotal = subtotal ?? 0.0,
       createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory Cart({
    _i1.UuidValue? id,
    required _i1.UuidValue customerId,
    _i2.User? customer,
    String? sessionId,
    bool? isActive,
    int? itemCount,
    double? subtotal,
    String? convertedToOrderId,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? expiresAt,
  }) = _CartImpl;

  factory Cart.fromJson(Map<String, dynamic> jsonSerialization) {
    return Cart(
      id: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      customerId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['customerId'],
      ),
      customer: jsonSerialization['customer'] == null
          ? null
          : _i3.Protocol().deserialize<_i2.User>(jsonSerialization['customer']),
      sessionId: jsonSerialization['sessionId'] as String?,
      isActive: jsonSerialization['isActive'] as bool,
      itemCount: jsonSerialization['itemCount'] as int,
      subtotal: (jsonSerialization['subtotal'] as num).toDouble(),
      convertedToOrderId: jsonSerialization['convertedToOrderId'] as String?,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
      expiresAt: jsonSerialization['expiresAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['expiresAt']),
    );
  }

  static final t = CartTable();

  static const db = CartRepository._();

  @override
  _i1.UuidValue id;

  _i1.UuidValue customerId;

  _i2.User? customer;

  String? sessionId;

  bool isActive;

  int itemCount;

  double subtotal;

  String? convertedToOrderId;

  DateTime createdAt;

  DateTime updatedAt;

  DateTime? expiresAt;

  @override
  _i1.Table<_i1.UuidValue> get table => t;

  /// Returns a shallow copy of this [Cart]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Cart copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? customerId,
    _i2.User? customer,
    String? sessionId,
    bool? isActive,
    int? itemCount,
    double? subtotal,
    String? convertedToOrderId,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? expiresAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Cart',
      'id': id.toJson(),
      'customerId': customerId.toJson(),
      if (customer != null) 'customer': customer?.toJson(),
      if (sessionId != null) 'sessionId': sessionId,
      'isActive': isActive,
      'itemCount': itemCount,
      'subtotal': subtotal,
      if (convertedToOrderId != null) 'convertedToOrderId': convertedToOrderId,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      if (expiresAt != null) 'expiresAt': expiresAt?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Cart',
      'id': id.toJson(),
      'customerId': customerId.toJson(),
      if (customer != null) 'customer': customer?.toJsonForProtocol(),
      if (sessionId != null) 'sessionId': sessionId,
      'isActive': isActive,
      'itemCount': itemCount,
      'subtotal': subtotal,
      if (convertedToOrderId != null) 'convertedToOrderId': convertedToOrderId,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      if (expiresAt != null) 'expiresAt': expiresAt?.toJson(),
    };
  }

  static CartInclude include({_i2.UserInclude? customer}) {
    return CartInclude._(customer: customer);
  }

  static CartIncludeList includeList({
    _i1.WhereExpressionBuilder<CartTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CartTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CartTable>? orderByList,
    CartInclude? include,
  }) {
    return CartIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Cart.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Cart.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CartImpl extends Cart {
  _CartImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue customerId,
    _i2.User? customer,
    String? sessionId,
    bool? isActive,
    int? itemCount,
    double? subtotal,
    String? convertedToOrderId,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? expiresAt,
  }) : super._(
         id: id,
         customerId: customerId,
         customer: customer,
         sessionId: sessionId,
         isActive: isActive,
         itemCount: itemCount,
         subtotal: subtotal,
         convertedToOrderId: convertedToOrderId,
         createdAt: createdAt,
         updatedAt: updatedAt,
         expiresAt: expiresAt,
       );

  /// Returns a shallow copy of this [Cart]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Cart copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? customerId,
    Object? customer = _Undefined,
    Object? sessionId = _Undefined,
    bool? isActive,
    int? itemCount,
    double? subtotal,
    Object? convertedToOrderId = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
    Object? expiresAt = _Undefined,
  }) {
    return Cart(
      id: id ?? this.id,
      customerId: customerId ?? this.customerId,
      customer: customer is _i2.User? ? customer : this.customer?.copyWith(),
      sessionId: sessionId is String? ? sessionId : this.sessionId,
      isActive: isActive ?? this.isActive,
      itemCount: itemCount ?? this.itemCount,
      subtotal: subtotal ?? this.subtotal,
      convertedToOrderId: convertedToOrderId is String?
          ? convertedToOrderId
          : this.convertedToOrderId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      expiresAt: expiresAt is DateTime? ? expiresAt : this.expiresAt,
    );
  }
}

class CartUpdateTable extends _i1.UpdateTable<CartTable> {
  CartUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> customerId(
    _i1.UuidValue value,
  ) => _i1.ColumnValue(
    table.customerId,
    value,
  );

  _i1.ColumnValue<String, String> sessionId(String? value) => _i1.ColumnValue(
    table.sessionId,
    value,
  );

  _i1.ColumnValue<bool, bool> isActive(bool value) => _i1.ColumnValue(
    table.isActive,
    value,
  );

  _i1.ColumnValue<int, int> itemCount(int value) => _i1.ColumnValue(
    table.itemCount,
    value,
  );

  _i1.ColumnValue<double, double> subtotal(double value) => _i1.ColumnValue(
    table.subtotal,
    value,
  );

  _i1.ColumnValue<String, String> convertedToOrderId(String? value) =>
      _i1.ColumnValue(
        table.convertedToOrderId,
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

  _i1.ColumnValue<DateTime, DateTime> expiresAt(DateTime? value) =>
      _i1.ColumnValue(
        table.expiresAt,
        value,
      );
}

class CartTable extends _i1.Table<_i1.UuidValue> {
  CartTable({super.tableRelation}) : super(tableName: 'carts') {
    updateTable = CartUpdateTable(this);
    customerId = _i1.ColumnUuid(
      'customerId',
      this,
    );
    sessionId = _i1.ColumnString(
      'sessionId',
      this,
    );
    isActive = _i1.ColumnBool(
      'isActive',
      this,
      hasDefault: true,
    );
    itemCount = _i1.ColumnInt(
      'itemCount',
      this,
      hasDefault: true,
    );
    subtotal = _i1.ColumnDouble(
      'subtotal',
      this,
      hasDefault: true,
    );
    convertedToOrderId = _i1.ColumnString(
      'convertedToOrderId',
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
    expiresAt = _i1.ColumnDateTime(
      'expiresAt',
      this,
    );
  }

  late final CartUpdateTable updateTable;

  late final _i1.ColumnUuid customerId;

  _i2.UserTable? _customer;

  late final _i1.ColumnString sessionId;

  late final _i1.ColumnBool isActive;

  late final _i1.ColumnInt itemCount;

  late final _i1.ColumnDouble subtotal;

  late final _i1.ColumnString convertedToOrderId;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  late final _i1.ColumnDateTime expiresAt;

  _i2.UserTable get customer {
    if (_customer != null) return _customer!;
    _customer = _i1.createRelationTable(
      relationFieldName: 'customer',
      field: Cart.t.customerId,
      foreignField: _i2.User.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserTable(tableRelation: foreignTableRelation),
    );
    return _customer!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    customerId,
    sessionId,
    isActive,
    itemCount,
    subtotal,
    convertedToOrderId,
    createdAt,
    updatedAt,
    expiresAt,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'customer') {
      return customer;
    }
    return null;
  }
}

class CartInclude extends _i1.IncludeObject {
  CartInclude._({_i2.UserInclude? customer}) {
    _customer = customer;
  }

  _i2.UserInclude? _customer;

  @override
  Map<String, _i1.Include?> get includes => {'customer': _customer};

  @override
  _i1.Table<_i1.UuidValue> get table => Cart.t;
}

class CartIncludeList extends _i1.IncludeList {
  CartIncludeList._({
    _i1.WhereExpressionBuilder<CartTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Cart.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue> get table => Cart.t;
}

class CartRepository {
  const CartRepository._();

  final attachRow = const CartAttachRowRepository._();

  /// Returns a list of [Cart]s matching the given query parameters.
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
  Future<List<Cart>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CartTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CartTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CartTable>? orderByList,
    _i1.Transaction? transaction,
    CartInclude? include,
  }) async {
    return session.db.find<Cart>(
      where: where?.call(Cart.t),
      orderBy: orderBy?.call(Cart.t),
      orderByList: orderByList?.call(Cart.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Cart] matching the given query parameters.
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
  Future<Cart?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CartTable>? where,
    int? offset,
    _i1.OrderByBuilder<CartTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CartTable>? orderByList,
    _i1.Transaction? transaction,
    CartInclude? include,
  }) async {
    return session.db.findFirstRow<Cart>(
      where: where?.call(Cart.t),
      orderBy: orderBy?.call(Cart.t),
      orderByList: orderByList?.call(Cart.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Cart] by its [id] or null if no such row exists.
  Future<Cart?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
    CartInclude? include,
  }) async {
    return session.db.findById<Cart>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Cart]s in the list and returns the inserted rows.
  ///
  /// The returned [Cart]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Cart>> insert(
    _i1.Session session,
    List<Cart> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Cart>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Cart] and returns the inserted row.
  ///
  /// The returned [Cart] will have its `id` field set.
  Future<Cart> insertRow(
    _i1.Session session,
    Cart row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Cart>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Cart]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Cart>> update(
    _i1.Session session,
    List<Cart> rows, {
    _i1.ColumnSelections<CartTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Cart>(
      rows,
      columns: columns?.call(Cart.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Cart]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Cart> updateRow(
    _i1.Session session,
    Cart row, {
    _i1.ColumnSelections<CartTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Cart>(
      row,
      columns: columns?.call(Cart.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Cart] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Cart?> updateById(
    _i1.Session session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<CartUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Cart>(
      id,
      columnValues: columnValues(Cart.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Cart]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Cart>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<CartUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<CartTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CartTable>? orderBy,
    _i1.OrderByListBuilder<CartTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Cart>(
      columnValues: columnValues(Cart.t.updateTable),
      where: where(Cart.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Cart.t),
      orderByList: orderByList?.call(Cart.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Cart]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Cart>> delete(
    _i1.Session session,
    List<Cart> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Cart>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Cart].
  Future<Cart> deleteRow(
    _i1.Session session,
    Cart row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Cart>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Cart>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<CartTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Cart>(
      where: where(Cart.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CartTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Cart>(
      where: where?.call(Cart.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class CartAttachRowRepository {
  const CartAttachRowRepository._();

  /// Creates a relation between the given [Cart] and [User]
  /// by setting the [Cart]'s foreign key `customerId` to refer to the [User].
  Future<void> customer(
    _i1.Session session,
    Cart cart,
    _i2.User customer, {
    _i1.Transaction? transaction,
  }) async {
    if (cart.id == null) {
      throw ArgumentError.notNull('cart.id');
    }
    if (customer.id == null) {
      throw ArgumentError.notNull('customer.id');
    }

    var $cart = cart.copyWith(customerId: customer.id);
    await session.db.updateRow<Cart>(
      $cart,
      columns: [Cart.t.customerId],
      transaction: transaction,
    );
  }
}
