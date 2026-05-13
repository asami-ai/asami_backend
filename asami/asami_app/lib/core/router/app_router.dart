// ============================================================================
// REFACTORED APP ROUTER - StatefulShellRoute + Performance Optimized
// Location: lib/core/routes/app_router.dart
// ============================================================================

import 'dart:async';
import 'package:asami_app/features/profile/presentation/pages/profile_page.dart';
import 'package:asami_client/asami_client.dart';
import 'package:common_utils2/common_utils2.dart' hide User;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

// Auth
import 'package:asami_app/features/auth/presentation/pages/login_page.dart';
import 'package:asami_app/features/auth/presentation/pages/signup_page.dart';
import 'package:asami_app/features/auth/presentation/pages/verification_page.dart';
import 'package:asami_app/features/auth/presentation/cubit/auth_cubit.dart';

// Onboarding & Splash
import 'package:asami_app/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:asami_app/features/splash/presentation/pages/splash_page.dart';

// Shared
import 'package:asami_app/features/ai_chat/presentation/pages/chat_page.dart';

// Vendor features
import 'package:asami_app/features/vendors/presentation/pages/dashboard_page.dart';
import 'package:asami_app/features/vendors/products/presentation/pages/product_list_page.dart';
import 'package:asami_app/features/vendors/products/presentation/pages/add_products.dart';
import 'package:asami_app/features/vendors/products/presentation/pages/product_detail_page.dart';
import 'package:asami_app/features/vendors/products/presentation/pages/edit_product_page.dart';
import 'package:asami_app/features/vendors/orders/presentation/pages/order_list_page.dart';
import 'package:asami_app/features/vendors/orders/presentation/pages/order_detail_page.dart';
import 'package:asami_app/features/vendors/orders/presentation/pages/order_tracking_page.dart';
import 'package:asami_app/features/vendors/inventory/presentation/pages/inventory_page.dart';
import 'package:asami_app/features/vendors/inventory/presentation/pages/stock_alerts_page.dart';
import 'package:asami_app/features/vendors/wallet/presentation/pages/wallet_page.dart';
import 'package:asami_app/features/vendors/wallet/presentation/pages/withdrawal_page.dart';
import 'package:asami_app/features/vendors/wallet/presentation/pages/transactions_page.dart';
import 'package:asami_app/features/vendors/analytics/presentation/pages/analytics_dashboard_page.dart';
import 'package:asami_app/features/vendors/analytics/presentation/pages/sales_report_page.dart';
import 'package:asami_app/features/vendors/analytics/presentation/pages/product_performance_page.dart';

// Buyer features
import 'package:asami_app/features/buyers/shop/presentation/pages/home_page.dart';
import 'package:asami_app/features/buyers/shop/presentation/pages/search_page.dart';
import 'package:asami_app/features/buyers/shop/presentation/pages/category_page.dart';
import 'package:asami_app/features/buyers/shop/presentation/pages/product_detail_page.dart' as buyer;
import 'package:asami_app/features/buyers/cart/presentation/pages/cart_page.dart';
import 'package:asami_app/features/buyers/cart/presentation/pages/checkout_page.dart';
import 'package:asami_app/features/buyers/orders/presentation/pages/orders_list_page.dart';
import 'package:asami_app/features/buyers/orders/presentation/pages/order_detail_page.dart';
import 'package:asami_app/features/buyers/orders/presentation/pages/order_tracking_page.dart' as buyer_tracking;
import 'package:asami_app/features/buyers/wishlist/presentation/pages/wishlist_page.dart';

import '../../features/vendors/analytics/presentation/pages/dashboard_page.dart';
import '../di/injection_container.dart';
import 'navigation_helper.dart';
import 'routes.dart';

// ═══════════════════════════════════════════════════════════
// NAVIGATION SHELL KEYS
// ═══════════════════════════════════════════════════════════

final _vendorShellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'vendorShell');
final _buyerShellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'buyerShell');
final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

@lazySingleton
class AppRouter {
  late final GoRouter router;

  // Storage keys
  static const String _hasSeenOnboardingKey = 'has_seen_onboarding';
  static const String _userTypeKey = 'cached_user_type';

