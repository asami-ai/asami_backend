/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:asami_client/src/protocol/analytics/vendor_analytics.dart'
    as _i3;
import 'package:asami_client/src/protocol/analytics/product_analytics.dart'
    as _i4;
import 'package:asami_client/src/protocol/product/product.dart' as _i5;
import 'package:asami_client/src/protocol/user/user_type.dart' as _i6;
import 'package:asami_client/src/protocol/messaging/platfom_type.dart' as _i7;
import 'package:asami_client/src/protocol/messaging/message_type.dart' as _i8;
import 'package:asami_client/src/protocol/order/order.dart' as _i9;
import 'package:asami_client/src/protocol/order/order_item.dart' as _i10;
import 'package:asami_client/src/protocol/order/cart.dart' as _i11;
import 'package:asami_client/src/protocol/order/cart_item.dart' as _i12;
import 'package:asami_client/src/protocol/order/payment_method.dart' as _i13;
import 'package:asami_client/src/protocol/order/order_status.dart' as _i14;
import 'package:asami_client/src/protocol/product/product_status.dart' as _i15;
import 'package:asami_client/src/protocol/product/product_condition.dart'
    as _i16;
import 'package:asami_client/src/protocol/subscription/subscription.dart'
    as _i17;
import 'package:asami_client/src/protocol/user/subscription_tier.dart' as _i18;
import 'package:asami_client/src/protocol/subscription/usage_record.dart'
    as _i19;
import 'package:asami_client/src/protocol/subscription/subscription_invoice.dart'
    as _i20;
import 'package:asami_client/src/protocol/user/user.dart' as _i21;
import 'package:asami_client/src/protocol/user/customer_profile.dart' as _i22;
import 'package:asami_client/src/protocol/user/vendor_profile.dart' as _i23;
import 'package:asami_client/src/protocol/user/address.dart' as _i24;
import 'protocol.dart' as _i25;

