// File: server/lib/src/services/ai_services/config/command_registry.dart

import 'package:serverpod/serverpod.dart' hide Order;
import '../../../endpoints/analytics_endpoint.dart';
import '../../../endpoints/cart_endpoint.dart';
import '../../../endpoints/order_endpoint.dart';
import '../../../endpoints/product_endpoint.dart';
import '../../../endpoints/subscription_endpoint.dart';
import '../../../endpoints/auth_endpoint.dart';
import '../../../generated/protocol.dart';
import '../../messaging/whatsapp/whatsapp_message_formatter.dart';
import '../core/command_processor.dart';

void registerAllCommands(CommandProcessor processor) {
  // ========== UNIVERSAL COMMANDS (ALL USERS) ==========

  processor.registerCommand('help', (args, context) async {
    final userType = context.userType;

    if (userType == 'customer') {
      return {
        'success': true,
        'response': '''
🤖 **Asami - Your Shopping Assistant**

**Shopping Commands:**
/products - Search and browse products
/cart - View your shopping cart
/orders - View your order history
/track [order_number] - Track specific order
/capabilities - Know what I can do

**Account Commands:**
/account - View account settings
/logout - Sign out from this platform
/help - Show this help message
/start - Main menu

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

**Customer Commands:**
/products - Browse all products (for shopping)
/cart - Your shopping cart
/orders - Your orders as a customer

**Vendor Commands:**
/myproducts - Manage your product catalog
/analytics - View business dashboard
/sales - Sales reports
/inventory - Stock management
/subscription - Check subscription details

**Universal Commands:**
/capabilities - Know what I can do
/account - Account settings
/logout - Sign out
/help - Show this help
/start - Main menu

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

  processor.registerCommand('account', (args, context) async {
    final session = context.session!;
    final user =
        await User.db.findById(session, UuidValue.fromString(context.userId));

    if (user == null) {
      return {
        'success': false,
        'error': 'User not found',
        'command': 'account',
      };
    }

    final buffer = StringBuffer();
    buffer.writeln('👤 **Your Account**\n');
    buffer.writeln('**Name:** ${user.firstName ?? ''} ${user.lastName ?? ''}');
    buffer.writeln('**Email:** ${user.email ?? 'Not set'}');
    buffer.writeln('**Phone:** ${user.phoneNumber}');
    buffer.writeln('**Type:** ${user.userType.name.toUpperCase()}');
    buffer.writeln('**Status:** ${user.status.name}');
    buffer.writeln('\n**Platform Status:**');
    buffer.writeln(
        'WhatsApp: ${user.whatsappAuthenticated ? '✅ Linked' : '❌ Not linked'}');
    buffer.writeln(
        'Telegram: ${user.telegramAuthenticated ? '✅ Linked' : '❌ Not linked'}');

    if (user.userType == UserType.vendor) {
      final vendor = await VendorProfile.db.findFirstRow(
        session,
        where: (t) => t.userId.equals(user.id),
      );

      if (vendor != null) {
        buffer.writeln('\n**Business:**');
        buffer.writeln('Name: ${vendor.businessName}');
        buffer.writeln(
            'Subscription: ${vendor.subscriptionTier.name.toUpperCase()}');
        buffer.writeln(
            'Products: ${vendor.currentProductCount}/${vendor.productLimit}');
      }
    }

    return {
      'success': true,
      'response': buffer.toString(),
      'command': 'account',
    };
  });

  processor.registerCommand('logout', (args, context) async {
    final session = context.session!;
    final platform = PlatformType.values.firstWhere(
      (p) => p.name == context.platform,
      orElse: () => PlatformType.whatsapp,
    );

    final result = await AuthEndpoint().logout(
      session,
      userId: context.userId,
      platform: platform,
    );

    if (result['success']) {
      return {
        'success': true,
        'response': '''
👋 You've been logged out from ${platform.name}.

To log back in, send me a message and choose "Login".

Your data is safe and you can access it from any platform by logging in with your email.
''',
        'command': 'logout',
      };
    }

    return {
      'success': false,
      'error': 'Logout failed',
      'command': 'logout',
    };
  });

  // ========== SHOPPING COMMANDS (ALL USERS INCLUDING VENDORS) ==========

  processor.registerCommand('products', (args, context) async {
    final session = context.session!;

    // Check if there's a search query
    final query = args.isNotEmpty ? args.join(' ') : null;

    if (query == null) {
      return {
        'success': true,
        'response': '''
🛍️ **Product Search**

What are you looking for? You can:
• Search by name: `/products red dress`
• Browse by category
• Or just describe what you want!

Try: "Show me affordable laptops" or "I need running shoes"
''',
        'command': 'products',
      };
    }

    // Search products
    final products = await ProductEndpoint().searchProducts(
      session,
      query: query,
      limit: 10,
    );

    if (products.isEmpty) {
      return {
        'success': true,
        'response': '''
🔍 No products found for "$query"

Try different keywords or browse by category.
''',
        'command': 'products',
      };
    }

    final formatted = WhatsAppMessageFormatter.formatProductList(products);

    return {
      'success': true,
      'response': formatted,
      'command': 'products',
      'metadata': {
        'product_count': products.length,
        'query': query,
      },
    };
  });

  processor.registerCommand('cart', (args, context) async {
    final session = context.session!;
    final cartData = await CartEndpoint().getCartWithItems(
      session,
      UuidValue.fromString(context.userId),
    );

    if (cartData == null || (cartData['items'] as List).isEmpty) {
      return {
        'success': true,
        'response': '''
🛒 Your cart is empty

Start shopping:
• /products - Browse products
• Or just tell me what you're looking for!
''',
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
          'response': '''
📦 You haven't placed any orders yet

Start shopping with /products
''',
          'command': 'orders',
        };
      }

      final buffer = StringBuffer();
      buffer.writeln('📦 **Your Recent Orders**\n');

      for (var order in orders) {
        buffer.writeln('**Order #${order.orderNumber}**');
        buffer.writeln('Status: ${_formatOrderStatus(order.status)}');
        buffer.writeln(
            'Total: ${order.currency} ${order.totalAmount.toStringAsFixed(2)}');
        buffer.writeln('Date: ${_formatDate(order.createdAt)}\n');
      }

      buffer.writeln('Use `/track [order_number]` to see details');

      return {
        'success': true,
        'response': buffer.toString(),
        'command': 'orders',
        'metadata': {'order_count': orders.length},
      };
    } else {
      // Vendor viewing their incoming orders
      final orders = await OrderEndpoint().getVendorOrders(
        session,
        vendorId: UuidValue.fromString(context.userId),
        limit: 10,
      );

      if (orders.isEmpty) {
        return {
          'success': true,
          'response': '''
📦 No orders yet

Keep promoting your products to get sales!
''',
          'command': 'orders',
        };
      }

      final buffer = StringBuffer();
      buffer.writeln('📦 **Incoming Orders** (${orders.length})\n');

      for (var order in orders) {
        buffer.writeln('**Order #${order.orderNumber}**');
        buffer.writeln('Customer: ${order.customerName}');
        buffer.writeln('Status: ${_formatOrderStatus(order.status)}');
        buffer.writeln(
            'Amount: ${order.currency} ${order.totalAmount.toStringAsFixed(2)}\n');
      }

      return {
        'success': true,
        'response': buffer.toString(),
        'command': 'orders',
        'metadata': {'order_count': orders.length},
      };
    }
  });

  processor.registerCommand('sales', (args, context) async {
    // Alias for analytics
    return await processor.processCommand(
          message: '/analytics',
          userType:
              UserType.values.firstWhere((e) => e.name == context.userType),
          platform:
              PlatformType.values.firstWhere((e) => e.name == context.platform),
          context: context,
        ) ??
        {'success': false, 'response': 'Failed to load analytics'};
  });

  processor.registerCommand('inventory', (args, context) async {
    final session = context.session!;

    if (context.userType != 'vendor') {
      return {
        'success': false,
        'response': 'This command is only available for vendors.',
        'command': 'inventory',
      };
    }

    final products = await ProductEndpoint().getVendorProducts(
      session,
      vendorId: UuidValue.fromString(context.userId),
      limit: 20,
    );

    if (products.isEmpty) {
      return {
        'success': true,
        'response':
            'You don\'t have any products yet. Add products to manage inventory.',
        'command': 'inventory',
      };
    }

    final buffer = StringBuffer();
    buffer.writeln('📦 *Inventory Status*\n');

    final lowStock =
        products.where((p) => p.quantity <= p.lowStockThreshold).toList();
    final outOfStock = products.where((p) => p.quantity == 0).toList();
    final inStock =
        products.where((p) => p.quantity > p.lowStockThreshold).toList();

    if (outOfStock.isNotEmpty) {
      buffer.writeln('❌ *Out of Stock (${outOfStock.length})*');
      for (var p in outOfStock.take(5)) {
        buffer.writeln('• ${p.name}');
      }
      buffer.writeln('');
    }

    if (lowStock.isNotEmpty) {
      buffer.writeln('⚠️ *Low Stock (${lowStock.length})*');
      for (var p in lowStock.take(5)) {
        buffer.writeln('• ${p.name}: ${p.quantity} left');
      }
      buffer.writeln('');
    }

    buffer.writeln('✅ *In Stock (${inStock.length})*');

    buffer.writeln(
        '\nTo update inventory, say: "Update stock for [product name]"');

    return {
      'success': true,
      'response': buffer.toString(),
      'command': 'inventory',
    };
  });

  processor.registerCommand('subscription', (args, context) async {
    final session = context.session!;

    if (context.userType != 'vendor') {
      return {
        'success': false,
        'response': 'This command is only available for vendors.',
        'command': 'subscription',
      };
    }

    final subscription = await SubscriptionEndpoint().getVendorSubscription(
      session,
      UuidValue.fromString(context.userId),
    );

    if (subscription == null) {
      return {
        'success': true,
        'response': '''
📱 *Your Subscription*

You're on the *FREEMIUM* tier

*Limits:*
• Products: 20 max
• AI Descriptions: 50/month
• Transaction Fee: 5%

*Want to upgrade?*
Type "upgrade" to see Pro and Pro Max options!
''',
        'command': 'subscription',
      };
    }

    final buffer = StringBuffer();
    buffer.writeln('📱 *Your Subscription*\n');
    buffer.writeln('Tier: *${subscription.tier.name.toUpperCase()}*');
    buffer.writeln('Status: ${subscription.status}');
    buffer.writeln(
        'Amount: ${subscription.currency} ${subscription.amount}/month');

    buffer.writeln('\n*Limits:*');
    buffer.writeln(
        'Products: ${subscription.productLimit == -1 ? 'Unlimited' : subscription.productLimit}');
    buffer.writeln(
        'AI Descriptions: ${subscription.aiDescriptionsLimit == -1 ? 'Unlimited' : subscription.aiDescriptionsLimit}');
    buffer.writeln(
        'Transaction Fee: ${(subscription.platformTransactionFee * 100).toStringAsFixed(1)}%');

    buffer.writeln('\n*Billing Period:*');
    buffer.writeln('Start: ${_formatDate(subscription.currentPeriodStart)}');
    buffer.writeln('End: ${_formatDate(subscription.currentPeriodEnd)}');

    return {
      'success': true,
      'response': buffer.toString(),
      'command': 'subscription',
    };
  });

  processor.registerCommand('track', (args, context) async {
    final session = context.session!;

    if (args.isEmpty) {
      return {
        'success': false,
        'response': 'Please provide an order number: `/track ORDER-12345`',
        'command': 'track',
      };
    }

    final orderNumber = args.join(' ');

    final order = await Order.db.findFirstRow(
      session,
      where: (t) => t.orderNumber.equals(orderNumber),
    );

    if (order == null) {
      return {
        'success': false,
        'response': '❌ Order not found: $orderNumber',
        'command': 'track',
      };
    }

    final response = WhatsAppMessageFormatter.formatOrderTracking(order);

    return {
      'success': true,
      'response': response,
      'command': 'track',
    };
  });

  // ========== VENDOR-ONLY COMMANDS ==========

  processor.registerCommand('myproducts', (args, context) async {
    final session = context.session!;
    final products = await ProductEndpoint().getVendorProducts(
      session,
      vendorId: UuidValue.fromString(context.userId),
      limit: 10,
    );

    if (products.isEmpty) {
      return {
        'success': true,
        'response': '''
📦 You haven't added any products yet

To add a product:
1. Send me a photo of your product
2. I'll generate a description using AI
3. Confirm and publish!

Or just say "I want to add a product"
''',
        'command': 'myproducts',
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
      'command': 'myproducts',
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
      buffer.writeln('Revenue: NGN ${today.totalRevenue.toStringAsFixed(2)}');
      buffer.writeln('Orders: ${today.totalOrders}');
    } else {
      buffer.writeln('Revenue: NGN 0.00');
      buffer.writeln('Orders: 0');
    }

    buffer.writeln('\n📈 **This Week**');
    buffer.writeln(
        'Revenue: NGN ${weekSummary['revenue']?.toStringAsFixed(2) ?? '0.00'}');
    buffer.writeln('Orders: ${weekSummary['orders'] ?? 0}');
    buffer.writeln(
        'Avg Order: NGN ${weekSummary['average_order_value']?.toStringAsFixed(2) ?? '0.00'}');

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

    buffer.writeln(
        '\n📱 **Subscription: ${vendor.subscriptionTier.name.toUpperCase()}**');

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
        'response': '''
📱 **Your Subscription**

You're on the **FREEMIUM** tier

**Limits:**
• Products: 20 max
• AI Descriptions: 50/month
• Transaction Fee: 5%

**Want to upgrade?**
Type "upgrade" to see Pro and Pro Max options!
''',
        'command': 'subscription',
      };
    }

    final buffer = StringBuffer();
    buffer.writeln('📱 **Your Subscription**\n');
    buffer.writeln('Tier: **${subscription.tier.name.toUpperCase()}**');
    buffer.writeln('Status: ${subscription.status}');
    buffer.writeln(
        'Amount: ${subscription.currency} ${subscription.amount}/month');

    buffer.writeln('\n**Limits:**');
    buffer.writeln(
        'Products: ${subscription.productLimit == -1 ? 'Unlimited' : subscription.productLimit}');
    buffer.writeln(
        'AI Descriptions: ${subscription.aiDescriptionsLimit == -1 ? 'Unlimited' : subscription.aiDescriptionsLimit}');
    buffer.writeln(
        'Transaction Fee: ${(subscription.platformTransactionFee * 100).toStringAsFixed(1)}%');

    buffer.writeln('\n**Billing Period:**');
    buffer.writeln('Start: ${_formatDate(subscription.currentPeriodStart)}');
    buffer.writeln('End: ${_formatDate(subscription.currentPeriodEnd)}');

    return {
      'success': true,
      'response': buffer.toString(),
      'command': 'subscription',
    };
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
