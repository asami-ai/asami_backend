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
import '../product/product.dart' as _i3;
import '../messaging/platfom_type.dart' as _i4;
import 'package:asami_server/src/generated/protocol.dart' as _i5;

abstract class ProductView
    implements _i1.TableRow<_i1.UuidValue>, _i1.ProtocolSerialization {
  ProductView._({
    _i1.UuidValue? id,
    required this.userId,
    this.user,
    required this.productId,
    this.product,
    required this.platform,
    this.source,
    this.viewDurationSeconds,
    bool? addedToCart,
    bool? purchased,
    DateTime? createdAt,
  }) : id = id ?? _i1.Uuid().v4obj(),
       addedToCart = addedToCart ?? false,
       purchased = purchased ?? false,
       createdAt = createdAt ?? DateTime.now();

  factory ProductView({
    _i1.UuidValue? id,
    required _i1.UuidValue userId,
    _i2.User? user,
    required _i1.UuidValue productId,
    _i3.Product? product,
    required _i4.PlatformType platform,
    String? source,
    int? viewDurationSeconds,
    bool? addedToCart,
    bool? purchased,
    DateTime? createdAt,
  }) = _ProductViewImpl;

  factory ProductView.fromJson(Map<String, dynamic> jsonSerialization) {
    return ProductView(
      id: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      userId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      user: jsonSerialization['user'] == null
          ? null
          : _i5.Protocol().deserialize<_i2.User>(jsonSerialization['user']),
      productId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['productId'],
      ),
      product: jsonSerialization['product'] == null
          ? null
          : _i5.Protocol().deserialize<_i3.Product>(
              jsonSerialization['product'],
            ),
      platform: _i4.PlatformType.fromJson(
        (jsonSerialization['platform'] as String),
      ),
      source: jsonSerialization['source'] as String?,
      viewDurationSeconds: jsonSerialization['viewDurationSeconds'] as int?,
      addedToCart: jsonSerialization['addedToCart'] as bool,
      purchased: jsonSerialization['purchased'] as bool,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  static final t = ProductViewTable();

  static const db = ProductViewRepository._();

  @override
  _i1.UuidValue id;

  _i1.UuidValue userId;

  _i2.User? user;

  _i1.UuidValue productId;

  _i3.Product? product;

  _i4.PlatformType platform;

  String? source;

  int? viewDurationSeconds;

  bool addedToCart;

  bool purchased;

  DateTime createdAt;

  @override
  _i1.Table<_i1.UuidValue> get table => t;

  /// Returns a shallow copy of this [ProductView]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ProductView copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? userId,
    _i2.User? user,
    _i1.UuidValue? productId,
    _i3.Product? product,
    _i4.PlatformType? platform,
    String? source,
    int? viewDurationSeconds,
    bool? addedToCart,
    bool? purchased,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ProductView',
      'id': id.toJson(),
      'userId': userId.toJson(),
      if (user != null) 'user': user?.toJson(),
      'productId': productId.toJson(),
      if (product != null) 'product': product?.toJson(),
      'platform': platform.toJson(),
      if (source != null) 'source': source,
      if (viewDurationSeconds != null)
        'viewDurationSeconds': viewDurationSeconds,
      'addedToCart': addedToCart,
      'purchased': purchased,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ProductView',
      'id': id.toJson(),
      'userId': userId.toJson(),
      if (user != null) 'user': user?.toJsonForProtocol(),
      'productId': productId.toJson(),
      if (product != null) 'product': product?.toJsonForProtocol(),
      'platform': platform.toJson(),
      if (source != null) 'source': source,
      if (viewDurationSeconds != null)
        'viewDurationSeconds': viewDurationSeconds,
      'addedToCart': addedToCart,
      'purchased': purchased,
      'createdAt': createdAt.toJson(),
    };
  }

  static ProductViewInclude include({
    _i2.UserInclude? user,
    _i3.ProductInclude? product,
  }) {
    return ProductViewInclude._(
      user: user,
      product: product,
    );
  }

  static ProductViewIncludeList includeList({
    _i1.WhereExpressionBuilder<ProductViewTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProductViewTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProductViewTable>? orderByList,
    ProductViewInclude? include,
  }) {
    return ProductViewIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ProductView.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ProductView.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ProductViewImpl extends ProductView {
  _ProductViewImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue userId,
    _i2.User? user,
    required _i1.UuidValue productId,
    _i3.Product? product,
    required _i4.PlatformType platform,
    String? source,
    int? viewDurationSeconds,
    bool? addedToCart,
    bool? purchased,
    DateTime? createdAt,
  }) : super._(
         id: id,
         userId: userId,
         user: user,
         productId: productId,
         product: product,
         platform: platform,
         source: source,
         viewDurationSeconds: viewDurationSeconds,
         addedToCart: addedToCart,
         purchased: purchased,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [ProductView]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ProductView copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? userId,
    Object? user = _Undefined,
    _i1.UuidValue? productId,
    Object? product = _Undefined,
    _i4.PlatformType? platform,
    Object? source = _Undefined,
    Object? viewDurationSeconds = _Undefined,
    bool? addedToCart,
    bool? purchased,
    DateTime? createdAt,
  }) {
    return ProductView(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      user: user is _i2.User? ? user : this.user?.copyWith(),
      productId: productId ?? this.productId,
      product: product is _i3.Product? ? product : this.product?.copyWith(),
      platform: platform ?? this.platform,
      source: source is String? ? source : this.source,
      viewDurationSeconds: viewDurationSeconds is int?
          ? viewDurationSeconds
          : this.viewDurationSeconds,
      addedToCart: addedToCart ?? this.addedToCart,
      purchased: purchased ?? this.purchased,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class ProductViewUpdateTable extends _i1.UpdateTable<ProductViewTable> {
  ProductViewUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> userId(_i1.UuidValue value) =>
      _i1.ColumnValue(
        table.userId,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> productId(
    _i1.UuidValue value,
  ) => _i1.ColumnValue(
    table.productId,
    value,
  );

  _i1.ColumnValue<_i4.PlatformType, _i4.PlatformType> platform(
    _i4.PlatformType value,
  ) => _i1.ColumnValue(
    table.platform,
    value,
  );

  _i1.ColumnValue<String, String> source(String? value) => _i1.ColumnValue(
    table.source,
    value,
  );

  _i1.ColumnValue<int, int> viewDurationSeconds(int? value) => _i1.ColumnValue(
    table.viewDurationSeconds,
    value,
  );

  _i1.ColumnValue<bool, bool> addedToCart(bool value) => _i1.ColumnValue(
    table.addedToCart,
    value,
  );

  _i1.ColumnValue<bool, bool> purchased(bool value) => _i1.ColumnValue(
    table.purchased,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );
}

class ProductViewTable extends _i1.Table<_i1.UuidValue> {
  ProductViewTable({super.tableRelation}) : super(tableName: 'product_views') {
    updateTable = ProductViewUpdateTable(this);
    userId = _i1.ColumnUuid(
      'userId',
      this,
    );
    productId = _i1.ColumnUuid(
      'productId',
      this,
    );
    platform = _i1.ColumnEnum(
      'platform',
      this,
      _i1.EnumSerialization.byName,
    );
    source = _i1.ColumnString(
      'source',
      this,
    );
    viewDurationSeconds = _i1.ColumnInt(
      'viewDurationSeconds',
      this,
    );
    addedToCart = _i1.ColumnBool(
      'addedToCart',
      this,
      hasDefault: true,
    );
    purchased = _i1.ColumnBool(
      'purchased',
      this,
      hasDefault: true,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
  }

  late final ProductViewUpdateTable updateTable;

  late final _i1.ColumnUuid userId;

  _i2.UserTable? _user;

  late final _i1.ColumnUuid productId;

  _i3.ProductTable? _product;

  late final _i1.ColumnEnum<_i4.PlatformType> platform;

  late final _i1.ColumnString source;

  late final _i1.ColumnInt viewDurationSeconds;

  late final _i1.ColumnBool addedToCart;

  late final _i1.ColumnBool purchased;

  late final _i1.ColumnDateTime createdAt;

  _i2.UserTable get user {
    if (_user != null) return _user!;
    _user = _i1.createRelationTable(
      relationFieldName: 'user',
      field: ProductView.t.userId,
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
      field: ProductView.t.productId,
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
    userId,
    productId,
    platform,
    source,
    viewDurationSeconds,
    addedToCart,
    purchased,
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
    return null;
  }
}

class ProductViewInclude extends _i1.IncludeObject {
  ProductViewInclude._({
    _i2.UserInclude? user,
    _i3.ProductInclude? product,
  }) {
    _user = user;
    _product = product;
  }

  _i2.UserInclude? _user;

  _i3.ProductInclude? _product;

  @override
  Map<String, _i1.Include?> get includes => {
    'user': _user,
    'product': _product,
  };

  @override
  _i1.Table<_i1.UuidValue> get table => ProductView.t;
}

class ProductViewIncludeList extends _i1.IncludeList {
  ProductViewIncludeList._({
    _i1.WhereExpressionBuilder<ProductViewTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ProductView.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue> get table => ProductView.t;
}

class ProductViewRepository {
  const ProductViewRepository._();

  final attachRow = const ProductViewAttachRowRepository._();

  /// Returns a list of [ProductView]s matching the given query parameters.
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
  Future<List<ProductView>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProductViewTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProductViewTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProductViewTable>? orderByList,
    _i1.Transaction? transaction,
    ProductViewInclude? include,
  }) async {
    return session.db.find<ProductView>(
      where: where?.call(ProductView.t),
      orderBy: orderBy?.call(ProductView.t),
      orderByList: orderByList?.call(ProductView.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [ProductView] matching the given query parameters.
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
  Future<ProductView?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProductViewTable>? where,
    int? offset,
    _i1.OrderByBuilder<ProductViewTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProductViewTable>? orderByList,
    _i1.Transaction? transaction,
    ProductViewInclude? include,
  }) async {
    return session.db.findFirstRow<ProductView>(
      where: where?.call(ProductView.t),
      orderBy: orderBy?.call(ProductView.t),
      orderByList: orderByList?.call(ProductView.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [ProductView] by its [id] or null if no such row exists.
  Future<ProductView?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
    ProductViewInclude? include,
  }) async {
    return session.db.findById<ProductView>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [ProductView]s in the list and returns the inserted rows.
  ///
  /// The returned [ProductView]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<ProductView>> insert(
    _i1.Session session,
    List<ProductView> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<ProductView>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [ProductView] and returns the inserted row.
  ///
  /// The returned [ProductView] will have its `id` field set.
  Future<ProductView> insertRow(
    _i1.Session session,
    ProductView row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ProductView>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [ProductView]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<ProductView>> update(
    _i1.Session session,
    List<ProductView> rows, {
    _i1.ColumnSelections<ProductViewTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<ProductView>(
      rows,
      columns: columns?.call(ProductView.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ProductView]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ProductView> updateRow(
    _i1.Session session,
    ProductView row, {
    _i1.ColumnSelections<ProductViewTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ProductView>(
      row,
      columns: columns?.call(ProductView.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ProductView] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<ProductView?> updateById(
    _i1.Session session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<ProductViewUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<ProductView>(
      id,
      columnValues: columnValues(ProductView.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [ProductView]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<ProductView>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<ProductViewUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<ProductViewTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProductViewTable>? orderBy,
    _i1.OrderByListBuilder<ProductViewTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<ProductView>(
      columnValues: columnValues(ProductView.t.updateTable),
      where: where(ProductView.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ProductView.t),
      orderByList: orderByList?.call(ProductView.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [ProductView]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<ProductView>> delete(
    _i1.Session session,
    List<ProductView> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ProductView>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [ProductView].
  Future<ProductView> deleteRow(
    _i1.Session session,
    ProductView row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ProductView>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<ProductView>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ProductViewTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ProductView>(
      where: where(ProductView.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProductViewTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ProductView>(
      where: where?.call(ProductView.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class ProductViewAttachRowRepository {
  const ProductViewAttachRowRepository._();

  /// Creates a relation between the given [ProductView] and [User]
  /// by setting the [ProductView]'s foreign key `userId` to refer to the [User].
  Future<void> user(
    _i1.Session session,
    ProductView productView,
    _i2.User user, {
    _i1.Transaction? transaction,
  }) async {
    if (productView.id == null) {
      throw ArgumentError.notNull('productView.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $productView = productView.copyWith(userId: user.id);
    await session.db.updateRow<ProductView>(
      $productView,
      columns: [ProductView.t.userId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [ProductView] and [Product]
  /// by setting the [ProductView]'s foreign key `productId` to refer to the [Product].
  Future<void> product(
    _i1.Session session,
    ProductView productView,
    _i3.Product product, {
    _i1.Transaction? transaction,
  }) async {
    if (productView.id == null) {
      throw ArgumentError.notNull('productView.id');
    }
    if (product.id == null) {
      throw ArgumentError.notNull('product.id');
    }

    var $productView = productView.copyWith(productId: product.id);
    await session.db.updateRow<ProductView>(
      $productView,
      columns: [ProductView.t.productId],
      transaction: transaction,
    );
  }
}
