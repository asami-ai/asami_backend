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
import '../product/product.dart' as _i2;
import 'package:asami_client/src/protocol/protocol.dart' as _i3;

abstract class ProductVariant implements _i1.SerializableModel {
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
      id: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
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
      quantity: jsonSerialization['quantity'] as int,
      imageUrl: jsonSerialization['imageUrl'] as String?,
      images: jsonSerialization['images'] == null
          ? null
          : _i3.Protocol().deserialize<List<String>>(
              jsonSerialization['images'],
            ),
      isActive: jsonSerialization['isActive'] as bool,
      isDefault: jsonSerialization['isDefault'] as bool,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
    );
  }

  /// The id of the object.
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
