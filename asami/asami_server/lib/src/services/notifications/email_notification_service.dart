// File: server/lib/src/services/notifications/email_notification_service.dart
// File: server/lib/src/services/notifications/email_notification_service.dart

import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:serverpod/serverpod.dart' hide Order, Message;
import '../../generated/protocol.dart' hide Message, Address;

/// Centralized email notification service for all transactional emails
/// This service is stateless and should be registered as a factory in GetIt
class EmailNotificationService {
  // No stored session or SMTP configuration - all passed per method call
  
  /// Initialize SMTP server configuration from session
  SmtpServer _getSmtpServer(Session session) {
    final smtpHost = session.serverpod.getPassword('smtpHost') ?? '';
    final smtpPort =
        int.parse(session.serverpod.getPassword('smtpPort') ?? '587');
    final smtpUser = session.serverpod.getPassword('smtpUser') ?? '';
    final smtpPass = session.serverpod.getPassword('smtpPassword') ?? '';

    return SmtpServer(
      smtpHost,
      port: smtpPort,
      username: smtpUser,
      password: smtpPass,
      ssl: true,
    );
  }

  /// Get sender email address from session
  String _getFromEmail(Session session) {
    return session.serverpod.getPassword('smtpUser') ?? '';
  }

  // ==================== CUSTOMER EMAILS ====================

  /// Send payment receipt to customer
  Future<bool> sendPaymentReceipt({
    required Session session,
    required User customer,
    required Order order,
    required List<OrderItem> items,
    required PaymentTransaction transaction,
  }) async {
    try {
      final smtpServer = _getSmtpServer(session);
      final fromEmail = _getFromEmail(session);
      
      final itemsHtml = items.map((item) => '''
        <tr>
          <td style="padding: 10px; border-bottom: 1px solid #eee;">${item.productName}</td>
          <td style="padding: 10px; border-bottom: 1px solid #eee; text-align: center;">${item.quantity}</td>
          <td style="padding: 10px; border-bottom: 1px solid #eee; text-align: right;">₦${item.unitPrice.toStringAsFixed(2)}</td>
          <td style="padding: 10px; border-bottom: 1px solid #eee; text-align: right;">₦${item.totalAmount.toStringAsFixed(2)}</td>
        </tr>
      ''').join('');

      final message = Message()
        ..from = Address(fromEmail, 'Asami')
        ..recipients.add(customer.email!)
        ..subject = '🧾 Payment Receipt - Order ${order.orderNumber}'
        ..html = '''
          <!DOCTYPE html>
          <html>
          <head>
            <style>
              body { font-family: Arial, sans-serif; line-height: 1.6; color: #333; }
              .container { max-width: 600px; margin: 0 auto; padding: 20px; }
              .header { background: #4CAF50; color: white; padding: 20px; text-align: center; }
              .content { background: #f9f9f9; padding: 30px; }
              .receipt-box { background: white; border: 1px solid #ddd; border-radius: 8px; padding: 20px; margin: 20px 0; }
              .status-badge { display: inline-block; padding: 5px 15px; background: #4CAF50; color: white; border-radius: 20px; font-size: 12px; }
              table { width: 100%; border-collapse: collapse; margin: 20px 0; }
              .total-row { font-weight: bold; font-size: 18px; }
              .footer { text-align: center; padding: 20px; font-size: 12px; color: #666; }
            </style>
          </head>
          <body>
            <div class="container">
              <div class="header">
                <h1>🛍️ Payment Successful!</h1>
              </div>
              <div class="content">
                <p>Hi ${customer.firstName ?? 'there'},</p>
                <p>Thank you for your payment! Your order has been confirmed.</p>
                
                <div class="receipt-box">
                  <h2>Receipt Details</h2>
                  <p><strong>Order Number:</strong> ${order.orderNumber}</p>
                  <p><strong>Payment Reference:</strong> ${transaction.reference}</p>
                  <p><strong>Date:</strong> ${DateTime.now().toString().substring(0, 16)}</p>
                  <p><span class="status-badge">PAID</span></p>
                  
                  <h3>Items Ordered</h3>
                  <table>
                    <thead>
                      <tr style="background: #f5f5f5;">
                        <th style="padding: 10px; text-align: left;">Item</th>
                        <th style="padding: 10px; text-align: center;">Qty</th>
                        <th style="padding: 10px; text-align: right;">Price</th>
                        <th style="padding: 10px; text-align: right;">Total</th>
                      </tr>
                    </thead>
                    <tbody>
                      $itemsHtml
                    </tbody>
                  </table>
                  
                  <table style="margin-top: 20px;">
                    <tr>
                      <td style="padding: 5px;">Subtotal:</td>
                      <td style="padding: 5px; text-align: right;">₦${order.subtotal.toStringAsFixed(2)}</td>
                    </tr>
                    <tr>
                      <td style="padding: 5px;">Shipping:</td>
                      <td style="padding: 5px; text-align: right;">₦${order.shippingCost.toStringAsFixed(2)}</td>
                    </tr>
                    <tr>
                      <td style="padding: 5px;">Tax:</td>
                      <td style="padding: 5px; text-align: right;">₦${order.taxAmount.toStringAsFixed(2)}</td>
                    </tr>
                    <tr class="total-row" style="border-top: 2px solid #333;">
                      <td style="padding: 10px;">TOTAL PAID:</td>
                      <td style="padding: 10px; text-align: right; color: #4CAF50;">₦${order.totalAmount.toStringAsFixed(2)}</td>
                    </tr>
                  </table>
                </div>
                
                <div style="background: #e3f2fd; padding: 15px; border-radius: 8px; margin: 20px 0;">
                  <h3 style="margin-top: 0;">🛡️ Buyer Protection</h3>
                  <p>Your payment is held securely in escrow until:</p>
                  <ul>
                    <li>✅ Vendor delivers your order (5 days maximum)</li>
                    <li>✅ You confirm delivery</li>
                    <li>✅ 2-day return window expires (if no issues)</li>
                  </ul>
                  <p><strong>You're protected!</strong> If the vendor doesn't deliver within 5 days, you'll get an automatic refund.</p>
                </div>
                
                <p><strong>Next Steps:</strong></p>
                <ol>
                  <li>The vendor will confirm and process your order</li>
                  <li>You'll receive shipping updates</li>
                  <li>Track your order anytime using: <strong>${order.orderNumber}</strong></li>
                </ol>
                
                <p>Questions? Reply to this email or contact support.</p>
              </div>
              <div class="footer">
                <p>© ${DateTime.now().year} Asami. All rights reserved.</p>
                <p>This is an automated receipt. Please save for your records.</p>
              </div>
            </div>
          </body>
          </html>
        ''';

      await send(message, smtpServer);
      session.log('✅ Payment receipt sent to ${customer.email}');
      return true;
    } catch (e, stackTrace) {
      session.log('❌ Failed to send payment receipt: $e',
          stackTrace: stackTrace);
      return false;
    }
  }

