// // File: server/lib/src/services/genui/gen_ui_builder_enhanced.dart

// import 'package:serverpod/serverpod.dart';
// import '../../generated/protocol.dart';

// /// Enhanced GenUI Builder with Payment, Wallet, Escrow, and Error Handling
// class EnhancedGenUIBuilder {
//   final Session session;

//   EnhancedGenUIBuilder(this.session);

//   /// Build UI components from agent response with payment/wallet support
//   Future<List<UIComponent>> buildFromAgentResponse({
//     required Map<String, dynamic> agentResponse,
//     required String intent,
//     List<String>? functionsCalled,
//   }) async {
//     final components = <UIComponent>[];

//     // Handle wallet and payment tools
//     if (functionsCalled != null && functionsCalled.isNotEmpty) {
//       for (var toolName in functionsCalled) {
//         final toolComponents = await _buildToolComponents(
//           toolName: toolName,
//           agentResponse: agentResponse,
//           intent: intent,
//         );
//         components.addAll(toolComponents);
//       }
//     }

//     // Add text response if present
//     if (agentResponse['response'] != null) {
//       // Text is handled separately by GenUIMessage.text field
//     }

//     return components;
//   }

//   /// Build components based on tool execution
//   Future<List<UIComponent>> _buildToolComponents({
//     required String toolName,
//     required Map<String, dynamic> agentResponse,
//     required String intent,
//   }) async {
//     switch (toolName) {
//       // ==================== WALLET TOOLS ====================
//       case 'check_wallet_balance':
//         return [await _buildWalletCard(agentResponse)];

//       case 'request_withdrawal':
//         return [
//           await _buildWithdrawalConfirmation(agentResponse),
//           _buildQuickActions(['View Wallet', 'Check Status'])
//         ];

//       // ==================== PAYMENT TOOLS ====================
//       case 'check_order_escrow':
//         return [await _buildEscrowStatusCard(agentResponse)];

//       case 'confirm_delivery':
//         return [
//           await _buildDeliveryConfirmation(agentResponse),
//           _buildQuickActions(['Track Order', 'Request Return'])
//         ];

//       case 'mark_delivered':
//         return [
//           await _buildDeliveryMarkedCard(agentResponse),
//           _buildQuickActions(['View Order', 'Contact Customer'])
//         ];

//       // ==================== PRODUCT TOOLS ====================
//       case 'search_products':
//       case 'list_vendor_products':
//         return [
//           await _buildProductList(agentResponse),
//           _buildProductFilters(intent)
//         ];

//       case 'get_product_details':
//         return [
//           await _buildProductCard(agentResponse, detailed: true),
//           _buildProductActions(agentResponse)
//         ];

//       // ==================== ORDER TOOLS ====================
//       case 'view_vendor_orders':
//       case 'view_order_history':
//       case 'get_recent_orders':
//         return [
//           await _buildOrderList(agentResponse),
//           _buildOrderFilters()
//         ];

//       case 'track_order':
//       case 'get_full_order_details':
//         return [
//           await _buildOrderCard(agentResponse, detailed: true),
//           await _buildOrderTimeline(agentResponse),
//           _buildOrderActions(agentResponse)
//         ];

//       // ==================== CART TOOLS ====================
//       case 'view_cart':
//         return [
//           await _buildCartView(agentResponse),
//           _buildCartActions()
//         ];

//       case 'add_to_cart':
//         return [
//           await _buildCartUpdateConfirmation(agentResponse),
//           _buildQuickActions(['View Cart', 'Continue Shopping', 'Checkout'])
//         ];

//       // ==================== ANALYTICS TOOLS ====================
//       case 'get_vendor_analytics':
//         return [
//           await _buildAnalyticsCard(agentResponse),
//           await _buildRevenueChart(agentResponse),
//           await _buildOrdersChart(agentResponse)
//         ];

//       case 'get_product_performance':
//         return [
//           await _buildProductPerformanceList(agentResponse),
//           await _buildPerformanceChart(agentResponse)
//         ];

//       default:
//         // Generic success/error handling
//         if (agentResponse['success'] == true) {
//           return [_buildSuccessCard(agentResponse)];
//         } else if (agentResponse['success'] == false) {
//           return [_buildErrorCard(agentResponse)];
//         }
//         return [];
//     }
//   }

