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
import '../product/product_status.dart' as _i2;
import '../product/product_condition.dart' as _i3;
import '../user/vendor_profile.dart' as _i4;
import 'package:asami_server/src/generated/protocol.dart' as _i5;

abstract class Product
    implements _i1.TableRow<_i1.UuidValue>, _i1.ProtocolSerialization {
  Product._({
    _i1.UuidValue? id,
    required this.vendorId,
    this.vendor,
    required this.name,
    required this.description,
    this.shortDescription,
    required this.category,
    this.subCategory,
    this.tags,
    this.facebookCategory,
    this.facebookCategoryId,
    this.googleCategory,
    this.googleCategoryId,
    bool? isAiGenerated,
    this.aiGeneratedAt,
    this.aiConfidenceScore,
    bool? hasAiGeneratedImages,
    required this.basePrice,
    this.discountPrice,
    this.discountPercentage,
    this.discountStartDate,
    this.discountEndDate,
    String? currency,
    this.sku,
    this.barcode,
    int? quantity,
    int? lowStockThreshold,
    bool? trackInventory,
    this.weight,
    this.weightUnit,
    this.dimensions,
    this.color,
    this.size,
    this.material,
    this.brand,
    _i2.ProductStatus? status,
    bool? isActive,
    bool? isFeatured,
    _i3.ProductCondition? condition,
    required this.images,
    this.thumbnailUrl,
    this.videoUrl,
    this.videoThumbnailUrl,
    this.whatsappMediaIds,
    this.telegramFileIds,
    String? cdnUploadStatus,
    this.cdnUploadedAt,
    this.originalMediaUrls,
    this.metaCatalogId,
    this.metaProductId,
    String? metaSyncStatus,
    this.metaSyncedAt,
    this.metaSyncError,
    bool? shippingRequired,
    this.estimatedDeliveryDays,
    bool? freeShipping,
    double? shippingCost,
    int? viewCount,
    int? orderCount,
    int? wishlistCount,
    double? averageRating,
    int? totalReviews,
    double? conversionRate,
    this.searchKeywords,
    this.metaTitle,
    this.metaDescription,
    DateTime? createdAt,
    DateTime? updatedAt,
    this.publishedAt,
    this.deletedAt,
  }) : id = id ?? _i1.Uuid().v4obj(),
       isAiGenerated = isAiGenerated ?? false,
       hasAiGeneratedImages = hasAiGeneratedImages ?? false,
       currency = currency ?? 'NGN',
       quantity = quantity ?? 0,
       lowStockThreshold = lowStockThreshold ?? 5,
       trackInventory = trackInventory ?? true,
       status = status ?? _i2.ProductStatus.draft,
       isActive = isActive ?? true,
       isFeatured = isFeatured ?? false,
       condition = condition ?? _i3.ProductCondition.newItem,
       cdnUploadStatus = cdnUploadStatus ?? 'pending',
       metaSyncStatus = metaSyncStatus ?? 'pending',
       shippingRequired = shippingRequired ?? true,
       freeShipping = freeShipping ?? false,
       shippingCost = shippingCost ?? 0.0,
       viewCount = viewCount ?? 0,
       orderCount = orderCount ?? 0,
       wishlistCount = wishlistCount ?? 0,
       averageRating = averageRating ?? 0.0,
       totalReviews = totalReviews ?? 0,
       conversionRate = conversionRate ?? 0.0,
       createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory Product({
    _i1.UuidValue? id,
    required _i1.UuidValue vendorId,
    _i4.VendorProfile? vendor,
    required String name,
    required String description,
    String? shortDescription,
    required String category,
    String? subCategory,
    List<String>? tags,
    String? facebookCategory,
    String? facebookCategoryId,
    String? googleCategory,
    String? googleCategoryId,
    bool? isAiGenerated,
    DateTime? aiGeneratedAt,
    double? aiConfidenceScore,
    bool? hasAiGeneratedImages,
    required double basePrice,
    double? discountPrice,
    double? discountPercentage,
    DateTime? discountStartDate,
    DateTime? discountEndDate,
    String? currency,
    String? sku,
    String? barcode,
    int? quantity,
    int? lowStockThreshold,
    bool? trackInventory,
    double? weight,
    String? weightUnit,
    String? dimensions,
    List<String>? color,
    List<String>? size,
    String? material,
    String? brand,
    _i2.ProductStatus? status,
    bool? isActive,
    bool? isFeatured,
    _i3.ProductCondition? condition,
    required List<String> images,
    String? thumbnailUrl,
    String? videoUrl,
    String? videoThumbnailUrl,
    List<String>? whatsappMediaIds,
    List<String>? telegramFileIds,
    String? cdnUploadStatus,
    DateTime? cdnUploadedAt,
    List<String>? originalMediaUrls,
    String? metaCatalogId,
    String? metaProductId,
    String? metaSyncStatus,
    DateTime? metaSyncedAt,
    String? metaSyncError,
    bool? shippingRequired,
    int? estimatedDeliveryDays,
    bool? freeShipping,
    double? shippingCost,
    int? viewCount,
    int? orderCount,
    int? wishlistCount,
    double? averageRating,
    int? totalReviews,
    double? conversionRate,
    List<String>? searchKeywords,
    String? metaTitle,
    String? metaDescription,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? publishedAt,
    DateTime? deletedAt,
  }) = _ProductImpl;

  factory Product.fromJson(Map<String, dynamic> jsonSerialization) {
    return Product(
      id: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      vendorId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['vendorId'],
      ),
      vendor: jsonSerialization['vendor'] == null
          ? null
          : _i5.Protocol().deserialize<_i4.VendorProfile>(
              jsonSerialization['vendor'],
            ),
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String,
      shortDescription: jsonSerialization['shortDescription'] as String?,
      category: jsonSerialization['category'] as String,
      subCategory: jsonSerialization['subCategory'] as String?,
      tags: jsonSerialization['tags'] == null
          ? null
          : _i5.Protocol().deserialize<List<String>>(jsonSerialization['tags']),
      facebookCategory: jsonSerialization['facebookCategory'] as String?,
      facebookCategoryId: jsonSerialization['facebookCategoryId'] as String?,
      googleCategory: jsonSerialization['googleCategory'] as String?,
      googleCategoryId: jsonSerialization['googleCategoryId'] as String?,
      isAiGenerated: jsonSerialization['isAiGenerated'] as bool,
      aiGeneratedAt: jsonSerialization['aiGeneratedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['aiGeneratedAt'],
            ),
      aiConfidenceScore: (jsonSerialization['aiConfidenceScore'] as num?)
          ?.toDouble(),
      hasAiGeneratedImages: jsonSerialization['hasAiGeneratedImages'] as bool,
      basePrice: (jsonSerialization['basePrice'] as num).toDouble(),
      discountPrice: (jsonSerialization['discountPrice'] as num?)?.toDouble(),
      discountPercentage: (jsonSerialization['discountPercentage'] as num?)
          ?.toDouble(),
      discountStartDate: jsonSerialization['discountStartDate'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['discountStartDate'],
            ),
      discountEndDate: jsonSerialization['discountEndDate'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['discountEndDate'],
            ),
      currency: jsonSerialization['currency'] as String,
      sku: jsonSerialization['sku'] as String?,
      barcode: jsonSerialization['barcode'] as String?,
      quantity: jsonSerialization['quantity'] as int,
      lowStockThreshold: jsonSerialization['lowStockThreshold'] as int,
      trackInventory: jsonSerialization['trackInventory'] as bool,
      weight: (jsonSerialization['weight'] as num?)?.toDouble(),
      weightUnit: jsonSerialization['weightUnit'] as String?,
      dimensions: jsonSerialization['dimensions'] as String?,
      color: jsonSerialization['color'] == null
          ? null
          : _i5.Protocol().deserialize<List<String>>(
              jsonSerialization['color'],
            ),
      size: jsonSerialization['size'] == null
          ? null
          : _i5.Protocol().deserialize<List<String>>(jsonSerialization['size']),
      material: jsonSerialization['material'] as String?,
      brand: jsonSerialization['brand'] as String?,
      status: _i2.ProductStatus.fromJson(
        (jsonSerialization['status'] as String),
      ),
      isActive: jsonSerialization['isActive'] as bool,
      isFeatured: jsonSerialization['isFeatured'] as bool,
      condition: _i3.ProductCondition.fromJson(
        (jsonSerialization['condition'] as String),
      ),
      images: _i5.Protocol().deserialize<List<String>>(
        jsonSerialization['images'],
      ),
      thumbnailUrl: jsonSerialization['thumbnailUrl'] as String?,
      videoUrl: jsonSerialization['videoUrl'] as String?,
      videoThumbnailUrl: jsonSerialization['videoThumbnailUrl'] as String?,
      whatsappMediaIds: jsonSerialization['whatsappMediaIds'] == null
          ? null
          : _i5.Protocol().deserialize<List<String>>(
              jsonSerialization['whatsappMediaIds'],
            ),
      telegramFileIds: jsonSerialization['telegramFileIds'] == null
          ? null
          : _i5.Protocol().deserialize<List<String>>(
              jsonSerialization['telegramFileIds'],
            ),
      cdnUploadStatus: jsonSerialization['cdnUploadStatus'] as String,
      cdnUploadedAt: jsonSerialization['cdnUploadedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['cdnUploadedAt'],
            ),
      originalMediaUrls: jsonSerialization['originalMediaUrls'] == null
          ? null
          : _i5.Protocol().deserialize<List<String>>(
              jsonSerialization['originalMediaUrls'],
            ),
      metaCatalogId: jsonSerialization['metaCatalogId'] as String?,
      metaProductId: jsonSerialization['metaProductId'] as String?,
      metaSyncStatus: jsonSerialization['metaSyncStatus'] as String,
      metaSyncedAt: jsonSerialization['metaSyncedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['metaSyncedAt'],
            ),
      metaSyncError: jsonSerialization['metaSyncError'] as String?,
      shippingRequired: jsonSerialization['shippingRequired'] as bool,
      estimatedDeliveryDays: jsonSerialization['estimatedDeliveryDays'] as int?,
      freeShipping: jsonSerialization['freeShipping'] as bool,
      shippingCost: (jsonSerialization['shippingCost'] as num).toDouble(),
      viewCount: jsonSerialization['viewCount'] as int,
      orderCount: jsonSerialization['orderCount'] as int,
      wishlistCount: jsonSerialization['wishlistCount'] as int,
      averageRating: (jsonSerialization['averageRating'] as num).toDouble(),
      totalReviews: jsonSerialization['totalReviews'] as int,
      conversionRate: (jsonSerialization['conversionRate'] as num).toDouble(),
      searchKeywords: jsonSerialization['searchKeywords'] == null
          ? null
          : _i5.Protocol().deserialize<List<String>>(
              jsonSerialization['searchKeywords'],
            ),
      metaTitle: jsonSerialization['metaTitle'] as String?,
      metaDescription: jsonSerialization['metaDescription'] as String?,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
      publishedAt: jsonSerialization['publishedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['publishedAt'],
            ),
      deletedAt: jsonSerialization['deletedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['deletedAt']),
    );
  }

  static final t = ProductTable();

  static const db = ProductRepository._();

  @override
  _i1.UuidValue id;

  _i1.UuidValue vendorId;

  _i4.VendorProfile? vendor;

  String name;

  String description;

  String? shortDescription;

  String category;

  String? subCategory;

  List<String>? tags;

  String? facebookCategory;

  String? facebookCategoryId;

  String? googleCategory;

  String? googleCategoryId;

  bool isAiGenerated;

  DateTime? aiGeneratedAt;

  double? aiConfidenceScore;

  bool hasAiGeneratedImages;

  double basePrice;

  double? discountPrice;

  double? discountPercentage;

  DateTime? discountStartDate;

  DateTime? discountEndDate;

  String currency;

  String? sku;

  String? barcode;

  int quantity;

  int lowStockThreshold;

  bool trackInventory;

  double? weight;

  String? weightUnit;

  String? dimensions;

  List<String>? color;

  List<String>? size;

  String? material;

  String? brand;

  _i2.ProductStatus status;

  bool isActive;

  bool isFeatured;

  _i3.ProductCondition condition;

  List<String> images;

  String? thumbnailUrl;

  String? videoUrl;

  String? videoThumbnailUrl;

  List<String>? whatsappMediaIds;

  List<String>? telegramFileIds;

  String cdnUploadStatus;

  DateTime? cdnUploadedAt;

  List<String>? originalMediaUrls;

  String? metaCatalogId;

  String? metaProductId;

  String metaSyncStatus;

  DateTime? metaSyncedAt;

  String? metaSyncError;

  bool shippingRequired;

  int? estimatedDeliveryDays;

  bool freeShipping;

  double shippingCost;

  int viewCount;

  int orderCount;

  int wishlistCount;

  double averageRating;

  int totalReviews;

  double conversionRate;

  List<String>? searchKeywords;

  String? metaTitle;

  String? metaDescription;

  DateTime createdAt;

  DateTime updatedAt;

  DateTime? publishedAt;

  DateTime? deletedAt;

  @override
  _i1.Table<_i1.UuidValue> get table => t;

  /// Returns a shallow copy of this [Product]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Product copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? vendorId,
    _i4.VendorProfile? vendor,
    String? name,
    String? description,
    String? shortDescription,
    String? category,
    String? subCategory,
    List<String>? tags,
    String? facebookCategory,
    String? facebookCategoryId,
    String? googleCategory,
    String? googleCategoryId,
    bool? isAiGenerated,
    DateTime? aiGeneratedAt,
    double? aiConfidenceScore,
    bool? hasAiGeneratedImages,
    double? basePrice,
    double? discountPrice,
    double? discountPercentage,
    DateTime? discountStartDate,
    DateTime? discountEndDate,
    String? currency,
    String? sku,
    String? barcode,
    int? quantity,
    int? lowStockThreshold,
    bool? trackInventory,
    double? weight,
    String? weightUnit,
    String? dimensions,
    List<String>? color,
    List<String>? size,
    String? material,
    String? brand,
    _i2.ProductStatus? status,
    bool? isActive,
    bool? isFeatured,
    _i3.ProductCondition? condition,
    List<String>? images,
    String? thumbnailUrl,
    String? videoUrl,
    String? videoThumbnailUrl,
    List<String>? whatsappMediaIds,
    List<String>? telegramFileIds,
    String? cdnUploadStatus,
    DateTime? cdnUploadedAt,
    List<String>? originalMediaUrls,
    String? metaCatalogId,
    String? metaProductId,
    String? metaSyncStatus,
    DateTime? metaSyncedAt,
    String? metaSyncError,
    bool? shippingRequired,
    int? estimatedDeliveryDays,
    bool? freeShipping,
    double? shippingCost,
    int? viewCount,
    int? orderCount,
    int? wishlistCount,
    double? averageRating,
    int? totalReviews,
    double? conversionRate,
    List<String>? searchKeywords,
    String? metaTitle,
    String? metaDescription,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? publishedAt,
    DateTime? deletedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Product',
      'id': id.toJson(),
      'vendorId': vendorId.toJson(),
      if (vendor != null) 'vendor': vendor?.toJson(),
      'name': name,
      'description': description,
      if (shortDescription != null) 'shortDescription': shortDescription,
      'category': category,
      if (subCategory != null) 'subCategory': subCategory,
      if (tags != null) 'tags': tags?.toJson(),
      if (facebookCategory != null) 'facebookCategory': facebookCategory,
      if (facebookCategoryId != null) 'facebookCategoryId': facebookCategoryId,
      if (googleCategory != null) 'googleCategory': googleCategory,
      if (googleCategoryId != null) 'googleCategoryId': googleCategoryId,
      'isAiGenerated': isAiGenerated,
      if (aiGeneratedAt != null) 'aiGeneratedAt': aiGeneratedAt?.toJson(),
      if (aiConfidenceScore != null) 'aiConfidenceScore': aiConfidenceScore,
      'hasAiGeneratedImages': hasAiGeneratedImages,
      'basePrice': basePrice,
      if (discountPrice != null) 'discountPrice': discountPrice,
      if (discountPercentage != null) 'discountPercentage': discountPercentage,
      if (discountStartDate != null)
        'discountStartDate': discountStartDate?.toJson(),
      if (discountEndDate != null) 'discountEndDate': discountEndDate?.toJson(),
      'currency': currency,
      if (sku != null) 'sku': sku,
      if (barcode != null) 'barcode': barcode,
      'quantity': quantity,
      'lowStockThreshold': lowStockThreshold,
      'trackInventory': trackInventory,
      if (weight != null) 'weight': weight,
      if (weightUnit != null) 'weightUnit': weightUnit,
      if (dimensions != null) 'dimensions': dimensions,
      if (color != null) 'color': color?.toJson(),
      if (size != null) 'size': size?.toJson(),
      if (material != null) 'material': material,
      if (brand != null) 'brand': brand,
      'status': status.toJson(),
      'isActive': isActive,
      'isFeatured': isFeatured,
      'condition': condition.toJson(),
      'images': images.toJson(),
      if (thumbnailUrl != null) 'thumbnailUrl': thumbnailUrl,
      if (videoUrl != null) 'videoUrl': videoUrl,
      if (videoThumbnailUrl != null) 'videoThumbnailUrl': videoThumbnailUrl,
      if (whatsappMediaIds != null)
        'whatsappMediaIds': whatsappMediaIds?.toJson(),
      if (telegramFileIds != null) 'telegramFileIds': telegramFileIds?.toJson(),
      'cdnUploadStatus': cdnUploadStatus,
      if (cdnUploadedAt != null) 'cdnUploadedAt': cdnUploadedAt?.toJson(),
      if (originalMediaUrls != null)
        'originalMediaUrls': originalMediaUrls?.toJson(),
      if (metaCatalogId != null) 'metaCatalogId': metaCatalogId,
      if (metaProductId != null) 'metaProductId': metaProductId,
      'metaSyncStatus': metaSyncStatus,
      if (metaSyncedAt != null) 'metaSyncedAt': metaSyncedAt?.toJson(),
      if (metaSyncError != null) 'metaSyncError': metaSyncError,
      'shippingRequired': shippingRequired,
      if (estimatedDeliveryDays != null)
        'estimatedDeliveryDays': estimatedDeliveryDays,
      'freeShipping': freeShipping,
      'shippingCost': shippingCost,
      'viewCount': viewCount,
      'orderCount': orderCount,
      'wishlistCount': wishlistCount,
      'averageRating': averageRating,
      'totalReviews': totalReviews,
      'conversionRate': conversionRate,
      if (searchKeywords != null) 'searchKeywords': searchKeywords?.toJson(),
      if (metaTitle != null) 'metaTitle': metaTitle,
      if (metaDescription != null) 'metaDescription': metaDescription,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      if (publishedAt != null) 'publishedAt': publishedAt?.toJson(),
      if (deletedAt != null) 'deletedAt': deletedAt?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Product',
      'id': id.toJson(),
      'vendorId': vendorId.toJson(),
      if (vendor != null) 'vendor': vendor?.toJsonForProtocol(),
      'name': name,
      'description': description,
      if (shortDescription != null) 'shortDescription': shortDescription,
      'category': category,
      if (subCategory != null) 'subCategory': subCategory,
      if (tags != null) 'tags': tags?.toJson(),
      if (facebookCategory != null) 'facebookCategory': facebookCategory,
      if (facebookCategoryId != null) 'facebookCategoryId': facebookCategoryId,
      if (googleCategory != null) 'googleCategory': googleCategory,
      if (googleCategoryId != null) 'googleCategoryId': googleCategoryId,
      'isAiGenerated': isAiGenerated,
      if (aiGeneratedAt != null) 'aiGeneratedAt': aiGeneratedAt?.toJson(),
      if (aiConfidenceScore != null) 'aiConfidenceScore': aiConfidenceScore,
      'hasAiGeneratedImages': hasAiGeneratedImages,
      'basePrice': basePrice,
      if (discountPrice != null) 'discountPrice': discountPrice,
      if (discountPercentage != null) 'discountPercentage': discountPercentage,
      if (discountStartDate != null)
        'discountStartDate': discountStartDate?.toJson(),
      if (discountEndDate != null) 'discountEndDate': discountEndDate?.toJson(),
      'currency': currency,
      if (sku != null) 'sku': sku,
      if (barcode != null) 'barcode': barcode,
      'quantity': quantity,
      'lowStockThreshold': lowStockThreshold,
      'trackInventory': trackInventory,
      if (weight != null) 'weight': weight,
      if (weightUnit != null) 'weightUnit': weightUnit,
      if (dimensions != null) 'dimensions': dimensions,
      if (color != null) 'color': color?.toJson(),
      if (size != null) 'size': size?.toJson(),
      if (material != null) 'material': material,
      if (brand != null) 'brand': brand,
      'status': status.toJson(),
      'isActive': isActive,
      'isFeatured': isFeatured,
      'condition': condition.toJson(),
      'images': images.toJson(),
      if (thumbnailUrl != null) 'thumbnailUrl': thumbnailUrl,
      if (videoUrl != null) 'videoUrl': videoUrl,
      if (videoThumbnailUrl != null) 'videoThumbnailUrl': videoThumbnailUrl,
      if (whatsappMediaIds != null)
        'whatsappMediaIds': whatsappMediaIds?.toJson(),
      if (telegramFileIds != null) 'telegramFileIds': telegramFileIds?.toJson(),
      'cdnUploadStatus': cdnUploadStatus,
      if (cdnUploadedAt != null) 'cdnUploadedAt': cdnUploadedAt?.toJson(),
      if (originalMediaUrls != null)
        'originalMediaUrls': originalMediaUrls?.toJson(),
      if (metaCatalogId != null) 'metaCatalogId': metaCatalogId,
      if (metaProductId != null) 'metaProductId': metaProductId,
      'metaSyncStatus': metaSyncStatus,
      if (metaSyncedAt != null) 'metaSyncedAt': metaSyncedAt?.toJson(),
      if (metaSyncError != null) 'metaSyncError': metaSyncError,
      'shippingRequired': shippingRequired,
      if (estimatedDeliveryDays != null)
        'estimatedDeliveryDays': estimatedDeliveryDays,
      'freeShipping': freeShipping,
      'shippingCost': shippingCost,
      'viewCount': viewCount,
      'orderCount': orderCount,
      'wishlistCount': wishlistCount,
      'averageRating': averageRating,
      'totalReviews': totalReviews,
      'conversionRate': conversionRate,
      if (searchKeywords != null) 'searchKeywords': searchKeywords?.toJson(),
      if (metaTitle != null) 'metaTitle': metaTitle,
      if (metaDescription != null) 'metaDescription': metaDescription,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      if (publishedAt != null) 'publishedAt': publishedAt?.toJson(),
      if (deletedAt != null) 'deletedAt': deletedAt?.toJson(),
    };
  }

  static ProductInclude include({_i4.VendorProfileInclude? vendor}) {
    return ProductInclude._(vendor: vendor);
  }

  static ProductIncludeList includeList({
    _i1.WhereExpressionBuilder<ProductTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProductTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProductTable>? orderByList,
    ProductInclude? include,
  }) {
    return ProductIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Product.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Product.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ProductImpl extends Product {
  _ProductImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue vendorId,
    _i4.VendorProfile? vendor,
    required String name,
    required String description,
    String? shortDescription,
    required String category,
    String? subCategory,
    List<String>? tags,
    String? facebookCategory,
    String? facebookCategoryId,
    String? googleCategory,
    String? googleCategoryId,
    bool? isAiGenerated,
    DateTime? aiGeneratedAt,
    double? aiConfidenceScore,
    bool? hasAiGeneratedImages,
    required double basePrice,
    double? discountPrice,
    double? discountPercentage,
    DateTime? discountStartDate,
    DateTime? discountEndDate,
    String? currency,
    String? sku,
    String? barcode,
    int? quantity,
    int? lowStockThreshold,
    bool? trackInventory,
    double? weight,
    String? weightUnit,
    String? dimensions,
    List<String>? color,
    List<String>? size,
    String? material,
    String? brand,
    _i2.ProductStatus? status,
    bool? isActive,
    bool? isFeatured,
    _i3.ProductCondition? condition,
    required List<String> images,
    String? thumbnailUrl,
    String? videoUrl,
    String? videoThumbnailUrl,
    List<String>? whatsappMediaIds,
    List<String>? telegramFileIds,
    String? cdnUploadStatus,
    DateTime? cdnUploadedAt,
    List<String>? originalMediaUrls,
    String? metaCatalogId,
    String? metaProductId,
    String? metaSyncStatus,
    DateTime? metaSyncedAt,
    String? metaSyncError,
    bool? shippingRequired,
    int? estimatedDeliveryDays,
    bool? freeShipping,
    double? shippingCost,
    int? viewCount,
    int? orderCount,
    int? wishlistCount,
    double? averageRating,
    int? totalReviews,
    double? conversionRate,
    List<String>? searchKeywords,
    String? metaTitle,
    String? metaDescription,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? publishedAt,
    DateTime? deletedAt,
  }) : super._(
         id: id,
         vendorId: vendorId,
         vendor: vendor,
         name: name,
         description: description,
         shortDescription: shortDescription,
         category: category,
         subCategory: subCategory,
         tags: tags,
         facebookCategory: facebookCategory,
         facebookCategoryId: facebookCategoryId,
         googleCategory: googleCategory,
         googleCategoryId: googleCategoryId,
         isAiGenerated: isAiGenerated,
         aiGeneratedAt: aiGeneratedAt,
         aiConfidenceScore: aiConfidenceScore,
         hasAiGeneratedImages: hasAiGeneratedImages,
         basePrice: basePrice,
         discountPrice: discountPrice,
         discountPercentage: discountPercentage,
         discountStartDate: discountStartDate,
         discountEndDate: discountEndDate,
         currency: currency,
         sku: sku,
         barcode: barcode,
         quantity: quantity,
         lowStockThreshold: lowStockThreshold,
         trackInventory: trackInventory,
         weight: weight,
         weightUnit: weightUnit,
         dimensions: dimensions,
         color: color,
         size: size,
         material: material,
         brand: brand,
         status: status,
         isActive: isActive,
         isFeatured: isFeatured,
         condition: condition,
         images: images,
         thumbnailUrl: thumbnailUrl,
         videoUrl: videoUrl,
         videoThumbnailUrl: videoThumbnailUrl,
         whatsappMediaIds: whatsappMediaIds,
         telegramFileIds: telegramFileIds,
         cdnUploadStatus: cdnUploadStatus,
         cdnUploadedAt: cdnUploadedAt,
         originalMediaUrls: originalMediaUrls,
         metaCatalogId: metaCatalogId,
         metaProductId: metaProductId,
         metaSyncStatus: metaSyncStatus,
         metaSyncedAt: metaSyncedAt,
         metaSyncError: metaSyncError,
         shippingRequired: shippingRequired,
         estimatedDeliveryDays: estimatedDeliveryDays,
         freeShipping: freeShipping,
         shippingCost: shippingCost,
         viewCount: viewCount,
         orderCount: orderCount,
         wishlistCount: wishlistCount,
         averageRating: averageRating,
         totalReviews: totalReviews,
         conversionRate: conversionRate,
         searchKeywords: searchKeywords,
         metaTitle: metaTitle,
         metaDescription: metaDescription,
         createdAt: createdAt,
         updatedAt: updatedAt,
         publishedAt: publishedAt,
         deletedAt: deletedAt,
       );

  /// Returns a shallow copy of this [Product]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Product copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? vendorId,
    Object? vendor = _Undefined,
    String? name,
    String? description,
    Object? shortDescription = _Undefined,
    String? category,
    Object? subCategory = _Undefined,
    Object? tags = _Undefined,
    Object? facebookCategory = _Undefined,
    Object? facebookCategoryId = _Undefined,
    Object? googleCategory = _Undefined,
    Object? googleCategoryId = _Undefined,
    bool? isAiGenerated,
    Object? aiGeneratedAt = _Undefined,
    Object? aiConfidenceScore = _Undefined,
    bool? hasAiGeneratedImages,
    double? basePrice,
    Object? discountPrice = _Undefined,
    Object? discountPercentage = _Undefined,
    Object? discountStartDate = _Undefined,
    Object? discountEndDate = _Undefined,
    String? currency,
    Object? sku = _Undefined,
    Object? barcode = _Undefined,
    int? quantity,
    int? lowStockThreshold,
    bool? trackInventory,
    Object? weight = _Undefined,
    Object? weightUnit = _Undefined,
    Object? dimensions = _Undefined,
    Object? color = _Undefined,
    Object? size = _Undefined,
    Object? material = _Undefined,
    Object? brand = _Undefined,
    _i2.ProductStatus? status,
    bool? isActive,
    bool? isFeatured,
    _i3.ProductCondition? condition,
    List<String>? images,
    Object? thumbnailUrl = _Undefined,
    Object? videoUrl = _Undefined,
    Object? videoThumbnailUrl = _Undefined,
    Object? whatsappMediaIds = _Undefined,
    Object? telegramFileIds = _Undefined,
    String? cdnUploadStatus,
    Object? cdnUploadedAt = _Undefined,
    Object? originalMediaUrls = _Undefined,
    Object? metaCatalogId = _Undefined,
    Object? metaProductId = _Undefined,
    String? metaSyncStatus,
    Object? metaSyncedAt = _Undefined,
    Object? metaSyncError = _Undefined,
    bool? shippingRequired,
    Object? estimatedDeliveryDays = _Undefined,
    bool? freeShipping,
    double? shippingCost,
    int? viewCount,
    int? orderCount,
    int? wishlistCount,
    double? averageRating,
    int? totalReviews,
    double? conversionRate,
    Object? searchKeywords = _Undefined,
    Object? metaTitle = _Undefined,
    Object? metaDescription = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
    Object? publishedAt = _Undefined,
    Object? deletedAt = _Undefined,
  }) {
    return Product(
      id: id ?? this.id,
      vendorId: vendorId ?? this.vendorId,
      vendor: vendor is _i4.VendorProfile? ? vendor : this.vendor?.copyWith(),
      name: name ?? this.name,
      description: description ?? this.description,
      shortDescription: shortDescription is String?
          ? shortDescription
          : this.shortDescription,
      category: category ?? this.category,
      subCategory: subCategory is String? ? subCategory : this.subCategory,
      tags: tags is List<String>? ? tags : this.tags?.map((e0) => e0).toList(),
      facebookCategory: facebookCategory is String?
          ? facebookCategory
          : this.facebookCategory,
      facebookCategoryId: facebookCategoryId is String?
          ? facebookCategoryId
          : this.facebookCategoryId,
      googleCategory: googleCategory is String?
          ? googleCategory
          : this.googleCategory,
      googleCategoryId: googleCategoryId is String?
          ? googleCategoryId
          : this.googleCategoryId,
      isAiGenerated: isAiGenerated ?? this.isAiGenerated,
      aiGeneratedAt: aiGeneratedAt is DateTime?
          ? aiGeneratedAt
          : this.aiGeneratedAt,
      aiConfidenceScore: aiConfidenceScore is double?
          ? aiConfidenceScore
          : this.aiConfidenceScore,
      hasAiGeneratedImages: hasAiGeneratedImages ?? this.hasAiGeneratedImages,
      basePrice: basePrice ?? this.basePrice,
      discountPrice: discountPrice is double?
          ? discountPrice
          : this.discountPrice,
      discountPercentage: discountPercentage is double?
          ? discountPercentage
          : this.discountPercentage,
      discountStartDate: discountStartDate is DateTime?
          ? discountStartDate
          : this.discountStartDate,
      discountEndDate: discountEndDate is DateTime?
          ? discountEndDate
          : this.discountEndDate,
      currency: currency ?? this.currency,
      sku: sku is String? ? sku : this.sku,
      barcode: barcode is String? ? barcode : this.barcode,
      quantity: quantity ?? this.quantity,
      lowStockThreshold: lowStockThreshold ?? this.lowStockThreshold,
      trackInventory: trackInventory ?? this.trackInventory,
      weight: weight is double? ? weight : this.weight,
      weightUnit: weightUnit is String? ? weightUnit : this.weightUnit,
      dimensions: dimensions is String? ? dimensions : this.dimensions,
      color: color is List<String>?
          ? color
          : this.color?.map((e0) => e0).toList(),
      size: size is List<String>? ? size : this.size?.map((e0) => e0).toList(),
      material: material is String? ? material : this.material,
      brand: brand is String? ? brand : this.brand,
      status: status ?? this.status,
      isActive: isActive ?? this.isActive,
      isFeatured: isFeatured ?? this.isFeatured,
      condition: condition ?? this.condition,
      images: images ?? this.images.map((e0) => e0).toList(),
      thumbnailUrl: thumbnailUrl is String? ? thumbnailUrl : this.thumbnailUrl,
      videoUrl: videoUrl is String? ? videoUrl : this.videoUrl,
      videoThumbnailUrl: videoThumbnailUrl is String?
          ? videoThumbnailUrl
          : this.videoThumbnailUrl,
      whatsappMediaIds: whatsappMediaIds is List<String>?
          ? whatsappMediaIds
          : this.whatsappMediaIds?.map((e0) => e0).toList(),
      telegramFileIds: telegramFileIds is List<String>?
          ? telegramFileIds
          : this.telegramFileIds?.map((e0) => e0).toList(),
      cdnUploadStatus: cdnUploadStatus ?? this.cdnUploadStatus,
      cdnUploadedAt: cdnUploadedAt is DateTime?
          ? cdnUploadedAt
          : this.cdnUploadedAt,
      originalMediaUrls: originalMediaUrls is List<String>?
          ? originalMediaUrls
          : this.originalMediaUrls?.map((e0) => e0).toList(),
      metaCatalogId: metaCatalogId is String?
          ? metaCatalogId
          : this.metaCatalogId,
      metaProductId: metaProductId is String?
          ? metaProductId
          : this.metaProductId,
      metaSyncStatus: metaSyncStatus ?? this.metaSyncStatus,
      metaSyncedAt: metaSyncedAt is DateTime?
          ? metaSyncedAt
          : this.metaSyncedAt,
      metaSyncError: metaSyncError is String?
          ? metaSyncError
          : this.metaSyncError,
      shippingRequired: shippingRequired ?? this.shippingRequired,
      estimatedDeliveryDays: estimatedDeliveryDays is int?
          ? estimatedDeliveryDays
          : this.estimatedDeliveryDays,
      freeShipping: freeShipping ?? this.freeShipping,
      shippingCost: shippingCost ?? this.shippingCost,
      viewCount: viewCount ?? this.viewCount,
      orderCount: orderCount ?? this.orderCount,
      wishlistCount: wishlistCount ?? this.wishlistCount,
      averageRating: averageRating ?? this.averageRating,
      totalReviews: totalReviews ?? this.totalReviews,
      conversionRate: conversionRate ?? this.conversionRate,
      searchKeywords: searchKeywords is List<String>?
          ? searchKeywords
          : this.searchKeywords?.map((e0) => e0).toList(),
      metaTitle: metaTitle is String? ? metaTitle : this.metaTitle,
      metaDescription: metaDescription is String?
          ? metaDescription
          : this.metaDescription,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      publishedAt: publishedAt is DateTime? ? publishedAt : this.publishedAt,
      deletedAt: deletedAt is DateTime? ? deletedAt : this.deletedAt,
    );
  }
}

