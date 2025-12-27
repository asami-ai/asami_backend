import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:serverpod/serverpod.dart';
import '../../generated/protocol.dart';

class MetaCatalogService {
  final String accessToken;
  final String catalogId;
  final String apiVersion;
  
  MetaCatalogService({
    required this.accessToken,
    required this.catalogId,
    this.apiVersion = 'v24.0',
  });
  
  /// Push product to Meta Catalog
  Future<Map<String, dynamic>> pushProduct(Session session, Product product) async {
    try {
      // Validate product has required fields
      if (product.images.isEmpty) {
        return {
          'success': false,
          'error': 'Product must have at least one image',
        };
      }
      
      // Build product data for Meta
      final productData = _buildMetaProductData(product);
      
      // Create product in catalog via batch API
      final url = 'https://graph.facebook.com/$apiVersion/$catalogId/items_batch';
      
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'access_token': accessToken,
          'item_type': 'PRODUCT_ITEM',
          'requests': [
            {
              'method': 'CREATE',
              'data': productData,
            }
          ],
        }),
      );
      
      if (response.statusCode != 200) {
        session.log('Meta API error: ${response.statusCode} - ${response.body}');
        return {
          'success': false,
          'error': 'Meta API error: ${response.statusCode}',
          'details': response.body,
        };
      }
      
      final result = jsonDecode(response.body);
      
      // Update product with Meta IDs
      if (result['handles'] != null && result['handles'].isNotEmpty) {
        await _updateProductMetaStatus(
          session,
          product: product,
          metaProductId: result['handles'][0],
          status: 'synced',
        );
        
        return {
          'success': true,
          'meta_product_id': result['handles'][0],
          'message': 'Product synced to Meta Catalog',
        };
      }
      
      return {
        'success': false,
        'error': 'No handle returned from Meta',
      };
    } catch (e, stackTrace) {
      session.log('Push to Meta error: $e', stackTrace: stackTrace);
      
      await _updateProductMetaStatus(
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
  
  /// Batch push multiple products
  Future<Map<String, dynamic>> batchPushProducts(Session session, List<Product> products) async {
    try {
      // Build requests array
      final requests = products.map((product) {
        return {
          'method': 'CREATE',
          'data': _buildMetaProductData(product),
        };
      }).toList();
      
      final url = 'https://graph.facebook.com/$apiVersion/$catalogId/items_batch';
      
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
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
      
      // Update products with handles
      if (result['handles'] != null) {
        for (var i = 0; i < products.length; i++) {
          if (i < result['handles'].length) {
            await _updateProductMetaStatus(
              session,
              product: products[i],
              metaProductId: result['handles'][i],
              status: 'synced',
            );
          }
        }
      }
      
      return {
        'success': true,
        'synced_count': result['handles']?.length ?? 0,
      };
    } catch (e) {
      return {
        'success': false,
        'error': e.toString(),
      };
    }
  }
  
  /// Update product in Meta Catalog
  Future<Map<String, dynamic>> updateProduct(Session session, Product product) async {
    if (product.metaProductId == null) {
      return await pushProduct(session,product);
    }
    
    try {
      final productData = _buildMetaProductData(product);
      
      final url = 'https://graph.facebook.com/$apiVersion/$catalogId/items_batch';
      
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
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
        return {
          'success': false,
          'error': 'Meta API error: ${response.statusCode}',
        };
      }
      
      await _updateProductMetaStatus(
        session,      
        product: product,
        status: 'synced',
      );
      
      return {
        'success': true,
        'message': 'Product updated in Meta Catalog',
      };
    } catch (e) {
      return {
        'success': false,
        'error': e.toString(),
      };
    }
  }
  
  /// Delete product from Meta Catalog
  Future<Map<String, dynamic>> deleteProduct(Session session, Product product) async {
    if (product.metaProductId == null) {
      return {
        'success': true,
        'message': 'Product not in Meta Catalog',
      };
    }
    
    try {
      final url = 'https://graph.facebook.com/$apiVersion/$catalogId/items_batch';
      
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
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
      
      await _updateProductMetaStatus(
        session,
        product: product,
        metaProductId: null,
        status: 'not_synced',
      );
      
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
  
  /// Get catalog info
  Future<Map<String, dynamic>> getCatalogInfo() async {
    try {
      final url = 'https://graph.facebook.com/$apiVersion/$catalogId?fields=id,name,product_count';
      
      final response = await http.get(
        Uri.parse('$url&access_token=$accessToken'),
      );
      
      if (response.statusCode != 200) {
        return {
          'success': false,
          'error': 'Failed to get catalog info',
        };
      }
      
      return {
        'success': true,
        'catalog': jsonDecode(response.body),
      };
    } catch (e) {
      return {
        'success': false,
        'error': e.toString(),
      };
    }
  }
  
  /// Search products in catalog
  Future<List<Map<String, dynamic>>> searchProducts( 
    Session session,
    {
    String? nameFilter,
    int limit = 10,
  }) async {
    try {
      var url = 'https://graph.facebook.com/$apiVersion/$catalogId/products?fields=retailer_id,id,name,category,errors';
      
      if (nameFilter != null) {
        final filter = jsonEncode({
          'name': {'i_contains': nameFilter}
        });
        url += '&filter=$filter';
      }
      
      final response = await http.get(
        Uri.parse('$url&access_token=$accessToken'),
      );
      
      if (response.statusCode != 200) {
        return [];
      }
      
      final result = jsonDecode(response.body);
      return (result['data'] as List).cast<Map<String, dynamic>>();
    } catch (e) {
      session.log('Search products error: $e');
      return [];
    }
  }
  
  // Private helper methods
  
  Map<String, dynamic> _buildMetaProductData(Product product) {
    return {
      'id': product.id.uuid, // retailer_id
      'title': product.name,
      'description': _stripHtml(product.description),
      'price': '${product.basePrice} ${product.currency}',
      'image_link': product.thumbnailUrl ?? product.images.first,
      'link': 'https://asami.com/products/${product.id.uuid}', // TODO: Update with actual domain
      'availability': product.quantity > 0 ? 'in stock' : 'out of stock',
      'condition': _mapCondition(product.condition),
      'brand': product.brand ?? 'Generic',
      if (product.facebookCategory != null) 'google_product_category': product.facebookCategory,
      if (product.color != null && product.color!.isNotEmpty) 'color': product.color!.join(', '),
      if (product.size != null && product.size!.isNotEmpty) 'size': product.size!.join(', '),
      if (product.material != null) 'material': product.material,
      if (product.videoUrl != null) 'video': [product.videoUrl],
      'additional_image_link': product.images.skip(1).toList(),
    };
  }
  
  String _stripHtml(String html) {
    return html.replaceAll(RegExp(r'<[^>]*>'), '').trim();
  }
  
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
  
  Future<void> _updateProductMetaStatus(
    Session session,
    {
    required Product product,
    String? metaProductId,
    required String status,
    String? error,
  }) async {
    if (metaProductId != null) {
      product.metaProductId = metaProductId;
    }
    product.metaSyncStatus = status;
    product.metaSyncedAt = DateTime.now();
    if (error != null) {
      product.metaSyncError = error;
    }
    product.updatedAt = DateTime.now();
    
    await Product.db.updateRow(session, product);
  }
}