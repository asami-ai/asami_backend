// File: server/lib/src/services/notifications/notification_dispatcher.dart

import 'dart:math';

import 'package:asami_server/utils/logger/asami_logger.dart';
import 'package:serverpod/serverpod.dart' hide Order;
import '../../generated/protocol.dart';
import '../dependency_injection.dart';
import '../messaging/whatsapp/whatsapp_service.dart';
import '../messaging/telegram/telegram_service.dart';
import 'email_notification_service.dart';

/// Central notification dispatcher - routes notifications to all appropriate channels
/// Designed to be modular and extensible for future Flutter app push notifications
/// 
/// This service is stateless and should be registered as a factory in GetIt
class NotificationDispatcher {
  // No session stored - it's passed per method call
  
  /// Send notification through all available channels for the user
  Future<Map<String, bool>> dispatchNotification({
    required Session session,
    required User user,
    required NotificationType type,
    required Map<String, dynamic> data,
  }) async {
    final results = <String, bool>{
      'email': false,
      'whatsapp': false,
      'telegram': false,
      'push': false, // Reserved for future Flutter app
    };

    // Always try email if available
    if (user.email != null && user.email!.isNotEmpty) {
      Log.info('📨📩 Sending notification to Email: ${user.email} is available');
      results['email'] = await _sendEmailNotification(session, user, type, data);
    }

    // Send to WhatsApp if authenticated
    if (user.whatsappAuthenticated && user.whatsappId != null) {
      results['whatsapp'] = await _sendWhatsAppNotification(session, user, type, data);
    }

    // Send to Telegram if authenticated
    if (user.telegramAuthenticated && user.telegramId != null) {
      results['telegram'] = await _sendTelegramNotification(session, user, type, data);
    }

    // Future: Push notifications for Flutter app
    // if (user.pushTokens != null && user.pushTokens.isNotEmpty) {
    //   results['push'] = await _sendPushNotification(session, user, type, data);
    // }

    return results;
  }

  // ==================== EMAIL NOTIFICATIONS ====================

  Future<bool> _sendEmailNotification(
    Session session,
    User user,
    NotificationType type,
    Map<String, dynamic> data,
  ) async {
    try {
      final emailService = getIt<EmailNotificationService>();
      
      switch (type) {
        case NotificationType.paymentReceived:
          return await emailService.sendPaymentReceipt(
            session: session,
            customer: user,
            order: data['order'] as Order,
            items: data['items'] as List<OrderItem>,
            transaction: data['transaction'] as PaymentTransaction,
          );

        case NotificationType.orderConfirmed:
          return await emailService.sendOrderConfirmedEmail(
            session: session,
            customer: user,
            order: data['order'] as Order,
          );

        case NotificationType.orderShipped:
          return await emailService.sendOrderShippedEmail(
            session: session,
            customer: user,
            order: data['order'] as Order,
          );

        case NotificationType.orderDelivered:
          return await emailService.sendDeliveryConfirmationEmail(
            session: session,
            customer: user,
            order: data['order'] as Order,
            escrow: data['escrow'] as OrderEscrow,
          );

        case NotificationType.refundProcessed:
          return await emailService.sendRefundProcessedEmail(
            session: session,
            customer: user,
            order: data['order'] as Order,
            refundAmount: data['refund_amount'] as double,
            reason: data['reason'] as String,
          );

        case NotificationType.newOrderVendor:
          return await emailService.sendNewOrderNotificationToVendor(
            session: session,
            vendor: user,
            order: data['order'] as Order,
            items: data['items'] as List<OrderItem>,
            vendorEarnings: data['vendor_earnings'] as double,
          );

        case NotificationType.paymentReleased:
          return await emailService.sendPaymentReleasedEmail(
            session: session,
            vendor: user,
            order: data['order'] as Order,
            amount: data['amount'] as double,
          );

        case NotificationType.returnRequested:
          return await emailService.sendReturnRequestEmail(
            session: session,
            vendor: user,
            order: data['order'] as Order,
            reason: data['reason'] as String,
          );

        case NotificationType.orderCancelled:
          return await emailService.sendOrderCancelledEmail(
            session: session,
            customer: user,
            order: data['order'] as Order,
            reason: data['reason'] as String?,
          );

        case NotificationType.returnApproved:
          return await emailService.sendReturnApprovedEmail(
            session: session,
            customer: user,
            order: data['order'] as Order,
            refundAmount: data['refund_amount'] as double,
          );

        case NotificationType.returnRejected:
          return await emailService.sendReturnRejectedEmail(
            session: session,
            customer: user,
            order: data['order'] as Order,
            reason: data['reason'] as String,
          );

        case NotificationType.deliveryAcknowledged:
          return await emailService.sendDeliveryAcknowledgedEmail(
            session: session,
            vendor: user,
            order: data['order'] as Order,
          );

        case NotificationType.lowStockAlert:
          return await emailService.sendLowStockAlertEmail(
            session: session,
            vendor: user,
            product: data['product'] as Product,
            currentStock: data['current_stock'] as int,
          );

        case NotificationType.productReview:
          return await emailService.sendProductReviewEmail(
            session: session,
            vendor: user,
            product: data['product'] as Product,
            rating: data['rating'] as int,
            customerName: data['customer_name'] as String,
            reviewText: data['review_text'] as String?,
          );

        case NotificationType.promocode:
          return await emailService.sendPromocodeEmail(
            session: session,
            customer: user,
            code: data['code'] as String,
            discount: data['discount'] as String,
            description: data['description'] as String?,
            expiresAt: data['expires_at'] as DateTime?,
          );

        default:
          session.log('⚠️ Unknown notification type: $type');
          return false;
      }
    } catch (e, stackTrace) {
      session.log('❌ Email notification error for $type: $e',
          stackTrace: stackTrace);
      return false;
    }
  }

