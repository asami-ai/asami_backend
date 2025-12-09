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
import '../product/category.dart' as _i2;

abstract class Category implements _i1.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
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