//   // ==================== WALLET COMPONENTS ====================

//   Future<UIComponent> _buildWalletCard(Map<String, dynamic> response) async {
//     final walletData = response['wallet'] ?? response;
//     final summary = walletData['summary'] ?? walletData;

//     return UIComponent(
//       id: Uuid().v4obj(),
//       type: UIComponentType.wallet_card,
//       displayOrder: 0,
//       data: {
//         'available_balance': summary['available_balance'] ?? 0.0,
//         'pending_balance': summary['pending_balance'] ?? 0.0,
//         'processing_balance': summary['processing_balance'] ?? 0.0,
//         'total_earnings': summary['total_earnings'] ?? 0.0,
//         'total_withdrawn': summary['total_withdrawn'] ?? 0.0,
//         'currency': 'NGN',
//         'actions': [
//           {'label': 'Withdraw', 'action': 'request_withdrawal'},
//           {'label': 'History', 'action': 'view_transactions'},
//           {'label': 'Setup Bank', 'action': 'setup_bank'}
//         ]
//       },
//     );
//   }

//   Future<UIComponent> _buildWithdrawalConfirmation(
//       Map<String, dynamic> response) async {
//     if (!response['success']) {
//       return _buildErrorCard(response);
//     }

//     return UIComponent(
//       id: Uuid().v4obj(),
//       type: UIComponentType.summary_card,
//       displayOrder: 0,
//       data: {
//         'title': '✅ Withdrawal Requested',
//         'status': 'success',
//         'items': [
//           {
//             'label': 'Amount',
//             'value': '₦${response['amount']?.toStringAsFixed(2) ?? '0.00'}'
//           },
//           {
//             'label': 'Fee',
//             'value': '₦${response['fee']?.toStringAsFixed(2) ?? '0.00'}'
//           },
//           {
//             'label': 'You\'ll Receive',
//             'value':
//                 '₦${response['net_amount']?.toStringAsFixed(2) ?? '0.00'}',
//             'highlight': true
//           },
//           {'label': 'Request #', 'value': response['request_number'] ?? 'N/A'},
//           {'label': 'Status', 'value': 'Pending Processing'},
//         ],
//         'footer': 'Money will be sent within 24 hours'
//       },
//     );
//   }

//   // ==================== ESCROW COMPONENTS ====================

//   Future<UIComponent> _buildEscrowStatusCard(
//       Map<String, dynamic> response) async {
//     final escrow = response['escrow'] ?? {};

//     String statusIcon;
//     String statusText;
//     switch (escrow['status'] ?? 'unknown') {
//       case 'held':
//         statusIcon = '🔒';
//         statusText = 'In Escrow';
//         break;
//       case 'released':
//         statusIcon = '✅';
//         statusText = 'Released';
//         break;
//       case 'refunded':
//         statusIcon = '💸';
//         statusText = 'Refunded';
//         break;
//       default:
//         statusIcon = '❓';
//         statusText = 'Unknown';
//     }

//     final items = <Map<String, dynamic>>[
//       {'label': 'Status', 'value': statusText, 'icon': statusIcon},
//       {
//         'label': 'Amount',
//         'value': '₦${escrow['vendor_earnings']?.toStringAsFixed(2) ?? '0.00'}'
//       },
//     ];

//     if (escrow['return_window_active'] == true) {
//       final daysLeft = _calculateDaysLeft(escrow['return_window_end']);
//       items.add({
//         'label': 'Return Window',
//         'value': '$daysLeft days left',
//         'highlight': true
//       });
//     }

//     if (escrow['customer_acknowledged'] == true) {
//       items.add({'label': 'Customer Confirmed', 'value': '✅ Yes'});
//     }

//     return UIComponent(
//       id: Uuid().v4obj(),
//       type: UIComponentType.summary_card,
//       displayOrder: 0,
//       data: {
//         'title': 'Payment Protection',
//         'items': items,
//         'footer': escrow['return_window_active'] == true
//             ? 'Customer has ${_calculateDaysLeft(escrow['return_window_end'])} days to request return'
//             : null
//       },
//     );
//   }

