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
import '../product/product_category.dart' as _i2;
import 'package:asami_server/src/generated/protocol.dart' as _i3;

abstract class ProductCategory
    implements _i1.TableRow<_i1.UuidValue>, _i1.ProtocolSerialization {
  ProductCategory._({
    _i1.UuidValue? id,
    required this.name,
    required this.slug,
    this.description,
    this.icon,
    this.parentId,
    this.parent,
    int? level,
    this.facebookCategoryId,
    this.facebookCategoryName,
    this.googleTaxonomyId,
    this.googleTaxonomyPath,
    int? displayOrder,
    bool? isActive,
    bool? isFeatured,
    int? productCount,
    this.keywords,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : id = id ?? _i1.Uuid().v4obj(),
       level = level ?? 0,
       displayOrder = displayOrder ?? 0,
       isActive = isActive ?? true,
       isFeatured = isFeatured ?? false,
       productCount = productCount ?? 0,
       createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory ProductCategory({
    _i1.UuidValue? id,
    required String name,
    required String slug,
    String? description,
    String? icon,
    _i1.UuidValue? parentId,
    _i2.ProductCategory? parent,
    int? level,
    int? facebookCategoryId,
    String? facebookCategoryName,
    int? googleTaxonomyId,
    String? googleTaxonomyPath,
    int? displayOrder,
    bool? isActive,
    bool? isFeatured,
    int? productCount,
    List<String>? keywords,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _ProductCategoryImpl;

  factory ProductCategory.fromJson(Map<String, dynamic> jsonSerialization) {
    return ProductCategory(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      name: jsonSerialization['name'] as String,
      slug: jsonSerialization['slug'] as String,
      description: jsonSerialization['description'] as String?,
      icon: jsonSerialization['icon'] as String?,
      parentId: jsonSerialization['parentId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['parentId']),
      parent: jsonSerialization['parent'] == null
          ? null
          : _i3.Protocol().deserialize<_i2.ProductCategory>(
              jsonSerialization['parent'],
            ),
      level: jsonSerialization['level'] as int?,
      facebookCategoryId: jsonSerialization['facebookCategoryId'] as int?,
      facebookCategoryName:
          jsonSerialization['facebookCategoryName'] as String?,
      googleTaxonomyId: jsonSerialization['googleTaxonomyId'] as int?,
      googleTaxonomyPath: jsonSerialization['googleTaxonomyPath'] as String?,
      displayOrder: jsonSerialization['displayOrder'] as int?,
      isActive: jsonSerialization['isActive'] as bool?,
      isFeatured: jsonSerialization['isFeatured'] as bool?,
      productCount: jsonSerialization['productCount'] as int?,
      keywords: jsonSerialization['keywords'] == null
          ? null
          : _i3.Protocol().deserialize<List<String>>(
              jsonSerialization['keywords'],
            ),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  static final t = ProductCategoryTable();

  static const db = ProductCategoryRepository._();

  @override
  _i1.UuidValue id;

  String name;

  String slug;

  String? description;

  String? icon;

  _i1.UuidValue? parentId;

  _i2.ProductCategory? parent;

  int level;

  int? facebookCategoryId;

  String? facebookCategoryName;

  int? googleTaxonomyId;

  String? googleTaxonomyPath;

  int displayOrder;

  bool isActive;

  bool isFeatured;

  int productCount;

  List<String>? keywords;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _i1.Table<_i1.UuidValue> get table => t;

  /// Returns a shallow copy of this [ProductCategory]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ProductCategory copyWith({
    _i1.UuidValue? id,
    String? name,
    String? slug,
    String? description,
    String? icon,
    _i1.UuidValue? parentId,
    _i2.ProductCategory? parent,
    int? level,
    int? facebookCategoryId,
    String? facebookCategoryName,
    int? googleTaxonomyId,
    String? googleTaxonomyPath,
    int? displayOrder,
    bool? isActive,
    bool? isFeatured,
    int? productCount,
    List<String>? keywords,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ProductCategory',
      'id': id.toJson(),
      'name': name,
      'slug': slug,
      if (description != null) 'description': description,
      if (icon != null) 'icon': icon,
      if (parentId != null) 'parentId': parentId?.toJson(),
      if (parent != null) 'parent': parent?.toJson(),
      'level': level,
      if (facebookCategoryId != null) 'facebookCategoryId': facebookCategoryId,
      if (facebookCategoryName != null)
        'facebookCategoryName': facebookCategoryName,
      if (googleTaxonomyId != null) 'googleTaxonomyId': googleTaxonomyId,
      if (googleTaxonomyPath != null) 'googleTaxonomyPath': googleTaxonomyPath,
      'displayOrder': displayOrder,
      'isActive': isActive,
      'isFeatured': isFeatured,
      'productCount': productCount,
      if (keywords != null) 'keywords': keywords?.toJson(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ProductCategory',
      'id': id.toJson(),
      'name': name,
      'slug': slug,
      if (description != null) 'description': description,
      if (icon != null) 'icon': icon,
      if (parentId != null) 'parentId': parentId?.toJson(),
      if (parent != null) 'parent': parent?.toJsonForProtocol(),
      'level': level,
      if (facebookCategoryId != null) 'facebookCategoryId': facebookCategoryId,
      if (facebookCategoryName != null)
        'facebookCategoryName': facebookCategoryName,
      if (googleTaxonomyId != null) 'googleTaxonomyId': googleTaxonomyId,
      if (googleTaxonomyPath != null) 'googleTaxonomyPath': googleTaxonomyPath,
      'displayOrder': displayOrder,
      'isActive': isActive,
      'isFeatured': isFeatured,
      'productCount': productCount,
      if (keywords != null) 'keywords': keywords?.toJson(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static ProductCategoryInclude include({_i2.ProductCategoryInclude? parent}) {
    return ProductCategoryInclude._(parent: parent);
  }

  static ProductCategoryIncludeList includeList({
    _i1.WhereExpressionBuilder<ProductCategoryTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProductCategoryTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProductCategoryTable>? orderByList,
    ProductCategoryInclude? include,
  }) {
    return ProductCategoryIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ProductCategory.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ProductCategory.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ProductCategoryImpl extends ProductCategory {
  _ProductCategoryImpl({
    _i1.UuidValue? id,
    required String name,
    required String slug,
    String? description,
    String? icon,
    _i1.UuidValue? parentId,
    _i2.ProductCategory? parent,
    int? level,
    int? facebookCategoryId,
    String? facebookCategoryName,
    int? googleTaxonomyId,
    String? googleTaxonomyPath,
    int? displayOrder,
    bool? isActive,
    bool? isFeatured,
    int? productCount,
    List<String>? keywords,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         name: name,
         slug: slug,
         description: description,
         icon: icon,
         parentId: parentId,
         parent: parent,
         level: level,
         facebookCategoryId: facebookCategoryId,
         facebookCategoryName: facebookCategoryName,
         googleTaxonomyId: googleTaxonomyId,
         googleTaxonomyPath: googleTaxonomyPath,
         displayOrder: displayOrder,
         isActive: isActive,
         isFeatured: isFeatured,
         productCount: productCount,
         keywords: keywords,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [ProductCategory]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ProductCategory copyWith({
    _i1.UuidValue? id,
    String? name,
    String? slug,
    Object? description = _Undefined,
    Object? icon = _Undefined,
    Object? parentId = _Undefined,
    Object? parent = _Undefined,
    int? level,
    Object? facebookCategoryId = _Undefined,
    Object? facebookCategoryName = _Undefined,
    Object? googleTaxonomyId = _Undefined,
    Object? googleTaxonomyPath = _Undefined,
    int? displayOrder,
    bool? isActive,
    bool? isFeatured,
    int? productCount,
    Object? keywords = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ProductCategory(
      id: id ?? this.id,
      name: name ?? this.name,
      slug: slug ?? this.slug,
      description: description is String? ? description : this.description,
      icon: icon is String? ? icon : this.icon,
      parentId: parentId is _i1.UuidValue? ? parentId : this.parentId,
      parent: parent is _i2.ProductCategory? ? parent : this.parent?.copyWith(),
      level: level ?? this.level,
      facebookCategoryId: facebookCategoryId is int?
          ? facebookCategoryId
          : this.facebookCategoryId,
      facebookCategoryName: facebookCategoryName is String?
          ? facebookCategoryName
          : this.facebookCategoryName,
      googleTaxonomyId: googleTaxonomyId is int?
          ? googleTaxonomyId
          : this.googleTaxonomyId,
      googleTaxonomyPath: googleTaxonomyPath is String?
          ? googleTaxonomyPath
          : this.googleTaxonomyPath,
      displayOrder: displayOrder ?? this.displayOrder,
      isActive: isActive ?? this.isActive,
      isFeatured: isFeatured ?? this.isFeatured,
      productCount: productCount ?? this.productCount,
      keywords: keywords is List<String>?
          ? keywords
          : this.keywords?.map((e0) => e0).toList(),
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class ProductCategoryUpdateTable extends _i1.UpdateTable<ProductCategoryTable> {
  ProductCategoryUpdateTable(super.table);

  _i1.ColumnValue<String, String> name(String value) => _i1.ColumnValue(
    table.name,
    value,
  );

  _i1.ColumnValue<String, String> slug(String value) => _i1.ColumnValue(
    table.slug,
    value,
  );

  _i1.ColumnValue<String, String> description(String? value) => _i1.ColumnValue(
    table.description,
    value,
  );

  _i1.ColumnValue<String, String> icon(String? value) => _i1.ColumnValue(
    table.icon,
    value,
  );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> parentId(
    _i1.UuidValue? value,
  ) => _i1.ColumnValue(
    table.parentId,
    value,
  );

  _i1.ColumnValue<int, int> level(int value) => _i1.ColumnValue(
    table.level,
    value,
  );

  _i1.ColumnValue<int, int> facebookCategoryId(int? value) => _i1.ColumnValue(
    table.facebookCategoryId,
    value,
  );

  _i1.ColumnValue<String, String> facebookCategoryName(String? value) =>
      _i1.ColumnValue(
        table.facebookCategoryName,
        value,
      );

  _i1.ColumnValue<int, int> googleTaxonomyId(int? value) => _i1.ColumnValue(
    table.googleTaxonomyId,
    value,
  );

  _i1.ColumnValue<String, String> googleTaxonomyPath(String? value) =>
      _i1.ColumnValue(
        table.googleTaxonomyPath,
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

  _i1.ColumnValue<bool, bool> isFeatured(bool value) => _i1.ColumnValue(
    table.isFeatured,
    value,
  );

  _i1.ColumnValue<int, int> productCount(int value) => _i1.ColumnValue(
    table.productCount,
    value,
  );

  _i1.ColumnValue<List<String>, List<String>> keywords(List<String>? value) =>
      _i1.ColumnValue(
        table.keywords,
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

class ProductCategoryTable extends _i1.Table<_i1.UuidValue> {
  ProductCategoryTable({super.tableRelation})
    : super(tableName: 'product_categories') {
    updateTable = ProductCategoryUpdateTable(this);
    name = _i1.ColumnString(
      'name',
      this,
    );
    slug = _i1.ColumnString(
      'slug',
      this,
    );
    description = _i1.ColumnString(
      'description',
      this,
    );
    icon = _i1.ColumnString(
      'icon',
      this,
    );
    parentId = _i1.ColumnUuid(
      'parentId',
      this,
    );
    level = _i1.ColumnInt(
      'level',
      this,
      hasDefault: true,
    );
    facebookCategoryId = _i1.ColumnInt(
      'facebookCategoryId',
      this,
    );
    facebookCategoryName = _i1.ColumnString(
      'facebookCategoryName',
      this,
    );
    googleTaxonomyId = _i1.ColumnInt(
      'googleTaxonomyId',
      this,
    );
    googleTaxonomyPath = _i1.ColumnString(
      'googleTaxonomyPath',
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
    isFeatured = _i1.ColumnBool(
      'isFeatured',
      this,
      hasDefault: true,
    );
    productCount = _i1.ColumnInt(
      'productCount',
      this,
      hasDefault: true,
    );
    keywords = _i1.ColumnSerializable<List<String>>(
      'keywords',
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

  late final ProductCategoryUpdateTable updateTable;

  late final _i1.ColumnString name;

  late final _i1.ColumnString slug;

  late final _i1.ColumnString description;

  late final _i1.ColumnString icon;

  late final _i1.ColumnUuid parentId;

  _i2.ProductCategoryTable? _parent;

  late final _i1.ColumnInt level;

  late final _i1.ColumnInt facebookCategoryId;

  late final _i1.ColumnString facebookCategoryName;

  late final _i1.ColumnInt googleTaxonomyId;

  late final _i1.ColumnString googleTaxonomyPath;

  late final _i1.ColumnInt displayOrder;

  late final _i1.ColumnBool isActive;

  late final _i1.ColumnBool isFeatured;

  late final _i1.ColumnInt productCount;

  late final _i1.ColumnSerializable<List<String>> keywords;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  _i2.ProductCategoryTable get parent {
    if (_parent != null) return _parent!;
    _parent = _i1.createRelationTable(
      relationFieldName: 'parent',
      field: ProductCategory.t.parentId,
      foreignField: _i2.ProductCategory.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.ProductCategoryTable(tableRelation: foreignTableRelation),
    );
    return _parent!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    name,
    slug,
    description,
    icon,
    parentId,
    level,
    facebookCategoryId,
    facebookCategoryName,
    googleTaxonomyId,
    googleTaxonomyPath,
    displayOrder,
    isActive,
    isFeatured,
    productCount,
    keywords,
    createdAt,
    updatedAt,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'parent') {
      return parent;
    }
    return null;
  }
}

class ProductCategoryInclude extends _i1.IncludeObject {
  ProductCategoryInclude._({_i2.ProductCategoryInclude? parent}) {
    _parent = parent;
  }

  _i2.ProductCategoryInclude? _parent;

  @override
  Map<String, _i1.Include?> get includes => {'parent': _parent};

  @override
  _i1.Table<_i1.UuidValue> get table => ProductCategory.t;
}

class ProductCategoryIncludeList extends _i1.IncludeList {
  ProductCategoryIncludeList._({
    _i1.WhereExpressionBuilder<ProductCategoryTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ProductCategory.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue> get table => ProductCategory.t;
}

class ProductCategoryRepository {
  const ProductCategoryRepository._();

  final attachRow = const ProductCategoryAttachRowRepository._();

  final detachRow = const ProductCategoryDetachRowRepository._();

  /// Returns a list of [ProductCategory]s matching the given query parameters.
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
  Future<List<ProductCategory>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProductCategoryTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProductCategoryTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProductCategoryTable>? orderByList,
    _i1.Transaction? transaction,
    ProductCategoryInclude? include,
  }) async {
    return session.db.find<ProductCategory>(
      where: where?.call(ProductCategory.t),
      orderBy: orderBy?.call(ProductCategory.t),
      orderByList: orderByList?.call(ProductCategory.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [ProductCategory] matching the given query parameters.
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
  Future<ProductCategory?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProductCategoryTable>? where,
    int? offset,
    _i1.OrderByBuilder<ProductCategoryTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProductCategoryTable>? orderByList,
    _i1.Transaction? transaction,
    ProductCategoryInclude? include,
  }) async {
    return session.db.findFirstRow<ProductCategory>(
      where: where?.call(ProductCategory.t),
      orderBy: orderBy?.call(ProductCategory.t),
      orderByList: orderByList?.call(ProductCategory.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [ProductCategory] by its [id] or null if no such row exists.
  Future<ProductCategory?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
    ProductCategoryInclude? include,
  }) async {
    return session.db.findById<ProductCategory>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [ProductCategory]s in the list and returns the inserted rows.
  ///
  /// The returned [ProductCategory]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<ProductCategory>> insert(
    _i1.Session session,
    List<ProductCategory> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<ProductCategory>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [ProductCategory] and returns the inserted row.
  ///
  /// The returned [ProductCategory] will have its `id` field set.
  Future<ProductCategory> insertRow(
    _i1.Session session,
    ProductCategory row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ProductCategory>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [ProductCategory]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<ProductCategory>> update(
    _i1.Session session,
    List<ProductCategory> rows, {
    _i1.ColumnSelections<ProductCategoryTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<ProductCategory>(
      rows,
      columns: columns?.call(ProductCategory.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ProductCategory]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ProductCategory> updateRow(
    _i1.Session session,
    ProductCategory row, {
    _i1.ColumnSelections<ProductCategoryTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ProductCategory>(
      row,
      columns: columns?.call(ProductCategory.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ProductCategory] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<ProductCategory?> updateById(
    _i1.Session session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<ProductCategoryUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<ProductCategory>(
      id,
      columnValues: columnValues(ProductCategory.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [ProductCategory]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<ProductCategory>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<ProductCategoryUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<ProductCategoryTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProductCategoryTable>? orderBy,
    _i1.OrderByListBuilder<ProductCategoryTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<ProductCategory>(
      columnValues: columnValues(ProductCategory.t.updateTable),
      where: where(ProductCategory.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ProductCategory.t),
      orderByList: orderByList?.call(ProductCategory.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [ProductCategory]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<ProductCategory>> delete(
    _i1.Session session,
    List<ProductCategory> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ProductCategory>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [ProductCategory].
  Future<ProductCategory> deleteRow(
    _i1.Session session,
    ProductCategory row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ProductCategory>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<ProductCategory>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ProductCategoryTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ProductCategory>(
      where: where(ProductCategory.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProductCategoryTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ProductCategory>(
      where: where?.call(ProductCategory.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class ProductCategoryAttachRowRepository {
  const ProductCategoryAttachRowRepository._();

  /// Creates a relation between the given [ProductCategory] and [ProductCategory]
  /// by setting the [ProductCategory]'s foreign key `parentId` to refer to the [ProductCategory].
  Future<void> parent(
    _i1.Session session,
    ProductCategory productCategory,
    _i2.ProductCategory parent, {
    _i1.Transaction? transaction,
  }) async {
    if (productCategory.id == null) {
      throw ArgumentError.notNull('productCategory.id');
    }
    if (parent.id == null) {
      throw ArgumentError.notNull('parent.id');
    }

    var $productCategory = productCategory.copyWith(parentId: parent.id);
    await session.db.updateRow<ProductCategory>(
      $productCategory,
      columns: [ProductCategory.t.parentId],
      transaction: transaction,
    );
  }
}

class ProductCategoryDetachRowRepository {
  const ProductCategoryDetachRowRepository._();

  /// Detaches the relation between this [ProductCategory] and the [ProductCategory] set in `parent`
  /// by setting the [ProductCategory]'s foreign key `parentId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> parent(
    _i1.Session session,
    ProductCategory productCategory, {
    _i1.Transaction? transaction,
  }) async {
    if (productCategory.id == null) {
      throw ArgumentError.notNull('productCategory.id');
    }

    var $productCategory = productCategory.copyWith(parentId: null);
    await session.db.updateRow<ProductCategory>(
      $productCategory,
      columns: [ProductCategory.t.parentId],
      transaction: transaction,
    );
  }
}
