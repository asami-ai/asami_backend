// File: server/lib/src/services/product_creation/product_creation_handler.dart

import 'dart:convert';
import 'package:serverpod/serverpod.dart' hide Message;
import '../../generated/protocol.dart';
import '../../endpoints/product_endpoint.dart';
import '../catalog/meta_catalog_service.dart';
import '../dependency_injection.dart';
import '../media/enanced_media_services.dart';
import 'product_creation_state.dart';

/// Configuration for product creation feature
class ProductCreationConfig {
  static bool useCDN = false; // Toggle: true for CDN, false for DB storage
  static const int maxImages = 5;
  static const int minImages = 2;
  static const int sessionTimeoutMinutes = 30;
}

/// Handles the complete product creation flow with strict state enforcement
class ProductCreationHandler {
  final ProductCreationStateManager stateManager;
  final EnhancedMediaService? mediaService;

  ProductCreationHandler({
    this.mediaService,
    required this.stateManager,
  });

  /// Check if user is in product creation flow
  Future<bool> isInCreationFlow(Session session, String conversationId) async {
    final creationSession =
        await stateManager.getCurrentSession(session, conversationId);
    return creationSession != null &&
        creationSession.state != ProductCreationState.IDLE &&
        creationSession.state != ProductCreationState.COMPLETED;
  }

