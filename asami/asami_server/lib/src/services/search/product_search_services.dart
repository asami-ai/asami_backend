// File: server/lib/src/services/search/product_search_services.dart

import 'package:serverpod/serverpod.dart';
import '../../generated/protocol.dart';

/// ✅ ROBUST: Natural language product search with fuzzy matching
class ProductSearchService {
  final Session session;

  ProductSearchService(this.session);

  /// ✅ Main search method with intelligent query parsing
  Future<List<Product>> search({
    required String query,
    int limit = 20,
    int offset = 0,
    ProductStatus? status,
    String? category,
    double? minPrice,
    double? maxPrice,
  }) async {
    try {
      session.log('🔍 Searching: "$query"');

      // ✅ Parse natural language query
      final parsed = _parseNaturalLanguage(query);
      
      session.log('📋 Parsed query: ${parsed.toString()}');

      final conditions = <String>[];
      final params = <String, dynamic>{};

      // ✅ FIX: Safe casting for search terms
      final searchTerms = (parsed['search_terms'] as List?)?.cast<String>() ?? [];
      
      if (searchTerms.isNotEmpty) {
        final searchConditions = <String>[];
        
        for (var i = 0; i < searchTerms.length; i++) {
          final term = '%${searchTerms[i]}%';
          
          searchConditions.add('''
            (name ILIKE @term$i OR 
             description ILIKE @term$i OR 
             category ILIKE @term$i OR 
             tags::text ILIKE @term$i OR
             brand ILIKE @term$i)
          ''');
          params['term$i'] = term;
        }
        
        conditions.add('(${searchConditions.join(' OR ')})');
      }

      // ✅ Category filter
      if (parsed['category'] != null || category != null) {
        final cat = (parsed['category'] ?? category) as String;
        conditions.add('category ILIKE @category');
        params['category'] = '%$cat%';
      }

      // ✅ Price range filter
      final priceMin = parsed['min_price'] ?? minPrice;
      final priceMax = parsed['max_price'] ?? maxPrice;
      
      if (priceMin != null) {
        conditions.add('"basePrice" >= @min_price'); // Serverpod uses camelCase
        params['min_price'] = priceMin;
      }
      
      if (priceMax != null) {
        conditions.add('"basePrice" <= @max_price');
        params['max_price'] = priceMax;
      }

      // ✅ FIX: Color filter with safe casting
      final colors = (parsed['colors'] as List?)?.cast<String>() ?? [];
      if (colors.isNotEmpty) {
        conditions.add('''
          EXISTS (
            SELECT 1 
            FROM jsonb_array_elements_text("color"::jsonb) AS c 
            WHERE c ILIKE ANY(@colors::text[])
          )
        ''');
        params['colors'] = colors.map((c) => '%$c%').toList();
      }

      // ✅ FIX: Size filter with safe casting
      final sizes = (parsed['sizes'] as List?)?.cast<String>() ?? [];
      if (sizes.isNotEmpty) {
        conditions.add('''
          EXISTS (
            SELECT 1 
            FROM jsonb_array_elements_text("size"::jsonb) AS s 
            WHERE s ILIKE ANY(@sizes::text[])
          )
        ''');
        params['sizes'] = sizes.map((s) => '%$s%').toList();
      }

      // Status and Stock
      conditions.add('status = @status');
      params['status'] = (status ?? ProductStatus.active).name;
      conditions.add('quantity > 0');

      final whereClause = conditions.isEmpty ? '1=1' : conditions.join(' AND ');

      // Execute search
      final products = await _executeSearch(
        whereClause: whereClause,
        params: params,
        searchTerms: searchTerms,
        limit: limit,
        offset: offset,
      );

      session.log('✅ Found ${products.length} products');
      return products;

    } catch (e, stackTrace) {
      session.log('❌ Search error: $e', stackTrace: stackTrace);
      return [];
    }
  }

