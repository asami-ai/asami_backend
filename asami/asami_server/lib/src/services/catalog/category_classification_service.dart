// File: server/lib/src/services/catalog/category_classification_service.dart

import 'package:serverpod/serverpod.dart';
import '../../generated/protocol.dart';

/// ✅ ENHANCED: Smart category classification with brand recognition & tag generation
class CategoryClassificationService {
  final Session session;

  CategoryClassificationService(this.session);

  /// ✅ Main classification with brand/product recognition
  Future<Map<String, dynamic>> classifyProduct({
    required String productName,
    required String description,
    String? userSelectedCategory,
  }) async {
    try {
      session.log('🤖 Classifying: $productName');

      final text = _normalizeText('$productName $description');
      final tokens = _tokenize(text);

      // ✅ Step 1: Check for known brands FIRST (highest priority)
      final brandMatch = _matchKnownBrandsAndProducts(productName, description);
      
      String aiCategory;
      double confidence;
      List<String> matchedKeywords;
      List<String> suggestedTags;

      if (brandMatch != null) {
        aiCategory = brandMatch['category'];
        confidence = 0.98;
        matchedKeywords = [brandMatch['matched_term']];
        suggestedTags = brandMatch['tags'];
        
        session.log('✅ Brand match: ${brandMatch['matched_term']} → $aiCategory');
      } else {
        final aiClassification = _aiClassifyWithConfidence(tokens, text);
        aiCategory = aiClassification['category'];
        confidence = aiClassification['confidence'];
        matchedKeywords = aiClassification['matched_keywords'];
        suggestedTags = _generateTags(productName, description, aiCategory);
      }

      // Get category (prefer user's choice if valid, else AI)
      final finalCategory = userSelectedCategory ?? aiCategory;
      
      final simpleCategory = await _getOrCreateCategory(session, finalCategory);
      if (simpleCategory == null) {
        return {'success': false, 'error': 'Could not determine category'};
      }

      final facebookCategory = _mapToFacebookCategory(
        simpleCategory: simpleCategory.name,
        productName: productName,
        tokens: tokens,
      );

      final googleTaxonomy = _mapToGoogleTaxonomy(
        simpleCategory: simpleCategory.name,
        productName: productName,
        tokens: tokens,
      );

      return {
        'success': true,
        'simple_category': simpleCategory.name,
        'simple_category_id': simpleCategory.id.uuid,
        'facebook_category_id': facebookCategory['id'].toString(),
        'facebook_category_name': facebookCategory['name'],
        'google_taxonomy_id': googleTaxonomy['id'],
        'google_taxonomy_path': googleTaxonomy['path'],
        'confidence': confidence,
        'matched_keywords': matchedKeywords,
        'suggested_tags': suggestedTags,
      };
    } catch (e, stackTrace) {
      session.log('❌ Classification error: $e', stackTrace: stackTrace);
      return {'success': false, 'error': e.toString()};
    }
  }

  /// ✅ Match known brands/products (highest priority)
  Map<String, dynamic>? _matchKnownBrandsAndProducts(
    String productName,
    String description,
  ) {
    final text = '$productName $description'.toLowerCase();

    final brandDatabase = {
      // Beauty & Personal Care
      'vaseline': {'category': 'Beauty & Personal Care', 'tags': ['skincare', 'moisturizer', 'petroleum jelly', 'body care']},
      'nivea': {'category': 'Beauty & Personal Care', 'tags': ['skincare', 'lotion', 'cream', 'body care']},
      'dove': {'category': 'Beauty & Personal Care', 'tags': ['soap', 'body wash', 'skincare', 'hygiene']},
      'olay': {'category': 'Beauty & Personal Care', 'tags': ['skincare', 'anti-aging', 'face cream']},
      'loreal': {'category': 'Beauty & Personal Care', 'tags': ['cosmetics', 'makeup', 'haircare']},
      'maybelline': {'category': 'Beauty & Personal Care', 'tags': ['makeup', 'cosmetics', 'lipstick']},
      'mac': {'category': 'Beauty & Personal Care', 'tags': ['makeup', 'professional', 'cosmetics']},
      'clinique': {'category': 'Beauty & Personal Care', 'tags': ['skincare', 'dermatology', 'tested']},
      
      // Electronics
      'apple': {'category': 'Electronics', 'tags': ['tech', 'premium', 'smartphone']},
      'samsung': {'category': 'Electronics', 'tags': ['tech', 'smartphone', 'android', 'electronics']},
      'sony': {'category': 'Electronics', 'tags': ['tech', 'audio', 'camera', 'electronics']},
      'iphone': {'category': 'Electronics', 'tags': ['smartphone', 'apple', 'mobile', 'ios']},
      'galaxy': {'category': 'Electronics', 'tags': ['smartphone', 'samsung', 'android']},
      'airpods': {'category': 'Electronics', 'tags': ['audio', 'wireless', 'earbuds', 'apple']},
      'macbook': {'category': 'Electronics', 'tags': ['laptop', 'apple', 'computer']},
      
      // Fashion
      'nike': {'category': 'Fashion', 'tags': ['sportswear', 'sneakers', 'athletic', 'shoes']},
      'adidas': {'category': 'Fashion', 'tags': ['sportswear', 'sneakers', 'athletic', 'apparel']},
      'zara': {'category': 'Fashion', 'tags': ['clothing', 'fashion', 'trendy', 'apparel']},
      'gucci': {'category': 'Fashion', 'tags': ['luxury', 'designer', 'fashion', 'premium']},
      'puma': {'category': 'Fashion', 'tags': ['sportswear', 'sneakers', 'athletic']},
    };

    for (var entry in brandDatabase.entries) {
      if (text.contains(entry.key)) {
        return {
          'matched_term': entry.key,
          'category': entry.value['category'],
          'tags': entry.value['tags'],
        };
      }
    }

    return null;
  }