  /// Notify customer when order is confirmed by vendor
  Future<bool> sendOrderConfirmedEmail({
    required Session session,
    required User customer,
    required Order order,
  }) async {
    try {
      final smtpServer = _getSmtpServer(session);
      final fromEmail = _getFromEmail(session);
      
      final message = Message()
        ..from = Address(fromEmail, 'Asami')
        ..recipients.add(customer.email!)
        ..subject = '✅ Order Confirmed - ${order.orderNumber}'
        ..html = '''
          <!DOCTYPE html>
          <html>
          <body style="font-family: Arial, sans-serif; line-height: 1.6; color: #333;">
            <div style="max-width: 600px; margin: 0 auto; padding: 20px;">
              <div style="background: #4CAF50; color: white; padding: 20px; text-align: center;">
                <h1>✅ Order Confirmed!</h1>
              </div>
              <div style="background: #f9f9f9; padding: 30px;">
                <p>Hi ${customer.firstName ?? 'there'},</p>
                <p>Great news! Your order <strong>${order.orderNumber}</strong> has been confirmed by the vendor.</p>
                
                <div style="background: white; border: 1px solid #ddd; border-radius: 8px; padding: 20px; margin: 20px 0;">
                  <h3>Order Status: <span style="color: #4CAF50;">Confirmed</span></h3>
                  <p><strong>Expected Delivery:</strong> ${order.estimatedDeliveryDate?.toString().substring(0, 10) ?? 'To be confirmed'}</p>
                  <p>Your order is being prepared for shipment.</p>
                </div>
                
                <p>You'll receive another email when your order ships with tracking information.</p>
                
                <p>Thank you for shopping with Asami!</p>
              </div>
            </div>
          </body>
          </html>
        ''';

      await send(message, smtpServer);
      return true;
    } catch (e, stackTrace) {
      session.log('❌ Failed to send order confirmed email: $e',
          stackTrace: stackTrace);
      return false;
    }
  }

  /// Notify customer when order ships
  Future<bool> sendOrderShippedEmail({
    required Session session,
    required User customer,
    required Order order,
  }) async {
    try {
      final smtpServer = _getSmtpServer(session);
      final fromEmail = _getFromEmail(session);
      
      final message = Message()
        ..from = Address(fromEmail, 'Asami')
        ..recipients.add(customer.email!)
        ..subject = '🚚 Order Shipped - ${order.orderNumber}'
        ..html = '''
          <!DOCTYPE html>
          <html>
          <body style="font-family: Arial, sans-serif; line-height: 1.6; color: #333;">
            <div style="max-width: 600px; margin: 0 auto; padding: 20px;">
              <div style="background: #2196F3; color: white; padding: 20px; text-align: center;">
                <h1>🚚 Your Order is on the Way!</h1>
              </div>
              <div style="background: #f9f9f9; padding: 30px;">
                <p>Hi ${customer.firstName ?? 'there'},</p>
                <p>Your order <strong>${order.orderNumber}</strong> has been shipped!</p>
                
                <div style="background: white; border: 1px solid #ddd; border-radius: 8px; padding: 20px; margin: 20px 0;">
                  ${order.trackingNumber != null ? '''
                    <h3>📦 Tracking Information</h3>
                    <p><strong>Tracking Number:</strong> ${order.trackingNumber}</p>
                    <p><strong>Carrier:</strong> ${order.shippingProvider ?? 'Standard Delivery'}</p>
                  ''' : ''}
                  <p><strong>Expected Delivery:</strong> ${order.estimatedDeliveryDate?.toString().substring(0, 10) ?? 'Soon'}</p>
                </div>
                
                <div style="background: #fff3cd; border: 1px solid #ffc107; border-radius: 8px; padding: 15px; margin: 20px 0;">
                  <p><strong>⏰ Important Reminder:</strong></p>
                  <p>Once delivered, you have <strong>2 days</strong> to request a return if there are any issues.</p>
                  <p>After confirming delivery (or after 2 days), payment will be released to the vendor.</p>
                </div>
                
                <p>Thank you for your purchase!</p>
              </div>
            </div>
          </body>
          </html>
        ''';

      await send(message, smtpServer);
      return true;
    } catch (e, stackTrace) {
      session.log('❌ Failed to send order shipped email: $e',
          stackTrace: stackTrace);
      return false;
    }
  }

