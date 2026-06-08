// // ═══════════════════════════════════════════════════════════
// // NOTIFICATION DEEP LINK HANDLER
// // ═══════════════════════════════════════════════════════════

// import 'package:go_router/go_router.dart';
// import 'package:injectable/injectable.dart';

// @injectable
// class NotificationDeepLinkHandler implements DeepLinkHandler {
//   @override
//   Future<bool> handle(Uri uri, GoRouter? router) async {
//     if (router == null) return false;

//     // Order notification
//     if (uri.path.startsWith('/notification/order/')) {
//       final orderId = uri.pathSegments.last;
//       final isVendor = uri.queryParameters['type'] == 'vendor';

//       if (isVendor) {
//         router.push(VendorRoutes.orderDetail(orderId));
//       } else {
//         router.push(BuyerRoutes.orderDetail(orderId));
//       }
//       return true;
//     }

//     // Chat notification
//     if (uri.path.startsWith('/notification/chat')) {
//       final isVendor = uri.queryParameters['type'] == 'vendor';
//       router.go(isVendor ? VendorRoutes.aiChat : BuyerRoutes.aiChat);
//       return true;
//     }

//     // Stock alert
//     if (uri.path.startsWith('/notification/stock')) {
//       router.push(VendorRoutes.inventory);
//       return true;
//     }

//     return false;
//   }
// }