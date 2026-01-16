import 'dart:async';

import 'package:asami_server/src/services/product/product_creation_handler.dart';
import 'package:asami_server/utils/logger/asami_logger.dart';
import 'package:serverpod/serverpod.dart' hide Order;
import '../../../endpoints/analytics_endpoint.dart';
import '../../../endpoints/order_endpoint.dart';
import '../../../endpoints/product_endpoint.dart';
import '../../../endpoints/subscription_endpoint.dart';
import '../../../generated/protocol.dart';
import '../../catalog/meta_catalog_service.dart';
import '../../dependency_injection.dart';
import '../../media/enanced_media_services.dart';
import '../../messaging/telegram/telegram_service.dart';
import '../../messaging/whatsapp/whatsapp_service.dart';
import 'tool_definition.dart';
import 'tool_registry.dart';

class VendorTools {
  /// Register all vendor tools with the registry
  static void registerAll(ToolRegistry registry) {
    // 1. Create Product
    registry.register(
      definition: _createProductTool(),
      handler: _handleCreateProduct,
      allowedRoles: ['vendor'],
    );

    // 2. Update Product
    registry.register(
      definition: _updateProductTool(),
      handler: _handleUpdateProduct,
      allowedRoles: ['vendor'],
    );

    // 3. Delete Product
    registry.register(
      definition: _deleteProductTool(),
      handler: _handleDeleteProduct,
      allowedRoles: ['vendor'],
    );

    // 4. List Vendor Products
    registry.register(
      definition: _listVendorProductsTool(),
      handler: _handleListVendorProducts,
      allowedRoles: ['vendor'],
    );

    // 5. Update Inventory
    registry.register(
      definition: _updateInventoryTool(),
      handler: _handleUpdateInventory,
      allowedRoles: ['vendor'],
    );

    // 6. Get Vendor Analytics
    registry.register(
      definition: _getVendorAnalyticsTool(),
      handler: _handleGetVendorAnalytics,
      allowedRoles: ['vendor'],
    );

    // 7. View Vendor Orders
    registry.register(
      definition: _viewVendorOrdersTool(),
      handler: _handleViewVendorOrders,
      allowedRoles: ['vendor'],
    );

    // 8. Update Order Status
    registry.register(
      definition: _updateOrderStatusTool(),
      handler: _handleUpdateOrderStatus,
      allowedRoles: ['vendor'],
    );

    // 9. Get Order Details
    registry.register(
      definition: _getOrderDetailsTool(),
      handler: _handleGetOrderDetails,
      allowedRoles: ['vendor'],
    );

    // 10. Get Subscription Info
    registry.register(
      definition: _getSubscriptionInfoTool(),
      handler: _handleGetSubscriptionInfo,
      allowedRoles: ['vendor'],
    );

    // 11. Check Tier Limits
    registry.register(
      definition: _checkTierLimitsTool(),
      handler: _handleCheckTierLimits,
      allowedRoles: ['vendor'],
    );

    // 12. Get Top Selling Products
    registry.register(
      definition: _getTopSellingProductsTool(),
      handler: _handleGetTopSellingProducts,
      allowedRoles: ['vendor'],
    );

    // 13. Bulk Update Inventory
    registry.register(
      definition: _bulkUpdateInventoryTool(),
      handler: _handleBulkUpdateInventory,
      allowedRoles: ['vendor'],
    );

    // 14. Get Inventory Alerts
    registry.register(
      definition: _getInventoryAlertsTool(),
      handler: _handleGetInventoryAlerts,
      allowedRoles: ['vendor'],
    );

    // 15. Get Full Order Details
    registry.register(
      definition: _getFullOrderDetailsTool(),
      handler: _handleGetFullOrderDetails,
      allowedRoles: ['vendor'],
    );

    // 16. Batch Update Order Status
    registry.register(
      definition: _batchUpdateOrderStatusTool(),
      handler: _handleBatchUpdateOrderStatus,
      allowedRoles: ['vendor'],
    );

    // 17. Get Product Performance
    registry.register(
      definition: _getProductPerformanceTool(),
      handler: _handleGetProductPerformance,
      allowedRoles: ['vendor'],
    );
  }

  // ========================================================================
  // TOOL DEFINITIONS
  // ========================================================================

