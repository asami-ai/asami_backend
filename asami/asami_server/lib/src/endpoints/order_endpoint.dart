// File: server/lib/src/endpoints/order_endpoint.dart

import 'dart:async';

import 'package:asami_server/src/services/notifications/notification_dispatcher.dart';
import 'package:serverpod/serverpod.dart' hide Order;
import '../generated/protocol.dart';
import '../services/dependency_injection.dart';
import '../services/wallet/escrow_automation_service.dart';

class OrderEndpoint extends Endpoint {
  /// Create order from cart
  Future<Order?> createOrder(
    Session session, {
    required UuidValue customerId,
    required UuidValue shippingAddressId,
    required PaymentMethod paymentMethod,
    String? customerNotes,
    UuidValue? conversationId,
    String orderSource = 'whatsapp',
  }) async {
    try {
      // Get cart
      final cart = await Cart.db.findFirstRow(
        session,
        where: (t) => t.customerId.equals(customerId) & t.isActive.equals(true),
      );

      if (cart == null) throw Exception('No active cart found');

      final items = await CartItem.db.find(
        session,
        where: (t) => t.cartId.equals(cart.id),
      );

      if (items.isEmpty) throw Exception('Cart is empty');

      // Get customer and address
      final customer = await User.db.findFirstRow(
        session,
        where: (t) => t.id.equals(customerId),
      );

      final address = await Address.db.findFirstRow(
        session,
        where: (t) => t.id.equals(shippingAddressId),
      );

      if (customer == null || address == null) {
        throw Exception('Customer or address not found');
      }

      // Group items by vendor (for multi-vendor support)
      final itemsByVendor = <UuidValue, List<CartItem>>{};
      for (var item in items) {
        final product = await Product.db.findFirstRow(
          session,
          where: (t) => t.id.equals(item.productId),
        );

        if (product != null) {
          itemsByVendor.putIfAbsent(product.vendorId, () => []).add(item);
        }
      }

      // Create separate orders for each vendor
      final orders = <Order>[];
      for (var entry in itemsByVendor.entries) {
        final vendorId = entry.key;
        final vendorItems = entry.value;

        final order = await _createSingleOrder(
          session,
          customerId: customerId,
          vendorId: vendorId,
          items: vendorItems,
          customer: customer,
          address: address,
          paymentMethod: paymentMethod,
          customerNotes: customerNotes,
          conversationId: conversationId,
          orderSource: orderSource,
        );

        if (order != null) orders.add(order);
      }

      // Clear cart after successful order creation
      cart.isActive = false;
      cart.convertedToOrderId = orders.isNotEmpty ? orders.first.id.uuid : null;
      await Cart.db.updateRow(session, cart);

      return orders.isNotEmpty ? orders.first : null;
    } catch (e) {
      session.log('Create order error: $e');
      return null;
    }
  }

  /// Get order by ID
  Future<Order?> getOrder(Session session, UuidValue orderId) async {
    return await Order.db.findFirstRow(
      session,
      where: (t) => t.id.equals(orderId),
    );
  }

  /// Get order with items
  Future<Map<String, dynamic>?> getOrderWithItems(
    Session session,
    UuidValue orderId,
  ) async {
    final order = await getOrder(session, orderId);
    if (order == null) return null;

    final items = await OrderItem.db.find(
      session,
      where: (t) => t.orderId.equals(orderId),
    );

    return {
      'order': order,
      'items': items,
    };
  }

  /// Get customer orders
  Future<List<Order>> getCustomerOrders(
    Session session, {
    required UuidValue customerId,
    OrderStatus? status,
    int limit = 50,
    int offset = 0,
  }) async {
    WhereExpressionBuilder<OrderTable>? whereClause;
    whereClause = (t) => t.customerId.equals(customerId);

    if (status != null) {
      whereClause =
          (t) => t.customerId.equals(customerId) & t.status.equals(status);
    }

    return await Order.db.find(
      session,
      where: whereClause,
      limit: limit,
      offset: offset,
      orderBy: (t) => t.createdAt,
      orderDescending: true,
    );
  }

  /// Get vendor orders
  Future<List<Order>> getVendorOrders(
    Session session, {
    required UuidValue vendorId,
    OrderStatus? status,
    int limit = 50,
    int offset = 0,
  }) async {
    WhereExpressionBuilder<OrderTable>? whereClause;
    whereClause = (t) => t.vendorId.equals(vendorId);

    if (status != null) {
      whereClause =
          (t) => t.vendorId.equals(vendorId) & t.status.equals(status);
    }

    return await Order.db.find(
      session,
      where: whereClause,
      limit: limit,
      offset: offset,
      orderBy: (t) => t.createdAt,
      orderDescending: true,
    );
  }