//   Future<UIComponent> _buildDeliveryConfirmation(
//       Map<String, dynamic> response) async {
//     if (!response['success']) {
//       return _buildErrorCard(response);
//     }

//     return UIComponent(
//       id: Uuid().v4obj(),
//       type: UIComponentType.summary_card,
//       displayOrder: 0,
//       data: {
//         'title': '✅ Delivery Confirmed',
//         'status': 'success',
//         'items': [
//           {'label': 'Order', 'value': response['order_number'] ?? 'N/A'},
//           {
//             'label': 'Status',
//             'value': 'Thank you for confirming delivery!',
//             'highlight': true
//           },
//         ],
//         'footer':
//             'You have 2 days to request a return if there are any issues.'
//       },
//     );
//   }

//   Future<UIComponent> _buildDeliveryMarkedCard(
//       Map<String, dynamic> response) async {
//     if (!response['success']) {
//       return _buildErrorCard(response);
//     }

//     return UIComponent(
//       id: Uuid().v4obj(),
//       type: UIComponentType.summary_card,
//       displayOrder: 0,
//       data: {
//         'title': '✅ Marked as Delivered',
//         'status': 'success',
//         'items': [
//           {'label': 'Order', 'value': response['order_number'] ?? 'N/A'},
//           {
//             'label': 'Return Window',
//             'value': 'Started (2 days)',
//             'highlight': true
//           },
//         ],
//         'footer':
//             'Customer will be notified. If they confirm, funds release faster.'
//       },
//     );
//   }

//   // ==================== PRODUCT COMPONENTS ====================

//   Future<UIComponent> _buildProductList(Map<String, dynamic> response) async {
//     final products = (response['products'] as List?) ?? [];

//     return UIComponent(
//       id: Uuid().v4obj(),
//       type: UIComponentType.product_list,
//       displayOrder: 0,
//       data: {
//         'products': products.map((p) {
//           return {
//             'id': p['id'],
//             'name': p['name'],
//             'price': p['price'] ?? p['base_price'],
//             'currency': p['currency'] ?? 'NGN',
//             'image': p['image'] ?? p['thumbnail_url'],
//             'stock': p['quantity'] ?? p['stock'],
//             'rating': p['rating'] ?? p['average_rating'],
//             'in_stock': (p['quantity'] ?? p['stock'] ?? 0) > 0,
//           };
//         }).toList(),
//         'layout': 'grid',
//       },
//     );
//   }

//   Future<UIComponent> _buildProductCard(Map<String, dynamic> response,
//       {bool detailed = false}) async {
//     final product = response['product'] ?? response;

//     return UIComponent(
//       id: Uuid().v4obj(),
//       type: UIComponentType.product_card,
//       displayOrder: 0,
//       data: {
//         'id': product['id'],
//         'name': product['name'],
//         'description':
//             detailed ? product['description'] : product['short_description'],
//         'price': product['price'] ?? product['base_price'],
//         'discount_price': product['discount_price'],
//         'currency': product['currency'] ?? 'NGN',
//         'images': product['images'] ?? [product['image']],
//         'stock': product['quantity'] ?? product['stock'],
//         'rating': product['rating'] ?? product['average_rating'],
//         'reviews_count': product['reviews'] ?? product['total_reviews'],
//         'brand': product['brand'],
//         'colors': product['colors'] ?? product['color'],
//         'sizes': product['sizes'] ?? product['size'],
//         'in_stock': (product['quantity'] ?? product['stock'] ?? 0) > 0,
//         if (detailed) ...{
//           'shipping_cost': product['shipping_cost'],
//           'free_shipping': product['free_shipping'],
//           'estimated_delivery': product['estimated_delivery_days'],
//         }
//       },
//     );
//   }

//   UIComponent _buildProductFilters(String intent) {
//     final filters = <Map<String, dynamic>>[];

//     if (intent.contains('search') || intent.contains('product')) {
//       filters.addAll([
//         {
//           'type': 'dropdown',
//           'label': 'Category',
//           'options': [
//             'All',
//             'Electronics',
//             'Fashion',
//             'Home',
//             'Beauty',
//             'Sports'
//           ]
//         },
//         {
//           'type': 'range',
//           'label': 'Price Range',
//           'min': 0,
//           'max': 100000,
//           'step': 1000
//         },
//         {
//           'type': 'toggle',
//           'label': 'In Stock Only',
//           'default': true
//         },
//       ]);
//     }

