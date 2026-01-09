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

abstract class CategoryMapping
    implements _i1.TableRow<_i1.UuidValue>, _i1.ProtocolSerialization {
  CategoryMapping._({
    _i1.UuidValue? id,
    required this.simpleCategoryId,
    this.simpleCategory,
    this.productNamePattern,
    this.productDescriptionPattern,
    required this.facebookCategoryId,
    required this.facebookCategoryName,
    required this.googleTaxonomyId,
    required this.googleTaxonomyPath,
    double? confidence,
    int? matchCount,
    this.lastUsedAt,
    DateTime? createdAt,
  }) : id = id ?? _i1.Uuid().v4obj(),
       confidence = confidence ?? 1.0,
       matchCount = matchCount ?? 0,
       createdAt = createdAt ?? DateTime.now();

  factory CategoryMapping({
    _i1.UuidValue? id,
    required _i1.UuidValue simpleCategoryId,
    _i2.ProductCategory? simpleCategory,
    String? productNamePattern,
    String? productDescriptionPattern,
    required int facebookCategoryId,
    required String facebookCategoryName,
    required int googleTaxonomyId,
    required String googleTaxonomyPath,
    double? confidence,
    int? matchCount,
    DateTime? lastUsedAt,
    DateTime? createdAt,
  }) = _CategoryMappingImpl;

  factory CategoryMapping.fromJson(Map<String, dynamic> jsonSerialization) {
    return CategoryMapping(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      simpleCategoryId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['simpleCategoryId'],
      ),
      simpleCategory: jsonSerialization['simpleCategory'] == null
          ? null
          : _i3.Protocol().deserialize<_i2.ProductCategory>(
              jsonSerialization['simpleCategory'],
            ),
      productNamePattern: jsonSerialization['productNamePattern'] as String?,
      productDescriptionPattern:
          jsonSerialization['productDescriptionPattern'] as String?,
      facebookCategoryId: jsonSerialization['facebookCategoryId'] as int,
      facebookCategoryName: jsonSerialization['facebookCategoryName'] as String,
      googleTaxonomyId: jsonSerialization['googleTaxonomyId'] as int,
      googleTaxonomyPath: jsonSerialization['googleTaxonomyPath'] as String,
      confidence: (jsonSerialization['confidence'] as num?)?.toDouble(),
      matchCount: jsonSerialization['matchCount'] as int?,
      lastUsedAt: jsonSerialization['lastUsedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['lastUsedAt']),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  static final t = CategoryMappingTable();

  static const db = CategoryMappingRepository._();

  @override
  _i1.UuidValue id;

  _i1.UuidValue simpleCategoryId;

  _i2.ProductCategory? simpleCategory;

  String? productNamePattern;

  String? productDescriptionPattern;

  int facebookCategoryId;

  String facebookCategoryName;

  int googleTaxonomyId;

  String googleTaxonomyPath;

  double confidence;

  int matchCount;

  DateTime? lastUsedAt;

  DateTime createdAt;

  @override
  _i1.Table<_i1.UuidValue> get table => t;

  /// Returns a shallow copy of this [CategoryMapping]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CategoryMapping copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? simpleCategoryId,
    _i2.ProductCategory? simpleCategory,
    String? productNamePattern,
    String? productDescriptionPattern,
    int? facebookCategoryId,
    String? facebookCategoryName,
    int? googleTaxonomyId,
    String? googleTaxonomyPath,
    double? confidence,
    int? matchCount,
    DateTime? lastUsedAt,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CategoryMapping',
      'id': id.toJson(),
      'simpleCategoryId': simpleCategoryId.toJson(),
      if (simpleCategory != null) 'simpleCategory': simpleCategory?.toJson(),
      if (productNamePattern != null) 'productNamePattern': productNamePattern,
      if (productDescriptionPattern != null)
        'productDescriptionPattern': productDescriptionPattern,
      'facebookCategoryId': facebookCategoryId,
      'facebookCategoryName': facebookCategoryName,
      'googleTaxonomyId': googleTaxonomyId,
      'googleTaxonomyPath': googleTaxonomyPath,
      'confidence': confidence,
      'matchCount': matchCount,
      if (lastUsedAt != null) 'lastUsedAt': lastUsedAt?.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CategoryMapping',
      'id': id.toJson(),
      'simpleCategoryId': simpleCategoryId.toJson(),
      if (simpleCategory != null)
        'simpleCategory': simpleCategory?.toJsonForProtocol(),
      if (productNamePattern != null) 'productNamePattern': productNamePattern,
      if (productDescriptionPattern != null)
        'productDescriptionPattern': productDescriptionPattern,
      'facebookCategoryId': facebookCategoryId,
      'facebookCategoryName': facebookCategoryName,
      'googleTaxonomyId': googleTaxonomyId,
      'googleTaxonomyPath': googleTaxonomyPath,
      'confidence': confidence,
      'matchCount': matchCount,
      if (lastUsedAt != null) 'lastUsedAt': lastUsedAt?.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  static CategoryMappingInclude include({
    _i2.ProductCategoryInclude? simpleCategory,
  }) {
    return CategoryMappingInclude._(simpleCategory: simpleCategory);
  }

  static CategoryMappingIncludeList includeList({
    _i1.WhereExpressionBuilder<CategoryMappingTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CategoryMappingTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CategoryMappingTable>? orderByList,
    CategoryMappingInclude? include,
  }) {
    return CategoryMappingIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CategoryMapping.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(CategoryMapping.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CategoryMappingImpl extends CategoryMapping {
  _CategoryMappingImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue simpleCategoryId,
    _i2.ProductCategory? simpleCategory,
    String? productNamePattern,
    String? productDescriptionPattern,
    required int facebookCategoryId,
    required String facebookCategoryName,
    required int googleTaxonomyId,
    required String googleTaxonomyPath,
    double? confidence,
    int? matchCount,
    DateTime? lastUsedAt,
    DateTime? createdAt,
  }) : super._(
         id: id,
         simpleCategoryId: simpleCategoryId,
         simpleCategory: simpleCategory,
         productNamePattern: productNamePattern,
         productDescriptionPattern: productDescriptionPattern,
         facebookCategoryId: facebookCategoryId,
         facebookCategoryName: facebookCategoryName,
         googleTaxonomyId: googleTaxonomyId,
         googleTaxonomyPath: googleTaxonomyPath,
         confidence: confidence,
         matchCount: matchCount,
         lastUsedAt: lastUsedAt,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [CategoryMapping]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CategoryMapping copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? simpleCategoryId,
    Object? simpleCategory = _Undefined,
    Object? productNamePattern = _Undefined,
    Object? productDescriptionPattern = _Undefined,
    int? facebookCategoryId,
    String? facebookCategoryName,
    int? googleTaxonomyId,
    String? googleTaxonomyPath,
    double? confidence,
    int? matchCount,
    Object? lastUsedAt = _Undefined,
    DateTime? createdAt,
  }) {
    return CategoryMapping(
      id: id ?? this.id,
      simpleCategoryId: simpleCategoryId ?? this.simpleCategoryId,
      simpleCategory: simpleCategory is _i2.ProductCategory?
          ? simpleCategory
          : this.simpleCategory?.copyWith(),
      productNamePattern: productNamePattern is String?
          ? productNamePattern
          : this.productNamePattern,
      productDescriptionPattern: productDescriptionPattern is String?
          ? productDescriptionPattern
          : this.productDescriptionPattern,
      facebookCategoryId: facebookCategoryId ?? this.facebookCategoryId,
      facebookCategoryName: facebookCategoryName ?? this.facebookCategoryName,
      googleTaxonomyId: googleTaxonomyId ?? this.googleTaxonomyId,
      googleTaxonomyPath: googleTaxonomyPath ?? this.googleTaxonomyPath,
      confidence: confidence ?? this.confidence,
      matchCount: matchCount ?? this.matchCount,
      lastUsedAt: lastUsedAt is DateTime? ? lastUsedAt : this.lastUsedAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class CategoryMappingUpdateTable extends _i1.UpdateTable<CategoryMappingTable> {
  CategoryMappingUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> simpleCategoryId(
    _i1.UuidValue value,
  ) => _i1.ColumnValue(
    table.simpleCategoryId,
    value,
  );

  _i1.ColumnValue<String, String> productNamePattern(String? value) =>
      _i1.ColumnValue(
        table.productNamePattern,
        value,
      );

  _i1.ColumnValue<String, String> productDescriptionPattern(String? value) =>
      _i1.ColumnValue(
        table.productDescriptionPattern,
        value,
      );

  _i1.ColumnValue<int, int> facebookCategoryId(int value) => _i1.ColumnValue(
    table.facebookCategoryId,
    value,
  );

  _i1.ColumnValue<String, String> facebookCategoryName(String value) =>
      _i1.ColumnValue(
        table.facebookCategoryName,
        value,
      );

  _i1.ColumnValue<int, int> googleTaxonomyId(int value) => _i1.ColumnValue(
    table.googleTaxonomyId,
    value,
  );

  _i1.ColumnValue<String, String> googleTaxonomyPath(String value) =>
      _i1.ColumnValue(
        table.googleTaxonomyPath,
        value,
      );

  _i1.ColumnValue<double, double> confidence(double value) => _i1.ColumnValue(
    table.confidence,
    value,
  );

  _i1.ColumnValue<int, int> matchCount(int value) => _i1.ColumnValue(
    table.matchCount,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> lastUsedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.lastUsedAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );
}

class CategoryMappingTable extends _i1.Table<_i1.UuidValue> {
  CategoryMappingTable({super.tableRelation})
    : super(tableName: 'category_mappings') {
    updateTable = CategoryMappingUpdateTable(this);
    simpleCategoryId = _i1.ColumnUuid(
      'simpleCategoryId',
      this,
    );
    productNamePattern = _i1.ColumnString(
      'productNamePattern',
      this,
    );
    productDescriptionPattern = _i1.ColumnString(
      'productDescriptionPattern',
      this,
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
    confidence = _i1.ColumnDouble(
      'confidence',
      this,
      hasDefault: true,
    );
    matchCount = _i1.ColumnInt(
      'matchCount',
      this,
      hasDefault: true,
    );
    lastUsedAt = _i1.ColumnDateTime(
      'lastUsedAt',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
  }

  late final CategoryMappingUpdateTable updateTable;

  late final _i1.ColumnUuid simpleCategoryId;

  _i2.ProductCategoryTable? _simpleCategory;

  late final _i1.ColumnString productNamePattern;

  late final _i1.ColumnString productDescriptionPattern;

  late final _i1.ColumnInt facebookCategoryId;

  late final _i1.ColumnString facebookCategoryName;

  late final _i1.ColumnInt googleTaxonomyId;

  late final _i1.ColumnString googleTaxonomyPath;

  late final _i1.ColumnDouble confidence;

  late final _i1.ColumnInt matchCount;

  late final _i1.ColumnDateTime lastUsedAt;

  late final _i1.ColumnDateTime createdAt;

  _i2.ProductCategoryTable get simpleCategory {
    if (_simpleCategory != null) return _simpleCategory!;
    _simpleCategory = _i1.createRelationTable(
      relationFieldName: 'simpleCategory',
      field: CategoryMapping.t.simpleCategoryId,
      foreignField: _i2.ProductCategory.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.ProductCategoryTable(tableRelation: foreignTableRelation),
    );
    return _simpleCategory!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    simpleCategoryId,
    productNamePattern,
    productDescriptionPattern,
    facebookCategoryId,
    facebookCategoryName,
    googleTaxonomyId,
    googleTaxonomyPath,
    confidence,
    matchCount,
    lastUsedAt,
    createdAt,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'simpleCategory') {
      return simpleCategory;
    }
    return null;
  }
}

class CategoryMappingInclude extends _i1.IncludeObject {
  CategoryMappingInclude._({_i2.ProductCategoryInclude? simpleCategory}) {
    _simpleCategory = simpleCategory;
  }

  _i2.ProductCategoryInclude? _simpleCategory;

  @override
  Map<String, _i1.Include?> get includes => {'simpleCategory': _simpleCategory};

  @override
  _i1.Table<_i1.UuidValue> get table => CategoryMapping.t;
}

class CategoryMappingIncludeList extends _i1.IncludeList {
  CategoryMappingIncludeList._({
    _i1.WhereExpressionBuilder<CategoryMappingTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(CategoryMapping.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue> get table => CategoryMapping.t;
}

class CategoryMappingRepository {
  const CategoryMappingRepository._();

  final attachRow = const CategoryMappingAttachRowRepository._();

  /// Returns a list of [CategoryMapping]s matching the given query parameters.
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
  Future<List<CategoryMapping>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CategoryMappingTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CategoryMappingTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CategoryMappingTable>? orderByList,
    _i1.Transaction? transaction,
    CategoryMappingInclude? include,
  }) async {
    return session.db.find<CategoryMapping>(
      where: where?.call(CategoryMapping.t),
      orderBy: orderBy?.call(CategoryMapping.t),
      orderByList: orderByList?.call(CategoryMapping.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [CategoryMapping] matching the given query parameters.
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
  Future<CategoryMapping?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CategoryMappingTable>? where,
    int? offset,
    _i1.OrderByBuilder<CategoryMappingTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CategoryMappingTable>? orderByList,
    _i1.Transaction? transaction,
    CategoryMappingInclude? include,
  }) async {
    return session.db.findFirstRow<CategoryMapping>(
      where: where?.call(CategoryMapping.t),
      orderBy: orderBy?.call(CategoryMapping.t),
      orderByList: orderByList?.call(CategoryMapping.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [CategoryMapping] by its [id] or null if no such row exists.
  Future<CategoryMapping?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
    CategoryMappingInclude? include,
  }) async {
    return session.db.findById<CategoryMapping>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [CategoryMapping]s in the list and returns the inserted rows.
  ///
  /// The returned [CategoryMapping]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<CategoryMapping>> insert(
    _i1.Session session,
    List<CategoryMapping> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<CategoryMapping>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [CategoryMapping] and returns the inserted row.
  ///
  /// The returned [CategoryMapping] will have its `id` field set.
  Future<CategoryMapping> insertRow(
    _i1.Session session,
    CategoryMapping row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<CategoryMapping>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [CategoryMapping]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<CategoryMapping>> update(
    _i1.Session session,
    List<CategoryMapping> rows, {
    _i1.ColumnSelections<CategoryMappingTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<CategoryMapping>(
      rows,
      columns: columns?.call(CategoryMapping.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CategoryMapping]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<CategoryMapping> updateRow(
    _i1.Session session,
    CategoryMapping row, {
    _i1.ColumnSelections<CategoryMappingTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<CategoryMapping>(
      row,
      columns: columns?.call(CategoryMapping.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CategoryMapping] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<CategoryMapping?> updateById(
    _i1.Session session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<CategoryMappingUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<CategoryMapping>(
      id,
      columnValues: columnValues(CategoryMapping.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [CategoryMapping]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<CategoryMapping>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<CategoryMappingUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<CategoryMappingTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CategoryMappingTable>? orderBy,
    _i1.OrderByListBuilder<CategoryMappingTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<CategoryMapping>(
      columnValues: columnValues(CategoryMapping.t.updateTable),
      where: where(CategoryMapping.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CategoryMapping.t),
      orderByList: orderByList?.call(CategoryMapping.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [CategoryMapping]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<CategoryMapping>> delete(
    _i1.Session session,
    List<CategoryMapping> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<CategoryMapping>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [CategoryMapping].
  Future<CategoryMapping> deleteRow(
    _i1.Session session,
    CategoryMapping row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<CategoryMapping>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<CategoryMapping>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<CategoryMappingTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<CategoryMapping>(
      where: where(CategoryMapping.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CategoryMappingTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<CategoryMapping>(
      where: where?.call(CategoryMapping.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class CategoryMappingAttachRowRepository {
  const CategoryMappingAttachRowRepository._();

  /// Creates a relation between the given [CategoryMapping] and [ProductCategory]
  /// by setting the [CategoryMapping]'s foreign key `simpleCategoryId` to refer to the [ProductCategory].
  Future<void> simpleCategory(
    _i1.Session session,
    CategoryMapping categoryMapping,
    _i2.ProductCategory simpleCategory, {
    _i1.Transaction? transaction,
  }) async {
    if (categoryMapping.id == null) {
      throw ArgumentError.notNull('categoryMapping.id');
    }
    if (simpleCategory.id == null) {
      throw ArgumentError.notNull('simpleCategory.id');
    }

    var $categoryMapping = categoryMapping.copyWith(
      simpleCategoryId: simpleCategory.id,
    );
    await session.db.updateRow<CategoryMapping>(
      $categoryMapping,
      columns: [CategoryMapping.t.simpleCategoryId],
      transaction: transaction,
    );
  }
}
