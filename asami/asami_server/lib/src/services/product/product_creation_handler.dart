// File: server/lib/src/services/product/product_creation_handler.dart

import 'dart:convert';
import 'package:serverpod/serverpod.dart' hide Message;
import '../../generated/protocol.dart';
import '../../endpoints/product_endpoint.dart';
import '../catalog/category_classification_service.dart';
import '../catalog/meta_catalog_service.dart';
import '../dependency_injection.dart';
import '../media/enanced_media_services.dart';
import 'product_creation_state.dart';

/// Configuration for product creation feature
class ProductCreationConfig {
  static bool useCDN = false;
  static const int maxImages = 5;
  static const int minImages = 1;
  static const int sessionTimeoutMinutes = 30;
  static const int maxRetries = 3;
  static const int retryDelaySeconds = 2;
}

/// ✅ ENHANCED: Product creation with pre-classification and retry mechanism
class ProductCreationHandler {
  final ProductCreationStateManager stateManager;
  final EnhancedMediaService? mediaService;

  ProductCreationHandler({
    this.mediaService,
    required this.stateManager,
  });

  Future<bool> isInCreationFlow(Session session, String conversationId) async {
    final creationSession =
        await stateManager.getCurrentSession(session, conversationId);
    return creationSession != null &&
        creationSession.state != ProductCreationState.IDLE &&
        creationSession.state != ProductCreationState.COMPLETED;
  }

  Future<Map<String, dynamic>> initiateCreation(
    Session session, {
    required User user,
    required Conversation conversation,
    required PlatformType platform,
  }) async {
    try {
      final vendor = await VendorProfile.db.findFirstRow(
        session,
        where: (t) => t.userId.equals(user.id),
      );

      if (vendor == null) {
        return {'success': false, 'error': 'Vendor profile not found'};
      }

      if (vendor.currentProductCount >= vendor.productLimit &&
          vendor.productLimit != -1) {
        return {
          'success': false,
          'error': 'Product limit reached. Upgrade to add more products.',
          'limit_reached': true,
        };
      }

      final creationSession = await stateManager.startProductCreation(
        session,
        userId: user.id.uuid,
        conversationId: conversation.id.uuid,
        platform: platform,
        tier: vendor.subscriptionTier,
      );

      return {
        'success': true,
        'state': 'awaiting_images',
        'message': '''
📸 **New Product Upload**

Send 1-5 product images to get started!

${vendor.subscriptionTier != SubscriptionTier.freemium ? '✨ ${vendor.subscriptionTier.name.toUpperCase()} feature: AI can generate descriptions from your images!\n' : ''}
💡 Type "/cancel" anytime to exit.
''',
      };
    } catch (e, stackTrace) {
      session.log('Initiate creation error: $e', stackTrace: stackTrace);
      return {'success': false, 'error': e.toString()};
    }
  }

  Future<Map<String, dynamic>> processCreationMessage(
    Session session, {
    required User user,
    required Conversation conversation,
    required Message message,
    required PlatformType platform,
  }) async {
    try {
      final creationSession = await stateManager.getCurrentSession(
        session,
        conversation.id.uuid,
      );

      if (creationSession == null) {
        return {
          'success': false,
          'in_creation_flow': false,
          'error': 'Not in product creation flow',
        };
      }

      if (_isCancelCommand(message.content)) {
        return await _handleCancellation(
            session, conversation.id.uuid, creationSession, user);
      }

      switch (creationSession.state) {
        case ProductCreationState.AWAITING_IMAGES:
          return await _handleImagesState(
              session, user, conversation, message, creationSession, platform);

        case ProductCreationState.AWAITING_DETAILS:
          return await _handleDetailsState(
              session, user, conversation, message, creationSession);

        case ProductCreationState.PROCESSING:
          return {
            'success': false,
            'blocked': true,
            'message': '⚙️ Product is being created. Please wait...',
          };

        default:
          return {'success': false, 'error': 'Invalid state'};
      }
    } catch (e, stackTrace) {
      session.log('Process creation message error: $e', stackTrace: stackTrace);
      return {
        'success': false,
        'error': 'An error occurred. Type "/cancel" to exit.',
      };
    }
  }