  /// Notify customer of delivery and return window
  Future<bool> sendDeliveryConfirmationEmail({
    required Session session,
    required User customer,
    required Order order,
    required OrderEscrow escrow,
  }) async {
    try {
      final smtpServer = _getSmtpServer(session);
      final fromEmail = _getFromEmail(session);
      
      final returnWindowEnd = escrow.returnWindowEnd!;
      final daysLeft = returnWindowEnd.difference(DateTime.now()).inDays;

      final message = Message()
        ..from = Address(fromEmail, 'Asami')
        ..recipients.add(customer.email!)
        ..subject = '📦 Order Delivered - ${order.orderNumber}'
        ..html = '''
          <!DOCTYPE html>
          <html>
          <body style="font-family: Arial, sans-serif; line-height: 1.6; color: #333;">
            <div style="max-width: 600px; margin: 0 auto; padding: 20px;">
              <div style="background: #4CAF50; color: white; padding: 20px; text-align: center;">
                <h1>📦 Order Delivered!</h1>
              </div>
              <div style="background: #f9f9f9; padding: 30px;">
                <p>Hi ${customer.firstName ?? 'there'},</p>
                <p>Your order <strong>${order.orderNumber}</strong> has been marked as delivered by the vendor.</p>
                
                <div style="background: #e8f5e9; border: 2px solid #4CAF50; border-radius: 8px; padding: 20px; margin: 20px 0;">
                  <h3 style="margin-top: 0;">✅ Confirm Your Delivery</h3>
                  <p>Did you receive your order in good condition?</p>
                  <p>Please confirm delivery to help us release payment to the vendor faster.</p>
                  <p style="text-align: center; margin: 20px 0;">
                    <a href="https://asami.com/confirm-delivery/${order.orderNumber}" 
                       style="display: inline-block; padding: 12px 30px; background: #4CAF50; color: white; text-decoration: none; border-radius: 5px; font-weight: bold;">
                      Confirm Delivery
                    </a>
                  </p>
                </div>
                
                <div style="background: #fff3cd; border: 1px solid #ffc107; border-radius: 8px; padding: 15px; margin: 20px 0;">
                  <h3 style="margin-top: 0;">🔄 Return Window: $daysLeft Days Left</h3>
                  <p>If there are any issues with your order, you can request a return until <strong>${returnWindowEnd.toString().substring(0, 16)}</strong>.</p>
                  <p>After the return window closes:</p>
                  <ul>
                    <li>Payment will be released to the vendor</li>
                    <li>Returns will no longer be accepted</li>
                  </ul>
                </div>
                
                <p><strong>Need to return?</strong> Reply to this email or use the Asami app.</p>
              </div>
            </div>
          </body>
          </html>
        ''';

      await send(message, smtpServer);
      return true;
    } catch (e, stackTrace) {
      session.log('❌ Failed to send delivery confirmation email: $e',
          stackTrace: stackTrace);
      return false;
    }
  }

  /// Notify customer of successful return/refund
  Future<bool> sendRefundProcessedEmail({
    required Session session,
    required User customer,
    required Order order,
    required double refundAmount,
    required String reason,
  }) async {
    try {
      final smtpServer = _getSmtpServer(session);
      final fromEmail = _getFromEmail(session);
      
      final message = Message()
        ..from = Address(fromEmail, 'Asami')
        ..recipients.add(customer.email!)
        ..subject = '💰 Refund Processed - ${order.orderNumber}'
        ..html = '''
          <!DOCTYPE html>
          <html>
          <body style="font-family: Arial, sans-serif; line-height: 1.6; color: #333;">
            <div style="max-width: 600px; margin: 0 auto; padding: 20px;">
              <div style="background: #2196F3; color: white; padding: 20px; text-align: center;">
                <h1>💰 Refund Processed</h1>
              </div>
              <div style="background: #f9f9f9; padding: 30px;">
                <p>Hi ${customer.firstName ?? 'there'},</p>
                <p>Your refund for order <strong>${order.orderNumber}</strong> has been processed.</p>
                
                <div style="background: white; border: 1px solid #ddd; border-radius: 8px; padding: 20px; margin: 20px 0;">
                  <h3>Refund Details</h3>
                  <p><strong>Amount:</strong> ₦${refundAmount.toStringAsFixed(2)}</p>
                  <p><strong>Reason:</strong> $reason</p>
                  <p><strong>Date:</strong> ${DateTime.now().toString().substring(0, 16)}</p>
                </div>
                
                <div style="background: #e3f2fd; padding: 15px; border-radius: 8px;">
                  <p><strong>When will I receive my refund?</strong></p>
                  <p>Refunds typically appear in your account within 3-5 business days, depending on your payment provider.</p>
                </div>
                
                <p>If you have any questions, feel free to contact us.</p>
                
                <p>We're sorry things didn't work out this time. We hope to serve you better in the future!</p>
              </div>
            </div>
          </body>
          </html>
        ''';

      await send(message, smtpServer);
      return true;
    } catch (e, stackTrace) {
      session.log('❌ Failed to send refund email: $e', stackTrace: stackTrace);
      return false;
    }
  }