  static ToolDefinition _createProductTool() {
    return ToolDefinition(
      name: 'create_product',
      description: '''
Initiate product creation flow. This starts an interactive process where the system will:
1. Ask user to send product images (1-5 images)
2. Request product details in one batch
3. Create the product and sync to Meta Catalog

DO NOT collect product details before calling this - the flow handles it.
Call this immediately when user wants to add/create/upload a product.
''',
      parameters: {
        'name': ToolParameter(
          type: 'string',
          description: 'Product name',
        ),
        'description': ToolParameter(
          type: 'string',
          description: 'Detailed product description',
        ),
        'short_description': ToolParameter(
          type: 'string',
          description: 'Brief product description',
        ),
        'category': ToolParameter(
          type: 'string',
          description: 'Product category',
        ),
        'base_price': ToolParameter(
          type: 'number',
          description: 'Base selling price',
        ),
        'quantity': ToolParameter(
          type: 'number',
          description: 'Initial stock quantity',
          defaultValue: 0,
        ),
        'color': ToolParameter(
          type: 'array',
          description: 'Available colors',
          items: ToolParameter(type: 'string'),
        ),
        'size': ToolParameter(
          type: 'array',
          description: 'Available sizes',
          items: ToolParameter(type: 'string'),
        ),
        'use_ai_description': ToolParameter(
          type: 'boolean',
          description:
              'Whether AI was used to generate the description (for billing)',
          defaultValue: false,
        ),
        'images': ToolParameter(
          type: 'array',
          description: 'Array of image media IDs from WhatsApp/Telegram',
          items: ToolParameter(type: 'string'),
        ),
        'video_media_id': ToolParameter(
          type: 'string',
          description: 'Video media ID (Pro/Pro Max only)',
        ),
        'platform': ToolParameter(
          type: 'string',
          description: 'Platform where media was sent (whatsapp/telegram)',
          enumValues: ['whatsapp', 'telegram'],
        ),
        'use_ai_image_generation': ToolParameter(
          type: 'boolean',
          description: 'Generate images with AI (Pro Max only)',
        ),
      },
      requiredParameters: ['name', 'description', 'category', 'base_price'],
    );
  }

  static ToolDefinition _updateProductTool() {
    return ToolDefinition(
      name: 'update_product',
      description: 'Update an existing product',
      parameters: {
        'product_id': ToolParameter(
          type: 'string',
          description: 'Product ID to update',
        ),
        'name': ToolParameter(type: 'string', description: 'New product name'),
        'description':
            ToolParameter(type: 'string', description: 'New description'),
        'base_price': ToolParameter(type: 'number', description: 'New price'),
        'discount_price':
            ToolParameter(type: 'number', description: 'Discount price'),
        'quantity':
            ToolParameter(type: 'number', description: 'New stock quantity'),
        'is_active':
            ToolParameter(type: 'boolean', description: 'Active status'),
      },
      requiredParameters: ['product_id'],
    );
  }

  static ToolDefinition _deleteProductTool() {
    return ToolDefinition(
      name: 'delete_product',
      description: 'Delete/deactivate a product',
      parameters: {
        'product_id': ToolParameter(
          type: 'string',
          description: 'Product ID to delete',
        ),
      },
      requiredParameters: ['product_id'],
    );
  }

  static ToolDefinition _listVendorProductsTool() {
    return ToolDefinition(
      name: 'list_vendor_products',
      description: 'Get list of vendor\'s products',
      parameters: {
        'status': ToolParameter(
          type: 'string',
          description: 'Filter by status',
          enumValues: ['draft', 'active', 'out_of_stock'],
        ),
        'limit': ToolParameter(
          type: 'number',
          description: 'Number of products to return',
          defaultValue: 20,
        ),
      },
    );
  }

  static ToolDefinition _updateInventoryTool() {
    return ToolDefinition(
      name: 'update_inventory',
      description: 'Update stock quantity for a product',
      parameters: {
        'product_id': ToolParameter(
          type: 'string',
          description: 'Product ID',
        ),
        'quantity': ToolParameter(
          type: 'number',
          description: 'New stock quantity',
        ),
      },
      requiredParameters: ['product_id', 'quantity'],
    );
  }

  static ToolDefinition _getVendorAnalyticsTool() {
    return ToolDefinition(
      name: 'get_vendor_analytics',
      description: 'Get sales analytics and business metrics',
      parameters: {
        'period': ToolParameter(
          type: 'string',
          description: 'Time period for analytics',
          enumValues: ['today', 'week', 'month', 'year'],
          defaultValue: 'today',
        ),
      },
    );
  }

  static ToolDefinition _viewVendorOrdersTool() {
    return ToolDefinition(
      name: 'view_vendor_orders',
      description: 'View incoming orders for the vendor',
      parameters: {
        'status': ToolParameter(
          type: 'string',
          description: 'Filter by order status',
          enumValues: [
            'pending',
            'confirmed',
            'processing',
            'packed',
            'shipped',
            'delivered',
            'out_for_delivery',
            'cancelled'
          ],
        ),
        'limit': ToolParameter(
          type: 'number',
          description: 'Number of orders to return',
          defaultValue: 20,
        ),
      },
    );
  }

