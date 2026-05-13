// File: server/lib/src/services/mobile/gen_ui_builder.dart

import 'dart:convert';
import 'package:serverpod/serverpod.dart' hide Order;
import '../../generated/protocol.dart';

/// Builds UI components from AI agent responses
class GenUIBuilder {
  
  /// Build UI components from agent response
  Future<List<Map<String, dynamic>>> buildFromAgentResponse({
    required Session session,
    required Map<String, dynamic> agentResponse,
    required UserType userType,
  }) async {
    final components = <Map<String, dynamic>>[];
    
    final intent = agentResponse['intent'] as String?;
    final functionsCalled = agentResponse['functions_called'] as List?;
    
    // Determine what UI components to build based on intent and functions
    if (functionsCalled != null && functionsCalled.isNotEmpty) {
      for (var function in functionsCalled) {
        final component = await _buildComponentForFunction(
          session: session,
          functionName: function,
          agentResponse: agentResponse,
          userType: userType,
        );
        
        if (component != null) {
          components.add(component);
        }
      }
    }
    
    // Add intent-based components
    if (intent != null) {
      final intentComponent = await _buildComponentForIntent(
        session: session,
        intent: intent,
        agentResponse: agentResponse,
        userType: userType,
      );
      
      if (intentComponent != null) {
        components.add(intentComponent);
      }
    }
    
    return components;
  }

  /// Build component for specific function call
  Future<Map<String, dynamic>?> _buildComponentForFunction({
    required Session session,
    required String functionName,
    required Map<String, dynamic> agentResponse,
    required UserType userType,
  }) async {
    switch (functionName) {
      // Product-related functions
      case 'list_vendor_products':
      case 'search_products':
        return _buildProductListComponent(agentResponse);
      
      case 'get_product_details':
        return _buildProductCardComponent(agentResponse);
      
      // Order-related functions
      case 'view_vendor_orders':
      case 'view_order_history':
      case 'get_recent_orders':
        return _buildOrderListComponent(agentResponse);
      
      case 'get_full_order_details':
      case 'track_order':
        return _buildOrderCardComponent(agentResponse);
      
      // Analytics functions
      case 'get_vendor_analytics':
        return _buildAnalyticsDashboard(agentResponse);
      
      case 'get_top_selling_products':
        return _buildTopProductsChart(agentResponse);
      
      // Cart functions
      case 'view_cart':
        return _buildCartComponent(agentResponse);
      
      default:
        return null;
    }
  }

  /// Build component for intent
  Future<Map<String, dynamic>?> _buildComponentForIntent({
    required Session session,
    required String intent,
    required Map<String, dynamic> agentResponse,
    required UserType userType,
  }) async {
    // Add quick actions based on intent
    if (intent.contains('product') && userType == UserType.vendor) {
      return _buildQuickActionsComponent([
        {'label': 'Add Product', 'action': 'add_product'},
        {'label': 'View All', 'action': 'list_products'},
        {'label': 'Low Stock', 'action': 'low_stock_alert'},
      ]);
    }
    
    if (intent.contains('order')) {
      return _buildQuickActionsComponent([
        {'label': 'View Orders', 'action': 'view_orders'},
        {'label': 'Pending', 'action': 'pending_orders'},
        {'label': 'Track Order', 'action': 'track_order'},
      ]);
    }
    
    return null;
  }

  // ========== Component Builders ==========

  Map<String, dynamic> _buildProductListComponent(Map<String, dynamic> response) {
    final products = response['products'] as List?;
    if (products == null || products.isEmpty) return {};

    return {
      'type': 'product_list',
      'data': {
        'products': products.map((p) => {
          'id': p['id'],
          'name': p['name'],
          'price': p['price'],
          'currency': p.containsKey('currency') ? p['currency'] : 'NGN',
          'image': p.containsKey('image') ? p['image'] : null,
          'stock': p.containsKey('quantity') ? p['quantity'] : 0,
          'status': p.containsKey('status') ? p['status'] : 'active',
        }).toList(),
        'display_mode': 'grid', // or 'list'
        'show_actions': true,
      },
      'display_order': 0,
    };
  }

  Map<String, dynamic> _buildProductCardComponent(Map<String, dynamic> response) {
    final product = response['product'] as Map<String, dynamic>?;
    if (product == null) return {};

    return {
      'type': 'product_card',
      'data': {
        'id': product['id'],
        'name': product['name'],
        'description': product['description'],
        'price': product['price'],
        'currency': product['currency'] ?? 'NGN',
        'images': product['images'] ?? [],
        'stock': product['quantity_available'] ?? 0,
        'rating': product['rating'] ?? 0.0,
        'reviews': product['reviews'] ?? 0,
        'actions': [
          {'label': 'Edit', 'action': 'edit_product', 'id': product['id']},
          {'label': 'View Stats', 'action': 'product_stats', 'id': product['id']},
        ],
      },
      'display_order': 0,
    };
  }

  Map<String, dynamic> _buildOrderListComponent(Map<String, dynamic> response) {
    final orders = response['orders'] as List?;
    if (orders == null || orders.isEmpty) return {};

    return {
      'type': 'order_list',
      'data': {
        'orders': orders.map((o) => {
          'order_number': o['order_number'],
          'customer_name': o.containsKey('customer_name') ? o['customer_name'] : 'Customer',
          'total': o['total_amount'] ?? o['total'],
          'currency': o['currency'] ?? 'NGN',
          'status': o['status'],
          'date': o['created_at'] ?? o['date'],
          'items_count': o.containsKey('items_count') ? o['items_count'] : 1,
        }).toList(),
        'show_filters': true,
        'filter_options': ['All', 'Pending', 'Shipped', 'Delivered'],
      },
      'display_order': 0,
    };
  }