  // ==================== WHATSAPP NOTIFICATIONS ====================

  Future<bool> _sendWhatsAppNotification(
    Session session,
    User user,
    NotificationType type,
    Map<String, dynamic> data,
  ) async {
    try {
      final whatsappService = getIt<WhatsAppService>();
      final message = _formatWhatsAppMessage(type, data);

      if (message == null) return false;

      final result = await whatsappService.sendMessage(
        phoneNumber: user.whatsappId!,
        text: message,
      );

      return result.isSuccess();
    } catch (e) {
      session.log('WhatsApp notification error: $e');
      return false;
    }
  }

  String? _formatWhatsAppMessage(
      NotificationType type, Map<String, dynamic> data) {
    switch (type) {
      case NotificationType.paymentReceived:
        final order = data['order'] as Order;
        final time = data['time'] as String;
        final reference = data['reference'] as String;
        return '''
✅ *Payment Successful!*

Your payment of ₦${order.totalAmount.toStringAsFixed(2)} has been received.

📦 Order: ${order.orderNumber}
💳 Reference: $reference
⏰ Time: $time
🛡️ Protected by escrow

You'll get order updates here. Check your email for full receipt!
''';

      case NotificationType.orderConfirmed:
        final order = data['order'] as Order;
        return '''
✅ *Order Confirmed*

Order ${order.orderNumber} is being prepared!

The vendor is working on your order. You'll receive shipping updates soon.
''';

      case NotificationType.orderShipped:
        final order = data['order'] as Order;
        return '''
🚚 *Order Shipped*

Order ${order.orderNumber} is on the way!

${order.trackingNumber != null ? '📍 Tracking: ${order.trackingNumber}' : ''}
Expected delivery: ${order.estimatedDeliveryDate?.toString().substring(0, 10) ?? 'Soon'}

⏰ Remember: 2-day return window after delivery!
''';

      case NotificationType.orderDelivered:
        final order = data['order'] as Order;
        final escrow = data['escrow'] as OrderEscrow;
        final daysLeft =
            escrow.returnWindowEnd!.difference(DateTime.now()).inDays;
        return '''
📦 *Order Delivered*

Order ${order.orderNumber} was marked as delivered!

✅ Confirm delivery with: /received ${order.orderNumber}

🔄 Return window: $daysLeft days left
💰 Payment released after return window expires
''';

      case NotificationType.newOrderVendor:
        final order = data['order'] as Order;
        final earnings = data['vendor_earnings'] as double;
        return '''
🔔 *New Order!*

Order: ${order.orderNumber}
Customer: ${order.customerName}
Amount: ₦${order.totalAmount.toStringAsFixed(2)}
💰 Your earnings: ₦${earnings.toStringAsFixed(2)}

⏰ Please confirm and ship within 5 days!

View: /vieworder ${order.orderNumber}
''';

      case NotificationType.paymentReleased:
        final order = data['order'] as Order;
        final amount = data['amount'] as double;
        return '''
💰 *Payment Released!*

₦${amount.toStringAsFixed(2)} added to your wallet!

Order: ${order.orderNumber}

Available for withdrawal now!
Type /wallet to see your balance.
''';

      case NotificationType.returnRequested:
        final order = data['order'] as Order;
        final reason = data['reason'] as String;
        return '''
🔄 *Return Request*

Customer requested return for ${order.orderNumber}

Reason: $reason

⚠️ Please review within 24 hours
Type /vieworder ${order.orderNumber}
''';

      case NotificationType.refundProcessed:
        final order = data['order'] as Order;
        final amount = data['refund_amount'] as double;
        return '''
💰 *Refund Processed*

₦${amount.toStringAsFixed(2)} refunded for order ${order.orderNumber}

Funds will appear in 3-5 business days.

Sorry it didn't work out! 💙
''';

      case NotificationType.orderCancelled:
        final order = data['order'] as Order;
        final reason = data['reason'] as String?;
        return '''
❌ *Order Cancelled*

Order ${order.orderNumber} has been cancelled.

${reason != null ? 'Reason: $reason\n' : ''}
A full refund will be processed within 3-5 business days.

We hope to serve you better next time!
''';

      case NotificationType.returnApproved:
        final order = data['order'] as Order;
        final amount = data['refund_amount'] as double;
        return '''
✅ *Return Approved*

Your return for order ${order.orderNumber} has been approved!

💰 Refund: ₦${amount.toStringAsFixed(2)}
⏰ Processing time: 3-5 business days

Thank you for your patience!
''';

      case NotificationType.returnRejected:
        final order = data['order'] as Order;
        final reason = data['reason'] as String;
        return '''
❌ *Return Request Denied*

Your return request for order ${order.orderNumber} was not approved.

Reason: $reason

If you believe this is an error, please contact support.
''';

      case NotificationType.deliveryAcknowledged:
        final order = data['order'] as Order;
        return '''
✅ *Delivery Confirmed by Customer*

Customer confirmed delivery for ${order.orderNumber}

💰 Payment will be released within 48 hours!

Great job on the sale! 🎉
''';

      case NotificationType.lowStockAlert:
        final product = data['product'] as Product;
        final currentStock = data['current_stock'] as int;
        return '''
⚠️ *Low Stock Alert*

${product.name} is running low!

📦 Current stock: $currentStock units
🔔 Threshold: ${product.lowStockThreshold}

Consider restocking soon to avoid lost sales.
''';

      case NotificationType.productReview:
        final product = data['product'] as Product;
        final rating = data['rating'] as int;
        final customer = data['customer_name'] as String;
        return '''
⭐ *New Review*

$customer left a $rating-star review on ${product.name}

Check it out and respond to build customer trust!
''';

      case NotificationType.promocode:
        final code = data['code'] as String;
        final discount = data['discount'] as String;
        final expires = data['expires_at'] as DateTime?;
        return '''
🎁 *Special Offer for You!*

Use code: *$code*
Discount: $discount
${expires != null ? 'Expires: ${expires.toString().substring(0, 10)}' : ''}

Start shopping now and save!
''';

      default:
        return null;
    }
  }

