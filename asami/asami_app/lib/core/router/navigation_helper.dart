// ============================================================================
// NAVIGATION HELPERS - Bottom Nav Items & Navigation Utilities
// ============================================================================

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'routes.dart';

// ═══════════════════════════════════════════════════════════
// BOTTOM NAVIGATION ITEMS
// ═══════════════════════════════════════════════════════════

class VendorNavItems {
  static List<BottomNavigationBarItem> get items => [
        const BottomNavigationBarItem(
          icon: Icon(Icons.dashboard_outlined),
          activeIcon: Icon(Icons.dashboard),
          label: 'Home',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.inventory_2_outlined),
          activeIcon: Icon(Icons.inventory_2),
          label: 'Products',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.smart_toy_outlined),
          activeIcon: Icon(Icons.smart_toy),
          label: 'AI Assistant',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.receipt_long_outlined),
          activeIcon: Icon(Icons.receipt_long),
          label: 'Orders',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          activeIcon: Icon(Icons.person),
          label: 'Profile',
        ),
      ];

  static List<String> get routes => [
        VendorRoutes.home,
        VendorRoutes.products,
        VendorRoutes.aiChat,
        VendorRoutes.orders,
        VendorRoutes.profile,
      ];

  static int getIndexForRoute(String route) {
    if (route.startsWith('/vendor/products')) return 1;
    if (route.startsWith('/vendor/chat')) return 2;
    if (route.startsWith('/vendor/orders')) return 3;
    if (route.startsWith('/vendor/profile')) return 4;
    return 0; // Default to home
  }
}

class BuyerNavItems {
  static List<BottomNavigationBarItem> get items => [
        const BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home),
          label: 'Home',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_outlined),
          activeIcon: Icon(Icons.shopping_cart),
          label: 'Cart',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.smart_toy_outlined),
          activeIcon: Icon(Icons.smart_toy),
          label: 'AI Assistant',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.receipt_long_outlined),
          activeIcon: Icon(Icons.receipt_long),
          label: 'Orders',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          activeIcon: Icon(Icons.person),
          label: 'Profile',
        ),
      ];

  static List<String> get routes => [
        BuyerRoutes.home,
        BuyerRoutes.cart,
        BuyerRoutes.aiChat,
        BuyerRoutes.orders,
        BuyerRoutes.profile,
      ];

  static int getIndexForRoute(String route) {
    if (route.startsWith('/shop/cart')) return 1;
    if (route.startsWith('/shop/chat')) return 2;
    if (route.startsWith('/shop/orders')) return 3;
    if (route.startsWith('/shop/profile')) return 4;
    return 0; // Default to home
  }
}

// ═══════════════════════════════════════════════════════════
// DRAWER/MENU ITEMS
// ═══════════════════════════════════════════════════════════

class VendorDrawerItems {
  static List<DrawerItem> get items => [
        DrawerItem(
          icon: Icons.analytics_outlined,
          title: 'Analytics',
          route: VendorRoutes.analytics,
        ),
        DrawerItem(
          icon: Icons.inventory_outlined,
          title: 'Inventory',
          route: VendorRoutes.inventory,
        ),
        DrawerItem(
          icon: Icons.account_balance_wallet_outlined,
          title: 'Wallet',
          route: VendorRoutes.wallet,
        ),
        DrawerItem(
          icon: Icons.bar_chart,
          title: 'Sales Report',
          route: VendorRoutes.salesReport,
        ),
        DrawerItem(
          icon: Icons.notifications_outlined,
          title: 'Stock Alerts',
          route: VendorRoutes.stockAlerts,
        ),
      ];
}

class BuyerDrawerItems {
  static List<DrawerItem> get items => [
        DrawerItem(
          icon: Icons.favorite_outline,
          title: 'Wishlist',
          route: BuyerRoutes.wishlist,
        ),
        DrawerItem(
          icon: Icons.search,
          title: 'Search',
          route: BuyerRoutes.search,
        ),
      ];
}

class DrawerItem {
  final IconData icon;
  final String title;
  final String route;

  DrawerItem({
    required this.icon,
    required this.title,
    required this.route,
  });
}

// ═══════════════════════════════════════════════════════════
// NAVIGATION EXTENSIONS
// ═══════════════════════════════════════════════════════════

extension NavigationExtension on BuildContext {
  /// Navigate to vendor home
  void goToVendorHome() => go(VendorRoutes.home);

  /// Navigate to customer home
  void goToCustomerHome() => go(BuyerRoutes.home);

  /// Navigate to appropriate home based on user type
  void goToHome(String userType) {
    if (userType.toLowerCase() == 'vendor') {
      goToVendorHome();
    } else {
      goToCustomerHome();
    }
  }

  /// Navigate to product detail (vendor)
  void goToVendorProductDetail(String productId) {
    go(VendorRoutes.productDetail(productId));
  }

  /// Navigate to product detail (customer)
  void goToShopProductDetail(String productId) {
    go(BuyerRoutes.productDetail(productId));
  }

  /// Navigate to order detail
  void goToOrderDetail(String orderId, {bool isVendor = false}) {
    if (isVendor) {
      go(VendorRoutes.orderDetail(orderId));
    } else {
      go(BuyerRoutes.orderDetail(orderId));
    }
  }

  /// Navigate to chat with context
  void goToChat({bool isVendor = false}) {
    if (isVendor) {
      go(VendorRoutes.aiChat);
    } else {
      go(BuyerRoutes.aiChat);
    }
  }

  /// Navigate to cart (customer only)
  void goToCart() => go(BuyerRoutes.cart);

  /// Navigate to checkout
  void goToCheckout() => go(BuyerRoutes.checkout);

  /// Navigate to wishlist
  void goToWishlist() => go(BuyerRoutes.wishlist);

  /// Navigate to analytics (vendor only)
  void goToAnalytics() => go(VendorRoutes.analytics);

  /// Navigate to inventory (vendor only)
  void goToInventory() => go(VendorRoutes.inventory);

  /// Navigate to wallet (vendor only)
  void goToWallet() => go(VendorRoutes.wallet);
}

// ═══════════════════════════════════════════════════════════
// ROUTE NAME HELPERS
// ═══════════════════════════════════════════════════════════

class RouteNames {
  RouteNames._();

  // Auth
  static const String login = 'login';
  static const String signup = 'signup';
  static const String verification = 'verification';

  // Vendor
  static const String vendorHome = 'vendor_home';
  static const String vendorChat = 'vendor_chat';
  static const String products = 'products';
  static const String addProduct = 'add_product';
  static const String editProduct = 'edit_product';
  static const String productDetail = 'product_detail';
  static const String vendorOrders = 'vendor_orders';
  static const String vendorOrderDetail = 'vendor_order_detail';
  static const String vendorProfile = 'vendor_profile';
  static const String analytics = 'analytics';
  static const String salesReport = 'sales_report';
  static const String inventory = 'inventory';
  static const String wallet = 'wallet';

  // Customer
  static const String customerHome = 'customer_home';
  static const String customerChat = 'customer_chat';
  static const String shopProductDetail = 'shop_product_detail';
  static const String cart = 'cart';
  static const String checkout = 'checkout';
  static const String customerOrders = 'customer_orders';
  static const String customerOrderDetail = 'customer_order_detail';
  static const String wishlist = 'wishlist';
  static const String search = 'search';
  static const String category = 'category';
  static const String customerProfile = 'customer_profile';
}