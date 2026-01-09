import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';
import '../services/catalog/meta_catalog_service.dart' show MetaCatalogService;
import '../services/catalog/product_sync_service.dart';
import '../services/dependency_injection.dart';

class ProductEndpoint extends Endpoint {
  /// ✅ COMPLETE: Create product with ALL fields
  Future<Product?> createProduct(
    Session session, {
    required UuidValue vendorId,
    required String name,
    required String description,
    required String category,
    required double basePrice,
    String? shortDescription,
    String? subCategory,
    List<String>? tags,
    String? currency,
    int? quantity,
    List<String>? images,
    List<String>? whatsappMediaIds,
    List<String>? telegramFileIds,
    String? thumbnailUrl,
    String? videoUrl,
    String? videoThumbnailUrl,
    List<String>? color,
    List<String>? size,
    String? material,
    String? brand,
    double? weight,
    String? weightUnit,
    String? dimensions,
    String? sku,
    String? barcode,
    bool? isAiGenerated,
    ProductStatus? status,
    ProductCondition? condition,
    String? facebookCategory,
    String? googleCategory,
    bool? shippingRequired,
    int? estimatedDeliveryDays,
    bool? freeShipping,
    double? shippingCost,
    String? facebookCategoryId,
    String? googleCategoryId,
    List<String>? searchKeywords,
  }) async {
    try {
      // ✅ Get vendor profile
      final vendor = await VendorProfile.db.findFirstRow(
        session,
        where: (t) => t.userId.equals(vendorId),
      );

      if (vendor == null) {
        session.log('❌ Vendor not found: ${vendorId.uuid}');
        return null;
      }

      // ✅ Check product limit
      if (vendor.currentProductCount >= vendor.productLimit &&
          vendor.productLimit != -1) {
        session.log(
            '❌ Product limit reached: ${vendor.currentProductCount}/${vendor.productLimit}');
        return null;
      }

      final productId = Uuid().v4obj();

      // ✅ Generate product URL (deep link)
      final productUrl = 'https://asami.com/products/${productId.uuid}';

      // ✅ Generate short description if not provided
      final generatedShortDesc = shortDescription ??
          (description.length > 100
              ? '${description.substring(0, 97)}...'
              : description);

      // ✅ Set brand (required by Meta)
      final productBrand = brand ?? vendor.businessName;

      // ✅ Create product with ALL fields
      final product = Product(
        id: productId,
        vendorId: vendorId,

        // Basic info
        name: name,
        description: description,
        shortDescription: generatedShortDesc,
        category: category,
        subCategory: subCategory,
        tags: tags ?? [],

        // Pricing
        basePrice: basePrice,
        currency: currency ?? 'NGN',

        // Inventory
        quantity: quantity ?? 1, // ✅ Default 1, not 0
        sku: sku,
        barcode: barcode,
        trackInventory: true,
        lowStockThreshold: 5,

        // Media
        images: images ?? [],
        whatsappMediaIds: whatsappMediaIds,
        telegramFileIds: telegramFileIds,
        thumbnailUrl: thumbnailUrl ?? images?.firstOrNull,
        videoUrl: videoUrl,
        videoThumbnailUrl: videoThumbnailUrl,

        // Attributes
        color: color,
        size: size,
        material: material,
        brand: productBrand, // ✅ Ensure brand is set
        weight: weight,
        weightUnit: weightUnit ?? 'kg',
        dimensions: dimensions,

        // Status
        status: status ?? ProductStatus.active,
        condition: condition ?? ProductCondition.newItem,
        isActive: true,
        isFeatured: false,

        // Meta fields
        facebookCategory: facebookCategory,
        googleCategory: googleCategory,
        productUrl: productUrl, // ✅ Set product URL
        metaCatalogId: null, // Will be set during sync
        metaProductId: null,
        metaRetailerId: productId.uuid, // ✅ Use UUID as retailer_id
        metaSyncStatus: 'pending',

        facebookCategoryId: facebookCategoryId,
        googleCategoryId: googleCategoryId,
        searchKeywords: searchKeywords,

        // CDN
        cdnUploadStatus: images != null && images.isNotEmpty
            ? 'completed'
            : (whatsappMediaIds != null || telegramFileIds != null
                ? 'pending'
                : 'not_required'),

        // AI
        isAiGenerated: isAiGenerated ?? false,
        hasAiGeneratedImages: false,

        // Shipping
        shippingRequired: shippingRequired ?? true,
        estimatedDeliveryDays: estimatedDeliveryDays,
        freeShipping: freeShipping ?? false,
        shippingCost: shippingCost ?? 0.0,

        // Metrics
        viewCount: 0,
        orderCount: 0,
        wishlistCount: 0,
        averageRating: 0.0,
        totalReviews: 0,
        conversionRate: 0.0,

        // Timestamps
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      // ✅ Save product
      final savedProduct = await Product.db.insertRow(session, product);

      // ✅ Update vendor stats
      vendor.currentProductCount++;
      vendor.totalProducts++;
      if (status == ProductStatus.active) {
        vendor.activeProducts++;
      }
      await VendorProfile.db.updateRow(session, vendor);

      session.log('✅ Product created: ${savedProduct.id.uuid}');

      // ✅ Trigger Meta sync in background
      _syncProductInBackground(session, product, action: 'create');

      return savedProduct;
    } catch (e, stackTrace) {
      session.log('❌ Create product error: $e', stackTrace: stackTrace);
      return null;
    }
  }

  /// ✅ COMPLETE: Update product with ALL fields
  Future<Product?> updateProduct(
    Session session, {
    required UuidValue productId,
    String? name,
    String? description,
    String? shortDescription,
    String? category,
    String? subCategory,
    double? basePrice,
    double? discountPrice,
    int? quantity,
    List<String>? color,
    List<String>? size,
    String? material,
    String? brand,
    bool? isActive,
    ProductStatus? status,
    String? thumbnailUrl,
    List<String>? images,
  }) async {
    try {
      final product = await Product.db.findById(session, productId);

      if (product == null) {
        session.log('❌ Product not found: ${productId.uuid}');
        return null;
      }

      // ✅ Update fields if provided
      if (name != null) product.name = name;
      if (description != null) {
        product.description = description;
        // Auto-update short description if not manually set
        if (shortDescription == null) {
          product.shortDescription = description.length > 100
              ? '${description.substring(0, 97)}...'
              : description;
        }
      }
      if (shortDescription != null) product.shortDescription = shortDescription;
      if (category != null) product.category = category;
      if (subCategory != null) product.subCategory = subCategory;
      if (basePrice != null) product.basePrice = basePrice;
      if (discountPrice != null) product.discountPrice = discountPrice;
      if (quantity != null) product.quantity = quantity;
      if (color != null) product.color = color;
      if (size != null) product.size = size;
      if (material != null) product.material = material;
      if (brand != null) product.brand = brand;
      if (isActive != null) product.isActive = isActive;
      if (status != null) product.status = status;
      if (thumbnailUrl != null) product.thumbnailUrl = thumbnailUrl;
      if (images != null) product.images = images;

      product.updatedAt = DateTime.now();

      // ✅ Mark for Meta re-sync
      product.metaSyncStatus = 'pending';

      final updated = await Product.db.updateRow(session, product);

      session.log('✅ Product updated: ${updated.id.uuid}');

      // ✅ Trigger Meta sync in background
      _syncProductInBackground(session, product, action: 'update');

      return updated;
    } catch (e, stackTrace) {
      session.log('❌ Update product error: $e', stackTrace: stackTrace);
      return null;
    }
  }

  /// Delete/deactivate product
  Future<bool> deleteProduct(
    Session session,
    UuidValue productId,
  ) async {
    try {
      final product = await Product.db.findFirstRow(
        session,
        where: (t) => t.id.equals(productId),
      );

      if (product == null) return false;

      // Soft delete
      product.isActive = false;
      product.status = ProductStatus.discontinued;
      product.deletedAt = DateTime.now();
      product.updatedAt = DateTime.now();

      await Product.db.updateRow(session, product);

      // ========== SYNC DELETION TO PLATFORMS (BACKGROUND) ==========
      _syncProductInBackground(session, product, action: 'delete');

      return true;
    } catch (e) {
      session.log('Delete product error: $e');
      return false;
    }
  }

  /// Publish product (change from draft to active)
  Future<bool> publishProduct(Session session, UuidValue productId) async {
    final product = await Product.db.findFirstRow(
      session,
      where: (t) => t.id.equals(productId),
    );

    if (product == null) return false;

    product.status = ProductStatus.active;
    product.isActive = true;
    product.publishedAt = DateTime.now();
    product.updatedAt = DateTime.now();

    await Product.db.updateRow(session, product);

    // ========== SYNC PUBLISH TO PLATFORMS (BACKGROUND) ==========
    _syncProductInBackground(session, product, action: 'create');
    return true;
  }

  /// Get product by ID
  Future<Product?> getProduct(Session session, UuidValue productId) async {
    final product = await Product.db.findFirstRow(
      session,
      where: (t) => t.id.equals(productId),
    );

    // Increment view count
    if (product != null) {
      product.viewCount++;
      await Product.db.updateRow(session, product);
    }

    return product;
  }

  /// Get vendor products
  Future<List<Product>> getVendorProducts(
    Session session, {
    required UuidValue vendorId,
    ProductStatus? status,
    bool? isActive,
    int limit = 50,
    int offset = 0,
  }) async {
    WhereExpressionBuilder<ProductTable>? whereClause;
    whereClause = (t) => t.vendorId.equals(vendorId);

    if (status != null) {
      whereClause =
          (t) => (t.vendorId.equals(vendorId) & (t.status.equals(status)));
    }

    if (isActive != null) {
      whereClause =
          (t) => (t.vendorId.equals(vendorId) & t.isActive.equals(true));
    }

    return await Product.db.find(
      session,
      where: whereClause,
      limit: limit,
      offset: offset,
      orderBy: (t) => t.createdAt,
      orderDescending: true,
    );
  }

  /// Search products (for customer bot)
  Future<List<Product>> searchProducts(
    Session session, {
    String? query,
    String? category,
    double? minPrice,
    double? maxPrice,
    List<String>? tags,
    String? color,
    String? size,
    int limit = 20,
    int offset = 0,
  }) async {
    // Build dynamic where clause
    WhereExpressionBuilder<ProductTable>? whereClause;

    where(t) => t.status.equals(ProductStatus.active) & t.isActive.equals(true);

    if (query != null && query.isNotEmpty) {
      // Search in name, description, and tags
      whereClause = (t) =>
          where(t) &
          (t.name.ilike('%$query%') | t.description.ilike('%$query%'));
    }

    if (category != null) {
      whereClause = (t) => where(t) & t.category.equals(category);
    }

    if (minPrice != null) {
      whereClause = (t) =>
          where(t) & t.basePrice.between(minPrice, maxPrice ?? double.infinity);
    }

    // Note: For complex searches like tags, color, size filtering,
    // you may need to do post-query filtering or use custom SQL

    final products = await Product.db.find(
      session,
      where: whereClause,
      limit: limit,
      offset: offset,
      orderBy: (t) => t.viewCount, // Order by popularity
      orderDescending: true,
    );

    return products;
  }

  /// Update inventory
  Future<bool> updateInventory(
    Session session, {
    required UuidValue productId,
    required int quantity,
  }) async {
    final product = await Product.db.findFirstRow(
      session,
      where: (t) => t.id.equals(productId),
    );

    if (product == null) return false;

    product.quantity = quantity;

    // Update status based on quantity
    if (quantity == 0) {
      product.status = ProductStatus.out_of_stock;
    } else if (product.status == ProductStatus.out_of_stock) {
      product.status = ProductStatus.active;
    }

    product.updatedAt = DateTime.now();
    await Product.db.updateRow(session, product);

    // Check for low stock alert
    if (quantity <= product.lowStockThreshold && quantity > 0) {
      // TODO: Trigger low stock notification
    }

    return true;
  }

  /// Decrement inventory (after order)
  Future<bool> decrementInventory(
    Session session, {
    required UuidValue productId,
    required int quantity,
  }) async {
    final product = await Product.db.findFirstRow(
      session,
      where: (t) => t.id.equals(productId),
    );

    if (product == null) return false;
    if (product.quantity < quantity) return false;

    product.quantity -= quantity;
    product.orderCount++;

    if (product.quantity == 0) {
      product.status = ProductStatus.out_of_stock;
    }

    product.updatedAt = DateTime.now();
    await Product.db.updateRow(session, product);

    return true;
  }

  /// Get featured products
  Future<List<Product>> getFeaturedProducts(
    Session session, {
    int limit = 10,
  }) async {
    return await Product.db.find(
      session,
      where: (t) =>
          t.isFeatured.equals(true) &
          t.isActive.equals(true) &
          t.status.equals(ProductStatus.active),
      limit: limit,
      orderBy: (t) => t.viewCount,
      orderDescending: true,
    );
  }

  /// Get products by category
  Future<List<Product>> getProductsByCategory(
    Session session, {
    required String category,
    String? subCategory,
    int limit = 20,
    int offset = 0,
  }) async {
    WhereExpressionBuilder<ProductTable>? whereClause;

    where(t) =>
        t.category.equals(category) &
        t.isActive.equals(true) &
        t.status.equals(ProductStatus.active);

    if (subCategory != null) {
      whereClause = (t) => where(t) & t.subCategory.equals(subCategory);
    }

    return await Product.db.find(
      session,
      where: whereClause,
      limit: limit,
      offset: offset,
      orderBy: (t) => t.createdAt,
      orderDescending: true,
    );
  }

  // Helper methods
  Future<bool> _checkProductLimit(Session session, UuidValue vendorId) async {
    final vendor = await VendorProfile.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(vendorId),
    );

    if (vendor == null) return false;

    // Check if limit reached
    if (vendor.currentProductCount >= vendor.productLimit) {
      return false;
    }

    return true;
  }

