// ============================================================================
// FILE: server/lib/src/ai/tools/customer_tools.dart
// ============================================================================

import 'package:asami_server/src/endpoints/user_endpoint.dart';
import 'package:asami_server/utils/logger/asami_logger.dart';
import 'package:serverpod/serverpod.dart' hide Order;
import '../../../endpoints/cart_endpoint.dart';
import '../../../endpoints/order_endpoint.dart';
import '../../../endpoints/product_endpoint.dart';
import '../../../generated/protocol.dart';
import '../../messaging/product_template_sender.dart';
import '../../search/product_search_services.dart';
import 'tool_definition.dart';
import 'tool_registry.dart';

class CustomerTools {
  /// Register all customer tools with the registry
  static void registerAll(ToolRegistry registry) {
    // 1. Search Products
    registry.register(
      definition: _searchProductsTool(),
      handler: _handleSearchProducts,
      allowedRoles: ['customer'],
    );

    // 2. Get Product Details
    registry.register(
      definition: _getProductDetailsTool(),
      handler: _handleGetProductDetails,
      allowedRoles: ['customer'],
    );

    // 3. Add to Cart
    registry.register(
      definition: _addToCartTool(),
      handler: _handleAddToCart,
      allowedRoles: ['customer'],
    );

    // 4. Remove from Cart
    registry.register(
      definition: _removeFromCartTool(),
      handler: _handleRemoveFromCart,
      allowedRoles: ['customer'],
    );

    // 5. View Cart
    registry.register(
      definition: _viewCartTool(),
      handler: _handleViewCart,
      allowedRoles: ['customer'],
    );

    // 6. Update Cart Item Quantity
    registry.register(
      definition: _updateCartQuantityTool(),
      handler: _handleUpdateCartQuantity,
      allowedRoles: ['customer'],
    );

    // 7. Clear Cart
    registry.register(
      definition: _clearCartTool(),
      handler: _handleClearCart,
      allowedRoles: ['customer'],
    );

    // 8. Checkout / Create Order
    registry.register(
      definition: _checkoutTool(),
      handler: _handleCheckout,
      allowedRoles: ['customer'],
    );

    // 9. Track Order
    registry.register(
      definition: _trackOrderTool(),
      handler: _handleTrackOrder,
      allowedRoles: ['customer'],
    );

    // 10. View Order History
    registry.register(
      definition: _viewOrderHistoryTool(),
      handler: _handleViewOrderHistory,
      allowedRoles: ['customer'],
    );

    // 11. Cancel Order
    registry.register(
      definition: _cancelOrderTool(),
      handler: _handleCancelOrder,
      allowedRoles: ['customer'],
    );

    // 12. Get Vendor Info
    registry.register(
      definition: _getVendorInfoTool(),
      handler: _handleGetVendorInfo,
      allowedRoles: ['customer'],
    );

    // 13. Track Order By Number
    registry.register(
      definition: _trackOrderByNumberTool(),
      handler: _handleTrackOrderByNumber,
      allowedRoles: ['customer'],
    );

    // 14. Get Recent Orders
    registry.register(
      definition: _getRecentOrdersTool(),
      handler: _handleGetRecentOrders,
      allowedRoles: ['customer'],
    );

    // 15. Request Order Cancellation
    registry.register(
      definition: _requestOrderCancellationTool(),
      handler: _handleRequestOrderCancellation,
      allowedRoles: ['customer'],
    );

    // 16. Get Cart Statistics
    registry.register(
      definition: _getCartStatisticsTool(),
      handler: _handleGetCartStatistics,
      allowedRoles: ['customer'],
    );

    // 17. Compare Products
    registry.register(
      definition: _compareProductsTool(),
      handler: _handleCompareProducts,
      allowedRoles: ['customer'],
    );
  }

  // ========================================================================
  // TOOL DEFINITIONS
  // ========================================================================