  /// ✅ Generate smart tags
  List<String> _generateTags(String productName, String description, String category) {
    final tags = <String>{};
    final text = '$productName $description'.toLowerCase();

    // Add category tag
    tags.add(category.toLowerCase().replaceAll(' & ', '-').replaceAll(' ', '-'));

    // Extract meaningful words
    final commonWords = {
      'the', 'for', 'and', 'with', 'this', 'that', 'from', 'have',
      'are', 'was', 'were', 'been', 'has', 'had', 'will', 'can',
    };

    final words = text.split(RegExp(r'[\s,.\-]+'))
        .where((w) => w.length > 2 && !commonWords.contains(w))
        .take(8)
        .toList();

    tags.addAll(words);

    // Category-specific tags
    if (category == 'Beauty & Personal Care') {
      if (text.contains('cream') || text.contains('lotion')) tags.add('moisturizer');
      if (text.contains('face')) tags.add('facial');
      if (text.contains('skin')) tags.add('skincare');
      if (text.contains('lip')) tags.add('lips');
    } else if (category == 'Electronics') {
      if (text.contains('wireless')) tags.add('bluetooth');
      if (text.contains('charge')) tags.add('charging');
    } else if (category == 'Fashion') {
      if (text.contains('cotton')) tags.add('fabric');
      if (text.contains('men')) tags.add('mens');
      if (text.contains('women')) tags.add('womens');
    }

    return tags.take(15).toList();
  }

  String _normalizeText(String text) {
    return text.toLowerCase()
        .replaceAll(RegExp(r'[^\w\s]'), ' ')
        .replaceAll(RegExp(r'\s+'), ' ')
        .trim();
  }

  List<String> _tokenize(String text) {
    return text.split(' ').where((w) => w.length > 2).toList();
  }

  Map<String, dynamic> _aiClassifyWithConfidence(List<String> tokens, String fullText) {
    final rules = _getEnhancedClassificationRules();
    
    double bestConfidence = 0.0;
    String bestCategory = 'Other';
    List<String> matchedKeywords = [];

    for (var rule in rules) {
      final patterns = rule['patterns'] as List<String>;
      final exactMatches = rule['exact_matches'] as List<String>? ?? [];
      
      int matchCount = 0;
      List<String> currentMatches = [];
      
      // Exact phrase matching (highest priority)
      for (var exact in exactMatches) {
        if (fullText.contains(exact)) {
          matchCount += 3;
          currentMatches.add(exact);
        }
      }
      
      // Token matching
      for (var token in tokens) {
        for (var pattern in patterns) {
          if (token.contains(pattern) || pattern.contains(token)) {
            matchCount++;
            currentMatches.add(pattern);
            break;
          }
        }
      }
      
      final baseConfidence = rule['confidence'] as double;
      final matchRatio = matchCount / patterns.length.clamp(1, 999);
      final confidence = (baseConfidence * matchRatio).clamp(0.0, 1.0);
      
      if (confidence > bestConfidence) {
        bestConfidence = confidence;
        bestCategory = rule['category'] as String;
        matchedKeywords = currentMatches;
      }
    }

    if (matchedKeywords.length > 2) {
      bestConfidence = (bestConfidence * 1.2).clamp(0.0, 1.0);
    }

    return {
      'category': bestCategory,
      'confidence': bestConfidence,
      'matched_keywords': matchedKeywords,
    };
  }