  static ToolDefinition _updateOrderStatusTool() {
    return ToolDefinition(
      name: 'update_order_status',
      description: 'Update the status of an order',
      parameters: {
        'order_id': ToolParameter(
          type: 'string',
          description: 'Order ID',
        ),
        'status': ToolParameter(
          type: 'string',
          description: 'New order status',
          enumValues: [
            'pending',
            'confirmed',
            'processing',
            'packed',
            'shipped',
            'delivered',
            'out_for_delivery',
            'cancelled'
          ],
        ),
        'tracking_number': ToolParameter(
          type: 'string',
          description: 'Tracking number (for shipped status) e.g ORDER-1768407987087',
        ),
        'notes': ToolParameter(
          type: 'string',
          description: 'Vendor notes about the order',
        ),
      },
      requiredParameters: ['tracking_number', 'status'],
    );
  }

  static ToolDefinition _getOrderDetailsTool() {
    return ToolDefinition(
      name: 'get_order_details',
      description: 'Get detailed information about a specific order',
      parameters: {
        'order_id': ToolParameter(
          type: 'string',
          description: 'Order ID',
        ),
      },
      requiredParameters: ['order_id'],
    );
  }

  static ToolDefinition _getSubscriptionInfoTool() {
    return ToolDefinition(
      name: 'get_subscription_info',
      description: 'Get vendor subscription tier and limits information',
      parameters: {},
    );
  }

  static ToolDefinition _checkTierLimitsTool() {
    return ToolDefinition(
      name: 'check_tier_limits',
      description: 'Check current usage against subscription tier limits',
      parameters: {},
    );
  }

  static ToolDefinition _getTopSellingProductsTool() {
    return ToolDefinition(
      name: 'get_top_selling_products',
      description: 'Get vendor\'s best-selling products',
      parameters: {
        'limit': ToolParameter(
          type: 'number',
          description: 'Number of products to return',
          defaultValue: 10,
        ),
      },
    );
  }

  static ToolDefinition _bulkUpdateInventoryTool() {
    return ToolDefinition(
      name: 'bulk_update_inventory',
      description: 'Update inventory for multiple products at once',
      parameters: {
        'updates': ToolParameter(
          type: 'array',
          description: 'Array of {product_id, quantity} objects',
          items: ToolParameter(type: 'object'),
        ),
      },
      requiredParameters: ['updates'],
    );
  }

  static ToolDefinition _getInventoryAlertsTool() {
    return ToolDefinition(
      name: 'get_inventory_alerts',
      description:
          'Get products that need inventory attention (low stock, out of stock)',
      parameters: {
        'alert_type': ToolParameter(
          type: 'string',
          description: 'Type of alert',
          enumValues: ['low_stock', 'out_of_stock', 'all'],
          defaultValue: 'all',
        ),
      },
    );
  }

  static ToolDefinition _getFullOrderDetailsTool() {
    return ToolDefinition(
      name: 'get_full_order_details',
      description:
          'Get complete order details including items and customer info',
      parameters: {
        'order_number': ToolParameter(
          type: 'string',
          description: 'Order number e.g ORDER-1768407987087',
        ),
      },
      requiredParameters: ['order_number'],
    );
  }

  static ToolDefinition _batchUpdateOrderStatusTool() {
    return ToolDefinition(
      name: 'batch_update_order_status',
      description: 'Update status for multiple orders at once',
      parameters: {
        'updates': ToolParameter(
          type: 'array',
          description: 'Array of {order_number, status} objects',
          items: ToolParameter(type: 'object'),
        ),
      },
      requiredParameters: ['updates'],
    );
  }

  static ToolDefinition _getProductPerformanceTool() {
    return ToolDefinition(
      name: 'get_product_performance',
      description: 'Get detailed performance metrics for products',
      parameters: {
        'product_id': ToolParameter(
          type: 'string',
          description: 'Specific product ID (optional)',
        ),
        'limit': ToolParameter(
          type: 'number',
          description: 'Number of products to analyze',
          defaultValue: 10,
        ),
        'sort_by': ToolParameter(
          type: 'string',
          description: 'Sort criteria',
          enumValues: ['sales', 'views', 'revenue', 'rating'],
          defaultValue: 'sales',
        ),
      },
    );
  }

  // ========================================================================
  // TOOL HANDLERS
  // ========================================================================

