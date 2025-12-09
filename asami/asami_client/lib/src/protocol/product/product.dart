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
import '../product/product_status.dart' as _i2;
import '../product/product_condition.dart' as _i3;
import '../user/vendor_profile.dart' as _i4;

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
    bool? isAiGenerated,
    this.aiGeneratedAt,
    this.aiConfidenceScore,
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
  })  : id = id ?? _i1.Uuid().v4obj(),
        isAiGenerated = isAiGenerated ?? false,
        currency = currency ?? 'NGN',
        quantity = quantity ?? 0,
        lowStockThreshold = lowStockThreshold ?? 5,
        trackInventory = trackInventory ?? true,
        status = status ?? _i2.ProductStatus.draft,
        isActive = isActive ?? true,
        isFeatured = isFeatured ?? false,
        condition = condition ?? _i3.ProductCondition.newItem,
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
    bool? isAiGenerated,
    DateTime? aiGeneratedAt,
    double? aiConfidenceScore,
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
      vendorId:
          _i1.UuidValueJsonExtension.fromJson(jsonSerialization['vendorId']),
      vendor: jsonSerialization['vendor'] == null
          ? null
          : _i4.VendorProfile.fromJson(
              (jsonSerialization['vendor'] as Map<String, dynamic>)),
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String,
      shortDescription: jsonSerialization['shortDescription'] as String?,
      category: jsonSerialization['category'] as String,
      subCategory: jsonSerialization['subCategory'] as String?,
      tags: (jsonSerialization['tags'] as List?)
          ?.map((e) => e as String)
          .toList(),
      isAiGenerated: jsonSerialization['isAiGenerated'] as bool,
      aiGeneratedAt: jsonSerialization['aiGeneratedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['aiGeneratedAt']),
      aiConfidenceScore:
          (jsonSerialization['aiConfidenceScore'] as num?)?.toDouble(),
      basePrice: (jsonSerialization['basePrice'] as num).toDouble(),
      discountPrice: (jsonSerialization['discountPrice'] as num?)?.toDouble(),
      discountPercentage:
          (jsonSerialization['discountPercentage'] as num?)?.toDouble(),
      discountStartDate: jsonSerialization['discountStartDate'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['discountStartDate']),
      discountEndDate: jsonSerialization['discountEndDate'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['discountEndDate']),
      currency: jsonSerialization['currency'] as String,
      sku: jsonSerialization['sku'] as String?,
      barcode: jsonSerialization['barcode'] as String?,
      quantity: jsonSerialization['quantity'] as int,
      lowStockThreshold: jsonSerialization['lowStockThreshold'] as int,
      trackInventory: jsonSerialization['trackInventory'] as bool,
      weight: (jsonSerialization['weight'] as num?)?.toDouble(),
      weightUnit: jsonSerialization['weightUnit'] as String?,
      dimensions: jsonSerialization['dimensions'] as String?,
      color: (jsonSerialization['color'] as List?)
          ?.map((e) => e as String)
          .toList(),
      size: (jsonSerialization['size'] as List?)
          ?.map((e) => e as String)
          .toList(),
      material: jsonSerialization['material'] as String?,
      brand: jsonSerialization['brand'] as String?,
      status: _i2.ProductStatus.fromJson((jsonSerialization['status'] as int)),
      isActive: jsonSerialization['isActive'] as bool,
      isFeatured: jsonSerialization['isFeatured'] as bool,
      condition: _i3.ProductCondition.fromJson(
          (jsonSerialization['condition'] as int)),
      images: (jsonSerialization['images'] as List)
          .map((e) => e as String)
          .toList(),
      thumbnailUrl: jsonSerialization['thumbnailUrl'] as String?,
      videoUrl: jsonSerialization['videoUrl'] as String?,
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
      searchKeywords: (jsonSerialization['searchKeywords'] as List?)
          ?.map((e) => e as String)
          .toList(),
      metaTitle: jsonSerialization['metaTitle'] as String?,
      metaDescription: jsonSerialization['metaDescription'] as String?,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
      publishedAt: jsonSerialization['publishedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['publishedAt']),
      deletedAt: jsonSerialization['deletedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['deletedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _i1.UuidValue id;

  _i1.UuidValue vendorId;

  _i4.VendorProfile? vendor;

  String name;

  String description;

  String? shortDescription;

  String category;

  String? subCategory;

  List<String>? tags;

  bool isAiGenerated;

  DateTime? aiGeneratedAt;

  double? aiConfidenceScore;

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
    bool? isAiGenerated,
    DateTime? aiGeneratedAt,
    double? aiConfidenceScore,
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
      'id': id.toJson(),
      'vendorId': vendorId.toJson(),
      if (vendor != null) 'vendor': vendor?.toJson(),
      'name': name,
      'description': description,
      if (shortDescription != null) 'shortDescription': shortDescription,
      'category': category,
      if (subCategory != null) 'subCategory': subCategory,
      if (tags != null) 'tags': tags?.toJson(),
      'isAiGenerated': isAiGenerated,
      if (aiGeneratedAt != null) 'aiGeneratedAt': aiGeneratedAt?.toJson(),
      if (aiConfidenceScore != null) 'aiConfidenceScore': aiConfidenceScore,
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
    bool? isAiGenerated,
    DateTime? aiGeneratedAt,
    double? aiConfidenceScore,
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
          isAiGenerated: isAiGenerated,
          aiGeneratedAt: aiGeneratedAt,
          aiConfidenceScore: aiConfidenceScore,
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
    bool? isAiGenerated,
    Object? aiGeneratedAt = _Undefined,
    Object? aiConfidenceScore = _Undefined,
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
      isAiGenerated: isAiGenerated ?? this.isAiGenerated,
      aiGeneratedAt:
          aiGeneratedAt is DateTime? ? aiGeneratedAt : this.aiGeneratedAt,
      aiConfidenceScore: aiConfidenceScore is double?
          ? aiConfidenceScore
          : this.aiConfidenceScore,
      basePrice: basePrice ?? this.basePrice,
      discountPrice:
          discountPrice is double? ? discountPrice : this.discountPrice,
      discountPercentage: discountPercentage is double?
          ? discountPercentage
          : this.discountPercentage,
      discountStartDate: discountStartDate is DateTime?
          ? discountStartDate
          : this.discountStartDate,
      discountEndDate:
          discountEndDate is DateTime? ? discountEndDate : this.discountEndDate,
      currency: currency ?? this.currency,
      sku: sku is String? ? sku : this.sku,
      barcode: barcode is String? ? barcode : this.barcode,
      quantity: quantity ?? this.quantity,
      lowStockThreshold: lowStockThreshold ?? this.lowStockThreshold,
      trackInventory: trackInventory ?? this.trackInventory,
      weight: weight is double? ? weight : this.weight,
      weightUnit: weightUnit is String? ? weightUnit : this.weightUnit,
      dimensions: dimensions is String? ? dimensions : this.dimensions,
      color:
          color is List<String>? ? color : this.color?.map((e0) => e0).toList(),
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
      metaDescription:
          metaDescription is String? ? metaDescription : this.metaDescription,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      publishedAt: publishedAt is DateTime? ? publishedAt : this.publishedAt,
      deletedAt: deletedAt is DateTime? ? deletedAt : this.deletedAt,
    );
  }
}
