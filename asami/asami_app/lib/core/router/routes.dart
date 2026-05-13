// ============================================================================
// ROUTES CONSTANTS - All route paths for the application
// ============================================================================

class AppRoutes {
  AppRoutes._(); // Private constructor to prevent instantiation

  // ═══════════════════════════════════════════════════════════
  // AUTHENTICATION ROUTES (Shared)
  // ═══════════════════════════════════════════════════════════
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String verification = '/verification';
  static const String forgotPassword = '/forgot-password';
  static const String resetPassword = '/reset-password';
}

// ═══════════════════════════════════════════════════════════
// VENDOR ROUTES
// ═══════════════════════════════════════════════════════════
class VendorRoutes {
  VendorRoutes._();

  // Main Navigation (Bottom Nav)
  static const String home = '/vendor/home';              // Dashboard
  static const String aiChat = '/vendor/chat';            // AI Assistant
  static const String products = '/vendor/products';      // Product Management
  static const String orders = '/vendor/orders';          // Order Management
  static const String profile = '/vendor/profile';        // Settings & Profile

  // Products Sub-routes
  static const String addProduct = '/vendor/products/add';
  static String editProduct(String id) => '/vendor/products/edit/$id';
  static String productDetail(String id) => '/vendor/products/$id';

  // Orders Sub-routes
  static String orderDetail(String id) => '/vendor/orders/$id';
  static String orderTracking(String id) => '/vendor/orders/$id/track';

  // Analytics
  static const String analytics = '/vendor/analytics';
  static const String salesReport = '/vendor/analytics/sales';
  static const String productPerformance = '/vendor/analytics/products';

  // Inventory
  static const String inventory = '/vendor/inventory';
  static const String stockAlerts = '/vendor/inventory/alerts';

  // Wallet
  static const String wallet = '/vendor/wallet';
  static const String withdrawal = '/vendor/wallet/withdraw';
  static const String transactions = '/vendor/wallet/transactions';
}

// ═══════════════════════════════════════════════════════════
// CUSTOMER/BUYER ROUTES
// ═══════════════════════════════════════════════════════════
class BuyerRoutes {
  BuyerRoutes._();

  // Main Navigation (Bottom Nav)
  static const String home = '/shop/home';              // Shopping Home
  static const String aiChat = '/shop/chat';            // AI Shopping Assistant
  static const String cart = '/shop/cart';              // Shopping Cart
  static const String orders = '/shop/orders';          // My Orders
  static const String profile = '/shop/profile';        // User Profile

  // Shop Sub-routes
  static const String search = '/shop/search';
  static String category(String id) => '/shop/category/$id';
  static String productDetail(String id) => '/shop/product/$id';

  // Cart Sub-routes
  static const String checkout = '/shop/cart/checkout';

  // Orders Sub-routes
  static String orderDetail(String id) => '/shop/orders/$id';
  static String trackOrder(String id) => '/shop/orders/$id/track';

  // Wishlist
  static const String wishlist = '/shop/wishlist';
}

// ═══════════════════════════════════════════════════════════
// ROUTE UTILITIES
// ═══════════════════════════════════════════════════════════
class RouteUtils {
  RouteUtils._();

  /// Check if a route is an authentication route
  static bool isAuthRoute(String route) {
    return route == AppRoutes.login ||
        route == AppRoutes.signup ||
        route.startsWith(AppRoutes.verification) ||
        route == AppRoutes.forgotPassword ||
        route == AppRoutes.resetPassword;
  }

  /// Check if a route is a vendor route
  static bool isVendorRoute(String route) {
    return route.startsWith('/vendor/');
  }

  /// Check if a route is a customer route
  static bool isCustomerRoute(String route) {
    return route.startsWith('/shop/');
  }

  /// Get the default route for a user type
  static String getDefaultRoute(String userType) {
    switch (userType.toLowerCase()) {
      case 'vendor':
        return VendorRoutes.home;
      case 'customer':
        return BuyerRoutes.home;
      default:
        return AppRoutes.login;
    }
  }
}