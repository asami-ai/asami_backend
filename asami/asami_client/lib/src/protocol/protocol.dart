/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'order/cart_item.dart' as _i2;
import 'analytics/product_analytics.dart' as _i3;
import 'analytics/vendor_analytics.dart' as _i4;
import 'messaging/bot_interaction.dart' as _i5;
import 'messaging/conversation.dart' as _i6;
import 'messaging/conversation_status.dart' as _i7;
import 'messaging/message.dart' as _i8;
import 'messaging/message_type.dart' as _i9;
import 'messaging/notification.dart' as _i10;
import 'messaging/platfom_type.dart' as _i11;
import 'messaging/quick_reply.dart' as _i12;
import 'messaging/template_message.dart' as _i13;
import 'order/cart.dart' as _i14;
import 'analytics/platform_analytics.dart' as _i15;
import 'order/order.dart' as _i16;
import 'order/order_item.dart' as _i17;
import 'order/order_status.dart' as _i18;
import 'order/payment_method.dart' as _i19;
import 'order/payment_status.dart' as _i20;
import 'order/payment_transaction.dart' as _i21;
import 'order/refund.dart' as _i22;
import 'product/category.dart' as _i23;
import 'product/product.dart' as _i24;
import 'product/product_condition.dart' as _i25;
import 'product/product_review.dart' as _i26;
import 'user/vendor_profile.dart' as _i27;
import 'product/product_variant.dart' as _i28;
import 'product/wishlist.dart' as _i29;
import 'product/wishlist_item.dart' as _i30;
import 'subscription/subscription.dart' as _i31;
import 'subscription/subscription_event.dart' as _i32;
import 'subscription/subscription_invoice.dart' as _i33;
import 'subscription/usage_record.dart' as _i34;
import 'user/address.dart' as _i35;
import 'user/customer_profile.dart' as _i36;
import 'user/subscription_tier.dart' as _i37;
import 'user/user.dart' as _i38;
import 'user/user_status.dart' as _i39;
import 'user/user_type.dart' as _i40;
import 'product/product_status.dart' as _i41;
import 'package:asami_client/src/protocol/analytics/vendor_analytics.dart'
    as _i42;
import 'package:asami_client/src/protocol/analytics/product_analytics.dart'
    as _i43;
import 'package:asami_client/src/protocol/product/product.dart' as _i44;
import 'package:asami_client/src/protocol/order/order_item.dart' as _i45;
import 'package:asami_client/src/protocol/order/order.dart' as _i46;
import 'package:asami_client/src/protocol/subscription/usage_record.dart'
    as _i47;