  /// Notify customer when order is cancelled
  Future<bool> sendOrderCancelledEmail({
    required Session session,
    required User customer,
    required Order order,
    String? reason,
  }) async {
    try {
      final smtpServer = _getSmtpServer(session);
      final fromEmail = _getFromEmail(session);
      
      final message = Message()
        ..from = Address(fromEmail, 'Asami')
        ..recipients.add(customer.email!)
        ..subject = '❌ Order Cancelled - ${order.orderNumber}'
        ..html = '''
          <!DOCTYPE html>
          <html>
          <body style="font-family: Arial, sans-serif; line-height: 1.6; color: #333;">
            <div style="max-width: 600px; margin: 0 auto; padding: 20px;">
              <div style="background: #f44336; color: white; padding: 20px; text-align: center;">
                <h1>❌ Order Cancelled</h1>
              </div>
              <div style="background: #f9f9f9; padding: 30px;">
                <p>Hi ${customer.firstName ?? 'there'},</p>
                <p>We're writing to inform you that order <strong>${order.orderNumber}</strong> has been cancelled.</p>
                
                <div style="background: white; border: 1px solid #ddd; border-radius: 8px; padding: 20px; margin: 20px 0;">
                  <h3>Cancellation Details</h3>
                  <p><strong>Order Number:</strong> ${order.orderNumber}</p>
                  <p><strong>Amount:</strong> ₦${order.totalAmount.toStringAsFixed(2)}</p>
                  ${reason != null ? '<p><strong>Reason:</strong> $reason</p>' : ''}
                  <p><strong>Date:</strong> ${DateTime.now().toString().substring(0, 16)}</p>
                </div>
                
                <div style="background: #e3f2fd; padding: 15px; border-radius: 8px; margin: 20px 0;">
                  <h3 style="margin-top: 0;">💰 Refund Information</h3>
                  <p>A full refund of <strong>₦${order.totalAmount.toStringAsFixed(2)}</strong> will be processed to your original payment method.</p>
                  <p>Please allow 3-5 business days for the refund to appear in your account.</p>
                </div>
                
                <p>We apologize for any inconvenience this may have caused. We hope to serve you better in the future!</p>
                
                <p style="text-align: center; margin: 30px 0;">
                  <a href="https://asami.com/shop" 
                     style="display: inline-block; padding: 12px 30px; background: #2196F3; color: white; text-decoration: none; border-radius: 5px; font-weight: bold;">
                    Continue Shopping
                  </a>
                </p>
                
                <p>If you have any questions, please don't hesitate to contact our support team.</p>
              </div>
            </div>
          </body>
          </html>
        ''';

      await send(message, smtpServer);
      return true;
    } catch (e, stackTrace) {
      session.log('❌ Failed to send order cancelled email: $e',
          stackTrace: stackTrace);
      return false;
    }
  }

  /// Notify customer when return is approved
  Future<bool> sendReturnApprovedEmail({
    required Session session,
    required User customer,
    required Order order,
    required double refundAmount,
  }) async {
    try {
      final smtpServer = _getSmtpServer(session);
      final fromEmail = _getFromEmail(session);
      
      final message = Message()
        ..from = Address(fromEmail, 'Asami')
        ..recipients.add(customer.email!)
        ..subject = '✅ Return Approved - ${order.orderNumber}'
        ..html = '''
          <!DOCTYPE html>
          <html>
          <body style="font-family: Arial, sans-serif; line-height: 1.6; color: #333;">
            <div style="max-width: 600px; margin: 0 auto; padding: 20px;">
              <div style="background: #4CAF50; color: white; padding: 20px; text-align: center;">
                <h1>✅ Return Approved</h1>
              </div>
              <div style="background: #f9f9f9; padding: 30px;">
                <p>Hi ${customer.firstName ?? 'there'},</p>
                <p>Good news! Your return request for order <strong>${order.orderNumber}</strong> has been approved by the vendor.</p>
                
                <div style="background: white; border: 1px solid #ddd; border-radius: 8px; padding: 20px; margin: 20px 0;">
                  <h3>Return Details</h3>
                  <p><strong>Order Number:</strong> ${order.orderNumber}</p>
                  <p><strong>Refund Amount:</strong> ₦${refundAmount.toStringAsFixed(2)}</p>
                  <p><strong>Status:</strong> <span style="color: #4CAF50; font-weight: bold;">APPROVED</span></p>
                </div>
                
                <div style="background: #e8f5e9; border: 2px solid #4CAF50; border-radius: 8px; padding: 20px; margin: 20px 0;">
                  <h3 style="margin-top: 0;">💰 Refund Processing</h3>
                  <p>Your refund of <strong>₦${refundAmount.toStringAsFixed(2)}</strong> is being processed.</p>
                  <p><strong>Timeline:</strong> 3-5 business days</p>
                  <p>The funds will be credited to your original payment method.</p>
                </div>
                
                <p>Thank you for your patience throughout this process. We appreciate your understanding!</p>
                
                <p>If you have any questions about your refund, please contact our support team.</p>
              </div>
            </div>
          </body>
          </html>
        ''';

      await send(message, smtpServer);
      return true;
    } catch (e, stackTrace) {
      session.log('❌ Failed to send return approved email: $e',
          stackTrace: stackTrace);
      return false;
    }
  }

