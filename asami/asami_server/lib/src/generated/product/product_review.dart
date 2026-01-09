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
import '../user/user.dart' as _i3;
import 'package:asami_server/src/generated/protocol.dart' as _i4;

abstract class ProductReview
    implements _i1.TableRow<_i1.UuidValue>, _i1.ProtocolSerialization {
  ProductReview._({
    _i1.UuidValue? id,
    required this.productId,
    this.product,
    required this.customerId,
    this.customer,
    this.orderId,
    required this.rating,
    this.title,
    required this.comment,
    this.images,
    bool? isVerifiedPurchase,
    bool? isApproved,
    bool? isFlagged,
    this.moderatedBy,
    this.moderatedAt,
    int? helpfulCount,
    int? reportCount,
    this.vendorResponse,
    this.vendorRespondedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : id = id ?? _i1.Uuid().v4obj(),
       isVerifiedPurchase = isVerifiedPurchase ?? false,
       isApproved = isApproved ?? false,
       isFlagged = isFlagged ?? false,
       helpfulCount = helpfulCount ?? 0,
       reportCount = reportCount ?? 0,
       createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory ProductReview({
    _i1.UuidValue? id,
    required _i1.UuidValue productId,
    _i2.Product? product,
    required _i1.UuidValue customerId,
    _i3.User? customer,
    _i1.UuidValue? orderId,
    required int rating,
    String? title,
    required String comment,
    List<String>? images,
    bool? isVerifiedPurchase,
    bool? isApproved,
    bool? isFlagged,
    String? moderatedBy,
    DateTime? moderatedAt,
    int? helpfulCount,
    int? reportCount,
    String? vendorResponse,
    DateTime? vendorRespondedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _ProductReviewImpl;

  factory ProductReview.fromJson(Map<String, dynamic> jsonSerialization) {
    return ProductReview(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      productId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['productId'],
      ),
      product: jsonSerialization['product'] == null
          ? null
          : _i4.Protocol().deserialize<_i2.Product>(
              jsonSerialization['product'],
            ),
      customerId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['customerId'],
      ),
      customer: jsonSerialization['customer'] == null
          ? null
          : _i4.Protocol().deserialize<_i3.User>(jsonSerialization['customer']),
      orderId: jsonSerialization['orderId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['orderId']),
      rating: jsonSerialization['rating'] as int,
      title: jsonSerialization['title'] as String?,
      comment: jsonSerialization['comment'] as String,
      images: jsonSerialization['images'] == null
          ? null
          : _i4.Protocol().deserialize<List<String>>(
              jsonSerialization['images'],
            ),
      isVerifiedPurchase: jsonSerialization['isVerifiedPurchase'] as bool?,
      isApproved: jsonSerialization['isApproved'] as bool?,
      isFlagged: jsonSerialization['isFlagged'] as bool?,
      moderatedBy: jsonSerialization['moderatedBy'] as String?,
      moderatedAt: jsonSerialization['moderatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['moderatedAt'],
            ),
      helpfulCount: jsonSerialization['helpfulCount'] as int?,
      reportCount: jsonSerialization['reportCount'] as int?,
      vendorResponse: jsonSerialization['vendorResponse'] as String?,
      vendorRespondedAt: jsonSerialization['vendorRespondedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['vendorRespondedAt'],
            ),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  static final t = ProductReviewTable();

  static const db = ProductReviewRepository._();

  @override
  _i1.UuidValue id;

  _i1.UuidValue productId;

  _i2.Product? product;

  _i1.UuidValue customerId;

  _i3.User? customer;

  _i1.UuidValue? orderId;

  int rating;

  String? title;

  String comment;

  List<String>? images;

  bool isVerifiedPurchase;

  bool isApproved;

  bool isFlagged;

  String? moderatedBy;

  DateTime? moderatedAt;

  int helpfulCount;

  int reportCount;

  String? vendorResponse;

  DateTime? vendorRespondedAt;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _i1.Table<_i1.UuidValue> get table => t;

  /// Returns a shallow copy of this [ProductReview]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ProductReview copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? productId,
    _i2.Product? product,
    _i1.UuidValue? customerId,
    _i3.User? customer,
    _i1.UuidValue? orderId,
    int? rating,
    String? title,
    String? comment,
    List<String>? images,
    bool? isVerifiedPurchase,
    bool? isApproved,
    bool? isFlagged,
    String? moderatedBy,
    DateTime? moderatedAt,
    int? helpfulCount,
    int? reportCount,
    String? vendorResponse,
    DateTime? vendorRespondedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ProductReview',
      'id': id.toJson(),
      'productId': productId.toJson(),
      if (product != null) 'product': product?.toJson(),
      'customerId': customerId.toJson(),
      if (customer != null) 'customer': customer?.toJson(),
      if (orderId != null) 'orderId': orderId?.toJson(),
      'rating': rating,
      if (title != null) 'title': title,
      'comment': comment,
      if (images != null) 'images': images?.toJson(),
      'isVerifiedPurchase': isVerifiedPurchase,
      'isApproved': isApproved,
      'isFlagged': isFlagged,
      if (moderatedBy != null) 'moderatedBy': moderatedBy,
      if (moderatedAt != null) 'moderatedAt': moderatedAt?.toJson(),
      'helpfulCount': helpfulCount,
      'reportCount': reportCount,
      if (vendorResponse != null) 'vendorResponse': vendorResponse,
      if (vendorRespondedAt != null)
        'vendorRespondedAt': vendorRespondedAt?.toJson(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ProductReview',
      'id': id.toJson(),
      'productId': productId.toJson(),
      if (product != null) 'product': product?.toJsonForProtocol(),
      'customerId': customerId.toJson(),
      if (customer != null) 'customer': customer?.toJsonForProtocol(),
      if (orderId != null) 'orderId': orderId?.toJson(),
      'rating': rating,
      if (title != null) 'title': title,
      'comment': comment,
      if (images != null) 'images': images?.toJson(),
      'isVerifiedPurchase': isVerifiedPurchase,
      'isApproved': isApproved,
      'isFlagged': isFlagged,
      if (moderatedBy != null) 'moderatedBy': moderatedBy,
      if (moderatedAt != null) 'moderatedAt': moderatedAt?.toJson(),
      'helpfulCount': helpfulCount,
      'reportCount': reportCount,
      if (vendorResponse != null) 'vendorResponse': vendorResponse,
      if (vendorRespondedAt != null)
        'vendorRespondedAt': vendorRespondedAt?.toJson(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static ProductReviewInclude include({
    _i2.ProductInclude? product,
    _i3.UserInclude? customer,
  }) {
    return ProductReviewInclude._(
      product: product,
      customer: customer,
    );
  }

  static ProductReviewIncludeList includeList({
    _i1.WhereExpressionBuilder<ProductReviewTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProductReviewTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProductReviewTable>? orderByList,
    ProductReviewInclude? include,
  }) {
    return ProductReviewIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ProductReview.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ProductReview.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ProductReviewImpl extends ProductReview {
  _ProductReviewImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue productId,
    _i2.Product? product,
    required _i1.UuidValue customerId,
    _i3.User? customer,
    _i1.UuidValue? orderId,
    required int rating,
    String? title,
    required String comment,
    List<String>? images,
    bool? isVerifiedPurchase,
    bool? isApproved,
    bool? isFlagged,
    String? moderatedBy,
    DateTime? moderatedAt,
    int? helpfulCount,
    int? reportCount,
    String? vendorResponse,
    DateTime? vendorRespondedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         productId: productId,
         product: product,
         customerId: customerId,
         customer: customer,
         orderId: orderId,
         rating: rating,
         title: title,
         comment: comment,
         images: images,
         isVerifiedPurchase: isVerifiedPurchase,
         isApproved: isApproved,
         isFlagged: isFlagged,
         moderatedBy: moderatedBy,
         moderatedAt: moderatedAt,
         helpfulCount: helpfulCount,
         reportCount: reportCount,
         vendorResponse: vendorResponse,
         vendorRespondedAt: vendorRespondedAt,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [ProductReview]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ProductReview copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? productId,
    Object? product = _Undefined,
    _i1.UuidValue? customerId,
    Object? customer = _Undefined,
    Object? orderId = _Undefined,
    int? rating,
    Object? title = _Undefined,
    String? comment,
    Object? images = _Undefined,
    bool? isVerifiedPurchase,
    bool? isApproved,
    bool? isFlagged,
    Object? moderatedBy = _Undefined,
    Object? moderatedAt = _Undefined,
    int? helpfulCount,
    int? reportCount,
    Object? vendorResponse = _Undefined,
    Object? vendorRespondedAt = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ProductReview(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      product: product is _i2.Product? ? product : this.product?.copyWith(),
      customerId: customerId ?? this.customerId,
      customer: customer is _i3.User? ? customer : this.customer?.copyWith(),
      orderId: orderId is _i1.UuidValue? ? orderId : this.orderId,
      rating: rating ?? this.rating,
      title: title is String? ? title : this.title,
      comment: comment ?? this.comment,
      images: images is List<String>?
          ? images
          : this.images?.map((e0) => e0).toList(),
      isVerifiedPurchase: isVerifiedPurchase ?? this.isVerifiedPurchase,
      isApproved: isApproved ?? this.isApproved,
      isFlagged: isFlagged ?? this.isFlagged,
      moderatedBy: moderatedBy is String? ? moderatedBy : this.moderatedBy,
      moderatedAt: moderatedAt is DateTime? ? moderatedAt : this.moderatedAt,
      helpfulCount: helpfulCount ?? this.helpfulCount,
      reportCount: reportCount ?? this.reportCount,
      vendorResponse: vendorResponse is String?
          ? vendorResponse
          : this.vendorResponse,
      vendorRespondedAt: vendorRespondedAt is DateTime?
          ? vendorRespondedAt
          : this.vendorRespondedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class ProductReviewUpdateTable extends _i1.UpdateTable<ProductReviewTable> {
  ProductReviewUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> productId(
    _i1.UuidValue value,
  ) => _i1.ColumnValue(
    table.productId,
    value,
  );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> customerId(
    _i1.UuidValue value,
  ) => _i1.ColumnValue(
    table.customerId,
    value,
  );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> orderId(_i1.UuidValue? value) =>
      _i1.ColumnValue(
        table.orderId,
        value,
      );

  _i1.ColumnValue<int, int> rating(int value) => _i1.ColumnValue(
    table.rating,
    value,
  );

  _i1.ColumnValue<String, String> title(String? value) => _i1.ColumnValue(
    table.title,
    value,
  );

  _i1.ColumnValue<String, String> comment(String value) => _i1.ColumnValue(
    table.comment,
    value,
  );

  _i1.ColumnValue<List<String>, List<String>> images(List<String>? value) =>
      _i1.ColumnValue(
        table.images,
        value,
      );

  _i1.ColumnValue<bool, bool> isVerifiedPurchase(bool value) => _i1.ColumnValue(
    table.isVerifiedPurchase,
    value,
  );

  _i1.ColumnValue<bool, bool> isApproved(bool value) => _i1.ColumnValue(
    table.isApproved,
    value,
  );

  _i1.ColumnValue<bool, bool> isFlagged(bool value) => _i1.ColumnValue(
    table.isFlagged,
    value,
  );

  _i1.ColumnValue<String, String> moderatedBy(String? value) => _i1.ColumnValue(
    table.moderatedBy,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> moderatedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.moderatedAt,
        value,
      );

  _i1.ColumnValue<int, int> helpfulCount(int value) => _i1.ColumnValue(
    table.helpfulCount,
    value,
  );

  _i1.ColumnValue<int, int> reportCount(int value) => _i1.ColumnValue(
    table.reportCount,
    value,
  );

  _i1.ColumnValue<String, String> vendorResponse(String? value) =>
      _i1.ColumnValue(
        table.vendorResponse,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> vendorRespondedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.vendorRespondedAt,
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

class ProductReviewTable extends _i1.Table<_i1.UuidValue> {
  ProductReviewTable({super.tableRelation})
    : super(tableName: 'product_reviews') {
    updateTable = ProductReviewUpdateTable(this);
    productId = _i1.ColumnUuid(
      'productId',
      this,
    );
    customerId = _i1.ColumnUuid(
      'customerId',
      this,
    );
    orderId = _i1.ColumnUuid(
      'orderId',
      this,
    );
    rating = _i1.ColumnInt(
      'rating',
      this,
    );
    title = _i1.ColumnString(
      'title',
      this,
    );
    comment = _i1.ColumnString(
      'comment',
      this,
    );
    images = _i1.ColumnSerializable<List<String>>(
      'images',
      this,
    );
    isVerifiedPurchase = _i1.ColumnBool(
      'isVerifiedPurchase',
      this,
      hasDefault: true,
    );
    isApproved = _i1.ColumnBool(
      'isApproved',
      this,
      hasDefault: true,
    );
    isFlagged = _i1.ColumnBool(
      'isFlagged',
      this,
      hasDefault: true,
    );
    moderatedBy = _i1.ColumnString(
      'moderatedBy',
      this,
    );
    moderatedAt = _i1.ColumnDateTime(
      'moderatedAt',
      this,
    );
    helpfulCount = _i1.ColumnInt(
      'helpfulCount',
      this,
      hasDefault: true,
    );
    reportCount = _i1.ColumnInt(
      'reportCount',
      this,
      hasDefault: true,
    );
    vendorResponse = _i1.ColumnString(
      'vendorResponse',
      this,
    );
    vendorRespondedAt = _i1.ColumnDateTime(
      'vendorRespondedAt',
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

  late final ProductReviewUpdateTable updateTable;

  late final _i1.ColumnUuid productId;

  _i2.ProductTable? _product;

  late final _i1.ColumnUuid customerId;

  _i3.UserTable? _customer;

  late final _i1.ColumnUuid orderId;

  late final _i1.ColumnInt rating;

  late final _i1.ColumnString title;

  late final _i1.ColumnString comment;

  late final _i1.ColumnSerializable<List<String>> images;

  late final _i1.ColumnBool isVerifiedPurchase;

  late final _i1.ColumnBool isApproved;

  late final _i1.ColumnBool isFlagged;

  late final _i1.ColumnString moderatedBy;

  late final _i1.ColumnDateTime moderatedAt;

  late final _i1.ColumnInt helpfulCount;

  late final _i1.ColumnInt reportCount;

  late final _i1.ColumnString vendorResponse;

  late final _i1.ColumnDateTime vendorRespondedAt;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  _i2.ProductTable get product {
    if (_product != null) return _product!;
    _product = _i1.createRelationTable(
      relationFieldName: 'product',
      field: ProductReview.t.productId,
      foreignField: _i2.Product.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.ProductTable(tableRelation: foreignTableRelation),
    );
    return _product!;
  }

  _i3.UserTable get customer {
    if (_customer != null) return _customer!;
    _customer = _i1.createRelationTable(
      relationFieldName: 'customer',
      field: ProductReview.t.customerId,
      foreignField: _i3.User.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.UserTable(tableRelation: foreignTableRelation),
    );
    return _customer!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    productId,
    customerId,
    orderId,
    rating,
    title,
    comment,
    images,
    isVerifiedPurchase,
    isApproved,
    isFlagged,
    moderatedBy,
    moderatedAt,
    helpfulCount,
    reportCount,
    vendorResponse,
    vendorRespondedAt,
    createdAt,
    updatedAt,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'product') {
      return product;
    }
    if (relationField == 'customer') {
      return customer;
    }
    return null;
  }
}

class ProductReviewInclude extends _i1.IncludeObject {
  ProductReviewInclude._({
    _i2.ProductInclude? product,
    _i3.UserInclude? customer,
  }) {
    _product = product;
    _customer = customer;
  }

  _i2.ProductInclude? _product;

  _i3.UserInclude? _customer;

  @override
  Map<String, _i1.Include?> get includes => {
    'product': _product,
    'customer': _customer,
  };

  @override
  _i1.Table<_i1.UuidValue> get table => ProductReview.t;
}

class ProductReviewIncludeList extends _i1.IncludeList {
  ProductReviewIncludeList._({
    _i1.WhereExpressionBuilder<ProductReviewTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ProductReview.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue> get table => ProductReview.t;
}

class ProductReviewRepository {
  const ProductReviewRepository._();

  final attachRow = const ProductReviewAttachRowRepository._();

  /// Returns a list of [ProductReview]s matching the given query parameters.
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
  Future<List<ProductReview>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProductReviewTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProductReviewTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProductReviewTable>? orderByList,
    _i1.Transaction? transaction,
    ProductReviewInclude? include,
  }) async {
    return session.db.find<ProductReview>(
      where: where?.call(ProductReview.t),
      orderBy: orderBy?.call(ProductReview.t),
      orderByList: orderByList?.call(ProductReview.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [ProductReview] matching the given query parameters.
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
  Future<ProductReview?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProductReviewTable>? where,
    int? offset,
    _i1.OrderByBuilder<ProductReviewTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProductReviewTable>? orderByList,
    _i1.Transaction? transaction,
    ProductReviewInclude? include,
  }) async {
    return session.db.findFirstRow<ProductReview>(
      where: where?.call(ProductReview.t),
      orderBy: orderBy?.call(ProductReview.t),
      orderByList: orderByList?.call(ProductReview.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [ProductReview] by its [id] or null if no such row exists.
  Future<ProductReview?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
    ProductReviewInclude? include,
  }) async {
    return session.db.findById<ProductReview>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [ProductReview]s in the list and returns the inserted rows.
  ///
  /// The returned [ProductReview]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<ProductReview>> insert(
    _i1.Session session,
    List<ProductReview> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<ProductReview>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [ProductReview] and returns the inserted row.
  ///
  /// The returned [ProductReview] will have its `id` field set.
  Future<ProductReview> insertRow(
    _i1.Session session,
    ProductReview row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ProductReview>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [ProductReview]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<ProductReview>> update(
    _i1.Session session,
    List<ProductReview> rows, {
    _i1.ColumnSelections<ProductReviewTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<ProductReview>(
      rows,
      columns: columns?.call(ProductReview.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ProductReview]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ProductReview> updateRow(
    _i1.Session session,
    ProductReview row, {
    _i1.ColumnSelections<ProductReviewTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ProductReview>(
      row,
      columns: columns?.call(ProductReview.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ProductReview] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<ProductReview?> updateById(
    _i1.Session session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<ProductReviewUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<ProductReview>(
      id,
      columnValues: columnValues(ProductReview.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [ProductReview]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<ProductReview>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<ProductReviewUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<ProductReviewTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProductReviewTable>? orderBy,
    _i1.OrderByListBuilder<ProductReviewTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<ProductReview>(
      columnValues: columnValues(ProductReview.t.updateTable),
      where: where(ProductReview.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ProductReview.t),
      orderByList: orderByList?.call(ProductReview.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [ProductReview]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<ProductReview>> delete(
    _i1.Session session,
    List<ProductReview> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ProductReview>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [ProductReview].
  Future<ProductReview> deleteRow(
    _i1.Session session,
    ProductReview row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ProductReview>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<ProductReview>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ProductReviewTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ProductReview>(
      where: where(ProductReview.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProductReviewTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ProductReview>(
      where: where?.call(ProductReview.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class ProductReviewAttachRowRepository {
  const ProductReviewAttachRowRepository._();

  /// Creates a relation between the given [ProductReview] and [Product]
  /// by setting the [ProductReview]'s foreign key `productId` to refer to the [Product].
  Future<void> product(
    _i1.Session session,
    ProductReview productReview,
    _i2.Product product, {
    _i1.Transaction? transaction,
  }) async {
    if (productReview.id == null) {
      throw ArgumentError.notNull('productReview.id');
    }
    if (product.id == null) {
      throw ArgumentError.notNull('product.id');
    }

    var $productReview = productReview.copyWith(productId: product.id);
    await session.db.updateRow<ProductReview>(
      $productReview,
      columns: [ProductReview.t.productId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [ProductReview] and [User]
  /// by setting the [ProductReview]'s foreign key `customerId` to refer to the [User].
  Future<void> customer(
    _i1.Session session,
    ProductReview productReview,
    _i3.User customer, {
    _i1.Transaction? transaction,
  }) async {
    if (productReview.id == null) {
      throw ArgumentError.notNull('productReview.id');
    }
    if (customer.id == null) {
      throw ArgumentError.notNull('customer.id');
    }

    var $productReview = productReview.copyWith(customerId: customer.id);
    await session.db.updateRow<ProductReview>(
      $productReview,
      columns: [ProductReview.t.customerId],
      transaction: transaction,
    );
  }
}