  /// ✅ Execute search with relevance scoring and correct column naming
  Future<List<Product>> _executeSearch({
    required String whereClause,
    required Map<String, dynamic> params,
    List<String>? searchTerms,
    required int limit,
    required int offset,
  }) async {
    // Default sort using quoted identifiers for case sensitivity
    String orderBy = '"createdAt" DESC';
    
    if (searchTerms != null && searchTerms.isNotEmpty) {
      final scoreCalculation = searchTerms.asMap().entries.map((entry) {
        final i = entry.key;
        final term = '@term$i';
        return '''
          CASE 
            WHEN name ILIKE $term THEN 100
            WHEN description ILIKE $term THEN 50
            WHEN category ILIKE $term THEN 30
            WHEN brand ILIKE $term THEN 20
            ELSE 10
          END
        ''';
      }).join(' + ');
      
      // ✅ FIX: view_count -> "viewCount", created_at -> "createdAt"
      orderBy = '($scoreCalculation) DESC, "viewCount" DESC, "createdAt" DESC';
    }

    final sql = '''
      SELECT * FROM products
      WHERE $whereClause
      ORDER BY $orderBy
      LIMIT $limit OFFSET $offset
    ''';

    try {
      final results = await session.db.unsafeQuery(
        sql, 
        parameters: QueryParameters.named(params),
      );
      
      return results.map((row) {
        final columnMap = row.toColumnMap();
        final jsonMap = _dbMapToJson(columnMap);
        return Product.fromJson(jsonMap);
      }).toList();
      
    } catch (e) {
      session.log('SQL execution error: $e');
      return await _fallbackSearch(whereClause, params, limit, offset);
    }
  }

  /// ✅ Parse natural language queries into structured filters
  Map<String, dynamic> _parseNaturalLanguage(String query) {
    final lower = query.toLowerCase();
    final result = <String, dynamic>{};

    // Price ranges
    final priceMatch = RegExp(r'under (\d+)|below (\d+)|less than (\d+)|max (\d+)').firstMatch(lower);
    if (priceMatch != null) {
      result['max_price'] = double.tryParse(priceMatch.group(1) ?? priceMatch.group(2) ?? priceMatch.group(3) ?? priceMatch.group(4) ?? '0');
    }

    final minPriceMatch = RegExp(r'above (\d+)|over (\d+)|more than (\d+)|min (\d+)').firstMatch(lower);
    if (minPriceMatch != null) {
      result['min_price'] = double.tryParse(minPriceMatch.group(1) ?? minPriceMatch.group(2) ?? minPriceMatch.group(3) ?? minPriceMatch.group(4) ?? '0');
    }

    // Colors
    final knownColors = ['red', 'blue', 'green', 'yellow', 'black', 'white', 'pink', 'purple', 'orange', 'brown', 'gray', 'grey'];
    final colors = knownColors.where((color) => lower.contains(color)).toList();
    if (colors.isNotEmpty) result['colors'] = colors;

    // Sizes
    final knownSizes = ['xs', 's', 'm', 'l', 'xl', 'xxl', 'small', 'medium', 'large'];
    final sizes = knownSizes.where((size) => lower.contains(size)).toList();
    if (sizes.isNotEmpty) result['sizes'] = sizes;

    // Categories
    final knownCategories = {
      'electronics': ['phone', 'laptop', 'computer', 'gadget'],
      'fashion': ['clothing', 'dress', 'shirt', 'shoe', 'bag', 'slippon'],
      'home': ['furniture', 'kitchen'],
    };

    for (var entry in knownCategories.entries) {
      if (entry.value.any((keyword) => lower.contains(keyword))) {
        result['category'] = entry.key;
        break;
      }
    }

    // Clean search terms
    final filterKeywords = ['under', 'above', 'below', 'over', 'less', 'more', 'than', 'max', 'min', ...knownColors, ...knownSizes];
    final words = query.split(' ')
        .map((w) => w.trim().toLowerCase())
        .where((w) => w.isNotEmpty && !filterKeywords.contains(w))
        .toList();

    if (words.isNotEmpty) result['search_terms'] = words;

    return result;
  }

  /// ✅ Convert database snake_case columns to camelCase
  Map<String, dynamic> _dbMapToJson(Map<String, dynamic> dbMap) {
    final result = <String, dynamic>{};
    dbMap.forEach((key, value) {
      final camelKey = key.replaceAllMapped(
        RegExp(r'_([a-z0-9])'),
        (match) => match.group(1)!.toUpperCase(),
      );
      result[camelKey] = value;
    });
    return result;
  }

  /// Fallback to ORM-based search
  Future<List<Product>> _fallbackSearch(String whereClause, Map<String, dynamic> params, int limit, int offset) async {
    final searchTerm = params.values.firstWhere((v) => v is String && v.contains('%'), orElse: () => '').toString().replaceAll('%', '');

    return await Product.db.find(
      session,
      where: (t) => t.name.ilike('%$searchTerm%') | t.description.ilike('%$searchTerm%'),
      orderBy: (t) => t.createdAt,
      orderDescending: true,
      limit: limit,
      offset: offset,
    );
  }

  Future<Product?> findById(String productId) async {
    try {
      return await Product.db.findById(session, UuidValue.fromString(productId));
    } catch (e) {
      return null;
    }
  }
}