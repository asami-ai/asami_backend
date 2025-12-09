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
import '../product/category.dart' as _i2;

abstract class Category
    implements _i1.TableRow<_i1.UuidValue>, _i1.ProtocolSerialization {
  Category._({
    _i1.UuidValue? id,
    required this.name,
    required this.slug,
    this.description,
    this.parentCategoryId,
    this.parentCategory,
    this.iconUrl,
    this.imageUrl,
    int? displayOrder,
    bool? isActive,
    int? productCount,
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : id = id ?? _i1.Uuid().v4obj(),
        displayOrder = displayOrder ?? 0,
        isActive = isActive ?? true,
        productCount = productCount ?? 0,
        createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  factory Category({
    _i1.UuidValue? id,
    required String name,
    required String slug,
    String? description,
    _i1.UuidValue? parentCategoryId,
    _i2.Category? parentCategory,
    String? iconUrl,
    String? imageUrl,
    int? displayOrder,
    bool? isActive,
    int? productCount,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _CategoryImpl;

  factory Category.fromJson(Map<String, dynamic> jsonSerialization) {
    return Category(
      id: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      name: jsonSerialization['name'] as String,
      slug: jsonSerialization['slug'] as String,
      description: jsonSerialization['description'] as String?,
      parentCategoryId: jsonSerialization['parentCategoryId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(
              jsonSerialization['parentCategoryId']),
      parentCategory: jsonSerialization['parentCategory'] == null
          ? null
          : _i2.Category.fromJson(
              (jsonSerialization['parentCategory'] as Map<String, dynamic>)),
      iconUrl: jsonSerialization['iconUrl'] as String?,
      imageUrl: jsonSerialization['imageUrl'] as String?,
      displayOrder: jsonSerialization['displayOrder'] as int,
      isActive: jsonSerialization['isActive'] as bool,
      productCount: jsonSerialization['productCount'] as int,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  static final t = CategoryTable();

  static const db = CategoryRepository._();

  @override
  _i1.UuidValue id;

  String name;

  String slug;

  String? description;

  _i1.UuidValue? parentCategoryId;

  _i2.Category? parentCategory;

  String? iconUrl;

  String? imageUrl;

  int displayOrder;

  bool isActive;

  int productCount;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _i1.Table<_i1.UuidValue> get table => t;

  /// Returns a shallow copy of this [Category]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Category copyWith({
    _i1.UuidValue? id,
    String? name,
    String? slug,
    String? description,
    _i1.UuidValue? parentCategoryId,
    _i2.Category? parentCategory,
    String? iconUrl,
    String? imageUrl,
    int? displayOrder,
    bool? isActive,
    int? productCount,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'name': name,
      'slug': slug,
      if (description != null) 'description': description,
      if (parentCategoryId != null)
        'parentCategoryId': parentCategoryId?.toJson(),
      if (parentCategory != null) 'parentCategory': parentCategory?.toJson(),
      if (iconUrl != null) 'iconUrl': iconUrl,
      if (imageUrl != null) 'imageUrl': imageUrl,
      'displayOrder': displayOrder,
      'isActive': isActive,
      'productCount': productCount,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'id': id.toJson(),
      'name': name,
      'slug': slug,
      if (description != null) 'description': description,
      if (parentCategoryId != null)
        'parentCategoryId': parentCategoryId?.toJson(),
      if (parentCategory != null)
        'parentCategory': parentCategory?.toJsonForProtocol(),
      if (iconUrl != null) 'iconUrl': iconUrl,
      if (imageUrl != null) 'imageUrl': imageUrl,
      'displayOrder': displayOrder,
      'isActive': isActive,
      'productCount': productCount,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static CategoryInclude include({_i2.CategoryInclude? parentCategory}) {
    return CategoryInclude._(parentCategory: parentCategory);
  }

  static CategoryIncludeList includeList({
    _i1.WhereExpressionBuilder<CategoryTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CategoryTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CategoryTable>? orderByList,
    CategoryInclude? include,
  }) {
    return CategoryIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Category.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Category.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CategoryImpl extends Category {
  _CategoryImpl({
    _i1.UuidValue? id,
    required String name,
    required String slug,
    String? description,
    _i1.UuidValue? parentCategoryId,
    _i2.Category? parentCategory,
    String? iconUrl,
    String? imageUrl,
    int? displayOrder,
    bool? isActive,
    int? productCount,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
          id: id,
          name: name,
          slug: slug,
          description: description,
          parentCategoryId: parentCategoryId,
          parentCategory: parentCategory,
          iconUrl: iconUrl,
          imageUrl: imageUrl,
          displayOrder: displayOrder,
          isActive: isActive,
          productCount: productCount,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  /// Returns a shallow copy of this [Category]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Category copyWith({
    _i1.UuidValue? id,
    String? name,
    String? slug,
    Object? description = _Undefined,
    Object? parentCategoryId = _Undefined,
    Object? parentCategory = _Undefined,
    Object? iconUrl = _Undefined,
    Object? imageUrl = _Undefined,
    int? displayOrder,
    bool? isActive,
    int? productCount,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      slug: slug ?? this.slug,
      description: description is String? ? description : this.description,
      parentCategoryId: parentCategoryId is _i1.UuidValue?
          ? parentCategoryId
          : this.parentCategoryId,
      parentCategory: parentCategory is _i2.Category?
          ? parentCategory
          : this.parentCategory?.copyWith(),
      iconUrl: iconUrl is String? ? iconUrl : this.iconUrl,
      imageUrl: imageUrl is String? ? imageUrl : this.imageUrl,
      displayOrder: displayOrder ?? this.displayOrder,
      isActive: isActive ?? this.isActive,
      productCount: productCount ?? this.productCount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class CategoryTable extends _i1.Table<_i1.UuidValue> {
  CategoryTable({super.tableRelation}) : super(tableName: 'categories') {
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
    parentCategoryId = _i1.ColumnUuid(
      'parentCategoryId',
      this,
    );
    iconUrl = _i1.ColumnString(
      'iconUrl',
      this,
    );
    imageUrl = _i1.ColumnString(
      'imageUrl',
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
    productCount = _i1.ColumnInt(
      'productCount',
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

  late final _i1.ColumnString name;

  late final _i1.ColumnString slug;

  late final _i1.ColumnString description;

  late final _i1.ColumnUuid parentCategoryId;

  _i2.CategoryTable? _parentCategory;

  late final _i1.ColumnString iconUrl;

  late final _i1.ColumnString imageUrl;

  late final _i1.ColumnInt displayOrder;

  late final _i1.ColumnBool isActive;

  late final _i1.ColumnInt productCount;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  _i2.CategoryTable get parentCategory {
    if (_parentCategory != null) return _parentCategory!;
    _parentCategory = _i1.createRelationTable(
      relationFieldName: 'parentCategory',
      field: Category.t.parentCategoryId,
      foreignField: _i2.Category.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.CategoryTable(tableRelation: foreignTableRelation),
    );
    return _parentCategory!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        slug,
        description,
        parentCategoryId,
        iconUrl,
        imageUrl,
        displayOrder,
        isActive,
        productCount,
        createdAt,
        updatedAt,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'parentCategory') {
      return parentCategory;
    }
    return null;
  }
}

class CategoryInclude extends _i1.IncludeObject {
  CategoryInclude._({_i2.CategoryInclude? parentCategory}) {
    _parentCategory = parentCategory;
  }

  _i2.CategoryInclude? _parentCategory;

  @override
  Map<String, _i1.Include?> get includes => {'parentCategory': _parentCategory};

  @override
  _i1.Table<_i1.UuidValue> get table => Category.t;
}

class CategoryIncludeList extends _i1.IncludeList {
  CategoryIncludeList._({
    _i1.WhereExpressionBuilder<CategoryTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Category.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue> get table => Category.t;
}

class CategoryRepository {
  const CategoryRepository._();

  final attachRow = const CategoryAttachRowRepository._();

  final detachRow = const CategoryDetachRowRepository._();

  /// Returns a list of [Category]s matching the given query parameters.
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
  Future<List<Category>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CategoryTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CategoryTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CategoryTable>? orderByList,
    _i1.Transaction? transaction,
    CategoryInclude? include,
  }) async {
    return session.db.find<Category>(
      where: where?.call(Category.t),
      orderBy: orderBy?.call(Category.t),
      orderByList: orderByList?.call(Category.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Category] matching the given query parameters.
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
  Future<Category?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CategoryTable>? where,
    int? offset,
    _i1.OrderByBuilder<CategoryTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CategoryTable>? orderByList,
    _i1.Transaction? transaction,
    CategoryInclude? include,
  }) async {
    return session.db.findFirstRow<Category>(
      where: where?.call(Category.t),
      orderBy: orderBy?.call(Category.t),
      orderByList: orderByList?.call(Category.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Category] by its [id] or null if no such row exists.
  Future<Category?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
    CategoryInclude? include,
  }) async {
    return session.db.findById<Category>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Category]s in the list and returns the inserted rows.
  ///
  /// The returned [Category]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Category>> insert(
    _i1.Session session,
    List<Category> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Category>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Category] and returns the inserted row.
  ///
  /// The returned [Category] will have its `id` field set.
  Future<Category> insertRow(
    _i1.Session session,
    Category row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Category>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Category]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Category>> update(
    _i1.Session session,
    List<Category> rows, {
    _i1.ColumnSelections<CategoryTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Category>(
      rows,
      columns: columns?.call(Category.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Category]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Category> updateRow(
    _i1.Session session,
    Category row, {
    _i1.ColumnSelections<CategoryTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Category>(
      row,
      columns: columns?.call(Category.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Category]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Category>> delete(
    _i1.Session session,
    List<Category> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Category>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Category].
  Future<Category> deleteRow(
    _i1.Session session,
    Category row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Category>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Category>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<CategoryTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Category>(
      where: where(Category.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CategoryTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Category>(
      where: where?.call(Category.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class CategoryAttachRowRepository {
  const CategoryAttachRowRepository._();

  /// Creates a relation between the given [Category] and [Category]
  /// by setting the [Category]'s foreign key `parentCategoryId` to refer to the [Category].
  Future<void> parentCategory(
    _i1.Session session,
    Category category,
    _i2.Category parentCategory, {
    _i1.Transaction? transaction,
  }) async {
    if (category.id == null) {
      throw ArgumentError.notNull('category.id');
    }
    if (parentCategory.id == null) {
      throw ArgumentError.notNull('parentCategory.id');
    }

    var $category = category.copyWith(parentCategoryId: parentCategory.id);
    await session.db.updateRow<Category>(
      $category,
      columns: [Category.t.parentCategoryId],
      transaction: transaction,
    );
  }
}

class CategoryDetachRowRepository {
  const CategoryDetachRowRepository._();

  /// Detaches the relation between this [Category] and the [Category] set in `parentCategory`
  /// by setting the [Category]'s foreign key `parentCategoryId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> parentCategory(
    _i1.Session session,
    Category category, {
    _i1.Transaction? transaction,
  }) async {
    if (category.id == null) {
      throw ArgumentError.notNull('category.id');
    }

    var $category = category.copyWith(parentCategoryId: null);
    await session.db.updateRow<Category>(
      $category,
      columns: [Category.t.parentCategoryId],
      transaction: transaction,
    );
  }
}