//     return UIComponent(
//       id: Uuid().v4obj(),
//       type: UIComponentType.filter_form,
//       displayOrder: 1,
//       data: {'filters': filters},
//     );
//   }

//   UIComponent _buildProductActions(Map<String, dynamic> response) {
//     final product = response['product'] ?? response;
//     final inStock = (product['quantity'] ?? product['stock'] ?? 0) > 0;

//     return UIComponent(
//       id: Uuid().v4obj(),
//       type: UIComponentType.action_buttons,
//       displayOrder: 2,
//       data: {
//         'buttons': [
//           if (inStock) ...[
//             {
//               'label': '🛒 Add to Cart',
//               'action': 'add_to_cart',
//               'style': 'primary',
//               'data': {'product_id': product['id']}
//             },
//             {
//               'label': '💳 Buy Now',
//               'action': 'buy_now',
//               'style': 'secondary',
//               'data': {'product_id': product['id']}
//             },
//           ] else
//             {
//               'label': '🔔 Notify When Available',
//               'action': 'notify_stock',
//               'style': 'outline',
//               'data': {'product_id': product['id']}
//             },
//           {
//             'label': '❤️ Add to Wishlist',
//             'action': 'add_to_wishlist',
//             'style': 'outline',
//             'data': {'product_id': product['id']}
//           },
//         ]
//       },
//     );
//   }

//   // ==================== ORDER COMPONENTS ====================

//   Future<UIComponent> _buildOrderList(Map<String, dynamic> response) async {
//     final orders = (response['orders'] as List?) ?? [];

//     return UIComponent(
//       id: Uuid().v4obj(),
//       type: UIComponentType.order_list,
//       displayOrder: 0,
//       data: {
//         'orders': orders.map((order) {
//           return {
//             'id': order['order_id'] ?? order['id'],
//             'order_number': order['order_number'],
//             'status': order['status'],
//             'total': order['total_amount'] ?? order['total'],
//             'currency': order['currency'] ?? 'NGN',
//             'date': order['created_at'] ?? order['date'],
//             'customer_name': order['customer_name'],
//             'items_count': order['items_count'] ?? 1,
//           };
//         }).toList(),
//       },
//     );
//   }

//   Future<UIComponent> _buildOrderCard(Map<String, dynamic> response,
//       {bool detailed = false}) async {
//     final order = response['order'] ?? response;
//     final items = detailed ? (order['items'] as List?) : null;

//     return UIComponent(
//       id: Uuid().v4obj(),
//       type: UIComponentType.order_card,
//       displayOrder: 0,
//       data: {
//         'order_number': order['order_number'],
//         'status': order['status'],
//         'total': order['total_amount'] ?? order['total'],
//         'currency': order['currency'] ?? 'NGN',
//         'date': order['created_at'] ?? order['date'],
//         if (detailed) ...{
//           'customer': order['customer'] ?? {},
//           'items': items?.map((item) {
//             return {
//               'name': item['product_name'] ?? item['name'],
//               'quantity': item['quantity'],
//               'price': item['unit_price'] ?? item['price'],
//               'total': item['total_amount'] ?? item['total'],
//             };
//           }).toList(),
//           'payment': order['payment'] ?? {},
//           'delivery': order['delivery'] ?? {},
//           'amounts': order['amounts'] ?? {},
//         }
//       },
//     );
//   }

//   Future<UIComponent> _buildOrderTimeline(Map<String, dynamic> response) async {
//     final order = response['order'] ?? response;
//     final dates = order['dates'] ?? {};

//     final events = <Map<String, dynamic>>[];

//     if (dates['created'] != null) {
//       events.add({
//         'title': 'Order Placed',
//         'timestamp': dates['created'],
//         'status': 'completed',
//         'icon': '📝'
//       });
//     }

//     if (dates['confirmed'] != null) {
//       events.add({
//         'title': 'Confirmed by Vendor',
//         'timestamp': dates['confirmed'],
//         'status': 'completed',
//         'icon': '✅'
//       });
//     }

//     if (dates['shipped'] != null) {
//       events.add({
//         'title': 'Shipped',
//         'timestamp': dates['shipped'],
//         'status': 'completed',
//         'icon': '🚚'
//       });
//     }