  /// Notify customer when return is rejected
  Future<bool> sendReturnRejectedEmail({
    required Session session,
    required User customer,
    required Order order,
    required String reason,
  }) async {
    try {
      final smtpServer = _getSmtpServer(session);
      final fromEmail = _getFromEmail(session);
      
      final message = Message()
        ..from = Address(fromEmail, 'Asami')
        ..recipients.add(customer.email!)
        ..subject = '❌ Return Request Not Approved - ${order.orderNumber}'
        ..html = '''
          <!DOCTYPE html>
          <html>
          <body style="font-family: Arial, sans-serif; line-height: 1.6; color: #333;">
            <div style="max-width: 600px; margin: 0 auto; padding: 20px;">
              <div style="background: #FF9800; color: white; padding: 20px; text-align: center;">
                <h1>Return Request Update</h1>
              </div>
              <div style="background: #f9f9f9; padding: 30px;">
                <p>Hi ${customer.firstName ?? 'there'},</p>
                <p>We're writing to inform you that your return request for order <strong>${order.orderNumber}</strong> was not approved.</p>
                
                <div style="background: white; border: 1px solid #ddd; border-radius: 8px; padding: 20px; margin: 20px 0;">
                  <h3>Return Request Details</h3>
                  <p><strong>Order Number:</strong> ${order.orderNumber}</p>
                  <p><strong>Status:</strong> <span style="color: #f44336; font-weight: bold;">NOT APPROVED</span></p>
                  <p><strong>Vendor's Reason:</strong></p>
                  <p style="background: #fff3cd; padding: 15px; border-radius: 5px; border-left: 4px solid #ffc107;">
                    $reason
                  </p>
                </div>
                
                <div style="background: #e3f2fd; padding: 15px; border-radius: 8px; margin: 20px 0;">
                  <h3 style="margin-top: 0;">Need Help?</h3>
                  <p>If you believe this decision was made in error or if you have additional information to support your return request, please contact our support team.</p>
                  <p>We're here to help ensure a fair resolution for all parties.</p>
                </div>
                
                <p style="text-align: center; margin: 30px 0;">
                  <a href="https://asami.com/support" 
                     style="display: inline-block; padding: 12px 30px; background: #2196F3; color: white; text-decoration: none; border-radius: 5px; font-weight: bold;">
                    Contact Support
                  </a>
                </p>
                
                <p>We apologize for any inconvenience and appreciate your understanding.</p>
              </div>
            </div>
          </body>
          </html>
        ''';

      await send(message, smtpServer);
      return true;
    } catch (e, stackTrace) {
      session.log('❌ Failed to send return rejected email: $e',
          stackTrace: stackTrace);
      return false;
    }
  }

  /// Notify customer about promotional code
  Future<bool> sendPromocodeEmail({
    required Session session,
    required User customer,
    required String code,
    required String discount,
    String? description,
    DateTime? expiresAt,
  }) async {
    try {
      final smtpServer = _getSmtpServer(session);
      final fromEmail = _getFromEmail(session);
      
      final message = Message()
        ..from = Address(fromEmail, 'Asami')
        ..recipients.add(customer.email!)
        ..subject = '🎁 Special Offer Just for You!'
        ..html = '''
          <!DOCTYPE html>
          <html>
          <body style="font-family: Arial, sans-serif; line-height: 1.6; color: #333;">
            <div style="max-width: 600px; margin: 0 auto; padding: 20px;">
              <div style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: white; padding: 40px 20px; text-align: center;">
                <h1 style="margin: 0; font-size: 32px;">🎁 Special Offer!</h1>
                <p style="margin: 10px 0 0 0; font-size: 18px;">We've got something special for you</p>
              </div>
              <div style="background: #f9f9f9; padding: 30px;">
                <p>Hi ${customer.firstName ?? 'there'},</p>
                <p>We're excited to share this exclusive offer with you!</p>
                
                <div style="background: white; border: 3px dashed #667eea; border-radius: 12px; padding: 30px; margin: 30px 0; text-align: center;">
                  <p style="margin: 0 0 10px 0; color: #666; font-size: 14px; text-transform: uppercase; letter-spacing: 2px;">Your Promo Code</p>
                  <div style="background: #f5f3ff; padding: 20px; border-radius: 8px; margin: 15px 0;">
                    <h2 style="margin: 0; font-size: 36px; color: #667eea; letter-spacing: 3px; font-family: 'Courier New', monospace;">
                      $code
                    </h2>
                  </div>
                  <p style="margin: 20px 0 10px 0; font-size: 24px; color: #4CAF50; font-weight: bold;">
                    Save $discount
                  </p>
                  ${description != null ? '<p style="color: #666; margin: 10px 0;">$description</p>' : ''}
                  ${expiresAt != null ? '<p style="color: #f44336; font-weight: bold; margin: 15px 0;">⏰ Expires: ${expiresAt.toString().substring(0, 10)}</p>' : ''}
                </div>
                
                <div style="background: #e8f5e9; border-left: 4px solid #4CAF50; padding: 20px; margin: 20px 0;">
                  <h3 style="margin-top: 0;">How to Use Your Code</h3>
                  <ol style="margin: 10px 0; padding-left: 20px;">
                    <li>Browse our amazing products</li>
                    <li>Add items to your cart</li>
                    <li>Enter code <strong>$code</strong> at checkout</li>
                    <li>Enjoy your discount!</li>
                  </ol>
                </div>
                
                <p style="text-align: center; margin: 40px 0;">
                  <a href="https://asami.com/shop" 
                     style="display: inline-block; padding: 15px 40px; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: white; text-decoration: none; border-radius: 50px; font-weight: bold; font-size: 16px; box-shadow: 0 4px 15px rgba(102, 126, 234, 0.4);">
                    Start Shopping Now
                  </a>
                </p>
                
                <p style="text-align: center; color: #666; font-size: 12px;">
                  Don't miss out on this amazing deal!
                </p>
              </div>
            </div>
          </body>
          </html>
        ''';

      await send(message, smtpServer);
      return true;
    } catch (e, stackTrace) {
      session.log('❌ Failed to send promocode email: $e',
          stackTrace: stackTrace);
      return false;
    }
  }

  // ==================== VENDOR EMAILS ====================

