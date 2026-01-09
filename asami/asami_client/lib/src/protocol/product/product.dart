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
import '../product/product_status.dart' as _i2;
import '../product/product_condition.dart' as _i3;
import '../user/vendor_profile.dart' as _i4;
import 'package:asami_client/src/protocol/protocol.dart' as _i5;

abstract class Product implements _i1.SerializableModel {
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
    _i2.ProductStatus? status,
    bool? isActive,
    bool? isFeatured,
    _i3.ProductCondition? condition,
    this.weight,
    String? weightUnit,
    this.dimensions,
    this.color,
    this.size,
    this.material,
    this.brand,
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
    this.metaRetailerId,
    String? metaSyncStatus,
    this.metaSyncedAt,
    this.metaSyncError,
    int? metaSyncAttempts,
    this.productUrl,
    bool? isAiGenerated,
    this.aiGeneratedAt,
    this.aiConfidenceScore,
    bool? hasAiGeneratedImages,
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
       currency = currency ?? 'NGN',
       quantity = quantity ?? 1,
       lowStockThreshold = lowStockThreshold ?? 5,
       trackInventory = trackInventory ?? true,
       status = status ?? _i2.ProductStatus.draft,
       isActive = isActive ?? true,
       isFeatured = isFeatured ?? false,
       condition = condition ?? _i3.ProductCondition.newItem,
       weightUnit = weightUnit ?? 'kg',
       cdnUploadStatus = cdnUploadStatus ?? 'pending',
       metaSyncStatus = metaSyncStatus ?? 'pending',
       metaSyncAttempts = metaSyncAttempts ?? 0,
       isAiGenerated = isAiGenerated ?? false,
       hasAiGeneratedImages = hasAiGeneratedImages ?? false,
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
    _i2.ProductStatus? status,
    bool? isActive,
    bool? isFeatured,
    _i3.ProductCondition? condition,
    double? weight,
    String? weightUnit,
    String? dimensions,
    List<String>? color,
    List<String>? size,
    String? material,
    String? brand,
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
    String? metaRetailerId,
    String? metaSyncStatus,
    DateTime? metaSyncedAt,
    String? metaSyncError,
    int? metaSyncAttempts,
    String? productUrl,
    bool? isAiGenerated,
    DateTime? aiGeneratedAt,
    double? aiConfidenceScore,
    bool? hasAiGeneratedImages,
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
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
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
      currency: jsonSerialization['currency'] as String?,
      sku: jsonSerialization['sku'] as String?,
      barcode: jsonSerialization['barcode'] as String?,
      quantity: jsonSerialization['quantity'] as int?,
      lowStockThreshold: jsonSerialization['lowStockThreshold'] as int?,
      trackInventory: jsonSerialization['trackInventory'] as bool?,
      status: jsonSerialization['status'] == null
          ? null
          : _i2.ProductStatus.fromJson((jsonSerialization['status'] as String)),
      isActive: jsonSerialization['isActive'] as bool?,
      isFeatured: jsonSerialization['isFeatured'] as bool?,
      condition: jsonSerialization['condition'] == null
          ? null
          : _i3.ProductCondition.fromJson(
              (jsonSerialization['condition'] as String),
            ),
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
      cdnUploadStatus: jsonSerialization['cdnUploadStatus'] as String?,
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
      metaRetailerId: jsonSerialization['metaRetailerId'] as String?,
      metaSyncStatus: jsonSerialization['metaSyncStatus'] as String?,
      metaSyncedAt: jsonSerialization['metaSyncedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['metaSyncedAt'],
            ),
      metaSyncError: jsonSerialization['metaSyncError'] as String?,
      metaSyncAttempts: jsonSerialization['metaSyncAttempts'] as int?,
      productUrl: jsonSerialization['productUrl'] as String?,
      isAiGenerated: jsonSerialization['isAiGenerated'] as bool?,
      aiGeneratedAt: jsonSerialization['aiGeneratedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['aiGeneratedAt'],
            ),
      aiConfidenceScore: (jsonSerialization['aiConfidenceScore'] as num?)
          ?.toDouble(),
      hasAiGeneratedImages: jsonSerialization['hasAiGeneratedImages'] as bool?,
      shippingRequired: jsonSerialization['shippingRequired'] as bool?,
      estimatedDeliveryDays: jsonSerialization['estimatedDeliveryDays'] as int?,
      freeShipping: jsonSerialization['freeShipping'] as bool?,
      shippingCost: (jsonSerialization['shippingCost'] as num?)?.toDouble(),
      viewCount: jsonSerialization['viewCount'] as int?,
      orderCount: jsonSerialization['orderCount'] as int?,
      wishlistCount: jsonSerialization['wishlistCount'] as int?,
      averageRating: (jsonSerialization['averageRating'] as num?)?.toDouble(),
      totalReviews: jsonSerialization['totalReviews'] as int?,
      conversionRate: (jsonSerialization['conversionRate'] as num?)?.toDouble(),
      searchKeywords: jsonSerialization['searchKeywords'] == null
          ? null
          : _i5.Protocol().deserialize<List<String>>(
              jsonSerialization['searchKeywords'],
            ),
      metaTitle: jsonSerialization['metaTitle'] as String?,
      metaDescription: jsonSerialization['metaDescription'] as String?,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
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

