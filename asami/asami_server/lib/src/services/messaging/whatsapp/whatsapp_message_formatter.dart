import 'package:serverpod/serverpod.dart' hide Order;

import '../../../endpoints/bot_endpoint.dart';
import '../../../generated/protocol.dart';

/// Helper class to format messages for WhatsApp
class WhatsAppMessageFormatter {
  /// Format product list as WhatsApp message
  static String formatProductList(List<Product> products) {
    if (products.isEmpty) {
      return "I couldn't find any products matching your search. Try different keywords? 🔍";
    }

    final buffer = StringBuffer();
    buffer.writeln('🛍️ *Here are some products I found:*\n');

    for (var i = 0; i < products.length && i < 10; i++) {
      final product = products[i];
      final number = i + 1;
      
      buffer.writeln('*$number. ${product.name}*');
      buffer.writeln('💰 ${product.currency} ${product.basePrice.toStringAsFixed(2)}');
      
      if (product.discountPrice != null) {
        buffer.writeln('🏷️ Sale: ${product.currency} ${product.discountPrice!.toStringAsFixed(2)}');
      }
      
      if (product.quantity > 0) {
        buffer.writeln('📦 In Stock');
      } else {
        buffer.writeln('❌ Out of Stock');
      }
      
      buffer.writeln('');
    }

    if (products.length > 10) {
      buffer.writeln('_... and ${products.length - 10} more products_');
    }

    buffer.writeln('\n💬 Reply with a number to see details or "Add [number]" to add to cart');

    return buffer.toString();
  }

  static String formatProductDetails(Product product) {
    final buffer = StringBuffer();
    
    buffer.writeln('💎 *${product.name}*');
    buffer.writeln('₦${product.basePrice.toStringAsFixed(2)}${product.discountPrice != null ? ' ~~₦${product.discountPrice!.toStringAsFixed(2)}~~' : ''}');
    buffer.writeln('⭐ ${product.averageRating.toStringAsFixed(1)} (${product.totalReviews} reviews)');
    buffer.writeln('━━━━━━━━━━━━━━━━');
    buffer.writeln('');
    buffer.writeln(product.description);
    buffer.writeln('');
    buffer.writeln('📦 Stock: ${product.quantity} available');
    buffer.writeln('🚚 Delivery: ${product.estimatedDeliveryDays ?? 3} days');
    
    if (product.color?.isNotEmpty == true) {
      buffer.writeln('🎨 Colors: ${product.color!.join(', ')}');
    }
    
    if (product.size?.isNotEmpty == true) {
      buffer.writeln('📏 Sizes: ${product.size!.join(', ')}');
    }
    
    if (product.freeShipping) {
      buffer.writeln('✅ Free Shipping');
    } else {
      buffer.writeln('💰 Shipping: ₦${product.shippingCost.toStringAsFixed(2)}');
    }
    
    return buffer.toString();
  }

  /// Format order confirmation
  static String formatOrderConfirmation(Order order, List<OrderItem> items) {
    final buffer = StringBuffer();
    
    buffer.writeln('✅ *Order Confirmed!*\n');
    buffer.writeln('📦 Order Number: *${order.orderNumber}*');
    buffer.writeln('');
    buffer.writeln('*Items:*');
    
    for (var item in items) {
      buffer.writeln('• ${item.productName} x${item.quantity}');
      buffer.writeln('  ${order.currency} ${item.totalAmount.toStringAsFixed(2)}');
    }
    
    buffer.writeln('');
    buffer.writeln('💰 *Total: ${order.currency} ${order.totalAmount.toStringAsFixed(2)}*');
    buffer.writeln('');
    buffer.writeln('📍 Delivery to: ${order.customerName}');
    
    if (order.estimatedDeliveryDate != null) {
      final days = order.estimatedDeliveryDate!.difference(DateTime.now()).inDays;
      buffer.writeln('🚚 Estimated delivery: $days days');
    }
    
    buffer.writeln('');
    buffer.writeln('Track your order by typing: *Track ${order.orderNumber}*');

    return buffer.toString();
  }

  /// Format cart summary
  static String formatCartSummary(Cart cart, List<CartItem> items) {
    if (items.isEmpty) {
      return '🛒 Your cart is empty. Start shopping by searching for products!';
    }

    final buffer = StringBuffer();
    buffer.writeln('🛒 *Your Cart*\n');
    
    for (var i = 0; i < items.length; i++) {
      final item = items[i];
      buffer.writeln('${i + 1}. ${item.quantity}x Item');
      buffer.writeln('   ${cart.subtotal.toStringAsFixed(2)}');
      buffer.writeln('');
    }
    
    buffer.writeln('💰 *Subtotal: ${cart.subtotal.toStringAsFixed(2)}*');
    buffer.writeln('');
    buffer.writeln('Reply with:');
    buffer.writeln('• *Checkout* - to complete order');
    buffer.writeln('• *Remove [number]* - to remove item');
    buffer.writeln('• *Clear cart* - to start over');

    return buffer.toString();
  }

  /// Format order tracking
  static String formatOrderTracking(Order order) {
    final buffer = StringBuffer();
    
    buffer.writeln('📦 *Order Tracking*\n');
    buffer.writeln('Order: *${order.orderNumber}*');
    buffer.writeln('Status: ${_getStatusEmoji(order.status)} ${_getStatusText(order.status)}');
    
    if (order.trackingNumber != null) {
      buffer.writeln('Tracking #: ${order.trackingNumber}');
    }
    
    buffer.writeln('');
    buffer.writeln('*Timeline:*');
    
    if (order.confirmedAt != null) {
      buffer.writeln('✅ Confirmed - ${_formatDate(order.confirmedAt!)}');
    }
    if (order.shippedAt != null) {
      buffer.writeln('🚚 Shipped - ${_formatDate(order.shippedAt!)}');
    }
    if (order.deliveredAt != null) {
      buffer.writeln('📍 Delivered - ${_formatDate(order.deliveredAt!)}');
    }

    return buffer.toString();
  }

  static String _getStatusEmoji(OrderStatus status) {
    switch (status) {
      case OrderStatus.pending:
        return '⏳';
      case OrderStatus.confirmed:
        return '✅';
      case OrderStatus.processing:
        return '⚙️';
      case OrderStatus.shipped:
        return '🚚';
      case OrderStatus.delivered:
        return '📍';
      case OrderStatus.cancelled:
        return '❌';
      default:
        return '📦';
    }
  }

  static String _getStatusText(OrderStatus status) {
    switch (status) {
      case OrderStatus.pending:
        return 'Pending Confirmation';
      case OrderStatus.confirmed:
        return 'Confirmed';
      case OrderStatus.processing:
        return 'Processing';
      case OrderStatus.shipped:
        return 'Shipped';
      case OrderStatus.delivered:
        return 'Delivered';
      case OrderStatus.cancelled:
        return 'Cancelled';
      default:
        return 'Unknown';
    }
  }

  static String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute.toString().padLeft(2, '0')}';
  }
}