// File: server/lib/src/services/payment/paystack_webhook_handler.dart

import 'dart:convert';
import 'package:asami_server/utils/logger/asami_logger.dart';
import 'package:serverpod/serverpod.dart' hide Order;
import '../../generated/protocol.dart';
import '../../endpoints/order_endpoint.dart';
import '../../endpoints/cart_endpoint.dart';
import '../dependency_injection.dart';
import '../messaging/whatsapp/whatsapp_service.dart';
import '../messaging/telegram/telegram_service.dart';
import '../wallet/escrow_automation_service.dart';
import '../wallet/withdrawal_service.dart';
import 'paystack_service.dart';

/// Handles incoming Paystack webhooks (Singleton)
class PaystackWebhookHandler {
  PaystackWebhookHandler._() {
    Log.info('✅ PaystackWebhookHandler initialized');
  }

  static PaystackWebhookHandler? _instance;
  static PaystackWebhookHandler get instance =>
      _instance ??= PaystackWebhookHandler._();

  factory PaystackWebhookHandler() {
    if (_instance != null) {
      return _instance!;
    }

    return PaystackWebhookHandler._();
  }

  /// Process incoming webhook from Paystack
  Future<Map<String, dynamic>> processWebhook(
    Session session,
    Map<String, dynamic> payload,
    String signature,
  ) async {
    try {
      Log.info('🔔 Paystack webhook received');

      // Verify signature
      final paystackService = getIt<PaystackService>();

      final payloadString = jsonEncode(payload);
      final isValid = paystackService.verifyWebhookSignature(
        payloadString,
        signature,
      );

      if (!isValid) {
        Log.info('❌ Invalid webhook signature');
        return {
          'success': false,
          'error': 'Invalid signature',
        };
      }

      // Log webhook event
      final eventType = payload['event'] as String;
      final eventData = payload['data'] as Map<String, dynamic>;

      Log.success('🔔 Webhook received: $eventType',
          data: eventData, session: session);

      final webhookEvent = WebhookEvent(
        eventType: eventType,
        eventId: payload['id']?.toString(),
        transactionReference:
            eventData['reference'] as String, // Just pass the string
        rawPayload: payloadString,
        isVerified: true,
        verifiedAt: DateTime.now(),
        source: 'paystack',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await WebhookEvent.db.insertRow(session, webhookEvent);

      Log.info('📝 Webhook logged: $eventType');

      // Process based on event type
      Map<String, dynamic> result;

      switch (eventType) {
        case 'charge.success':
          result = await _handleChargeSuccess(session, eventData, webhookEvent);
          break;

        case 'charge.failed':
          result = await _handleChargeFailed(session, eventData, webhookEvent);
          break;

        case 'transfer.success':
          result =
              await _handleTransferSuccess(session, eventData, webhookEvent);
          break;

        case 'transfer.failed':
          result =
              await _handleTransferFailed(session, eventData, webhookEvent);
          break;
        case 'transfer.reversed':
          result =
              await _handleTransferReversed(session, eventData, webhookEvent);
          break;

        default:
          Log.info('ℹ️ Unhandled webhook event: $eventType');
          result = {
            'success': true,
            'message': 'Event logged but not processed',
          };
      }

      // Update webhook event status
      webhookEvent.status = result['success'] ? 'processed' : 'failed';
      webhookEvent.processedAt = DateTime.now();
      webhookEvent.processedPayload = jsonEncode(result);
      webhookEvent.errorMessage = result['error'];
      webhookEvent.updatedAt = DateTime.now();

      await WebhookEvent.db.updateRow(session, webhookEvent);

      return result;
    } catch (e, stackTrace) {
      Log.info('❌ Error processing Paystack webhook: $e');
      Log.error('Stacktrace', stackTrace: stackTrace);
      session.log('Paystack webhook error: $e', stackTrace: stackTrace);
      return {
        'success': false,
        'error': 'Webhook processing failed: ${e.toString()}',
      };
    }
  }

  /// Handle successful charge
  Future<Map<String, dynamic>> _handleChargeSuccess(
    Session session,
    Map<String, dynamic> eventData,
    WebhookEvent webhookEvent,
  ) async {
    try {
      final reference = eventData['reference'] as String;
      final amount = (eventData['amount'] as num) / 100; // Convert from kobo
      final paidAt = eventData['paid_at'] as String?;
      final channel = eventData['channel'] as String?;

      Log.info(
          '✅ Charge successful: $reference - ₦${amount.toStringAsFixed(2)}');

      // Get transaction
      final transaction = await PaymentTransaction.db.findFirstRow(
        session,
        where: (t) => t.reference.equals(reference),
      );

      if (transaction == null) {
        Log.info('⚠️ Transaction not found: $reference');
        return {
          'success': false,
          'error': 'Transaction not found',
        };
      }

      // Update transaction
      transaction.status = PaymentStatus.completed;
      transaction.paidAt =
          paidAt != null ? DateTime.parse(paidAt) : DateTime.now();
      transaction.channel = channel;
      transaction.transactionId = eventData['id']?.toString();
      transaction.gatewayResponse = jsonEncode(eventData);
      transaction.lastWebhookAt = DateTime.now();
      transaction.updatedAt = DateTime.now();

      // Add webhook event to array
      final events = transaction.webhookEvents != null
          ? (jsonDecode(transaction.webhookEvents!) as List)
          : [];
      events.add({
        'event': 'charge.success',
        'timestamp': DateTime.now().toIso8601String(),
        'webhook_id': webhookEvent.id.uuid,
      });
      transaction.webhookEvents = jsonEncode(events);

      await PaymentTransaction.db.updateRow(session, transaction);

      // Create order from transaction
      final orderResult =
          await _createOrderFromTransaction(session, transaction);

      if (!orderResult['success']) {
        return orderResult;
      }

      // Notify customer
      await _notifyPaymentSuccess(
        session,
        transaction: transaction,
        order: orderResult['order'] as Order,
      );

      return {
        'success': true,
        'transaction_reference': reference,
        'order_number': (orderResult['order'] as Order).orderNumber,
        'message': 'Payment processed and order created',
      };
    } catch (e, stackTrace) {
      Log.info('❌ Charge success handler error: $e');
      Log.error('Stacktrace', stackTrace: stackTrace);
      session.log('Charge success handler error: $e', stackTrace: stackTrace);
      return {
        'success': false,
        'error': e.toString(),
      };
    }
  }

  /// Handle failed charge
  Future<Map<String, dynamic>> _handleChargeFailed(
    Session session,
    Map<String, dynamic> eventData,
    WebhookEvent webhookEvent,
  ) async {
    try {
      final reference = eventData['reference'] as String;

      Log.info('❌ Charge failed: $reference');

      // Get transaction
      final transaction = await PaymentTransaction.db.findFirstRow(
        session,
        where: (t) => t.reference.equals(reference),
      );

      if (transaction == null) {
        return {
          'success': false,
          'error': 'Transaction not found',
        };
      }

      // Update transaction
      transaction.status = PaymentStatus.failed;
      transaction.failureReason = eventData['gateway_response'] as String?;
      transaction.gatewayResponse = jsonEncode(eventData);
      transaction.lastWebhookAt = DateTime.now();
      transaction.updatedAt = DateTime.now();

      await PaymentTransaction.db.updateRow(session, transaction);

      // Notify customer
      await _notifyPaymentFailed(session, transaction);

      return {
        'success': true,
        'message': 'Failure recorded',
      };
    } catch (e, stackTrace) {
      Log.info('❌ Charge failed handler error: $e');
      Log.error('Stacktrace', stackTrace: stackTrace);
      session.log('Charge failed handler error: $e', stackTrace: stackTrace);
      return {
        'success': false,
        'error': e.toString(),
      };
    }
  }

  /// Handle successful transfer (for payouts)

// Update the transfer handlers:

  Future<Map<String, dynamic>> _handleTransferSuccess(
    Session session,
    Map<String, dynamic> eventData,
    WebhookEvent webhookEvent,
  ) async {
    try {
      final reference = eventData['reference'] as String;

      Log.info('✅ Transfer successful: $reference');

      // Complete withdrawal
      await WithdrawalService.completeWithdrawal(
        session,
        reference: reference,
        status: 'success',
      );

      return {
        'success': true,
        'message': 'Transfer success processed',
      };
    } catch (e, stackTrace) {
      Log.error('Transfer success handler error',
          error: e, stackTrace: stackTrace);
      return {
        'success': false,
        'error': e.toString(),
      };
    }
  }

  Future<Map<String, dynamic>> _handleTransferFailed(
    Session session,
    Map<String, dynamic> eventData,
    WebhookEvent webhookEvent,
  ) async {
    try {
      final reference = eventData['reference'] as String;

      Log.info('❌ Transfer failed: $reference');

      // Mark withdrawal as failed
      await WithdrawalService.completeWithdrawal(
        session,
        reference: reference,
        status: 'failed',
      );

      return {
        'success': true,
        'message': 'Transfer failure processed',
      };
    } catch (e, stackTrace) {
      Log.error('Transfer failed handler error',
          error: e, stackTrace: stackTrace);
      return {
        'success': false,
        'error': e.toString(),
      };
    }
  }

  Future<Map<String, dynamic>> _handleTransferReversed(
    Session session,
    Map<String, dynamic> eventData,
    WebhookEvent webhookEvent,
  ) async {
    try {
      final reference = eventData['reference'] as String;

      Log.info('🔄 Transfer reversed: $reference');

      // Handle reversal (return to available balance)
      await WithdrawalService.completeWithdrawal(
        session,
        reference: reference,
        status: 'reversed',
      );

      return {
        'success': true,
        'message': 'Transfer reversal processed',
      };
    } catch (e, stackTrace) {
      Log.error('Transfer reversal handler error',
          error: e, stackTrace: stackTrace);
      return {
        'success': false,
        'error': e.toString(),
      };
    }
  }

  /// Create order from successful payment
  Future<Map<String, dynamic>> _createOrderFromTransaction(
    Session session,
    PaymentTransaction transaction,
  ) async {
    try {
      // Parse metadata
      final metadata =
          jsonDecode(transaction.metadata ?? '{}') as Map<String, dynamic>;

      // Check if it's a single product purchase or cart checkout
      if (metadata.containsKey('product_id')) {
        // Single product purchase
        return await _createOrderFromProduct(session, transaction, metadata);
      } else if (metadata.containsKey('cart_id')) {
        // Cart checkout
        return await _createOrderFromCart(session, transaction, metadata);
      }

      return {
        'success': false,
        'error': 'Unknown purchase type',
      };
    } catch (e, stackTrace) {
      Log.info('❌ Order creation error: $e');
      Log.error('Stacktrace', stackTrace: stackTrace);
      session.log('Order creation error: $e', stackTrace: stackTrace);
      return {
        'success': false,
        'error': e.toString(),
      };
    }
  }

  /// Create order from single product
  Future<Map<String, dynamic>> _createOrderFromProduct(
    Session session,
    PaymentTransaction transaction,
    Map<String, dynamic> metadata,
  ) async {
    try {
      final productId = metadata['product_id'] as String;
      final quantity = metadata['quantity'] as int? ?? 1;
      final vendorId = metadata['vendor_id'] as String;

      // Get product
      final product = await Product.db.findById(
        session,
        UuidValue.fromString(productId),
      );

      if (product == null) {
        return {'success': false, 'error': 'Product not found'};
      }

      // Get user
      final user = await User.db.findById(session, transaction.userId);
      if (user == null) {
        return {'success': false, 'error': 'User not found'};
      }

      // Get or create default shipping address
      var shippingAddress = await Address.db.findFirstRow(
        session,
        where: (t) =>
            t.userId.equals(transaction.userId) & t.isDefault.equals(true),
      );

      if (shippingAddress == null) {
        shippingAddress = Address(
          id: Uuid().v4obj(),
          userId: transaction.userId,
          label: 'Default',
          recipientName: user.firstName ?? 'Customer',
          phoneNumber: user.phoneNumber,
          addressLine1: 'To be provided',
          city: 'To be provided',
          state: 'To be provided',
          country: 'Nigeria',
          isDefault: true,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          postalCode: '',
        );
        shippingAddress = await Address.db.insertRow(session, shippingAddress);
      }

      // Generate order number
      final orderNumber = 'ORDER-${DateTime.now().millisecondsSinceEpoch}';
      // Create order (you'll need to get shipping address)
      // Create order
      final order = Order(
        id: Uuid().v4obj(),
        customerId: transaction.userId,
        vendorId: UuidValue.fromString(vendorId),
        orderNumber: orderNumber,
        status: OrderStatus.pending,
        subtotal: metadata['subtotal'] as double,
        taxAmount: 0.0,
        shippingCost: metadata['shipping_cost'] as double? ?? 0.0,
        discountAmount: 0.0,
        platformFee: transaction.platformFee,
        totalAmount: transaction.amount,
        currency: transaction.currency,
        shippingAddressId: shippingAddress.id,
        customerName: transaction.customerName ?? user.firstName ?? '',
        customerPhone: transaction.customerPhone ?? user.phoneNumber,
        customerEmail: transaction.customerEmail,
        paymentMethod: _parsePaymentMethod(transaction.channel),
        paymentStatus: PaymentStatus.completed,
        paidAt: transaction.paidAt,
        orderSource: transaction.platformType.name,
        conversationId: transaction.conversationId,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      final savedOrder = await Order.db.insertRow(session, order);

      // Create order item
      final orderItem = OrderItem(
        id: Uuid().v4obj(),
        orderId: savedOrder.id,
        productId: product.id,
        productName: product.name,
        productDescription: product.description,
        productImageUrl: product.thumbnailUrl ?? product.images.firstOrNull,
        sku: product.sku,
        unitPrice: product.discountPrice ?? product.basePrice,
        quantity: quantity,
        subtotal: (product.discountPrice ?? product.basePrice) * quantity,
        taxAmount: 0.0,
        totalAmount: (product.discountPrice ?? product.basePrice) * quantity,
        status: OrderStatus.pending,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await OrderItem.db.insertRow(session, orderItem);

      // Update product inventory
      product.quantity -= quantity;
      product.orderCount++;
      if (product.quantity == 0) {
        product.status = ProductStatus.out_of_stock;
      }
      await Product.db.updateRow(session, product);

      // Link transaction to order
      transaction.orderId = savedOrder.id;
      await PaymentTransaction.db.updateRow(session, transaction);

      // ✅ CREATE ESCROW - This holds the money
      final escrow = await EscrowAutomationService.createEscrow(
        session,
        order: savedOrder,
        totalAmount: transaction.amount,
        platformFee: transaction.platformFee,
        paystackFee: transaction.paystackFee,
      );

      if (escrow != null) {
        session.log(
            '✅ Escrow created: ₦${escrow.vendorEarnings.toStringAsFixed(2)}');
      }

      session.log('✅ Order created: ${savedOrder.orderNumber}');

      Log.info('✅ Order created from product: ${product.name}');

      return {
        'success': true,
        'order': order, // Placeholder
        'message': 'Order created',
      };
    } catch (e, stackTrace) {
      Log.info('❌ Single product order creation error: $e');
      Log.error('Stacktrace', stackTrace: stackTrace);
      return {
        'success': false,
        'error': e.toString(),
      };
    }
  }

  /// Create order from cart
  Future<Map<String, dynamic>> _createOrderFromCart(
    Session session,
    PaymentTransaction transaction,
    Map<String, dynamic> metadata,
  ) async {
    try {
      final cartId = metadata['cart_id'] as String;
      final shippingAddressId = metadata['shipping_address_id'] as String;

      // Create order from cart
      final orderEndpoint = OrderEndpoint();
      final order = await orderEndpoint.createOrder(
        session,
        customerId: transaction.userId,
        shippingAddressId: UuidValue.fromString(shippingAddressId),
        paymentMethod: PaymentMethod.credit_card,
        conversationId: transaction.conversationId!,
      );

      if (order == null) {
        return {'success': false, 'error': 'Failed to create order'};
      }

      // Link transaction to order
      transaction.orderId = order.id;
      await PaymentTransaction.db.updateRow(session, transaction);

      Log.info('✅ Order created from cart: ${order.orderNumber}');

      return {
        'success': true,
        'order': order,
      };
    } catch (e, stackTrace) {
      Log.info('❌ Cart order creation error: $e');
      Log.error('Stacktrace', stackTrace: stackTrace);
      return {
        'success': false,
        'error': e.toString(),
      };
    }
  }

  /// Notify customer of successful payment
  Future<void> _notifyPaymentSuccess(
    Session session, {
    required PaymentTransaction transaction,
    required Order order,
  }) async {
    try {
      final message = """
✅ *Payment Successful!*

Thank you for your payment of ₦${transaction.amount.toStringAsFixed(2)}

📦 *Order Number:* ${order.orderNumber}
💳 *Reference:* ${transaction.reference}
⏰ *Time:* ${transaction.paidAt?.toString() ?? 'Now'}

Your order has been confirmed and is being processed! 🎉

You'll receive updates as your order progresses.
""";

      if (transaction.platformType == PlatformType.whatsapp) {
        final whatsappService = getIt<WhatsAppService>();
        final conversation = await Conversation.db.findById(
          session,
          transaction.conversationId!,
        );

        if (conversation != null) {
          await whatsappService.sendMessage(
            phoneNumber: conversation.platformUserId,
            text: message,
          );
        }
      }

      Log.info('📧 Payment success notification sent');
    } catch (e, stackTrace) {
      Log.info('❌ Notification error: $e');
      Log.error('Stacktrace', stackTrace: stackTrace);
    }
  }

  /// Notify customer of failed payment
  Future<void> _notifyPaymentFailed(
    Session session,
    PaymentTransaction transaction,
  ) async {
    try {
      final message = """
❌ *Payment Failed*

Unfortunately, your payment of ₦${transaction.amount.toStringAsFixed(2)} was not successful.

💳 *Reference:* ${transaction.reference}
❗ *Reason:* ${transaction.failureReason ?? 'Unknown error'}

Please try again or contact support if you need assistance.
""";

      if (transaction.platformType == PlatformType.whatsapp) {
        final whatsappService = getIt<WhatsAppService>();
        final conversation = await Conversation.db.findById(
          session,
          transaction.conversationId!,
        );

        if (conversation != null) {
          await whatsappService.sendMessage(
            phoneNumber: conversation.platformUserId,
            text: message,
          );
        }
      }

      Log.info('📧 Payment failure notification sent');
    } catch (e, stackTrace) {
      Log.info('❌ Notification error: $e');
      Log.error('Stacktrace', stackTrace: stackTrace);
    }
  }

  PaymentMethod _parsePaymentMethod(String? channel) {
    if (channel == null) return PaymentMethod.credit_card;

    switch (channel.toLowerCase()) {
      case 'card':
        return PaymentMethod.credit_card;
      case 'bank':
      case 'bank_transfer':
        return PaymentMethod.bank_transfer;
      case 'ussd':
        return PaymentMethod.mobile_money;
      default:
        return PaymentMethod.credit_card;
    }
  }
}
