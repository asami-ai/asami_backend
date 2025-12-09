/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: unnecessary_null_comparison

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../product/product_status.dart' as _i2;
import '../product/product_condition.dart' as _i3;
import '../user/vendor_profile.dart' as _i4;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'id': id.toJson(),
      'vendorId': vendorId.toJson(),
      if (vendor != null) 'vendor': vendor?.toJsonForProtocol(),
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

class ProductTable extends _i1.Table<_i1.UuidValue> {
  ProductTable({super.tableRelation}) : super(tableName: 'products') {
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
    tags = _i1.ColumnSerializable(
      'tags',
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
    color = _i1.ColumnSerializable(
      'color',
      this,
    );
    size = _i1.ColumnSerializable(
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
      _i1.EnumSerialization.byIndex,
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
      _i1.EnumSerialization.byIndex,
      hasDefault: true,
    );
    images = _i1.ColumnSerializable(
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
    searchKeywords = _i1.ColumnSerializable(
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

  late final _i1.ColumnUuid vendorId;

  _i4.VendorProfileTable? _vendor;

  late final _i1.ColumnString name;

  late final _i1.ColumnString description;

  late final _i1.ColumnString shortDescription;

  late final _i1.ColumnString category;

  late final _i1.ColumnString subCategory;

  late final _i1.ColumnSerializable tags;

  late final _i1.ColumnBool isAiGenerated;

  late final _i1.ColumnDateTime aiGeneratedAt;

  late final _i1.ColumnDouble aiConfidenceScore;

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

  late final _i1.ColumnSerializable color;

  late final _i1.ColumnSerializable size;

  late final _i1.ColumnString material;

  late final _i1.ColumnString brand;

  late final _i1.ColumnEnum<_i2.ProductStatus> status;

  late final _i1.ColumnBool isActive;

  late final _i1.ColumnBool isFeatured;

  late final _i1.ColumnEnum<_i3.ProductCondition> condition;

  late final _i1.ColumnSerializable images;

  late final _i1.ColumnString thumbnailUrl;

  late final _i1.ColumnString videoUrl;

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

  late final _i1.ColumnSerializable searchKeywords;

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
        isAiGenerated,
        aiGeneratedAt,
        aiConfidenceScore,
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
