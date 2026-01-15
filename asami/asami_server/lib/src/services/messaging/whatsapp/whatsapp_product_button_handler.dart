// File: server/lib/src/services/messaging/whatsapp/whatsapp_button_handler.dart

import 'package:serverpod/serverpod.dart';
import '../../../generated/protocol.dart';
import '../product_template_sender.dart';

class WhatsAppProductButtonHandler {
  /// Process button click from WhatsApp interactive message
  static Future<Map<String, dynamic>> processButtonClick(
    Session session, {
    required String buttonId,
    required String platformUserId,
    required String userId,
    required String conversationId,
  }) async {
    try {
      session.log('🔘 Button clicked: $buttonId');

      // Parse button ID to determine action
      if (buttonId.startsWith('prod_buy_now_')) {
        // Extract product ID
        final productId = buttonId.replaceFirst('prod_buy_now_', '');

        return await ProductTemplateSender.handleBuyNowClick(
          session,
          productId: productId,
          userId: userId,
          conversationId: conversationId,
          platform: PlatformType.whatsapp,
          platformUserId: platformUserId,
        );
      } else if (buttonId.startsWith('wishlist_')) {
        // Extract product ID
        final productId = buttonId.replaceFirst('wishlist_', '');

        return await ProductTemplateSender.handleWishlistClick(
          session,
          productId: productId,
          userId: userId,
        );
      } else if (buttonId.startsWith('prod_details_')) {
        // Extract product ID
        final productId = buttonId.replaceFirst('prod_details_', '');

        return await ProductTemplateSender.handleDetailsClick(
          session,
          productId: productId,
          platformUserId: platformUserId,
        );
      } else if (buttonId.startsWith('prod_add_to_cart_')) {
        // Extract product ID
        final productId = buttonId.replaceFirst('prod_add_to_cart_', '');

        return await _handleAddToCartClick(
          session,
          productId: productId,
          userId: userId,
          platformUserId: platformUserId,
        );
      }

      return {
        'success': false,
        'error': 'Unknown button action',
      };
    } catch (e, stackTrace) {
      session.log('Button handler error: $e', stackTrace: stackTrace);
      return {
        'success': false,
        'error': 'Failed to process button: ${e.toString()}',
      };
    }
  }

  /// Handle add to cart click
  static Future<Map<String, dynamic>> _handleAddToCartClick(
    Session session, {
    required String productId,
    required String userId,
    required String platformUserId,
  }) async {
    try {
      final cartAction = await ProductTemplateSender.handleAddToCartClick(
          session,
          productId: productId,
          platformUserId: platformUserId);

      session.log('🛒 Product $productId added to cart for user $userId');
      return cartAction;
    } catch (e) {
      return {
        'success': false,
        'error': e.toString(),
      };
    }
  }
}