  static Future<Map<String, dynamic>> _handleCreateProduct(
    Map<String, dynamic> arguments,
    ToolExecutionContext context,
  ) async {
    try {
      final session = context.session!;

      // Get user
      final user =
          await User.db.findById(session, UuidValue.fromString(context.userId));

      if (user == null) {
        return {
          'success': false,
          'error': 'User not found',
        };
      }

      // Get conversation
      final conversation = await Conversation.db.findById(
        session,
        UuidValue.fromString(context.conversationId),
      );

      if (conversation == null) {
        return {
          'success': false,
          'error': 'Conversation not found',
        };
      }

      // Get platform
      final platform = PlatformType.values.firstWhere(
        (p) => p.name == context.platform,
        orElse: () => PlatformType.whatsapp,
      );

      // Initialize product creation handler
      final productHandler = getIt<ProductCreationHandler>();

      // Check if already in creation flow
      if (await productHandler.isInCreationFlow(
          session, conversation.id.uuid)) {
        return {
          'success': false,
          'error':
              'You are already creating a product. Type "/cancel" to start over.',
          'in_creation_flow': true,
        };
      }

      // Initiate creation
      final result = await productHandler.initiateCreation(
        session,
        user: user,
        conversation: conversation,
        platform: platform,
      );

      if (!result['success']) {
        return result;
      }

      return {
        'success': true,
        'message': result['message'],
        'in_creation_flow': true,
        'state': 'awaiting_images',
      };
    } catch (e, stackTrace) {
      Log.info('❌ Create product error: $e');
      Log.error(e.toString(), stackTrace: stackTrace);
      return {
        'success': false,
        'error': 'Failed to initiate product creation: ${e.toString()}',
      };
    }
  }

  static Future<Map<String, dynamic>> _handleUpdateProduct(
    Map<String, dynamic> arguments,
    ToolExecutionContext context,
  ) async {
    try {
      final session = context.session!;
      final productId = arguments['product_id'] as String;
      final name = arguments['name'] as String?;
      final description = arguments['description'] as String?;
      final basePrice = (arguments['base_price'] as num?)?.toDouble();
      final discountPrice = (arguments['discount_price'] as num?)?.toDouble();
      final quantity = (arguments['quantity'] as num?)?.toInt();
      final isActive = arguments['is_active'] as bool?;

      final product = await ProductEndpoint().updateProduct(
        session,
        productId: UuidValue.fromString(productId),
        name: name,
        description: description,
        basePrice: basePrice,
        discountPrice: discountPrice,
        quantity: quantity,
        isActive: isActive,
      );

      if (product == null) {
        return {
          'success': false,
          'error': 'Failed to update product. Product may not exist.',
        };
      }

      // Sync is handled automatically by ProductEndpoint

      return {
        'success': true,
        'message':
            'Product updated successfully! Changes synced to Meta Catalog.',
      };
    } catch (e) {
      return {
        'success': false,
        'error': 'Failed to update product: ${e.toString()}',
      };
    }
  }

  static Future<Map<String, dynamic>> _handleDeleteProduct(
    Map<String, dynamic> arguments,
    ToolExecutionContext context,
  ) async {
    try {
      final session = context.session!;
      final productId = arguments['product_id'] as String;

      final success = await ProductEndpoint().deleteProduct(
        session,
        UuidValue.fromString(productId),
      );

      if (!success) {
        return {
          'success': false,
          'error': 'Failed to delete product',
        };
      }

      // Sync is handled automatically by ProductEndpoint

      return {
        'success': true,
        'message': 'Product deleted successfully! Removed from all platforms.',
      };
    } catch (e) {
      return {
        'success': false,
        'error': 'Failed to delete product: ${e.toString()}',
      };
    }
  }

  static Future<Map<String, dynamic>> _handleListVendorProducts(
    Map<String, dynamic> arguments,
    ToolExecutionContext context,
  ) async {
    try {
      final session = context.session!;
      final statusStr = arguments['status'] as String?;
      final limit = (arguments['limit'] as num?)?.toInt() ?? 20;

      ProductStatus? status;
      if (statusStr != null) {
        status = _parseProductStatus(statusStr);
      }

      final products = await ProductEndpoint().getVendorProducts(
        session,
        vendorId: UuidValue.fromString(context.userId),
        status: status,
        limit: limit,
      );

      return {
        'success': true,
        'products': products
            .map((p) => {
                  'id': p.id.uuid,
                  'name': p.name,
                  'price': p.basePrice,
                  'quantity': p.quantity,
                  'status': p.status.name,
                  'views': p.viewCount,
                  'orders': p.orderCount,
                  'is_active': p.isActive,
                })
            .toList(),
        'count': products.length,
      };
    } catch (e) {
      return {
        'success': false,
        'error': 'Failed to list products: ${e.toString()}',
      };
    }
  }