  static ToolDefinition _searchProductsTool() {
    return ToolDefinition(
      name: 'search_products',
      description:
          'Search for products across all vendors by name, category, price range, color, size, and other attributes',
      parameters: {
        'query': ToolParameter(
          type: 'string',
          description: 'Search query (product name, description keywords)',
        ),
        'category': ToolParameter(
          type: 'string',
          description: 'Product category to filter by',
        ),
        'min_price': ToolParameter(
          type: 'number',
          description: 'Minimum price in NGN',
        ),
        'max_price': ToolParameter(
          type: 'number',
          description: 'Maximum price in NGN',
        ),
        'color': ToolParameter(
          type: 'string',
          description: 'Product color',
        ),
        'size': ToolParameter(
          type: 'string',
          description: 'Product size',
        ),
        'limit': ToolParameter(
          type: 'number',
          description: 'Maximum number of results to return (default 10)',
          defaultValue: 10,
        ),
      },
      requiredParameters: ['query'],
    );
  }

  static ToolDefinition _getProductDetailsTool() {
    return ToolDefinition(
      name: 'get_product_details',
      description: 'Get detailed information about a specific product',
      parameters: {
        'product_id': ToolParameter(
          type: 'string',
          description: 'Unique identifier of the product',
        ),
      },
      requiredParameters: ['product_id'],
    );
  }

  static ToolDefinition _addToCartTool() {
    return ToolDefinition(
      name: 'add_to_cart',
      description: 'Add a product to the customer\'s shopping cart',
      parameters: {
        'product_id': ToolParameter(
          type: 'string',
          description: 'Product ID to add',
        ),
        'quantity': ToolParameter(
          type: 'number',
          description: 'Quantity to add (default 1)',
          defaultValue: 1,
        ),
        'variant_id': ToolParameter(
          type: 'string',
          description:
              'Product variant ID if applicable (for size/color variations)',
        ),
        'notes': ToolParameter(
          type: 'string',
          description: 'Special instructions or notes for this item',
        ),
      },
      requiredParameters: ['product_id'],
    );
  }

  static ToolDefinition _removeFromCartTool() {
    return ToolDefinition(
      name: 'remove_from_cart',
      description: 'Remove an item from the shopping cart',
      parameters: {
        'cart_item_id': ToolParameter(
          type: 'number',
          description: 'Cart item ID to remove',
        ),
      },
      requiredParameters: ['cart_item_id'],
    );
  }

  static ToolDefinition _viewCartTool() {
    return ToolDefinition(
      name: 'view_cart',
      description: 'View the current shopping cart with all items and total',
      parameters: {},
    );
  }

  static ToolDefinition _updateCartQuantityTool() {
    return ToolDefinition(
      name: 'update_cart_quantity',
      description: 'Update the quantity of an item in the cart',
      parameters: {
        'cart_item_id': ToolParameter(
          type: 'number',
          description: 'Cart item ID to update',
        ),
        'quantity': ToolParameter(
          type: 'number',
          description: 'New quantity (must be greater than 0)',
        ),
      },
      requiredParameters: ['cart_item_id', 'quantity'],
    );
  }

  static ToolDefinition _clearCartTool() {
    return ToolDefinition(
      name: 'clear_cart',
      description: 'Remove all items from the shopping cart',
      parameters: {},
    );
  }

  static ToolDefinition _checkoutTool() {
    return ToolDefinition(
      name: 'checkout',
      description: 'Create an order from the current cart items',
      parameters: {
        'shipping_address_id': ToolParameter(
          type: 'string',
          description: 'Shipping address ID (if customer has saved addresses)',
        ),
        'payment_method': ToolParameter(
          type: 'string',
          description: 'Payment method',
          enumValues: [
            'credit_card',
            'debit_card',
            'bank_transfer',
            'mobile_money',
            'bitcoin',
            'ethereum',
            'usdt'
          ],
        ),
        'customer_notes': ToolParameter(
          type: 'string',
          description: 'Special delivery instructions or notes',
        ),
      },
      requiredParameters: ['payment_method'],
    );
  }

  static ToolDefinition _trackOrderTool() {
    return ToolDefinition(
      name: 'track_order',
      description: 'Get current status and tracking information for an order',
      parameters: {
        'order_id': ToolParameter(
          type: 'string',
          description: 'Order ID or order number to track',
        ),
      },
      requiredParameters: ['order_id'],
    );
  }

