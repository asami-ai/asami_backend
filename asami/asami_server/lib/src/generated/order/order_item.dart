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
import '../order/order_status.dart' as _i2;
import '../order/order.dart' as _i3;
import '../product/product.dart' as _i4;
import '../product/product_variant.dart' as _i5;
import 'package:asami_server/src/generated/protocol.dart' as _i6;

abstract class OrderItem
    implements _i1.TableRow<_i1.UuidValue>, _i1.ProtocolSerialization {
  OrderItem._({
    _i1.UuidValue? id,
    required this.orderId,
    this.order,
    required this.productId,
    this.product,
    this.variantId,
    this.variant,
    required this.productName,
    this.productDescription,
    this.productImageUrl,
    this.sku,
    this.variantName,
    this.color,
    this.size,
    required this.unitPrice,
    this.discountPrice,
    required this.quantity,
    required this.subtotal,
    double? taxAmount,
    required this.totalAmount,
    _i2.OrderStatus? status,
    bool? isFulfilled,
    this.fulfilledAt,
    bool? isReturnable,
    this.returnBy,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : id = id ?? _i1.Uuid().v4obj(),
       taxAmount = taxAmount ?? 0.0,
       status = status ?? _i2.OrderStatus.pending,
       isFulfilled = isFulfilled ?? false,
       isReturnable = isReturnable ?? true,
       createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory OrderItem({
    _i1.UuidValue? id,
    required _i1.UuidValue orderId,
    _i3.Order? order,
    required _i1.UuidValue productId,
    _i4.Product? product,
    _i1.UuidValue? variantId,
    _i5.ProductVariant? variant,
    required String productName,
    String? productDescription,
    String? productImageUrl,
    String? sku,
    String? variantName,
    String? color,
    String? size,
    required double unitPrice,
    double? discountPrice,
    required int quantity,
    required double subtotal,
    double? taxAmount,
    required double totalAmount,
    _i2.OrderStatus? status,
    bool? isFulfilled,
    DateTime? fulfilledAt,
    bool? isReturnable,
    DateTime? returnBy,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _OrderItemImpl;

  factory OrderItem.fromJson(Map<String, dynamic> jsonSerialization) {
    return OrderItem(
      id: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      orderId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['orderId'],
      ),
      order: jsonSerialization['order'] == null
          ? null
          : _i6.Protocol().deserialize<_i3.Order>(jsonSerialization['order']),
      productId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['productId'],
      ),
      product: jsonSerialization['product'] == null
          ? null
          : _i6.Protocol().deserialize<_i4.Product>(
              jsonSerialization['product'],
            ),
      variantId: jsonSerialization['variantId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['variantId']),
      variant: jsonSerialization['variant'] == null
          ? null
          : _i6.Protocol().deserialize<_i5.ProductVariant>(
              jsonSerialization['variant'],
            ),
      productName: jsonSerialization['productName'] as String,
      productDescription: jsonSerialization['productDescription'] as String?,
      productImageUrl: jsonSerialization['productImageUrl'] as String?,
      sku: jsonSerialization['sku'] as String?,
      variantName: jsonSerialization['variantName'] as String?,
      color: jsonSerialization['color'] as String?,
      size: jsonSerialization['size'] as String?,
      unitPrice: (jsonSerialization['unitPrice'] as num).toDouble(),
      discountPrice: (jsonSerialization['discountPrice'] as num?)?.toDouble(),
      quantity: jsonSerialization['quantity'] as int,
      subtotal: (jsonSerialization['subtotal'] as num).toDouble(),
      taxAmount: (jsonSerialization['taxAmount'] as num).toDouble(),
      totalAmount: (jsonSerialization['totalAmount'] as num).toDouble(),
      status: _i2.OrderStatus.fromJson((jsonSerialization['status'] as String)),
      isFulfilled: jsonSerialization['isFulfilled'] as bool,
      fulfilledAt: jsonSerialization['fulfilledAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['fulfilledAt'],
            ),
      isReturnable: jsonSerialization['isReturnable'] as bool,
      returnBy: jsonSerialization['returnBy'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['returnBy']),
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
    );
  }

  static final t = OrderItemTable();

  static const db = OrderItemRepository._();

  @override
  _i1.UuidValue id;

  _i1.UuidValue orderId;

  _i3.Order? order;

  _i1.UuidValue productId;

  _i4.Product? product;

  _i1.UuidValue? variantId;

  _i5.ProductVariant? variant;

  String productName;

  String? productDescription;

  String? productImageUrl;

  String? sku;

  String? variantName;

  String? color;

  String? size;

  double unitPrice;

  double? discountPrice;

  int quantity;

  double subtotal;

  double taxAmount;

  double totalAmount;

  _i2.OrderStatus status;

  bool isFulfilled;

  DateTime? fulfilledAt;

  bool isReturnable;

  DateTime? returnBy;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _i1.Table<_i1.UuidValue> get table => t;

  /// Returns a shallow copy of this [OrderItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  OrderItem copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? orderId,
    _i3.Order? order,
    _i1.UuidValue? productId,
    _i4.Product? product,
    _i1.UuidValue? variantId,
    _i5.ProductVariant? variant,
    String? productName,
    String? productDescription,
    String? productImageUrl,
    String? sku,
    String? variantName,
    String? color,
    String? size,
    double? unitPrice,
    double? discountPrice,
    int? quantity,
    double? subtotal,
    double? taxAmount,
    double? totalAmount,
    _i2.OrderStatus? status,
    bool? isFulfilled,
    DateTime? fulfilledAt,
    bool? isReturnable,
    DateTime? returnBy,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'OrderItem',
      'id': id.toJson(),
      'orderId': orderId.toJson(),
      if (order != null) 'order': order?.toJson(),
      'productId': productId.toJson(),
      if (product != null) 'product': product?.toJson(),
      if (variantId != null) 'variantId': variantId?.toJson(),
      if (variant != null) 'variant': variant?.toJson(),
      'productName': productName,
      if (productDescription != null) 'productDescription': productDescription,
      if (productImageUrl != null) 'productImageUrl': productImageUrl,
      if (sku != null) 'sku': sku,
      if (variantName != null) 'variantName': variantName,
      if (color != null) 'color': color,
      if (size != null) 'size': size,
      'unitPrice': unitPrice,
      if (discountPrice != null) 'discountPrice': discountPrice,
      'quantity': quantity,
      'subtotal': subtotal,
      'taxAmount': taxAmount,
      'totalAmount': totalAmount,
      'status': status.toJson(),
      'isFulfilled': isFulfilled,
      if (fulfilledAt != null) 'fulfilledAt': fulfilledAt?.toJson(),
      'isReturnable': isReturnable,
      if (returnBy != null) 'returnBy': returnBy?.toJson(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'OrderItem',
      'id': id.toJson(),
      'orderId': orderId.toJson(),
      if (order != null) 'order': order?.toJsonForProtocol(),
      'productId': productId.toJson(),
      if (product != null) 'product': product?.toJsonForProtocol(),
      if (variantId != null) 'variantId': variantId?.toJson(),
      if (variant != null) 'variant': variant?.toJsonForProtocol(),
      'productName': productName,
      if (productDescription != null) 'productDescription': productDescription,
      if (productImageUrl != null) 'productImageUrl': productImageUrl,
      if (sku != null) 'sku': sku,
      if (variantName != null) 'variantName': variantName,
      if (color != null) 'color': color,
      if (size != null) 'size': size,
      'unitPrice': unitPrice,
      if (discountPrice != null) 'discountPrice': discountPrice,
      'quantity': quantity,
      'subtotal': subtotal,
      'taxAmount': taxAmount,
      'totalAmount': totalAmount,
      'status': status.toJson(),
      'isFulfilled': isFulfilled,
      if (fulfilledAt != null) 'fulfilledAt': fulfilledAt?.toJson(),
      'isReturnable': isReturnable,
      if (returnBy != null) 'returnBy': returnBy?.toJson(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static OrderItemInclude include({
    _i3.OrderInclude? order,
    _i4.ProductInclude? product,
    _i5.ProductVariantInclude? variant,
  }) {
    return OrderItemInclude._(
      order: order,
      product: product,
      variant: variant,
    );
  }

  static OrderItemIncludeList includeList({
    _i1.WhereExpressionBuilder<OrderItemTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<OrderItemTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<OrderItemTable>? orderByList,
    OrderItemInclude? include,
  }) {
    return OrderItemIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(OrderItem.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(OrderItem.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _OrderItemImpl extends OrderItem {
  _OrderItemImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue orderId,
    _i3.Order? order,
    required _i1.UuidValue productId,
    _i4.Product? product,
    _i1.UuidValue? variantId,
    _i5.ProductVariant? variant,
    required String productName,
    String? productDescription,
    String? productImageUrl,
    String? sku,
    String? variantName,
    String? color,
    String? size,
    required double unitPrice,
    double? discountPrice,
    required int quantity,
    required double subtotal,
    double? taxAmount,
    required double totalAmount,
    _i2.OrderStatus? status,
    bool? isFulfilled,
    DateTime? fulfilledAt,
    bool? isReturnable,
    DateTime? returnBy,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         orderId: orderId,
         order: order,
         productId: productId,
         product: product,
         variantId: variantId,
         variant: variant,
         productName: productName,
         productDescription: productDescription,
         productImageUrl: productImageUrl,
         sku: sku,
         variantName: variantName,
         color: color,
         size: size,
         unitPrice: unitPrice,
         discountPrice: discountPrice,
         quantity: quantity,
         subtotal: subtotal,
         taxAmount: taxAmount,
         totalAmount: totalAmount,
         status: status,
         isFulfilled: isFulfilled,
         fulfilledAt: fulfilledAt,
         isReturnable: isReturnable,
         returnBy: returnBy,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [OrderItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  OrderItem copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? orderId,
    Object? order = _Undefined,
    _i1.UuidValue? productId,
    Object? product = _Undefined,
    Object? variantId = _Undefined,
    Object? variant = _Undefined,
    String? productName,
    Object? productDescription = _Undefined,
    Object? productImageUrl = _Undefined,
    Object? sku = _Undefined,
    Object? variantName = _Undefined,
    Object? color = _Undefined,
    Object? size = _Undefined,
    double? unitPrice,
    Object? discountPrice = _Undefined,
    int? quantity,
    double? subtotal,
    double? taxAmount,
    double? totalAmount,
    _i2.OrderStatus? status,
    bool? isFulfilled,
    Object? fulfilledAt = _Undefined,
    bool? isReturnable,
    Object? returnBy = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return OrderItem(
      id: id ?? this.id,
      orderId: orderId ?? this.orderId,
      order: order is _i3.Order? ? order : this.order?.copyWith(),
      productId: productId ?? this.productId,
      product: product is _i4.Product? ? product : this.product?.copyWith(),
      variantId: variantId is _i1.UuidValue? ? variantId : this.variantId,
      variant: variant is _i5.ProductVariant?
          ? variant
          : this.variant?.copyWith(),
      productName: productName ?? this.productName,
      productDescription: productDescription is String?
          ? productDescription
          : this.productDescription,
      productImageUrl: productImageUrl is String?
          ? productImageUrl
          : this.productImageUrl,
      sku: sku is String? ? sku : this.sku,
      variantName: variantName is String? ? variantName : this.variantName,
      color: color is String? ? color : this.color,
      size: size is String? ? size : this.size,
      unitPrice: unitPrice ?? this.unitPrice,
      discountPrice: discountPrice is double?
          ? discountPrice
          : this.discountPrice,
      quantity: quantity ?? this.quantity,
      subtotal: subtotal ?? this.subtotal,
      taxAmount: taxAmount ?? this.taxAmount,
      totalAmount: totalAmount ?? this.totalAmount,
      status: status ?? this.status,
      isFulfilled: isFulfilled ?? this.isFulfilled,
      fulfilledAt: fulfilledAt is DateTime? ? fulfilledAt : this.fulfilledAt,
      isReturnable: isReturnable ?? this.isReturnable,
      returnBy: returnBy is DateTime? ? returnBy : this.returnBy,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class OrderItemUpdateTable extends _i1.UpdateTable<OrderItemTable> {
  OrderItemUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> orderId(_i1.UuidValue value) =>
      _i1.ColumnValue(
        table.orderId,
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

  _i1.ColumnValue<String, String> productName(String value) => _i1.ColumnValue(
    table.productName,
    value,
  );

  _i1.ColumnValue<String, String> productDescription(String? value) =>
      _i1.ColumnValue(
        table.productDescription,
        value,
      );

  _i1.ColumnValue<String, String> productImageUrl(String? value) =>
      _i1.ColumnValue(
        table.productImageUrl,
        value,
      );

  _i1.ColumnValue<String, String> sku(String? value) => _i1.ColumnValue(
    table.sku,
    value,
  );

  _i1.ColumnValue<String, String> variantName(String? value) => _i1.ColumnValue(
    table.variantName,
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

  _i1.ColumnValue<double, double> unitPrice(double value) => _i1.ColumnValue(
    table.unitPrice,
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

  _i1.ColumnValue<double, double> subtotal(double value) => _i1.ColumnValue(
    table.subtotal,
    value,
  );

  _i1.ColumnValue<double, double> taxAmount(double value) => _i1.ColumnValue(
    table.taxAmount,
    value,
  );

  _i1.ColumnValue<double, double> totalAmount(double value) => _i1.ColumnValue(
    table.totalAmount,
    value,
  );

  _i1.ColumnValue<_i2.OrderStatus, _i2.OrderStatus> status(
    _i2.OrderStatus value,
  ) => _i1.ColumnValue(
    table.status,
    value,
  );

  _i1.ColumnValue<bool, bool> isFulfilled(bool value) => _i1.ColumnValue(
    table.isFulfilled,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> fulfilledAt(DateTime? value) =>
      _i1.ColumnValue(
        table.fulfilledAt,
        value,
      );

  _i1.ColumnValue<bool, bool> isReturnable(bool value) => _i1.ColumnValue(
    table.isReturnable,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> returnBy(DateTime? value) =>
      _i1.ColumnValue(
        table.returnBy,
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

class OrderItemTable extends _i1.Table<_i1.UuidValue> {
  OrderItemTable({super.tableRelation}) : super(tableName: 'order_items') {
    updateTable = OrderItemUpdateTable(this);
    orderId = _i1.ColumnUuid(
      'orderId',
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
    productName = _i1.ColumnString(
      'productName',
      this,
    );
    productDescription = _i1.ColumnString(
      'productDescription',
      this,
    );
    productImageUrl = _i1.ColumnString(
      'productImageUrl',
      this,
    );
    sku = _i1.ColumnString(
      'sku',
      this,
    );
    variantName = _i1.ColumnString(
      'variantName',
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
    unitPrice = _i1.ColumnDouble(
      'unitPrice',
      this,
    );
    discountPrice = _i1.ColumnDouble(
      'discountPrice',
      this,
    );
    quantity = _i1.ColumnInt(
      'quantity',
      this,
    );
    subtotal = _i1.ColumnDouble(
      'subtotal',
      this,
    );
    taxAmount = _i1.ColumnDouble(
      'taxAmount',
      this,
      hasDefault: true,
    );
    totalAmount = _i1.ColumnDouble(
      'totalAmount',
      this,
    );
    status = _i1.ColumnEnum(
      'status',
      this,
      _i1.EnumSerialization.byName,
      hasDefault: true,
    );
    isFulfilled = _i1.ColumnBool(
      'isFulfilled',
      this,
      hasDefault: true,
    );
    fulfilledAt = _i1.ColumnDateTime(
      'fulfilledAt',
      this,
    );
    isReturnable = _i1.ColumnBool(
      'isReturnable',
      this,
      hasDefault: true,
    );
    returnBy = _i1.ColumnDateTime(
      'returnBy',
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

  late final OrderItemUpdateTable updateTable;

  late final _i1.ColumnUuid orderId;

  _i3.OrderTable? _order;

  late final _i1.ColumnUuid productId;

  _i4.ProductTable? _product;

  late final _i1.ColumnUuid variantId;

  _i5.ProductVariantTable? _variant;

  late final _i1.ColumnString productName;

  late final _i1.ColumnString productDescription;

  late final _i1.ColumnString productImageUrl;

  late final _i1.ColumnString sku;

  late final _i1.ColumnString variantName;

  late final _i1.ColumnString color;

  late final _i1.ColumnString size;

  late final _i1.ColumnDouble unitPrice;

  late final _i1.ColumnDouble discountPrice;

  late final _i1.ColumnInt quantity;

  late final _i1.ColumnDouble subtotal;

  late final _i1.ColumnDouble taxAmount;

  late final _i1.ColumnDouble totalAmount;

  late final _i1.ColumnEnum<_i2.OrderStatus> status;

  late final _i1.ColumnBool isFulfilled;

  late final _i1.ColumnDateTime fulfilledAt;

  late final _i1.ColumnBool isReturnable;

  late final _i1.ColumnDateTime returnBy;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  _i3.OrderTable get order {
    if (_order != null) return _order!;
    _order = _i1.createRelationTable(
      relationFieldName: 'order',
      field: OrderItem.t.orderId,
      foreignField: _i3.Order.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.OrderTable(tableRelation: foreignTableRelation),
    );
    return _order!;
  }

  _i4.ProductTable get product {
    if (_product != null) return _product!;
    _product = _i1.createRelationTable(
      relationFieldName: 'product',
      field: OrderItem.t.productId,
      foreignField: _i4.Product.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.ProductTable(tableRelation: foreignTableRelation),
    );
    return _product!;
  }

  _i5.ProductVariantTable get variant {
    if (_variant != null) return _variant!;
    _variant = _i1.createRelationTable(
      relationFieldName: 'variant',
      field: OrderItem.t.variantId,
      foreignField: _i5.ProductVariant.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.ProductVariantTable(tableRelation: foreignTableRelation),
    );
    return _variant!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    orderId,
    productId,
    variantId,
    productName,
    productDescription,
    productImageUrl,
    sku,
    variantName,
    color,
    size,
    unitPrice,
    discountPrice,
    quantity,
    subtotal,
    taxAmount,
    totalAmount,
    status,
    isFulfilled,
    fulfilledAt,
    isReturnable,
    returnBy,
    createdAt,
    updatedAt,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'order') {
      return order;
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

class OrderItemInclude extends _i1.IncludeObject {
  OrderItemInclude._({
    _i3.OrderInclude? order,
    _i4.ProductInclude? product,
    _i5.ProductVariantInclude? variant,
  }) {
    _order = order;
    _product = product;
    _variant = variant;
  }

  _i3.OrderInclude? _order;

  _i4.ProductInclude? _product;

  _i5.ProductVariantInclude? _variant;

  @override
  Map<String, _i1.Include?> get includes => {
    'order': _order,
    'product': _product,
    'variant': _variant,
  };

  @override
  _i1.Table<_i1.UuidValue> get table => OrderItem.t;
}

class OrderItemIncludeList extends _i1.IncludeList {
  OrderItemIncludeList._({
    _i1.WhereExpressionBuilder<OrderItemTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(OrderItem.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue> get table => OrderItem.t;
}

class OrderItemRepository {
  const OrderItemRepository._();

  final attachRow = const OrderItemAttachRowRepository._();

  final detachRow = const OrderItemDetachRowRepository._();

  /// Returns a list of [OrderItem]s matching the given query parameters.
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
  Future<List<OrderItem>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<OrderItemTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<OrderItemTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<OrderItemTable>? orderByList,
    _i1.Transaction? transaction,
    OrderItemInclude? include,
  }) async {
    return session.db.find<OrderItem>(
      where: where?.call(OrderItem.t),
      orderBy: orderBy?.call(OrderItem.t),
      orderByList: orderByList?.call(OrderItem.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [OrderItem] matching the given query parameters.
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
  Future<OrderItem?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<OrderItemTable>? where,
    int? offset,
    _i1.OrderByBuilder<OrderItemTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<OrderItemTable>? orderByList,
    _i1.Transaction? transaction,
    OrderItemInclude? include,
  }) async {
    return session.db.findFirstRow<OrderItem>(
      where: where?.call(OrderItem.t),
      orderBy: orderBy?.call(OrderItem.t),
      orderByList: orderByList?.call(OrderItem.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [OrderItem] by its [id] or null if no such row exists.
  Future<OrderItem?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
    OrderItemInclude? include,
  }) async {
    return session.db.findById<OrderItem>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [OrderItem]s in the list and returns the inserted rows.
  ///
  /// The returned [OrderItem]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<OrderItem>> insert(
    _i1.Session session,
    List<OrderItem> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<OrderItem>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [OrderItem] and returns the inserted row.
  ///
  /// The returned [OrderItem] will have its `id` field set.
  Future<OrderItem> insertRow(
    _i1.Session session,
    OrderItem row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<OrderItem>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [OrderItem]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<OrderItem>> update(
    _i1.Session session,
    List<OrderItem> rows, {
    _i1.ColumnSelections<OrderItemTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<OrderItem>(
      rows,
      columns: columns?.call(OrderItem.t),
      transaction: transaction,
    );
  }

  /// Updates a single [OrderItem]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<OrderItem> updateRow(
    _i1.Session session,
    OrderItem row, {
    _i1.ColumnSelections<OrderItemTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<OrderItem>(
      row,
      columns: columns?.call(OrderItem.t),
      transaction: transaction,
    );
  }

  /// Updates a single [OrderItem] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<OrderItem?> updateById(
    _i1.Session session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<OrderItemUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<OrderItem>(
      id,
      columnValues: columnValues(OrderItem.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [OrderItem]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<OrderItem>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<OrderItemUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<OrderItemTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<OrderItemTable>? orderBy,
    _i1.OrderByListBuilder<OrderItemTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<OrderItem>(
      columnValues: columnValues(OrderItem.t.updateTable),
      where: where(OrderItem.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(OrderItem.t),
      orderByList: orderByList?.call(OrderItem.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [OrderItem]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<OrderItem>> delete(
    _i1.Session session,
    List<OrderItem> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<OrderItem>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [OrderItem].
  Future<OrderItem> deleteRow(
    _i1.Session session,
    OrderItem row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<OrderItem>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<OrderItem>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<OrderItemTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<OrderItem>(
      where: where(OrderItem.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<OrderItemTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<OrderItem>(
      where: where?.call(OrderItem.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class OrderItemAttachRowRepository {
  const OrderItemAttachRowRepository._();

  /// Creates a relation between the given [OrderItem] and [Order]
  /// by setting the [OrderItem]'s foreign key `orderId` to refer to the [Order].
  Future<void> order(
    _i1.Session session,
    OrderItem orderItem,
    _i3.Order order, {
    _i1.Transaction? transaction,
  }) async {
    if (orderItem.id == null) {
      throw ArgumentError.notNull('orderItem.id');
    }
    if (order.id == null) {
      throw ArgumentError.notNull('order.id');
    }

    var $orderItem = orderItem.copyWith(orderId: order.id);
    await session.db.updateRow<OrderItem>(
      $orderItem,
      columns: [OrderItem.t.orderId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [OrderItem] and [Product]
  /// by setting the [OrderItem]'s foreign key `productId` to refer to the [Product].
  Future<void> product(
    _i1.Session session,
    OrderItem orderItem,
    _i4.Product product, {
    _i1.Transaction? transaction,
  }) async {
    if (orderItem.id == null) {
      throw ArgumentError.notNull('orderItem.id');
    }
    if (product.id == null) {
      throw ArgumentError.notNull('product.id');
    }

    var $orderItem = orderItem.copyWith(productId: product.id);
    await session.db.updateRow<OrderItem>(
      $orderItem,
      columns: [OrderItem.t.productId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [OrderItem] and [ProductVariant]
  /// by setting the [OrderItem]'s foreign key `variantId` to refer to the [ProductVariant].
  Future<void> variant(
    _i1.Session session,
    OrderItem orderItem,
    _i5.ProductVariant variant, {
    _i1.Transaction? transaction,
  }) async {
    if (orderItem.id == null) {
      throw ArgumentError.notNull('orderItem.id');
    }
    if (variant.id == null) {
      throw ArgumentError.notNull('variant.id');
    }

    var $orderItem = orderItem.copyWith(variantId: variant.id);
    await session.db.updateRow<OrderItem>(
      $orderItem,
      columns: [OrderItem.t.variantId],
      transaction: transaction,
    );
  }
}

class OrderItemDetachRowRepository {
  const OrderItemDetachRowRepository._();

  /// Detaches the relation between this [OrderItem] and the [ProductVariant] set in `variant`
  /// by setting the [OrderItem]'s foreign key `variantId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> variant(
    _i1.Session session,
    OrderItem orderItem, {
    _i1.Transaction? transaction,
  }) async {
    if (orderItem.id == null) {
      throw ArgumentError.notNull('orderItem.id');
    }

    var $orderItem = orderItem.copyWith(variantId: null);
    await session.db.updateRow<OrderItem>(
      $orderItem,
      columns: [OrderItem.t.variantId],
      transaction: transaction,
    );
  }
}
