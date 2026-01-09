// ignore_for_file: constant_identifier_names

import 'dart:convert';
import 'package:serverpod/serverpod.dart';
import '../../generated/protocol.dart';

/// States for product creation flow
/// STREAMLINED: Only 4 states instead of 9
enum ProductCreationState {
  IDLE,
  AWAITING_IMAGES,        // Collect 1-5 images
  AWAITING_DETAILS,       // Get ALL text details at once
  PROCESSING,             // Creating product
  COMPLETED,
}

/// Simplified session with batch detail collection
class ProductCreationSession {
  ProductCreationState state;
  List<String> imageMediaIds;
  String? videoMediaId;
  PlatformType platform;
  SubscriptionTier tier;

  // Product data - ALL collected in one go
  String? name;
  String? description;
  String? shortDescription;
  double? price;
  String? category;
  List<String>? colors;
  List<String>? sizes;
  String? brand;
  int quantity;  // ✅ Now required with default 1

  bool useAiDescription;
  DateTime startedAt;
  DateTime lastUpdatedAt;

  ProductCreationSession({
    required this.state,
    required this.imageMediaIds,
    required this.platform,
    required this.tier,
    this.videoMediaId,
    this.name,
    this.description,
    this.shortDescription,
    this.price,
    this.category,
    this.colors,
    this.sizes,
    this.brand,
    this.quantity = 1,  // ✅ Default to 1, not 0
    this.useAiDescription = false,
    DateTime? startedAt,
    DateTime? lastUpdatedAt,
  })  : startedAt = startedAt ?? DateTime.now(),
        lastUpdatedAt = lastUpdatedAt ?? DateTime.now();

  Map<String, dynamic> toJson() => {
        'state': state.name,
        'image_media_ids': imageMediaIds,
        'video_media_id': videoMediaId,
        'platform': platform.name,
        'tier': tier.name,
        'name': name,
        'description': description,
        'short_description': shortDescription,
        'price': price,
        'category': category,
        'colors': colors,
        'sizes': sizes,
        'brand': brand,
        'quantity': quantity,
        'use_ai_description': useAiDescription,
        'started_at': startedAt.toIso8601String(),
        'last_updated_at': lastUpdatedAt.toIso8601String(),
      };

  factory ProductCreationSession.fromJson(Map<String, dynamic> json) {
    return ProductCreationSession(
      state: ProductCreationState.values.firstWhere(
        (s) => s.name == json['state'],
        orElse: () => ProductCreationState.IDLE,
      ),
      imageMediaIds: (json['image_media_ids'] as List?)?.cast<String>() ?? [],
      videoMediaId: json['video_media_id'],
      platform: PlatformType.values.firstWhere(
        (p) => p.name == json['platform'],
        orElse: () => PlatformType.whatsapp,
      ),
      tier: SubscriptionTier.values.firstWhere(
        (t) => t.name == json['tier'],
        orElse: () => SubscriptionTier.freemium,
      ),
      name: json['name'],
      description: json['description'],
      shortDescription: json['short_description'],
      price: (json['price'] as num?)?.toDouble(),
      category: json['category'],
      colors: (json['colors'] as List?)?.cast<String>(),
      sizes: (json['sizes'] as List?)?.cast<String>(),
      brand: json['brand'],
      quantity: json['quantity'] ?? 1,
      useAiDescription: json['use_ai_description'] ?? false,
      startedAt: DateTime.parse(json['started_at']),
      lastUpdatedAt: DateTime.parse(json['last_updated_at']),
    );
  }

  bool get hasMinimumImages => imageMediaIds.isNotEmpty;
  int get imageCount => imageMediaIds.length;
  bool get hasAllRequiredFields =>
      name != null && description != null && price != null && category != null && quantity > 0;

  bool get canAddMoreImages => imageMediaIds.length < 5;
}

// Simplified state manager
class ProductCreationStateManager {
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

  Future<ProductCreationSession?> getCurrentSession(
    Session session,
    String conversationId,
  ) async {
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

  Future<void> cancelCreation(Session session, String conversationId) async {
    final conversation = await Conversation.db.findById(
      session,
      UuidValue.fromString(conversationId),
    );

    if (conversation?.sessionData != null) {
      final sessionData = jsonDecode(conversation!.sessionData!);
      sessionData.remove('product_creation');
      conversation.sessionData = jsonEncode(sessionData);
      await Conversation.db.updateRow(session, conversation);
    }
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

    await Conversation.db.updateRow(session, conversation);
  }
}