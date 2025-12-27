import 'package:serverpod/serverpod.dart';
import '../../generated/protocol.dart';
import '../dependency_injection.dart';
import 'meta_catalog_service.dart';

/// Handles synchronization of products across all platforms
class ProductSyncService {
  final Session session;
  
  ProductSyncService(this.session);
  
  /// Sync product to all platforms after creation
  Future<void> syncProductCreate(Product product) async {
    try {
      session.log('🔄 Syncing new product: ${product.name}');
      
      // Push to Meta Catalog
      await _syncToMeta(product, action: 'create');
      
      // TODO: Add other platforms
      // await _syncToShopify(product);
      // await _syncToWooCommerce(product);
      
      session.log('✅ Product sync complete: ${product.id.uuid}');
    } catch (e, stackTrace) {
      session.log('❌ Product sync error: $e', stackTrace: stackTrace);
    }
  }
  
  /// Sync product updates to all platforms
  Future<void> syncProductUpdate(Product product) async {
    try {
      session.log('🔄 Syncing product update: ${product.name}');
      
      // Update on Meta Catalog
      await _syncToMeta(product, action: 'update');
      
      // TODO: Update on other platforms
      
      session.log('✅ Product update synced: ${product.id.uuid}');
    } catch (e, stackTrace) {
      session.log('❌ Product update sync error: $e', stackTrace: stackTrace);
    }
  }
  
  /// Sync product deletion to all platforms
  Future<void> syncProductDelete(Product product) async {
    try {
      session.log('🔄 Syncing product deletion: ${product.name}');
      
      // Delete from Meta Catalog
      await _syncToMeta(product, action: 'delete');
      
      // TODO: Delete from other platforms
      
      session.log('✅ Product deletion synced: ${product.id.uuid}');
    } catch (e, stackTrace) {
      session.log('❌ Product deletion sync error: $e', stackTrace: stackTrace);
    }
  }
  
  // ========== PRIVATE HELPERS ==========
  
  Future<void> _syncToMeta(Product product, {required String action}) async {
    try {
      if (!getIt.isRegistered<MetaCatalogService>()) {
        session.log('⚠️ Meta Catalog service not registered');
        return;
      }
      
      final metaService = getIt<MetaCatalogService>();
      
      switch (action) {
        case 'create':
          // Check if product has required fields
          if (!_canPushToMeta(product)) {
            session.log('⚠️ Product missing required fields for Meta');
            await _updateMetaStatus(product.id, 'failed', 
                                  error: 'Missing images or description');
            return;
          }
          
          final result = await metaService.pushProduct( session,product);
          
          if (result['success']) {
            session.log('✅ Product pushed to Meta: ${result['meta_product_id']}');
          } else {
            session.log('❌ Meta push failed: ${result['error']}');
          }
          break;
          
        case 'update':
          if (product.metaProductId != null) {
            final result = await metaService.updateProduct(session,product);
            
            if (result['success']) {
              session.log('✅ Product updated on Meta');
            } else {
              session.log('❌ Meta update failed: ${result['error']}');
            }
          } else {
            // Not synced yet, try to push
            await _syncToMeta(product, action: 'create');
          }
          break;
          
        case 'delete':
          if (product.metaProductId != null) {
            final result = await metaService.deleteProduct(session,product);
            
            if (result['success']) {
              session.log('✅ Product deleted from Meta');
            } else {
              session.log('❌ Meta deletion failed: ${result['error']}');
            }
          }
          break;
      }
    } catch (e) {
      session.log('Meta sync error: $e');
    }
  }
  
  bool _canPushToMeta(Product product) {
    final hasImages = product.images.isNotEmpty || 
                     product.whatsappMediaIds?.isNotEmpty == true ||
                     product.telegramFileIds?.isNotEmpty == true;
    
    final hasDescription = product.description.isNotEmpty;
    
    return hasImages && hasDescription;
  }
  
  Future<void> _updateMetaStatus(
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