/// {@category Endpoint}
class EndpointAnalytics extends _i1.EndpointRef {
  EndpointAnalytics(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'analytics';

  /// Get vendor analytics for a specific period
  _i2.Future<_i3.VendorAnalytics?> getVendorAnalytics({
    required _i1.UuidValue vendorId,
    required DateTime date,
    required String period,
  }) => caller.callServerEndpoint<_i3.VendorAnalytics?>(
    'analytics',
    'getVendorAnalytics',
    {
      'vendorId': vendorId,
      'date': date,
      'period': period,
    },
  );

  /// Get vendor analytics for date range
  _i2.Future<List<_i3.VendorAnalytics>> getVendorAnalyticsRange({
    required _i1.UuidValue vendorId,
    required DateTime startDate,
    required DateTime endDate,
    required String period,
  }) => caller.callServerEndpoint<List<_i3.VendorAnalytics>>(
    'analytics',
    'getVendorAnalyticsRange',
    {
      'vendorId': vendorId,
      'startDate': startDate,
      'endDate': endDate,
      'period': period,
    },
  );

  /// Generate vendor dashboard summary
  _i2.Future<Map<String, dynamic>> getVendorDashboard(_i1.UuidValue vendorId) =>
      caller.callServerEndpoint<Map<String, dynamic>>(
        'analytics',
        'getVendorDashboard',
        {'vendorId': vendorId},
      );

  /// Get product analytics
  _i2.Future<List<_i4.ProductAnalytics>> getProductAnalytics({
    required _i1.UuidValue productId,
    required DateTime startDate,
    required DateTime endDate,
  }) => caller.callServerEndpoint<List<_i4.ProductAnalytics>>(
    'analytics',
    'getProductAnalytics',
    {
      'productId': productId,
      'startDate': startDate,
      'endDate': endDate,
    },
  );

  /// Get top selling products for vendor
  _i2.Future<List<_i5.Product>> getTopSellingProducts({
    required _i1.UuidValue vendorId,
    required int limit,
  }) => caller.callServerEndpoint<List<_i5.Product>>(
    'analytics',
    'getTopSellingProducts',
    {
      'vendorId': vendorId,
      'limit': limit,
    },
  );

  /// Get revenue breakdown by payment method
  _i2.Future<Map<String, double>> getPaymentMethodBreakdown({
    required _i1.UuidValue vendorId,
    required DateTime startDate,
    required DateTime endDate,
  }) => caller.callServerEndpoint<Map<String, double>>(
    'analytics',
    'getPaymentMethodBreakdown',
    {
      'vendorId': vendorId,
      'startDate': startDate,
      'endDate': endDate,
    },
  );

  /// Record daily analytics (should be run by a scheduled job)
  _i2.Future<void> recordDailyAnalytics(DateTime date) =>
      caller.callServerEndpoint<void>(
        'analytics',
        'recordDailyAnalytics',
        {'date': date},
      );
}

/// {@category Endpoint}
class EndpointAuth extends _i1.EndpointRef {
  EndpointAuth(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'auth';

  /// Initiate signup process
  _i2.Future<Map<String, dynamic>> initiateSignup({
    required String email,
    required _i6.UserType userType,
    String? phoneNumber,
    String? firstName,
    String? lastName,
    required _i7.PlatformType platform,
    required String platformUserId,
  }) => caller.callServerEndpoint<Map<String, dynamic>>(
    'auth',
    'initiateSignup',
    {
      'email': email,
      'userType': userType,
      'phoneNumber': phoneNumber,
      'firstName': firstName,
      'lastName': lastName,
      'platform': platform,
      'platformUserId': platformUserId,
    },
  );

  /// Verify signup code
  _i2.Future<Map<String, dynamic>> verifySignupCode({
    required String email,
    required String code,
    required _i7.PlatformType platform,
    required String platformUserId,
  }) => caller.callServerEndpoint<Map<String, dynamic>>(
    'auth',
    'verifySignupCode',
    {
      'email': email,
      'code': code,
      'platform': platform,
      'platformUserId': platformUserId,
    },
  );

  /// Initiate login
  _i2.Future<Map<String, dynamic>> initiateLogin({required String email}) =>
      caller.callServerEndpoint<Map<String, dynamic>>(
        'auth',
        'initiateLogin',
        {'email': email},
      );

  /// Verify login code
  _i2.Future<Map<String, dynamic>> verifyLoginCode({
    required String email,
    required String code,
    required _i7.PlatformType platform,
    required String platformUserId,
  }) => caller.callServerEndpoint<Map<String, dynamic>>(
    'auth',
    'verifyLoginCode',
    {
      'email': email,
      'code': code,
      'platform': platform,
      'platformUserId': platformUserId,
    },
  );

  /// Check authentication status
  _i2.Future<Map<String, dynamic>> checkAuth({
    required _i7.PlatformType platform,
    required String platformUserId,
  }) => caller.callServerEndpoint<Map<String, dynamic>>(
    'auth',
    'checkAuth',
    {
      'platform': platform,
      'platformUserId': platformUserId,
    },
  );

  /// Logout
  _i2.Future<Map<String, dynamic>> logout({
    required String userId,
    required _i7.PlatformType platform,
  }) => caller.callServerEndpoint<Map<String, dynamic>>(
    'auth',
    'logout',
    {
      'userId': userId,
      'platform': platform,
    },
  );

  /// Resend verification code
  _i2.Future<Map<String, dynamic>> resendCode({required String email}) =>
      caller.callServerEndpoint<Map<String, dynamic>>(
        'auth',
        'resendCode',
        {'email': email},
      );

  /// Upgrade customer to vendor
  _i2.Future<Map<String, dynamic>> upgradeToVendor({
    required String userId,
    required String businessName,
    required String businessCategory,
  }) => caller.callServerEndpoint<Map<String, dynamic>>(
    'auth',
    'upgradeToVendor',
    {
      'userId': userId,
      'businessName': businessName,
      'businessCategory': businessCategory,
    },
  );

  _i2.Future<bool> deleteTempUser({required String email}) =>
      caller.callServerEndpoint<bool>(
        'auth',
        'deleteTempUser',
        {'email': email},
      );
}

/// {@category Endpoint}
class EndpointBot extends _i1.EndpointRef {
  EndpointBot(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'bot';

  /// Process incoming message from any platform
  _i2.Future<Map<String, dynamic>> processMessage({
    required String platformUserId,
    required _i7.PlatformType platform,
    required String messageContent,
    required _i8.MessageType messageType,
    String? mediaUrl,
    String? platformMessageId,
  }) => caller.callServerEndpoint<Map<String, dynamic>>(
    'bot',
    'processMessage',
    {
      'platformUserId': platformUserId,
      'platform': platform,
      'messageContent': messageContent,
      'messageType': messageType,
      'mediaUrl': mediaUrl,
      'platformMessageId': platformMessageId,
    },
  );

  /// Send formatted message (for AI agent to use)
  _i2.Future<bool> sendFormattedMessage({
    required String platformUserId,
    required _i7.PlatformType platform,
    required String message,
    Map<String, dynamic>? interactiveData,
  }) => caller.callServerEndpoint<bool>(
    'bot',
    'sendFormattedMessage',
    {
      'platformUserId': platformUserId,
      'platform': platform,
      'message': message,
      'interactiveData': interactiveData,
    },
  );

  /// Send product list
  _i2.Future<bool> sendProductList({
    required String platformUserId,
    required _i7.PlatformType platform,
    required List<_i5.Product> products,
  }) => caller.callServerEndpoint<bool>(
    'bot',
    'sendProductList',
    {
      'platformUserId': platformUserId,
      'platform': platform,
      'products': products,
    },
  );

  /// Send order confirmation
  _i2.Future<bool> sendOrderConfirmation({
    required String platformUserId,
    required _i7.PlatformType platform,
    required _i9.Order order,
    required List<_i10.OrderItem> items,
  }) => caller.callServerEndpoint<bool>(
    'bot',
    'sendOrderConfirmation',
    {
      'platformUserId': platformUserId,
      'platform': platform,
      'order': order,
      'items': items,
    },
  );
}

/// {@category Endpoint}
class EndpointCart extends _i1.EndpointRef {
  EndpointCart(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'cart';

  /// Get or create cart for customer
  _i2.Future<_i11.Cart?> getOrCreateCart(_i1.UuidValue customerId) =>
      caller.callServerEndpoint<_i11.Cart?>(
        'cart',
        'getOrCreateCart',
        {'customerId': customerId},
      );

  /// Add item to cart
  _i2.Future<_i12.CartItem?> addToCart({
    required _i1.UuidValue customerId,
    required _i1.UuidValue productId,
    _i1.UuidValue? variantId,
    required int quantity,
    String? customerNotes,
  }) => caller.callServerEndpoint<_i12.CartItem?>(
    'cart',
    'addToCart',
    {
      'customerId': customerId,
      'productId': productId,
      'variantId': variantId,
      'quantity': quantity,
      'customerNotes': customerNotes,
    },
  );

  /// Update cart item quantity
  _i2.Future<bool> updateCartItemQuantity({
    required int cartItemId,
    required int quantity,
  }) => caller.callServerEndpoint<bool>(
    'cart',
    'updateCartItemQuantity',
    {
      'cartItemId': cartItemId,
      'quantity': quantity,
    },
  );

  /// Remove item from cart
  _i2.Future<bool> removeFromCart(int cartItemId) =>
      caller.callServerEndpoint<bool>(
        'cart',
        'removeFromCart',
        {'cartItemId': cartItemId},
      );

  /// Get cart with items
  _i2.Future<Map<String, dynamic>?> getCartWithItems(
    _i1.UuidValue customerId,
  ) => caller.callServerEndpoint<Map<String, dynamic>?>(
    'cart',
    'getCartWithItems',
    {'customerId': customerId},
  );

  /// Clear cart
  _i2.Future<bool> clearCart(_i1.UuidValue customerId) =>
      caller.callServerEndpoint<bool>(
        'cart',
        'clearCart',
        {'customerId': customerId},
      );
}

/// {@category Endpoint}
class EndpointOrder extends _i1.EndpointRef {
  EndpointOrder(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'order';

  /// Create order from cart
  _i2.Future<_i9.Order?> createOrder({
    required _i1.UuidValue customerId,
    required _i1.UuidValue shippingAddressId,
    required _i13.PaymentMethod paymentMethod,
    String? customerNotes,
    _i1.UuidValue? conversationId,
    required String orderSource,
  }) => caller.callServerEndpoint<_i9.Order?>(
    'order',
    'createOrder',
    {
      'customerId': customerId,
      'shippingAddressId': shippingAddressId,
      'paymentMethod': paymentMethod,
      'customerNotes': customerNotes,
      'conversationId': conversationId,
      'orderSource': orderSource,
    },
  );

  /// Get order by ID
  _i2.Future<_i9.Order?> getOrder(_i1.UuidValue orderId) =>
      caller.callServerEndpoint<_i9.Order?>(
        'order',
        'getOrder',
        {'orderId': orderId},
      );

  /// Get order with items
  _i2.Future<Map<String, dynamic>?> getOrderWithItems(_i1.UuidValue orderId) =>
      caller.callServerEndpoint<Map<String, dynamic>?>(
        'order',
        'getOrderWithItems',
        {'orderId': orderId},
      );

  /// Get customer orders
  _i2.Future<List<_i9.Order>> getCustomerOrders({
    required _i1.UuidValue customerId,
    _i14.OrderStatus? status,
    required int limit,
    required int offset,
  }) => caller.callServerEndpoint<List<_i9.Order>>(
    'order',
    'getCustomerOrders',
    {
      'customerId': customerId,
      'status': status,
      'limit': limit,
      'offset': offset,
    },
  );

  /// Get vendor orders
  _i2.Future<List<_i9.Order>> getVendorOrders({
    required _i1.UuidValue vendorId,
    _i14.OrderStatus? status,
    required int limit,
    required int offset,
  }) => caller.callServerEndpoint<List<_i9.Order>>(
    'order',
    'getVendorOrders',
    {
      'vendorId': vendorId,
      'status': status,
      'limit': limit,
      'offset': offset,
    },
  );

  /// Update order status
  _i2.Future<bool> updateOrderStatus({
    required _i1.UuidValue orderId,
    required _i14.OrderStatus status,
    String? trackingNumber,
    String? vendorNotes,
  }) => caller.callServerEndpoint<bool>(
    'order',
    'updateOrderStatus',
    {
      'orderId': orderId,
      'status': status,
      'trackingNumber': trackingNumber,
      'vendorNotes': vendorNotes,
    },
  );

  /// Cancel order
  _i2.Future<bool> cancelOrder({
    required _i1.UuidValue orderId,
    required String cancellationReason,
    required bool refund,
  }) => caller.callServerEndpoint<bool>(
    'order',
    'cancelOrder',
    {
      'orderId': orderId,
      'cancellationReason': cancellationReason,
      'refund': refund,
    },
  );
}

/// {@category Endpoint}
class EndpointProduct extends _i1.EndpointRef {
  EndpointProduct(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'product';

  /// ✅ COMPLETE: Create product with ALL fields
  _i2.Future<_i5.Product?> createProduct({
    required _i1.UuidValue vendorId,
    required String name,
    required String description,
    required String category,
    required double basePrice,
    String? shortDescription,
    String? subCategory,
    List<String>? tags,
    String? currency,
    int? quantity,
    List<String>? images,
    List<String>? whatsappMediaIds,
    List<String>? telegramFileIds,
    String? thumbnailUrl,
    String? videoUrl,
    String? videoThumbnailUrl,
    List<String>? color,
    List<String>? size,
    String? material,
    String? brand,
    double? weight,
    String? weightUnit,
    String? dimensions,
    String? sku,
    String? barcode,
    bool? isAiGenerated,
    _i15.ProductStatus? status,
    _i16.ProductCondition? condition,
    String? facebookCategory,
    String? googleCategory,
    bool? shippingRequired,
    int? estimatedDeliveryDays,
    bool? freeShipping,
    double? shippingCost,
    String? facebookCategoryId,
    String? googleCategoryId,
    List<String>? searchKeywords,
  }) => caller.callServerEndpoint<_i5.Product?>(
    'product',
    'createProduct',
    {
      'vendorId': vendorId,
      'name': name,
      'description': description,
      'category': category,
      'basePrice': basePrice,
      'shortDescription': shortDescription,
      'subCategory': subCategory,
      'tags': tags,
      'currency': currency,
      'quantity': quantity,
      'images': images,
      'whatsappMediaIds': whatsappMediaIds,
      'telegramFileIds': telegramFileIds,
      'thumbnailUrl': thumbnailUrl,
      'videoUrl': videoUrl,
      'videoThumbnailUrl': videoThumbnailUrl,
      'color': color,
      'size': size,
      'material': material,
      'brand': brand,
      'weight': weight,
      'weightUnit': weightUnit,
      'dimensions': dimensions,
      'sku': sku,
      'barcode': barcode,
      'isAiGenerated': isAiGenerated,
      'status': status,
      'condition': condition,
      'facebookCategory': facebookCategory,
      'googleCategory': googleCategory,
      'shippingRequired': shippingRequired,
      'estimatedDeliveryDays': estimatedDeliveryDays,
      'freeShipping': freeShipping,
      'shippingCost': shippingCost,
      'facebookCategoryId': facebookCategoryId,
      'googleCategoryId': googleCategoryId,
      'searchKeywords': searchKeywords,
    },
  );

  /// ✅ COMPLETE: Update product with ALL fields
  _i2.Future<_i5.Product?> updateProduct({
    required _i1.UuidValue productId,
    String? name,
    String? description,
    String? shortDescription,
    String? category,
    String? subCategory,
    double? basePrice,
    double? discountPrice,
    int? quantity,
    List<String>? color,
    List<String>? size,
    String? material,
    String? brand,
    bool? isActive,
    _i15.ProductStatus? status,
    String? thumbnailUrl,
    List<String>? images,
  }) => caller.callServerEndpoint<_i5.Product?>(
    'product',
    'updateProduct',
    {
      'productId': productId,
      'name': name,
      'description': description,
      'shortDescription': shortDescription,
      'category': category,
      'subCategory': subCategory,
      'basePrice': basePrice,
      'discountPrice': discountPrice,
      'quantity': quantity,
      'color': color,
      'size': size,
      'material': material,
      'brand': brand,
      'isActive': isActive,
      'status': status,
      'thumbnailUrl': thumbnailUrl,
      'images': images,
    },
  );

  /// Delete/deactivate product
  _i2.Future<bool> deleteProduct(_i1.UuidValue productId) =>
      caller.callServerEndpoint<bool>(
        'product',
        'deleteProduct',
        {'productId': productId},
      );

  /// Publish product (change from draft to active)
  _i2.Future<bool> publishProduct(_i1.UuidValue productId) =>
      caller.callServerEndpoint<bool>(
        'product',
        'publishProduct',
        {'productId': productId},
      );

  /// Get product by ID
  _i2.Future<_i5.Product?> getProduct(_i1.UuidValue productId) =>
      caller.callServerEndpoint<_i5.Product?>(
        'product',
        'getProduct',
        {'productId': productId},
      );

  /// Get vendor products
  _i2.Future<List<_i5.Product>> getVendorProducts({
    required _i1.UuidValue vendorId,
    _i15.ProductStatus? status,
    bool? isActive,
    required int limit,
    required int offset,
  }) => caller.callServerEndpoint<List<_i5.Product>>(
    'product',
    'getVendorProducts',
    {
      'vendorId': vendorId,
      'status': status,
      'isActive': isActive,
      'limit': limit,
      'offset': offset,
    },
  );

  /// Search products (for customer bot)
  _i2.Future<List<_i5.Product>> searchProducts({
    String? query,
    String? category,
    double? minPrice,
    double? maxPrice,
    List<String>? tags,
    String? color,
    String? size,
    required int limit,
    required int offset,
  }) => caller.callServerEndpoint<List<_i5.Product>>(
    'product',
    'searchProducts',
    {
      'query': query,
      'category': category,
      'minPrice': minPrice,
      'maxPrice': maxPrice,
      'tags': tags,
      'color': color,
      'size': size,
      'limit': limit,
      'offset': offset,
    },
  );

  /// Update inventory
  _i2.Future<bool> updateInventory({
    required _i1.UuidValue productId,
    required int quantity,
  }) => caller.callServerEndpoint<bool>(
    'product',
    'updateInventory',
    {
      'productId': productId,
      'quantity': quantity,
    },
  );

  /// Decrement inventory (after order)
  _i2.Future<bool> decrementInventory({
    required _i1.UuidValue productId,
    required int quantity,
  }) => caller.callServerEndpoint<bool>(
    'product',
    'decrementInventory',
    {
      'productId': productId,
      'quantity': quantity,
    },
  );

  /// Get featured products
  _i2.Future<List<_i5.Product>> getFeaturedProducts({required int limit}) =>
      caller.callServerEndpoint<List<_i5.Product>>(
        'product',
        'getFeaturedProducts',
        {'limit': limit},
      );

  /// Get products by category
  _i2.Future<List<_i5.Product>> getProductsByCategory({
    required String category,
    String? subCategory,
    required int limit,
    required int offset,
  }) => caller.callServerEndpoint<List<_i5.Product>>(
    'product',
    'getProductsByCategory',
    {
      'category': category,
      'subCategory': subCategory,
      'limit': limit,
      'offset': offset,
    },
  );
}

/// {@category Endpoint}
class EndpointSubscription extends _i1.EndpointRef {
  EndpointSubscription(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'subscription';

  /// Get vendor subscription
  _i2.Future<_i17.Subscription?> getVendorSubscription(
    _i1.UuidValue vendorId,
  ) => caller.callServerEndpoint<_i17.Subscription?>(
    'subscription',
    'getVendorSubscription',
    {'vendorId': vendorId},
  );

  /// Upgrade/change subscription tier
  _i2.Future<_i17.Subscription?> changeTier({
    required _i1.UuidValue vendorId,
    required _i18.SubscriptionTier newTier,
  }) => caller.callServerEndpoint<_i17.Subscription?>(
    'subscription',
    'changeTier',
    {
      'vendorId': vendorId,
      'newTier': newTier,
    },
  );

  /// Get usage records for billing period
  _i2.Future<List<_i19.UsageRecord>> getUsageRecords({
    required _i1.UuidValue vendorId,
    required DateTime periodStart,
    required DateTime periodEnd,
  }) => caller.callServerEndpoint<List<_i19.UsageRecord>>(
    'subscription',
    'getUsageRecords',
    {
      'vendorId': vendorId,
      'periodStart': periodStart,
      'periodEnd': periodEnd,
    },
  );

  /// Generate invoice for subscription period
  _i2.Future<_i20.SubscriptionInvoice?> generateInvoice({
    required _i1.UuidValue subscriptionId,
    required DateTime periodStart,
    required DateTime periodEnd,
  }) => caller.callServerEndpoint<_i20.SubscriptionInvoice?>(
    'subscription',
    'generateInvoice',
    {
      'subscriptionId': subscriptionId,
      'periodStart': periodStart,
      'periodEnd': periodEnd,
    },
  );

  /// Check if vendor can perform action based on tier limits
  _i2.Future<Map<String, dynamic>> checkTierLimits(_i1.UuidValue vendorId) =>
      caller.callServerEndpoint<Map<String, dynamic>>(
        'subscription',
        'checkTierLimits',
        {'vendorId': vendorId},
      );
}

/// {@category Endpoint}
class EndpointTelegramWebhook extends _i1.EndpointRef {
  EndpointTelegramWebhook(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'telegramWebhook';

  /// Process webhook (POST request)
  _i2.Future<Map<String, dynamic>> processWebhook(
    Map<String, dynamic> payload,
  ) => caller.callServerEndpoint<Map<String, dynamic>>(
    'telegramWebhook',
    'processWebhook',
    {'payload': payload},
  );
}

/// Comprehensive usage tracking and billing service
/// {@category Endpoint}
class EndpointUsage extends _i1.EndpointRef {
  EndpointUsage(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'usage';

  _i2.Future<void> resetDailyLimits() => caller.callServerEndpoint<void>(
    'usage',
    'resetDailyLimits',
    {},
  );
}

/// {@category Endpoint}
class EndpointUser extends _i1.EndpointRef {
  EndpointUser(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'user';

  /// Update user profile
  _i2.Future<_i21.User?> updateProfile({
    required _i1.UuidValue userId,
    String? firstName,
    String? lastName,
    String? email,
    String? profileImageUrl,
    String? city,
    String? state,
    String? country,
    String? language,
    String? timezone,
  }) => caller.callServerEndpoint<_i21.User?>(
    'user',
    'updateProfile',
    {
      'userId': userId,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'profileImageUrl': profileImageUrl,
      'city': city,
      'state': state,
      'country': country,
      'language': language,
      'timezone': timezone,
    },
  );

  /// Get customer profile
  _i2.Future<_i22.CustomerProfile?> getCustomerProfile(_i1.UuidValue userId) =>
      caller.callServerEndpoint<_i22.CustomerProfile?>(
        'user',
        'getCustomerProfile',
        {'userId': userId},
      );

  /// Update customer profile
  _i2.Future<_i22.CustomerProfile?> updateCustomerProfile({
    required _i1.UuidValue userId,
    String? preferredPaymentMethod,
    List<String>? favoriteVendors,
  }) => caller.callServerEndpoint<_i22.CustomerProfile?>(
    'user',
    'updateCustomerProfile',
    {
      'userId': userId,
      'preferredPaymentMethod': preferredPaymentMethod,
      'favoriteVendors': favoriteVendors,
    },
  );

  /// Get vendor profile
  _i2.Future<_i23.VendorProfile?> getVendorProfile(_i1.UuidValue userId) =>
      caller.callServerEndpoint<_i23.VendorProfile?>(
        'user',
        'getVendorProfile',
        {'userId': userId},
      );

  /// Update vendor profile
  _i2.Future<_i23.VendorProfile?> updateVendorProfile({
    required _i1.UuidValue userId,
    String? businessName,
    String? businessDescription,
    String? businessCategory,
    String? businessLogoUrl,
    String? businessBannerUrl,
    String? supportEmail,
    String? supportPhone,
  }) => caller.callServerEndpoint<_i23.VendorProfile?>(
    'user',
    'updateVendorProfile',
    {
      'userId': userId,
      'businessName': businessName,
      'businessDescription': businessDescription,
      'businessCategory': businessCategory,
      'businessLogoUrl': businessLogoUrl,
      'businessBannerUrl': businessBannerUrl,
      'supportEmail': supportEmail,
      'supportPhone': supportPhone,
    },
  );

  /// Add address
  _i2.Future<_i24.Address?> addAddress({
    required _i1.UuidValue userId,
    required String label,
    required String recipientName,
    required String phoneNumber,
    required String addressLine1,
    String? addressLine2,
    required String city,
    required String state,
    required String country,
    required String postalCode,
    String? landmark,
    required bool isDefault,
    double? latitude,
    double? longitude,
  }) => caller.callServerEndpoint<_i24.Address?>(
    'user',
    'addAddress',
    {
      'userId': userId,
      'label': label,
      'recipientName': recipientName,
      'phoneNumber': phoneNumber,
      'addressLine1': addressLine1,
      'addressLine2': addressLine2,
      'city': city,
      'state': state,
      'country': country,
      'postalCode': postalCode,
      'landmark': landmark,
      'isDefault': isDefault,
      'latitude': latitude,
      'longitude': longitude,
    },
  );

  /// Get user addresses
  _i2.Future<List<_i24.Address>> getUserAddresses(_i1.UuidValue userId) =>
      caller.callServerEndpoint<List<_i24.Address>>(
        'user',
        'getUserAddresses',
        {'userId': userId},
      );

  /// Set default address
  _i2.Future<bool> setDefaultAddress({
    required _i1.UuidValue userId,
    required _i1.UuidValue addressId,
  }) => caller.callServerEndpoint<bool>(
    'user',
    'setDefaultAddress',
    {
      'userId': userId,
      'addressId': addressId,
    },
  );
}

/// Endpoint to handle WhatsApp webhook callbacks
/// This is called from the web routes, not directly via RPC
/// {@category Endpoint}
class EndpointWhatsAppWebhook extends _i1.EndpointRef {
  EndpointWhatsAppWebhook(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'whatsAppWebhook';

  /// Handle webhook verification (GET request)
  /// Called from WhatsAppVerifyRoute
  _i2.Future<Map<String, dynamic>> verifyWebhook({
    String? mode,
    String? token,
    String? challenge,
  }) => caller.callServerEndpoint<Map<String, dynamic>>(
    'whatsAppWebhook',
    'verifyWebhook',
    {
      'mode': mode,
      'token': token,
      'challenge': challenge,
    },
  );

  /// Handle incoming webhook (POST request)
  /// Called from WhatsAppWebhookRoute
  _i2.Future<Map<String, dynamic>> processWebhook(
    Map<String, dynamic> payload,
  ) => caller.callServerEndpoint<Map<String, dynamic>>(
    'whatsAppWebhook',
    'processWebhook',
    {'payload': payload},
  );
}

class Client extends _i1.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    @Deprecated(
      'Use authKeyProvider instead. This will be removed in future releases.',
    )
    super.authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )?
    onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
         host,
         _i25.Protocol(),
         securityContext: securityContext,
         streamingConnectionTimeout: streamingConnectionTimeout,
         connectionTimeout: connectionTimeout,
         onFailedCall: onFailedCall,
         onSucceededCall: onSucceededCall,
         disconnectStreamsOnLostInternetConnection:
             disconnectStreamsOnLostInternetConnection,
       ) {
    analytics = EndpointAnalytics(this);
    auth = EndpointAuth(this);
    bot = EndpointBot(this);
    cart = EndpointCart(this);
    order = EndpointOrder(this);
    product = EndpointProduct(this);
    subscription = EndpointSubscription(this);
    telegramWebhook = EndpointTelegramWebhook(this);
    usage = EndpointUsage(this);
    user = EndpointUser(this);
    whatsAppWebhook = EndpointWhatsAppWebhook(this);
  }

  late final EndpointAnalytics analytics;

  late final EndpointAuth auth;

  late final EndpointBot bot;

  late final EndpointCart cart;

  late final EndpointOrder order;

  late final EndpointProduct product;

  late final EndpointSubscription subscription;

  late final EndpointTelegramWebhook telegramWebhook;

  late final EndpointUsage usage;

  late final EndpointUser user;

  late final EndpointWhatsAppWebhook whatsAppWebhook;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
    'analytics': analytics,
    'auth': auth,
    'bot': bot,
    'cart': cart,
    'order': order,
    'product': product,
    'subscription': subscription,
    'telegramWebhook': telegramWebhook,
    'usage': usage,
    'user': user,
    'whatsAppWebhook': whatsAppWebhook,
  };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