  static ToolDefinition _viewOrderHistoryTool() {
    return ToolDefinition(
      name: 'view_order_history',
      description: 'View customer\'s past orders',
      parameters: {
        'limit': ToolParameter(
          type: 'number',
          description: 'Number of orders to return (default 10)',
          defaultValue: 10,
        ),
        'status': ToolParameter(
          type: 'string',
          description: 'Filter by order status',
          enumValues: [
            'pending',
            'confirmed',
            'shipped',
            'delivered',
            'cancelled'
          ],
        ),
      },
    );
  }

  static ToolDefinition _cancelOrderTool() {
    return ToolDefinition(
      name: 'cancel_order',
      description: 'Cancel a pending or confirmed order',
      parameters: {
        'order_id': ToolParameter(
          type: 'string',
          description: 'Order ID to cancel',
        ),
        'reason': ToolParameter(
          type: 'string',
          description: 'Reason for cancellation',
        ),
      },
      requiredParameters: ['order_id', 'reason'],
    );
  }

  static ToolDefinition _getVendorInfoTool() {
    return ToolDefinition(
      name: 'get_vendor_info',
      description: 'Get information about a vendor/seller',
      parameters: {
        'vendor_id': ToolParameter(
          type: 'string',
          description: 'Vendor ID',
        ),
      },
      requiredParameters: ['vendor_id'],
    );
  }

  static ToolDefinition _trackOrderByNumberTool() {
    return ToolDefinition(
      name: 'track_order_by_number',
      description: 'Track order status by order number (e.g., ORDER-12345)',
      parameters: {
        'order_number': ToolParameter(
          type: 'string',
          description: 'Order number to track',
        ),
      },
      requiredParameters: ['order_number'],
    );
  }

  static ToolDefinition _getRecentOrdersTool() {
    return ToolDefinition(
      name: 'get_recent_orders',
      description: 'Get customer\'s recent orders with optional filters',
      parameters: {
        'limit': ToolParameter(
          type: 'number',
          description: 'Number of orders to return',
          defaultValue: 5,
        ),
        'status': ToolParameter(
          type: 'string',
          description: 'Filter by status',
          enumValues: [
            'pending',
            'confirmed',
            'shipped',
            'delivered',
            'cancelled'
          ],
        ),
      },
    );
  }

  static ToolDefinition _requestOrderCancellationTool() {
    return ToolDefinition(
      name: 'request_order_cancellation',
      description: 'Request to cancel an order',
      parameters: {
        'order_number': ToolParameter(
          type: 'string',
          description: 'Order number to cancel',
        ),
        'reason': ToolParameter(
          type: 'string',
          description: 'Reason for cancellation',
        ),
      },
      requiredParameters: ['order_number', 'reason'],
    );
  }

  static ToolDefinition _getCartStatisticsTool() {
    return ToolDefinition(
      name: 'get_cart_statistics',
      description: 'Get detailed cart statistics and recommendations',
      parameters: {},
    );
  }

  static ToolDefinition _compareProductsTool() {
    return ToolDefinition(
      name: 'compare_products',
      description: 'Compare multiple products by their IDs',
      parameters: {
        'product_ids': ToolParameter(
          type: 'array',
          description: 'Array of product IDs to compare',
          items: ToolParameter(type: 'string'),
        ),
      },
      requiredParameters: ['product_ids'],
    );
  }

  // ========================================================================
  // TOOL HANDLERS
  // ========================================================================

  static Future<Map<String, dynamic>> _handleSearchProducts(
    Map<String, dynamic> arguments,
    ToolExecutionContext context,
  ) async {
    try {
      final session = context.session!;
      final query = arguments['query'] as String;
      final category = arguments['category'] as String?;
      final minPrice = (arguments['min_price'] as num?)?.toDouble();
      final maxPrice = (arguments['max_price'] as num?)?.toDouble();
      final limit = (arguments['limit'] as num?)?.toInt() ?? 20;

      // ✅ Use new search service
      final searchService = ProductSearchService(session);
      final products = await searchService.search(
        query: query,
        category: category,
        minPrice: minPrice,
        maxPrice: maxPrice,
        limit: limit,
      );

      if (products.isEmpty) {
        return {
          'success': true,
          'products': [],
          'message':
              'No products found matching "$query". Try different keywords or filters.',
        };
      }

      final user = await UserEndpoint().getProfile(session, UuidValue.fromString(context.userId),);

      Log.info(context.platform);

      // Send products as templates
      for (var product in products.take(5)) {
        await ProductTemplateSender.sendProductTemplate(
          session,
          product: product,
          platformUserId: user?.whatsappId ?? '',
          platform:
              PlatformType.values.firstWhere((p) => p.name == context.platform),
          conversationId: context.conversationId,
          userId: context.userId,
        );
      }

      return {
        'success': true,
        'message': 'Showing ${products.length} products',
        'products_sent': products.length,
      };
      // return {
      //   'success': true,
      //   'products': products
      //       .map((p) => {
      //             'id': p.id.uuid,
      //             'name': p.name,
      //             'description':
      //                 p.shortDescription ?? p.description.substring(0, 100),
      //             'price': p.basePrice,
      //             'currency': p.currency,
      //             'category': p.category,
      //             'image': p.thumbnailUrl ?? p.images.firstOrNull,
      //             'quantity': p.quantity,
      //             'vendor_name': p.vendor?.businessName,
      //           })
      //       .toList(),
      //   'count': products.length,
      //   'query': query,
      // };
    } catch (e) {
      return {
        'success': false,
        'error': 'Search failed: ${e.toString()}',
      };
    }
  }