  Future<Map<String, dynamic>> _handleImagesState(
    Session session,
    User user,
    Conversation conversation,
    Message message,
    ProductCreationSession creationSession,
    PlatformType platform,
  ) async {
    final content = message.content.toLowerCase().trim();

    if (content == 'done' || content == 'next') {
      if (!creationSession.hasMinimumImages) {
        return {
          'success': false,
          'blocked': true,
          'message': '❌ Send at least 1 image before continuing.',
        };
      }

      creationSession.state = ProductCreationState.AWAITING_DETAILS;
      await _saveSession(session, conversation, creationSession);

      return {
        'success': true,
        'state': 'awaiting_details',
        'message': _getDetailsPrompt(creationSession.tier),
      };
    }

    if (message.messageType != MessageType.image || message.mediaUrl == null) {
      return {
        'success': false,
        'blocked': true,
        'message': '''
📸 **Images Required** (${creationSession.imageCount}/5)

❌ Only image uploads accepted right now.

${creationSession.hasMinimumImages ? '✅ You have enough. Type "done" to continue.\n   Or send more (up to 5 total).' : '⚠️  Send at least 1 image to proceed.'}

Type "/cancel" to exit.
''',
      };
    }

    String mediaId;
    if (platform == PlatformType.whatsapp) {
      mediaId = message.mediaUrl!;
    } else {
      mediaId = message.platformMessageId ?? message.mediaUrl!;
    }

    // ✅ Just store the media ID, don't process yet
    creationSession.imageMediaIds.add(mediaId);
    creationSession.lastUpdatedAt = DateTime.now();
    await _saveSession(session, conversation, creationSession);

    session.log('📸 Stored media ID: $mediaId (${creationSession.imageCount}/5)');

    if (creationSession.imageCount >= 5) {
      creationSession.state = ProductCreationState.AWAITING_DETAILS;
      await _saveSession(session, conversation, creationSession);

      return {
        'success': true,
        'state': 'awaiting_details',
        'message': '''
✅ Maximum 5 images received!

${_getDetailsPrompt(creationSession.tier)}
''',
      };
    }

    return {
      'success': true,
      'state': 'awaiting_images',
      'images_collected': creationSession.imageCount,
      'message': '''
✅ Image ${creationSession.imageCount}/5 received!

📸 Send more images or type "done" to continue.
''',
    };
  }

  Future<Map<String, dynamic>> _handleDetailsState(
    Session session,
    User user,
    Conversation conversation,
    Message message,
    ProductCreationSession creationSession,
  ) async {
    if (message.messageType != MessageType.text) {
      return {
        'success': false,
        'blocked': true,
        'message': '📝 Please send text with product details.',
      };
    }

    final content = message.content;
    final parsed = _parseProductDetails(content, creationSession.tier);

    if (!parsed['valid']) {
      return {
        'success': false,
        'message': '''
❌ ${parsed['error']}

Please provide:
• Product name
• Description  
• Price (₦)
• Category
• Quantity (optional, default: 1)

Example:
"Samsung Galaxy S24
Flagship smartphone with 256GB storage
Price: 450,000
Category: Electronics
Quantity: 10"
''',
      };
    }

    creationSession.name = parsed['name'];
    creationSession.description = parsed['description'];
    creationSession.shortDescription = parsed['short_description'];
    creationSession.price = parsed['price'];
    creationSession.category = parsed['category'];
    creationSession.quantity = parsed['quantity'] ?? 1;
    creationSession.colors = parsed['colors'];
    creationSession.sizes = parsed['sizes'];
    creationSession.brand = parsed['brand'];

    creationSession.state = ProductCreationState.PROCESSING;
    await _saveSession(session, conversation, creationSession);

    return {
      'success': true,
      'state': 'processing',
      'ready_to_create': true,
      'session_data': creationSession.toJson(),
      'message': '⚙️ Creating your product...',
    };
  }

