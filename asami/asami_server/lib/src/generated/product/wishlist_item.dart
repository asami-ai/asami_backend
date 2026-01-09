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
import '../product/wishlist.dart' as _i2;
import '../product/product.dart' as _i3;
import 'package:asami_server/src/generated/protocol.dart' as _i4;

abstract class WishlistItem
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  WishlistItem._({
    this.id,
    required this.wishlistId,
    this.wishlist,
    required this.customerId,
    required this.productId,
    this.product,
    this.variantId,
    this.notes,
    int? priority,
    required this.priceWhenAdded,
    bool? notifyOnPriceDrop,
    this.targetPrice,
    DateTime? addedAt,
  }) : priority = priority ?? 0,
       notifyOnPriceDrop = notifyOnPriceDrop ?? false,
       addedAt = addedAt ?? DateTime.now();

  factory WishlistItem({
    int? id,
    required _i1.UuidValue wishlistId,
    _i2.Wishlist? wishlist,
    required _i1.UuidValue customerId,
    required _i1.UuidValue productId,
    _i3.Product? product,
    _i1.UuidValue? variantId,
    String? notes,
    int? priority,
    required double priceWhenAdded,
    bool? notifyOnPriceDrop,
    double? targetPrice,
    DateTime? addedAt,
  }) = _WishlistItemImpl;

  factory WishlistItem.fromJson(Map<String, dynamic> jsonSerialization) {
    return WishlistItem(
      id: jsonSerialization['id'] as int?,
      wishlistId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['wishlistId'],
      ),
      wishlist: jsonSerialization['wishlist'] == null
          ? null
          : _i4.Protocol().deserialize<_i2.Wishlist>(
              jsonSerialization['wishlist'],
            ),
      customerId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['customerId'],
      ),
      productId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['productId'],
      ),
      product: jsonSerialization['product'] == null
          ? null
          : _i4.Protocol().deserialize<_i3.Product>(
              jsonSerialization['product'],
            ),
      variantId: jsonSerialization['variantId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['variantId']),
      notes: jsonSerialization['notes'] as String?,
      priority: jsonSerialization['priority'] as int?,
      priceWhenAdded: (jsonSerialization['priceWhenAdded'] as num).toDouble(),
      notifyOnPriceDrop: jsonSerialization['notifyOnPriceDrop'] as bool?,
      targetPrice: (jsonSerialization['targetPrice'] as num?)?.toDouble(),
      addedAt: jsonSerialization['addedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['addedAt']),
    );
  }

  static final t = WishlistItemTable();

  static const db = WishlistItemRepository._();

  @override
  int? id;

  _i1.UuidValue wishlistId;

  _i2.Wishlist? wishlist;

  _i1.UuidValue customerId;

  _i1.UuidValue productId;

  _i3.Product? product;

  _i1.UuidValue? variantId;

  String? notes;

  int priority;

  double priceWhenAdded;

  bool notifyOnPriceDrop;

  double? targetPrice;

  DateTime addedAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [WishlistItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  WishlistItem copyWith({
    int? id,
    _i1.UuidValue? wishlistId,
    _i2.Wishlist? wishlist,
    _i1.UuidValue? customerId,
    _i1.UuidValue? productId,
    _i3.Product? product,
    _i1.UuidValue? variantId,
    String? notes,
    int? priority,
    double? priceWhenAdded,
    bool? notifyOnPriceDrop,
    double? targetPrice,
    DateTime? addedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'WishlistItem',
      if (id != null) 'id': id,
      'wishlistId': wishlistId.toJson(),
      if (wishlist != null) 'wishlist': wishlist?.toJson(),
      'customerId': customerId.toJson(),
      'productId': productId.toJson(),
      if (product != null) 'product': product?.toJson(),
      if (variantId != null) 'variantId': variantId?.toJson(),
      if (notes != null) 'notes': notes,
      'priority': priority,
      'priceWhenAdded': priceWhenAdded,
      'notifyOnPriceDrop': notifyOnPriceDrop,
      if (targetPrice != null) 'targetPrice': targetPrice,
      'addedAt': addedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'WishlistItem',
      if (id != null) 'id': id,
      'wishlistId': wishlistId.toJson(),
      if (wishlist != null) 'wishlist': wishlist?.toJsonForProtocol(),
      'customerId': customerId.toJson(),
      'productId': productId.toJson(),
      if (product != null) 'product': product?.toJsonForProtocol(),
      if (variantId != null) 'variantId': variantId?.toJson(),
      if (notes != null) 'notes': notes,
      'priority': priority,
      'priceWhenAdded': priceWhenAdded,
      'notifyOnPriceDrop': notifyOnPriceDrop,
      if (targetPrice != null) 'targetPrice': targetPrice,
      'addedAt': addedAt.toJson(),
    };
  }

  static WishlistItemInclude include({
    _i2.WishlistInclude? wishlist,
    _i3.ProductInclude? product,
  }) {
    return WishlistItemInclude._(
      wishlist: wishlist,
      product: product,
    );
  }

  static WishlistItemIncludeList includeList({
    _i1.WhereExpressionBuilder<WishlistItemTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<WishlistItemTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<WishlistItemTable>? orderByList,
    WishlistItemInclude? include,
  }) {
    return WishlistItemIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(WishlistItem.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(WishlistItem.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _WishlistItemImpl extends WishlistItem {
  _WishlistItemImpl({
    int? id,
    required _i1.UuidValue wishlistId,
    _i2.Wishlist? wishlist,
    required _i1.UuidValue customerId,
    required _i1.UuidValue productId,
    _i3.Product? product,
    _i1.UuidValue? variantId,
    String? notes,
    int? priority,
    required double priceWhenAdded,
    bool? notifyOnPriceDrop,
    double? targetPrice,
    DateTime? addedAt,
  }) : super._(
         id: id,
         wishlistId: wishlistId,
         wishlist: wishlist,
         customerId: customerId,
         productId: productId,
         product: product,
         variantId: variantId,
         notes: notes,
         priority: priority,
         priceWhenAdded: priceWhenAdded,
         notifyOnPriceDrop: notifyOnPriceDrop,
         targetPrice: targetPrice,
         addedAt: addedAt,
       );

  /// Returns a shallow copy of this [WishlistItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  WishlistItem copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? wishlistId,
    Object? wishlist = _Undefined,
    _i1.UuidValue? customerId,
    _i1.UuidValue? productId,
    Object? product = _Undefined,
    Object? variantId = _Undefined,
    Object? notes = _Undefined,
    int? priority,
    double? priceWhenAdded,
    bool? notifyOnPriceDrop,
    Object? targetPrice = _Undefined,
    DateTime? addedAt,
  }) {
    return WishlistItem(
      id: id is int? ? id : this.id,
      wishlistId: wishlistId ?? this.wishlistId,
      wishlist: wishlist is _i2.Wishlist?
          ? wishlist
          : this.wishlist?.copyWith(),
      customerId: customerId ?? this.customerId,
      productId: productId ?? this.productId,
      product: product is _i3.Product? ? product : this.product?.copyWith(),
      variantId: variantId is _i1.UuidValue? ? variantId : this.variantId,
      notes: notes is String? ? notes : this.notes,
      priority: priority ?? this.priority,
      priceWhenAdded: priceWhenAdded ?? this.priceWhenAdded,
      notifyOnPriceDrop: notifyOnPriceDrop ?? this.notifyOnPriceDrop,
      targetPrice: targetPrice is double? ? targetPrice : this.targetPrice,
      addedAt: addedAt ?? this.addedAt,
    );
  }
}

class WishlistItemUpdateTable extends _i1.UpdateTable<WishlistItemTable> {
  WishlistItemUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> wishlistId(
    _i1.UuidValue value,
  ) => _i1.ColumnValue(
    table.wishlistId,
    value,
  );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> customerId(
    _i1.UuidValue value,
  ) => _i1.ColumnValue(
    table.customerId,
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

  _i1.ColumnValue<String, String> notes(String? value) => _i1.ColumnValue(
    table.notes,
    value,
  );

  _i1.ColumnValue<int, int> priority(int value) => _i1.ColumnValue(
    table.priority,
    value,
  );

  _i1.ColumnValue<double, double> priceWhenAdded(double value) =>
      _i1.ColumnValue(
        table.priceWhenAdded,
        value,
      );

  _i1.ColumnValue<bool, bool> notifyOnPriceDrop(bool value) => _i1.ColumnValue(
    table.notifyOnPriceDrop,
    value,
  );

  _i1.ColumnValue<double, double> targetPrice(double? value) => _i1.ColumnValue(
    table.targetPrice,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> addedAt(DateTime value) =>
      _i1.ColumnValue(
        table.addedAt,
        value,
      );
}

class WishlistItemTable extends _i1.Table<int?> {
  WishlistItemTable({super.tableRelation})
    : super(tableName: 'wishlist_items') {
    updateTable = WishlistItemUpdateTable(this);
    wishlistId = _i1.ColumnUuid(
      'wishlistId',
      this,
    );
    customerId = _i1.ColumnUuid(
      'customerId',
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
    notes = _i1.ColumnString(
      'notes',
      this,
    );
    priority = _i1.ColumnInt(
      'priority',
      this,
      hasDefault: true,
    );
    priceWhenAdded = _i1.ColumnDouble(
      'priceWhenAdded',
      this,
    );
    notifyOnPriceDrop = _i1.ColumnBool(
      'notifyOnPriceDrop',
      this,
      hasDefault: true,
    );
    targetPrice = _i1.ColumnDouble(
      'targetPrice',
      this,
    );
    addedAt = _i1.ColumnDateTime(
      'addedAt',
      this,
      hasDefault: true,
    );
  }

  late final WishlistItemUpdateTable updateTable;

  late final _i1.ColumnUuid wishlistId;

  _i2.WishlistTable? _wishlist;

  late final _i1.ColumnUuid customerId;

  late final _i1.ColumnUuid productId;

  _i3.ProductTable? _product;

  late final _i1.ColumnUuid variantId;

  late final _i1.ColumnString notes;

  late final _i1.ColumnInt priority;

  late final _i1.ColumnDouble priceWhenAdded;

  late final _i1.ColumnBool notifyOnPriceDrop;

  late final _i1.ColumnDouble targetPrice;

  late final _i1.ColumnDateTime addedAt;

  _i2.WishlistTable get wishlist {
    if (_wishlist != null) return _wishlist!;
    _wishlist = _i1.createRelationTable(
      relationFieldName: 'wishlist',
      field: WishlistItem.t.wishlistId,
      foreignField: _i2.Wishlist.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.WishlistTable(tableRelation: foreignTableRelation),
    );
    return _wishlist!;
  }

  _i3.ProductTable get product {
    if (_product != null) return _product!;
    _product = _i1.createRelationTable(
      relationFieldName: 'product',
      field: WishlistItem.t.productId,
      foreignField: _i3.Product.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.ProductTable(tableRelation: foreignTableRelation),
    );
    return _product!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    wishlistId,
    customerId,
    productId,
    variantId,
    notes,
    priority,
    priceWhenAdded,
    notifyOnPriceDrop,
    targetPrice,
    addedAt,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'wishlist') {
      return wishlist;
    }
    if (relationField == 'product') {
      return product;
    }
    return null;
  }
}

class WishlistItemInclude extends _i1.IncludeObject {
  WishlistItemInclude._({
    _i2.WishlistInclude? wishlist,
    _i3.ProductInclude? product,
  }) {
    _wishlist = wishlist;
    _product = product;
  }

  _i2.WishlistInclude? _wishlist;

  _i3.ProductInclude? _product;

  @override
  Map<String, _i1.Include?> get includes => {
    'wishlist': _wishlist,
    'product': _product,
  };

  @override
  _i1.Table<int?> get table => WishlistItem.t;
}

class WishlistItemIncludeList extends _i1.IncludeList {
  WishlistItemIncludeList._({
    _i1.WhereExpressionBuilder<WishlistItemTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(WishlistItem.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => WishlistItem.t;
}

class WishlistItemRepository {
  const WishlistItemRepository._();

  final attachRow = const WishlistItemAttachRowRepository._();

  /// Returns a list of [WishlistItem]s matching the given query parameters.
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
  Future<List<WishlistItem>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<WishlistItemTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<WishlistItemTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<WishlistItemTable>? orderByList,
    _i1.Transaction? transaction,
    WishlistItemInclude? include,
  }) async {
    return session.db.find<WishlistItem>(
      where: where?.call(WishlistItem.t),
      orderBy: orderBy?.call(WishlistItem.t),
      orderByList: orderByList?.call(WishlistItem.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [WishlistItem] matching the given query parameters.
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
  Future<WishlistItem?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<WishlistItemTable>? where,
    int? offset,
    _i1.OrderByBuilder<WishlistItemTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<WishlistItemTable>? orderByList,
    _i1.Transaction? transaction,
    WishlistItemInclude? include,
  }) async {
    return session.db.findFirstRow<WishlistItem>(
      where: where?.call(WishlistItem.t),
      orderBy: orderBy?.call(WishlistItem.t),
      orderByList: orderByList?.call(WishlistItem.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [WishlistItem] by its [id] or null if no such row exists.
  Future<WishlistItem?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    WishlistItemInclude? include,
  }) async {
    return session.db.findById<WishlistItem>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [WishlistItem]s in the list and returns the inserted rows.
  ///
  /// The returned [WishlistItem]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<WishlistItem>> insert(
    _i1.Session session,
    List<WishlistItem> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<WishlistItem>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [WishlistItem] and returns the inserted row.
  ///
  /// The returned [WishlistItem] will have its `id` field set.
  Future<WishlistItem> insertRow(
    _i1.Session session,
    WishlistItem row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<WishlistItem>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [WishlistItem]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<WishlistItem>> update(
    _i1.Session session,
    List<WishlistItem> rows, {
    _i1.ColumnSelections<WishlistItemTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<WishlistItem>(
      rows,
      columns: columns?.call(WishlistItem.t),
      transaction: transaction,
    );
  }

  /// Updates a single [WishlistItem]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<WishlistItem> updateRow(
    _i1.Session session,
    WishlistItem row, {
    _i1.ColumnSelections<WishlistItemTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<WishlistItem>(
      row,
      columns: columns?.call(WishlistItem.t),
      transaction: transaction,
    );
  }

  /// Updates a single [WishlistItem] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<WishlistItem?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<WishlistItemUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<WishlistItem>(
      id,
      columnValues: columnValues(WishlistItem.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [WishlistItem]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<WishlistItem>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<WishlistItemUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<WishlistItemTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<WishlistItemTable>? orderBy,
    _i1.OrderByListBuilder<WishlistItemTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<WishlistItem>(
      columnValues: columnValues(WishlistItem.t.updateTable),
      where: where(WishlistItem.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(WishlistItem.t),
      orderByList: orderByList?.call(WishlistItem.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [WishlistItem]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<WishlistItem>> delete(
    _i1.Session session,
    List<WishlistItem> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<WishlistItem>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [WishlistItem].
  Future<WishlistItem> deleteRow(
    _i1.Session session,
    WishlistItem row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<WishlistItem>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<WishlistItem>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<WishlistItemTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<WishlistItem>(
      where: where(WishlistItem.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<WishlistItemTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<WishlistItem>(
      where: where?.call(WishlistItem.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class WishlistItemAttachRowRepository {
  const WishlistItemAttachRowRepository._();

  /// Creates a relation between the given [WishlistItem] and [Wishlist]
  /// by setting the [WishlistItem]'s foreign key `wishlistId` to refer to the [Wishlist].
  Future<void> wishlist(
    _i1.Session session,
    WishlistItem wishlistItem,
    _i2.Wishlist wishlist, {
    _i1.Transaction? transaction,
  }) async {
    if (wishlistItem.id == null) {
      throw ArgumentError.notNull('wishlistItem.id');
    }
    if (wishlist.id == null) {
      throw ArgumentError.notNull('wishlist.id');
    }

    var $wishlistItem = wishlistItem.copyWith(wishlistId: wishlist.id);
    await session.db.updateRow<WishlistItem>(
      $wishlistItem,
      columns: [WishlistItem.t.wishlistId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [WishlistItem] and [Product]
  /// by setting the [WishlistItem]'s foreign key `productId` to refer to the [Product].
  Future<void> product(
    _i1.Session session,
    WishlistItem wishlistItem,
    _i3.Product product, {
    _i1.Transaction? transaction,
  }) async {
    if (wishlistItem.id == null) {
      throw ArgumentError.notNull('wishlistItem.id');
    }
    if (product.id == null) {
      throw ArgumentError.notNull('product.id');
    }

    var $wishlistItem = wishlistItem.copyWith(productId: product.id);
    await session.db.updateRow<WishlistItem>(
      $wishlistItem,
      columns: [WishlistItem.t.productId],
      transaction: transaction,
    );
  }
}
