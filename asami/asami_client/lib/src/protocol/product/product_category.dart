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
import '../product/product_category.dart' as _i2;
import 'package:asami_client/src/protocol/protocol.dart' as _i3;

abstract class ProductCategory implements _i1.SerializableModel {
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

  /// The id of the object.
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
