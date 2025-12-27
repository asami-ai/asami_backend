// ignore_for_file: constant_identifier_names

import 'dart:convert';
import 'package:serverpod/serverpod.dart';
import '../../generated/protocol.dart';

/// States for product creation flow
enum ProductCreationState {
  IDLE, // Not in creation flow
  AWAITING_IMAGES, // Expecting images (1-5)
  AWAITING_VIDEO, // Expecting video (optional, Pro+)
  AWAITING_NAME, // Expecting product name
  AWAITING_DESCRIPTION, // Expecting description
  AWAITING_PRICE, // Expecting price
  AWAITING_CATEGORY, // Expecting category
  AWAITING_OPTIONAL_DETAILS, // Asking for optional fields
  AWAITING_AI_DESCRIPTION_CHOICE, // Pro+ users: Use AI for description?
  AWAITING_AI_IMAGE_CHOICE, // Pro Max: Generate AI images?
  PROCESSING, // Creating product
  COMPLETED, // Product created
}

/// Product creation session data
class ProductCreationSession {
  ProductCreationState state;
  List<String> imageMediaIds;
  String? videoMediaId;
  PlatformType platform;

  // Product data being collected
  String? name;
  String? description;
  double? price;
  String? category;
  String? subCategory;
  List<String>? colors;
  List<String>? sizes;
  String? brand;
  String? material;
  int? quantity;
  double? weight;
  String? sku;

  // AI options
  bool useAiDescription;
  bool useAiImages;

  // Tier info
  SubscriptionTier tier;

  // Progress tracking
  DateTime startedAt;
  DateTime lastUpdatedAt;
  int attemptCount;

  ProductCreationSession({
    required this.state,
    required this.imageMediaIds,
    required this.platform,
    required this.tier,
    this.videoMediaId,
    this.name,
    this.description,
    this.price,
    this.category,
    this.subCategory,
    this.colors,
    this.sizes,
    this.brand,
    this.material,
    this.quantity,
    this.weight,
    this.sku,
    this.useAiDescription = false,
    this.useAiImages = false,
    DateTime? startedAt,
    DateTime? lastUpdatedAt,
    this.attemptCount = 0,
  })  : startedAt = startedAt ?? DateTime.now(),
        lastUpdatedAt = lastUpdatedAt ?? DateTime.now();

  Map<String, dynamic> toJson() => {
        'state': state.name,
        'image_media_ids': imageMediaIds,
        'video_media_id': videoMediaId,
        'platform': platform.name,
        'name': name,
        'description': description,
        'price': price,
        'category': category,
        'sub_category': subCategory,
        'colors': colors,
        'sizes': sizes,
        'brand': brand,
        'material': material,
        'quantity': quantity,
        'weight': weight,
        'sku': sku,
        'use_ai_description': useAiDescription,
        'use_ai_images': useAiImages,
        'tier': tier.name,
        'started_at': startedAt.toIso8601String(),
        'last_updated_at': lastUpdatedAt.toIso8601String(),
        'attempt_count': attemptCount,
      };

  factory ProductCreationSession.fromJson(Map<String, dynamic> json) {
    return ProductCreationSession(
      state: ProductCreationState.values.firstWhere(
        (s) => s.name == json['state'],
        orElse: () => ProductCreationState.IDLE,
      ),
      imageMediaIds: (json['image_media_ids'] as List?)?.cast<String>() ?? [],
      videoMediaId: json['video_media_id'] as String?,
      platform: PlatformType.values.firstWhere(
        (p) => p.name == json['platform'],
        orElse: () => PlatformType.whatsapp,
      ),
      tier: SubscriptionTier.values.firstWhere(
        (t) => t.name == json['tier'],
        orElse: () => SubscriptionTier.freemium,
      ),
      name: json['name'] as String?,
      description: json['description'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      category: json['category'] as String?,
      subCategory: json['sub_category'] as String?,
      colors: (json['colors'] as List?)?.cast<String>(),
      sizes: (json['sizes'] as List?)?.cast<String>(),
      brand: json['brand'] as String?,
      material: json['material'] as String?,
      quantity: json['quantity'] as int?,
      weight: (json['weight'] as num?)?.toDouble(),
      sku: json['sku'] as String?,
      useAiDescription: json['use_ai_description'] as bool? ?? false,
      useAiImages: json['use_ai_images'] as bool? ?? false,
      startedAt: DateTime.parse(json['started_at'] as String),
      lastUpdatedAt: DateTime.parse(json['last_updated_at'] as String),
      attemptCount: json['attempt_count'] as int? ?? 0,
    );
  }

  bool get hasMinimumImages => imageMediaIds.isNotEmpty;
  bool get hasAllRequiredFields =>
      name != null && description != null && price != null && category != null;

  int get imageCount => imageMediaIds.length;
  bool get canAddMoreImages => imageMediaIds.length < 5;
}

/// Manager for product creation state
class ProductCreationStateManager {
  ProductCreationStateManager();