  static Future<Map<String, dynamic>> _handleGetProductDetails(
    Map<String, dynamic> arguments,
    ToolExecutionContext context,
  ) async {
    try {
      final session = context.session!;
      final productId = arguments['product_id'] as String;

      final product = await ProductEndpoint().getProduct(
        session,
        UuidValue.fromString(productId),
      );

      if (product == null) {
        return {
          'success': false,
          'error': 'Product not found',
        };
      }

      return {
        'success': true,
        'product': {
          'id': product.id.uuid,
          'name': product.name,
          'description': product.description,
          'short_description': product.shortDescription,
          'price': product.basePrice,
          'discount_price': product.discountPrice,
          'currency': product.currency,
          'images': product.images,
          'thumbnail': product.thumbnailUrl,
          'vendor_id': product.vendorId.uuid,
          'category': product.category,
          'sub_category': product.subCategory,
          'tags': product.tags,
          'in_stock': product.quantity > 0,
          'quantity_available': product.quantity,
          'colors': product.color,
          'sizes': product.size,
          'material': product.material,
          'brand': product.brand,
          'weight': product.weight,
          'weight_unit': product.weightUnit,
          'rating': product.averageRating,
          'reviews': product.totalReviews,
          'free_shipping': product.freeShipping,
          'shipping_cost': product.shippingCost,
          'estimated_delivery_days': product.estimatedDeliveryDays,
        },
      };
    } catch (e) {
      return {
        'success': false,
        'error': 'Failed to get product details: ${e.toString()}',
      };
    }
  }

  static Future<Map<String, dynamic>> _handleAddToCart(
    Map<String, dynamic> arguments,
    ToolExecutionContext context,
  ) async {
    try {
      final session = context.session!;
      final productId = arguments['product_id'] as String;
      final quantity = (arguments['quantity'] as num?)?.toInt() ?? 1;
      final variantId = arguments['variant_id'] as String?;
      final notes = arguments['customer_notes'] as String?;

      final cartItem = await CartEndpoint().addToCart(
        session,
        customerId: UuidValue.fromString(context.userId),
        productId: UuidValue.fromString(productId),
        variantId: variantId != null ? UuidValue.fromString(variantId) : null,
        quantity: quantity,
        customerNotes: notes,
      );

      if (cartItem == null) {
        return {
          'success': false,
          'error': 'Failed to add item to cart',
        };
      }

      // Get updated cart summary
      final cartData = await CartEndpoint().getCartWithItems(
        session,
        UuidValue.fromString(context.userId),
      );

      final cart = cartData?['cart'] as Cart?;

      return {
        'success': true,
        'message': 'Item added to cart successfully',
        'cart_item_id': cartItem.id,
        'cart_summary': {
          'total_items': cart?.itemCount ?? 1,
          'subtotal': cart?.subtotal ?? cartItem.subtotal,
        },
      };
    } catch (e) {
      return {
        'success': false,
        'error': 'Failed to add to cart: ${e.toString()}',
      };
    }
  }

