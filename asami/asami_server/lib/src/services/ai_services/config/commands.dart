
import 'package:serverpod/serverpod.dart' hide Order;
import '../../../endpoints/analytics_endpoint.dart';
import '../../../endpoints/cart_endpoint.dart';
import '../../../endpoints/order_endpoint.dart';
import '../../../endpoints/product_endpoint.dart';
import '../../../endpoints/subscription_endpoint.dart';
import '../../../generated/protocol.dart';
import '../../messaging/whatsapp/whatsapp_message_formatter.dart';
import '../core/command_processor.dart';

void registerAllCommands(CommandProcessor processor) {
  // ========== CUSTOMER COMMANDS ==========
  
  processor.registerCommand('cart', (args, context) async {
    final session = context.session!;
    final cartData = await CartEndpoint().getCartWithItems(
      session,
      UuidValue.fromString(context.userId),
    );
    
    if (cartData == null || (cartData['items'] as List).isEmpty) {
      return {
        'success': true,
        'response': '🛒 Your cart is empty. Start shopping by searching for products!',
        'command': 'cart',
      };
    }

    final cart = cartData['cart'] as Cart;
    final items = cartData['items'] as List<CartItem>;
    
    final response = WhatsAppMessageFormatter.formatCartSummary(cart, items);
    
    return {
      'success': true,
      'response': response,
      'command': 'cart',
      'metadata': {
        'item_count': items.length,
        'subtotal': cart.subtotal,
      },
    };
  });

  processor.registerCommand('orders', (args, context) async {
    final session = context.session!;
    
    if (context.userType == 'customer') {
      final orders = await OrderEndpoint().getCustomerOrders(
        session,
        customerId: UuidValue.fromString(context.userId),
        limit: 5,
      );

      if (orders.isEmpty) {
        return {
          'success': true,
          'response': '📦 You haven\'t placed any orders yet. Start shopping!',
          'command': 'orders',
        };
      }

      final buffer = StringBuffer();
      buffer.writeln('📦 **Your Recent Orders**\n');
      
      for (var order in orders) {
        buffer.writeln('Order #${order.orderNumber}');
        buffer.writeln('Status: ${_formatOrderStatus(order.status)}');
        buffer.writeln('Total: ${order.currency} ${order.totalAmount.toStringAsFixed(2)}');
        buffer.writeln('Date: ${_formatDate(order.createdAt)}\n');
      }

      return {
        'success': true,
        'response': buffer.toString(),
        'command': 'orders',
        'metadata': {'order_count': orders.length},
      };
    } else {
      // Vendor orders
      final orders = await OrderEndpoint().getVendorOrders(
        session,
        vendorId: UuidValue.fromString(context.userId),
        limit: 10,
      );

      if (orders.isEmpty) {
        return {
          'success': true,
          'response': '📦 No orders yet. Keep promoting your products!',
          'command': 'orders',
        };
      }

      final buffer = StringBuffer();
      buffer.writeln('📦 **Incoming Orders** (${orders.length})\n');
      
      for (var order in orders) {
        buffer.writeln('Order #${order.orderNumber}');
        buffer.writeln('Customer: ${order.customerName}');
        buffer.writeln('Status: ${_formatOrderStatus(order.status)}');
        buffer.writeln('Amount: ${order.currency} ${order.totalAmount.toStringAsFixed(2)}\n');
      }

      return {
        'success': true,
        'response': buffer.toString(),
        'command': 'orders',
        'metadata': {'order_count': orders.length},
      };
    }
  });

  // ========== VENDOR COMMANDS ==========
  
  processor.registerCommand('products', (args, context) async {
    final session = context.session!;
    final products = await ProductEndpoint().getVendorProducts(
      session,
      vendorId: UuidValue.fromString(context.userId),
      limit: 10,
    );

    if (products.isEmpty) {
      return {
        'success': true,
        'response': '📦 You haven\'t added any products yet. Create your first product to start selling!',
        'command': 'products',
      };
    }

    final buffer = StringBuffer();
    buffer.writeln('📦 **Your Products** (${products.length})\n');
    
    for (var p in products) {
      buffer.writeln('• **${p.name}**');
      buffer.writeln('  Price: ${p.currency} ${p.basePrice}');
      buffer.writeln('  Status: ${p.status.name} | Stock: ${p.quantity}');
      buffer.writeln('  Views: ${p.viewCount} | Orders: ${p.orderCount}\n');
    }

    return {
      'success': true,
      'response': buffer.toString(),
      'command': 'products',
      'metadata': {'product_count': products.length},
    };
  });

  processor.registerCommand('analytics', (args, context) async {
    final session = context.session!;
    final dashboard = await AnalyticsEndpoint().getVendorDashboard(
      session,
      UuidValue.fromString(context.userId),
    );

    final vendor = dashboard['vendor'] as VendorProfile;
    final today = dashboard['today'] as VendorAnalytics?;
    final weekSummary = dashboard['week_summary'] as Map<String, dynamic>;
    final pendingOrders = dashboard['pending_orders_count'] as int;
    final lowStock = dashboard['low_stock_products'] as List<Product>;

    final buffer = StringBuffer();
    buffer.writeln('📊 **${vendor.businessName} Dashboard**\n');
    
    buffer.writeln('💰 **Today\'s Performance**');
    if (today != null) {
      buffer.writeln('Revenue: ${vendor.platformTransactionFee} ${today.totalRevenue.toStringAsFixed(2)}');
      buffer.writeln('Orders: ${today.totalOrders}');
    } else {
      buffer.writeln('Revenue: NGN 0.00');
      buffer.writeln('Orders: 0');
    }
    
    buffer.writeln('\n📈 **This Week**');
    buffer.writeln('Revenue: NGN ${weekSummary['revenue']?.toStringAsFixed(2) ?? '0.00'}');
    buffer.writeln('Orders: ${weekSummary['orders'] ?? 0}');
    buffer.writeln('Avg Order: NGN ${weekSummary['average_order_value']?.toStringAsFixed(2) ?? '0.00'}');
    
    buffer.writeln('\n🛒 **Quick Stats**');
    buffer.writeln('Pending Orders: $pendingOrders');
    buffer.writeln('Total Products: ${vendor.totalProducts}');
    buffer.writeln('Active Products: ${vendor.activeProducts}');
    
    if (lowStock.isNotEmpty) {
      buffer.writeln('\n⚠️ **Low Stock Alert**');
      for (var product in lowStock.take(3)) {
        buffer.writeln('• ${product.name}: ${product.quantity} left');
      }
    }

    buffer.writeln('\n📱 **Subscription: ${vendor.subscriptionTier.name.toUpperCase()}**');

    return {
      'success': true,
      'response': buffer.toString(),
      'command': 'analytics',
      'metadata': {
        'revenue_today': today?.totalRevenue ?? 0,
        'orders_today': today?.totalOrders ?? 0,
        'pending_orders': pendingOrders,
      },
    };
  });

  processor.registerCommand('subscription', (args, context) async {
    final session = context.session!;
    final subscription = await SubscriptionEndpoint().getVendorSubscription(
      session,
      UuidValue.fromString(context.userId),
    );

    if (subscription == null) {
      return {
        'success': true,
        'response': '📱 You\'re on the **FREEMIUM** tier. Upgrade anytime to unlock more features!',
        'command': 'subscription',
      };
    }

    final buffer = StringBuffer();
    buffer.writeln('📱 **Your Subscription**\n');
    buffer.writeln('Tier: **${subscription.tier.name.toUpperCase()}**');
    buffer.writeln('Status: ${subscription.status}');
    buffer.writeln('Amount: ${subscription.currency} ${subscription.amount}/month');
    
    buffer.writeln('\n**Limits:**');
    buffer.writeln('Products: ${subscription.productLimit == -1 ? 'Unlimited' : subscription.productLimit}');
    buffer.writeln('AI Descriptions: ${subscription.aiDescriptionsLimit == -1 ? 'Unlimited' : subscription.aiDescriptionsLimit}');
    buffer.writeln('Transaction Fee: ${(subscription.platformTransactionFee * 100).toStringAsFixed(1)}%');
    
    buffer.writeln('\n**Billing Period:**');
    buffer.writeln('Start: ${_formatDate(subscription.currentPeriodStart)}');
    buffer.writeln('End: ${_formatDate(subscription.currentPeriodEnd)}');

    return {
      'success': true,
      'response': buffer.toString(),
      'command': 'subscription',
    };
  });

  // ========== UNIVERSAL COMMANDS ==========
  
  processor.registerCommand('help', (args, context) async {
    final userType = context.userType;
    
    if (userType == 'customer') {
      return {
        'success': true,
        'response': '''
🤖 **Asami - Your Shopping Assistant**

**Available Commands:**
/cart - View your shopping cart
/orders - View your order history
/help - Show this help message
/start - Restart conversation

**Natural Language Examples:**
"Show me red dresses under 5000"
"What's in my cart?"
"Track my order #12345"
"Add this to cart"

Just chat naturally - I understand!
''',
        'command': 'help',
      };
    } else {
      return {
        'success': true,
        'response': '''
🤖 **Asami - Your Business Assistant**

**Available Commands:**
/products - List your products
/analytics - View dashboard
/orders - View incoming orders
/subscription - Check subscription
/help - Show this help message
/start - Restart conversation

**Natural Language Examples:**
"Show my sales this week"
"Create a new product listing"
"Update inventory for product X"
"What are my top sellers?"

I'm here to help grow your business!
''',
        'command': 'help',
      };
    }
  });

  processor.registerCommand('start', (args, context) async {
    final userType = context.userType;
    
    if (userType == 'customer') {
      return {
        'success': true,
        'response': '''
Welcome to Asami! 👋

I'm your personal shopping assistant. I can help you:
• 🔍 Find products you'll love
• 🛒 Manage your cart
• 📦 Track your orders
• ❓ Answer questions

What are you looking for today?
''',
        'command': 'start',
      };
    } else {
      return {
        'success': true,
        'response': '''
Welcome to Asami for Business! 👋

I'm your AI business assistant. I can help you:
• 📦 Manage products & inventory
• 📊 View sales analytics
• 🛍️ Process orders
• 💡 Grow your business

What would you like to do today?
''',
        'command': 'start',
      };
    }
  });

  processor.registerCommand('capabilities', (args, context) async {
    final userType = context.userType;
    
    if (userType == 'customer') {
      return {
        'success': true,
        'response': '''
🎯 **What I Can Do For You**

**Product Discovery:**
• Search across all vendors
• Filter by price, color, size, category
• Get personalized recommendations
• View detailed product info

**Shopping:**
• Add/remove items from cart
• View cart summary
• Complete checkout
• Save favorite items

**Order Management:**
• Place orders
• Track deliveries
• View order history
• Handle returns/refunds

**Support:**
• Answer product questions
• Help with payment issues
• Connect with vendors
• Provide shopping tips

Just ask me anything!
''',
        'command': 'capabilities',
      };
    } else {
      return {
        'success': true,
        'response': '''
🎯 **What I Can Do For Your Business**

**Product Management:**
• AI-powered product descriptions
• Bulk inventory updates
• Image-based cataloging
• Category management

**Sales & Analytics:**
• Real-time sales tracking
• Revenue reports
• Product performance
• Customer insights

**Order Processing:**
• View incoming orders
• Update order statuses
• Handle cancellations
• Process refunds

**Business Intelligence:**
• Identify trends
• Recommend pricing
• Suggest inventory levels
• Growth strategies

Let me help grow your business!
''',
        'command': 'capabilities',
      };
    }
  });
}

// Helper functions
String _formatOrderStatus(OrderStatus status) {
  final statusMap = {
    OrderStatus.pending: '⏳ Pending',
    OrderStatus.confirmed: '✅ Confirmed',
    OrderStatus.processing: '⚙️ Processing',
    OrderStatus.packed: '📦 Packed',
    OrderStatus.shipped: '🚚 Shipped',
    OrderStatus.out_for_delivery: '🛵 Out for Delivery',
    OrderStatus.delivered: '✅ Delivered',
    OrderStatus.cancelled: '❌ Cancelled',
    OrderStatus.refunded: '↩️ Refunded',
    OrderStatus.failed: '⚠️ Failed',
  };
  return statusMap[status] ?? status.name;
}

String _formatDate(DateTime date) {
  return '${date.day}/${date.month}/${date.year}';
}