  /// ✅ COMPREHENSIVE: Enhanced classification rules
  List<Map<String, dynamic>> _getEnhancedClassificationRules() {
    return [
      {
        'category': 'Electronics',
        'confidence': 0.95,
        'exact_matches': ['smartphone', 'macbook', 'iphone', 'ipad', 'airpods', 'playstation', 'xbox'],
        'patterns': ['phone', 'mobile', 'laptop', 'computer', 'tablet', 'camera', 
                     'headphone', 'earphone', 'earbud', 'speaker', 'smartwatch', 'tv', 'television',
                     'console', 'gaming', 'drone', 'gopro', 'bluetooth', 'wireless',
                     'electronic', 'gadget', 'device', 'tech'],
      },
      {
        'category': 'Fashion',
        'confidence': 0.95,
        'exact_matches': ['t-shirt', 'jeans', 'sneakers', 'high heels'],
        'patterns': ['shirt', 'tshirt', 'dress', 'trouser', 'pant', 'jean', 'skirt', 'shoe',
                     'sneaker', 'sandal', 'boot', 'heel', 'bag', 'handbag', 'purse', 
                     'clothing', 'apparel', 'fashion', 'wear', 'outfit',
                     'suit', 'jacket', 'coat', 'hoodie', 'sweater', 'hat', 'cap', 
                     'belt', 'scarf', 'tie', 'watch'],
      },
      {
        'category': 'Beauty & Personal Care',
        'confidence': 0.95,
        'exact_matches': ['lipstick', 'foundation', 'face cream', 'body lotion'],
        'patterns': ['makeup', 'cosmetic', 'perfume', 'fragrance', 'cologne', 'lotion', 'cream',
                     'skincare', 'beauty', 'shampoo', 'conditioner', 'soap', 'deodorant',
                     'facial', 'serum', 'moisturizer', 'cleanser', 'toner',
                     'lipgloss', 'mascara', 'eyeshadow', 'nail polish'],
      },
      {
        'category': 'Home & Garden',
        'confidence': 0.90,
        'exact_matches': ['sofa set', 'dining table', 'coffee table'],
        'patterns': ['furniture', 'chair', 'table', 'sofa', 'couch', 'bed', 'mattress', 
                     'pillow', 'curtain', 'lamp', 'light', 'lighting',
                     'kitchen', 'cookware', 'plate', 'cup', 'mug', 'bowl',
                     'garden', 'plant', 'pot', 'decoration', 'decor', 'vase',
                     'rug', 'carpet', 'shelf', 'cabinet'],
      },
      {
        'category': 'Sports & Outdoors',
        'confidence': 0.90,
        'exact_matches': ['running shoes', 'yoga mat', 'dumbbell set'],
        'patterns': ['sport', 'fitness', 'gym', 'exercise', 'workout', 'yoga', 
                     'running', 'jogging', 'football', 'soccer', 'basketball', 'tennis',
                     'bicycle', 'bike', 'cycling', 'camping', 'hiking', 'outdoor',
                     'dumbbell', 'weight', 'treadmill', 'equipment'],
      },
      {
        'category': 'Food & Beverages',
        'confidence': 0.90,
        'exact_matches': ['coffee beans', 'green tea', 'olive oil'],
        'patterns': ['food', 'drink', 'beverage', 'snack', 'coffee', 'tea', 'juice',
                     'water', 'wine', 'beer', 'chocolate', 'candy', 'sweet',
                     'bread', 'cake', 'sauce', 'spice', 'oil'],
      },
      {
        'category': 'Books & Media',
        'confidence': 0.90,
        'exact_matches': ['paperback book', 'hardcover', 'audiobook'],
        'patterns': ['book', 'novel', 'magazine', 'newspaper', 'dvd', 'cd', 'vinyl',
                     'music', 'album', 'movie', 'film', 'game', 'video game'],
      },
      {
        'category': 'Toys & Games',
        'confidence': 0.90,
        'exact_matches': ['lego set', 'barbie doll', 'action figure'],
        'patterns': ['toy', 'doll', 'puzzle', 'lego', 'board game', 'card game',
                     'action figure', 'kids', 'children', 'baby', 'infant',
                     'stuffed animal', 'plush'],
      },
      {
        'category': 'Automotive',
        'confidence': 0.90,
        'exact_matches': ['car tire', 'engine oil', 'brake pad'],
        'patterns': ['car', 'auto', 'automobile', 'vehicle', 'tire', 'tyre', 'wheel',
                     'engine', 'motor', 'brake', 'oil', 'battery',
                     'automotive', 'car part', 'motorcycle', 'bike'],
      },
      {
        'category': 'Health & Wellness',
        'confidence': 0.90,
        'exact_matches': ['vitamin c', 'protein powder', 'first aid kit'],
        'patterns': ['health', 'wellness', 'vitamin', 'supplement', 'protein',
                     'medicine', 'medication', 'medical', 'first aid',
                     'therapy', 'massage', 'thermometer'],
      },
      {
        'category': 'Pet Supplies',
        'confidence': 0.90,
        'exact_matches': ['dog food', 'cat litter', 'fish tank'],
        'patterns': ['pet', 'dog', 'cat', 'puppy', 'kitten', 'bird', 'fish', 'aquarium',
                     'pet food', 'treat', 'collar', 'leash', 'cage', 'litter'],
      },
      {
        'category': 'Office & Stationery',
        'confidence': 0.85,
        'exact_matches': ['office chair', 'printer paper'],
        'patterns': ['office', 'stationery', 'pen', 'pencil', 'notebook', 'paper',
                     'printer', 'ink', 'desk', 'stapler', 'folder', 'binder'],
      },
    ];
  }

