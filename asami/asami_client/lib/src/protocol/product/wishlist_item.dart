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
import '../product/wishlist.dart' as _i2;
import '../product/product.dart' as _i3;
import 'package:asami_client/src/protocol/protocol.dart' as _i4;

abstract class WishlistItem implements _i1.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
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