  // ==================== TELEGRAM NOTIFICATIONS ====================

  Future<bool> _sendTelegramNotification(
    Session session,
    User user,
    NotificationType type,
    Map<String, dynamic> data,
  ) async {
    try {
      final telegramService = getIt<TelegramService>();
      final message = _formatTelegramMessage(type, data);

      if (message == null) return false;

      await telegramService.sendTextMessage(
        chatId: int.parse(user.telegramId!),
        text: message,
      );

      return true;
    } catch (e) {
      session.log('Telegram notification error: $e');
      return false;
    }
  }

  String? _formatTelegramMessage(
      NotificationType type, Map<String, dynamic> data) {
    // Same format as WhatsApp for consistency
    return _formatWhatsAppMessage(type, data);
  }

  // ==================== FUTURE: PUSH NOTIFICATIONS ====================

  /// Reserved for future Flutter app push notifications
  /// This will be called when push tokens are available
  Future<bool> _sendPushNotification(
    Session session,
    User user,
    NotificationType type,
    Map<String, dynamic> data,
  ) async {
    // TODO: Implement FCM push notifications
    // final pushTokens = user.pushTokens;
    // final notification = _buildPushNotification(type, data);
    //
    // for (var token in pushTokens) {
    //   await fcm.send(token, notification);
    // }

    return false; // Not yet implemented
  }
}

/// Notification types enum for type-safe dispatching
enum NotificationType {
  // Customer notifications
  paymentReceived,
  orderConfirmed,
  orderShipped,
  orderDelivered,
  refundProcessed,
  orderCancelled,
  returnApproved,
  returnRejected,

  // Vendor notifications
  newOrderVendor,
  paymentReleased,
  returnRequested,
  deliveryAcknowledged,

  // Future notifications
  lowStockAlert,
  productReview,
  promocode,
}