  Map<String, dynamic> _mapToFacebookCategory({
    required String simpleCategory,
    required String productName,
    required List<String> tokens,
  }) {
    final text = productName.toLowerCase();
    
    switch (simpleCategory) {
      case 'Electronics':
        if (text.contains('phone') || text.contains('mobile')) {
          return {'id': 267, 'name': 'Electronics > Mobile Phones'};
        }
        if (text.contains('laptop') || text.contains('computer')) {
          return {'id': 298, 'name': 'Electronics > Computers'};
        }
        return {'id': 1420, 'name': 'Electronics'};

      case 'Fashion':
        if (text.contains('shoe') || text.contains('sneaker')) {
          return {'id': 187, 'name': 'Apparel & Accessories > Shoes'};
        }
        return {'id': 166, 'name': 'Apparel & Accessories'};

      case 'Beauty & Personal Care':
        return {'id': 567, 'name': 'Health & Beauty > Personal Care'};

      case 'Home & Garden':
        return {'id': 436, 'name': 'Home & Garden'};

      case 'Sports & Outdoors':
        return {'id': 499, 'name': 'Sporting Goods'};

      case 'Food & Beverages':
        return {'id': 422, 'name': 'Food & Beverages'};

      case 'Books & Media':
        return {'id': 839, 'name': 'Media > Books'};

      case 'Toys & Games':
        return {'id': 537, 'name': 'Toys & Games'};

      case 'Automotive':
        return {'id': 899, 'name': 'Vehicles & Parts'};

      case 'Health & Wellness':
        return {'id': 491, 'name': 'Health & Beauty'};

      case 'Pet Supplies':
        return {'id': 5, 'name': 'Animals & Pet Supplies'};

      case 'Office & Stationery':
        return {'id': 922, 'name': 'Business & Industrial'};

      default:
        return {'id': 783, 'name': 'Other'};
    }
  }

  Map<String, dynamic> _mapToGoogleTaxonomy({
    required String simpleCategory,
    required String productName,
    required List<String> tokens,
  }) {
    final text = productName.toLowerCase();

    switch (simpleCategory) {
      case 'Electronics':
        if (text.contains('phone') || text.contains('mobile')) {
          return {'id': 267, 'path': 'Electronics > Mobile Phones'};
        }
        if (text.contains('laptop') || text.contains('computer')) {
          return {'id': 298, 'path': 'Electronics > Computers'};
        }
        return {'id': 222, 'path': 'Electronics'};

      case 'Fashion':
        if (text.contains('shoe')) {
          return {'id': 187, 'path': 'Apparel & Accessories > Shoes'};
        }
        return {'id': 166, 'path': 'Apparel & Accessories'};

      case 'Beauty & Personal Care':
        return {'id': 567, 'path': 'Health & Beauty > Personal Care'};

      case 'Home & Garden':
        return {'id': 436, 'path': 'Home & Garden'};

      case 'Sports & Outdoors':
        return {'id': 499, 'path': 'Sporting Goods'};

      default:
        return {'id': 1, 'path': 'Other'};
    }
  }

  Future<ProductCategory?> _getOrCreateCategory(Session session, String categoryName) async {
    var category = await ProductCategory.db.findFirstRow(
      session,
      where: (t) => t.name.equals(categoryName) & t.isActive.equals(true),
    );

    if (category == null) {
      final categories = await ProductCategory.db.find(
        session,
        where: (t) => t.isActive.equals(true),
      );

      for (var cat in categories) {
        if (cat.name.toLowerCase().contains(categoryName.toLowerCase()) ||
            categoryName.toLowerCase().contains(cat.name.toLowerCase())) {
          return cat;
        }
      }

      return categories.isNotEmpty ? categories.first : null;
    }

    return category;
  }
}