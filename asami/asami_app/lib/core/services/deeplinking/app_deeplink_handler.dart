
// @injectable
// class AppDeepLinkHandler implements DeepLinkHandler {
//   @override
//   Future<bool> handle(Uri uri, GoRouter? router) async {
//     if (router == null) return false;

//     // Product detail: asami://product/123 or https://asami.app/product/123
//     if (uri.path.startsWith('/product/')) {
//       final productId = uri.pathSegments.last;
//       router.push(BuyerRoutes.productDetail(productId));
//       return true;
//     }

//     // Vendor product: asami://vendor/product/123
//     if (uri.path.startsWith('/vendor/product/')) {
//       final productId = uri.pathSegments.last;
//       router.push(VendorRoutes.productDetail(productId));
//       return true;
//     }

//     // Order: asami://order/123
//     if (uri.path.startsWith('/order/')) {
//       final orderId = uri.pathSegments.last;
//       router.push(BuyerRoutes.orderDetail(orderId));
//       return true;
//     }

//     // Vendor order: asami://vendor/order/123
//     if (uri.path.startsWith('/vendor/order/')) {
//       final orderId = uri.pathSegments.last;
//       router.push(VendorRoutes.orderDetail(orderId));
//       return true;
//     }

//     // Category: asami://category/electronics
//     if (uri.path.startsWith('/category/')) {
//       final categoryId = uri.pathSegments.last;
//       router.push(BuyerRoutes.category(categoryId));
//       return true;
//     }

//     // Search: asami://search?q=phone
//     if (uri.path == '/search') {
//       final query = uri.queryParameters['q'] ?? '';
//       router.push('${BuyerRoutes.search}?q=$query');
//       return true;
//     }

//     // Verification: asami://verify?phone=xxx&code=xxx
//     if (uri.path == '/verify' || uri.path == '/verification') {
//       final phone = uri.queryParameters['phone'] ?? '';
//       final code = uri.queryParameters['code'] ?? '';
//       router.go('${AppRoutes.verification}?phone=$phone&code=$code');
//       return true;
//     }

//     // Cart
//     if (uri.path == '/cart') {
//       router.go(BuyerRoutes.cart);
//       return true;
//     }

//     // Wishlist
//     if (uri.path == '/wishlist') {
//       router.push(BuyerRoutes.wishlist);
//       return true;
//     }

//     // Vendor routes
//     if (uri.path == '/vendor' || uri.path == '/vendor/home') {
//       router.go(VendorRoutes.home);
//       return true;
//     }

//     if (uri.path == '/vendor/analytics') {
//       router.push(VendorRoutes.analytics);
//       return true;
//     }

//     if (uri.path == '/vendor/wallet') {
//       router.push(VendorRoutes.wallet);
//       return true;
//     }

//     return false;
//   }
// }