  static Future<Map<String, dynamic>> _handleUpdateInventory(
    Map<String, dynamic> arguments,
    ToolExecutionContext context,
  ) async {
    try {
      final session = context.session!;
      final productId = arguments['product_id'] as String;
      final quantity = (arguments['quantity'] as num).toInt();

      final success = await ProductEndpoint().updateInventory(
        session,
        productId: UuidValue.fromString(productId),
        quantity: quantity,
      );

      if (!success) {
        return {
          'success': false,
          'error': 'Failed to update inventory',
        };
      }

      return {
        'success': true,
        'message': 'Inventory updated successfully',
        'new_quantity': quantity,
      };
    } catch (e) {
      return {
        'success': false,
        'error': 'Failed to update inventory: ${e.toString()}',
      };
    }
  }

  static Future<Map<String, dynamic>> _handleGetVendorAnalytics(
    Map<String, dynamic> arguments,
    ToolExecutionContext context,
  ) async {
    try {
      final session = context.session!;
      final period = arguments['period'] as String? ?? 'today';

      final dashboard = await AnalyticsEndpoint().getVendorDashboard(
        session,
        UuidValue.fromString(context.userId),
      );

      final vendor = dashboard['vendor'] as VendorProfile;
      final today = dashboard['today'] as VendorAnalytics?;
      final weekSummary = dashboard['week_summary'] as Map<String, dynamic>;

      return {
        'success': true,
        'period': period,
        'analytics': {
          'today': {
            'revenue': today?.totalRevenue ?? 0.0,
            'orders': today?.totalOrders ?? 0,
            'average_order_value': today?.averageOrderValue ?? 0.0,
          },
          'this_week': {
            'revenue': weekSummary['revenue'] ?? 0.0,
            'orders': weekSummary['orders'] ?? 0,
            'average_order_value': weekSummary['average_order_value'] ?? 0.0,
          },
          'totals': {
            'total_products': vendor.totalProducts,
            'active_products': vendor.activeProducts,
            'total_orders': vendor.totalOrders,
            'total_revenue': vendor.totalRevenue,
            'average_rating': vendor.averageRating,
          },
          'subscription': {
            'tier': vendor.subscriptionTier.name,
            'products_used': vendor.currentProductCount,
            'products_limit': vendor.productLimit,
            'ai_used': vendor.aiDescriptionsUsed,
            'ai_limit': vendor.aiDescriptionsLimit,
          },
        },
      };
    } catch (e) {
      return {
        'success': false,
        'error': 'Failed to get analytics: ${e.toString()}',
      };
    }
  }

  static Future<Map<String, dynamic>> _handleViewVendorOrders(
    Map<String, dynamic> arguments,
    ToolExecutionContext context,
  ) async {
    try {
      final session = context.session!;
      final statusStr = arguments['status'] as String?;
      final limit = (arguments['limit'] as num?)?.toInt() ?? 20;

      OrderStatus? status;
      if (statusStr != null) {
        status = _parseOrderStatus(statusStr);
      }

      final orders = await OrderEndpoint().getVendorOrders(
        session,
        vendorId: UuidValue.fromString(context.userId),
        status: status,
        limit: limit,
      );

      return {
        'success': true,
        'orders': orders
            .map((order) => {
                  'order_id': order.id.uuid,
                  'order_number': order.orderNumber,
                  'customer_name': order.customerName,
                  'customer_phone': order.customerPhone,
                  'status': order.status.name,
                  'total_amount': order.totalAmount,
                  'currency': order.currency,
                  'created_at': order.createdAt.toIso8601String(),
                  'payment_status': order.paymentStatus.name,
                })
            .toList(),
        'count': orders.length,
      };
    } catch (e) {
      return {
        'success': false,
        'error': 'Failed to get orders: ${e.toString()}',
      };
    }
  }