  /// Update order status
  Future<bool> updateOrderStatus(
    Session session, {
    required UuidValue orderId,
    required OrderStatus status,
    String? trackingNumber,
    String? vendorNotes,
  }) async {
    final order = await getOrder(session, orderId);
    if (order == null) return false;

    order.status = status;
    if (trackingNumber != null) order.trackingNumber = trackingNumber;
    if (vendorNotes != null) order.vendorNotes = vendorNotes;
    var notifStatus = NotificationType.paymentReceived;

    // Update timestamps based on status
    switch (status) {
      case OrderStatus.confirmed:
        order.confirmedAt = DateTime.now();
        notifStatus = NotificationType.orderConfirmed;
        break;
      case OrderStatus.shipped:
        order.shippedAt = DateTime.now();
        notifStatus = NotificationType.orderShipped;
        break;
      case OrderStatus.delivered:
        order.deliveredAt = DateTime.now();
        order.actualDeliveryDate = DateTime.now();
        notifStatus = NotificationType.orderDelivered;
        break;
      case OrderStatus.cancelled:
        order.cancelledAt = DateTime.now();
        notifStatus = NotificationType.orderCancelled;
        break;
      case OrderStatus.refunded:
        notifStatus = NotificationType.refundProcessed;
        break;
      default:
        break;
    }

    order.updatedAt = DateTime.now();
    await Order.db.updateRow(session, order);

    final customer = await User.db.findById(session, order.customerId);
    if (customer != null) {
      final dispatcher = getIt<NotificationDispatcher>();
      await dispatcher.dispatchNotification(
        session: session,
        user: customer,
        type: notifStatus,
        data: {'order': order},
      );
    }

    return true;
  }

  /// Cancel order
  Future<bool> cancelOrder(
    Session session, {
    required UuidValue orderId,
    required String cancellationReason,
    // bool refund = false,
  }) async {
    final order = await getOrder(session, orderId);
    if (order == null) return false;

    // Only allow cancellation of pending/confirmed orders
    if (![OrderStatus.pending, OrderStatus.confirmed, OrderStatus.processing]
        .contains(order.status)) {
      return false;
    }

    order.status = OrderStatus.cancelled;
    order.cancelledAt = DateTime.now();
    order.cancellationReason = cancellationReason;
    order.updatedAt = DateTime.now();

    await Order.db.updateRow(session, order);

    // Restore inventory
    final items = await OrderItem.db.find(
      session,
      where: (t) => t.orderId.equals(orderId),
    );

    for (var item in items) {
      final product = await Product.db.findFirstRow(
        session,
        where: (t) => t.id.equals(item.productId),
      );

      if (product != null) {
        product.quantity += item.quantity;
        await Product.db.updateRow(session, product);
      }
    }
    // ✅ NOTIFY CUSTOMER
    final customer = await User.db.findById(session, order.customerId);
    if (customer != null) {
      final dispatcher = getIt<NotificationDispatcher>();
      await dispatcher.dispatchNotification(
        session: session,
        user: customer,
        type: NotificationType.returnApproved,
        data: {
          'order': order,
        },
      );
    }

    // Process refund if needed
    if (order.paymentStatus == PaymentStatus.completed) {
      await EscrowAutomationService.approveReturn(session,
          orderId: order.id.uuid);
    }

    return true;
  }

  // Private helper method
  Future<Order?> _createSingleOrder(
    Session session, {
    required UuidValue customerId,
    required UuidValue vendorId,
    required List<CartItem> items,
    required User customer,
    required Address address,
    required PaymentMethod paymentMethod,
    String? customerNotes,
    UuidValue? conversationId,
    String orderSource = 'whatsapp',
  }) async {
    final orderId = Uuid().v4obj();
    final orderNumber = 'ORD-${DateTime.now().millisecondsSinceEpoch}';

    // Calculate totals
    double subtotal = items.fold(0.0, (sum, item) => sum + item.subtotal);
    double shippingCost = 0.0; // TODO: Calculate based on vendor settings
    double taxAmount = 0.0; // TODO: Calculate tax
    double platformFee = 0.0; // TODO: Calculate based on vendor tier

    // Get vendor profile for fee calculation
    final vendor = await VendorProfile.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(vendorId),
    );

    if (vendor != null) {
      platformFee = subtotal * vendor.platformTransactionFee;
    }

    double totalAmount = subtotal + shippingCost + taxAmount;