  /// Start product creation flow
  Future<ProductCreationSession> startProductCreation(
    Session session, {
    required String userId,
    required String conversationId,
    required PlatformType platform,
    required SubscriptionTier tier,
  }) async {
    final conversation = await Conversation.db.findById(
      session,
      UuidValue.fromString(conversationId),
    );

    if (conversation == null) throw Exception('Conversation not found');

    final creationSession = ProductCreationSession(
      state: ProductCreationState.AWAITING_IMAGES,
      imageMediaIds: [],
      platform: platform,
      tier: tier,
    );

    await _saveSession(session, conversation, creationSession);
    return creationSession;
  }

  /// Get current creation session
  Future<ProductCreationSession?> getCurrentSession(
      Session session, String conversationId) async {
    final conversation = await Conversation.db.findById(
      session,
      UuidValue.fromString(conversationId),
    );

    if (conversation?.sessionData == null) return null;

    try {
      final sessionData = jsonDecode(conversation!.sessionData!);
      if (sessionData['product_creation'] == null) return null;

      return ProductCreationSession.fromJson(
        sessionData['product_creation'] as Map<String, dynamic>,
      );
    } catch (e) {
      return null;
    }
  }

  /// Process incoming message based on current state
  Future<Map<String, dynamic>> processMessage(
    Session session, {
    required String conversationId,
    required String messageContent,
    required MessageType messageType,
    String? mediaId,
  }) async {
    final creationSession = await getCurrentSession(session, conversationId);

    if (creationSession == null) {
      return {
        'in_creation_flow': false,
        'message': 'Not in product creation flow',
      };
    }

    // Route to appropriate handler based on state
    switch (creationSession.state) {
      case ProductCreationState.AWAITING_IMAGES:
        return await _handleImageInput(
          session,
          conversationId,
          creationSession,
          messageType,
          mediaId,
          messageContent,
        );

      case ProductCreationState.AWAITING_VIDEO:
        return await _handleVideoInput(
          session,
          conversationId,
          creationSession,
          messageType,
          mediaId,
          messageContent,
        );

      case ProductCreationState.AWAITING_NAME:
        return await _handleNameInput(
          session,
          conversationId,
          creationSession,
          messageContent,
        );

      case ProductCreationState.AWAITING_DESCRIPTION:
        return await _handleDescriptionInput(
          session,
          conversationId,
          creationSession,
          messageContent,
        );

      case ProductCreationState.AWAITING_PRICE:
        return await _handlePriceInput(
          session,
          conversationId,
          creationSession,
          messageContent,
        );

      case ProductCreationState.AWAITING_CATEGORY:
        return await _handleCategoryInput(
          session,
          conversationId,
          creationSession,
          messageContent,
        );

      case ProductCreationState.AWAITING_AI_DESCRIPTION_CHOICE:
        return await _handleAiDescriptionChoice(
          session,
          conversationId,
          creationSession,
          messageContent,
        );

      case ProductCreationState.AWAITING_AI_IMAGE_CHOICE:
        return await _handleAiImageChoice(
          session,
          conversationId,
          creationSession,
          messageContent,
        );

      case ProductCreationState.AWAITING_OPTIONAL_DETAILS:
        return await _handleOptionalDetails(
          session,
          conversationId,
          creationSession,
          messageContent,
        );

      default:
        return {
          'in_creation_flow': true,
          'message': 'Invalid state',
        };
    }
  }

  // ==================== STATE HANDLERS ====================

