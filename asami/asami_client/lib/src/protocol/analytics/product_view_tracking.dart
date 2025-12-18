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
import '../user/user.dart' as _i2;
import '../product/product.dart' as _i3;
import '../messaging/platfom_type.dart' as _i4;

abstract class ProductView implements _i1.SerializableModel {
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
  })  : id = id ?? _i1.Uuid().v4obj(),
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
          : _i2.User.fromJson(
              (jsonSerialization['user'] as Map<String, dynamic>)),
      productId:
          _i1.UuidValueJsonExtension.fromJson(jsonSerialization['productId']),
      product: jsonSerialization['product'] == null
          ? null
          : _i3.Product.fromJson(
              (jsonSerialization['product'] as Map<String, dynamic>)),
      platform:
          _i4.PlatformType.fromJson((jsonSerialization['platform'] as int)),
      source: jsonSerialization['source'] as String?,
      viewDurationSeconds: jsonSerialization['viewDurationSeconds'] as int?,
      addedToCart: jsonSerialization['addedToCart'] as bool,
      purchased: jsonSerialization['purchased'] as bool,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
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