  /// Notify vendor of new order
  Future<bool> sendNewOrderNotificationToVendor({
    required Session session, 
    required User vendor,
    required Order order,
    required List<OrderItem> items,
    required double vendorEarnings,
  }) async {
    try {
      final smtpServer = _getSmtpServer(session); 
      final fromEmail = _getFromEmail(session);
      final itemsHtml = items.map((item) => '''
        <tr>
          <td style="padding: 10px; border-bottom: 1px solid #eee;">${item.productName}</td>
          <td style="padding: 10px; border-bottom: 1px solid #eee; text-align: center;">${item.quantity}</td>
          <td style="padding: 10px; border-bottom: 1px solid #eee; text-align: right;">₦${item.totalAmount.toStringAsFixed(2)}</td>
        </tr>
      ''').join('');

      final message = Message()
        ..from = Address(fromEmail, 'Asami')
        ..recipients.add(vendor.email!)
        ..subject = '🔔 New Order Received - ${order.orderNumber}'
        ..html = '''
          <!DOCTYPE html>
          <html>
          <body style="font-family: Arial, sans-serif; line-height: 1.6; color: #333;">
            <div style="max-width: 600px; margin: 0 auto; padding: 20px;">
              <div style="background: #FF9800; color: white; padding: 20px; text-align: center;">
                <h1>🔔 New Order!</h1>
              </div>
              <div style="background: #f9f9f9; padding: 30px;">
                <p>Hi ${vendor.firstName ?? 'there'},</p>
                <p>You have a new order! A customer has purchased from your store.</p>
                
                <div style="background: white; border: 1px solid #ddd; border-radius: 8px; padding: 20px; margin: 20px 0;">
                  <h3>Order Details</h3>
                  <p><strong>Order Number:</strong> ${order.orderNumber}</p>
                  <p><strong>Customer:</strong> ${order.customerName}</p>
                  <p><strong>Phone:</strong> ${order.customerPhone}</p>
                  <p><strong>Payment Status:</strong> <span style="color: #4CAF50; font-weight: bold;">PAID</span></p>
                  
                  <h4>Items Ordered</h4>
                  <table style="width: 100%; border-collapse: collapse;">
                    <thead>
                      <tr style="background: #f5f5f5;">
                        <th style="padding: 10px; text-align: left;">Item</th>
                        <th style="padding: 10px; text-align: center;">Qty</th>
                        <th style="padding: 10px; text-align: right;">Total</th>
                      </tr>
                    </thead>
                    <tbody>
                      $itemsHtml
                    </tbody>
                  </table>
                </div>
                
                <div style="background: #e8f5e9; border: 2px solid #4CAF50; border-radius: 8px; padding: 20px; margin: 20px 0;">
                  <h3 style="margin-top: 0;">💰 Your Earnings</h3>
                  <p style="font-size: 24px; font-weight: bold; color: #4CAF50; margin: 10px 0;">₦${vendorEarnings.toStringAsFixed(2)}</p>
                  <p style="font-size: 12px; color: #666;">
                    Payment is held in escrow until delivery confirmation.<br>
                    Funds will be released after successful delivery and return window.
                  </p>
                </div>
                
                <div style="background: #fff3cd; border: 1px solid #ffc107; border-radius: 8px; padding: 15px; margin: 20px 0;">
                  <h3 style="margin-top: 0;">⏰ Action Required</h3>
                  <p><strong>Please confirm and ship this order within 5 days.</strong></p>
                  <p>If not shipped within 5 days, the order will be auto-cancelled and refunded to the customer.</p>
                </div>
                
                <p style="text-align: center; margin: 30px 0;">
                  <a href="https://vendor.asami.com/orders/${order.orderNumber}" 
                     style="display: inline-block; padding: 12px 30px; background: #FF9800; color: white; text-decoration: none; border-radius: 5px; font-weight: bold;">
                    View Order Details
                  </a>
                </p>
                
                <p>Good luck with your sale!</p>
              </div>
            </div>
          </body>
          </html>
        ''';

      await send(message, smtpServer);
      session.log('✅ New order notification sent to vendor ${vendor.email}');
      return true;
    } catch (e, stackTrace) {
      session.log('❌ Failed to send vendor notification: $e',
          stackTrace: stackTrace);
      return false;
    }
  }

  /// Notify vendor when payment released from escrow
  Future<bool> sendPaymentReleasedEmail({
    required Session session,
    required User vendor,
    required Order order,
    required double amount,
  }) async {
    try {
      final smtpServer = _getSmtpServer(session);
      final fromEmail = _getFromEmail(session);
      
      final message = Message()
        ..from = Address(fromEmail, 'Asami')
        ..recipients.add(vendor.email!)
        ..subject = '💰 Payment Released - ${order.orderNumber}'
        ..html = '''
          <!DOCTYPE html>
          <html>
          <body style="font-family: Arial, sans-serif; line-height: 1.6; color: #333;">
            <div style="max-width: 600px; margin: 0 auto; padding: 20px;">
              <div style="background: #4CAF50; color: white; padding: 20px; text-align: center;">
                <h1>💰 Payment Released!</h1>
              </div>
              <div style="background: #f9f9f9; padding: 30px;">
                <p>Hi ${vendor.firstName ?? 'there'},</p>
                <p>Great news! Payment for order <strong>${order.orderNumber}</strong> has been released to your account.</p>
                
                <div style="background: white; border: 1px solid #ddd; border-radius: 8px; padding: 20px; margin: 20px 0; text-align: center;">
                  <h2 style="color: #4CAF50; margin: 0;">₦${amount.toStringAsFixed(2)}</h2>
                  <p style="color: #666; margin: 5px 0;">Added to Available Balance</p>
                </div>
                
                <div style="background: #e3f2fd; padding: 15px; border-radius: 8px; margin: 20px 0;">
                  <p><strong>What happened?</strong></p>
                  <ul>
                    <li>Customer confirmed delivery, or</li>
                    <li>2-day return window expired with no issues</li>
                  </ul>
                  <p>Your funds are now available for withdrawal!</p>
                </div>
                
                <p style="text-align: center; margin: 30px 0;">
                  <a href="https://vendor.asami.com/wallet" 
                     style="display: inline-block; padding: 12px 30px; background: #4CAF50; color: white; text-decoration: none; border-radius: 5px; font-weight: bold;">
                    View Wallet
                  </a>
                </p>
                
                <p>Thank you for being a great seller!</p>
              </div>
            </div>
          </body>
          </html>
        ''';

      await send(message, smtpServer);
      return true;
    } catch (e, stackTrace) {
      session.log('❌ Failed to send payment released email: $e',
          stackTrace: stackTrace);
      return false;
    }
  }