  Map<String, dynamic> _parseProductDetails(
      String content, SubscriptionTier tier) {
    final lines = content
        .split('\n')
        .map((l) => l.trim())
        .where((l) => l.isNotEmpty)
        .toList();

    String? name;
    String? description;
    String? shortDescription;
    double? price;
    String? category;
    int? quantity;
    List<String>? colors;
    List<String>? sizes;
    String? brand;

    for (var line in lines) {
      final lower = line.toLowerCase();

      if (lower.contains('price') || lower.contains('₦')) {
        final priceMatch = RegExp(r'[\d,]+(?:\.\d+)?').firstMatch(line);
        if (priceMatch != null) {
          price = double.tryParse(priceMatch.group(0)!.replaceAll(',', ''));
        }
      } else if (lower.contains('quantity') || lower.contains('stock')) {
        final qtyMatch = RegExp(r'\d+').firstMatch(line);
        if (qtyMatch != null) {
          quantity = int.tryParse(qtyMatch.group(0)!);
        }
      } else if (lower.contains('category')) {
        category = line.split(':').last.trim();
      } else if (lower.contains('color')) {
        final colorStr = line.split(':').last;
        colors = colorStr
            .split(RegExp(r'[,;]'))
            .map((c) => c.trim())
            .where((c) => c.isNotEmpty)
            .toList();
      } else if (lower.contains('size')) {
        final sizeStr = line.split(':').last;
        sizes = sizeStr
            .split(RegExp(r'[,;]'))
            .map((s) => s.trim())
            .where((s) => s.isNotEmpty)
            .toList();
      } else if (lower.contains('brand')) {
        brand = line.split(':').last.trim();
      } else if (name == null && !lower.contains(':')) {
        name = line;
      } else if (line.length > 20 && description == null) {
        description = line;
      }
    }

    if (description != null && shortDescription == null) {
      shortDescription = description.length > 100
          ? description.substring(0, 97) + '...'
          : description;
    }

    if (name == null || name.length < 3) {
      return {
        'valid': false,
        'error': 'Product name is required (min 3 characters)'
      };
    }
    if (description == null || description.length < 10) {
      return {
        'valid': false,
        'error': 'Description is required (min 10 characters)'
      };
    }
    if (price == null || price <= 0) {
      return {'valid': false, 'error': 'Valid price is required'};
    }
    if (category == null || category.length < 2) {
      return {'valid': false, 'error': 'Category is required'};
    }

    return {
      'valid': true,
      'name': name,
      'description': description,
      'short_description': shortDescription,
      'price': price,
      'category': category,
      'quantity': quantity,
      'colors': colors,
      'sizes': sizes,
      'brand': brand,
    };
  }

  String _getDetailsPrompt(SubscriptionTier tier) {
    return '''
📝 **Product Details**

Please send ALL details in one message:

✅ Required:
• Name
• Description
• Price (₦)
• Category

📦 Optional:
• Quantity (default: 1)
• Colors
• Sizes
• Brand

${tier != SubscriptionTier.freemium ? '\n✨ AI will enhance your description automatically!\n' : ''}

**Example:**
Blue Cotton T-Shirt
Comfortable 100% cotton shirt perfect for casual wear
Price: 3500
Category: Fashion
Quantity: 50
Colors: Blue, Red, Green
Sizes: S, M, L, XL
Brand: Zara
''';
  }