  static Future<Map<String, dynamic>> _handleUpdateOrderStatus(
    Map<String, dynamic> arguments,
    ToolExecutionContext context,
  ) async {
    try {
      final session = context.session!;
      // final orderId = arguments['order_id'] as String?;
      final statusStr = arguments['status'] as String;
      final trackingNumber = arguments['tracking_number'] as String;
      final notes = arguments['notes'] as String?;

       final order = await Order.db.findFirstRow(
      session,
      where: (t) => t.orderNumber.equals(trackingNumber),
    );

     if (order == null) {
      return {'success': false, 'response': '❌ Order not found'};
    }

      final status = _parseOrderStatus(statusStr);

      final success = await OrderEndpoint().updateOrderStatus(
        session,
        orderId: UuidValue.fromString(order.id.uuid),
        status: status,
        trackingNumber: trackingNumber,
        vendorNotes: notes,
      );

      if (!success) {
        return {
          'success': false,
          'error': 'Failed to update order status',
        };
      }

      return {
        'success': true,
        'message': 'Order status updated successfully',
        'new_status': status.name,
      };
    } catch (e) {
      return {
        'success': false,
        'error': 'Failed to update order status: ${e.toString()}',
      };
    }
  }

  static Future<Map<String, dynamic>> _handleGetOrderDetails(
    Map<String, dynamic> arguments,
    ToolExecutionContext context,
  ) async {
    try {
      final session = context.session!;
      final orderId = arguments['order_id'] as String;

      final orderData = await OrderEndpoint().getOrderWithItems(
        session,
        UuidValue.fromString(orderId),
      );

      if (orderData == null) {
        return {
          'success': false,
          'error': 'Order not found',
        };
      }

      final order = orderData['order'] as Order;
      final items = orderData['items'] as List<OrderItem>;

      return {
        'success': true,
        'order': {
          'order_number': order.orderNumber,
          'customer_name': order.customerName,
          'customer_phone': order.customerPhone,
          'customer_email': order.customerEmail,
          'status': order.status.name,
          'payment_method': order.paymentMethod.name,
          'payment_status': order.paymentStatus.name,
          'subtotal': order.subtotal,
          'shipping_cost': order.shippingCost,
          'total_amount': order.totalAmount,
          'currency': order.currency,
          'customer_notes': order.customerNotes,
          'created_at': order.createdAt.toIso8601String(),
          'items': items
              .map((item) => {
                    'product_name': item.productName,
                    'quantity': item.quantity,
                    'unit_price': item.unitPrice,
                    'total': item.totalAmount,
                  })
              .toList(),
        },
      };
    } catch (e) {
      return {
        'success': false,
        'error': 'Failed to get order details: ${e.toString()}',
      };
    }
  }

  static Future<Map<String, dynamic>> _handleGetSubscriptionInfo(
    Map<String, dynamic> arguments,
    ToolExecutionContext context,
  ) async {
    try {
      final session = context.session!;

      final subscription = await SubscriptionEndpoint().getVendorSubscription(
        session,
        UuidValue.fromString(context.userId),
      );

      if (subscription == null) {
        return {
          'success': true,
          'tier': 'freemium',
          'status': 'active',
          'message': 'You are on the Freemium tier',
        };
      }

      return {
        'success': true,
        'subscription': {
          'tier': subscription.tier.name,
          'status': subscription.status,
          'amount': subscription.amount,
          'currency': subscription.currency,
          'billing_cycle': subscription.billingCycle,
          'product_limit': subscription.productLimit,
          'ai_limit': subscription.aiDescriptionsLimit,
          'transaction_fee': subscription.platformTransactionFee,
          'period_start': subscription.currentPeriodStart.toIso8601String(),
          'period_end': subscription.currentPeriodEnd.toIso8601String(),
          'auto_renew': subscription.autoRenew,
        },
      };
    } catch (e) {
      return {
        'success': false,
        'error': 'Failed to get subscription info: ${e.toString()}',
      };
    }
  }

  static Future<Map<String, dynamic>> _handleCheckTierLimits(
    Map<String, dynamic> arguments,
    ToolExecutionContext context,
  ) async {
    try {
      final session = context.session!;

      final limits = await SubscriptionEndpoint().checkTierLimits(
        session,
        UuidValue.fromString(context.userId),
      );

      return {
        'success': true,
        'limits': limits,
      };
    } catch (e) {
      return {
        'success': false,
        'error': 'Failed to check tier limits: ${e.toString()}',
      };
    }
  }

  static Future<Map<String, dynamic>> _handleGetTopSellingProducts(
    Map<String, dynamic> arguments,
    ToolExecutionContext context,
  ) async {
    try {
      final session = context.session!;
      final limit = (arguments['limit'] as num?)?.toInt() ?? 10;

      final products = await AnalyticsEndpoint().getTopSellingProducts(
        session,
        vendorId: UuidValue.fromString(context.userId),
        limit: limit,
      );

      return {
        'success': true,
        'products': products
            .map((p) => {
                  'id': p.id.uuid,
                  'name': p.name,
                  'price': p.basePrice,
                  'orders': p.orderCount,
                  'views': p.viewCount,
                  'revenue': p.basePrice * p.orderCount,
                })
            .toList(),
        'count': products.length,
      };
    } catch (e) {
      return {
        'success': false,
        'error': 'Failed to get top selling products: ${e.toString()}',
      };
    }
  }