  Future<Map<String, dynamic>> _handleImageInput(
    Session currentSession,
    String conversationId,
    ProductCreationSession session,
    MessageType messageType,
    String? mediaId,
    String messageContent,
  ) async {
    // Check if user sent an image
    if (messageType == MessageType.image && mediaId != null) {
      session.imageMediaIds.add(mediaId);
      session.lastUpdatedAt = DateTime.now();

      await _saveSession(
        currentSession,
        await _getConversation(currentSession, conversationId),
        session,
      );

      if (session.imageCount >= 5) {
        // Auto-proceed if 5 images collected
        return await _proceedToNextState(
            currentSession, conversationId, session);
      }

      return {
        'in_creation_flow': true,
        'state': 'awaiting_images',
        'images_collected': session.imageCount,
        'message': '''
âœ… Image ${session.imageCount}/5 received!

${session.canAddMoreImages ? 'Send more images or type "done" to continue.' : 'Maximum 5 images reached. Type "done" to continue.'}
''',
        'prompt_for_more': session.canAddMoreImages,
      };
    }

    // Check if user wants to proceed
    final content = messageContent.toLowerCase().trim();
    if (content == 'done' || content == 'next' || content == 'continue') {
      if (!session.hasMinimumImages) {
        return {
          'in_creation_flow': true,
          'state': 'awaiting_images',
          'message': 'âŒ Please send at least 1 image before continuing.',
        };
      }

      return await _proceedToNextState(currentSession, conversationId, session);
    }

    // User sent text when we need images
    return {
      'in_creation_flow': true,
      'state': 'awaiting_images',
      'message': '''
ðŸ"¸ Please send product images (${session.imageCount}/5 images collected)

Send images one by one, or type "done" when finished.
''',
    };
  }

  Future<Map<String, dynamic>> _handleVideoInput(
    Session currentSession,
    String conversationId,
    ProductCreationSession session,
    MessageType messageType,
    String? mediaId,
    String messageContent,
  ) async {
    // Check if user sent a video
    if (messageType == MessageType.video && mediaId != null) {
      session.videoMediaId = mediaId;
      session.lastUpdatedAt = DateTime.now();

      return await _proceedToNextState(currentSession, conversationId, session);
    }

    // Check if user wants to skip
    final content = messageContent.toLowerCase().trim();
    if (content == 'skip' || content == 'no' || content == 'next') {
      return await _proceedToNextState(currentSession, conversationId, session);
    }

    return {
      'in_creation_flow': true,
      'state': 'awaiting_video',
      'message': '''
ðŸŽ¥ Send a product video or type "skip" to continue without video.

Videos help showcase your product better!
''',
    };
  }

  Future<Map<String, dynamic>> _handleNameInput(
    Session currentSession,
    String conversationId,
    ProductCreationSession session,
    String messageContent,
  ) async {
    final name = messageContent.trim();

    if (name.length < 3) {
      session.attemptCount++;
      await _saveSession(currentSession,
          await _getConversation(currentSession, conversationId), session);

      return {
        'in_creation_flow': true,
        'state': 'awaiting_name',
        'message':
            'âŒ Product name must be at least 3 characters. Please try again.',
      };
    }

    if (name.length > 200) {
      return {
        'in_creation_flow': true,
        'state': 'awaiting_name',
        'message':
            'âŒ Product name is too long (max 200 characters). Please shorten it.',
      };
    }

    session.name = name;
    session.attemptCount = 0;

    return await _proceedToNextState(currentSession, conversationId, session);
  }

  Future<Map<String, dynamic>> _handleDescriptionInput(
    Session currentSession,
    String conversationId,
    ProductCreationSession session,
    String messageContent,
  ) async {
    final description = messageContent.trim();

    if (description.length < 10) {
      session.attemptCount++;
      await _saveSession(currentSession,
          await _getConversation(currentSession, conversationId), session);

      return {
        'in_creation_flow': true,
        'state': 'awaiting_description',
        'message':
            'âŒ Description must be at least 10 characters. Please provide more details.',
      };
    }

    session.description = description;
    session.attemptCount = 0;

    return await _proceedToNextState(currentSession, conversationId, session);
  }

