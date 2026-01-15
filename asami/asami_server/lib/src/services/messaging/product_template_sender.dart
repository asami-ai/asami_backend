// File: server/lib/src/services/messaging/whatsapp/product_template_sender.dart

import 'package:serverpod/serverpod.dart';
import '../../endpoints/cart_endpoint.dart';
import '../../endpoints/payment_endpoint.dart';
import '../../generated/protocol.dart';
import '../dependency_injection.dart';
import 'whatsapp/whatsapp_service.dart';

class ProductTemplateSender {
  /// Send product as interactive message with Buy Now and Add to Wishlist buttons
  static Future<bool> sendProductTemplate(
    Session session, {
    required Product product,
    required String platformUserId,
    required PlatformType platform,
    required String conversationId,
    required String userId,
  }) async {
    try {
      if (platform == PlatformType.whatsapp) {
        return await _sendWhatsAppProductMessage(
          session,
          product: product,
          platformUserId: platformUserId,
          conversationId: conversationId,
          userId: userId,
        );
      } else if (platform == PlatformType.telegram) {
        return await _sendTelegramProductMessage(
          session,
          product: product,
          platformUserId: platformUserId,
          conversationId: conversationId,
          userId: userId,
        );
      }

      return false;
    } catch (e, stackTrace) {
      session.log('Product template send error: $e', stackTrace: stackTrace);
      return false;
    }
  }

  /// Send WhatsApp interactive message with product
  static Future<bool> _sendWhatsAppProductMessage(
    Session session, {
    required Product product,
    required String platformUserId,
    required String conversationId,
    required String userId,
  }) async {
    try {
      final whatsappService = getIt<WhatsAppService>();

      final imageUrl = (product.images != null && product.images!.isNotEmpty)
          ? product.images!.first
          : product.thumbnailUrl;

      final price = product.discountPrice ?? product.basePrice;
      final currency = product.currency;

      // ✅ FIX: Handle null short description
      final description = product.shortDescription ??
          (product.description.length > 200
              ? '${product.description.substring(0, 197)}...'
              : product.description);

      // Create interactive message with buttons
      final messagePayload = {
        "messaging_product": "whatsapp",
        "recipient_type": "individual",
        "to": platformUserId,
        "type": "interactive",
        "interactive": {
          "type": "button",
          "header": imageUrl != null
              ? {
                  "type": "image",
                  "image": {"link": imageUrl}
                }
              : null,
          "body": {
            "text": """
🛍️ *${product.name}*

$description

💰 Price: $currency ${price.toStringAsFixed(2)}${product.discountPrice != null ? ' ~~${product.basePrice.toStringAsFixed(2)}~~' : ''}
📦 Stock: ${product.quantity > 0 ? '${product.quantity} available' : 'Out of stock'}
${product.freeShipping ? '🚚 Free Shipping' : ''}
"""
          },
          "action": {
            "buttons": [
              {
                "type": "reply",
                "reply": {
                  "id": "prod_buy_now_${product.id.uuid}",
                  "title": "💳 Buy Now"
                }
              },
              {
                "type": "reply",
                "reply": {
                  "id": "prod_add_to_cart_${product.id.uuid}",
                  "title": "🛒 Add To Cart"
                }
              },
              {
                "type": "reply",
                "reply": {
                  "id": "prod_details_${product.id.uuid}",
                  "title": "ℹ️ More Details"
                }
              }
            ]
          }
        }
      };

      // Remove header if no image
      if (imageUrl == null) {
        (messagePayload['interactive'] as Map).remove('header');
      }

      // Send interactive message
      final result = await whatsappService.sendInteractiveReplyButton(
          phoneNumber: platformUserId,
          headerInteractive: (messagePayload['interactive'] as Map)['header']
              as Map<String, dynamic>,
          bodyText: ((messagePayload['interactive'] as Map)['body']
              as Map<String, dynamic>)['text'] as String,
          interactiveReplyButtons: ((messagePayload['interactive']
                  as Map)['action'] as Map<String, dynamic>)['buttons']
              as List<Map<String, dynamic>>,
          footerText: 'Tap to proceed');

      session
          .log('📤 Product template sent: ${product.name} to $platformUserId');

      return result.isSuccess();
    } catch (e, stackTrace) {
      session.log('WhatsApp product template error: $e',
          stackTrace: stackTrace);
      return false;
    }
  }

  /// Send Telegram message with product and inline keyboard
  static Future<bool> _sendTelegramProductMessage(
    Session session, {
    required Product product,
    required String platformUserId,
    required String conversationId,
    required String userId,
  }) async {
    try {
      // TODO: Implement Telegram product message with inline keyboard
      // Similar to WhatsApp but using Telegram's sendPhoto with inline keyboard

      session.log('⚠️ Telegram product template not yet implemented');
      return false;
    } catch (e, stackTrace) {
      session.log('Telegram product template error: $e',
          stackTrace: stackTrace);
      return false;
    }
  }