  /// Initiate product creation
  Future<Map<String, dynamic>> initiateCreation(
    Session session, {
    required User user,
    required Conversation conversation,
    required PlatformType platform,
  }) async {
    try {
      // Check if already in flow
      if (await isInCreationFlow(session, conversation.id.uuid)) {
        return {
          'success': false,
          'error': 'Already in product creation. Type "/cancel" to start over.',
        };
      }

      // Get vendor profile for tier info
      final vendor = await VendorProfile.db.findFirstRow(
        session,
        where: (t) => t.userId.equals(user.id),
      );

      if (vendor == null) {
        return {
          'success': false,
          'error': 'Vendor profile not found',
        };
      }

      // Check product limit
      if (vendor.currentProductCount >= vendor.productLimit &&
          vendor.productLimit != -1) {
        return {
          'success': false,
          'error':
              'Product limit reached for your tier. Please upgrade to add more products.',
          'limit_reached': true,
          'upgrade_needed': true,
        };
      }

      // Start creation session
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
        'in_creation_flow': true,
        'message': await _getInitialPrompt(vendor.subscriptionTier),
      };
    } catch (e, stackTrace) {
      session.log('Initiate creation error: $e', stackTrace: stackTrace);
      return {
        'success': false,
        'error': e.toString(),
      };
    }
  }

  /// Process message during product creation flow
  /// This enforces strict state-based input validation
  Future<Map<String, dynamic>> processCreationMessage(
    Session session, {
    required User user,
    required Conversation conversation,
    required Message message,
    required PlatformType platform,
  }) async {
    try {
      // Get current session
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

      // Check for timeout
      if (_isSessionExpired(creationSession)) {
        await _handleTimeout(
            session, conversation.id.uuid, creationSession, user);
        return {
          'success': false,
          'in_creation_flow': false,
          'error': 'Product creation session expired. Progress saved as draft.',
          'session_expired': true,
        };
      }

      // Check for cancel command (always allowed)
      if (_isCancelCommand(message.content)) {
        return await _handleCancellation(
          session,
          conversation.id.uuid,
          creationSession,
          user,
          platform,
        );
      }

      // Route to state-specific handler
      return await _handleStateMessage(
        session,
        user: user,
        conversation: conversation,
        message: message,
        creationSession: creationSession,
        platform: platform,
      );
    } catch (e, stackTrace) {
      session.log('Process creation message error: $e', stackTrace: stackTrace);
      return {
        'success': false,
        'in_creation_flow': true,
        'error': 'An error occurred. Type "/cancel" to exit or try again.',
      };
    }
  }

  // ==================== STATE-SPECIFIC HANDLERS ====================

  Future<Map<String, dynamic>> _handleStateMessage(
    Session session, {
    required User user,
    required Conversation conversation,
    required Message message,
    required ProductCreationSession creationSession,
    required PlatformType platform,
  }) async {
    switch (creationSession.state) {
      case ProductCreationState.AWAITING_IMAGES:
        return await _handleImagesState(
          session,
          user,
          conversation,
          message,
          creationSession,
          platform,
        );

      case ProductCreationState.AWAITING_VIDEO:
        return await _handleVideoState(
          session,
          user,
          conversation,
          message,
          creationSession,
          platform,
        );

      case ProductCreationState.AWAITING_NAME:
        return await _handleNameState(
          session,
          conversation,
          message,
          creationSession,
        );

      case ProductCreationState.AWAITING_DESCRIPTION:
        return await _handleDescriptionState(
          session,
          conversation,
          message,
          creationSession,
        );

      case ProductCreationState.AWAITING_PRICE:
        return await _handlePriceState(
          session,
          conversation,
          message,
          creationSession,
        );

      case ProductCreationState.AWAITING_CATEGORY:
        return await _handleCategoryState(
          session,
          conversation,
          message,
          creationSession,
        );

      case ProductCreationState.AWAITING_AI_DESCRIPTION_CHOICE:
        return await _handleAiDescriptionChoice(
          session,
          conversation,
          message,
          creationSession,
        );

      case ProductCreationState.AWAITING_AI_IMAGE_CHOICE:
        return await _handleAiImageChoice(
          session,
          conversation,
          message,
          creationSession,
        );

      case ProductCreationState.AWAITING_OPTIONAL_DETAILS:
        return await _handleOptionalDetails(
          session,
          conversation,
          message,
          creationSession,
        );

      case ProductCreationState.PROCESSING:
        return {
          'success': false,
          'in_creation_flow': true,
          'blocked': true,
          'message': '⚙️ Product is being created. Please wait...',
        };

      default:
        return {
          'success': false,
          'error': 'Invalid state',
        };
    }
  }

  /// Handle AWAITING_IMAGES state - STRICT: Only images or "done" allowed
  Future<Map<String, dynamic>> _handleImagesState(
    Session session,
    User user,
    Conversation conversation,
    Message message,
    ProductCreationSession creationSession,
    PlatformType platform,
  ) async {
    final content = message.content.toLowerCase().trim();

    // Allow "done" only if minimum images met
    if (content == 'done' || content == 'next' || content == 'continue') {
      if (!creationSession.hasMinimumImages) {
        return {
          'success': false,
          'in_creation_flow': true,
          'blocked': true,
          'state': 'awaiting_images',
          'message': '''
❌ You need at least ${ProductCreationConfig.minImages} image to continue.

📸 Please send product images first.

Type "/cancel" to exit.
''',
        };
      }

      return await _proceedToNextState(
        session,
        conversation.id.uuid,
        creationSession,
        user,
      );
    }

    // REJECT all non-image inputs
    if (message.messageType != MessageType.image || message.mediaUrl == null) {
      return {
        'success': false,
        'in_creation_flow': true,
        'blocked': true,
        'state': 'awaiting_images',
        'requires_image': true,
        'message': '''
📸 **Product Images Required** (${creationSession.imageCount}/${ProductCreationConfig.maxImages})

❌ Only image uploads are accepted right now.

${creationSession.hasMinimumImages ? '✅ You have enough images. Type "done" to continue.\n   Or send more images (up to ${ProductCreationConfig.maxImages} total).' : '⚠️  Send at least ${ProductCreationConfig.minImages} image to proceed.'}

💡 Type "/cancel" to exit product creation.
''',
      };
    }

    // Process image
    final mediaId = message.platformMessageId ?? message.mediaUrl!;

    // Add to session
    creationSession.imageMediaIds.add(mediaId);
    creationSession.lastUpdatedAt = DateTime.now();

    await _saveSession(session, conversation, creationSession);

    // Download and process image (background)
    if (mediaService != null) {
      _processMediaInBackground(
        session,
        mediaId: mediaId,
        platform: platform,
        vendorId: user.id,
        isVideo: false,
      );
    }

    // Check if reached maximum
    if (creationSession.imageCount >= ProductCreationConfig.maxImages) {
      // Auto-proceed
      return await _proceedToNextState(
        session,
        conversation.id.uuid,
        creationSession,
        user,
      );
    }

    // Prompt for more or continue
    return {
      'success': true,
      'in_creation_flow': true,
      'state': 'awaiting_images',
      'images_collected': creationSession.imageCount,
      'message': '''
✅ Image ${creationSession.imageCount}/${ProductCreationConfig.maxImages} received!

${creationSession.canAddMoreImages ? '📸 Send more images or type "done" to continue.' : '✅ Maximum ${ProductCreationConfig.maxImages} images reached. Type "done" to continue.'}
''',
    };
  }

  /// Handle AWAITING_VIDEO state (Pro+ only) - STRICT: Only video or "skip"
  Future<Map<String, dynamic>> _handleVideoState(
    Session session,
    User user,
    Conversation conversation,
    Message message,
    ProductCreationSession creationSession,
    PlatformType platform,
  ) async {
    final content = message.content.toLowerCase().trim();

    // Allow skip
    if (content == 'skip' || content == 'no' || content == 'next') {
      return await _proceedToNextState(
        session,
        conversation.id.uuid,
        creationSession,
        user,
      );
    }

    // Accept video only
    if (message.messageType == MessageType.video && message.mediaUrl != null) {
      final mediaId = message.platformMessageId ?? message.mediaUrl!;
      creationSession.videoMediaId = mediaId;
      creationSession.lastUpdatedAt = DateTime.now();

      await _saveSession(session, conversation, creationSession);

      // Process video in background
      if (mediaService != null) {
        _processMediaInBackground(
          session,
          mediaId: mediaId,
          platform: platform,
          vendorId: user.id,
          isVideo: true,
        );
      }

      return await _proceedToNextState(
        session,
        conversation.id.uuid,
        creationSession,
        user,
      );
    }

    // REJECT other inputs
    return {
      'success': false,
      'in_creation_flow': true,
      'blocked': true,
      'state': 'awaiting_video',
      'requires_video_or_skip': true,
      'message': '''
🎥 **Product Video** (Optional)

❌ Only video uploads or "skip" are accepted.

📹 Send a video to showcase your product
   OR
⏭️  Type "skip" to continue without video

💡 Type "/cancel" to exit product creation.
''',
    };
  }

  /// Handle AWAITING_NAME state - STRICT: Text only
  Future<Map<String, dynamic>> _handleNameState(
    Session session,
    Conversation conversation,
    Message message,
    ProductCreationSession creationSession,
  ) async {
    // Only accept text
    if (message.messageType != MessageType.text) {
      return {
        'success': false,
        'in_creation_flow': true,
        'blocked': true,
        'state': 'awaiting_name',
        'message': '''
🏷️ **Product Name Required**

❌ Please send a text message with the product name.

No images or other media accepted here.

💡 Type "/cancel" to exit.
''',
      };
    }

    final name = message.content.trim();

    // Validate name
    if (name.length < 3) {
      creationSession.attemptCount++;
      await _saveSession(session, conversation, creationSession);

      return {
        'success': false,
        'in_creation_flow': true,
        'state': 'awaiting_name',
        'message': '''
❌ Product name must be at least 3 characters.

Please try again (Attempt ${creationSession.attemptCount}/5)

${creationSession.attemptCount >= 3 ? '\n💡 Type "/cancel" to exit and save as draft.' : ''}
''',
      };
    }

    if (name.length > 200) {
      return {
        'success': false,
        'in_creation_flow': true,
        'state': 'awaiting_name',
        'message':
            '❌ Product name is too long (max 200 characters). Please shorten it.',
      };
    }

    creationSession.name = name;
    creationSession.attemptCount = 0;

    return await _proceedToNextState(
      session,
      conversation.id.uuid,
      creationSession,
      null,
    );
  }

  /// Handle AWAITING_DESCRIPTION state - STRICT: Text only
  Future<Map<String, dynamic>> _handleDescriptionState(
    Session session,
    Conversation conversation,
    Message message,
    ProductCreationSession creationSession,
  ) async {
    if (message.messageType != MessageType.text) {
      return {
        'success': false,
        'in_creation_flow': true,
        'blocked': true,
        'state': 'awaiting_description',
        'message': '''
📝 **Product Description Required**

❌ Please send a text description.

No images or other media accepted here.

💡 Type "/cancel" to exit.
''',
      };
    }

    final description = message.content.trim();

    if (description.length < 10) {
      creationSession.attemptCount++;
      await _saveSession(session, conversation, creationSession);

      return {
        'success': false,
        'in_creation_flow': true,
        'state': 'awaiting_description',
        'message': '''
❌ Description must be at least 10 characters.

Please provide more details (Attempt ${creationSession.attemptCount}/5)

${creationSession.attemptCount >= 3 ? '\n💡 Type "/cancel" to exit and save as draft.' : ''}
''',
      };
    }

    creationSession.description = description;
    creationSession.attemptCount = 0;

    return await _proceedToNextState(
      session,
      conversation.id.uuid,
      creationSession,
      null,
    );
  }

  /// Handle AWAITING_PRICE state - STRICT: Number only
  Future<Map<String, dynamic>> _handlePriceState(
    Session session,
    Conversation conversation,
    Message message,
    ProductCreationSession creationSession,
  ) async {
    if (message.messageType != MessageType.text) {
      return {
        'success': false,
        'in_creation_flow': true,
        'blocked': true,
        'state': 'awaiting_price',
        'message': '''
💰 **Price Required**

❌ Please send the price as a number.

Examples: 5000, 15000.50, 25,000

💡 Type "/cancel" to exit.
''',
      };
    }

    // Extract number
    final priceMatch = RegExp(r'[\d,]+\.?\d*').firstMatch(message.content);

    if (priceMatch == null) {
      creationSession.attemptCount++;
      await _saveSession(session, conversation, creationSession);

      return {
        'success': false,
        'in_creation_flow': true,
        'state': 'awaiting_price',
        'message': '''
❌ I couldn't understand the price.

Please enter a valid number:
• 5000
• 15000.50
• 25,000

Attempt ${creationSession.attemptCount}/5

${creationSession.attemptCount >= 3 ? '\n💡 Type "/cancel" to exit and save as draft.' : ''}
''',
      };
    }

    final priceStr = priceMatch.group(0)!.replaceAll(',', '');
    final price = double.tryParse(priceStr);

    if (price == null || price <= 0) {
      return {
        'success': false,
        'in_creation_flow': true,
        'state': 'awaiting_price',
        'message': '❌ Price must be greater than 0. Please try again.',
      };
    }

    if (price > 10000000) {
      return {
        'success': false,
        'in_creation_flow': true,
        'state': 'awaiting_price',
        'message': '❌ Price seems too high (max ₦10,000,000). Please verify.',
      };
    }

    creationSession.price = price;
    creationSession.attemptCount = 0;

    return await _proceedToNextState(
      session,
      conversation.id.uuid,
      creationSession,
      null,
    );
  }

  /// Handle AWAITING_CATEGORY state - STRICT: Text only
  Future<Map<String, dynamic>> _handleCategoryState(
    Session session,
    Conversation conversation,
    Message message,
    ProductCreationSession creationSession,
  ) async {
    if (message.messageType != MessageType.text) {
      return {
        'success': false,
        'in_creation_flow': true,
        'blocked': true,
        'state': 'awaiting_category',
        'message': '''
📂 **Category Required**

❌ Please send a text message with the category.

Examples: Electronics, Fashion, Home & Garden

💡 Type "/cancel" to exit.
''',
      };
    }

    final category = message.content.trim();

    if (category.length < 2) {
      return {
        'success': false,
        'in_creation_flow': true,
        'state': 'awaiting_category',
        'message':
            '❌ Please enter a valid category (e.g., Electronics, Fashion, etc.)',
      };
    }

    creationSession.category = category;
    creationSession.attemptCount = 0;

    return await _proceedToNextState(
      session,
      conversation.id.uuid,
      creationSession,
      null,
    );
  }

  /// Handle AI description choice - STRICT: Yes/No only
  Future<Map<String, dynamic>> _handleAiDescriptionChoice(
    Session session,
    Conversation conversation,
    Message message,
    ProductCreationSession creationSession,
  ) async {
    if (message.messageType != MessageType.text) {
      return {
        'success': false,
        'in_creation_flow': true,
        'blocked': true,
        'state': 'awaiting_ai_description_choice',
        'message': '❌ Please reply with text: "yes" or "no".',
      };
    }

    final content = message.content.toLowerCase().trim();

    if (content == 'yes' || content == 'y') {
      creationSession.useAiDescription = true;
    } else if (content == 'no' || content == 'n' || content == 'skip') {
      creationSession.useAiDescription = false;
    } else {
      return {
        'success': false,
        'in_creation_flow': true,
        'blocked': true,
        'state': 'awaiting_ai_description_choice',
        'message': '❌ Please reply "yes" or "no".',
      };
    }

    return await _proceedToNextState(
      session,
      conversation.id.uuid,
      creationSession,
      null,
    );
  }

  /// Handle AI image choice - STRICT: Yes/No only
  Future<Map<String, dynamic>> _handleAiImageChoice(
    Session session,
    Conversation conversation,
    Message message,
    ProductCreationSession creationSession,
  ) async {
    if (message.messageType != MessageType.text) {
      return {
        'success': false,
        'in_creation_flow': true,
        'blocked': true,
        'state': 'awaiting_ai_image_choice',
        'message': '❌ Please reply with text: "yes" or "no".',
      };
    }

    final content = message.content.toLowerCase().trim();

    if (content == 'yes' || content == 'y') {
      creationSession.useAiImages = true;
    } else if (content == 'no' || content == 'n' || content == 'skip') {
      creationSession.useAiImages = false;
    } else {
      return {
        'success': false,
        'in_creation_flow': true,
        'blocked': true,
        'state': 'awaiting_ai_image_choice',
        'message': '❌ Please reply "yes" or "no".',
      };
    }

    return await _proceedToNextState(
      session,
      conversation.id.uuid,
      creationSession,
      null,
    );
  }

  /// Handle optional details - FLEXIBLE: Can skip
  Future<Map<String, dynamic>> _handleOptionalDetails(
    Session session,
    Conversation conversation,
    Message message,
    ProductCreationSession creationSession,
  ) async {
    final content = message.content.toLowerCase().trim();

    if (content == 'skip' || content == 'done' || content == 'finish') {
      return await _proceedToNextState(
        session,
        conversation.id.uuid,
        creationSession,
        null,
      );
    }

    // Parse optional details
    _parseOptionalDetails(message.content, creationSession);
    await _saveSession(session, conversation, creationSession);

    return {
      'success': true,
      'in_creation_flow': true,
      'state': 'awaiting_optional_details',
      'message': '''
✅ Details saved!

Add more details or type "done" to finish.
''',
    };
  }

  // ==================== STATE TRANSITIONS ====================

  Future<Map<String, dynamic>> _proceedToNextState(
    Session session,
    String conversationId,
    ProductCreationSession creationSession,
    User? user,
  ) async {
    final conversation = await _getConversation(session, conversationId);

    switch (creationSession.state) {
      case ProductCreationState.AWAITING_IMAGES:
        // Check tier for video option
        if (creationSession.tier != SubscriptionTier.freemium) {
          creationSession.state = ProductCreationState.AWAITING_VIDEO;
          await _saveSession(session, conversation, creationSession);

          return {
            'success': true,
            'in_creation_flow': true,
            'state': 'awaiting_video',
            'message': '''
🎥 Would you like to add a product video? (Optional - ${creationSession.tier.name} feature)

Videos help customers see your product in action!

📹 Send a video OR type "skip" to continue.
''',
          };
        }
        // Freemium: skip video
        creationSession.state = ProductCreationState.AWAITING_NAME;
        await _saveSession(session, conversation, creationSession);
        return _getNextStateMessage(creationSession);

      case ProductCreationState.AWAITING_VIDEO:
        // Check for AI options
        if (creationSession.tier != SubscriptionTier.freemium) {
          creationSession.state =
              ProductCreationState.AWAITING_AI_DESCRIPTION_CHOICE;
          await _saveSession(session, conversation, creationSession);
          return _getNextStateMessage(creationSession);
        }
        creationSession.state = ProductCreationState.AWAITING_NAME;
        await _saveSession(session, conversation, creationSession);
        return _getNextStateMessage(creationSession);

      case ProductCreationState.AWAITING_AI_DESCRIPTION_CHOICE:
        // Pro Max: offer AI images
        if (creationSession.tier == SubscriptionTier.pro_max) {
          creationSession.state = ProductCreationState.AWAITING_AI_IMAGE_CHOICE;
          await _saveSession(session, conversation, creationSession);
          return _getNextStateMessage(creationSession);
        }
        creationSession.state = ProductCreationState.AWAITING_NAME;
        await _saveSession(session, conversation, creationSession);
        return _getNextStateMessage(creationSession);

      case ProductCreationState.AWAITING_AI_IMAGE_CHOICE:
      case ProductCreationState.AWAITING_NAME:
      case ProductCreationState.AWAITING_DESCRIPTION:
      case ProductCreationState.AWAITING_PRICE:
      case ProductCreationState.AWAITING_CATEGORY:
        creationSession.state = _getNextRequiredState(creationSession.state);
        await _saveSession(session, conversation, creationSession);
        return _getNextStateMessage(creationSession);

      case ProductCreationState.AWAITING_OPTIONAL_DETAILS:
        // Ready to create
        creationSession.state = ProductCreationState.PROCESSING;
        await _saveSession(session, conversation, creationSession);

        return {
          'success': true,
          'in_creation_flow': true,
          'state': 'processing',
          'ready_to_create': true,
          'session_data': creationSession.toJson(),
          'message': '⚙️ Creating your product...',
        };

      default:
        return {
          'success': false,
          'error': 'Invalid state transition',
        };
    }
  }

  ProductCreationState _getNextRequiredState(ProductCreationState current) {
    final stateOrder = [
      ProductCreationState.AWAITING_AI_IMAGE_CHOICE,
      ProductCreationState.AWAITING_NAME,
      ProductCreationState.AWAITING_DESCRIPTION,
      ProductCreationState.AWAITING_PRICE,
      ProductCreationState.AWAITING_CATEGORY,
      ProductCreationState.AWAITING_OPTIONAL_DETAILS,
    ];

    final currentIndex = stateOrder.indexOf(current);
    if (currentIndex >= 0 && currentIndex < stateOrder.length - 1) {
      return stateOrder[currentIndex + 1];
    }

    return ProductCreationState.AWAITING_OPTIONAL_DETAILS;
  }

  Map<String, dynamic> _getNextStateMessage(ProductCreationSession session) {
    final messages = {
      ProductCreationState.AWAITING_AI_DESCRIPTION_CHOICE: '''
✨ **${session.tier.name.toUpperCase()} Feature**

Use AI to enhance your product description?

AI can make your description more professional and appealing!

Reply "yes" or "no".
''',
      ProductCreationState.AWAITING_AI_IMAGE_CHOICE: '''
✨ **PRO MAX Feature**

Generate additional AI product images?

This can help showcase your product from multiple angles!

Reply "yes" or "no".
''',
      ProductCreationState.AWAITING_NAME: '''
🏷️ **Product Name**

Enter a clear, descriptive name for your product.

Example: "Samsung Galaxy S24 - 256GB"
''',
      ProductCreationState.AWAITING_DESCRIPTION: '''
📝 **Product Description**

Describe your product in detail:
• Features
• Benefits  
• Materials
• What makes it special

${session.useAiDescription ? '\n✨ AI will enhance this description!' : ''}
''',
      ProductCreationState.AWAITING_PRICE: '''
💰 **Selling Price**

Enter the price in Nigerian Naira (₦)

Examples: 5000, 15000.50, 25,000
''',
      ProductCreationState.AWAITING_CATEGORY: '''
📂 **Product Category**

What category does this product belong to?

Examples: 
• Electronics
• Fashion  
• Home & Garden
• Beauty & Personal Care
• Sports & Outdoors
''',
      ProductCreationState.AWAITING_OPTIONAL_DETAILS: '''
✨ **Optional Details** (or type "done")

You can add:
• Colors: "Available in Red, Blue, Green"
• Sizes: "Sizes: S, M, L, XL"
• Brand name
• Stock quantity
• Weight

Type "done" to finish and create the product.
''',
    };

    return {
      'success': true,
      'in_creation_flow': true,
      'state': session.state.name.toLowerCase(),
      'message': messages[session.state] ?? 'Continue...',
    };
  }

  /// Handle cancellation with draft save
  Future<Map<String, dynamic>> _handleCancellation(
    Session session,
    String conversationId,
    ProductCreationSession creationSession,
    User user,
    PlatformType platform,
  ) async {
    // Save as draft if has minimum data
    Product? draftProduct;

    if (creationSession.hasMinimumImages) {
      draftProduct = await _saveToDraft(session, user, creationSession);
    }

    // Clear session
    await stateManager.cancelCreation(session, conversationId);

    if (draftProduct != null) {
      return {
        'success': true,
        'cancelled': true,
        'in_creation_flow': false,
        'saved_to_draft': true,
        'draft_id': draftProduct.id.uuid,
        'message': '''
❌ **Product Creation Cancelled**

✅ Your progress has been saved as a draft:
   "${draftProduct.name}"

You can resume later by editing this draft or start a new product.
''',
      };
    }

    return {
      'success': true,
      'cancelled': true,
      'in_creation_flow': false,
      'message': '''
❌ **Product Creation Cancelled**

No progress was saved (insufficient data).

Type "add product" to start over.
''',
    };
  }

  /// Handle session timeout with auto-save
  Future<void> _handleTimeout(
    Session session,
    String conversationId,
    ProductCreationSession creationSession,
    User user,
  ) async {
    // Auto-save as draft
    if (creationSession.hasMinimumImages) {
      await _saveToDraft(session, user, creationSession);
    }

    // Clear session
    await stateManager.cancelCreation(session, conversationId);
  }

  /// Save incomplete product as draft
  Future<Product?> _saveToDraft(
    Session session,
    User user,
    ProductCreationSession productSession,
  ) async {
    try {
      final productId = Uuid().v4obj();

      final product = Product(
        id: productId,
        vendorId: user.id,
        name: productSession.name ??
            'Draft Product ${DateTime.now().day}/${DateTime.now().month}',
        description: productSession.description ?? 'Product in progress',
        category: productSession.category ?? 'Uncategorized',
        basePrice: productSession.price ?? 0,
        quantity: productSession.quantity ?? 0,
        images: [], // Will be populated after media processing
        status: ProductStatus.draft,
        isActive: false,
        whatsappMediaIds: productSession.platform == PlatformType.whatsapp
            ? productSession.imageMediaIds
            : null,
        telegramFileIds: productSession.platform == PlatformType.telegram
            ? productSession.imageMediaIds
            : null,
        cdnUploadStatus:
            ProductCreationConfig.useCDN ? 'pending' : 'not_required',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      return await Product.db.insertRow(session, product);
    } catch (e) {
      session.log('Save to draft error: $e');
      return null;
    }
  }

  // ==================== MEDIA PROCESSING ====================

  /// Process media in background (non-blocking)
  // In _processMediaInBackground()

  void _processMediaInBackground(
    Session session, {
    required String mediaId,
    required PlatformType platform,
    required UuidValue vendorId,
    required bool isVideo,
    String? productId,
  }) {
    if (mediaService == null) {
      session.log('⚠️ Media service not available');
      return;
    }

    Future(() async {
      try {
        session.log('📸 Processing media: $mediaId (video: $isVideo)');

        if (ProductCreationConfig.useCDN) {
          // CDN MODE: Upload to cloud storage
          final result = await mediaService!.processProductMedia(
            session,
            mediaId: mediaId,
            platform: platform,
            vendorId: vendorId,
            productId: productId != null
                ? UuidValue.fromString(productId)
                : Uuid().v4obj(),
            isVideo: isVideo,
          );

          if (result['success']) {
            session.log('✅ Media uploaded to CDN: ${result['cdn_url']}');
          } else {
            session.log('❌ CDN upload failed: ${result['error']}');
          }
        } else {
          // DATABASE MODE: Store media ID reference
          session.log('💾 Media ID stored for database: $mediaId');
          // The platform media ID will be stored in Product table
          // and fetched on-demand when needed
        }
      } catch (e, stackTrace) {
        session.log('❌ Background media processing error: $e');
        session.log('Stack trace', stackTrace: stackTrace);
      }
    });
  }

  // ==================== HELPERS ====================

  Future<String> _getInitialPrompt(SubscriptionTier tier) async {
    return '''
🎨 **Start Product Creation**

Let's create your product listing!

📸 **Step 1: Product Images**

Send ${ProductCreationConfig.minImages}-${ProductCreationConfig.maxImages} product images.

${tier != SubscriptionTier.freemium ? '✨ ${tier.name.toUpperCase()} features available:\n   • Video upload\n   • AI-enhanced descriptions\n${tier == SubscriptionTier.pro_max ? '   • AI-generated images\n' : ''}' : ''}

💡 You can type "/cancel" anytime to save progress and exit.

Send your first image now! 📸
''';
  }

  bool _isCancelCommand(String message) {
    final content = message.toLowerCase().trim();
    return content == '/cancel' ||
        content == 'cancel' ||
        content == 'exit' ||
        content == 'stop' ||
        content == 'quit';
  }

  bool _isSessionExpired(ProductCreationSession session) {
    final now = DateTime.now();
    final elapsed = now.difference(session.lastUpdatedAt);
    return elapsed.inMinutes > ProductCreationConfig.sessionTimeoutMinutes;
  }

  void _parseOptionalDetails(String message, ProductCreationSession session) {
    final content = message.toLowerCase();

    // Extract colors
    if (content.contains('color') || content.contains('available in')) {
      final colorMatch = RegExp(r'(?:color|available in)[:\s]+(.+?)(?:\n|$)',
              caseSensitive: false)
          .firstMatch(message);
      if (colorMatch != null) {
        final colorsStr = colorMatch.group(1)!;
        session.colors = colorsStr
            .split(RegExp(r'[,;]'))
            .map((c) => c.trim())
            .where((c) => c.isNotEmpty)
            .toList();
      }
    }

    // Extract sizes
    if (content.contains('size')) {
      final sizeMatch =
          RegExp(r'size[s]?[:\s]+(.+?)(?:\n|$)', caseSensitive: false)
              .firstMatch(message);
      if (sizeMatch != null) {
        final sizesStr = sizeMatch.group(1)!;
        session.sizes = sizesStr
            .split(RegExp(r'[,;]'))
            .map((s) => s.trim())
            .where((s) => s.isNotEmpty)
            .toList();
      }
    }

    // Extract brand
    if (content.contains('brand')) {
      final brandMatch = RegExp(r'brand[:\s]+([^\n]+)', caseSensitive: false)
          .firstMatch(message);
      if (brandMatch != null) {
        session.brand = brandMatch.group(1)!.trim();
      }
    }

    // Extract quantity
    if (content.contains('stock') || content.contains('quantity')) {
      final qtyMatch =
          RegExp(r'(?:stock|quantity)[:\s]+(\d+)', caseSensitive: false)
              .firstMatch(message);
      if (qtyMatch != null) {
        session.quantity = int.tryParse(qtyMatch.group(1)!);
      }
    }

    // Extract weight
    if (content.contains('weight')) {
      final weightMatch =
          RegExp(r'weight[:\s]+([\d.]+)\s*([a-z]*)', caseSensitive: false)
              .firstMatch(message);
      if (weightMatch != null) {
        session.weight = double.tryParse(weightMatch.group(1)!);
        final unit = weightMatch.group(2);
        if (unit != null && unit.isNotEmpty) {
          // session.weightUnit = unit;
        }
      }
    }

    // Extract SKU
    if (content.contains('sku') || content.contains('code')) {
      final skuMatch =
          RegExp(r'(?:sku|code)[:\s]+([^\n]+)', caseSensitive: false)
              .firstMatch(message);
      if (skuMatch != null) {
        session.sku = skuMatch.group(1)!.trim();
      }
    }
  }

  Future<Conversation> _getConversation(
      Session session, String conversationId) async {
    final conversation = await Conversation.db.findById(
      session,
      UuidValue.fromString(conversationId),
    );

    if (conversation == null) {
      throw Exception('Conversation not found');
    }

    return conversation;
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

  /// Complete product creation
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

      if (vendor == null) {
        throw Exception('Vendor profile not found');
      }

      List<String> processedImages = [];
      String? processedVideo;

      if (ProductCreationConfig.useCDN) {
        // CDN MODE: Use CDN URLs
        processedImages = await _getCDNUrls(
          creationSession.imageMediaIds,
          user.id,
        );

        if (creationSession.videoMediaId != null) {
          final videoUrls = await _getCDNUrls(
            [creationSession.videoMediaId!],
            user.id,
          );
          processedVideo = videoUrls.isNotEmpty ? videoUrls.first : null;
        }
      } else {
        // DATABASE MODE: Store platform media IDs
        processedImages = creationSession.imageMediaIds;
        processedVideo = creationSession.videoMediaId;
      }

      // Create product with appropriate media references
      final product = await ProductEndpoint().createProduct(
        session,
        vendorId: user.id,
        name: creationSession.name!,
        description: creationSession.description!,
        category: creationSession.category!,
        basePrice: creationSession.price!,
        quantity: creationSession.quantity ?? 0,
        images: ProductCreationConfig.useCDN ? processedImages : [],
        // whatsappMediaIds: !ProductCreationConfig.useCDN &&
        //         creationSession.platform == PlatformType.whatsapp
        //     ? processedImages
        //     : null,
        // telegramFileIds: !ProductCreationConfig.useCDN &&
        //         creationSession.platform == PlatformType.telegram
        //     ? processedImages
        //     : null,
        color: creationSession.colors,
        size: creationSession.sizes,
        brand: creationSession.brand,
        material: creationSession.material,
        weight: creationSession.weight,
        sku: creationSession.sku,
        isAiGenerated: creationSession.useAiDescription,
        status: ProductStatus.active,
      );

      if (product == null) {
        throw Exception('Failed to create product');
      }

      // ========== PUSH TO META CATALOG (BACKGROUND) ==========
      _pushToMetaCatalogBackground(session, product, vendor);

      // Mark as completed
      creationSession.state = ProductCreationState.COMPLETED;
      await _saveSession(session, conversation, creationSession);

      // Clear session after delay
      Future.delayed(Duration(seconds: 5), () async {
        await stateManager.cancelCreation(session, conversation.id.uuid);
      });

      return {
        'success': true,
        'product_id': product.id.uuid,
        'product': product,
        'message': _buildSuccessMessage(product, creationSession),
      };
    } catch (e, stackTrace) {
      session.log('❌ Complete product creation error: $e',
          stackTrace: stackTrace);

      return {
        'success': false,
        'error': 'Failed to create product: ${e.toString()}',
        'message': '''
❌ **Product Creation Failed**

An error occurred while creating your product.

Your progress has been saved. Please try again or contact support.
''',
      };
    }
  }