  /// ✅ COMPLETE: Product creation with classification, media processing & retry
  Future<Map<String, dynamic>> completeProductCreation(
    Session session, {
    required User user,
    required ProductCreationSession creationSession,
    required Conversation conversation,
  }) async {
    try {
      final vendor = await VendorProfile.db.findFirstRow(
        session,
        where: (t) => t.userId.equals(user.id),
      );

      if (vendor == null) throw Exception('Vendor profile not found');

      session.log('🤖 Classifying product before creation...');
      session.log('   Name: ${creationSession.name}');
      session.log('   Description: ${creationSession.description}');
      session.log('   User Category: ${creationSession.category}');
      
      // ✅ STEP 1: Classify BEFORE creating product
      final classificationService = CategoryClassificationService(session);
      final classification = await classificationService.classifyProduct(
        productName: creationSession.name!,
        description: creationSession.description!,
        userSelectedCategory: creationSession.category,
      );

      // ✅ STEP 2: Extract classification results
      String? facebookCategoryId;
      String? facebookCategoryName;
      int? googleTaxonomyId;
      String? googleTaxonomyPath;
      List<String> suggestedTags = [];
      String finalCategory = creationSession.category!;

      if (classification['success'] == true) {
        facebookCategoryId = classification['facebook_category_id'] as String?;
        facebookCategoryName = classification['facebook_category_name'] as String?;
        googleTaxonomyId = classification['google_taxonomy_id'] as int?;
        googleTaxonomyPath = classification['google_taxonomy_path'] as String?;
        suggestedTags = (classification['suggested_tags'] as List?)?.cast<String>() ?? [];
        finalCategory = classification['simple_category'] as String? ?? creationSession.category!;

        session.log('✅ Classification complete:');
        session.log('   Final Category: $finalCategory');
        session.log('   Facebook: $facebookCategoryName (ID: $facebookCategoryId)');
        session.log('   Google: $googleTaxonomyPath (ID: $googleTaxonomyId)');
        session.log('   Tags: ${suggestedTags.join(", ")}');
      } else {
        session.log('⚠️ Classification failed, using user category: ${classification['error']}');
      }

      // ✅ STEP 3: Create product with ALL classification data
      final product = await ProductEndpoint().createProduct(
        session,
        vendorId: user.id,
        name: creationSession.name!,
        description: creationSession.description!,
        shortDescription: creationSession.shortDescription,
        category: finalCategory,
        basePrice: creationSession.price!,
        quantity: creationSession.quantity,
        images: [],
        whatsappMediaIds: creationSession.platform == PlatformType.whatsapp
            ? creationSession.imageMediaIds
            : null,
        telegramFileIds: creationSession.platform == PlatformType.telegram
            ? creationSession.imageMediaIds
            : null,
        color: creationSession.colors,
        size: creationSession.sizes,
        brand: creationSession.brand,
        isAiGenerated: creationSession.useAiDescription,
        status: ProductStatus.active,
        facebookCategory: facebookCategoryName,
        facebookCategoryId: facebookCategoryId,
        googleCategory: googleTaxonomyPath,
        googleCategoryId: googleTaxonomyId?.toString(),
        tags: suggestedTags.isNotEmpty ? suggestedTags : null,
        searchKeywords: suggestedTags.isNotEmpty ? suggestedTags : null,
      );

      if (product == null) throw Exception('Failed to create product');

      session.log('✅ Product created with full categorization: ${product.id.uuid}');

      // ✅ STEP 4: Process media in background with NEW session
      if (mediaService != null && creationSession.imageMediaIds.isNotEmpty) {
        _processAllMediaWithRetry(
          mediaIds: creationSession.imageMediaIds,
          platform: creationSession.platform,
          vendorId: user.id,
          productId: product.id,
        );
      }

      // ✅ STEP 5: Push to Meta AFTER media processing
      _pushToMetaCatalogBackground(
        productId: product.id,
      );

      // Clear session
      creationSession.state = ProductCreationState.COMPLETED;
      await _saveSession(session, conversation, creationSession);

      Future.delayed(Duration(seconds: 5), () async {
        final tempSession = await Serverpod.instance.createSession();
        try {
          await stateManager.cancelCreation(tempSession, conversation.id.uuid);
        } finally {
          await tempSession.close();
        }
      });

      return {
        'success': true,
        'product_id': product.id.uuid,
        'message': '''
✅ **Product Created!**

📦 **${product.name}**
💰 Price: ₦${product.basePrice.toStringAsFixed(2)}
📂 Category: ${product.category}
${suggestedTags.isNotEmpty ? '🏷️ Tags: ${suggestedTags.take(5).join(", ")}\n' : ''}📦 Stock: ${product.quantity}
📸 Images: ${creationSession.imageCount}

Your product is now live!

🔄 Syncing to Meta Catalog...
✨ Images processing in background

What's next?
• /myproducts - View all products
• /analytics - Check your stats
''',
      };
    } catch (e, stackTrace) {
      session.log('Complete product creation error: $e',
          stackTrace: stackTrace);
      return {
        'success': false,
        'error': 'Failed to create product: ${e.toString()}',
      };
    }
  }