  static Future<Map<String, dynamic>> _handleBulkUpdateInventory(
    Map<String, dynamic> arguments,
    ToolExecutionContext context,
  ) async {
    final session = context.session!;
    final updates = (arguments['updates'] as List).cast<Map<String, dynamic>>();

    final results = <Map<String, dynamic>>[];
    int successCount = 0;
    int failCount = 0;

    for (var update in updates) {
      final productId = update['product_id'] as String;
      final quantity = (update['quantity'] as num).toInt();

      try {
        final success = await ProductEndpoint().updateInventory(
          session,
          productId: UuidValue.fromString(productId),
          quantity: quantity,
        );

        if (success) {
          successCount++;
          results.add({
            'product_id': productId,
            'status': 'success',
            'new_quantity': quantity,
          });
        } else {
          failCount++;
          results.add({
            'product_id': productId,
            'status': 'failed',
            'error': 'Update failed',
          });
        }
      } catch (e) {
        failCount++;
        results.add({
          'product_id': productId,
          'status': 'error',
          'error': e.toString(),
        });
      }
    }

    return {
      'success': true,
      'summary': {
        'total': updates.length,
        'successful': successCount,
        'failed': failCount,
      },
      'results': results,
    };
  }

  static Future<Map<String, dynamic>> _handleGetInventoryAlerts(
    Map<String, dynamic> arguments,
    ToolExecutionContext context,
  ) async {
    final session = context.session!;
    final alertType = arguments['alert_type'] as String? ?? 'all';

    final products = await ProductEndpoint().getVendorProducts(
      session,
      vendorId: UuidValue.fromString(context.userId),
      limit: 100,
    );

    final lowStock = products
        .where((p) => p.quantity > 0 && p.quantity <= p.lowStockThreshold)
        .toList();

    final outOfStock = products.where((p) => p.quantity == 0).toList();

    Map<String, dynamic> result = {
      'success': true,
    };

    if (alertType == 'low_stock' || alertType == 'all') {
      result['low_stock'] = {
        'count': lowStock.length,
        'products': lowStock
            .map((p) => {
                  'id': p.id.uuid,
                  'name': p.name,
                  'current_stock': p.quantity,
                  'threshold': p.lowStockThreshold,
                })
            .toList(),
      };
    }

    if (alertType == 'out_of_stock' || alertType == 'all') {
      result['out_of_stock'] = {
        'count': outOfStock.length,
        'products': outOfStock
            .map((p) => {
                  'id': p.id.uuid,
                  'name': p.name,
                  'orders_count': p.orderCount,
                })
            .toList(),
      };
    }

    return result;
  }