  Future<Map<String, dynamic>> _handlePriceInput(
    Session currentSession,
    String conversationId,
    ProductCreationSession session,
    String messageContent,
  ) async {
    // Extract number from message
    final priceMatch = RegExp(r'[\d,]+\.?\d*').firstMatch(messageContent);

    if (priceMatch == null) {
      session.attemptCount++;
      await _saveSession(currentSession,
          await _getConversation(currentSession, conversationId), session);

      return {
        'in_creation_flow': true,
        'state': 'awaiting_price',
        'message': '''
âŒ I couldn't understand the price. Please enter a valid number.

Examples: 5000, 15000.50, 25,000
''',
      };
    }

    final priceStr = priceMatch.group(0)!.replaceAll(',', '');
    final price = double.tryParse(priceStr);

    if (price == null || price <= 0) {
      return {
        'in_creation_flow': true,
        'state': 'awaiting_price',
        'message': 'âŒ Price must be greater than 0. Please try again.',
      };
    }

    if (price > 10000000) {
      return {
        'in_creation_flow': true,
        'state': 'awaiting_price',
        'message': 'âŒ Price seems too high. Please verify and enter again.',
      };
    }

    session.price = price;
    session.attemptCount = 0;

    return await _proceedToNextState(currentSession, conversationId, session);
  }

  Future<Map<String, dynamic>> _handleCategoryInput(
    Session currentSession,
    String conversationId,
    ProductCreationSession session,
    String messageContent,
  ) async {
    final category = messageContent.trim();

    if (category.length < 2) {
      return {
        'in_creation_flow': true,
        'state': 'awaiting_category',
        'message': 'âŒ Please enter a valid category.',
      };
    }

    session.category = category;
    session.attemptCount = 0;

    return await _proceedToNextState(currentSession, conversationId, session);
  }

  Future<Map<String, dynamic>> _handleAiDescriptionChoice(
    Session currentSession,
    String conversationId,
    ProductCreationSession session,
    String messageContent,
  ) async {
    final content = messageContent.toLowerCase().trim();

    if (content == 'yes' || content == 'y' || content.contains('generate')) {
      session.useAiDescription = true;
    } else if (content == 'no' || content == 'n' || content == 'skip') {
      session.useAiDescription = false;
    } else {
      return {
        'in_creation_flow': true,
        'state': 'awaiting_ai_description_choice',
        'message': 'Please reply "yes" or "no".',
      };
    }

    return await _proceedToNextState(currentSession, conversationId, session);
  }

  Future<Map<String, dynamic>> _handleAiImageChoice(
    Session currentSession,
    String conversationId,
    ProductCreationSession session,
    String messageContent,
  ) async {
    final content = messageContent.toLowerCase().trim();

    if (content == 'yes' || content == 'y' || content.contains('generate')) {
      session.useAiImages = true;
    } else if (content == 'no' || content == 'n' || content == 'skip') {
      session.useAiImages = false;
    } else {
      return {
        'in_creation_flow': true,
        'state': 'awaiting_ai_image_choice',
        'message': 'Please reply "yes" or "no".',
      };
    }

    return await _proceedToNextState(currentSession, conversationId, session);
  }

  Future<Map<String, dynamic>> _handleOptionalDetails(
    Session currentSession,
    String conversationId,
    ProductCreationSession session,
    String messageContent,
  ) async {
    final content = messageContent.toLowerCase().trim();

    if (content == 'skip' || content == 'done' || content == 'no') {
      return await _proceedToNextState(currentSession, conversationId, session);
    }

    // Try to parse optional details (colors, sizes, etc.)
    // This is a simple implementation - can be enhanced
    if (content.contains('color')) {
      // Extract colors
    } else if (content.contains('size')) {
      // Extract sizes
    }

    return {
      'in_creation_flow': true,
      'state': 'awaiting_optional_details',
      'message': 'Type "done" when you\'re finished adding optional details.',
    };
  }

  // ==================== STATE TRANSITIONS ====================