//     if (dates['delivered'] != null) {
//       events.add({
//         'title': 'Delivered',
//         'timestamp': dates['delivered'],
//         'status': 'completed',
//         'icon': '📦'
//       });
//     } else if (order['status'] != 'cancelled') {
//       events.add({
//         'title': 'Out for Delivery',
//         'timestamp': null,
//         'status': 'pending',
//         'icon': '🚗'
//       });
//     }

//     return UIComponent(
//       id: Uuid().v4obj(),
//       type: UIComponentType.order_timeline,
//       displayOrder: 1,
//       data: {'events': events},
//     );
//   }

//   UIComponent _buildOrderFilters() {
//     return UIComponent(
//       id: Uuid().v4obj(),
//       type: UIComponentType.filter_form,
//       displayOrder: 1,
//       data: {
//         'filters': [
//           {
//             'type': 'chips',
//             'label': 'Status',
//             'options': [
//               'All',
//               'Pending',
//               'Confirmed',
//               'Shipped',
//               'Delivered',
//               'Cancelled'
//             ]
//           },
//           {
//             'type': 'date_range',
//             'label': 'Date Range',
//           },
//         ]
//       },
//     );
//   }

//   UIComponent _buildOrderActions(Map<String, dynamic> response) {
//     final order = response['order'] ?? response;
//     final status = order['status'] ?? '';
//     final isVendor = response['user_type'] == 'vendor';

//     final buttons = <Map<String, dynamic>>[];

//     if (isVendor) {
//       if (status == 'pending') {
//         buttons.add({
//           'label': '✅ Confirm Order',
//           'action': 'confirm_order',
//           'style': 'primary',
//           'data': {'order_number': order['order_number']}
//         });
//       }
//       if (status == 'confirmed' || status == 'processing') {
//         buttons.add({
//           'label': '📦 Mark as Shipped',
//           'action': 'ship_order',
//           'style': 'primary',
//           'data': {'order_number': order['order_number']}
//         });
//       }
//       if (status == 'shipped') {
//         buttons.add({
//           'label': '✅ Mark as Delivered',
//           'action': 'mark_delivered',
//           'style': 'primary',
//           'data': {'order_number': order['order_number']}
//         });
//       }
//       buttons.add({
//         'label': '💬 Contact Customer',
//         'action': 'contact_customer',
//         'style': 'outline',
//         'data': {'order_number': order['order_number']}
//       });
//     } else {
//       // Customer actions
//       if (status == 'delivered') {
//         buttons.addAll([
//           {
//             'label': '✅ Confirm Received',
//             'action': 'confirm_delivery',
//             'style': 'primary',
//             'data': {'order_number': order['order_number']}
//           },
//           {
//             'label': '🔄 Request Return',
//             'action': 'request_return',
//             'style': 'outline',
//             'data': {'order_number': order['order_number']}
//           },
//         ]);
//       }

//       if (status == 'pending' || status == 'confirmed') {
//         buttons.add({
//           'label': '❌ Cancel Order',
//           'action': 'cancel_order',
//           'style': 'danger',
//           'data': {'order_number': order['order_number']}
//         });
//       }

//       buttons.add({
//         'label': '💬 Contact Vendor',
//         'action': 'contact_vendor',
//         'style': 'outline',
//         'data': {'order_number': order['order_number']}
//       });
//     }

//     return UIComponent(
//       id: Uuid().v4obj(),
//       type: UIComponentType.action_buttons,
//       displayOrder: 2,
//       data: {'buttons': buttons},
//     );
//   }

//   // ==================== CART COMPONENTS ====================

//   Future<UIComponent> _buildCartView(Map<String, dynamic> response) async {
//     final items = (response['items'] as List?) ?? [];
//     final totalItems = response['total_items'] ?? 0;
//     final subtotal = (response['subtotal'] as num?)?.toDouble() ?? 0.0;

