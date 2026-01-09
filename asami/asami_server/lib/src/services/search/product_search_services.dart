// File: server/lib/src/services/search/product_search_service.dart

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

      // Build search conditions
      final conditions = <String>[];
      final params = <String, dynamic>{};

      // ✅ Multi-field text search with ILIKE for fuzzy matching
      if (parsed['search_terms'] != null && (parsed['search_terms'] as List).isNotEmpty) {
        final searchTerms = parsed['search_terms'] as List<String>;
        final searchConditions = <String>[];
        
        for (var i = 0; i < searchTerms.length; i++) {
          final term = '%${searchTerms[i]}%';
          
          // ✅ FIX: Use JSONB text conversion for tags
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

      // ✅ Category filter (exact or fuzzy)
      if (parsed['category'] != null || category != null) {
        final cat = (parsed['category'] ?? category) as String;
        conditions.add('category ILIKE @category');
        params['category'] = '%$cat%';
      }

      // ✅ Price range filter
      final priceMin = parsed['min_price'] ?? minPrice;
      final priceMax = parsed['max_price'] ?? maxPrice;
      
      if (priceMin != null) {
        conditions.add('base_price >= @min_price');
        params['min_price'] = priceMin;
      }
      
      if (priceMax != null) {
        conditions.add('base_price <= @max_price');
        params['max_price'] = priceMax;
      }

      // ✅ FIX: Color filter with JSONB handling
      if (parsed['colors'] != null && (parsed['colors'] as List).isNotEmpty) {
        final colors = (parsed['colors'] as List<String>).map((c) => '%$c%').toList();
        
        // Use JSONB array contains operator
        conditions.add('''
          EXISTS (
            SELECT 1 
            FROM jsonb_array_elements_text(color) AS c 
            WHERE c ILIKE ANY(@colors)
          )
        ''');
        params['colors'] = colors;
      }

      // ✅ FIX: Size filter with JSONB handling
      if (parsed['sizes'] != null && (parsed['sizes'] as List).isNotEmpty) {
        final sizes = (parsed['sizes'] as List<String>).map((s) => '%$s%').toList();
        
        conditions.add('''
          EXISTS (
            SELECT 1 
            FROM jsonb_array_elements_text(size) AS s 
            WHERE s ILIKE ANY(@sizes)
          )
        ''');
        params['sizes'] = sizes;
      }

      // ✅ Status filter (default: only active products)
      conditions.add('status = @status');
      params['status'] = (status ?? ProductStatus.active).name;

      // ✅ Stock availability
      conditions.add('quantity > 0');

      // Build final query
      final whereClause = conditions.isEmpty ? '1=1' : conditions.join(' AND ');
      
      session.log('🔎 WHERE: $whereClause');
      session.log('📊 PARAMS: ${params.toString()}');

      // Execute search with relevance scoring
      final products = await _executeSearch(
        whereClause: whereClause,
        params: params,
        searchTerms: parsed['search_terms'] as List<String>?,
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

  /// ✅ Parse natural language queries into structured filters
  Map<String, dynamic> _parseNaturalLanguage(String query) {
    final lower = query.toLowerCase();
    final result = <String, dynamic>{};

    // Extract price range
    final priceMatch = RegExp(r'under (\d+)|below (\d+)|less than (\d+)|max (\d+)').firstMatch(lower);
    if (priceMatch != null) {
      final price = double.tryParse(
        priceMatch.group(1) ?? 
        priceMatch.group(2) ?? 
        priceMatch.group(3) ?? 
        priceMatch.group(4) ?? '0'
      );
      if (price != null && price > 0) {
        result['max_price'] = price;
      }
    }

    final minPriceMatch = RegExp(r'above (\d+)|over (\d+)|more than (\d+)|min (\d+)').firstMatch(lower);
    if (minPriceMatch != null) {
      final price = double.tryParse(
        minPriceMatch.group(1) ?? 
        minPriceMatch.group(2) ?? 
        minPriceMatch.group(3) ?? 
        minPriceMatch.group(4) ?? '0'
      );
      if (price != null && price > 0) {
        result['min_price'] = price;
      }
    }

    // Extract colors
    final knownColors = [
      'red', 'blue', 'green', 'yellow', 'black', 'white', 
      'pink', 'purple', 'orange', 'brown', 'gray', 'grey'
    ];
    final colors = knownColors.where((color) => lower.contains(color)).toList();
    if (colors.isNotEmpty) {
      result['colors'] = colors;
    }

    // Extract sizes
    final knownSizes = [
      'xs', 's', 'm', 'l', 'xl', 'xxl', 
      'small', 'medium', 'large', 'extra large'
    ];
    final sizes = knownSizes.where((size) => lower.contains(size)).toList();
    if (sizes.isNotEmpty) {
      result['sizes'] = sizes;
    }

    // Extract category
    final knownCategories = {
      'electronics': ['electronic', 'electronics', 'phone', 'laptop', 'computer', 'gadget'],
      'fashion': ['fashion', 'clothing', 'clothes', 'dress', 'shirt', 'shoe', 'bag'],
      'home': ['home', 'furniture', 'kitchen', 'garden'],
      'beauty': ['beauty', 'makeup', 'cosmetic', 'perfume'],
      'sports': ['sports', 'fitness', 'gym', 'exercise'],
    };

    for (var entry in knownCategories.entries) {
      if (entry.value.any((keyword) => lower.contains(keyword))) {
        result['category'] = entry.key;
        break;
      }
    }

    // Extract search terms (remove filter keywords)
    final filterKeywords = [
      'under', 'above', 'below', 'over', 'less', 'more', 'than', 'max', 'min',
      ...knownColors,
      ...knownSizes,
      ...knownCategories.values.expand((v) => v),
    ];

    final words = query.split(' ')
        .map((w) => w.trim().toLowerCase())
        .where((w) => w.isNotEmpty && !filterKeywords.contains(w))
        .toList();

    if (words.isNotEmpty) {
      result['search_terms'] = words;
    }

    return result;
  }

  /// ✅ Execute search with relevance scoring
  Future<List<Product>> _executeSearch({
    required String whereClause,
    required Map<String, dynamic> params,
    List<String>? searchTerms,
    required int limit,
    required int offset,
  }) async {
    // Build relevance score for sorting
    String orderBy = 'created_at DESC';
    
    if (searchTerms != null && searchTerms.isNotEmpty) {
      // Calculate relevance: exact name match > description match > tag match
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
      
      orderBy = '($scoreCalculation) DESC, view_count DESC, created_at DESC';
    }

    // Use raw SQL for complex search
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
      
      // Fallback to Serverpod ORM if raw SQL fails
      return await _fallbackSearch(whereClause, params, limit, offset);
    }
  }

  /// ✅ Convert database snake_case columns to camelCase
  Map<String, dynamic> _dbMapToJson(Map<String, dynamic> dbMap) {
    final result = <String, dynamic>{};
    
    dbMap.forEach((key, value) {
      // Convert snake_case to camelCase
      final camelKey = key.replaceAllMapped(
        RegExp(r'_([a-z0-9])'),
        (match) => match.group(1)!.toUpperCase(),
      );
      result[camelKey] = value;
    });
    
    return result;
  }

  /// Fallback to ORM-based search
  Future<List<Product>> _fallbackSearch(
    String whereClause,
    Map<String, dynamic> params,
    int limit,
    int offset,
  ) async {
    // Simple fallback using Product.db.find
    final searchTerm = params.values.firstWhere(
      (v) => v is String && v.contains('%'),
      orElse: () => '',
    ).toString().replaceAll('%', '');

    return await Product.db.find(
      session,
      where: (t) => t.name.ilike('%$searchTerm%') | 
                    t.description.ilike('%$searchTerm%') | 
                    t.category.ilike('%$searchTerm%'),
      orderBy: (t) => t.createdAt,
      orderDescending: true,
      limit: limit,
      offset: offset,
    );
  }

  /// ✅ Quick search by exact product ID or name
  Future<Product?> findById(String productId) async {
    try {
      return await Product.db.findById(session, UuidValue.fromString(productId));
    } catch (e) {
      return null;
    }
  }

  /// ✅ Search by vendor
  Future<List<Product>> searchByVendor({
    required String vendorId,
    String? query,
    int limit = 20,
  }) async {
    if (query == null || query.isEmpty) {
      return await Product.db.find(
        session,
        where: (t) => t.vendorId.equals(UuidValue.fromString(vendorId)),
        orderBy: (t) => t.createdAt,
        orderDescending: true,
        limit: limit,
      );
    }

    return await Product.db.find(
      session,
      where: (t) => t.vendorId.equals(UuidValue.fromString(vendorId)) &
                    (t.name.ilike('%$query%') | t.description.ilike('%$query%')),
      orderBy: (t) => t.createdAt,
      orderDescending: true,
      limit: limit,
    );
  }
}