  Future<Map<String, dynamic>> _proceedToNextState(
    Session currentSession,
    String conversationId,
    ProductCreationSession session,
  ) async {
    final conversation = await _getConversation(currentSession, conversationId);

    switch (session.state) {
      case ProductCreationState.AWAITING_IMAGES:
        // Check if Pro+ for video option
        if (session.tier != SubscriptionTier.freemium) {
          session.state = ProductCreationState.AWAITING_VIDEO;
          await _saveSession(currentSession, conversation, session);

          return {
            'in_creation_flow': true,
            'state': 'awaiting_video',
            'next_prompt': '''
ðŸŽ¥ Would you like to add a product video? (Optional)

Videos help customers see your product in action!

Send a video or type "skip" to continue.
''',
          };
        }
        // Freemium: skip video, go to AI description check
        session.state = session.tier == SubscriptionTier.freemium
            ? ProductCreationState.AWAITING_NAME
            : ProductCreationState.AWAITING_AI_DESCRIPTION_CHOICE;
        await _saveSession(currentSession, conversation, session);

        return _getNextPrompt(session);

      case ProductCreationState.AWAITING_VIDEO:
        // Pro Max: Offer AI image generation
        if (session.tier == SubscriptionTier.pro_max) {
          session.state = ProductCreationState.AWAITING_AI_IMAGE_CHOICE;
          await _saveSession(currentSession, conversation, session);

          return {
            'in_creation_flow': true,
            'state': 'awaiting_ai_image_choice',
            'next_prompt': '''
✨ **Pro Max Feature**: Generate additional AI product images?

This can help showcase your product from multiple angles!

Reply "yes" or "no".
''',
          };
        }
        // Pro: Go to AI description
        session.state = ProductCreationState.AWAITING_AI_DESCRIPTION_CHOICE;
        await _saveSession(currentSession, conversation, session);
        return _getNextPrompt(session);

      case ProductCreationState.AWAITING_AI_IMAGE_CHOICE:
      case ProductCreationState.AWAITING_AI_DESCRIPTION_CHOICE:
        session.state = ProductCreationState.AWAITING_NAME;
        await _saveSession(currentSession, conversation, session);
        return _getNextPrompt(session);

      case ProductCreationState.AWAITING_NAME:
        session.state = ProductCreationState.AWAITING_DESCRIPTION;
        await _saveSession(currentSession, conversation, session);
        return _getNextPrompt(session);

      case ProductCreationState.AWAITING_DESCRIPTION:
        session.state = ProductCreationState.AWAITING_PRICE;
        await _saveSession(currentSession, conversation, session);
        return _getNextPrompt(session);

      case ProductCreationState.AWAITING_PRICE:
        session.state = ProductCreationState.AWAITING_CATEGORY;
        await _saveSession(currentSession, conversation, session);
        return _getNextPrompt(session);

      case ProductCreationState.AWAITING_CATEGORY:
        session.state = ProductCreationState.AWAITING_OPTIONAL_DETAILS;
        await _saveSession(currentSession, conversation, session);
        return _getNextPrompt(session);

      case ProductCreationState.AWAITING_OPTIONAL_DETAILS:
        session.state = ProductCreationState.PROCESSING;
        await _saveSession(currentSession, conversation, session);

        return {
          'in_creation_flow': true,
          'state': 'processing',
          'ready_to_create': true,
          'session_data': session.toJson(),
          'next_prompt': 'âš™ï¸ Creating your product...',
        };

      default:
        return {
          'in_creation_flow': true,
          'error': 'Invalid state transition',
        };
    }
  }

  Map<String, dynamic> _getNextPrompt(ProductCreationSession session) {
    final prompts = {
      ProductCreationState.AWAITING_NAME: '''
ðŸ·ï¸ What's the product name?

Enter a clear, descriptive name for your product.
''',
      ProductCreationState.AWAITING_DESCRIPTION: '''
ðŸ" Describe your product:

Provide details about features, benefits, materials, etc.
${session.useAiDescription ? '\n(AI will enhance this description)' : ''}
''',
      ProductCreationState.AWAITING_PRICE: '''
ðŸ'° What's the price?

Enter the selling price in NGN (e.g., 5000 or 15,500)
''',
      ProductCreationState.AWAITING_CATEGORY: '''
ðŸ"‚ What category does this belong to?

Examples: Electronics, Fashion, Home & Garden, etc.
''',
      ProductCreationState.AWAITING_OPTIONAL_DETAILS: '''
✨ Add optional details? (or type "done")

You can add:
- Colors (e.g., "Available in: Red, Blue, Green")
- Sizes (e.g., "Sizes: S, M, L, XL")
- Brand name
- SKU or product code
- Weight
- Stock quantity

Type "done" to finish and create the product.
''',
    };

    return {
      'in_creation_flow': true,
      'state': session.state.name.toLowerCase(),
      'next_prompt': prompts[session.state] ?? 'Continue...',
    };
  }

  /// Cancel product creation
  Future<void> cancelCreation(Session session, String conversationId) async {
    final conversation = await _getConversation(session, conversationId);

    if (conversation.sessionData != null) {
      final sessionData = jsonDecode(conversation.sessionData!);
      sessionData.remove('product_creation');
      conversation.sessionData = jsonEncode(sessionData);
      await Conversation.db.updateRow(session, conversation);
    }
  }

  // ==================== HELPERS ====================

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
}