  /// Notify vendor of return request
  Future<bool> sendReturnRequestEmail({
    required Session session,
    required User vendor,
    required Order order,
    required String reason,
  }) async {
    try {
      final smtpServer = _getSmtpServer(session);
      final fromEmail = _getFromEmail(session);
      
      final message = Message()
        ..from = Address(fromEmail, 'Asami')
        ..recipients.add(vendor.email!)
        ..subject = '🔄 Return Request - ${order.orderNumber}'
        ..html = '''
          <!DOCTYPE html>
          <html>
          <body style="font-family: Arial, sans-serif; line-height: 1.6; color: #333;">
            <div style="max-width: 600px; margin: 0 auto; padding: 20px;">
              <div style="background: #FF9800; color: white; padding: 20px; text-align: center;">
                <h1>🔄 Return Request</h1>
              </div>
              <div style="background: #f9f9f9; padding: 30px;">
                <p>Hi ${vendor.firstName ?? 'there'},</p>
                <p>A customer has requested a return for order <strong>${order.orderNumber}</strong>.</p>
                
                <div style="background: white; border: 1px solid #ddd; border-radius: 8px; padding: 20px; margin: 20px 0;">
                  <h3>Return Details</h3>
                  <p><strong>Customer:</strong> ${order.customerName}</p>
                  <p><strong>Reason:</strong> $reason</p>
                  <p><strong>Order Total:</strong> ₦${order.totalAmount.toStringAsFixed(2)}</p>
                </div>
                
                <div style="background: #fff3cd; border: 1px solid #ffc107; border-radius: 8px; padding: 15px; margin: 20px 0;">
                  <h3 style="margin-top: 0;">⚠️ Action Required</h3>
                  <p>Please review this return request within 24 hours.</p>
                  <p>If approved, a full refund will be issued to the customer and funds will be deducted from your escrow.</p>
                </div>
                
                <p style="text-align: center; margin: 30px 0;">
                  <a href="https://vendor.asami.com/returns/${order.orderNumber}" 
                     style="display: inline-block; padding: 12px 30px; background: #FF9800; color: white; text-decoration: none; border-radius: 5px; font-weight: bold;">
                    Review Return Request
                  </a>
                </p>
              </div>
            </div>
          </body>
          </html>
        ''';

      await send(message, smtpServer);
      return true;
    } catch (e, stackTrace) {
      session.log('❌ Failed to send return request email: $e',
          stackTrace: stackTrace);
      return false;
    }
  }

  /// Notify vendor when customer acknowledges delivery
  Future<bool> sendDeliveryAcknowledgedEmail({
    required Session session,
    required User vendor,
    required Order order,
  }) async {
    try {
       final smtpServer = _getSmtpServer(session);
      final fromEmail = _getFromEmail(session);
      final message = Message()
        ..from = Address(fromEmail, 'Asami')
        ..recipients.add(vendor.email!)
        ..subject = '✅ Delivery Confirmed by Customer - ${order.orderNumber}'
        ..html = '''
          <!DOCTYPE html>
          <html>
          <body style="font-family: Arial, sans-serif; line-height: 1.6; color: #333;">
            <div style="max-width: 600px; margin: 0 auto; padding: 20px;">
              <div style="background: #4CAF50; color: white; padding: 20px; text-align: center;">
                <h1>✅ Delivery Confirmed!</h1>
              </div>
              <div style="background: #f9f9f9; padding: 30px;">
                <p>Hi ${vendor.firstName ?? 'there'},</p>
                <p>Great news! The customer has confirmed delivery of order <strong>${order.orderNumber}</strong>.</p>
                
                <div style="background: white; border: 1px solid #ddd; border-radius: 8px; padding: 20px; margin: 20px 0;">
                  <h3>Order Details</h3>
                  <p><strong>Order Number:</strong> ${order.orderNumber}</p>
                  <p><strong>Customer:</strong> ${order.customerName}</p>
                  <p><strong>Confirmed:</strong> ${DateTime.now().toString().substring(0, 16)}</p>
                </div>
                
                <div style="background: #e8f5e9; border: 2px solid #4CAF50; border-radius: 8px; padding: 20px; margin: 20px 0;">
                  <h3 style="margin-top: 0;">💰 Payment Release</h3>
                  <p>Your payment will be released within <strong>48 hours</strong>, or after the 2-day return window expires (whichever comes first).</p>
                  <p>Great job on completing this sale successfully!</p>
                </div>
                
                <p style="text-align: center; margin: 30px 0;">
                  <a href="https://vendor.asami.com/orders/${order.orderNumber}" 
                     style="display: inline-block; padding: 12px 30px; background: #4CAF50; color: white; text-decoration: none; border-radius: 5px; font-weight: bold;">
                    View Order
                  </a>
                </p>
                
                <p>Thank you for providing excellent service! 🎉</p>
              </div>
            </div>
          </body>
          </html>
        ''';

      await send(message, smtpServer);
      return true;
    } catch (e, stackTrace) {
      session.log('❌ Failed to send delivery acknowledged email: $e',
          stackTrace: stackTrace);
      return false;
    }
  }