  static Future<Map<String, dynamic>> _handleRemoveFromCart(
    Map<String, dynamic> arguments,
    ToolExecutionContext context,
  ) async {
    try {
      final session = context.session!;
      final cartItemId = (arguments['cart_item_id'] as num).toInt();

      final success = await CartEndpoint().removeFromCart(session, cartItemId);

      if (!success) {
        return {
          'success': false,
          'error': 'Failed to remove item from cart',
        };
      }

      return {
        'success': true,
        'message': 'Item removed from cart',
      };
    } catch (e) {
      return {
        'success': false,
        'error': 'Failed to remove from cart: ${e.toString()}',
      };
    }
  }

  static Future<Map<String, dynamic>> _handleViewCart(
    Map<String, dynamic> arguments,
    ToolExecutionContext context,
  ) async {
    try {
      final session = context.session!;
      final cartData = await CartEndpoint().getCartWithItems(
        session,
        UuidValue.fromString(context.userId),
      );

      if (cartData == null) {
        return {
          'success': true,
          'message': 'Cart is empty',
          'items': [],
          'total_items': 0,
          'subtotal': 0.0,
        };
      }

      final cart = cartData['cart'] as Cart;
      final items = cartData['items'] as List<CartItem>;

      return {
        'success': true,
        'items': items
            .map((item) => {
                  'cart_item_id': item.id,
                  'product_id': item.productId.uuid,
                  'quantity': item.quantity,
                  'unit_price': item.unitPrice,
                  'subtotal': item.subtotal,
                  'notes': item.customerNotes,
                })
            .toList(),
        'total_items': cart.itemCount,
        'subtotal': cart.subtotal,
      };
    } catch (e) {
      return {
        'success': false,
        'error': 'Failed to view cart: ${e.toString()}',
      };
    }
  }

  static Future<Map<String, dynamic>> _handleUpdateCartQuantity(
    Map<String, dynamic> arguments,
    ToolExecutionContext context,
  ) async {
    try {
      final session = context.session!;
      final cartItemId = (arguments['cart_item_id'] as num).toInt();
      final quantity = (arguments['quantity'] as num).toInt();

      final success = await CartEndpoint().updateCartItemQuantity(
        session,
        cartItemId: cartItemId,
        quantity: quantity,
      );

      if (!success) {
        return {
          'success': false,
          'error': 'Failed to update quantity',
        };
      }

      return {
        'success': true,
        'message': 'Quantity updated successfully',
      };
    } catch (e) {
      return {
        'success': false,
        'error': 'Failed to update quantity: ${e.toString()}',
      };
    }
  }

  static Future<Map<String, dynamic>> _handleClearCart(
    Map<String, dynamic> arguments,
    ToolExecutionContext context,
  ) async {
    try {
      final session = context.session!;
      final success = await CartEndpoint().clearCart(
        session,
        UuidValue.fromString(context.userId),
      );

      if (!success) {
        return {
          'success': false,
          'error': 'Failed to clear cart',
        };
      }

      return {
        'success': true,
        'message': 'Cart cleared successfully',
      };
    } catch (e) {
      return {
        'success': false,
        'error': 'Failed to clear cart: ${e.toString()}',
      };
    }
  }

  static Future<Map<String, dynamic>> _handleCheckout(
    Map<String, dynamic> arguments,
    ToolExecutionContext context,
  ) async {
    try {
      final session = context.session!;
      final shippingAddressId = arguments['shipping_address_id'] as String?;
      final paymentMethodStr = arguments['payment_method'] as String;
      final customerNotes = arguments['customer_notes'] as String?;

      // Convert payment method string to enum
      final paymentMethod = _parsePaymentMethod(paymentMethodStr);

      // For now, use a default address if none provided
      // In production, you'd handle address creation/selection
      if (shippingAddressId == null) {
        return {
          'success': false,
          'error': 'Please provide a shipping address to complete checkout',
          'action_needed': 'provide_address',
        };
      }

      final order = await OrderEndpoint().createOrder(
        session,
        customerId: UuidValue.fromString(context.userId),
        shippingAddressId: UuidValue.fromString(shippingAddressId),
        paymentMethod: paymentMethod,
        customerNotes: customerNotes,
        conversationId: UuidValue.fromString(context.conversationId),
      );

      if (order == null) {
        return {
          'success': false,
          'error': 'Failed to create order',
        };
      }

      return {
        'success': true,
        'message': 'Order placed successfully!',
        'order': {
          'order_id': order.id.uuid,
          'order_number': order.orderNumber,
          'total_amount': order.totalAmount,
          'currency': order.currency,
          'status': order.status.name,
          'estimated_delivery': order.estimatedDeliveryDate?.toIso8601String(),
        },
      };
    } catch (e) {
      return {
        'success': false,
        'error': 'Failed to checkout: ${e.toString()}',
      };
    }
  }