  AppRouter() {
    router = _buildRouter();
  }

  GoRouter _buildRouter() {
    return GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: '/',
      debugLogDiagnostics: true,
      
      // ═══════════════════════════════════════════════════════════
      // ROUTE CONFIGURATION
      // ═══════════════════════════════════════════════════════════
      routes: [
        // ═══════════════════════════════════════════════════════════
        // SPLASH SCREEN
        // ═══════════════════════════════════════════════════════════
        GoRoute(
          path: '/',
          name: RouteNames.splash,
          builder: (context, state) => const SplashPage(),
        ),

        // ═══════════════════════════════════════════════════════════
        // ONBOARDING
        // ═══════════════════════════════════════════════════════════
        GoRoute(
          path: AppRoutes.onboarding,
          name: RouteNames.onboarding,
          builder: (context, state) => const OnboardingPage(),
        ),

        // ═══════════════════════════════════════════════════════════
        // AUTHENTICATION ROUTES
        // ═══════════════════════════════════════════════════════════
        GoRoute(
          path: AppRoutes.login,
          name: RouteNames.login,
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          path: AppRoutes.signup,
          name: RouteNames.signup,
          builder: (context, state) => const SignupPage(),
        ),
        GoRoute(
          path: AppRoutes.verification,
          name: RouteNames.verification,
          builder: (context, state) {
            final phoneNumber = state.uri.queryParameters['phone'] ?? '';
            final countryCode = state.uri.queryParameters['code'] ?? '';
            return VerificationPage(
              phoneNumber: phoneNumber,
              countryCode: countryCode,
            );
          },
        ),

        // ═══════════════════════════════════════════════════════════
        // VENDOR SHELL (Bottom Navigation)
        // ═══════════════════════════════════════════════════════════
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return VendorScaffoldWithNavBar(navigationShell: navigationShell);
          },
          branches: [
            // Home/Dashboard Branch
            StatefulShellBranch(
              navigatorKey: GlobalKey<NavigatorState>(debugLabel: 'vendorHome'),
              routes: [
                GoRoute(
                  path: VendorRoutes.home,
                  name: RouteNames.vendorHome,
                  pageBuilder: (context, state) => NoTransitionPage(
                    child: const VendorDashboardPage(),
                  ),
                ),
              ],
            ),
            
            // Products Branch
            StatefulShellBranch(
              navigatorKey: GlobalKey<NavigatorState>(debugLabel: 'vendorProducts'),
              routes: [
                GoRoute(
                  path: VendorRoutes.products,
                  name: RouteNames.products,
                  pageBuilder: (context, state) => NoTransitionPage(
                    child: const ProductListPage(),
                  ),
                  routes: [
                    GoRoute(
                      path: 'add',
                      name: RouteNames.addProduct,
                      builder: (context, state) => const AddProductPage(),
                    ),
                    GoRoute(
                      path: 'edit/:id',
                      name: RouteNames.editProduct,
                      builder: (context, state) {
                        final id = state.pathParameters['id']!;
                        return EditProductPage(productId: id);
                      },
                    ),
                    GoRoute(
                      path: ':id',
                      name: RouteNames.productDetail,
                      builder: (context, state) {
                        final id = state.pathParameters['id']!;
                        return VendorProductDetailPage(productId: id);
                      },
                    ),
                  ],
                ),
              ],
            ),
            
            // AI Chat Branch
            StatefulShellBranch(
              navigatorKey: GlobalKey<NavigatorState>(debugLabel: 'vendorChat'),
              routes: [
                GoRoute(
                  path: VendorRoutes.aiChat,
                  name: RouteNames.vendorChat,
                  pageBuilder: (context, state) => NoTransitionPage(
                    child: const ChatPage(userType: UserType.vendor),
                  ),
                ),
              ],
            ),
            
            // Orders Branch
            StatefulShellBranch(
              navigatorKey: GlobalKey<NavigatorState>(debugLabel: 'vendorOrders'),
              routes: [
                GoRoute(
                  path: VendorRoutes.orders,
                  name: RouteNames.vendorOrders,
                  pageBuilder: (context, state) => NoTransitionPage(
                    child: const VendorOrdersListPage(),
                  ),
                  routes: [
                    GoRoute(
                      path: ':id',
                      name: RouteNames.vendorOrderDetail,
                      builder: (context, state) {
                        final id = state.pathParameters['id']!;
                        return VendorOrderDetailPage(orderId: id);
                      },
                      routes: [
                        // GoRoute(
                        //   path: 'track',
                        //   name: RouteNames.,
                        //   builder: (context, state) {
                        //     final id = state.pathParameters['id']!;
                        //     return OrderTrackingPage(orderId: id);
                        //   },
                        // ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            
            // Profile Branch
            StatefulShellBranch(
              navigatorKey: GlobalKey<NavigatorState>(debugLabel: 'vendorProfile'),
              routes: [
                GoRoute(
                  path: VendorRoutes.profile,
                  name: RouteNames.vendorProfile,
                  pageBuilder: (context, state) => NoTransitionPage(
                    child: const ProfilePage(userType: UserType.vendor),
                  ),
                ),
              ],
            ),
          ],
        ),

        // ═══════════════════════════════════════════════════════════
        // VENDOR SECONDARY ROUTES (Outside Bottom Nav)
        // ═══════════════════════════════════════════════════════════
        GoRoute(
          path: VendorRoutes.analytics,
          name: RouteNames.analytics,
          builder: (context, state) => const AnalyticsDashboardPage(),
        ),
        GoRoute(
          path: VendorRoutes.salesReport,
          name: RouteNames.salesReport,
          builder: (context, state) => const SalesReportPage(),
        ),
        GoRoute(
          path: VendorRoutes.salesReport,
          name: RouteNames.analytics,
          builder: (context, state) => const ProductPerformancePage(),
        ),
        GoRoute(
          path: VendorRoutes.inventory,
          name: RouteNames.inventory,
          builder: (context, state) => const InventoryPage(),
        ),
        // GoRoute(
        //   path: VendorRoutes.stockAlerts,
        //   name: RouteNames.inventory,
        //   builder: (context, state) => const StockAlertsPage(),
        // ),
        GoRoute(
          path: VendorRoutes.wallet,
          name: RouteNames.wallet,
          builder: (context, state) => const WalletPage(),
        ),
        GoRoute(
          path: VendorRoutes.withdrawal,
          name: RouteNames.wallet,
          builder: (context, state) => const WithdrawalPage(),
        ),
        GoRoute(
          path: VendorRoutes.transactions,
          name: RouteNames.analytics,
          builder: (context, state) => const TransactionsPage(),
        ),

        // ═══════════════════════════════════════════════════════════
        // BUYER SHELL (Bottom Navigation)
        // ═══════════════════════════════════════════════════════════
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return BuyerScaffoldWithNavBar(navigationShell: navigationShell);
          },
          branches: [
            // Home Branch
            StatefulShellBranch(
              navigatorKey: GlobalKey<NavigatorState>(debugLabel: 'buyerHome'),
              routes: [
                GoRoute(
                  path: BuyerRoutes.home,
                  name: RouteNames.customerHome,
                  pageBuilder: (context, state) => NoTransitionPage(
                    child: const BuyerHomePage(),
                  ),
                ),
              ],
            ),
            
            // Cart Branch
            StatefulShellBranch(
              navigatorKey: GlobalKey<NavigatorState>(debugLabel: 'buyerCart'),
              routes: [
                GoRoute(
                  path: BuyerRoutes.cart,
                  name: RouteNames.cart,
                  pageBuilder: (context, state) => NoTransitionPage(
                    child: const CartPage(),
                  ),
                  routes: [
                    // GoRoute(
                    //   path: 'checkout',
                    //   name: RouteNames.checkout,
                    //   builder: (context, state) => const CheckoutPage(),
                    // ),
                  ],
                ),
              ],
            ),
            
            // AI Chat Branch
            StatefulShellBranch(
              navigatorKey: GlobalKey<NavigatorState>(debugLabel: 'buyerChat'),
              routes: [
                // GoRoute(
                //   path: BuyerRoutes.aiChat,
                //   name: RouteNames.buyerChat,
                //   pageBuilder: (context, state) => NoTransitionPage(
                //     child: const ChatPage(userType: UserType.customer),
                //   ),
                // ),
              ],
            ),
            
            // Orders Branch
            StatefulShellBranch(
              navigatorKey: GlobalKey<NavigatorState>(debugLabel: 'buyerOrders'),
              routes: [
                GoRoute(
                  path: BuyerRoutes.orders,
                  name: RouteNames.customerOrders,
                  pageBuilder: (context, state) => NoTransitionPage(
                    child: const BuyerHomePage(),
                  ),
                  // routes: [
                  //   GoRoute(
                  //     path: ':id',
                  //     name: RouteNames.customerOrderDetail,
                  //     builder: (context, state) {
                  //       final id = state.pathParameters['id']!;
                  //       return CustomerOrderDetailPage(orderId: id);
                  //     },
                  //     routes: [
                  //       GoRoute(
                  //         path: 'track',
                  //         name: RouteNames.buyerOrderTracking,
                  //         builder: (context, state) {
                  //           final id = state.pathParameters['id']!;
                  //           return buyer_tracking.OrderTrackingPage(orderId: id);
                  //         },
                  //       ),
                  //     ],
                  //   ),
                  // ],
                ),
              ],
            ),
            
            // Profile Branch
            StatefulShellBranch(
              navigatorKey: GlobalKey<NavigatorState>(debugLabel: 'buyerProfile'),
              routes: [
                GoRoute(
                  path: BuyerRoutes.profile,
                  name: RouteNames.buyerProfile,
                  pageBuilder: (context, state) => NoTransitionPage(
                    child: const ProfilePage(userType: UserType.customer),
                  ),
                ),
              ],
            ),
          ],
        ),

        // ═══════════════════════════════════════════════════════════
        // BUYER SECONDARY ROUTES (Outside Bottom Nav)
        // ═══════════════════════════════════════════════════════════
        GoRoute(
          path: BuyerRoutes.search,
          name: RouteNames.search,
          builder: (context, state) {
            final query = state.uri.queryParameters['q'] ?? '';
            return SearchPage(initialQuery: query);
          },
        ),
        GoRoute(
          path: '/shop/category/:id',
          name: RouteNames.category,
          builder: (context, state) {
            final categoryId = state.pathParameters['id']!;
            return CategoryPage(categoryId: categoryId);
          },
        ),
        GoRoute(
          path: '/shop/product/:id',
          name: RouteNames.buyerProductDetail,
          builder: (context, state) {
            final productId = state.pathParameters['id']!;
            return buyer.BuyerProductDetailPage(productId: productId);
          },
        ),
        GoRoute(
          path: BuyerRoutes.wishlist,
          name: RouteNames.wishlist,
          builder: (context, state) => const WishlistPage(),
        ),
      ],

      // ═══════════════════════════════════════════════════════════
      // REDIRECT LOGIC
      // ═══════════════════════════════════════════════════════════
      redirect: (context, state) async {
        final location = state.matchedLocation;

        // Don't redirect during splash
        if (location == '/') {
          return null; // Allow splash to handle its own logic
        }

        // Check if AuthCubit is registered
        if (!getIt.isRegistered<AuthCubit>()) {
          return null;
        }

        final authCubit = getIt<AuthCubit>();
        final authState = authCubit.state;

        final isAuthenticated = authState is Authenticated;
        final user = isAuthenticated ? (authState as Authenticated).user : null;
        final userType = user?.userType;

        final isGoingToAuth = _isAuthRoute(location);
        final isGoingToOnboarding = location == AppRoutes.onboarding;

        // ═══════════════════════════════════════════════════════════
        // UNAUTHENTICATED FLOW
        // ═══════════════════════════════════════════════════════════
        if (!isAuthenticated) {
          if (isGoingToAuth || isGoingToOnboarding) return null;
          return AppRoutes.login;
        }

        // ═══════════════════════════════════════════════════════════
        // AUTHENTICATED FLOW
        // ═══════════════════════════════════════════════════════════
        
        // Check platform authentication
        if (!_isPlatformAuthenticated(user!, 'web')) {
          if (location != AppRoutes.verification) {
            return '${AppRoutes.verification}?phone=${user.phoneNumber}&code=${user.countryCode}';
          }
          return null;
        }

        // Redirect away from auth pages
        if (isGoingToAuth || isGoingToOnboarding) {
          return _getDefaultRouteForUserType(userType!);
        }

        // Validate route for user type
        if (!_isValidRouteForUserType(location, userType!)) {
          return _getDefaultRouteForUserType(userType);
        }

        return null;
      },

      refreshListenable: _AuthRefreshNotifier(),

      errorBuilder: (context, state) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64, color: Colors.red),
              const SizedBox(height: 16),
              Text('Page not found: ${state.uri}'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => context.go(AppRoutes.login),
                child: const Text('Go to Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════
  // HELPER METHODS
  // ═══════════════════════════════════════════════════════════

  bool _isAuthRoute(String route) {
    return route == AppRoutes.login ||
        route == AppRoutes.signup ||
        route.startsWith(AppRoutes.verification);
  }

  bool _isPlatformAuthenticated(User user, String platform) {
    switch (platform.toLowerCase()) {
      case 'web':
        return user.webAuthenticated;
      case 'email':
        return user.emailVerified;
      case 'mobile':
        return user.isPhoneVerified;
      default:
        return false;
    }
  }

  String _getDefaultRouteForUserType(UserType userType) {
    return userType == UserType.vendor ? VendorRoutes.home : BuyerRoutes.home;
  }

  bool _isValidRouteForUserType(String route, UserType userType) {
    if (_isAuthRoute(route)) return true;
    if (userType == UserType.vendor) return route.startsWith('/vendor/');
    if (userType == UserType.customer) return route.startsWith('/shop/');
    return false;
  }

  // ═══════════════════════════════════════════════════════════
  // ONBOARDING TRACKING
  // ═══════════════════════════════════════════════════════════

  static Future<bool> hasSeenOnboarding() async {
    final prefs = StorageService.instance;
    return prefs.getBool(_hasSeenOnboardingKey) ?? false;
  }

  static Future<void> markOnboardingCompleted() async {
    final prefs = StorageService.instance;
    await prefs.setBool(_hasSeenOnboardingKey, true);
  }

  static Future<void> cacheUserType(UserType userType) async {
    final prefs = StorageService.instance;
    await prefs.setString(_userTypeKey, userType.name);
  }
}

// ═══════════════════════════════════════════════════════════
// AUTH REFRESH NOTIFIER
// ═══════════════════════════════════════════════════════════

class _AuthRefreshNotifier extends ChangeNotifier {
  StreamSubscription? _sub;

  _AuthRefreshNotifier() {
    Future.microtask(() {
      if (getIt.isRegistered<AuthCubit>()) {
        _sub = getIt<AuthCubit>().stream.listen((_) => notifyListeners());
      }
    });
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }
}

// ═══════════════════════════════════════════════════════════
// VENDOR SCAFFOLD WITH BOTTOM NAV
// ═══════════════════════════════════════════════════════════

class VendorScaffoldWithNavBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const VendorScaffoldWithNavBar({
    super.key,
    required this.navigationShell,
  });

  void _onTap(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: _onTap,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.dashboard), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.inventory), label: 'Products'),
          NavigationDestination(icon: Icon(Icons.smart_toy), label: 'AI Chat'),
          NavigationDestination(icon: Icon(Icons.receipt_long), label: 'Orders'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════
// BUYER SCAFFOLD WITH BOTTOM NAV
// ═══════════════════════════════════════════════════════════

class BuyerScaffoldWithNavBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const BuyerScaffoldWithNavBar({
    super.key,
    required this.navigationShell,
  });

  void _onTap(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: _onTap,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          NavigationDestination(icon: Icon(Icons.smart_toy), label: 'AI Chat'),
          NavigationDestination(icon: Icon(Icons.receipt_long), label: 'Orders'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}