  // ========================================================================
  // ✅ FIXED: MEDIA PROCESSING WITH NEW SESSION
  // ========================================================================

  /// Process all media with retry mechanism using NEW session
  void _processAllMediaWithRetry({
    required List<String> mediaIds,
    required PlatformType platform,
    required UuidValue vendorId,
    required UuidValue productId,
  }) {
    if (mediaService == null) return;

    Future(() async {
      // ✅ CREATE NEW SESSION for background task
      final session = await Serverpod.instance.createSession();
      
      try {
        session.log('📸 Starting batch media processing for product ${productId.uuid}');
        session.log('   Total media files: ${mediaIds.length}');

        final results = <String, Map<String, dynamic>>{};
        final failedMedia = <String>[];

        // Process each media file
        for (var i = 0; i < mediaIds.length; i++) {
          final mediaId = mediaIds[i];
          final success = await _processMediaWithRetry(
            session,
            mediaId: mediaId,
            platform: platform,
            vendorId: vendorId,
            productId: productId,
            attemptNumber: i + 1,
            totalFiles: mediaIds.length,
          );

          if (success) {
            results[mediaId] = {'status': 'success', 'attempts': 1};
          } else {
            failedMedia.add(mediaId);
            results[mediaId] = {'status': 'failed', 'attempts': ProductCreationConfig.maxRetries};
          }

          // Small delay between uploads
          if (i < mediaIds.length - 1) {
            await Future.delayed(Duration(milliseconds: 500));
          }
        }

        // Log final summary
        final successCount = results.values.where((r) => r['status'] == 'success').length;
        final failedCount = failedMedia.length;

        session.log('');
        session.log('📊 Media Processing Summary:');
        session.log('   ✅ Successful: $successCount/${mediaIds.length}');
        session.log('   ❌ Failed: $failedCount/${mediaIds.length}');
        
        if (failedMedia.isNotEmpty) {
          session.log('   ⚠️ Failed media IDs: ${failedMedia.join(", ")}');
        }

        session.log('✅ Batch media processing complete for product ${productId.uuid}');
      } catch (e, stackTrace) {
        session.log('❌ Batch processing error: $e');
        session.log('Stack trace: $stackTrace');
      } finally {
        // ✅ IMPORTANT: Close the session
        await session.close();
      }
    });
  }