  static Future<Map<String, dynamic>> _handleTrackOrder(
    Map<String, dynamic> arguments,
    ToolExecutionContext context,
  ) async {
    try {
      final session = context.session!;
      final orderId = arguments['order_id'] as String;

      final order = await OrderEndpoint().getOrder(
        session,
        UuidValue.fromString(orderId),
      );

      if (order == null) {
        return {
          'success': false,
          'error': 'Order not found',
        };
      }

      // Get escrow info
      final escrow = await OrderEscrow.db.findFirstRow(
        session,
        where: (t) => t.orderId.equals(order.id),
      );

      return {
        'success': true,
        'order': {
          'order_number': order.orderNumber,
          'status': order.status.name,
          'total_amount': order.totalAmount,
          'currency': order.currency,
          'created_at': order.createdAt.toIso8601String(),
          'confirmed_at': order.confirmedAt?.toIso8601String(),
          'shipped_at': order.shippedAt?.toIso8601String(),
          'delivered_at': order.deliveredAt?.toIso8601String(),
          'tracking_number': order.trackingNumber,
          'estimated_delivery': order.estimatedDeliveryDate?.toIso8601String(),
          'shipping_provider': order.shippingProvider,
          'daysLeft': escrow != null
              ? escrow.isReturnWindowActive
                  ? escrow.returnWindowEnd!.difference(DateTime.now()).inDays
                  : 'Awaiting delivery confirmation'
              : ''
        },
      };
    } catch (e) {
      return {
        'success': false,
        'error': 'Failed to track order: ${e.toString()}',
      };
    }
  }

  static Future<Map<String, dynamic>> _handleViewOrderHistory(
    Map<String, dynamic> arguments,
    ToolExecutionContext context,
  ) async {
    try {
      final session = context.session!;
      final limit = (arguments['limit'] as num?)?.toInt() ?? 10;
      final statusStr = arguments['status'] as String?;

      OrderStatus? status;
      if (statusStr != null) {
        status = _parseOrderStatus(statusStr);
      }

      final orders = await OrderEndpoint().getCustomerOrders(
        session,
        customerId: UuidValue.fromString(context.userId),
        status: status,
        limit: limit,
      );

      return {
        'success': true,
        'orders': orders
            .map((order) => {
                  'order_id': order.id.uuid,
                  'order_number': order.orderNumber,
                  'status': order.status.name,
                  'total_amount': order.totalAmount,
                  'currency': order.currency,
                  'created_at': order.createdAt.toIso8601String(),
                  'delivered_at': order.deliveredAt?.toIso8601String(),
                })
            .toList(),
        'count': orders.length,
      };
    } catch (e) {
      return {
        'success': false,
        'error': 'Failed to get order history: ${e.toString()}',
      };
    }
  }

  static Future<Map<String, dynamic>> _handleCancelOrder(
    Map<String, dynamic> arguments,
    ToolExecutionContext context,
  ) async {
    try {
      final session = context.session!;
      final orderId = arguments['order_id'] as String;
      final reason = arguments['reason'] as String;

      final success = await OrderEndpoint().cancelOrder(
        session,
        orderId: UuidValue.fromString(orderId),
        cancellationReason: reason,
      );

      if (!success) {
        return {
          'success': false,
          'error': 'Failed to cancel order. It may have already been shipped.',
        };
      }

      return {
        'success': true,
        'message': 'Order cancelled successfully',
      };
    } catch (e) {
      return {
        'success': false,
        'error': 'Failed to cancel order: ${e.toString()}',
      };
    }
  }

