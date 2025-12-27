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
import 'analytics/ai_conversation_usage.dart' as _i2;
import 'analytics/breach_severity.dart' as _i3;
import 'analytics/customer_usage_pattern.dart' as _i4;
import 'analytics/empty.dart' as _i5;
import 'analytics/limit_breach.dart' as _i6;
import 'analytics/platform_analytics.dart' as _i7;
import 'analytics/product_analytics.dart' as _i8;
import 'analytics/product_view_tracking.dart' as _i9;
import 'analytics/tool_usage_log.dart' as _i10;
import 'analytics/user_analytics.dart' as _i11;
import 'analytics/vendor_analytics.dart' as _i12;
import 'messaging/bot_interaction.dart' as _i13;
import 'messaging/conversation.dart' as _i14;
import 'messaging/conversation_status.dart' as _i15;
import 'messaging/message.dart' as _i16;
import 'messaging/message_type.dart' as _i17;
import 'messaging/notification.dart' as _i18;
import 'messaging/platfom_type.dart' as _i19;
import 'messaging/quick_reply.dart' as _i20;
import 'messaging/template_message.dart' as _i21;
import 'order/cart.dart' as _i22;
import 'order/cart_item.dart' as _i23;
import 'order/order.dart' as _i24;
import 'order/order_item.dart' as _i25;
import 'order/order_status.dart' as _i26;
import 'order/payment_method.dart' as _i27;
import 'order/payment_status.dart' as _i28;
import 'order/payment_transaction.dart' as _i29;
import 'order/refund.dart' as _i30;
import 'product/category.dart' as _i31;
import 'product/product.dart' as _i32;
import 'product/product_condition.dart' as _i33;
import 'product/product_review.dart' as _i34;
import 'product/product_status.dart' as _i35;
import 'product/product_variant.dart' as _i36;
import 'product/wishlist.dart' as _i37;
import 'product/wishlist_item.dart' as _i38;
import 'subscription/alert_type.dart' as _i39;
import 'subscription/billing_cycle_summary.dart' as _i40;
import 'subscription/daily_usage_tracker.dart' as _i41;
import 'subscription/limit_type.dart' as _i42;
import 'subscription/subscription.dart' as _i43;
import 'subscription/subscription_event.dart' as _i44;
import 'subscription/subscription_invoice.dart' as _i45;
import 'subscription/tier_featur.dart' as _i46;
import 'subscription/tool_usage_limit.dart' as _i47;
import 'subscription/usage_alert.dart' as _i48;
import 'subscription/usage_class.dart' as _i49;
import 'subscription/usage_record.dart' as _i50;
import 'user/address.dart' as _i51;
import 'user/auth_session.dart' as _i52;
import 'user/customer_policy.dart' as _i53;
import 'user/customer_profile.dart' as _i54;
import 'user/subscription_tier.dart' as _i55;
import 'user/user.dart' as _i56;
import 'user/user_status.dart' as _i57;
import 'user/user_type.dart' as _i58;
import 'user/vendor_profile.dart' as _i59;
import 'package:asami_client/src/protocol/analytics/vendor_analytics.dart'
    as _i60;
import 'package:asami_client/src/protocol/analytics/product_analytics.dart'
    as _i61;
import 'package:asami_client/src/protocol/product/product.dart' as _i62;
import 'package:asami_client/src/protocol/order/order_item.dart' as _i63;
import 'package:asami_client/src/protocol/order/order.dart' as _i64;
import 'package:asami_client/src/protocol/subscription/usage_record.dart'
    as _i65;
