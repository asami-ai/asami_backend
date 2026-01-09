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
import '../product/product.dart' as _i2;
import 'package:asami_server/src/generated/protocol.dart' as _i3;

abstract class ProductVariant
    implements _i1.TableRow<_i1.UuidValue>, _i1.ProtocolSerialization {
  ProductVariant._({
    _i1.UuidValue? id,
    required this.productId,
    this.product,
    required this.name,
    this.sku,
    this.barcode,
    this.color,
    this.size,
    this.material,
    this.style,
    this.customAttributes,
    required this.price,
    this.discountPrice,
    int? quantity,
    this.imageUrl,
    this.images,
    bool? isActive,
    bool? isDefault,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : id = id ?? _i1.Uuid().v4obj(),
       quantity = quantity ?? 0,
       isActive = isActive ?? true,
       isDefault = isDefault ?? false,
       createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory ProductVariant({
    _i1.UuidValue? id,
    required _i1.UuidValue productId,
    _i2.Product? product,
    required String name,
    String? sku,
    String? barcode,
    String? color,
    String? size,
    String? material,
    String? style,
    String? customAttributes,
    required double price,
    double? discountPrice,
    int? quantity,
    String? imageUrl,
    List<String>? images,
    bool? isActive,
    bool? isDefault,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _ProductVariantImpl;

  factory ProductVariant.fromJson(Map<String, dynamic> jsonSerialization) {
    return ProductVariant(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      productId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['productId'],
      ),
      product: jsonSerialization['product'] == null
          ? null
          : _i3.Protocol().deserialize<_i2.Product>(
              jsonSerialization['product'],
            ),
      name: jsonSerialization['name'] as String,
      sku: jsonSerialization['sku'] as String?,
      barcode: jsonSerialization['barcode'] as String?,
      color: jsonSerialization['color'] as String?,
      size: jsonSerialization['size'] as String?,
      material: jsonSerialization['material'] as String?,
      style: jsonSerialization['style'] as String?,
      customAttributes: jsonSerialization['customAttributes'] as String?,
      price: (jsonSerialization['price'] as num).toDouble(),
      discountPrice: (jsonSerialization['discountPrice'] as num?)?.toDouble(),
      quantity: jsonSerialization['quantity'] as int?,
      imageUrl: jsonSerialization['imageUrl'] as String?,
      images: jsonSerialization['images'] == null
          ? null
          : _i3.Protocol().deserialize<List<String>>(
              jsonSerialization['images'],
            ),
      isActive: jsonSerialization['isActive'] as bool?,
      isDefault: jsonSerialization['isDefault'] as bool?,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  static final t = ProductVariantTable();

  static const db = ProductVariantRepository._();

  @override
  _i1.UuidValue id;

  _i1.UuidValue productId;

  _i2.Product? product;

  String name;

  String? sku;

  String? barcode;

  String? color;

  String? size;

  String? material;

  String? style;

  String? customAttributes;

  double price;

  double? discountPrice;

  int quantity;

  String? imageUrl;

  List<String>? images;

  bool isActive;

  bool isDefault;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _i1.Table<_i1.UuidValue> get table => t;

  /// Returns a shallow copy of this [ProductVariant]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ProductVariant copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? productId,
    _i2.Product? product,
    String? name,
    String? sku,
    String? barcode,
    String? color,
    String? size,
    String? material,
    String? style,
    String? customAttributes,
    double? price,
    double? discountPrice,
    int? quantity,
    String? imageUrl,
    List<String>? images,
    bool? isActive,
    bool? isDefault,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ProductVariant',
      'id': id.toJson(),
      'productId': productId.toJson(),
      if (product != null) 'product': product?.toJson(),
      'name': name,
      if (sku != null) 'sku': sku,
      if (barcode != null) 'barcode': barcode,
      if (color != null) 'color': color,
      if (size != null) 'size': size,
      if (material != null) 'material': material,
      if (style != null) 'style': style,
      if (customAttributes != null) 'customAttributes': customAttributes,
      'price': price,
      if (discountPrice != null) 'discountPrice': discountPrice,
      'quantity': quantity,
      if (imageUrl != null) 'imageUrl': imageUrl,
      if (images != null) 'images': images?.toJson(),
      'isActive': isActive,
      'isDefault': isDefault,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ProductVariant',
      'id': id.toJson(),
      'productId': productId.toJson(),
      if (product != null) 'product': product?.toJsonForProtocol(),
      'name': name,
      if (sku != null) 'sku': sku,
      if (barcode != null) 'barcode': barcode,
      if (color != null) 'color': color,
      if (size != null) 'size': size,
      if (material != null) 'material': material,
      if (style != null) 'style': style,
      if (customAttributes != null) 'customAttributes': customAttributes,
      'price': price,
      if (discountPrice != null) 'discountPrice': discountPrice,
      'quantity': quantity,
      if (imageUrl != null) 'imageUrl': imageUrl,
      if (images != null) 'images': images?.toJson(),
      'isActive': isActive,
      'isDefault': isDefault,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static ProductVariantInclude include({_i2.ProductInclude? product}) {
    return ProductVariantInclude._(product: product);
  }

  static ProductVariantIncludeList includeList({
    _i1.WhereExpressionBuilder<ProductVariantTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProductVariantTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProductVariantTable>? orderByList,
    ProductVariantInclude? include,
  }) {
    return ProductVariantIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ProductVariant.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ProductVariant.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ProductVariantImpl extends ProductVariant {
  _ProductVariantImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue productId,
    _i2.Product? product,
    required String name,
    String? sku,
    String? barcode,
    String? color,
    String? size,
    String? material,
    String? style,
    String? customAttributes,
    required double price,
    double? discountPrice,
    int? quantity,
    String? imageUrl,
    List<String>? images,
    bool? isActive,
    bool? isDefault,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         productId: productId,
         product: product,
         name: name,
         sku: sku,
         barcode: barcode,
         color: color,
         size: size,
         material: material,
         style: style,
         customAttributes: customAttributes,
         price: price,
         discountPrice: discountPrice,
         quantity: quantity,
         imageUrl: imageUrl,
         images: images,
         isActive: isActive,
         isDefault: isDefault,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [ProductVariant]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ProductVariant copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? productId,
    Object? product = _Undefined,
    String? name,
    Object? sku = _Undefined,
    Object? barcode = _Undefined,
    Object? color = _Undefined,
    Object? size = _Undefined,
    Object? material = _Undefined,
    Object? style = _Undefined,
    Object? customAttributes = _Undefined,
    double? price,
    Object? discountPrice = _Undefined,
    int? quantity,
    Object? imageUrl = _Undefined,
    Object? images = _Undefined,
    bool? isActive,
    bool? isDefault,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ProductVariant(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      product: product is _i2.Product? ? product : this.product?.copyWith(),
      name: name ?? this.name,
      sku: sku is String? ? sku : this.sku,
      barcode: barcode is String? ? barcode : this.barcode,
      color: color is String? ? color : this.color,
      size: size is String? ? size : this.size,
      material: material is String? ? material : this.material,
      style: style is String? ? style : this.style,
      customAttributes: customAttributes is String?
          ? customAttributes
          : this.customAttributes,
      price: price ?? this.price,
      discountPrice: discountPrice is double?
          ? discountPrice
          : this.discountPrice,
      quantity: quantity ?? this.quantity,
      imageUrl: imageUrl is String? ? imageUrl : this.imageUrl,
      images: images is List<String>?
          ? images
          : this.images?.map((e0) => e0).toList(),
      isActive: isActive ?? this.isActive,
      isDefault: isDefault ?? this.isDefault,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class ProductVariantUpdateTable extends _i1.UpdateTable<ProductVariantTable> {
  ProductVariantUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> productId(
    _i1.UuidValue value,
  ) => _i1.ColumnValue(
    table.productId,
    value,
  );

  _i1.ColumnValue<String, String> name(String value) => _i1.ColumnValue(
    table.name,
    value,
  );

  _i1.ColumnValue<String, String> sku(String? value) => _i1.ColumnValue(
    table.sku,
    value,
  );

  _i1.ColumnValue<String, String> barcode(String? value) => _i1.ColumnValue(
    table.barcode,
    value,
  );

  _i1.ColumnValue<String, String> color(String? value) => _i1.ColumnValue(
    table.color,
    value,
  );

  _i1.ColumnValue<String, String> size(String? value) => _i1.ColumnValue(
    table.size,
    value,
  );

  _i1.ColumnValue<String, String> material(String? value) => _i1.ColumnValue(
    table.material,
    value,
  );

  _i1.ColumnValue<String, String> style(String? value) => _i1.ColumnValue(
    table.style,
    value,
  );

  _i1.ColumnValue<String, String> customAttributes(String? value) =>
      _i1.ColumnValue(
        table.customAttributes,
        value,
      );

  _i1.ColumnValue<double, double> price(double value) => _i1.ColumnValue(
    table.price,
    value,
  );

  _i1.ColumnValue<double, double> discountPrice(double? value) =>
      _i1.ColumnValue(
        table.discountPrice,
        value,
      );

  _i1.ColumnValue<int, int> quantity(int value) => _i1.ColumnValue(
    table.quantity,
    value,
  );

  _i1.ColumnValue<String, String> imageUrl(String? value) => _i1.ColumnValue(
    table.imageUrl,
    value,
  );

  _i1.ColumnValue<List<String>, List<String>> images(List<String>? value) =>
      _i1.ColumnValue(
        table.images,
        value,
      );

  _i1.ColumnValue<bool, bool> isActive(bool value) => _i1.ColumnValue(
    table.isActive,
    value,
  );

  _i1.ColumnValue<bool, bool> isDefault(bool value) => _i1.ColumnValue(
    table.isDefault,
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

class ProductVariantTable extends _i1.Table<_i1.UuidValue> {
  ProductVariantTable({super.tableRelation})
    : super(tableName: 'product_variants') {
    updateTable = ProductVariantUpdateTable(this);
    productId = _i1.ColumnUuid(
      'productId',
      this,
    );
    name = _i1.ColumnString(
      'name',
      this,
    );
    sku = _i1.ColumnString(
      'sku',
      this,
    );
    barcode = _i1.ColumnString(
      'barcode',
      this,
    );
    color = _i1.ColumnString(
      'color',
      this,
    );
    size = _i1.ColumnString(
      'size',
      this,
    );
    material = _i1.ColumnString(
      'material',
      this,
    );
    style = _i1.ColumnString(
      'style',
      this,
    );
    customAttributes = _i1.ColumnString(
      'customAttributes',
      this,
    );
    price = _i1.ColumnDouble(
      'price',
      this,
    );
    discountPrice = _i1.ColumnDouble(
      'discountPrice',
      this,
    );
    quantity = _i1.ColumnInt(
      'quantity',
      this,
      hasDefault: true,
    );
    imageUrl = _i1.ColumnString(
      'imageUrl',
      this,
    );
    images = _i1.ColumnSerializable<List<String>>(
      'images',
      this,
    );
    isActive = _i1.ColumnBool(
      'isActive',
      this,
      hasDefault: true,
    );
    isDefault = _i1.ColumnBool(
      'isDefault',
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

  late final ProductVariantUpdateTable updateTable;

  late final _i1.ColumnUuid productId;

  _i2.ProductTable? _product;

  late final _i1.ColumnString name;

  late final _i1.ColumnString sku;

  late final _i1.ColumnString barcode;

  late final _i1.ColumnString color;

  late final _i1.ColumnString size;

  late final _i1.ColumnString material;

  late final _i1.ColumnString style;

  late final _i1.ColumnString customAttributes;

  late final _i1.ColumnDouble price;

  late final _i1.ColumnDouble discountPrice;

  late final _i1.ColumnInt quantity;

  late final _i1.ColumnString imageUrl;

  late final _i1.ColumnSerializable<List<String>> images;

  late final _i1.ColumnBool isActive;

  late final _i1.ColumnBool isDefault;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  _i2.ProductTable get product {
    if (_product != null) return _product!;
    _product = _i1.createRelationTable(
      relationFieldName: 'product',
      field: ProductVariant.t.productId,
      foreignField: _i2.Product.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.ProductTable(tableRelation: foreignTableRelation),
    );
    return _product!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    productId,
    name,
    sku,
    barcode,
    color,
    size,
    material,
    style,
    customAttributes,
    price,
    discountPrice,
    quantity,
    imageUrl,
    images,
    isActive,
    isDefault,
    createdAt,
    updatedAt,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'product') {
      return product;
    }
    return null;
  }
}

class ProductVariantInclude extends _i1.IncludeObject {
  ProductVariantInclude._({_i2.ProductInclude? product}) {
    _product = product;
  }

  _i2.ProductInclude? _product;

  @override
  Map<String, _i1.Include?> get includes => {'product': _product};

  @override
  _i1.Table<_i1.UuidValue> get table => ProductVariant.t;
}

class ProductVariantIncludeList extends _i1.IncludeList {
  ProductVariantIncludeList._({
    _i1.WhereExpressionBuilder<ProductVariantTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ProductVariant.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue> get table => ProductVariant.t;
}

class ProductVariantRepository {
  const ProductVariantRepository._();

  final attachRow = const ProductVariantAttachRowRepository._();

  /// Returns a list of [ProductVariant]s matching the given query parameters.
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
  Future<List<ProductVariant>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProductVariantTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProductVariantTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProductVariantTable>? orderByList,
    _i1.Transaction? transaction,
    ProductVariantInclude? include,
  }) async {
    return session.db.find<ProductVariant>(
      where: where?.call(ProductVariant.t),
      orderBy: orderBy?.call(ProductVariant.t),
      orderByList: orderByList?.call(ProductVariant.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [ProductVariant] matching the given query parameters.
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
  Future<ProductVariant?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProductVariantTable>? where,
    int? offset,
    _i1.OrderByBuilder<ProductVariantTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProductVariantTable>? orderByList,
    _i1.Transaction? transaction,
    ProductVariantInclude? include,
  }) async {
    return session.db.findFirstRow<ProductVariant>(
      where: where?.call(ProductVariant.t),
      orderBy: orderBy?.call(ProductVariant.t),
      orderByList: orderByList?.call(ProductVariant.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [ProductVariant] by its [id] or null if no such row exists.
  Future<ProductVariant?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
    ProductVariantInclude? include,
  }) async {
    return session.db.findById<ProductVariant>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [ProductVariant]s in the list and returns the inserted rows.
  ///
  /// The returned [ProductVariant]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<ProductVariant>> insert(
    _i1.Session session,
    List<ProductVariant> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<ProductVariant>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [ProductVariant] and returns the inserted row.
  ///
  /// The returned [ProductVariant] will have its `id` field set.
  Future<ProductVariant> insertRow(
    _i1.Session session,
    ProductVariant row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ProductVariant>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [ProductVariant]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<ProductVariant>> update(
    _i1.Session session,
    List<ProductVariant> rows, {
    _i1.ColumnSelections<ProductVariantTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<ProductVariant>(
      rows,
      columns: columns?.call(ProductVariant.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ProductVariant]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ProductVariant> updateRow(
    _i1.Session session,
    ProductVariant row, {
    _i1.ColumnSelections<ProductVariantTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ProductVariant>(
      row,
      columns: columns?.call(ProductVariant.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ProductVariant] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<ProductVariant?> updateById(
    _i1.Session session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<ProductVariantUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<ProductVariant>(
      id,
      columnValues: columnValues(ProductVariant.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [ProductVariant]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<ProductVariant>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<ProductVariantUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<ProductVariantTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProductVariantTable>? orderBy,
    _i1.OrderByListBuilder<ProductVariantTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<ProductVariant>(
      columnValues: columnValues(ProductVariant.t.updateTable),
      where: where(ProductVariant.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ProductVariant.t),
      orderByList: orderByList?.call(ProductVariant.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [ProductVariant]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<ProductVariant>> delete(
    _i1.Session session,
    List<ProductVariant> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ProductVariant>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [ProductVariant].
  Future<ProductVariant> deleteRow(
    _i1.Session session,
    ProductVariant row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ProductVariant>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<ProductVariant>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ProductVariantTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ProductVariant>(
      where: where(ProductVariant.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProductVariantTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ProductVariant>(
      where: where?.call(ProductVariant.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class ProductVariantAttachRowRepository {
  const ProductVariantAttachRowRepository._();

  /// Creates a relation between the given [ProductVariant] and [Product]
  /// by setting the [ProductVariant]'s foreign key `productId` to refer to the [Product].
  Future<void> product(
    _i1.Session session,
    ProductVariant productVariant,
    _i2.Product product, {
    _i1.Transaction? transaction,
  }) async {
    if (productVariant.id == null) {
      throw ArgumentError.notNull('productVariant.id');
    }
    if (product.id == null) {
      throw ArgumentError.notNull('product.id');
    }

    var $productVariant = productVariant.copyWith(productId: product.id);
    await session.db.updateRow<ProductVariant>(
      $productVariant,
      columns: [ProductVariant.t.productId],
      transaction: transaction,
    );
  }
}