  static Future<Map<String, dynamic>> _handleGetVendorInfo(
    Map<String, dynamic> arguments,
    ToolExecutionContext context,
  ) async {
    try {
      final session = context.session!;
      final vendorId = arguments['vendor_id'] as String;

      final vendor = await VendorProfile.db.findFirstRow(
        session,
        where: (t) => t.userId.equals(UuidValue.fromString(vendorId)),
      );

      if (vendor == null) {
        return {
          'success': false,
          'error': 'Vendor not found',
        };
      }

      return {
        'success': true,
        'vendor': {
          'business_name': vendor.businessName,
          'description': vendor.businessDescription,
          'category': vendor.businessCategory,
          'logo': vendor.businessLogoUrl,
          'rating': vendor.averageRating,
          'total_reviews': vendor.totalReviews,
          'total_products': vendor.totalProducts,
          'support_email': vendor.supportEmail,
          'support_phone': vendor.supportPhone,
          'response_time_hours': vendor.responseTime,
        },
      };
    } catch (e) {
      return {
        'success': false,
        'error': 'Failed to get vendor info: ${e.toString()}',
      };
    }
  }

  static Future<Map<String, dynamic>> _handleTrackOrderByNumber(
    Map<String, dynamic> arguments,
    ToolExecutionContext context,
  ) async {
    final session = context.session!;
    final orderNumber = arguments['order_number'] as String;

    final order = await Order.db.findFirstRow(
      session,
      where: (t) => t.orderNumber.equals(orderNumber),
    );

    if (order == null) {
      return {
        'success': false,
        'error': 'Order not found: $orderNumber',
      };
    }

    return {
      'success': true,
      'order': {
        'order_number': order.orderNumber,
        'status': order.status.name,
        'status_description': _getStatusDescription(order.status),
        'total_amount': order.totalAmount,
        'currency': order.currency,
        'created_at': order.createdAt.toIso8601String(),
        'estimated_delivery': order.estimatedDeliveryDate?.toIso8601String(),
        'tracking_number': order.trackingNumber,
        'shipping_provider': order.shippingProvider,
        'customer_notes': order.customerNotes,
      },
    };
  }

  static Future<Map<String, dynamic>> _handleGetRecentOrders(
    Map<String, dynamic> arguments,
    ToolExecutionContext context,
  ) async {
    final session = context.session!;
    final limit = (arguments['limit'] as num?)?.toInt() ?? 5;
    final statusStr = arguments['status'] as String?;

    OrderStatus? status;
    if (statusStr != null) {
      status = _parseOrderStatus(statusStr);
    }

    final orders = await OrderEndpoint().getCustomerOrders(
      session,
      customerId: UuidValue.fromString(context.userId),
      status: status,
      limit: limit,
    );

    return {
      'success': true,
      'orders': orders
          .map((o) => {
                'order_number': o.orderNumber,
                'status': o.status.name,
                'total': o.totalAmount,
                'currency': o.currency,
                'date': o.createdAt.toIso8601String(),
                'items_count': 1, // You might want to query this
              })
          .toList(),
      'count': orders.length,
    };
  }

  static Future<Map<String, dynamic>> _handleRequestOrderCancellation(
    Map<String, dynamic> arguments,
    ToolExecutionContext context,
  ) async {
    final session = context.session!;
    final orderNumber = arguments['order_number'] as String;
    final reason = arguments['reason'] as String;

    final order = await Order.db.findFirstRow(
      session,
      where: (t) => t.orderNumber.equals(orderNumber),
    );

    if (order == null) {
      return {
        'success': false,
        'error': 'Order not found',
      };
    }

    // Check if cancellable
    if (order.status == OrderStatus.shipped ||
        order.status == OrderStatus.delivered) {
      return {
        'success': false,
        'error': 'Cannot cancel order that has been shipped or delivered',
        'status': order.status.name,
      };
    }

    final success = await OrderEndpoint().cancelOrder(
      session,
      orderId: order.id,
      cancellationReason: reason,
    );

    if (success) {
      return {
        'success': true,
        'message': 'Order cancelled successfully',
        'order_number': order.orderNumber,
        'refund_info': 'Refund will be processed within 3-5 business days',
      };
    }

    return {
      'success': false,
      'error': 'Failed to cancel order',
    };
  }