  /// Notify vendor about low stock
  Future<bool> sendLowStockAlertEmail({
    required Session session,
    required User vendor,
    required Product product,
    required int currentStock,
  }) async {
    try {
      final smtpServer = _getSmtpServer(session);
      final fromEmail = _getFromEmail(session);
      
      final message = Message()
        ..from = Address(fromEmail, 'Asami')
        ..recipients.add(vendor.email!)
        ..subject = '⚠️ Low Stock Alert - ${product.name}'
        ..html = '''
          <!DOCTYPE html>
          <html>
          <body style="font-family: Arial, sans-serif; line-height: 1.6; color: #333;">
            <div style="max-width: 600px; margin: 0 auto; padding: 20px;">
              <div style="background: #FF9800; color: white; padding: 20px; text-align: center;">
                <h1>⚠️ Low Stock Alert</h1>
              </div>
              <div style="background: #f9f9f9; padding: 30px;">
                <p>Hi ${vendor.firstName ?? 'there'},</p>
                <p>This is an automated alert to inform you that one of your products is running low on stock.</p>
                
                <div style="background: white; border: 1px solid #ddd; border-radius: 8px; padding: 20px; margin: 20px 0;">
                  <h3>Product Details</h3>
                  <p><strong>Product:</strong> ${product.name}</p>
                  <p><strong>Current Stock:</strong> <span style="color: #f44336; font-weight: bold;">$currentStock units</span></p>
                  <p><strong>Low Stock Threshold:</strong> ${product.lowStockThreshold} units</p>
                </div>
                
                <div style="background: #fff3cd; border: 1px solid #ffc107; border-radius: 8px; padding: 15px; margin: 20px 0;">
                  <h3 style="margin-top: 0;">📦 Action Recommended</h3>
                  <p>Consider restocking this product soon to avoid:</p>
                  <ul>
                    <li>Lost sales opportunities</li>
                    <li>Disappointing customers</li>
                    <li>Product going out of stock</li>
                  </ul>
                </div>
                
                <p style="text-align: center; margin: 30px 0;">
                  <a href="https://vendor.asami.com/products/${product.id}/edit" 
                     style="display: inline-block; padding: 12px 30px; background: #FF9800; color: white; text-decoration: none; border-radius: 5px; font-weight: bold;">
                    Update Stock
                  </a>
                </p>
                
                <p style="font-size: 12px; color: #666;">
                  <em>Tip: You can adjust your low stock threshold in the product settings to receive alerts at different inventory levels.</em>
                </p>
              </div>
            </div>
          </body>
          </html>
        ''';

      await send(message, smtpServer);
      return true;
    } catch (e, stackTrace) {
      session.log('❌ Failed to send low stock alert email: $e',
          stackTrace: stackTrace);
      return false;
    }
  }

  /// Notify vendor about new product review
  Future<bool> sendProductReviewEmail({
    required Session session,
    required User vendor,
    required Product product,
    required int rating,
    required String customerName,
    String? reviewText,
  }) async {
    try {
      final smtpServer = _getSmtpServer(session);
      final fromEmail = _getFromEmail(session);
      final starsHtml = '⭐' * rating + ('☆' * (5 - rating));

      final message = Message()
        ..from = Address(fromEmail, 'Asami')
        ..recipients.add(vendor.email!)
        ..subject = '⭐ New $rating-Star Review - ${product.name}'
        ..html = '''
          <!DOCTYPE html>
          <html>
          <body style="font-family: Arial, sans-serif; line-height: 1.6; color: #333;">
            <div style="max-width: 600px; margin: 0 auto; padding: 20px;">
              <div style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: white; padding: 20px; text-align: center;">
                <h1>⭐ New Review Received!</h1>
              </div>
              <div style="background: #f9f9f9; padding: 30px;">
                <p>Hi ${vendor.firstName ?? 'there'},</p>
                <p>A customer has left a review on one of your products!</p>
                
                <div style="background: white; border: 1px solid #ddd; border-radius: 8px; padding: 20px; margin: 20px 0;">
                  <h3>Review Details</h3>
                  <p><strong>Product:</strong> ${product.name}</p>
                  <p><strong>Customer:</strong> $customerName</p>
                  <p style="font-size: 24px; margin: 15px 0;">$starsHtml</p>
                  <p><strong>Rating:</strong> $rating out of 5 stars</p>
                  ${reviewText != null ? '''
                    <div style="background: #f5f5f5; padding: 15px; border-radius: 5px; margin-top: 15px; border-left: 4px solid #667eea;">
                      <p style="margin: 0; font-style: italic;">"$reviewText"</p>
                    </div>
                  ''' : ''}
                </div>
                
                <div style="background: #e8f5e9; border-left: 4px solid #4CAF50; padding: 15px; margin: 20px 0;">
                  <h3 style="margin-top: 0;">💡 Pro Tip</h3>
                  <p>Responding to reviews shows customers you care and helps build trust in your brand!</p>
                  <p>Consider thanking the customer and addressing any feedback they provided.</p>
                </div>
                
                <p style="text-align: center; margin: 30px 0;">
                  <a href="https://vendor.asami.com/products/${product.id}/reviews" 
                     style="display: inline-block; padding: 12px 30px; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: white; text-decoration: none; border-radius: 5px; font-weight: bold;">
                    View & Respond to Review
                  </a>
                </p>
                
                <p>Keep up the great work!</p>
              </div>
            </div>
          </body>
          </html>
        ''';

      await send(message, smtpServer);
      return true;
    } catch (e, stackTrace) {
      session.log('❌ Failed to send product review email: $e',
          stackTrace: stackTrace);
      return false;
    }
  }
}
