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

abstract class CategoryMapping implements _i1.SerializableModel {
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

  /// The id of the object.
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
