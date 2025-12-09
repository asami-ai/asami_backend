import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class ProductEndpoint extends Endpoint {
  /// Create product (AI-assisted or manual)
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
    List<String>? images,
    bool isAiGenerated = false,
    double? aiConfidenceScore,
    int quantity = 0,
    String? sku,
    List<String>? color,
    List<String>? size,
    String? material,
    String? brand,
    double? weight,
    String? weightUnit,
    bool trackInventory = true,
  }) async {
    try {
      // Check vendor tier limits
      final canCreate = await _checkProductLimit(session, vendorId);
      if (!canCreate) {
        throw Exception('Product limit reached for current subscription tier');
      }

      final productId = Uuid().v4obj();

      final product = Product(
        id: productId,
        vendorId: vendorId,
        name: name,
        description: description,
        shortDescription: shortDescription,
        category: category,
        subCategory: subCategory,
        tags: tags ?? [],
        basePrice: basePrice,
        isAiGenerated: isAiGenerated,
        aiGeneratedAt: isAiGenerated ? DateTime.now() : null,
        aiConfidenceScore: aiConfidenceScore,
        quantity: quantity,
        sku: sku,
        images: images ?? [],
        thumbnailUrl: images?.isNotEmpty == true ? images!.first : null,
        color: color,
        size: size,
        material: material,
        brand: brand,
        weight: weight,
        weightUnit: weightUnit,
        trackInventory: trackInventory,
        status: ProductStatus.draft,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      final created = await Product.db.insertRow(session, product);

      // Update vendor product count
      await _updateVendorProductCount(session, vendorId);

      // Track AI usage if applicable
      if (isAiGenerated) {
        await _trackAiUsage(session, vendorId, 'product_description');
      }

      return created;
    } catch (e) {
      session.log('Create product error: $e');
      return null;
    }
  }

  /// Update product
  Future<Product?> updateProduct(
    Session session, {
    required UuidValue productId,
    String? name,
    String? description,
    String? shortDescription,
    String? category,
    String? subCategory,
    List<String>? tags,
    double? basePrice,
    double? discountPrice,
    int? quantity,
    ProductStatus? status,
    List<String>? images,
    bool? isActive,
    bool? isFeatured,
  }) async {
    try {
      final product = await Product.db.findFirstRow(
        session,
        where: (t) => t.id.equals(productId),
      );

      if (product == null) return null;

      if (name != null) product.name = name;
      if (description != null) product.description = description;
      if (shortDescription != null) product.shortDescription = shortDescription;
      if (category != null) product.category = category;
      if (subCategory != null) product.subCategory = subCategory;
      if (tags != null) product.tags = tags;
      if (basePrice != null) product.basePrice = basePrice;
      if (discountPrice != null) product.discountPrice = discountPrice;
      if (quantity != null) product.quantity = quantity;
      if (status != null) product.status = status;
      if (images != null) {
        product.images = images;
        if (images.isNotEmpty) product.thumbnailUrl = images.first;
      }
      if (isActive != null) product.isActive = isActive;
      if (isFeatured != null) product.isFeatured = isFeatured;

      product.updatedAt = DateTime.now();

      return await Product.db.updateRow(session, product);
    } catch (e) {
      session.log('Update product error: $e');
      return null;
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
     whereClause = ( t) => t.vendorId.equals(vendorId);

    if (status != null) {
      whereClause = (t) => (t.vendorId.equals(vendorId) & (t.status.equals(status)));
    }

    if (isActive != null) {
      whereClause = (t) => (t.vendorId.equals(vendorId) & t.isActive.equals(true));
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
    
    where(t) => 
        t.status.equals(ProductStatus.active) & 
        t.isActive.equals(true);

    if (query != null && query.isNotEmpty) {
      // Search in name, description, and tags
      whereClause = (t) => where(t) & 
          (t.name.like('%$query%') | t.description.like('%$query%'));
    }

    if (category != null) {
      whereClause = (t) => where(t) & t.category.equals(category);
    }

    if (minPrice != null) {
      whereClause = (t) => where(t) & t.basePrice.between(minPrice, maxPrice ?? double.infinity);
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

    where( t) => 
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

  Future<void> _updateVendorProductCount(Session session, UuidValue vendorId) async {
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
}