  /// The id of the object.
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

  _i2.ProductStatus status;

  bool isActive;

  bool isFeatured;

  _i3.ProductCondition condition;

  double? weight;

  String? weightUnit;

  String? dimensions;

  List<String>? color;

  List<String>? size;

  String? material;

  String? brand;

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

  String? metaRetailerId;

  String metaSyncStatus;

  DateTime? metaSyncedAt;

  String? metaSyncError;

  int metaSyncAttempts;

  String? productUrl;

  bool isAiGenerated;

  DateTime? aiGeneratedAt;

  double? aiConfidenceScore;

  bool hasAiGeneratedImages;

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
    _i2.ProductStatus? status,
    bool? isActive,
    bool? isFeatured,
    _i3.ProductCondition? condition,
    double? weight,
    String? weightUnit,
    String? dimensions,
    List<String>? color,
    List<String>? size,
    String? material,
    String? brand,
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
    String? metaRetailerId,
    String? metaSyncStatus,
    DateTime? metaSyncedAt,
    String? metaSyncError,
    int? metaSyncAttempts,
    String? productUrl,
    bool? isAiGenerated,
    DateTime? aiGeneratedAt,
    double? aiConfidenceScore,
    bool? hasAiGeneratedImages,
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
      'status': status.toJson(),
      'isActive': isActive,
      'isFeatured': isFeatured,
      'condition': condition.toJson(),
      if (weight != null) 'weight': weight,
      if (weightUnit != null) 'weightUnit': weightUnit,
      if (dimensions != null) 'dimensions': dimensions,
      if (color != null) 'color': color?.toJson(),
      if (size != null) 'size': size?.toJson(),
      if (material != null) 'material': material,
      if (brand != null) 'brand': brand,
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
      if (metaRetailerId != null) 'metaRetailerId': metaRetailerId,
      'metaSyncStatus': metaSyncStatus,
      if (metaSyncedAt != null) 'metaSyncedAt': metaSyncedAt?.toJson(),
      if (metaSyncError != null) 'metaSyncError': metaSyncError,
      'metaSyncAttempts': metaSyncAttempts,
      if (productUrl != null) 'productUrl': productUrl,
      'isAiGenerated': isAiGenerated,
      if (aiGeneratedAt != null) 'aiGeneratedAt': aiGeneratedAt?.toJson(),
      if (aiConfidenceScore != null) 'aiConfidenceScore': aiConfidenceScore,
      'hasAiGeneratedImages': hasAiGeneratedImages,
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
    _i2.ProductStatus? status,
    bool? isActive,
    bool? isFeatured,
    _i3.ProductCondition? condition,
    double? weight,
    String? weightUnit,
    String? dimensions,
    List<String>? color,
    List<String>? size,
    String? material,
    String? brand,
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
    String? metaRetailerId,
    String? metaSyncStatus,
    DateTime? metaSyncedAt,
    String? metaSyncError,
    int? metaSyncAttempts,
    String? productUrl,
    bool? isAiGenerated,
    DateTime? aiGeneratedAt,
    double? aiConfidenceScore,
    bool? hasAiGeneratedImages,
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
         status: status,
         isActive: isActive,
         isFeatured: isFeatured,
         condition: condition,
         weight: weight,
         weightUnit: weightUnit,
         dimensions: dimensions,
         color: color,
         size: size,
         material: material,
         brand: brand,
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
         metaRetailerId: metaRetailerId,
         metaSyncStatus: metaSyncStatus,
         metaSyncedAt: metaSyncedAt,
         metaSyncError: metaSyncError,
         metaSyncAttempts: metaSyncAttempts,
         productUrl: productUrl,
         isAiGenerated: isAiGenerated,
         aiGeneratedAt: aiGeneratedAt,
         aiConfidenceScore: aiConfidenceScore,
         hasAiGeneratedImages: hasAiGeneratedImages,
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
    _i2.ProductStatus? status,
    bool? isActive,
    bool? isFeatured,
    _i3.ProductCondition? condition,
    Object? weight = _Undefined,
    Object? weightUnit = _Undefined,
    Object? dimensions = _Undefined,
    Object? color = _Undefined,
    Object? size = _Undefined,
    Object? material = _Undefined,
    Object? brand = _Undefined,
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
    Object? metaRetailerId = _Undefined,
    String? metaSyncStatus,
    Object? metaSyncedAt = _Undefined,
    Object? metaSyncError = _Undefined,
    int? metaSyncAttempts,
    Object? productUrl = _Undefined,
    bool? isAiGenerated,
    Object? aiGeneratedAt = _Undefined,
    Object? aiConfidenceScore = _Undefined,
    bool? hasAiGeneratedImages,
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
      status: status ?? this.status,
      isActive: isActive ?? this.isActive,
      isFeatured: isFeatured ?? this.isFeatured,
      condition: condition ?? this.condition,
      weight: weight is double? ? weight : this.weight,
      weightUnit: weightUnit is String? ? weightUnit : this.weightUnit,
      dimensions: dimensions is String? ? dimensions : this.dimensions,
      color: color is List<String>?
          ? color
          : this.color?.map((e0) => e0).toList(),
      size: size is List<String>? ? size : this.size?.map((e0) => e0).toList(),
      material: material is String? ? material : this.material,
      brand: brand is String? ? brand : this.brand,
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
      metaRetailerId: metaRetailerId is String?
          ? metaRetailerId
          : this.metaRetailerId,
      metaSyncStatus: metaSyncStatus ?? this.metaSyncStatus,
      metaSyncedAt: metaSyncedAt is DateTime?
          ? metaSyncedAt
          : this.metaSyncedAt,
      metaSyncError: metaSyncError is String?
          ? metaSyncError
          : this.metaSyncError,
      metaSyncAttempts: metaSyncAttempts ?? this.metaSyncAttempts,
      productUrl: productUrl is String? ? productUrl : this.productUrl,
      isAiGenerated: isAiGenerated ?? this.isAiGenerated,
      aiGeneratedAt: aiGeneratedAt is DateTime?
          ? aiGeneratedAt
          : this.aiGeneratedAt,
      aiConfidenceScore: aiConfidenceScore is double?
          ? aiConfidenceScore
          : this.aiConfidenceScore,
      hasAiGeneratedImages: hasAiGeneratedImages ?? this.hasAiGeneratedImages,
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
