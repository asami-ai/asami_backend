/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import '../order/order_status.dart' as _i2;
import '../order/order.dart' as _i3;
import '../product/product.dart' as _i4;
import '../product/product_variant.dart' as _i5;

abstract class OrderItem implements _i1.SerializableModel {
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
  })  : id = id ?? _i1.Uuid().v4obj(),
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
      orderId:
          _i1.UuidValueJsonExtension.fromJson(jsonSerialization['orderId']),
      order: jsonSerialization['order'] == null
          ? null
          : _i3.Order.fromJson(
              (jsonSerialization['order'] as Map<String, dynamic>)),
      productId:
          _i1.UuidValueJsonExtension.fromJson(jsonSerialization['productId']),
      product: jsonSerialization['product'] == null
          ? null
          : _i4.Product.fromJson(
              (jsonSerialization['product'] as Map<String, dynamic>)),
      variantId: jsonSerialization['variantId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['variantId']),
      variant: jsonSerialization['variant'] == null
          ? null
          : _i5.ProductVariant.fromJson(
              (jsonSerialization['variant'] as Map<String, dynamic>)),
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
      status: _i2.OrderStatus.fromJson((jsonSerialization['status'] as int)),
      isFulfilled: jsonSerialization['isFulfilled'] as bool,
      fulfilledAt: jsonSerialization['fulfilledAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['fulfilledAt']),
      isReturnable: jsonSerialization['isReturnable'] as bool,
      returnBy: jsonSerialization['returnBy'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['returnBy']),
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
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
      variant:
          variant is _i5.ProductVariant? ? variant : this.variant?.copyWith(),
      productName: productName ?? this.productName,
      productDescription: productDescription is String?
          ? productDescription
          : this.productDescription,
      productImageUrl:
          productImageUrl is String? ? productImageUrl : this.productImageUrl,
      sku: sku is String? ? sku : this.sku,
      variantName: variantName is String? ? variantName : this.variantName,
      color: color is String? ? color : this.color,
      size: size is String? ? size : this.size,
      unitPrice: unitPrice ?? this.unitPrice,
      discountPrice:
          discountPrice is double? ? discountPrice : this.discountPrice,
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