import 'package:asami_client/src/protocol/user/address.dart' as _i48;
export 'analytics/platform_analytics.dart';
export 'analytics/product_analytics.dart';
export 'analytics/vendor_analytics.dart';
export 'messaging/bot_interaction.dart';
export 'messaging/conversation.dart';
export 'messaging/conversation_status.dart';
export 'messaging/message.dart';
export 'messaging/message_type.dart';
export 'messaging/notification.dart';
export 'messaging/platfom_type.dart';
export 'messaging/quick_reply.dart';
export 'messaging/template_message.dart';
export 'order/cart.dart';
export 'order/cart_item.dart';
export 'order/order.dart';
export 'order/order_item.dart';
export 'order/order_status.dart';
export 'order/payment_method.dart';
export 'order/payment_status.dart';
export 'order/payment_transaction.dart';
export 'order/refund.dart';
export 'product/category.dart';
export 'product/product.dart';
export 'product/product_condition.dart';
export 'product/product_review.dart';
export 'product/product_status.dart';
export 'product/product_variant.dart';
export 'product/wishlist.dart';
export 'product/wishlist_item.dart';
export 'subscription/subscription.dart';
export 'subscription/subscription_event.dart';
export 'subscription/subscription_invoice.dart';
export 'subscription/usage_record.dart';
export 'user/address.dart';
export 'user/customer_profile.dart';
export 'user/subscription_tier.dart';
export 'user/user.dart';
export 'user/user_status.dart';
export 'user/user_type.dart';
export 'user/vendor_profile.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.CartItem) {
      return _i2.CartItem.fromJson(data) as T;
    }
    if (t == _i3.ProductAnalytics) {
      return _i3.ProductAnalytics.fromJson(data) as T;
    }
    if (t == _i4.VendorAnalytics) {
      return _i4.VendorAnalytics.fromJson(data) as T;
    }
    if (t == _i5.BotInteraction) {
      return _i5.BotInteraction.fromJson(data) as T;
    }
    if (t == _i6.Conversation) {
      return _i6.Conversation.fromJson(data) as T;
    }
    if (t == _i7.ConversationStatus) {
      return _i7.ConversationStatus.fromJson(data) as T;
    }
    if (t == _i8.Message) {
      return _i8.Message.fromJson(data) as T;
    }
    if (t == _i9.MessageType) {
      return _i9.MessageType.fromJson(data) as T;
    }
    if (t == _i10.Notification) {
      return _i10.Notification.fromJson(data) as T;
    }
    if (t == _i11.PlatformType) {
      return _i11.PlatformType.fromJson(data) as T;
    }
    if (t == _i12.QuickReply) {
      return _i12.QuickReply.fromJson(data) as T;
    }
    if (t == _i13.TemplateMessage) {
      return _i13.TemplateMessage.fromJson(data) as T;
    }
    if (t == _i14.Cart) {
      return _i14.Cart.fromJson(data) as T;
    }
    if (t == _i15.PlatformAnalytics) {
      return _i15.PlatformAnalytics.fromJson(data) as T;
    }
    if (t == _i16.Order) {
      return _i16.Order.fromJson(data) as T;
    }
    if (t == _i17.OrderItem) {
      return _i17.OrderItem.fromJson(data) as T;
    }
    if (t == _i18.OrderStatus) {
      return _i18.OrderStatus.fromJson(data) as T;
    }
    if (t == _i19.PaymentMethod) {
      return _i19.PaymentMethod.fromJson(data) as T;
    }
    if (t == _i20.PaymentStatus) {
      return _i20.PaymentStatus.fromJson(data) as T;
    }
    if (t == _i21.PaymentTransaction) {
      return _i21.PaymentTransaction.fromJson(data) as T;
    }
    if (t == _i22.Refund) {
      return _i22.Refund.fromJson(data) as T;
    }
    if (t == _i23.Category) {
      return _i23.Category.fromJson(data) as T;
    }
    if (t == _i24.Product) {
      return _i24.Product.fromJson(data) as T;
    }
    if (t == _i25.ProductCondition) {
      return _i25.ProductCondition.fromJson(data) as T;
    }
    if (t == _i26.ProductReview) {
      return _i26.ProductReview.fromJson(data) as T;
    }
    if (t == _i27.VendorProfile) {
      return _i27.VendorProfile.fromJson(data) as T;
    }
    if (t == _i28.ProductVariant) {
      return _i28.ProductVariant.fromJson(data) as T;
    }
    if (t == _i29.Wishlist) {
      return _i29.Wishlist.fromJson(data) as T;
    }
    if (t == _i30.WishlistItem) {
      return _i30.WishlistItem.fromJson(data) as T;
    }
    if (t == _i31.Subscription) {
      return _i31.Subscription.fromJson(data) as T;
    }
    if (t == _i32.SubscriptionEvent) {
      return _i32.SubscriptionEvent.fromJson(data) as T;
    }
    if (t == _i33.SubscriptionInvoice) {
      return _i33.SubscriptionInvoice.fromJson(data) as T;
    }
    if (t == _i34.UsageRecord) {
      return _i34.UsageRecord.fromJson(data) as T;
    }
    if (t == _i35.Address) {
      return _i35.Address.fromJson(data) as T;
    }
    if (t == _i36.CustomerProfile) {
      return _i36.CustomerProfile.fromJson(data) as T;
    }
    if (t == _i37.SubscriptionTier) {
      return _i37.SubscriptionTier.fromJson(data) as T;
    }
    if (t == _i38.User) {
      return _i38.User.fromJson(data) as T;
    }
    if (t == _i39.UserStatus) {
      return _i39.UserStatus.fromJson(data) as T;
    }
    if (t == _i40.UserType) {
      return _i40.UserType.fromJson(data) as T;
    }
    if (t == _i41.ProductStatus) {
      return _i41.ProductStatus.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.CartItem?>()) {
      return (data != null ? _i2.CartItem.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.ProductAnalytics?>()) {
      return (data != null ? _i3.ProductAnalytics.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.VendorAnalytics?>()) {
      return (data != null ? _i4.VendorAnalytics.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.BotInteraction?>()) {
      return (data != null ? _i5.BotInteraction.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.Conversation?>()) {
      return (data != null ? _i6.Conversation.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.ConversationStatus?>()) {
      return (data != null ? _i7.ConversationStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.Message?>()) {
      return (data != null ? _i8.Message.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.MessageType?>()) {
      return (data != null ? _i9.MessageType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.Notification?>()) {
      return (data != null ? _i10.Notification.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.PlatformType?>()) {
      return (data != null ? _i11.PlatformType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.QuickReply?>()) {
      return (data != null ? _i12.QuickReply.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.TemplateMessage?>()) {
      return (data != null ? _i13.TemplateMessage.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.Cart?>()) {
      return (data != null ? _i14.Cart.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.PlatformAnalytics?>()) {
      return (data != null ? _i15.PlatformAnalytics.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.Order?>()) {
      return (data != null ? _i16.Order.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.OrderItem?>()) {
      return (data != null ? _i17.OrderItem.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.OrderStatus?>()) {
      return (data != null ? _i18.OrderStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.PaymentMethod?>()) {
      return (data != null ? _i19.PaymentMethod.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.PaymentStatus?>()) {
      return (data != null ? _i20.PaymentStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i21.PaymentTransaction?>()) {
      return (data != null ? _i21.PaymentTransaction.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i22.Refund?>()) {
      return (data != null ? _i22.Refund.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i23.Category?>()) {
      return (data != null ? _i23.Category.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i24.Product?>()) {
      return (data != null ? _i24.Product.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i25.ProductCondition?>()) {
      return (data != null ? _i25.ProductCondition.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i26.ProductReview?>()) {
      return (data != null ? _i26.ProductReview.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i27.VendorProfile?>()) {
      return (data != null ? _i27.VendorProfile.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i28.ProductVariant?>()) {
      return (data != null ? _i28.ProductVariant.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i29.Wishlist?>()) {
      return (data != null ? _i29.Wishlist.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i30.WishlistItem?>()) {
      return (data != null ? _i30.WishlistItem.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i31.Subscription?>()) {
      return (data != null ? _i31.Subscription.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i32.SubscriptionEvent?>()) {
      return (data != null ? _i32.SubscriptionEvent.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i33.SubscriptionInvoice?>()) {
      return (data != null ? _i33.SubscriptionInvoice.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i34.UsageRecord?>()) {
      return (data != null ? _i34.UsageRecord.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i35.Address?>()) {
      return (data != null ? _i35.Address.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i36.CustomerProfile?>()) {
      return (data != null ? _i36.CustomerProfile.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i37.SubscriptionTier?>()) {
      return (data != null ? _i37.SubscriptionTier.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i38.User?>()) {
      return (data != null ? _i38.User.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i39.UserStatus?>()) {
      return (data != null ? _i39.UserStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i40.UserType?>()) {
      return (data != null ? _i40.UserType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i41.ProductStatus?>()) {
      return (data != null ? _i41.ProductStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as T;
    }
    if (t == List<_i42.VendorAnalytics>) {
      return (data as List)
          .map((e) => deserialize<_i42.VendorAnalytics>(e))
          .toList() as T;
    }
    if (t == Map<String, dynamic>) {
      return (data as Map).map((k, v) =>
          MapEntry(deserialize<String>(k), deserialize<dynamic>(v))) as T;
    }
    if (t == List<_i43.ProductAnalytics>) {
      return (data as List)
          .map((e) => deserialize<_i43.ProductAnalytics>(e))
          .toList() as T;
    }
    if (t == List<_i44.Product>) {
      return (data as List).map((e) => deserialize<_i44.Product>(e)).toList()
          as T;
    }
    if (t == Map<String, double>) {
      return (data as Map).map((k, v) =>
          MapEntry(deserialize<String>(k), deserialize<double>(v))) as T;
    }
    if (t == _i1.getType<Map<String, dynamic>?>()) {
      return (data != null
          ? (data as Map).map((k, v) =>
              MapEntry(deserialize<String>(k), deserialize<dynamic>(v)))
          : null) as T;
    }
    if (t == List<_i45.OrderItem>) {
      return (data as List).map((e) => deserialize<_i45.OrderItem>(e)).toList()
          as T;
    }
    if (t == List<_i46.Order>) {
      return (data as List).map((e) => deserialize<_i46.Order>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as T;
    }
    if (t == List<_i47.UsageRecord>) {
      return (data as List)
          .map((e) => deserialize<_i47.UsageRecord>(e))
          .toList() as T;
    }
    if (t == List<_i48.Address>) {
      return (data as List).map((e) => deserialize<_i48.Address>(e)).toList()
          as T;
    }
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i2.CartItem) {
      return 'CartItem';
    }
    if (data is _i3.ProductAnalytics) {
      return 'ProductAnalytics';
    }
    if (data is _i4.VendorAnalytics) {
      return 'VendorAnalytics';
    }
    if (data is _i5.BotInteraction) {
      return 'BotInteraction';
    }
    if (data is _i6.Conversation) {
      return 'Conversation';
    }
    if (data is _i7.ConversationStatus) {
      return 'ConversationStatus';
    }
    if (data is _i8.Message) {
      return 'Message';
    }
    if (data is _i9.MessageType) {
      return 'MessageType';
    }
    if (data is _i10.Notification) {
      return 'Notification';
    }
    if (data is _i11.PlatformType) {
      return 'PlatformType';
    }
    if (data is _i12.QuickReply) {
      return 'QuickReply';
    }
    if (data is _i13.TemplateMessage) {
      return 'TemplateMessage';
    }
    if (data is _i14.Cart) {
      return 'Cart';
    }
    if (data is _i15.PlatformAnalytics) {
      return 'PlatformAnalytics';
    }
    if (data is _i16.Order) {
      return 'Order';
    }
    if (data is _i17.OrderItem) {
      return 'OrderItem';
    }
    if (data is _i18.OrderStatus) {
      return 'OrderStatus';
    }
    if (data is _i19.PaymentMethod) {
      return 'PaymentMethod';
    }
    if (data is _i20.PaymentStatus) {
      return 'PaymentStatus';
    }
    if (data is _i21.PaymentTransaction) {
      return 'PaymentTransaction';
    }
    if (data is _i22.Refund) {
      return 'Refund';
    }
    if (data is _i23.Category) {
      return 'Category';
    }
    if (data is _i24.Product) {
      return 'Product';
    }
    if (data is _i25.ProductCondition) {
      return 'ProductCondition';
    }
    if (data is _i26.ProductReview) {
      return 'ProductReview';
    }
    if (data is _i27.VendorProfile) {
      return 'VendorProfile';
    }
    if (data is _i28.ProductVariant) {
      return 'ProductVariant';
    }
    if (data is _i29.Wishlist) {
      return 'Wishlist';
    }
    if (data is _i30.WishlistItem) {
      return 'WishlistItem';
    }
    if (data is _i31.Subscription) {
      return 'Subscription';
    }
    if (data is _i32.SubscriptionEvent) {
      return 'SubscriptionEvent';
    }
    if (data is _i33.SubscriptionInvoice) {
      return 'SubscriptionInvoice';
    }
    if (data is _i34.UsageRecord) {
      return 'UsageRecord';
    }
    if (data is _i35.Address) {
      return 'Address';
    }
    if (data is _i36.CustomerProfile) {
      return 'CustomerProfile';
    }
    if (data is _i37.SubscriptionTier) {
      return 'SubscriptionTier';
    }
    if (data is _i38.User) {
      return 'User';
    }
    if (data is _i39.UserStatus) {
      return 'UserStatus';
    }
    if (data is _i40.UserType) {
      return 'UserType';
    }
    if (data is _i41.ProductStatus) {
      return 'ProductStatus';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'CartItem') {
      return deserialize<_i2.CartItem>(data['data']);
    }
    if (dataClassName == 'ProductAnalytics') {
      return deserialize<_i3.ProductAnalytics>(data['data']);
    }
    if (dataClassName == 'VendorAnalytics') {
      return deserialize<_i4.VendorAnalytics>(data['data']);
    }
    if (dataClassName == 'BotInteraction') {
      return deserialize<_i5.BotInteraction>(data['data']);
    }
    if (dataClassName == 'Conversation') {
      return deserialize<_i6.Conversation>(data['data']);
    }
    if (dataClassName == 'ConversationStatus') {
      return deserialize<_i7.ConversationStatus>(data['data']);
    }
    if (dataClassName == 'Message') {
      return deserialize<_i8.Message>(data['data']);
    }
    if (dataClassName == 'MessageType') {
      return deserialize<_i9.MessageType>(data['data']);
    }
    if (dataClassName == 'Notification') {
      return deserialize<_i10.Notification>(data['data']);
    }
    if (dataClassName == 'PlatformType') {
      return deserialize<_i11.PlatformType>(data['data']);
    }
    if (dataClassName == 'QuickReply') {
      return deserialize<_i12.QuickReply>(data['data']);
    }
    if (dataClassName == 'TemplateMessage') {
      return deserialize<_i13.TemplateMessage>(data['data']);
    }
    if (dataClassName == 'Cart') {
      return deserialize<_i14.Cart>(data['data']);
    }
    if (dataClassName == 'PlatformAnalytics') {
      return deserialize<_i15.PlatformAnalytics>(data['data']);
    }
    if (dataClassName == 'Order') {
      return deserialize<_i16.Order>(data['data']);
    }
    if (dataClassName == 'OrderItem') {
      return deserialize<_i17.OrderItem>(data['data']);
    }
    if (dataClassName == 'OrderStatus') {
      return deserialize<_i18.OrderStatus>(data['data']);
    }
    if (dataClassName == 'PaymentMethod') {
      return deserialize<_i19.PaymentMethod>(data['data']);
    }
    if (dataClassName == 'PaymentStatus') {
      return deserialize<_i20.PaymentStatus>(data['data']);
    }
    if (dataClassName == 'PaymentTransaction') {
      return deserialize<_i21.PaymentTransaction>(data['data']);
    }
    if (dataClassName == 'Refund') {
      return deserialize<_i22.Refund>(data['data']);
    }
    if (dataClassName == 'Category') {
      return deserialize<_i23.Category>(data['data']);
    }
    if (dataClassName == 'Product') {
      return deserialize<_i24.Product>(data['data']);
    }
    if (dataClassName == 'ProductCondition') {
      return deserialize<_i25.ProductCondition>(data['data']);
    }
    if (dataClassName == 'ProductReview') {
      return deserialize<_i26.ProductReview>(data['data']);
    }
    if (dataClassName == 'VendorProfile') {
      return deserialize<_i27.VendorProfile>(data['data']);
    }
    if (dataClassName == 'ProductVariant') {
      return deserialize<_i28.ProductVariant>(data['data']);
    }
    if (dataClassName == 'Wishlist') {
      return deserialize<_i29.Wishlist>(data['data']);
    }
    if (dataClassName == 'WishlistItem') {
      return deserialize<_i30.WishlistItem>(data['data']);
    }
    if (dataClassName == 'Subscription') {
      return deserialize<_i31.Subscription>(data['data']);
    }
    if (dataClassName == 'SubscriptionEvent') {
      return deserialize<_i32.SubscriptionEvent>(data['data']);
    }
    if (dataClassName == 'SubscriptionInvoice') {
      return deserialize<_i33.SubscriptionInvoice>(data['data']);
    }
    if (dataClassName == 'UsageRecord') {
      return deserialize<_i34.UsageRecord>(data['data']);
    }
    if (dataClassName == 'Address') {
      return deserialize<_i35.Address>(data['data']);
    }
    if (dataClassName == 'CustomerProfile') {
      return deserialize<_i36.CustomerProfile>(data['data']);
    }
    if (dataClassName == 'SubscriptionTier') {
      return deserialize<_i37.SubscriptionTier>(data['data']);
    }
    if (dataClassName == 'User') {
      return deserialize<_i38.User>(data['data']);
    }
    if (dataClassName == 'UserStatus') {
      return deserialize<_i39.UserStatus>(data['data']);
    }
    if (dataClassName == 'UserType') {
      return deserialize<_i40.UserType>(data['data']);
    }
    if (dataClassName == 'ProductStatus') {
      return deserialize<_i41.ProductStatus>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