  Future<void> _updateVendorProductCount(
      Session session, UuidValue vendorId) async {
    final vendor = await VendorProfile.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(vendorId),
    );

    if (vendor != null) {
      final count = await Product.db.count(
        session,
        where: (t) => t.vendorId.equals(vendorId),
      );

      vendor.currentProductCount = count;
      vendor.totalProducts = count;
      vendor.updatedAt = DateTime.now();
      await VendorProfile.db.updateRow(session, vendor);
    }
  }

  Future<void> _trackAiUsage(
    Session session,
    UuidValue vendorId,
    String usageType,
  ) async {
    final vendor = await VendorProfile.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(vendorId),
    );

    if (vendor == null) return;

    vendor.aiDescriptionsUsed++;
    vendor.updatedAt = DateTime.now();
    await VendorProfile.db.updateRow(session, vendor);

    // Create usage record for billing
    final usageId = Uuid().v4obj();
    final now = DateTime.now();
    final periodStart = DateTime(now.year, now.month, 1);
    final periodEnd = DateTime(now.year, now.month + 1, 0);

    final usage = UsageRecord(
      id: usageId,
      vendorId: vendorId,
      usageType: usageType,
      quantity: 1,
      unitPrice: 0.10, // $0.10 per AI description
      totalAmount: 0.10,
      billingPeriodStart: periodStart,
      billingPeriodEnd: periodEnd,
      createdAt: now,
    );

    await UsageRecord.db.insertRow(session, usage);
  }

  // ========== BACKGROUND SYNC HELPER ==========

  void _syncProductInBackground(
    Session session,
    Product product, {
    required String action,
  }) {
    Future(() async {
      try {
        final syncService = ProductSyncService(session);

        switch (action) {
          case 'create':
            await syncService.syncProductCreate(product);
            break;
          case 'update':
            await syncService.syncProductUpdate(product);
            break;
          case 'delete':
            await syncService.syncProductDelete(product);
            break;
        }
      } catch (e) {
        session.log('Background sync error: $e');
      }
    });
  }
}