    final order = Order(
      id: orderId,
      orderNumber: orderNumber,
      customerId: customerId,
      vendorId: vendorId,
      subtotal: subtotal,
      taxAmount: taxAmount,
      shippingCost: shippingCost,
      platformFee: platformFee,
      totalAmount: totalAmount,
      shippingAddressId: address.id,
      customerName: address.recipientName,
      customerPhone: address.phoneNumber,
      customerEmail: customer.email,
      paymentMethod: paymentMethod,
      customerNotes: customerNotes,
      orderSource: orderSource,
      conversationId: conversationId,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    final createdOrder = await Order.db.insertRow(session, order);

    // Create order items
    for (var cartItem in items) {
      final product = await Product.db.findFirstRow(
        session,
        where: (t) => t.id.equals(cartItem.productId),
      );

      if (product == null) continue;

      final orderItemId = Uuid().v4obj();

      final orderItem = OrderItem(
        id: orderItemId,
        orderId: orderId,
        productId: cartItem.productId,
        variantId: cartItem.variantId,
        productName: product.name,
        productDescription: product.shortDescription,
        productImageUrl: product.thumbnailUrl,
        sku: product.sku,
        unitPrice: cartItem.unitPrice,
        quantity: cartItem.quantity,
        subtotal: cartItem.subtotal,
        totalAmount: cartItem.subtotal,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await OrderItem.db.insertRow(session, orderItem);

      // Decrement product inventory
      product.quantity -= cartItem.quantity;
      product.orderCount++;
      if (product.quantity == 0) {
        product.status = ProductStatus.out_of_stock;
      }
      await Product.db.updateRow(session, product);
    }

    // Update vendor metrics
    if (vendor != null) {
      vendor.totalOrders++;
      vendor.totalRevenue += totalAmount;
      vendor.totalPlatformFees += platformFee;
      await VendorProfile.db.updateRow(session, vendor);
    }

    return createdOrder;
  }

  /// Mark order as delivered (vendor action)
  Future<Map<String, dynamic>> markOrderAsDelivered(
    Session session, {
    required String orderNumber,
    required String vendorId,
  }) async {
    try {
      final order = await Order.db.findFirstRow(
        session,
        where: (t) => t.orderNumber.equals(orderNumber),
      );

      if (order == null) {
        return {'success': false, 'error': 'Order not found'};
      }

      if (order.vendorId.uuid != vendorId) {
        return {'success': false, 'error': 'Unauthorized'};
      }

      if (order.status != OrderStatus.shipped &&
          order.status != OrderStatus.out_for_delivery) {
        return {'success': false, 'error': 'Order must be shipped first'};
      }

      // Update order
      order.status = OrderStatus.delivered;
      order.deliveredAt = DateTime.now();
      order.actualDeliveryDate = DateTime.now();
      order.updatedAt = DateTime.now();

      await Order.db.updateRow(session, order);

      // Start return window in escrow
      final marked = await EscrowAutomationService.markDelivered(
        session,
        orderId: order.id.uuid,
        deliveredAt: order.deliveredAt!,
      );

      if (!marked) {
        session.log('⚠️ Failed to update escrow for delivered order');
      }

      // ✅ SEND NOTIFICATIONS
      final customer = await User.db.findById(session, order.customerId);
      final escrow = await OrderEscrow.db.findFirstRow(
        session,
        where: (t) => t.orderId.equals(order.id),
      );

      if (customer != null && escrow != null) {
        final dispatcher = getIt<NotificationDispatcher>();
        await dispatcher.dispatchNotification(
          session: session,
          user: customer,
          type: NotificationType.orderDelivered,
          data: {
            'order': order,
            'escrow': escrow,
          },
        );
      }
      session.log('✅ Order marked as delivered: $orderNumber');

      return {
        'success': true,
        'message': 'Order marked as delivered. Return window started (2 days).',
        'order': order,
      };
    } catch (e, stackTrace) {
      session.log('Mark delivered error: $e', stackTrace: stackTrace);
      return {
        'success': false,
        'error': e.toString(),
      };
    }
  }

  /// Customer acknowledges delivery
  Future<Map<String, dynamic>> acknowledgeDelivery(
    Session session, {
    required String orderNumber,
    required String customerId,
  }) async {
    try {
      final order = await Order.db.findFirstRow(
        session,
        where: (t) => t.orderNumber.equals(orderNumber),
      );

      if (order == null) {
        return {'success': false, 'error': 'Order not found'};
      }

      if (order.customerId.uuid != customerId) {
        return {'success': false, 'error': 'Unauthorized'};
      }

      if (order.status != OrderStatus.delivered) {
        return {'success': false, 'error': 'Order not yet delivered'};
      }

      // Acknowledge in escrow
      final acknowledged = await EscrowAutomationService.acknowledgeDelivery(
        session,
        orderId: order.id.uuid,
      );

      if (!acknowledged) {
        return {'success': false, 'error': 'Failed to acknowledge delivery'};
      }

      // ✅ NOTIFY VENDOR
      final vendor = await User.db.findById(session, order.vendorId);
      if (vendor != null) {
        final dispatcher = getIt<NotificationDispatcher>();
        await dispatcher.dispatchNotification(
          session: session,
          user: vendor,
          type: NotificationType.deliveryAcknowledged,
          data: {
            'order': order,
          },
        );
      }

      session.log('✅ Delivery acknowledged: $orderNumber');

      return {
        'success': true,
        'message':
            'Delivery acknowledged. Funds will be released after return window.',
      };
    } catch (e, stackTrace) {
      session.log('Acknowledge delivery error: $e', stackTrace: stackTrace);
      return {
        'success': false,
        'error': e.toString(),
      };
    }
  }

  /// Request return
  Future<Map<String, dynamic>> requestReturn(
    Session session, {
    required String orderNumber,
    required String customerId,
    required String reason,
  }) async {
    try {
      final order = await Order.db.findFirstRow(
        session,
        where: (t) => t.orderNumber.equals(orderNumber),
      );

      if (order == null) {
        return {'success': false, 'error': 'Order not found'};
      }

      if (order.customerId.uuid != customerId) {
        return {'success': false, 'error': 'Unauthorized'};
      }

      if (order.status != OrderStatus.delivered) {
        return {'success': false, 'error': 'Can only return delivered orders'};
      }

      // Process return in escrow
      final processed = await EscrowAutomationService.processReturnRequest(
        session,
        orderId: order.id.uuid,
        reason: reason,
      );

      if (!processed) {
        return {
          'success': false,
          'error': 'Return window expired or return already requested',
        };
      }

      // Create refund record
      final refund = Refund(
        id: Uuid().v4obj(),
        orderId: order.id,
        amount: order.totalAmount,
        currency: order.currency,
        reason: reason,
        status: 'requested',
        refundMethod: order.paymentMethod,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await Refund.db.insertRow(session, refund);

      // ✅ NOTIFY VENDOR
      final vendor = await User.db.findById(session, order.vendorId);
      if (vendor != null) {
        final dispatcher = getIt<NotificationDispatcher>();
        await dispatcher.dispatchNotification(
          session: session,
          user: vendor,
          type: NotificationType.returnRequested,
          data: {
            'order': order,
            'reason': reason,
          },
        );
      }

      session.log('🔄 Return requested: $orderNumber');

      return {
        'success': true,
        'message': 'Return request submitted. Awaiting vendor approval.',
        'refund_id': refund.id.uuid,
      };
    } catch (e, stackTrace) {
      session.log('Request return error: $e', stackTrace: stackTrace);
      return {
        'success': false,
        'error': e.toString(),
      };
    }
  }

  /// Approve return (vendor action)
  Future<Map<String, dynamic>> approveReturn(
    Session session, {
    required String orderNumber,
    required String vendorId,
  }) async {
    try {
      final order = await Order.db.findFirstRow(
        session,
        where: (t) => t.orderNumber.equals(orderNumber),
      );

      if (order == null) {
        return {'success': false, 'error': 'Order not found'};
      }

      if (order.vendorId.uuid != vendorId) {
        return {'success': false, 'error': 'Unauthorized'};
      }

      // ✅ NOTIFY CUSTOMER
      final customer = await User.db.findById(session, order.customerId);
      if (customer != null) {
        final dispatcher = getIt<NotificationDispatcher>();
        await dispatcher.dispatchNotification(
          session: session,
          user: customer,
          type: NotificationType.returnApproved,
          data: {
            'order': order,
          },
        );
      }

      // Approve return in escrow (this processes refund)
      final approved = await EscrowAutomationService.approveReturn(
        session,
        orderId: order.id.uuid,
      );

      if (!approved) {
        return {'success': false, 'error': 'Failed to approve return'};
      }

      // Update order status
      order.status = OrderStatus.refunded;
      order.updatedAt = DateTime.now();
      await Order.db.updateRow(session, order);

      // Update refund record
      final refund = await Refund.db.findFirstRow(
        session,
        where: (t) => t.orderId.equals(order.id),
      );

      if (refund != null) {
        refund.status = 'approved';
        refund.isApproved = true;
        refund.approvedBy = vendorId;
        refund.approvedAt = DateTime.now();
        refund.processedAt = DateTime.now();
        refund.updatedAt = DateTime.now();

        await Refund.db.updateRow(session, refund);
      }

      session.log('✅ Return approved: $orderNumber');
      

      return {
        'success': true,
        'message': 'Return approved. Refund processed.',
      };
    } catch (e, stackTrace) {
      session.log('Approve return error: $e', stackTrace: stackTrace);
      return {
        'success': false,
        'error': e.toString(),
      };
    }
  }
}