  /// Process single media file with retry mechanism
  Future<bool> _processMediaWithRetry(
    Session session, {
    required String mediaId,
    required PlatformType platform,
    required UuidValue vendorId,
    required UuidValue productId,
    required int attemptNumber,
    required int totalFiles,
  }) async {
    session.log('📸 Processing media [$attemptNumber/$totalFiles]: $mediaId');

    for (var attempt = 1; attempt <= ProductCreationConfig.maxRetries; attempt++) {
      try {
        session.log('   Attempt $attempt/${ProductCreationConfig.maxRetries}...');

        final result = await mediaService!.processProductMedia(
          mediaId: mediaId,
          platform: platform,
          vendorId: vendorId,
          productId: productId,
          isVideo: false,
        );

        if (result['success'] == true) {
          session.log('   ✅ Media processed successfully on attempt $attempt');
          return true;
        } else {
          session.log('   ⚠️ Attempt $attempt failed: ${result['error']}');
          
          if (attempt < ProductCreationConfig.maxRetries) {
            final delay = ProductCreationConfig.retryDelaySeconds * attempt;
            session.log('   ⏳ Retrying in ${delay}s...');
            await Future.delayed(Duration(seconds: delay));
          }
        }
      } catch (e, stackTrace) {
        session.log('   ❌ Attempt $attempt error: $e');
        
        if (attempt < ProductCreationConfig.maxRetries) {
          final delay = ProductCreationConfig.retryDelaySeconds * attempt;
          session.log('   ⏳ Retrying in ${delay}s...');
          await Future.delayed(Duration(seconds: delay));
        } else {
          session.log('   ❌ All retry attempts exhausted for $mediaId');
          session.log('Stack trace: $stackTrace');
        }
      }
    }

    session.log('   ❌ Failed to process media $mediaId after ${ProductCreationConfig.maxRetries} attempts');
    return false;
  }

  // ========================================================================
  // HELPER METHODS
  // ========================================================================

  bool _isCancelCommand(String message) {
    final content = message.toLowerCase().trim();
    return content == '/cancel' || content == 'cancel' || content == 'exit';
  }

  Future<Map<String, dynamic>> _handleCancellation(
    Session session,
    String conversationId,
    ProductCreationSession creationSession,
    User user,
  ) async {
    await stateManager.cancelCreation(session, conversationId);
    return {
      'success': true,
      'cancelled': true,
      'message': '''
❌ **Product Creation Cancelled**

Progress was not saved.

Type "add product" to start over.
''',
    };
  }

  void _pushToMetaCatalogBackground({
    required UuidValue productId,
  }) {
    Future(() async {
      // ✅ CREATE NEW SESSION for background task
      final session = await Serverpod.instance.createSession();
      
      try {
        // Wait longer for media processing to complete
        await Future.delayed(Duration(seconds: 15));

        session.log('📤 Pushing to Meta Catalog: $productId');

        final metaService = getIt<MetaCatalogService>();
        final updatedProduct = await Product.db.findById(session, productId);

        if (updatedProduct == null) {
          session.log('⚠️ Product not found for Meta sync');
          return;
        }

        // Check if CDN images are ready
        if (updatedProduct.images.isEmpty || 
            !updatedProduct.images.first.startsWith('http')) {
          session.log('⚠️ CDN images not ready yet, skipping Meta sync');
          session.log('   Images: ${updatedProduct.images}');
          return;
        }

        final result = await metaService.pushProduct(
          session,  
          updatedProduct,
          autoClassify: false,
        );

        if (result['success']) {
          session.log('✅ Pushed to Meta: ${result['meta_product_id']}');
        } else {
          session.log('❌ Meta push failed: ${result['error']}');
        }
      } catch (e, stackTrace) {
        session.log('❌ Meta push error: $e');
        session.log('Stack trace: $stackTrace');
      } finally {
        // ✅ IMPORTANT: Close the session
        await session.close();
      }
    });
  }

  Future<void> _saveSession(
    Session session,
    Conversation conversation,
    ProductCreationSession creationSession,
  ) async {
    final sessionData = conversation.sessionData != null
        ? jsonDecode(conversation.sessionData!)
        : <String, dynamic>{};

    sessionData['product_creation'] = creationSession.toJson();
    conversation.sessionData = jsonEncode(sessionData);
    conversation.updatedAt = DateTime.now();

    await Conversation.db.updateRow(session, conversation);
  }
}