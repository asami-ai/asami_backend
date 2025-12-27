/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import '../order/cart.dart' as _i2;
import '../product/product.dart' as _i3;
import '../product/product_variant.dart' as _i4;
import 'package:asami_client/src/protocol/protocol.dart' as _i5;

abstract class CartItem implements _i1.SerializableModel {
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
      quantity: jsonSerialization['quantity'] as int,
      unitPrice: (jsonSerialization['unitPrice'] as num).toDouble(),
      subtotal: (jsonSerialization['subtotal'] as num).toDouble(),
      customerNotes: jsonSerialization['customerNotes'] as String?,
      addedAt: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['addedAt']),
      updatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
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