//     return UIComponent(
//       id: Uuid().v4obj(),
//       type: UIComponentType.cart_view,
//       displayOrder: 0,
//       data: {
//         'items': items.map((item) {
//           return {
//             'cart_item_id': item['cart_item_id'],
//             'product_id': item['product_id'],
//             'name': item['product_name'] ?? item['name'],
//             'quantity': item['quantity'],
//             'unit_price': item['unit_price'] ?? item['price'],
//             'subtotal': item['subtotal'],
//             'image': item['image'],
//           };
//         }).toList(),
//         'summary': {
//           'total_items': totalItems,
//           'subtotal': subtotal,
//           'currency': 'NGN',
//         }
//       },
//     );
//   }

//   Future<UIComponent> _buildCartUpdateConfirmation(
//       Map<String, dynamic> response) async {
//     final cartSummary = response['cart_summary'] ?? {};

//     return UIComponent(
//       id: Uuid().v4obj(),
//       type: UIComponentType.summary_card,
//       displayOrder: 0,
//       data: {
//         'title': '✅ Added to Cart',
//         'status': 'success',
//         'items': [
//           {
//             'label': 'Cart Items',
//             'value': '${cartSummary['total_items'] ?? 1}'
//           },
//           {
//             'label': 'Subtotal',
//             'value':
//                 '₦${(cartSummary['subtotal'] ?? 0.0).toStringAsFixed(2)}',
//             'highlight': true
//           },
//         ]
//       },
//     );
//   }

//   UIComponent _buildCartActions() {
//     return UIComponent(
//       id: Uuid().v4obj(),
//       type: UIComponentType.action_buttons,
//       displayOrder: 1,
//       data: {
//         'buttons': [
//           {
//             'label': '💳 Proceed to Checkout',
//             'action': 'checkout',
//             'style': 'primary'
//           },
//           {
//             'label': '🛍️ Continue Shopping',
//             'action': 'browse_products',
//             'style': 'outline'
//           },
//           {
//             'label': '🗑️ Clear Cart',
//             'action': 'clear_cart',
//             'style': 'danger'
//           },
//         ]
//       },
//     );
//   }

//   // ==================== ANALYTICS COMPONENTS ====================

//   Future<UIComponent> _buildAnalyticsCard(Map<String, dynamic> response) async {
//     final analytics = response['analytics'] ?? {};
//     final today = analytics['today'] ?? {};
//     final thisWeek = analytics['this_week'] ?? {};
//     final totals = analytics['totals'] ?? {};

//     return UIComponent(
//       id: Uuid().v4obj(),
//       type: UIComponentType.analytics_card,
//       displayOrder: 0,
//       data: {
//         'title': 'Business Dashboard',
//         'metrics': [
//           {
//             'label': "Today's Revenue",
//             'value': '₦${(today['revenue'] ?? 0.0).toStringAsFixed(2)}',
//             'icon': '💰',
//             'trend': '+12%'
//           },
//           {
//             'label': "Today's Orders",
//             'value': '${today['orders'] ?? 0}',
//             'icon': '📦'
//           },
//           {
//             'label': 'This Week',
//             'value': '₦${(thisWeek['revenue'] ?? 0.0).toStringAsFixed(2)}',
//             'icon': '📈'
//           },
//           {
//             'label': 'Total Products',
//             'value': '${totals['total_products'] ?? 0}',
//             'icon': '🏪'
//           },
//           {
//             'label': 'Rating',
//             'value':
//                 '${(totals['average_rating'] ?? 0.0).toStringAsFixed(1)} ⭐',
//             'icon': '⭐'
//           },
//         ]
//       },
//     );
//   }

//   Future<UIComponent> _buildRevenueChart(Map<String, dynamic> response) async {
//     // Mock data - in production, extract from response
//     return UIComponent(
//       id: Uuid().v4obj(),
//       type: UIComponentType.line_chart,
//       displayOrder: 1,
//       data: {
//         'title': 'Revenue Trend (7 Days)',
//         'x_axis': ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
//         'datasets': [
//           {
//             'label': 'Revenue',
//             'data': [12000, 15000, 11000, 18000, 22000, 19000, 25000],
//             'color': '#4CAF50'
//           }
//         ],
//         'currency': 'NGN'
//       },
//     );
//   }