  static Future<Map<String, dynamic>> _handleGetCartStatistics(
    Map<String, dynamic> arguments,
    ToolExecutionContext context,
  ) async {
    final session = context.session!;
    final cartData = await CartEndpoint().getCartWithItems(
      session,
      UuidValue.fromString(context.userId),
    );

    if (cartData == null) {
      return {
        'success': true,
        'cart_empty': true,
        'message': 'Cart is empty',
      };
    }

    final cart = cartData['cart'] as Cart;
    final items = cartData['items'] as List<CartItem>;

    // Calculate statistics
    double totalSavings = 0;
    int uniqueVendors = 0;

    return {
      'success': true,
      'statistics': {
        'item_count': cart.itemCount,
        'subtotal': cart.subtotal,
        'total_savings': totalSavings,
        'unique_vendors': uniqueVendors,
        'average_item_price': cart.subtotal / cart.itemCount,
      },
      'items': items
          .map((i) => {
                'quantity': i.quantity,
                'unit_price': i.unitPrice,
                'subtotal': i.subtotal,
              })
          .toList(),
    };
  }

  static Future<Map<String, dynamic>> _handleCompareProducts(
    Map<String, dynamic> arguments,
    ToolExecutionContext context,
  ) async {
    final session = context.session!;
    final productIds = (arguments['product_ids'] as List).cast<String>();

    if (productIds.length < 2) {
      return {
        'success': false,
        'error': 'At least 2 products required for comparison',
      };
    }

    if (productIds.length > 5) {
      return {
        'success': false,
        'error': 'Maximum 5 products can be compared at once',
      };
    }

    final products = <Product>[];
    for (var id in productIds) {
      final product = await ProductEndpoint().getProduct(
        session,
        UuidValue.fromString(id),
      );
      if (product != null) {
        products.add(product);
      }
    }

    if (products.isEmpty) {
      return {
        'success': false,
        'error': 'No valid products found',
      };
    }

    return {
      'success': true,
      'comparison': products
          .map((p) => {
                'id': p.id.uuid,
                'name': p.name,
                'price': p.basePrice,
                'discount_price': p.discountPrice,
                'rating': p.averageRating,
                'reviews': p.totalReviews,
                'in_stock': p.quantity > 0,
                'free_shipping': p.freeShipping,
                'estimated_delivery_days': p.estimatedDeliveryDays,
              })
          .toList(),
      'recommendations': {
        'best_price': products
            .reduce((a, b) => (a.discountPrice ?? a.basePrice) <
                    (b.discountPrice ?? b.basePrice)
                ? a
                : b)
            .name,
        'best_rated': products
            .reduce((a, b) => a.averageRating > b.averageRating ? a : b)
            .name,
      },
    };
  }

  // Helper methods
  static PaymentMethod _parsePaymentMethod(String method) {
    switch (method.toLowerCase()) {
      case 'credit_card':
        return PaymentMethod.credit_card;
      case 'debit_card':
        return PaymentMethod.debit_card;
      case 'bank_transfer':
        return PaymentMethod.bank_transfer;
      case 'mobile_money':
        return PaymentMethod.mobile_money;
      case 'bitcoin':
        return PaymentMethod.bitcoin;
      case 'ethereum':
        return PaymentMethod.ethereum;
      case 'usdt':
        return PaymentMethod.usdt;
      default:
        return PaymentMethod.credit_card;
    }
  }

  static OrderStatus _parseOrderStatus(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return OrderStatus.pending;
      case 'confirmed':
        return OrderStatus.confirmed;
      case 'shipped':
        return OrderStatus.shipped;
      case 'delivered':
        return OrderStatus.delivered;
      case 'cancelled':
        return OrderStatus.cancelled;
      default:
        return OrderStatus.pending;
    }
  }

  static String _getStatusDescription(OrderStatus status) {
    final descriptions = {
      OrderStatus.pending: 'Order received, awaiting confirmation',
      OrderStatus.confirmed: 'Order confirmed by vendor',
      OrderStatus.processing: 'Order is being prepared',
      OrderStatus.packed: 'Order is packed and ready for shipping',
      OrderStatus.shipped: 'Order has been shipped',
      OrderStatus.out_for_delivery: 'Order is out for delivery',
      OrderStatus.delivered: 'Order has been delivered',
      OrderStatus.cancelled: 'Order has been cancelled',
      OrderStatus.refunded: 'Order has been refunded',
      OrderStatus.failed: 'Order processing failed',
    };
    return descriptions[status] ?? 'Unknown status';
  }
}
