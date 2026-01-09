// File: server/lib/src/services/catalog/meta_catalog_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:serverpod/serverpod.dart';
import '../../generated/protocol.dart';
import 'category_classification_service.dart';

class MetaCatalogService {
  final String accessToken;
  final String catalogId;
  final String apiVersion;
  final String baseProductUrl;
  
  MetaCatalogService({
    required this.accessToken,
    required this.catalogId,
    this.apiVersion = 'v24.0',
    this.baseProductUrl = 'https://asami.com/products',
  });
  
  /// ✅ Push product (classification should be done before calling this)
  Future<Map<String, dynamic>> pushProduct(
    Session session, 
    Product product, {
    bool autoClassify = false, // ✅ DEFAULT FALSE - classify before creation!
  }) async {
    try {
      session.log('📤 Pushing product to Meta: ${product.name}');
      
      // ✅ ONLY classify if explicitly requested (shouldn't be needed)
      if (autoClassify) {
        final needsClassification = product.facebookCategoryId == null || 
                                    product.googleCategoryId == null;
        
        if (needsClassification) {
          session.log('⚠️ Auto-classifying (should have been done before creation)...');
          final classified = await _classifyProduct(session, product);
          if (classified) {
            session.log('✅ Product classified successfully');
          }
        }
      }
      
      // ✅ STEP 1: Validate product
      final validation = _validateProduct(product);
      if (!validation['valid']) {
        session.log('❌ Validation failed: ${validation['errors']}');
        
        await _updateMetaStatus(
          session,
          product: product,
          status: 'failed',
          error: 'Validation failed: ${validation['errors'].join(', ')}',
        );
        
        return {
          'success': false,
          'error': validation['errors'].join(', '),
          'validation_errors': validation['errors'],
        };
      }
      
      // ✅ STEP 3: Build Meta product data
      final productData = _buildMetaProductData(product);
      
      // ✅ DEBUG: Log the exact data types being sent
      session.log('📦 Meta product data:');
      productData.forEach((key, value) {
        session.log('  $key (${value.runtimeType}): $value');
      });
      
      // ✅ STEP 4: Push to Meta
      final url = 'https://graph.facebook.com/$apiVersion/$catalogId/items_batch';
      
      final requestBody = {
        'access_token': accessToken,
        'item_type': 'PRODUCT_ITEM',
        'requests': [
          {
            'method': 'CREATE',
            'retailer_id': product.id.uuid,
            'data': productData,
          }
        ],
      };
      
      session.log('🔗 POST URL: $url');
      
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(requestBody),
      );
      
      session.log('📡 Response status: ${response.statusCode}');
      session.log('📄 Response body: ${response.body}');
      
      if (response.statusCode != 200) {
        final errorBody = jsonDecode(response.body);
        final errorMessage = errorBody['error']?['message'] ?? 'Unknown error';
        
        session.log('❌ Meta API error: ${response.statusCode} - $errorMessage');
        
        await _updateMetaStatus(
          session,
          product: product,
          status: 'failed',
          error: 'Meta API error: $errorMessage',
        );
        
        return {
          'success': false,
          'error': 'Meta API error: ${response.statusCode}',
          'details': errorMessage,
          'response_body': response.body,
        };
      }
      
      final result = jsonDecode(response.body);
      session.log('✅ Meta response: ${jsonEncode(result)}');
      
      // ✅ STEP 5: Update product with Meta IDs
      if (result['handles'] != null && result['handles'].isNotEmpty) {
        final metaProductId = result['handles'][0];
        
        await _updateMetaStatus(
          session,
          product: product,
          metaProductId: metaProductId,
          metaRetailerId: product.id.uuid,
          metaCatalogId: catalogId,
          status: 'synced',
        );
        
        session.log('🎉 Product synced! Meta ID: $metaProductId');
        
        return {
          'success': true,
          'meta_product_id': metaProductId,
          'meta_retailer_id': product.id.uuid,
          'message': 'Product synced to Meta Catalog',
        };
      }
      
      session.log('⚠️ No handle returned from Meta');
      
      return {
        'success': false,
        'error': 'No handle returned from Meta',
        'response': result,
      };
    } catch (e, stackTrace) {
      session.log('💥 Push to Meta error: $e', stackTrace: stackTrace);
      
      await _updateMetaStatus(
        session,
        product: product,
        status: 'failed',
        error: e.toString(),
      );
      
      return {
        'success': false,
        'error': e.toString(),
      };
    }
  }
  
  /// ✅ Auto-classify product using CategoryClassificationService
  Future<bool> _classifyProduct(Session session, Product product) async {
    try {
      final classificationService = CategoryClassificationService(session);
      
      final result = await classificationService.classifyProduct(
        productName: product.name,
        description: product.description,
        userSelectedCategory: product.category,
      );
      
      if (result['success'] == true) {
        // Update product with classification results
        product.category = result['simple_category'] as String;
        product.facebookCategory = result['facebook_category_name'] as String?;
        product.facebookCategoryId = result['facebook_category_id'] as String?;
        product.googleCategory = result['google_taxonomy_path'] as String?;
        product.googleCategoryId = result['google_taxonomy_id']?.toString();
        
        await Product.db.updateRow(session, product);
        
        session.log('✅ Classification: ${product.category} -> FB: ${product.facebookCategory}');
        return true;
      }
      
      return false;
    } catch (e) {
      session.log('⚠️ Classification error: $e');
      return false;
    }
  }
  
  /// ✅ Validate product (all required Meta fields)
  Map<String, dynamic> _validateProduct(Product product) {
    final errors = <String>[];
    
    if (product.name.isEmpty) {
      errors.add('Product name (title) is required');
    }
    
    if (product.description.isEmpty) {
      errors.add('Product description is required');
    }
    
    if (product.basePrice <= 0) {
      errors.add('Product price must be greater than 0');
    }
    
    if (product.currency.isEmpty) {
      errors.add('Currency is required');
    }
    
    // ✅ FIX: Check for actual image URLs (not just media IDs)
    final hasValidImages = product.images.isNotEmpty && 
                          product.images.first.startsWith('http');
    
    if (!hasValidImages) {
      errors.add('Product must have at least one CDN image URL (not media ID)');
    }
    
    if (product.quantity <= 0) {
      errors.add('Product must have quantity > 0 (currently: ${product.quantity})');
    }
    
    if (product.brand == null || product.brand!.isEmpty) {
      errors.add('Brand is required by Meta Catalog');
    }
    
    if (product.productUrl == null || product.productUrl!.isEmpty) {
      errors.add('Product URL (link) is required');
    }
    
    return {
      'valid': errors.isEmpty,
      'errors': errors,
    };
  }
  
  /// ✅ Build Meta product data with correct types
  Map<String, dynamic> _buildMetaProductData(Product product) {
    // ✅ PRICE: Format as "100.4 USD"
    final priceString = '${product.basePrice.toStringAsFixed(2)} ${product.currency}';
    
    // ✅ IMAGE LINK: First image (required) - ensure it's a String
    final imageLink = product.images.first;
    
    // ✅ Additional images as List<String>
    final additionalImagesList = product.images.length > 1 
        ? product.images.skip(1).map((img) => img).toList()
        : <String>[];
    
    // ✅ LINK: Product deep link
    final productLink = product.productUrl ?? '$baseProductUrl/${product.id.uuid}';
    
    // ✅ AVAILABILITY
    final availability = product.quantity > 0 ? 'in stock' : 'out of stock';
    
    // ✅ CONDITION
    final condition = _mapCondition(product.condition);
    
    // ✅ BUILD: Core required fields with explicit types
    final data = <String, dynamic>{
      'id': product.id.uuid,
      'title': product.name,
      'description': product.description,
      'price': priceString,
      'image_link': imageLink,
      'link': productLink,
      'availability': availability,
      'condition': condition,
      'brand': (product.brand ?? 'Generic'),
    };
    
    // ✅ OPTIONAL: Additional images (as List<String>)
    if (additionalImagesList.isNotEmpty) {
      data['additional_image_link'] = additionalImagesList;
    }
    
    // ✅ OPTIONAL: Google product category
    if (product.googleCategory != null && product.googleCategory!.isNotEmpty) {
      data['google_product_category'] = product.googleCategory!;
    }
    
    // ✅ OPTIONAL: Facebook category
    if (product.facebookCategory != null && product.facebookCategory!.isNotEmpty) {
      data['fb_product_category'] = product.facebookCategory!;
    }
    
    // ✅ OPTIONAL: Color (join if list)
    if (product.color != null && product.color!.isNotEmpty) {
      data['color'] = product.color!.join(', ');
    }
    
    // ✅ OPTIONAL: Size (join if list)
    if (product.size != null && product.size!.isNotEmpty) {
      data['size'] = product.size!.join(', ');
    }
    
    // ✅ OPTIONAL: Material
    if (product.material != null && product.material!.isNotEmpty) {
      data['material'] = product.material!;
    }
    
    // ✅ FIX: Video - single URL string (Meta docs show this as string, not array)
    if (product.videoUrl != null && product.videoUrl!.isNotEmpty) {
      data['video'] = product.videoUrl!;
    }
    
    // ✅ OPTIONAL: Sale price
    if (product.discountPrice != null && product.discountPrice! > 0) {
      data['sale_price'] = '${product.discountPrice!.toStringAsFixed(2)} ${product.currency}';
      
      // Add sale price effective date if available
      if (product.discountStartDate != null && product.discountEndDate != null) {
        final startDate = product.discountStartDate!.toIso8601String();
        final endDate = product.discountEndDate!.toIso8601String();
        data['sale_price_effective_date'] = '$startDate/$endDate';
      }
    }
    
    // ✅ OPTIONAL: Short description
    if (product.shortDescription != null) {
      data['short_description'] = product.shortDescription!;
    }
    
    return data;
  }
  
  /// ✅ Update product in Meta
  Future<Map<String, dynamic>> updateProduct(
    Session session, 
    Product product, {
    bool autoClassify = true,
  }) async {
    if (product.metaProductId == null) {
      session.log('ℹ️ No Meta ID found, creating new product');
      return await pushProduct(session, product, autoClassify: autoClassify);
    }
    
    try {
      session.log('🔄 Updating product in Meta: ${product.name}');
      
      // Auto-classify if needed
      if (autoClassify) {
        await _classifyProduct(session, product);
      }
      
      final validation = _validateProduct(product);
      if (!validation['valid']) {
        return {
          'success': false,
          'error': validation['errors'].join(', '),
        };
      }
      
      final productData = _buildMetaProductData(product);
      
      final url = 'https://graph.facebook.com/$apiVersion/$catalogId/items_batch';
      
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'access_token': accessToken,
          'item_type': 'PRODUCT_ITEM',
          'requests': [
            {
              'method': 'UPDATE',
              'retailer_id': product.id.uuid,
              'data': productData,
            }
          ],
        }),
      );
      
      if (response.statusCode != 200) {
        final errorBody = jsonDecode(response.body);
        return {
          'success': false,
          'error': 'Meta API error: ${response.statusCode}',
          'details': errorBody['error']?['message'],
        };
      }
      
      await _updateMetaStatus(
        session,
        product: product,
        status: 'synced',
      );
      
      session.log('✅ Product updated in Meta');
      
      return {
        'success': true,
        'message': 'Product updated in Meta Catalog',
      };
    } catch (e) {
      session.log('❌ Update error: $e');
      return {
        'success': false,
        'error': e.toString(),
      };
    }
  }
  
  /// ✅ Delete product from Meta
  Future<Map<String, dynamic>> deleteProduct(Session session, Product product) async {
    if (product.metaProductId == null) {
      return {
        'success': true,
        'message': 'Product not in Meta Catalog',
      };
    }
    
    try {
      session.log('🗑️ Deleting product from Meta: ${product.name}');
      
      final url = 'https://graph.facebook.com/$apiVersion/$catalogId/items_batch';
      
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'access_token': accessToken,
          'item_type': 'PRODUCT_ITEM',
          'requests': [
            {
              'method': 'DELETE',
              'retailer_id': product.id.uuid,
            }
          ],
        }),
      );
      
      if (response.statusCode != 200) {
        return {
          'success': false,
          'error': 'Meta API error: ${response.statusCode}',
        };
      }
      
      await _updateMetaStatus(
        session,
        product: product,
        metaProductId: null,
        status: 'not_synced',
      );
      
      session.log('✅ Product removed from Meta');
      
      return {
        'success': true,
        'message': 'Product removed from Meta Catalog',
      };
    } catch (e) {
      return {
        'success': false,
        'error': e.toString(),
      };
    }
  }
  
  /// ✅ Batch push with auto-classification
  Future<Map<String, dynamic>> batchPushProducts(
    Session session,
    List<Product> products, {
    bool autoClassify = true,
  }) async {
    try {
      session.log('📦 Batch pushing ${products.length} products');
      
      // Auto-classify all products first
      if (autoClassify) {
        for (var product in products) {
          await _classifyProduct(session, product);
        }
      }
      
      final requests = <Map<String, dynamic>>[];
      final validProducts = <Product>[];
      final invalidProducts = <Map<String, dynamic>>[];
      
      for (var product in products) {
        final validation = _validateProduct(product);
        if (validation['valid']) {
          validProducts.add(product);
          requests.add({
            'method': 'CREATE',
            'retailer_id': product.id.uuid,
            'data': _buildMetaProductData(product),
          });
        } else {
          invalidProducts.add({
            'product_id': product.id.uuid,
            'name': product.name,
            'errors': validation['errors'],
          });
        }
      }
      
      if (validProducts.isEmpty) {
        return {
          'success': false,
          'error': 'No valid products to push',
          'invalid_products': invalidProducts,
        };
      }
      
      final url = 'https://graph.facebook.com/$apiVersion/$catalogId/items_batch';
      
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'access_token': accessToken,
          'item_type': 'PRODUCT_ITEM',
          'requests': requests,
        }),
      );
      
      if (response.statusCode != 200) {
        return {
          'success': false,
          'error': 'Meta API error: ${response.statusCode}',
        };
      }
      
      final result = jsonDecode(response.body);
      
      if (result['handles'] != null) {
        for (var i = 0; i < validProducts.length; i++) {
          if (i < result['handles'].length) {
            await _updateMetaStatus(
              session,
              product: validProducts[i],
              metaProductId: result['handles'][i],
              metaCatalogId: catalogId,
              status: 'synced',
            );
          }
        }
      }
      
      return {
        'success': true,
        'synced_count': result['handles']?.length ?? 0,
        'invalid_count': invalidProducts.length,
        'invalid_products': invalidProducts,
      };
    } catch (e) {
      return {
        'success': false,
        'error': e.toString(),
      };
    }
  }
  
  // ==================== HELPER METHODS ====================
  
  String _mapCondition(ProductCondition condition) {
    switch (condition) {
      case ProductCondition.newItem:
        return 'new';
      case ProductCondition.refurbished:
        return 'refurbished';
      case ProductCondition.used_like_new:
      case ProductCondition.used_good:
      case ProductCondition.used_acceptable:
        return 'used';
      default:
        return 'new';
    }
  }
  
  Future<void> _updateMetaStatus(
    Session session, {
    required Product product,
    String? metaProductId,
    String? metaRetailerId,
    String? metaCatalogId,
    required String status,
    String? error,
  }) async {
    try {
      if (metaProductId != null) {
        product.metaProductId = metaProductId;
      }
      if (metaRetailerId != null) {
        product.metaRetailerId = metaRetailerId;
      }
      if (metaCatalogId != null) {
        product.metaCatalogId = metaCatalogId;
      }
      
      product.metaSyncStatus = status;
      product.metaSyncedAt = DateTime.now();
      product.metaSyncAttempts = (product.metaSyncAttempts ?? 0) + 1;
      
      if (error != null) {
        product.metaSyncError = error;
      } else {
        product.metaSyncError = null;
      }
      
      product.updatedAt = DateTime.now();
      
      await Product.db.updateRow(session, product);
      
      session.log('💾 Meta status updated: $status');
    } catch (e) {
      session.log('⚠️ Failed to update Meta status: $e');
    }
  }
}