//   Future<UIComponent> _buildOrdersChart(Map<String, dynamic> response) async {
//     return UIComponent(
//       id: Uuid().v4obj(),
//       type: UIComponentType.bar_chart,
//       displayOrder: 2,
//       data: {
//         'title': 'Orders This Week',
//         'x_axis': ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
//         'datasets': [
//           {
//             'label': 'Orders',
//             'data': [12, 18, 15, 22, 28, 25, 32],
//             'color': '#2196F3'
//           }
//         ]
//       },
//     );
//   }

//   Future<UIComponent> _buildProductPerformanceList(
//       Map<String, dynamic> response) async {
//     final products = (response['products'] as List?) ?? [];

//     return UIComponent(
//       id: Uuid().v4obj(),
//       type: UIComponentType.product_list,
//       displayOrder: 0,
//       data: {
//         'title': 'Top Performing Products',
//         'products': products.map((p) {
//           return {
//             'id': p['id'],
//             'name': p['name'],
//             'metrics': {
//               'sales': p['orders'] ?? 0,
//               'views': p['views'] ?? 0,
//               'revenue': p['revenue'] ?? 0.0,
//               'conversion_rate': p['conversion_rate'] ?? 0.0,
//             }
//           };
//         }).toList(),
//         'layout': 'list',
//       },
//     );
//   }

//   Future<UIComponent> _buildPerformanceChart(
//       Map<String, dynamic> response) async {
//     final products = (response['products'] as List?) ?? [];

//     return UIComponent(
//       id: Uuid().v4obj(),
//       type: UIComponentType.bar_chart,
//       displayOrder: 1,
//       data: {
//         'title': 'Sales by Product',
//         'x_axis': products.map((p) => p['name']).take(5).toList(),
//         'datasets': [
//           {
//             'label': 'Sales',
//             'data': products.map((p) => p['orders'] ?? 0).take(5).toList(),
//             'color': '#FF9800'
//           }
//         ]
//       },
//     );
//   }

//   // ==================== ERROR & SUCCESS COMPONENTS ====================

//   UIComponent _buildErrorCard(Map<String, dynamic> response) {
//     return UIComponent(
//       id: Uuid().v4obj(),
//       type: UIComponentType.error_card,
//       displayOrder: 0,
//       data: {
//         'title': '❌ Error',
//         'message': response['error'] ?? response['message'] ?? 'An error occurred',
//         'error_code': response['error_code'],
//         'actions': response['upgrade_url'] != null
//             ? [
//                 {
//                   'label': 'Upgrade Plan',
//                   'action': 'upgrade',
//                   'url': response['upgrade_url']
//                 }
//               ]
//             : null
//       },
//     );
//   }

//   UIComponent _buildSuccessCard(Map<String, dynamic> response) {
//     return UIComponent(
//       id: Uuid().v4obj(),
//       type: UIComponentType.summary_card,
//       displayOrder: 0,
//       data: {
//         'title': '✅ Success',
//         'status': 'success',
//         'message': response['message'] ?? 'Operation completed successfully'
//       },
//     );
//   }

//   UIComponent _buildLoadingSkeleton() {
//     return UIComponent(
//       id: Uuid().v4obj(),
//       type: UIComponentType.loading_skeleton,
//       displayOrder: 0,
//       data: {'type': 'list', 'count': 3},
//     );
//   }

//   UIComponent _buildEmptyState(String message) {
//     return UIComponent(
//       id: Uuid().v4obj(),
//       type: UIComponentType.empty_state,
//       displayOrder: 0,
//       data: {
//         'icon': '📭',
//         'title': 'Nothing Here Yet',
//         'message': message,
//       },
//     );
//   }

//   // ==================== QUICK ACTIONS ====================

//   UIComponent _buildQuickActions(List<String> actions) {
//     return UIComponent(
//       id: Uuid().v4obj(),
//       type: UIComponentType.quick_actions,
//       displayOrder: 99,
//       data: {
//         'actions': actions.map((action) {
//           return {
//             'label': action,
//             'action': action.toLowerCase().replaceAll(' ', '_')
//           };
//         }).toList()
//       },
//     );
//   }

//   // ==================== HELPERS ====================

//   int _calculateDaysLeft(String? dateString) {
//     if (dateString == null) return 0;
//     try {
//       final endDate = DateTime.parse(dateString);
//       final now = DateTime.now();
//       return endDate.difference(now).inDays;
//     } catch (e) {
//       return 0;
//     }
//   }
// }