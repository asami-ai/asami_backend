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
import '../order/cart.dart' as _i2;
import '../product/product.dart' as _i3;
import '../product/product_variant.dart' as _i4;
import 'package:asami_server/src/generated/protocol.dart' as _i5;

abstract class CartItem
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  CartItem._({
    this.id,
    required this.cartId,
    this.cart,
    required this.productId,
    this.product,
    this.variantId,
    this.variant,
    int? quantity,
    required this.unitPrice,
    required this.subtotal,
    this.customerNotes,
    DateTime? addedAt,
    DateTime? updatedAt,
  }) : quantity = quantity ?? 1,
       addedAt = addedAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory CartItem({
    int? id,
    required _i1.UuidValue cartId,
    _i2.Cart? cart,
    required _i1.UuidValue productId,
    _i3.Product? product,
    _i1.UuidValue? variantId,
    _i4.ProductVariant? variant,
    int? quantity,
    required double unitPrice,
    required double subtotal,
    String? customerNotes,
    DateTime? addedAt,
    DateTime? updatedAt,
  }) = _CartItemImpl;

  factory CartItem.fromJson(Map<String, dynamic> jsonSerialization) {
    return CartItem(
      id: jsonSerialization['id'] as int?,
      cartId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['cartId']),
      cart: jsonSerialization['cart'] == null
          ? null
          : _i5.Protocol().deserialize<_i2.Cart>(jsonSerialization['cart']),
      productId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['productId'],
      ),
      product: jsonSerialization['product'] == null
          ? null
          : _i5.Protocol().deserialize<_i3.Product>(
              jsonSerialization['product'],
            ),
      variantId: jsonSerialization['variantId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['variantId']),
      variant: jsonSerialization['variant'] == null
          ? null
          : _i5.Protocol().deserialize<_i4.ProductVariant>(
              jsonSerialization['variant'],
            ),
      quantity: jsonSerialization['quantity'] as int?,
      unitPrice: (jsonSerialization['unitPrice'] as num).toDouble(),
      subtotal: (jsonSerialization['subtotal'] as num).toDouble(),
      customerNotes: jsonSerialization['customerNotes'] as String?,
      addedAt: jsonSerialization['addedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['addedAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  static final t = CartItemTable();

  static const db = CartItemRepository._();

  @override
  int? id;

  _i1.UuidValue cartId;

  _i2.Cart? cart;

  _i1.UuidValue productId;

  _i3.Product? product;

  _i1.UuidValue? variantId;

  _i4.ProductVariant? variant;

  int quantity;

  double unitPrice;

  double subtotal;

  String? customerNotes;

  DateTime addedAt;

  DateTime updatedAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [CartItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CartItem copyWith({
    int? id,
    _i1.UuidValue? cartId,
    _i2.Cart? cart,
    _i1.UuidValue? productId,
    _i3.Product? product,
    _i1.UuidValue? variantId,
    _i4.ProductVariant? variant,
    int? quantity,
    double? unitPrice,
    double? subtotal,
    String? customerNotes,
    DateTime? addedAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CartItem',
      if (id != null) 'id': id,
      'cartId': cartId.toJson(),
      if (cart != null) 'cart': cart?.toJson(),
      'productId': productId.toJson(),
      if (product != null) 'product': product?.toJson(),
      if (variantId != null) 'variantId': variantId?.toJson(),
      if (variant != null) 'variant': variant?.toJson(),
      'quantity': quantity,
      'unitPrice': unitPrice,
      'subtotal': subtotal,
      if (customerNotes != null) 'customerNotes': customerNotes,
      'addedAt': addedAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CartItem',
      if (id != null) 'id': id,
      'cartId': cartId.toJson(),
      if (cart != null) 'cart': cart?.toJsonForProtocol(),
      'productId': productId.toJson(),
      if (product != null) 'product': product?.toJsonForProtocol(),
      if (variantId != null) 'variantId': variantId?.toJson(),
      if (variant != null) 'variant': variant?.toJsonForProtocol(),
      'quantity': quantity,
      'unitPrice': unitPrice,
      'subtotal': subtotal,
      if (customerNotes != null) 'customerNotes': customerNotes,
      'addedAt': addedAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static CartItemInclude include({
    _i2.CartInclude? cart,
    _i3.ProductInclude? product,
    _i4.ProductVariantInclude? variant,
  }) {
    return CartItemInclude._(
      cart: cart,
      product: product,
      variant: variant,
    );
  }

  static CartItemIncludeList includeList({
    _i1.WhereExpressionBuilder<CartItemTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CartItemTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CartItemTable>? orderByList,
    CartItemInclude? include,
  }) {
    return CartItemIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CartItem.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(CartItem.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CartItemImpl extends CartItem {
  _CartItemImpl({
    int? id,
    required _i1.UuidValue cartId,
    _i2.Cart? cart,
    required _i1.UuidValue productId,
    _i3.Product? product,
    _i1.UuidValue? variantId,
    _i4.ProductVariant? variant,
    int? quantity,
    required double unitPrice,
    required double subtotal,
    String? customerNotes,
    DateTime? addedAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         cartId: cartId,
         cart: cart,
         productId: productId,
         product: product,
         variantId: variantId,
         variant: variant,
         quantity: quantity,
         unitPrice: unitPrice,
         subtotal: subtotal,
         customerNotes: customerNotes,
         addedAt: addedAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [CartItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CartItem copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? cartId,
    Object? cart = _Undefined,
    _i1.UuidValue? productId,
    Object? product = _Undefined,
    Object? variantId = _Undefined,
    Object? variant = _Undefined,
    int? quantity,
    double? unitPrice,
    double? subtotal,
    Object? customerNotes = _Undefined,
    DateTime? addedAt,
    DateTime? updatedAt,
  }) {
    return CartItem(
      id: id is int? ? id : this.id,
      cartId: cartId ?? this.cartId,
      cart: cart is _i2.Cart? ? cart : this.cart?.copyWith(),
      productId: productId ?? this.productId,
      product: product is _i3.Product? ? product : this.product?.copyWith(),
      variantId: variantId is _i1.UuidValue? ? variantId : this.variantId,
      variant: variant is _i4.ProductVariant?
          ? variant
          : this.variant?.copyWith(),
      quantity: quantity ?? this.quantity,
      unitPrice: unitPrice ?? this.unitPrice,
      subtotal: subtotal ?? this.subtotal,
      customerNotes: customerNotes is String?
          ? customerNotes
          : this.customerNotes,
      addedAt: addedAt ?? this.addedAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class CartItemUpdateTable extends _i1.UpdateTable<CartItemTable> {
  CartItemUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> cartId(_i1.UuidValue value) =>
      _i1.ColumnValue(
        table.cartId,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> productId(
    _i1.UuidValue value,
  ) => _i1.ColumnValue(
    table.productId,
    value,
  );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> variantId(
    _i1.UuidValue? value,
  ) => _i1.ColumnValue(
    table.variantId,
    value,
  );

  _i1.ColumnValue<int, int> quantity(int value) => _i1.ColumnValue(
    table.quantity,
    value,
  );

  _i1.ColumnValue<double, double> unitPrice(double value) => _i1.ColumnValue(
    table.unitPrice,
    value,
  );

  _i1.ColumnValue<double, double> subtotal(double value) => _i1.ColumnValue(
    table.subtotal,
    value,
  );

  _i1.ColumnValue<String, String> customerNotes(String? value) =>
      _i1.ColumnValue(
        table.customerNotes,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> addedAt(DateTime value) =>
      _i1.ColumnValue(
        table.addedAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> updatedAt(DateTime value) =>
      _i1.ColumnValue(
        table.updatedAt,
        value,
      );
}

class CartItemTable extends _i1.Table<int?> {
  CartItemTable({super.tableRelation}) : super(tableName: 'cart_items') {
    updateTable = CartItemUpdateTable(this);
    cartId = _i1.ColumnUuid(
      'cartId',
      this,
    );
    productId = _i1.ColumnUuid(
      'productId',
      this,
    );
    variantId = _i1.ColumnUuid(
      'variantId',
      this,
    );
    quantity = _i1.ColumnInt(
      'quantity',
      this,
      hasDefault: true,
    );
    unitPrice = _i1.ColumnDouble(
      'unitPrice',
      this,
    );
    subtotal = _i1.ColumnDouble(
      'subtotal',
      this,
    );
    customerNotes = _i1.ColumnString(
      'customerNotes',
      this,
    );
    addedAt = _i1.ColumnDateTime(
      'addedAt',
      this,
      hasDefault: true,
    );
    updatedAt = _i1.ColumnDateTime(
      'updatedAt',
      this,
      hasDefault: true,
    );
  }

  late final CartItemUpdateTable updateTable;

  late final _i1.ColumnUuid cartId;

  _i2.CartTable? _cart;

  late final _i1.ColumnUuid productId;

  _i3.ProductTable? _product;

  late final _i1.ColumnUuid variantId;

  _i4.ProductVariantTable? _variant;

  late final _i1.ColumnInt quantity;

  late final _i1.ColumnDouble unitPrice;

  late final _i1.ColumnDouble subtotal;

  late final _i1.ColumnString customerNotes;

  late final _i1.ColumnDateTime addedAt;

  late final _i1.ColumnDateTime updatedAt;

  _i2.CartTable get cart {
    if (_cart != null) return _cart!;
    _cart = _i1.createRelationTable(
      relationFieldName: 'cart',
      field: CartItem.t.cartId,
      foreignField: _i2.Cart.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.CartTable(tableRelation: foreignTableRelation),
    );
    return _cart!;
  }

  _i3.ProductTable get product {
    if (_product != null) return _product!;
    _product = _i1.createRelationTable(
      relationFieldName: 'product',
      field: CartItem.t.productId,
      foreignField: _i3.Product.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.ProductTable(tableRelation: foreignTableRelation),
    );
    return _product!;
  }

  _i4.ProductVariantTable get variant {
    if (_variant != null) return _variant!;
    _variant = _i1.createRelationTable(
      relationFieldName: 'variant',
      field: CartItem.t.variantId,
      foreignField: _i4.ProductVariant.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.ProductVariantTable(tableRelation: foreignTableRelation),
    );
    return _variant!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    cartId,
    productId,
    variantId,
    quantity,
    unitPrice,
    subtotal,
    customerNotes,
    addedAt,
    updatedAt,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'cart') {
      return cart;
    }
    if (relationField == 'product') {
      return product;
    }
    if (relationField == 'variant') {
      return variant;
    }
    return null;
  }
}

class CartItemInclude extends _i1.IncludeObject {
  CartItemInclude._({
    _i2.CartInclude? cart,
    _i3.ProductInclude? product,
    _i4.ProductVariantInclude? variant,
  }) {
    _cart = cart;
    _product = product;
    _variant = variant;
  }

  _i2.CartInclude? _cart;

  _i3.ProductInclude? _product;

  _i4.ProductVariantInclude? _variant;

  @override
  Map<String, _i1.Include?> get includes => {
    'cart': _cart,
    'product': _product,
    'variant': _variant,
  };

  @override
  _i1.Table<int?> get table => CartItem.t;
}

class CartItemIncludeList extends _i1.IncludeList {
  CartItemIncludeList._({
    _i1.WhereExpressionBuilder<CartItemTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(CartItem.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => CartItem.t;
}

class CartItemRepository {
  const CartItemRepository._();

  final attachRow = const CartItemAttachRowRepository._();

  final detachRow = const CartItemDetachRowRepository._();

  /// Returns a list of [CartItem]s matching the given query parameters.
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
  Future<List<CartItem>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CartItemTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CartItemTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CartItemTable>? orderByList,
    _i1.Transaction? transaction,
    CartItemInclude? include,
  }) async {
    return session.db.find<CartItem>(
      where: where?.call(CartItem.t),
      orderBy: orderBy?.call(CartItem.t),
      orderByList: orderByList?.call(CartItem.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [CartItem] matching the given query parameters.
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
  Future<CartItem?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CartItemTable>? where,
    int? offset,
    _i1.OrderByBuilder<CartItemTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CartItemTable>? orderByList,
    _i1.Transaction? transaction,
    CartItemInclude? include,
  }) async {
    return session.db.findFirstRow<CartItem>(
      where: where?.call(CartItem.t),
      orderBy: orderBy?.call(CartItem.t),
      orderByList: orderByList?.call(CartItem.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [CartItem] by its [id] or null if no such row exists.
  Future<CartItem?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    CartItemInclude? include,
  }) async {
    return session.db.findById<CartItem>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [CartItem]s in the list and returns the inserted rows.
  ///
  /// The returned [CartItem]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<CartItem>> insert(
    _i1.Session session,
    List<CartItem> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<CartItem>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [CartItem] and returns the inserted row.
  ///
  /// The returned [CartItem] will have its `id` field set.
  Future<CartItem> insertRow(
    _i1.Session session,
    CartItem row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<CartItem>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [CartItem]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<CartItem>> update(
    _i1.Session session,
    List<CartItem> rows, {
    _i1.ColumnSelections<CartItemTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<CartItem>(
      rows,
      columns: columns?.call(CartItem.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CartItem]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<CartItem> updateRow(
    _i1.Session session,
    CartItem row, {
    _i1.ColumnSelections<CartItemTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<CartItem>(
      row,
      columns: columns?.call(CartItem.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CartItem] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<CartItem?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<CartItemUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<CartItem>(
      id,
      columnValues: columnValues(CartItem.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [CartItem]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<CartItem>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<CartItemUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<CartItemTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CartItemTable>? orderBy,
    _i1.OrderByListBuilder<CartItemTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<CartItem>(
      columnValues: columnValues(CartItem.t.updateTable),
      where: where(CartItem.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CartItem.t),
      orderByList: orderByList?.call(CartItem.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [CartItem]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<CartItem>> delete(
    _i1.Session session,
    List<CartItem> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<CartItem>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [CartItem].
  Future<CartItem> deleteRow(
    _i1.Session session,
    CartItem row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<CartItem>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<CartItem>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<CartItemTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<CartItem>(
      where: where(CartItem.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CartItemTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<CartItem>(
      where: where?.call(CartItem.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class CartItemAttachRowRepository {
  const CartItemAttachRowRepository._();

  /// Creates a relation between the given [CartItem] and [Cart]
  /// by setting the [CartItem]'s foreign key `cartId` to refer to the [Cart].
  Future<void> cart(
    _i1.Session session,
    CartItem cartItem,
    _i2.Cart cart, {
    _i1.Transaction? transaction,
  }) async {
    if (cartItem.id == null) {
      throw ArgumentError.notNull('cartItem.id');
    }
    if (cart.id == null) {
      throw ArgumentError.notNull('cart.id');
    }

    var $cartItem = cartItem.copyWith(cartId: cart.id);
    await session.db.updateRow<CartItem>(
      $cartItem,
      columns: [CartItem.t.cartId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [CartItem] and [Product]
  /// by setting the [CartItem]'s foreign key `productId` to refer to the [Product].
  Future<void> product(
    _i1.Session session,
    CartItem cartItem,
    _i3.Product product, {
    _i1.Transaction? transaction,
  }) async {
    if (cartItem.id == null) {
      throw ArgumentError.notNull('cartItem.id');
    }
    if (product.id == null) {
      throw ArgumentError.notNull('product.id');
    }

    var $cartItem = cartItem.copyWith(productId: product.id);
    await session.db.updateRow<CartItem>(
      $cartItem,
      columns: [CartItem.t.productId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [CartItem] and [ProductVariant]
  /// by setting the [CartItem]'s foreign key `variantId` to refer to the [ProductVariant].
  Future<void> variant(
    _i1.Session session,
    CartItem cartItem,
    _i4.ProductVariant variant, {
    _i1.Transaction? transaction,
  }) async {
    if (cartItem.id == null) {
      throw ArgumentError.notNull('cartItem.id');
    }
    if (variant.id == null) {
      throw ArgumentError.notNull('variant.id');
    }

    var $cartItem = cartItem.copyWith(variantId: variant.id);
    await session.db.updateRow<CartItem>(
      $cartItem,
      columns: [CartItem.t.variantId],
      transaction: transaction,
    );
  }
}

class CartItemDetachRowRepository {
  const CartItemDetachRowRepository._();

  /// Detaches the relation between this [CartItem] and the [ProductVariant] set in `variant`
  /// by setting the [CartItem]'s foreign key `variantId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> variant(
    _i1.Session session,
    CartItem cartItem, {
    _i1.Transaction? transaction,
  }) async {
    if (cartItem.id == null) {
      throw ArgumentError.notNull('cartItem.id');
    }

    var $cartItem = cartItem.copyWith(variantId: null);
    await session.db.updateRow<CartItem>(
      $cartItem,
      columns: [CartItem.t.variantId],
      transaction: transaction,
    );
  }
}