class ProductUpdateTable extends _i1.UpdateTable<ProductTable> {
  ProductUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> vendorId(_i1.UuidValue value) =>
      _i1.ColumnValue(
        table.vendorId,
        value,
      );

  _i1.ColumnValue<String, String> name(String value) => _i1.ColumnValue(
    table.name,
    value,
  );

  _i1.ColumnValue<String, String> description(String value) => _i1.ColumnValue(
    table.description,
    value,
  );

  _i1.ColumnValue<String, String> shortDescription(String? value) =>
      _i1.ColumnValue(
        table.shortDescription,
        value,
      );

  _i1.ColumnValue<String, String> category(String value) => _i1.ColumnValue(
    table.category,
    value,
  );

  _i1.ColumnValue<String, String> subCategory(String? value) => _i1.ColumnValue(
    table.subCategory,
    value,
  );

  _i1.ColumnValue<List<String>, List<String>> tags(List<String>? value) =>
      _i1.ColumnValue(
        table.tags,
        value,
      );

  _i1.ColumnValue<String, String> facebookCategory(String? value) =>
      _i1.ColumnValue(
        table.facebookCategory,
        value,
      );

  _i1.ColumnValue<String, String> facebookCategoryId(String? value) =>
      _i1.ColumnValue(
        table.facebookCategoryId,
        value,
      );