// Helper to get CDN URLs (placeholder - implement based on your CDN)
  Future<List<String>> _getCDNUrls(
    List<String> mediaIds,
    UuidValue vendorId,
  ) async {
    // Query products or cache to get CDN URLs
    // This is a simplified version
    return mediaIds
        .map((id) => 'https://cdn.asami.com/products/${vendorId.uuid}/$id')
        .toList();
  }

  String _buildSuccessMessage(
    Product product,
    ProductCreationSession session,
  ) {
    return '''
✅ **Product Created Successfully!**

📦 **${product.name}**
💰 Price: ₦${product.basePrice.toStringAsFixed(2)}
📂 Category: ${product.category}
📸 Images: ${session.imageCount}
${product.videoUrl != null ? '🎥 Video: Added\n' : ''}
${session.useAiDescription ? '✨ AI-Enhanced Description\n' : ''}

Storage: ${ProductCreationConfig.useCDN ? '☁️ CDN' : '💾 Database'}

Your product is now ${product.status.name} and visible to customers!

What's next?
- Add more products
- View your inventory (/myproducts)
- Check analytics (/analytics)
''';
  }

  // ========== META CATALOG PUSH (BACKGROUND) ==========

  void _pushToMetaCatalogBackground(
    Session session,
    Product product,
    VendorProfile vendor,
  ) {
    Future(() async {
      try {
        session.log('🔄 Initiating Meta Catalog push for: ${product.name}');

        if (ProductCreationConfig.useCDN) {
          // Wait for CDN upload to complete
          await _waitForCDNUpload(session, product.id);
        }

        // Get Meta service
        final metaService = getIt<MetaCatalogService>();

        // Reload product to get latest data
        final updatedProduct = await Product.db.findById(session, product.id);
        if (updatedProduct == null) {
          session.log('⚠️ Product not found for Meta push');
          return;
        }

        // Check if product has required fields
        if (!_canPushToMeta(updatedProduct)) {
          session.log('⚠️ Product missing required fields for Meta Catalog');
          await _updateMetaStatus(session, product.id, 'failed',
              error: 'Missing required fields (images, description)');
          return;
        }

        // Push to Meta
        final result = await metaService.pushProduct(session, updatedProduct);

        if (result['success']) {
          session.log(
              '✅ Product pushed to Meta Catalog: ${result['meta_product_id']}');
        } else {
          session.log('❌ Meta Catalog push failed: ${result['error']}');
        }
      } catch (e, stackTrace) {
        session.log('❌ Meta Catalog push error: $e', stackTrace: stackTrace);
        await _updateMetaStatus(session, product.id, 'failed',
            error: e.toString());
      }
    });
  }

// Wait for CDN upload to complete
  Future<void> _waitForCDNUpload(Session session, UuidValue productId) async {
    for (int i = 0; i < 10; i++) {
      await Future.delayed(Duration(seconds: 2));

      final product = await Product.db.findById(session, productId);
      if (product?.cdnUploadStatus == 'completed') {
        return;
      }
    }

    session.log('⚠️ CDN upload timeout - proceeding anyway');
  }

// Check if product can be pushed to Meta
  bool _canPushToMeta(Product product) {
    return product.images.isNotEmpty ||
        product.whatsappMediaIds?.isNotEmpty == true ||
        product.telegramFileIds?.isNotEmpty == true;
  }

// Update Meta sync status
  Future<void> _updateMetaStatus(
    Session session,
    UuidValue productId,
    String status, {
    String? error,
  }) async {
    try {
      final product = await Product.db.findById(session, productId);
      if (product == null) return;

      product.metaSyncStatus = status;
      product.metaSyncedAt = DateTime.now();
      if (error != null) {
        product.metaSyncError = error;
      }

      await Product.db.updateRow(session, product);
    } catch (e) {
      session.log('Failed to update Meta status: $e');
    }
  }
}