  Map<String, dynamic> _buildOrderCardComponent(Map<String, dynamic> response) {
    final order = response['order'] as Map<String, dynamic>?;
    if (order == null) return {};

    return {
      'type': 'order_card',
      'data': {
        'order_number': order['order_number'],
        'customer': order.containsKey('customer') ? order['customer'] : null,
        'status': order['status'],
        'total': order.containsKey('amounts') 
            ? order['amounts']['total'] 
            : order['total_amount'],
        'currency': order['currency'] ?? 'NGN',
        'items': order.containsKey('items') ? order['items'] : [],
        'timeline': _buildOrderTimeline(order),
        'actions': _buildOrderActions(order['status']),
      },
      'display_order': 0,
    };
  }

  Map<String, dynamic> _buildAnalyticsDashboard(Map<String, dynamic> response) {
    final analytics = response['analytics'] as Map<String, dynamic>?;
    if (analytics == null) return {};

    final today = analytics['today'] as Map<String, dynamic>?;
    final thisWeek = analytics['this_week'] as Map<String, dynamic>?;
    final totals = analytics['totals'] as Map<String, dynamic>?;

    return {
      'type': 'analytics_card',
      'data': {
        'metrics': [
          {
            'label': 'Today\'s Revenue',
            'value': today?['revenue'] ?? 0.0,
            'currency': 'NGN',
            'change': '+12%', // Can be calculated
            'trend': 'up',
          },
          {
            'label': 'Today\'s Orders',
            'value': today?['orders'] ?? 0,
            'change': '+5',
            'trend': 'up',
          },
          {
            'label': 'Week Revenue',
            'value': thisWeek?['revenue'] ?? 0.0,
            'currency': 'NGN',
          },
          {
            'label': 'Total Products',
            'value': totals?['total_products'] ?? 0,
          },
        ],
        'charts': [
          {
            'type': 'line',
            'title': 'Revenue Trend',
            'data': [], // Would need historical data
          },
        ],
      },
      'display_order': 0,
    };
  }

  Map<String, dynamic> _buildTopProductsChart(Map<String, dynamic> response) {
    final products = response['products'] as List?;
    if (products == null || products.isEmpty) return {};

    return {
      'type': 'bar_chart',
      'data': {
        'title': 'Top Selling Products',
        'items': products.take(10).map((p) => {
          'label': p['name'],
          'value': p['orders'] ?? 0,
          'secondary_value': p['revenue'] ?? 0.0,
        }).toList(),
        'x_label': 'Products',
        'y_label': 'Orders',
      },
      'display_order': 0,
    };
  }

  Map<String, dynamic> _buildCartComponent(Map<String, dynamic> response) {
    final items = response['items'] as List?;
    final subtotal = response['subtotal'] as double?;

    return {
      'type': 'custom_widget',
      'widget_name': 'cart_view',
      'data': {
        'items': items?.map((item) => {
          'cart_item_id': item['cart_item_id'],
          'quantity': item['quantity'],
          'unit_price': item['unit_price'],
          'subtotal': item['subtotal'],
        }).toList() ?? [],
        'subtotal': subtotal ?? 0.0,
        'currency': 'NGN',
        'actions': [
          {'label': 'Checkout', 'action': 'checkout'},
          {'label': 'Clear Cart', 'action': 'clear_cart'},
        ],
      },
      'display_order': 0,
    };
  }

  Map<String, dynamic> _buildQuickActionsComponent(List<Map<String, String>> actions) {
    return {
      'type': 'quick_actions',
      'data': {
        'actions': actions,
      },
      'display_order': 99, // Show at bottom
    };
  }

  // ========== Helpers ==========

  List<Map<String, dynamic>> _buildOrderTimeline(Map<String, dynamic> order) {
    final dates = order.containsKey('dates') ? order['dates'] : order;
    final timeline = <Map<String, dynamic>>[];

    if (dates['created'] != null) {
      timeline.add({
        'status': 'created',
        'label': 'Order Placed',
        'timestamp': dates['created'],
        'completed': true,
      });
    }

    if (dates['confirmed'] != null) {
      timeline.add({
        'status': 'confirmed',
        'label': 'Confirmed',
        'timestamp': dates['confirmed'],
        'completed': true,
      });
    }

    if (dates['shipped'] != null) {
      timeline.add({
        'status': 'shipped',
        'label': 'Shipped',
        'timestamp': dates['shipped'],
        'completed': true,
      });
    }

    if (dates['delivered'] != null) {
      timeline.add({
        'status': 'delivered',
        'label': 'Delivered',
        'timestamp': dates['delivered'],
        'completed': true,
      });
    }

    return timeline;
  }

  List<Map<String, String>> _buildOrderActions(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return [
          {'label': 'Confirm', 'action': 'confirm_order'},
          {'label': 'Cancel', 'action': 'cancel_order'},
        ];
      case 'confirmed':
        return [
          {'label': 'Mark Shipped', 'action': 'ship_order'},
          {'label': 'Cancel', 'action': 'cancel_order'},
        ];
      case 'shipped':
        return [
          {'label': 'Mark Delivered', 'action': 'mark_delivered'},
        ];
      default:
        return [];
    }
  }
}