  /// Handle "Buy Now" button click
  static Future<Map<String, dynamic>> handleBuyNowClick(
    Session session, {
    required String productId,
    required String userId,
    required String conversationId,
    required PlatformType platform,
    required String platformUserId,
  }) async {
    try {
      // Initialize payment
      final paymentEndpoint = PaymentEndpoint();
      final paymentResult = await paymentEndpoint.initializeProductPayment(
        session,
        userId: userId,
        productId: productId,
        conversationId: conversationId,
        platform: platform,
        quantity: 1,
      );

      if (!paymentResult['success']) {
        return {
          'success': false,
          'error': paymentResult['error'],
        };
      }

      // Send payment link to user
      final authUrl = paymentResult['authorization_url'] as String;
      final amount = paymentResult['amount'] as double;
      final expiresInMinutes = paymentResult['expires_in_minutes'] as int;

      final whatsappService = getIt<WhatsAppService>();

      await whatsappService.sendMessage(
        phoneNumber: platformUserId,
        text: """
💳 *Payment Initialized*

Click the link below to complete your payment:

$authUrl

💰 Amount: ₦${amount.toStringAsFixed(2)}
⏰ Expires in: $expiresInMinutes minutes

Once payment is confirmed, your order will be created automatically! 🎉
""",
      );

      session.log('💳 Payment link sent to $platformUserId');

      return {
        'success': true,
        'payment_reference': paymentResult['reference'],
        'message': 'Payment link sent',
      };
    } catch (e, stackTrace) {
      session.log('Buy now handler error: $e', stackTrace: stackTrace);
      return {
        'success': false,
        'error': 'Failed to process purchase: ${e.toString()}',
      };
    }
  }

  /// Handle "Add to Wishlist" button click
  static Future<Map<String, dynamic>> handleWishlistClick(
    Session session, {
    required String productId,
    required String userId,
  }) async {
    try {
      // TODO: Implement wishlist functionality
      // For now, just return success

      session.log('❤️ Product $productId added to wishlist for user $userId');

      return {
        'success': true,
        'message': '❤️ Added to your wishlist!',
      };
    } catch (e, stackTrace) {
      session.log('Wishlist handler error: $e', stackTrace: stackTrace);
      return {
        'success': false,
        'error': 'Failed to add to wishlist: ${e.toString()}',
      };
    }
  }

  /// Handle "More Details" button click
  static Future<Map<String, dynamic>> handleDetailsClick(
    Session session, {
    required String productId,
    required String platformUserId,
  }) async {
    try {
      final product = await Product.db.findById(
        session,
        UuidValue.fromString(productId),
      );

      if (product == null) {
        return {
          'success': false,
          'error': 'Product not found',
        };
      }

      final whatsappService = getIt<WhatsAppService>();

      final detailsText = """
📦 *${product.name}*

📝 *Description:*
${product.description}

💰 *Price:* ${product.currency} ${product.basePrice.toStringAsFixed(2)}
${product.discountPrice != null ? '💸 *Discount Price:* ${product.currency} ${product.discountPrice!.toStringAsFixed(2)}\n' : ''}
📊 *Stock:* ${product.quantity} available
${product.brand != null ? '🏷️ *Brand:* ${product.brand}\n' : ''}
${product.color != null && product.color!.isNotEmpty ? '🎨 *Colors:* ${product.color!.join(', ')}\n' : ''}
${product.size != null && product.size!.isNotEmpty ? '📏 *Sizes:* ${product.size!.join(', ')}\n' : ''}
${product.freeShipping ? '🚚 *Free Shipping*\n' : ''}
${product.estimatedDeliveryDays != null ? '⏰ *Delivery:* ${product.estimatedDeliveryDays} days\n' : ''}
⭐ *Rating:* ${product.averageRating.toStringAsFixed(1)} (${product.totalReviews} reviews)
👁️ *Views:* ${product.viewCount}

Reply with "Buy Now" to purchase or "Add to Cart" to save for later!
""";

      await whatsappService.sendMessage(
        phoneNumber: platformUserId,
        text: detailsText,
      );

      return {
        'success': true,
        'message': 'Details sent',
      };
    } catch (e, stackTrace) {
      session.log('Details handler error: $e', stackTrace: stackTrace);
      return {
        'success': false,
        'error': 'Failed to get details: ${e.toString()}',
      };
    }
  }

  static Future<Map<String, dynamic>> handleAddToCartClick(
    Session session, {
    required String productId,
    required String platformUserId,
  }) async {
    final user = await User.db.findFirstRow(
      session,
      where: (t) => t.whatsappId.equals(platformUserId),
    );

    final whatsappService = getIt<WhatsAppService>();

    if (user == null) {
      await _sendMessage(platformUserId, '❌ Please authenticate first.');
      return {'success': false, 'error': '❌ Please authenticate first.'};
    }

    final result = await CartEndpoint().addToCart(
      session,
      customerId: user.id,
      productId: UuidValue.fromString(productId),
      quantity: 1,
    );

    if (result == null) {
      await _sendMessage(platformUserId, '❌ Failed to add to cart.');
      return {
        'success': false,
        'error': '❌ Failed to add to cart.',
      };
    }

    final cartData = await CartEndpoint().getCartWithItems(session, user.id);
    final cart = cartData?['cart'] as Cart?;

    await whatsappService.sendInteractiveReplyButton(
      phoneNumber: platformUserId,
      bodyText: '''
✅ Added to cart!

🛒 Cart: ${cart?.itemCount ?? 1} items | ₦${cart?.subtotal.toStringAsFixed(2) ?? '0.00'}

What next?
''',
      footerText: '',
      headerInteractive: {"type": "text", "text": "Item Added"},
      interactiveReplyButtons: [
        {
          'type': 'reply',
          'reply': {
            'id': 'cart_view',
            'title': '🛒 View Cart',
          }
        },
        {
          'type': 'reply',
          'reply': {
            'id': 'nav_products',
            'title': '🛍️ Continue',
          }
        },
        {
          'type': 'reply',
          'reply': {
            'id': 'product_buy_$productId',
            'title': '💳 Checkout',
          }
        },
      ],
    );

    return {
      'success': true,
      'message': 'Details sent',
    };
  }

  static Future<void> _sendMessage(String phoneNumber, String text) async {
    final whatsappService = getIt<WhatsAppService>();

    await whatsappService.sendMessage(
      phoneNumber: phoneNumber,
      text: text,
    );
  }
}