  static Future<Map<String, dynamic>> _handleGetFullOrderDetails(
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
        'error': 'Order not found',
      };
    }

    final orderData = await OrderEndpoint().getOrderWithItems(
      session,
      order.id,
    );

    if (orderData == null) {
      return {
        'success': false,
        'error': 'Failed to load order details',
      };
    }

    final items = orderData['items'] as List<OrderItem>;

    return {
      'success': true,
      'order': {
        'order_number': order.orderNumber,
        'status': order.status.name,
        'customer': {
          'name': order.customerName,
          'phone': order.customerPhone,
          'email': order.customerEmail,
        },
        'payment': {
          'method': order.paymentMethod.name,
          'status': order.paymentStatus.name,
          'paid_at': order.paidAt?.toIso8601String(),
        },
        'amounts': {
          'subtotal': order.subtotal,
          'shipping': order.shippingCost,
          'tax': order.taxAmount,
          'total': order.totalAmount,
          'currency': order.currency,
        },
        'items': items
            .map((item) => {
                  'product_name': item.productName,
                  'quantity': item.quantity,
                  'unit_price': item.unitPrice,
                  'total': item.totalAmount,
                })
            .toList(),
        'delivery': {
          'tracking_number': order.trackingNumber,
          'estimated_date': order.estimatedDeliveryDate?.toIso8601String(),
          'actual_date': order.actualDeliveryDate?.toIso8601String(),
        },
        'notes': {
          'customer': order.customerNotes,
          'vendor': order.vendorNotes,
        },
        'dates': {
          'created': order.createdAt.toIso8601String(),
          'confirmed': order.confirmedAt?.toIso8601String(),
          'shipped': order.shippedAt?.toIso8601String(),
          'delivered': order.deliveredAt?.toIso8601String(),
        },
      },
    };
  }

  static Future<Map<String, dynamic>> _handleBatchUpdateOrderStatus(
    Map<String, dynamic> arguments,
    ToolExecutionContext context,
  ) async {
    final session = context.session!;
    final updates = (arguments['updates'] as List).cast<Map<String, dynamic>>();

    final results = <Map<String, dynamic>>[];
    int successCount = 0;

    for (var update in updates) {
      final orderNumber = update['order_number'] as String;
      final statusStr = update['status'] as String;

      try {
        final order = await Order.db.findFirstRow(
          session,
          where: (t) => t.orderNumber.equals(orderNumber),
        );

        if (order == null) {
          results.add({
            'order_number': orderNumber,
            'status': 'failed',
            'error': 'Order not found',
          });
          continue;
        }

        final status = _parseOrderStatus(statusStr);
        final success = await OrderEndpoint().updateOrderStatus(
          session,
          orderId: order.id,
          status: status,
        );

        if (success) {
          successCount++;
          results.add({
            'order_number': orderNumber,
            'status': 'success',
            'new_status': status.name,
          });
        } else {
          results.add({
            'order_number': orderNumber,
            'status': 'failed',
            'error': 'Update failed',
          });
        }
      } catch (e) {
        results.add({
          'order_number': orderNumber,
          'status': 'error',
          'error': e.toString(),
        });
      }
    }

    return {
      'success': true,
      'summary': {
        'total': updates.length,
        'successful': successCount,
        'failed': updates.length - successCount,
      },
      'results': results,
    };
  }

  static Future<Map<String, dynamic>> _handleGetProductPerformance(
    Map<String, dynamic> arguments,
    ToolExecutionContext context,
  ) async {
    final session = context.session!;
    final productId = arguments['product_id'] as String?;
    final limit = (arguments['limit'] as num?)?.toInt() ?? 10;
    final sortBy = arguments['sort_by'] as String? ?? 'sales';

    if (productId != null) {
      // Single product analysis
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
          'metrics': {
            'views': product.viewCount,
            'orders': product.orderCount,
            'rating': product.averageRating,
            'reviews': product.totalReviews,
            'conversion_rate': product.conversionRate,
          },
          'performance': {
            'revenue': product.basePrice * product.orderCount,
            'avg_order_value': product.basePrice,
          },
        },
      };
    }

    // Multiple products analysis
    final products = await ProductEndpoint().getVendorProducts(
      session,
      vendorId: UuidValue.fromString(context.userId),
      limit: limit * 2, // Get more to sort properly
    );

    // Sort based on criteria
    products.sort((a, b) {
      switch (sortBy) {
        case 'sales':
          return b.orderCount.compareTo(a.orderCount);
        case 'views':
          return b.viewCount.compareTo(a.viewCount);
        case 'revenue':
          return (b.basePrice * b.orderCount)
              .compareTo(a.basePrice * a.orderCount);
        case 'rating':
          return b.averageRating.compareTo(a.averageRating);
        default:
          return 0;
      }
    });

    return {
      'success': true,
      'products': products
          .take(limit)
          .map((p) => {
                'id': p.id.uuid,
                'name': p.name,
                'metrics': {
                  'views': p.viewCount,
                  'orders': p.orderCount,
                  'rating': p.averageRating,
                  'conversion_rate': p.conversionRate,
                },
                'revenue': p.basePrice * p.orderCount,
              })
          .toList(),
    };
  }

  // Helper methods
  static ProductStatus _parseProductStatus(String status) {
    switch (status.toLowerCase()) {
      case 'draft':
        return ProductStatus.draft;
      case 'active':
        return ProductStatus.active;
      case 'out_of_stock':
        return ProductStatus.out_of_stock;
      case 'discontinued':
        return ProductStatus.discontinued;
      default:
        return ProductStatus.active;
    }
  }

  static OrderStatus _parseOrderStatus(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return OrderStatus.pending;
      case 'confirmed':
        return OrderStatus.confirmed;
      case 'processing':
        return OrderStatus.processing;
      case 'packed':
        return OrderStatus.packed;
      case 'shipped':
        return OrderStatus.shipped;
      case 'out_for_delivery':
        return OrderStatus.out_for_delivery;
      case 'delivered':
        return OrderStatus.delivered;
      case 'cancelled':
        return OrderStatus.cancelled;
      default:
        return OrderStatus.pending;
    }
  }
}

// ============================================================================
// END OF VENDOR TOOLS IMPLEMENTATION
// ============================================================================