  _i1.ColumnValue<String, String> googleCategory(String? value) =>
      _i1.ColumnValue(
        table.googleCategory,
        value,
      );

  _i1.ColumnValue<String, String> googleCategoryId(String? value) =>
      _i1.ColumnValue(
        table.googleCategoryId,
        value,
      );

  _i1.ColumnValue<bool, bool> isAiGenerated(bool value) => _i1.ColumnValue(
    table.isAiGenerated,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> aiGeneratedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.aiGeneratedAt,
        value,
      );

  _i1.ColumnValue<double, double> aiConfidenceScore(double? value) =>
      _i1.ColumnValue(
        table.aiConfidenceScore,
        value,
      );

  _i1.ColumnValue<bool, bool> hasAiGeneratedImages(bool value) =>
      _i1.ColumnValue(
        table.hasAiGeneratedImages,
        value,
      );

  _i1.ColumnValue<double, double> basePrice(double value) => _i1.ColumnValue(
    table.basePrice,
    value,
  );

  _i1.ColumnValue<double, double> discountPrice(double? value) =>
      _i1.ColumnValue(
        table.discountPrice,
        value,
      );

  _i1.ColumnValue<double, double> discountPercentage(double? value) =>
      _i1.ColumnValue(
        table.discountPercentage,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> discountStartDate(DateTime? value) =>
      _i1.ColumnValue(
        table.discountStartDate,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> discountEndDate(DateTime? value) =>
      _i1.ColumnValue(
        table.discountEndDate,
        value,
      );

  _i1.ColumnValue<String, String> currency(String value) => _i1.ColumnValue(
    table.currency,
    value,
  );

  _i1.ColumnValue<String, String> sku(String? value) => _i1.ColumnValue(
    table.sku,
    value,
  );

  _i1.ColumnValue<String, String> barcode(String? value) => _i1.ColumnValue(
    table.barcode,
    value,
  );

  _i1.ColumnValue<int, int> quantity(int value) => _i1.ColumnValue(
    table.quantity,
    value,
  );

  _i1.ColumnValue<int, int> lowStockThreshold(int value) => _i1.ColumnValue(
    table.lowStockThreshold,
    value,
  );

  _i1.ColumnValue<bool, bool> trackInventory(bool value) => _i1.ColumnValue(
    table.trackInventory,
    value,
  );

  _i1.ColumnValue<double, double> weight(double? value) => _i1.ColumnValue(
    table.weight,
    value,
  );

  _i1.ColumnValue<String, String> weightUnit(String? value) => _i1.ColumnValue(
    table.weightUnit,
    value,
  );

  _i1.ColumnValue<String, String> dimensions(String? value) => _i1.ColumnValue(
    table.dimensions,
    value,
  );

  _i1.ColumnValue<List<String>, List<String>> color(List<String>? value) =>
      _i1.ColumnValue(
        table.color,
        value,
      );

  _i1.ColumnValue<List<String>, List<String>> size(List<String>? value) =>
      _i1.ColumnValue(
        table.size,
        value,
      );

  _i1.ColumnValue<String, String> material(String? value) => _i1.ColumnValue(
    table.material,
    value,
  );

  _i1.ColumnValue<String, String> brand(String? value) => _i1.ColumnValue(
    table.brand,
    value,
  );

  _i1.ColumnValue<_i2.ProductStatus, _i2.ProductStatus> status(
    _i2.ProductStatus value,
  ) => _i1.ColumnValue(
    table.status,
    value,
  );

  _i1.ColumnValue<bool, bool> isActive(bool value) => _i1.ColumnValue(
    table.isActive,
    value,
  );

  _i1.ColumnValue<bool, bool> isFeatured(bool value) => _i1.ColumnValue(
    table.isFeatured,
    value,
  );

  _i1.ColumnValue<_i3.ProductCondition, _i3.ProductCondition> condition(
    _i3.ProductCondition value,
  ) => _i1.ColumnValue(
    table.condition,
    value,
  );

  _i1.ColumnValue<List<String>, List<String>> images(List<String> value) =>
      _i1.ColumnValue(
        table.images,
        value,
      );

  _i1.ColumnValue<String, String> thumbnailUrl(String? value) =>
      _i1.ColumnValue(
        table.thumbnailUrl,
        value,
      );

  _i1.ColumnValue<String, String> videoUrl(String? value) => _i1.ColumnValue(
    table.videoUrl,
    value,
  );

  _i1.ColumnValue<String, String> videoThumbnailUrl(String? value) =>
      _i1.ColumnValue(
        table.videoThumbnailUrl,
        value,
      );

  _i1.ColumnValue<List<String>, List<String>> whatsappMediaIds(
    List<String>? value,
  ) => _i1.ColumnValue(
    table.whatsappMediaIds,
    value,
  );

  _i1.ColumnValue<List<String>, List<String>> telegramFileIds(
    List<String>? value,
  ) => _i1.ColumnValue(
    table.telegramFileIds,
    value,
  );

  _i1.ColumnValue<String, String> cdnUploadStatus(String value) =>
      _i1.ColumnValue(
        table.cdnUploadStatus,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> cdnUploadedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.cdnUploadedAt,
        value,
      );

  _i1.ColumnValue<List<String>, List<String>> originalMediaUrls(
    List<String>? value,
  ) => _i1.ColumnValue(
    table.originalMediaUrls,
    value,
  );

  _i1.ColumnValue<String, String> metaCatalogId(String? value) =>
      _i1.ColumnValue(
        table.metaCatalogId,
        value,
      );

  _i1.ColumnValue<String, String> metaProductId(String? value) =>
      _i1.ColumnValue(
        table.metaProductId,
        value,
      );

  _i1.ColumnValue<String, String> metaSyncStatus(String value) =>
      _i1.ColumnValue(
        table.metaSyncStatus,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> metaSyncedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.metaSyncedAt,
        value,
      );

  _i1.ColumnValue<String, String> metaSyncError(String? value) =>
      _i1.ColumnValue(
        table.metaSyncError,
        value,
      );

  _i1.ColumnValue<bool, bool> shippingRequired(bool value) => _i1.ColumnValue(
    table.shippingRequired,
    value,
  );

  _i1.ColumnValue<int, int> estimatedDeliveryDays(int? value) =>
      _i1.ColumnValue(
        table.estimatedDeliveryDays,
        value,
      );

  _i1.ColumnValue<bool, bool> freeShipping(bool value) => _i1.ColumnValue(
    table.freeShipping,
    value,
  );

  _i1.ColumnValue<double, double> shippingCost(double value) => _i1.ColumnValue(
    table.shippingCost,
    value,
  );

  _i1.ColumnValue<int, int> viewCount(int value) => _i1.ColumnValue(
    table.viewCount,
    value,
  );

  _i1.ColumnValue<int, int> orderCount(int value) => _i1.ColumnValue(
    table.orderCount,
    value,
  );

  _i1.ColumnValue<int, int> wishlistCount(int value) => _i1.ColumnValue(
    table.wishlistCount,
    value,
  );

  _i1.ColumnValue<double, double> averageRating(double value) =>
      _i1.ColumnValue(
        table.averageRating,
        value,
      );

  _i1.ColumnValue<int, int> totalReviews(int value) => _i1.ColumnValue(
    table.totalReviews,
    value,
  );

  _i1.ColumnValue<double, double> conversionRate(double value) =>
      _i1.ColumnValue(
        table.conversionRate,
        value,
      );

  _i1.ColumnValue<List<String>, List<String>> searchKeywords(
    List<String>? value,
  ) => _i1.ColumnValue(
    table.searchKeywords,
    value,
  );

  _i1.ColumnValue<String, String> metaTitle(String? value) => _i1.ColumnValue(
    table.metaTitle,
    value,
  );

  _i1.ColumnValue<String, String> metaDescription(String? value) =>
      _i1.ColumnValue(
        table.metaDescription,
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

  _i1.ColumnValue<DateTime, DateTime> publishedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.publishedAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> deletedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.deletedAt,
        value,
      );
}

class ProductTable extends _i1.Table<_i1.UuidValue> {
  ProductTable({super.tableRelation}) : super(tableName: 'products') {
    updateTable = ProductUpdateTable(this);
    vendorId = _i1.ColumnUuid(
      'vendorId',
      this,
    );
    name = _i1.ColumnString(
      'name',
      this,
    );
    description = _i1.ColumnString(
      'description',
      this,
    );
    shortDescription = _i1.ColumnString(
      'shortDescription',
      this,
    );
    category = _i1.ColumnString(
      'category',
      this,
    );
    subCategory = _i1.ColumnString(
      'subCategory',
      this,
    );
    tags = _i1.ColumnSerializable<List<String>>(
      'tags',
      this,
    );
    facebookCategory = _i1.ColumnString(
      'facebookCategory',
      this,
    );
    facebookCategoryId = _i1.ColumnString(
      'facebookCategoryId',
      this,
    );
    googleCategory = _i1.ColumnString(
      'googleCategory',
      this,
    );
    googleCategoryId = _i1.ColumnString(
      'googleCategoryId',
      this,
    );
    isAiGenerated = _i1.ColumnBool(
      'isAiGenerated',
      this,
      hasDefault: true,
    );
    aiGeneratedAt = _i1.ColumnDateTime(
      'aiGeneratedAt',
      this,
    );
    aiConfidenceScore = _i1.ColumnDouble(
      'aiConfidenceScore',
      this,
    );
    hasAiGeneratedImages = _i1.ColumnBool(
      'hasAiGeneratedImages',
      this,
      hasDefault: true,
    );
    basePrice = _i1.ColumnDouble(
      'basePrice',
      this,
    );
    discountPrice = _i1.ColumnDouble(
      'discountPrice',
      this,
    );
    discountPercentage = _i1.ColumnDouble(
      'discountPercentage',
      this,
    );
    discountStartDate = _i1.ColumnDateTime(
      'discountStartDate',
      this,
    );
    discountEndDate = _i1.ColumnDateTime(
      'discountEndDate',
      this,
    );
    currency = _i1.ColumnString(
      'currency',
      this,
      hasDefault: true,
    );
    sku = _i1.ColumnString(
      'sku',
      this,
    );
    barcode = _i1.ColumnString(
      'barcode',
      this,
    );
    quantity = _i1.ColumnInt(
      'quantity',
      this,
      hasDefault: true,
    );
    lowStockThreshold = _i1.ColumnInt(
      'lowStockThreshold',
      this,
      hasDefault: true,
    );
    trackInventory = _i1.ColumnBool(
      'trackInventory',
      this,
      hasDefault: true,
    );
    weight = _i1.ColumnDouble(
      'weight',
      this,
    );
    weightUnit = _i1.ColumnString(
      'weightUnit',
      this,
    );
    dimensions = _i1.ColumnString(
      'dimensions',
      this,
    );
    color = _i1.ColumnSerializable<List<String>>(
      'color',
      this,
    );
    size = _i1.ColumnSerializable<List<String>>(
      'size',
      this,
    );
    material = _i1.ColumnString(
      'material',
      this,
    );
    brand = _i1.ColumnString(
      'brand',
      this,
    );
    status = _i1.ColumnEnum(
      'status',
      this,
      _i1.EnumSerialization.byName,
      hasDefault: true,
    );
    isActive = _i1.ColumnBool(
      'isActive',
      this,
      hasDefault: true,
    );
    isFeatured = _i1.ColumnBool(
      'isFeatured',
      this,
      hasDefault: true,
    );
    condition = _i1.ColumnEnum(
      'condition',
      this,
      _i1.EnumSerialization.byName,
      hasDefault: true,
    );
    images = _i1.ColumnSerializable<List<String>>(
      'images',
      this,
    );
    thumbnailUrl = _i1.ColumnString(
      'thumbnailUrl',
      this,
    );
    videoUrl = _i1.ColumnString(
      'videoUrl',
      this,
    );
    videoThumbnailUrl = _i1.ColumnString(
      'videoThumbnailUrl',
      this,
    );
    whatsappMediaIds = _i1.ColumnSerializable<List<String>>(
      'whatsappMediaIds',
      this,
    );
    telegramFileIds = _i1.ColumnSerializable<List<String>>(
      'telegramFileIds',
      this,
    );
    cdnUploadStatus = _i1.ColumnString(
      'cdnUploadStatus',
      this,
      hasDefault: true,
    );
    cdnUploadedAt = _i1.ColumnDateTime(
      'cdnUploadedAt',
      this,
    );
    originalMediaUrls = _i1.ColumnSerializable<List<String>>(
      'originalMediaUrls',
      this,
    );
    metaCatalogId = _i1.ColumnString(
      'metaCatalogId',
      this,
    );
    metaProductId = _i1.ColumnString(
      'metaProductId',
      this,
    );
    metaSyncStatus = _i1.ColumnString(
      'metaSyncStatus',
      this,
      hasDefault: true,
    );
    metaSyncedAt = _i1.ColumnDateTime(
      'metaSyncedAt',
      this,
    );
    metaSyncError = _i1.ColumnString(
      'metaSyncError',
      this,
    );
    shippingRequired = _i1.ColumnBool(
      'shippingRequired',
      this,
      hasDefault: true,
    );
    estimatedDeliveryDays = _i1.ColumnInt(
      'estimatedDeliveryDays',
      this,
    );
    freeShipping = _i1.ColumnBool(
      'freeShipping',
      this,
      hasDefault: true,
    );
    shippingCost = _i1.ColumnDouble(
      'shippingCost',
      this,
      hasDefault: true,
    );
    viewCount = _i1.ColumnInt(
      'viewCount',
      this,
      hasDefault: true,
    );
    orderCount = _i1.ColumnInt(
      'orderCount',
      this,
      hasDefault: true,
    );
    wishlistCount = _i1.ColumnInt(
      'wishlistCount',
      this,
      hasDefault: true,
    );
    averageRating = _i1.ColumnDouble(
      'averageRating',
      this,
      hasDefault: true,
    );
    totalReviews = _i1.ColumnInt(
      'totalReviews',
      this,
      hasDefault: true,
    );
    conversionRate = _i1.ColumnDouble(
      'conversionRate',
      this,
      hasDefault: true,
    );
    searchKeywords = _i1.ColumnSerializable<List<String>>(
      'searchKeywords',
      this,
    );
    metaTitle = _i1.ColumnString(
      'metaTitle',
      this,
    );
    metaDescription = _i1.ColumnString(
      'metaDescription',
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
    publishedAt = _i1.ColumnDateTime(
      'publishedAt',
      this,
    );
    deletedAt = _i1.ColumnDateTime(
      'deletedAt',
      this,
    );
  }

  late final ProductUpdateTable updateTable;

  late final _i1.ColumnUuid vendorId;

  _i4.VendorProfileTable? _vendor;

  late final _i1.ColumnString name;

  late final _i1.ColumnString description;

  late final _i1.ColumnString shortDescription;

  late final _i1.ColumnString category;

  late final _i1.ColumnString subCategory;

  late final _i1.ColumnSerializable<List<String>> tags;

  late final _i1.ColumnString facebookCategory;

  late final _i1.ColumnString facebookCategoryId;

  late final _i1.ColumnString googleCategory;

  late final _i1.ColumnString googleCategoryId;

  late final _i1.ColumnBool isAiGenerated;

  late final _i1.ColumnDateTime aiGeneratedAt;

  late final _i1.ColumnDouble aiConfidenceScore;

  late final _i1.ColumnBool hasAiGeneratedImages;

  late final _i1.ColumnDouble basePrice;

  late final _i1.ColumnDouble discountPrice;

  late final _i1.ColumnDouble discountPercentage;

  late final _i1.ColumnDateTime discountStartDate;

  late final _i1.ColumnDateTime discountEndDate;

  late final _i1.ColumnString currency;

  late final _i1.ColumnString sku;

  late final _i1.ColumnString barcode;

  late final _i1.ColumnInt quantity;

  late final _i1.ColumnInt lowStockThreshold;

  late final _i1.ColumnBool trackInventory;

  late final _i1.ColumnDouble weight;

  late final _i1.ColumnString weightUnit;

  late final _i1.ColumnString dimensions;

  late final _i1.ColumnSerializable<List<String>> color;

  late final _i1.ColumnSerializable<List<String>> size;

  late final _i1.ColumnString material;

  late final _i1.ColumnString brand;

  late final _i1.ColumnEnum<_i2.ProductStatus> status;

  late final _i1.ColumnBool isActive;

  late final _i1.ColumnBool isFeatured;

  late final _i1.ColumnEnum<_i3.ProductCondition> condition;

  late final _i1.ColumnSerializable<List<String>> images;

  late final _i1.ColumnString thumbnailUrl;

  late final _i1.ColumnString videoUrl;

  late final _i1.ColumnString videoThumbnailUrl;

  late final _i1.ColumnSerializable<List<String>> whatsappMediaIds;

  late final _i1.ColumnSerializable<List<String>> telegramFileIds;

  late final _i1.ColumnString cdnUploadStatus;

  late final _i1.ColumnDateTime cdnUploadedAt;

  late final _i1.ColumnSerializable<List<String>> originalMediaUrls;

  late final _i1.ColumnString metaCatalogId;

  late final _i1.ColumnString metaProductId;

  late final _i1.ColumnString metaSyncStatus;

  late final _i1.ColumnDateTime metaSyncedAt;

  late final _i1.ColumnString metaSyncError;

  late final _i1.ColumnBool shippingRequired;

  late final _i1.ColumnInt estimatedDeliveryDays;

  late final _i1.ColumnBool freeShipping;

  late final _i1.ColumnDouble shippingCost;

  late final _i1.ColumnInt viewCount;

  late final _i1.ColumnInt orderCount;

  late final _i1.ColumnInt wishlistCount;

  late final _i1.ColumnDouble averageRating;

  late final _i1.ColumnInt totalReviews;

  late final _i1.ColumnDouble conversionRate;

  late final _i1.ColumnSerializable<List<String>> searchKeywords;

  late final _i1.ColumnString metaTitle;

  late final _i1.ColumnString metaDescription;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  late final _i1.ColumnDateTime publishedAt;

  late final _i1.ColumnDateTime deletedAt;

  _i4.VendorProfileTable get vendor {
    if (_vendor != null) return _vendor!;
    _vendor = _i1.createRelationTable(
      relationFieldName: 'vendor',
      field: Product.t.vendorId,
      foreignField: _i4.VendorProfile.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.VendorProfileTable(tableRelation: foreignTableRelation),
    );
    return _vendor!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    vendorId,
    name,
    description,
    shortDescription,
    category,
    subCategory,
    tags,
    facebookCategory,
    facebookCategoryId,
    googleCategory,
    googleCategoryId,
    isAiGenerated,
    aiGeneratedAt,
    aiConfidenceScore,
    hasAiGeneratedImages,
    basePrice,
    discountPrice,
    discountPercentage,
    discountStartDate,
    discountEndDate,
    currency,
    sku,
    barcode,
    quantity,
    lowStockThreshold,
    trackInventory,
    weight,
    weightUnit,
    dimensions,
    color,
    size,
    material,
    brand,
    status,
    isActive,
    isFeatured,
    condition,
    images,
    thumbnailUrl,
    videoUrl,
    videoThumbnailUrl,
    whatsappMediaIds,
    telegramFileIds,
    cdnUploadStatus,
    cdnUploadedAt,
    originalMediaUrls,
    metaCatalogId,
    metaProductId,
    metaSyncStatus,
    metaSyncedAt,
    metaSyncError,
    shippingRequired,
    estimatedDeliveryDays,
    freeShipping,
    shippingCost,
    viewCount,
    orderCount,
    wishlistCount,
    averageRating,
    totalReviews,
    conversionRate,
    searchKeywords,
    metaTitle,
    metaDescription,
    createdAt,
    updatedAt,
    publishedAt,
    deletedAt,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'vendor') {
      return vendor;
    }
    return null;
  }
}

class ProductInclude extends _i1.IncludeObject {
  ProductInclude._({_i4.VendorProfileInclude? vendor}) {
    _vendor = vendor;
  }

  _i4.VendorProfileInclude? _vendor;

  @override
  Map<String, _i1.Include?> get includes => {'vendor': _vendor};

  @override
  _i1.Table<_i1.UuidValue> get table => Product.t;
}

class ProductIncludeList extends _i1.IncludeList {
  ProductIncludeList._({
    _i1.WhereExpressionBuilder<ProductTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Product.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue> get table => Product.t;
}

class ProductRepository {
  const ProductRepository._();

  final attachRow = const ProductAttachRowRepository._();

  /// Returns a list of [Product]s matching the given query parameters.
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
  Future<List<Product>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProductTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProductTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProductTable>? orderByList,
    _i1.Transaction? transaction,
    ProductInclude? include,
  }) async {
    return session.db.find<Product>(
      where: where?.call(Product.t),
      orderBy: orderBy?.call(Product.t),
      orderByList: orderByList?.call(Product.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Product] matching the given query parameters.
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
  Future<Product?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProductTable>? where,
    int? offset,
    _i1.OrderByBuilder<ProductTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProductTable>? orderByList,
    _i1.Transaction? transaction,
    ProductInclude? include,
  }) async {
    return session.db.findFirstRow<Product>(
      where: where?.call(Product.t),
      orderBy: orderBy?.call(Product.t),
      orderByList: orderByList?.call(Product.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Product] by its [id] or null if no such row exists.
  Future<Product?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
    ProductInclude? include,
  }) async {
    return session.db.findById<Product>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Product]s in the list and returns the inserted rows.
  ///
  /// The returned [Product]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Product>> insert(
    _i1.Session session,
    List<Product> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Product>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Product] and returns the inserted row.
  ///
  /// The returned [Product] will have its `id` field set.
  Future<Product> insertRow(
    _i1.Session session,
    Product row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Product>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Product]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Product>> update(
    _i1.Session session,
    List<Product> rows, {
    _i1.ColumnSelections<ProductTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Product>(
      rows,
      columns: columns?.call(Product.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Product]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Product> updateRow(
    _i1.Session session,
    Product row, {
    _i1.ColumnSelections<ProductTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Product>(
      row,
      columns: columns?.call(Product.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Product] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Product?> updateById(
    _i1.Session session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<ProductUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Product>(
      id,
      columnValues: columnValues(Product.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Product]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Product>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<ProductUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<ProductTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProductTable>? orderBy,
    _i1.OrderByListBuilder<ProductTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Product>(
      columnValues: columnValues(Product.t.updateTable),
      where: where(Product.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Product.t),
      orderByList: orderByList?.call(Product.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Product]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Product>> delete(
    _i1.Session session,
    List<Product> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Product>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Product].
  Future<Product> deleteRow(
    _i1.Session session,
    Product row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Product>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Product>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ProductTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Product>(
      where: where(Product.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProductTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Product>(
      where: where?.call(Product.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class ProductAttachRowRepository {
  const ProductAttachRowRepository._();

  /// Creates a relation between the given [Product] and [VendorProfile]
  /// by setting the [Product]'s foreign key `vendorId` to refer to the [VendorProfile].
  Future<void> vendor(
    _i1.Session session,
    Product product,
    _i4.VendorProfile vendor, {
    _i1.Transaction? transaction,
  }) async {
    if (product.id == null) {
      throw ArgumentError.notNull('product.id');
    }
    if (vendor.id == null) {
      throw ArgumentError.notNull('vendor.id');
    }

    var $product = product.copyWith(vendorId: vendor.id);
    await session.db.updateRow<Product>(
      $product,
      columns: [Product.t.vendorId],
      transaction: transaction,
    );
  }
}