import 'package:asami_client/src/protocol/user/address.dart' as _i66;
export 'analytics/ai_conversation_usage.dart';
export 'analytics/breach_severity.dart';
export 'analytics/customer_usage_pattern.dart';
export 'analytics/empty.dart';
export 'analytics/limit_breach.dart';
export 'analytics/platform_analytics.dart';
export 'analytics/product_analytics.dart';
export 'analytics/product_view_tracking.dart';
export 'analytics/tool_usage_log.dart';
export 'analytics/user_analytics.dart';
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
export 'subscription/alert_type.dart';
export 'subscription/billing_cycle_summary.dart';
export 'subscription/daily_usage_tracker.dart';
export 'subscription/limit_type.dart';
export 'subscription/subscription.dart';
export 'subscription/subscription_event.dart';
export 'subscription/subscription_invoice.dart';
export 'subscription/tier_featur.dart';
export 'subscription/tool_usage_limit.dart';
export 'subscription/usage_alert.dart';
export 'subscription/usage_class.dart';
export 'subscription/usage_record.dart';
export 'user/address.dart';
export 'user/auth_session.dart';
export 'user/customer_policy.dart';
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

  static String? getClassNameFromObjectJson(dynamic data) {
    if (data is! Map) return null;
    final className = data['__className__'] as String?;
    return className;
  }

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;

    final dataClassName = getClassNameFromObjectJson(data);
    if (dataClassName != null && dataClassName != getClassNameForType(t)) {
      try {
        return deserializeByClassName({
          'className': dataClassName,
          'data': data,
        });
      } on FormatException catch (_) {
        // If the className is not recognized (e.g., older client receiving
        // data with a new subtype), fall back to deserializing without the
        // className, using the expected type T.
      }
    }

    if (t == _i2.AIConversationUsage) {
      return _i2.AIConversationUsage.fromJson(data) as T;
    }
    if (t == _i3.BreachSeverity) {
      return _i3.BreachSeverity.fromJson(data) as T;
    }
    if (t == _i4.CustomerUsagePattern) {
      return _i4.CustomerUsagePattern.fromJson(data) as T;
    }
    if (t == _i5.EmptyModel) {
      return _i5.EmptyModel.fromJson(data) as T;
    }
    if (t == _i6.LimitBreachLog) {
      return _i6.LimitBreachLog.fromJson(data) as T;
    }
    if (t == _i7.PlatformAnalytics) {
      return _i7.PlatformAnalytics.fromJson(data) as T;
    }
    if (t == _i8.ProductAnalytics) {
      return _i8.ProductAnalytics.fromJson(data) as T;
    }
    if (t == _i9.ProductView) {
      return _i9.ProductView.fromJson(data) as T;
    }
    if (t == _i10.ToolUsageLog) {
      return _i10.ToolUsageLog.fromJson(data) as T;
    }
    if (t == _i11.UserActivity) {
      return _i11.UserActivity.fromJson(data) as T;
    }
    if (t == _i12.VendorAnalytics) {
      return _i12.VendorAnalytics.fromJson(data) as T;
    }
    if (t == _i13.BotInteraction) {
      return _i13.BotInteraction.fromJson(data) as T;
    }
    if (t == _i14.Conversation) {
      return _i14.Conversation.fromJson(data) as T;
    }
    if (t == _i15.ConversationStatus) {
      return _i15.ConversationStatus.fromJson(data) as T;
    }
    if (t == _i16.Message) {
      return _i16.Message.fromJson(data) as T;
    }
    if (t == _i17.MessageType) {
      return _i17.MessageType.fromJson(data) as T;
    }
    if (t == _i18.Notification) {
      return _i18.Notification.fromJson(data) as T;
    }
    if (t == _i19.PlatformType) {
      return _i19.PlatformType.fromJson(data) as T;
    }
    if (t == _i20.QuickReply) {
      return _i20.QuickReply.fromJson(data) as T;
    }
    if (t == _i21.TemplateMessage) {
      return _i21.TemplateMessage.fromJson(data) as T;
    }
    if (t == _i22.Cart) {
      return _i22.Cart.fromJson(data) as T;
    }
    if (t == _i23.CartItem) {
      return _i23.CartItem.fromJson(data) as T;
    }
    if (t == _i24.Order) {
      return _i24.Order.fromJson(data) as T;
    }
    if (t == _i25.OrderItem) {
      return _i25.OrderItem.fromJson(data) as T;
    }
    if (t == _i26.OrderStatus) {
      return _i26.OrderStatus.fromJson(data) as T;
    }
    if (t == _i27.PaymentMethod) {
      return _i27.PaymentMethod.fromJson(data) as T;
    }
    if (t == _i28.PaymentStatus) {
      return _i28.PaymentStatus.fromJson(data) as T;
    }
    if (t == _i29.PaymentTransaction) {
      return _i29.PaymentTransaction.fromJson(data) as T;
    }
    if (t == _i30.Refund) {
      return _i30.Refund.fromJson(data) as T;
    }
    if (t == _i31.Category) {
      return _i31.Category.fromJson(data) as T;
    }
    if (t == _i32.Product) {
      return _i32.Product.fromJson(data) as T;
    }
    if (t == _i33.ProductCondition) {
      return _i33.ProductCondition.fromJson(data) as T;
    }
    if (t == _i34.ProductReview) {
      return _i34.ProductReview.fromJson(data) as T;
    }
    if (t == _i35.ProductStatus) {
      return _i35.ProductStatus.fromJson(data) as T;
    }
    if (t == _i36.ProductVariant) {
      return _i36.ProductVariant.fromJson(data) as T;
    }
    if (t == _i37.Wishlist) {
      return _i37.Wishlist.fromJson(data) as T;
    }
    if (t == _i38.WishlistItem) {
      return _i38.WishlistItem.fromJson(data) as T;
    }
    if (t == _i39.AlertType) {
      return _i39.AlertType.fromJson(data) as T;
    }
    if (t == _i40.BillingCycleSummary) {
      return _i40.BillingCycleSummary.fromJson(data) as T;
    }
    if (t == _i41.DailyUsageTracker) {
      return _i41.DailyUsageTracker.fromJson(data) as T;
    }
    if (t == _i42.LimitType) {
      return _i42.LimitType.fromJson(data) as T;
    }
    if (t == _i43.Subscription) {
      return _i43.Subscription.fromJson(data) as T;
    }
    if (t == _i44.SubscriptionEvent) {
      return _i44.SubscriptionEvent.fromJson(data) as T;
    }
    if (t == _i45.SubscriptionInvoice) {
      return _i45.SubscriptionInvoice.fromJson(data) as T;
    }
    if (t == _i46.TierFeature) {
      return _i46.TierFeature.fromJson(data) as T;
    }
    if (t == _i47.ToolUsageLimit) {
      return _i47.ToolUsageLimit.fromJson(data) as T;
    }
    if (t == _i48.UsageAlert) {
      return _i48.UsageAlert.fromJson(data) as T;
    }
    if (t == _i49.UsageClass) {
      return _i49.UsageClass.fromJson(data) as T;
    }
    if (t == _i50.UsageRecord) {
      return _i50.UsageRecord.fromJson(data) as T;
    }
    if (t == _i51.Address) {
      return _i51.Address.fromJson(data) as T;
    }
    if (t == _i52.AuthSession) {
      return _i52.AuthSession.fromJson(data) as T;
    }
    if (t == _i53.CustomerAIPolicy) {
      return _i53.CustomerAIPolicy.fromJson(data) as T;
    }
    if (t == _i54.CustomerProfile) {
      return _i54.CustomerProfile.fromJson(data) as T;
    }
    if (t == _i55.SubscriptionTier) {
      return _i55.SubscriptionTier.fromJson(data) as T;
    }
    if (t == _i56.User) {
      return _i56.User.fromJson(data) as T;
    }
    if (t == _i57.UserStatus) {
      return _i57.UserStatus.fromJson(data) as T;
    }
    if (t == _i58.UserType) {
      return _i58.UserType.fromJson(data) as T;
    }
    if (t == _i59.VendorProfile) {
      return _i59.VendorProfile.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.AIConversationUsage?>()) {
      return (data != null ? _i2.AIConversationUsage.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i3.BreachSeverity?>()) {
      return (data != null ? _i3.BreachSeverity.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.CustomerUsagePattern?>()) {
      return (data != null ? _i4.CustomerUsagePattern.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i5.EmptyModel?>()) {
      return (data != null ? _i5.EmptyModel.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.LimitBreachLog?>()) {
      return (data != null ? _i6.LimitBreachLog.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.PlatformAnalytics?>()) {
      return (data != null ? _i7.PlatformAnalytics.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.ProductAnalytics?>()) {
      return (data != null ? _i8.ProductAnalytics.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.ProductView?>()) {
      return (data != null ? _i9.ProductView.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.ToolUsageLog?>()) {
      return (data != null ? _i10.ToolUsageLog.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.UserActivity?>()) {
      return (data != null ? _i11.UserActivity.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.VendorAnalytics?>()) {
      return (data != null ? _i12.VendorAnalytics.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.BotInteraction?>()) {
      return (data != null ? _i13.BotInteraction.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.Conversation?>()) {
      return (data != null ? _i14.Conversation.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.ConversationStatus?>()) {
      return (data != null ? _i15.ConversationStatus.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i16.Message?>()) {
      return (data != null ? _i16.Message.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.MessageType?>()) {
      return (data != null ? _i17.MessageType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.Notification?>()) {
      return (data != null ? _i18.Notification.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.PlatformType?>()) {
      return (data != null ? _i19.PlatformType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.QuickReply?>()) {
      return (data != null ? _i20.QuickReply.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i21.TemplateMessage?>()) {
      return (data != null ? _i21.TemplateMessage.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.Cart?>()) {
      return (data != null ? _i22.Cart.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i23.CartItem?>()) {
      return (data != null ? _i23.CartItem.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i24.Order?>()) {
      return (data != null ? _i24.Order.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i25.OrderItem?>()) {
      return (data != null ? _i25.OrderItem.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i26.OrderStatus?>()) {
      return (data != null ? _i26.OrderStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i27.PaymentMethod?>()) {
      return (data != null ? _i27.PaymentMethod.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i28.PaymentStatus?>()) {
      return (data != null ? _i28.PaymentStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i29.PaymentTransaction?>()) {
      return (data != null ? _i29.PaymentTransaction.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i30.Refund?>()) {
      return (data != null ? _i30.Refund.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i31.Category?>()) {
      return (data != null ? _i31.Category.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i32.Product?>()) {
      return (data != null ? _i32.Product.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i33.ProductCondition?>()) {
      return (data != null ? _i33.ProductCondition.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i34.ProductReview?>()) {
      return (data != null ? _i34.ProductReview.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i35.ProductStatus?>()) {
      return (data != null ? _i35.ProductStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i36.ProductVariant?>()) {
      return (data != null ? _i36.ProductVariant.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i37.Wishlist?>()) {
      return (data != null ? _i37.Wishlist.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i38.WishlistItem?>()) {
      return (data != null ? _i38.WishlistItem.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i39.AlertType?>()) {
      return (data != null ? _i39.AlertType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i40.BillingCycleSummary?>()) {
      return (data != null ? _i40.BillingCycleSummary.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i41.DailyUsageTracker?>()) {
      return (data != null ? _i41.DailyUsageTracker.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i42.LimitType?>()) {
      return (data != null ? _i42.LimitType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i43.Subscription?>()) {
      return (data != null ? _i43.Subscription.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i44.SubscriptionEvent?>()) {
      return (data != null ? _i44.SubscriptionEvent.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i45.SubscriptionInvoice?>()) {
      return (data != null ? _i45.SubscriptionInvoice.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i46.TierFeature?>()) {
      return (data != null ? _i46.TierFeature.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i47.ToolUsageLimit?>()) {
      return (data != null ? _i47.ToolUsageLimit.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i48.UsageAlert?>()) {
      return (data != null ? _i48.UsageAlert.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i49.UsageClass?>()) {
      return (data != null ? _i49.UsageClass.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i50.UsageRecord?>()) {
      return (data != null ? _i50.UsageRecord.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i51.Address?>()) {
      return (data != null ? _i51.Address.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i52.AuthSession?>()) {
      return (data != null ? _i52.AuthSession.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i53.CustomerAIPolicy?>()) {
      return (data != null ? _i53.CustomerAIPolicy.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i54.CustomerProfile?>()) {
      return (data != null ? _i54.CustomerProfile.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i55.SubscriptionTier?>()) {
      return (data != null ? _i55.SubscriptionTier.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i56.User?>()) {
      return (data != null ? _i56.User.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i57.UserStatus?>()) {
      return (data != null ? _i57.UserStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i58.UserType?>()) {
      return (data != null ? _i58.UserType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i59.VendorProfile?>()) {
      return (data != null ? _i59.VendorProfile.fromJson(data) : null) as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<String>(e)).toList()
              : null)
          as T;
    }
    if (t == List<_i60.VendorAnalytics>) {
      return (data as List)
              .map((e) => deserialize<_i60.VendorAnalytics>(e))
              .toList()
          as T;
    }
    if (t == Map<String, dynamic>) {
      return (data as Map).map(
            (k, v) => MapEntry(deserialize<String>(k), deserialize<dynamic>(v)),
          )
          as T;
    }
    if (t == List<_i61.ProductAnalytics>) {
      return (data as List)
              .map((e) => deserialize<_i61.ProductAnalytics>(e))
              .toList()
          as T;
    }
    if (t == List<_i62.Product>) {
      return (data as List).map((e) => deserialize<_i62.Product>(e)).toList()
          as T;
    }
    if (t == Map<String, double>) {
      return (data as Map).map(
            (k, v) => MapEntry(deserialize<String>(k), deserialize<double>(v)),
          )
          as T;
    }
    if (t == _i1.getType<Map<String, dynamic>?>()) {
      return (data != null
              ? (data as Map).map(
                  (k, v) =>
                      MapEntry(deserialize<String>(k), deserialize<dynamic>(v)),
                )
              : null)
          as T;
    }
    if (t == List<_i63.OrderItem>) {
      return (data as List).map((e) => deserialize<_i63.OrderItem>(e)).toList()
          as T;
    }
    if (t == List<_i64.Order>) {
      return (data as List).map((e) => deserialize<_i64.Order>(e)).toList()
          as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<String>(e)).toList()
              : null)
          as T;
    }
    if (t == List<_i65.UsageRecord>) {
      return (data as List)
              .map((e) => deserialize<_i65.UsageRecord>(e))
              .toList()
          as T;
    }
    if (t == List<_i66.Address>) {
      return (data as List).map((e) => deserialize<_i66.Address>(e)).toList()
          as T;
    }
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i2.AIConversationUsage => 'AIConversationUsage',
      _i3.BreachSeverity => 'BreachSeverity',
      _i4.CustomerUsagePattern => 'CustomerUsagePattern',
      _i5.EmptyModel => 'EmptyModel',
      _i6.LimitBreachLog => 'LimitBreachLog',
      _i7.PlatformAnalytics => 'PlatformAnalytics',
      _i8.ProductAnalytics => 'ProductAnalytics',
      _i9.ProductView => 'ProductView',
      _i10.ToolUsageLog => 'ToolUsageLog',
      _i11.UserActivity => 'UserActivity',
      _i12.VendorAnalytics => 'VendorAnalytics',
      _i13.BotInteraction => 'BotInteraction',
      _i14.Conversation => 'Conversation',
      _i15.ConversationStatus => 'ConversationStatus',
      _i16.Message => 'Message',
      _i17.MessageType => 'MessageType',
      _i18.Notification => 'Notification',
      _i19.PlatformType => 'PlatformType',
      _i20.QuickReply => 'QuickReply',
      _i21.TemplateMessage => 'TemplateMessage',
      _i22.Cart => 'Cart',
      _i23.CartItem => 'CartItem',
      _i24.Order => 'Order',
      _i25.OrderItem => 'OrderItem',
      _i26.OrderStatus => 'OrderStatus',
      _i27.PaymentMethod => 'PaymentMethod',
      _i28.PaymentStatus => 'PaymentStatus',
      _i29.PaymentTransaction => 'PaymentTransaction',
      _i30.Refund => 'Refund',
      _i31.Category => 'Category',
      _i32.Product => 'Product',
      _i33.ProductCondition => 'ProductCondition',
      _i34.ProductReview => 'ProductReview',
      _i35.ProductStatus => 'ProductStatus',
      _i36.ProductVariant => 'ProductVariant',
      _i37.Wishlist => 'Wishlist',
      _i38.WishlistItem => 'WishlistItem',
      _i39.AlertType => 'AlertType',
      _i40.BillingCycleSummary => 'BillingCycleSummary',
      _i41.DailyUsageTracker => 'DailyUsageTracker',
      _i42.LimitType => 'LimitType',
      _i43.Subscription => 'Subscription',
      _i44.SubscriptionEvent => 'SubscriptionEvent',
      _i45.SubscriptionInvoice => 'SubscriptionInvoice',
      _i46.TierFeature => 'TierFeature',
      _i47.ToolUsageLimit => 'ToolUsageLimit',
      _i48.UsageAlert => 'UsageAlert',
      _i49.UsageClass => 'UsageClass',
      _i50.UsageRecord => 'UsageRecord',
      _i51.Address => 'Address',
      _i52.AuthSession => 'AuthSession',
      _i53.CustomerAIPolicy => 'CustomerAIPolicy',
      _i54.CustomerProfile => 'CustomerProfile',
      _i55.SubscriptionTier => 'SubscriptionTier',
      _i56.User => 'User',
      _i57.UserStatus => 'UserStatus',
      _i58.UserType => 'UserType',
      _i59.VendorProfile => 'VendorProfile',
      _ => null,
    };
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;

    if (data is Map<String, dynamic> && data['__className__'] is String) {
      return (data['__className__'] as String).replaceFirst('asami.', '');
    }

    switch (data) {
      case _i2.AIConversationUsage():
        return 'AIConversationUsage';
      case _i3.BreachSeverity():
        return 'BreachSeverity';
      case _i4.CustomerUsagePattern():
        return 'CustomerUsagePattern';
      case _i5.EmptyModel():
        return 'EmptyModel';
      case _i6.LimitBreachLog():
        return 'LimitBreachLog';
      case _i7.PlatformAnalytics():
        return 'PlatformAnalytics';
      case _i8.ProductAnalytics():
        return 'ProductAnalytics';
      case _i9.ProductView():
        return 'ProductView';
      case _i10.ToolUsageLog():
        return 'ToolUsageLog';
      case _i11.UserActivity():
        return 'UserActivity';
      case _i12.VendorAnalytics():
        return 'VendorAnalytics';
      case _i13.BotInteraction():
        return 'BotInteraction';
      case _i14.Conversation():
        return 'Conversation';
      case _i15.ConversationStatus():
        return 'ConversationStatus';
      case _i16.Message():
        return 'Message';
      case _i17.MessageType():
        return 'MessageType';
      case _i18.Notification():
        return 'Notification';
      case _i19.PlatformType():
        return 'PlatformType';
      case _i20.QuickReply():
        return 'QuickReply';
      case _i21.TemplateMessage():
        return 'TemplateMessage';
      case _i22.Cart():
        return 'Cart';
      case _i23.CartItem():
        return 'CartItem';
      case _i24.Order():
        return 'Order';
      case _i25.OrderItem():
        return 'OrderItem';
      case _i26.OrderStatus():
        return 'OrderStatus';
      case _i27.PaymentMethod():
        return 'PaymentMethod';
      case _i28.PaymentStatus():
        return 'PaymentStatus';
      case _i29.PaymentTransaction():
        return 'PaymentTransaction';
      case _i30.Refund():
        return 'Refund';
      case _i31.Category():
        return 'Category';
      case _i32.Product():
        return 'Product';
      case _i33.ProductCondition():
        return 'ProductCondition';
      case _i34.ProductReview():
        return 'ProductReview';
      case _i35.ProductStatus():
        return 'ProductStatus';
      case _i36.ProductVariant():
        return 'ProductVariant';
      case _i37.Wishlist():
        return 'Wishlist';
      case _i38.WishlistItem():
        return 'WishlistItem';
      case _i39.AlertType():
        return 'AlertType';
      case _i40.BillingCycleSummary():
        return 'BillingCycleSummary';
      case _i41.DailyUsageTracker():
        return 'DailyUsageTracker';
      case _i42.LimitType():
        return 'LimitType';
      case _i43.Subscription():
        return 'Subscription';
      case _i44.SubscriptionEvent():
        return 'SubscriptionEvent';
      case _i45.SubscriptionInvoice():
        return 'SubscriptionInvoice';
      case _i46.TierFeature():
        return 'TierFeature';
      case _i47.ToolUsageLimit():
        return 'ToolUsageLimit';
      case _i48.UsageAlert():
        return 'UsageAlert';
      case _i49.UsageClass():
        return 'UsageClass';
      case _i50.UsageRecord():
        return 'UsageRecord';
      case _i51.Address():
        return 'Address';
      case _i52.AuthSession():
        return 'AuthSession';
      case _i53.CustomerAIPolicy():
        return 'CustomerAIPolicy';
      case _i54.CustomerProfile():
        return 'CustomerProfile';
      case _i55.SubscriptionTier():
        return 'SubscriptionTier';
      case _i56.User():
        return 'User';
      case _i57.UserStatus():
        return 'UserStatus';
      case _i58.UserType():
        return 'UserType';
      case _i59.VendorProfile():
        return 'VendorProfile';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'AIConversationUsage') {
      return deserialize<_i2.AIConversationUsage>(data['data']);
    }
    if (dataClassName == 'BreachSeverity') {
      return deserialize<_i3.BreachSeverity>(data['data']);
    }
    if (dataClassName == 'CustomerUsagePattern') {
      return deserialize<_i4.CustomerUsagePattern>(data['data']);
    }
    if (dataClassName == 'EmptyModel') {
      return deserialize<_i5.EmptyModel>(data['data']);
    }
    if (dataClassName == 'LimitBreachLog') {
      return deserialize<_i6.LimitBreachLog>(data['data']);
    }
    if (dataClassName == 'PlatformAnalytics') {
      return deserialize<_i7.PlatformAnalytics>(data['data']);
    }
    if (dataClassName == 'ProductAnalytics') {
      return deserialize<_i8.ProductAnalytics>(data['data']);
    }
    if (dataClassName == 'ProductView') {
      return deserialize<_i9.ProductView>(data['data']);
    }
    if (dataClassName == 'ToolUsageLog') {
      return deserialize<_i10.ToolUsageLog>(data['data']);
    }
    if (dataClassName == 'UserActivity') {
      return deserialize<_i11.UserActivity>(data['data']);
    }
    if (dataClassName == 'VendorAnalytics') {
      return deserialize<_i12.VendorAnalytics>(data['data']);
    }
    if (dataClassName == 'BotInteraction') {
      return deserialize<_i13.BotInteraction>(data['data']);
    }
    if (dataClassName == 'Conversation') {
      return deserialize<_i14.Conversation>(data['data']);
    }
    if (dataClassName == 'ConversationStatus') {
      return deserialize<_i15.ConversationStatus>(data['data']);
    }
    if (dataClassName == 'Message') {
      return deserialize<_i16.Message>(data['data']);
    }
    if (dataClassName == 'MessageType') {
      return deserialize<_i17.MessageType>(data['data']);
    }
    if (dataClassName == 'Notification') {
      return deserialize<_i18.Notification>(data['data']);
    }
    if (dataClassName == 'PlatformType') {
      return deserialize<_i19.PlatformType>(data['data']);
    }
    if (dataClassName == 'QuickReply') {
      return deserialize<_i20.QuickReply>(data['data']);
    }
    if (dataClassName == 'TemplateMessage') {
      return deserialize<_i21.TemplateMessage>(data['data']);
    }
    if (dataClassName == 'Cart') {
      return deserialize<_i22.Cart>(data['data']);
    }
    if (dataClassName == 'CartItem') {
      return deserialize<_i23.CartItem>(data['data']);
    }
    if (dataClassName == 'Order') {
      return deserialize<_i24.Order>(data['data']);
    }
    if (dataClassName == 'OrderItem') {
      return deserialize<_i25.OrderItem>(data['data']);
    }
    if (dataClassName == 'OrderStatus') {
      return deserialize<_i26.OrderStatus>(data['data']);
    }
    if (dataClassName == 'PaymentMethod') {
      return deserialize<_i27.PaymentMethod>(data['data']);
    }
    if (dataClassName == 'PaymentStatus') {
      return deserialize<_i28.PaymentStatus>(data['data']);
    }
    if (dataClassName == 'PaymentTransaction') {
      return deserialize<_i29.PaymentTransaction>(data['data']);
    }
    if (dataClassName == 'Refund') {
      return deserialize<_i30.Refund>(data['data']);
    }
    if (dataClassName == 'Category') {
      return deserialize<_i31.Category>(data['data']);
    }
    if (dataClassName == 'Product') {
      return deserialize<_i32.Product>(data['data']);
    }
    if (dataClassName == 'ProductCondition') {
      return deserialize<_i33.ProductCondition>(data['data']);
    }
    if (dataClassName == 'ProductReview') {
      return deserialize<_i34.ProductReview>(data['data']);
    }
    if (dataClassName == 'ProductStatus') {
      return deserialize<_i35.ProductStatus>(data['data']);
    }
    if (dataClassName == 'ProductVariant') {
      return deserialize<_i36.ProductVariant>(data['data']);
    }
    if (dataClassName == 'Wishlist') {
      return deserialize<_i37.Wishlist>(data['data']);
    }
    if (dataClassName == 'WishlistItem') {
      return deserialize<_i38.WishlistItem>(data['data']);
    }
    if (dataClassName == 'AlertType') {
      return deserialize<_i39.AlertType>(data['data']);
    }
    if (dataClassName == 'BillingCycleSummary') {
      return deserialize<_i40.BillingCycleSummary>(data['data']);
    }
    if (dataClassName == 'DailyUsageTracker') {
      return deserialize<_i41.DailyUsageTracker>(data['data']);
    }
    if (dataClassName == 'LimitType') {
      return deserialize<_i42.LimitType>(data['data']);
    }
    if (dataClassName == 'Subscription') {
      return deserialize<_i43.Subscription>(data['data']);
    }
    if (dataClassName == 'SubscriptionEvent') {
      return deserialize<_i44.SubscriptionEvent>(data['data']);
    }
    if (dataClassName == 'SubscriptionInvoice') {
      return deserialize<_i45.SubscriptionInvoice>(data['data']);
    }
    if (dataClassName == 'TierFeature') {
      return deserialize<_i46.TierFeature>(data['data']);
    }
    if (dataClassName == 'ToolUsageLimit') {
      return deserialize<_i47.ToolUsageLimit>(data['data']);
    }
    if (dataClassName == 'UsageAlert') {
      return deserialize<_i48.UsageAlert>(data['data']);
    }
    if (dataClassName == 'UsageClass') {
      return deserialize<_i49.UsageClass>(data['data']);
    }
    if (dataClassName == 'UsageRecord') {
      return deserialize<_i50.UsageRecord>(data['data']);
    }
    if (dataClassName == 'Address') {
      return deserialize<_i51.Address>(data['data']);
    }
    if (dataClassName == 'AuthSession') {
      return deserialize<_i52.AuthSession>(data['data']);
    }
    if (dataClassName == 'CustomerAIPolicy') {
      return deserialize<_i53.CustomerAIPolicy>(data['data']);
    }
    if (dataClassName == 'CustomerProfile') {
      return deserialize<_i54.CustomerProfile>(data['data']);
    }
    if (dataClassName == 'SubscriptionTier') {
      return deserialize<_i55.SubscriptionTier>(data['data']);
    }
    if (dataClassName == 'User') {
      return deserialize<_i56.User>(data['data']);
    }
    if (dataClassName == 'UserStatus') {
      return deserialize<_i57.UserStatus>(data['data']);
    }
    if (dataClassName == 'UserType') {
      return deserialize<_i58.UserType>(data['data']);
    }
    if (dataClassName == 'VendorProfile') {
      return deserialize<_i59.VendorProfile>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
