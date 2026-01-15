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
import 'order/order_escrow.dart' as _i25;
import 'order/order_item.dart' as _i26;
import 'order/order_status.dart' as _i27;
import 'order/payment_method.dart' as _i28;
import 'order/payment_status.dart' as _i29;
import 'order/payment_transaction.dart' as _i30;
import 'order/refund.dart' as _i31;
import 'order/wallet_enums/escrow_status.dart' as _i32;
import 'order/wallet_enums/transaction_status.dart' as _i33;
import 'order/wallet_enums/wallet_transaction_type.dart' as _i34;
import 'order/wallet_enums/withdrawal_status.dart' as _i35;
import 'product/category.dart' as _i36;
import 'product/category_mapping.dart' as _i37;
import 'product/product.dart' as _i38;
import 'product/product_category.dart' as _i39;
import 'product/product_condition.dart' as _i40;
import 'product/product_review.dart' as _i41;
import 'product/product_status.dart' as _i42;
import 'product/product_variant.dart' as _i43;
import 'product/wishlist.dart' as _i44;
import 'product/wishlist_item.dart' as _i45;
import 'subscription/alert_type.dart' as _i46;
import 'subscription/billing_cycle_summary.dart' as _i47;
import 'subscription/daily_usage_tracker.dart' as _i48;
import 'subscription/limit_type.dart' as _i49;
import 'subscription/subscription.dart' as _i50;
import 'subscription/subscription_event.dart' as _i51;
import 'subscription/subscription_invoice.dart' as _i52;
import 'subscription/tier_featur.dart' as _i53;
import 'subscription/tool_usage_limit.dart' as _i54;
import 'subscription/usage_alert.dart' as _i55;
import 'subscription/usage_class.dart' as _i56;
import 'subscription/usage_record.dart' as _i57;
import 'user/address.dart' as _i58;
import 'user/auth_session.dart' as _i59;
import 'user/customer_policy.dart' as _i60;
import 'user/customer_profile.dart' as _i61;
import 'user/subscription_tier.dart' as _i62;
import 'user/user.dart' as _i63;
import 'user/user_status.dart' as _i64;
import 'user/user_type.dart' as _i65;
import 'user/vendor_profile.dart' as _i66;
import 'wallet/vendor_wallet.dart' as _i67;
import 'wallet/wallet_transaction.dart' as _i68;
import 'wallet/withdrawal_request.dart' as _i69;
import 'webhook/webhook_event.dart' as _i70;
import 'package:asami_client/src/protocol/analytics/vendor_analytics.dart'
    as _i71;
import 'package:asami_client/src/protocol/analytics/product_analytics.dart'
    as _i72;
import 'package:asami_client/src/protocol/product/product.dart' as _i73;
import 'package:asami_client/src/protocol/order/order_item.dart' as _i74;
import 'package:asami_client/src/protocol/order/order.dart' as _i75;
import 'package:asami_client/src/protocol/order/payment_transaction.dart'
    as _i76;
import 'package:asami_client/src/protocol/subscription/usage_record.dart'
    as _i77;
import 'package:asami_client/src/protocol/user/address.dart' as _i78;
import 'package:asami_client/src/protocol/wallet/withdrawal_request.dart'
    as _i79;
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
export 'order/order_escrow.dart';
export 'order/order_item.dart';
export 'order/order_status.dart';
export 'order/payment_method.dart';
export 'order/payment_status.dart';
export 'order/payment_transaction.dart';
export 'order/refund.dart';
export 'order/wallet_enums/escrow_status.dart';
export 'order/wallet_enums/transaction_status.dart';
export 'order/wallet_enums/wallet_transaction_type.dart';
export 'order/wallet_enums/withdrawal_status.dart';
export 'product/category.dart';
export 'product/category_mapping.dart';
export 'product/product.dart';
export 'product/product_category.dart';
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
export 'wallet/vendor_wallet.dart';
export 'wallet/wallet_transaction.dart';
export 'wallet/withdrawal_request.dart';
export 'webhook/webhook_event.dart';
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
    if (t == _i25.OrderEscrow) {
      return _i25.OrderEscrow.fromJson(data) as T;
    }
    if (t == _i26.OrderItem) {
      return _i26.OrderItem.fromJson(data) as T;
    }
    if (t == _i27.OrderStatus) {
      return _i27.OrderStatus.fromJson(data) as T;
    }
    if (t == _i28.PaymentMethod) {
      return _i28.PaymentMethod.fromJson(data) as T;
    }
    if (t == _i29.PaymentStatus) {
      return _i29.PaymentStatus.fromJson(data) as T;
    }
    if (t == _i30.PaymentTransaction) {
      return _i30.PaymentTransaction.fromJson(data) as T;
    }
    if (t == _i31.Refund) {
      return _i31.Refund.fromJson(data) as T;
    }
    if (t == _i32.EscrowStatus) {
      return _i32.EscrowStatus.fromJson(data) as T;
    }
    if (t == _i33.TransactionStatus) {
      return _i33.TransactionStatus.fromJson(data) as T;
    }
    if (t == _i34.WalletTransactionType) {
      return _i34.WalletTransactionType.fromJson(data) as T;
    }
    if (t == _i35.WithdrawalStatus) {
      return _i35.WithdrawalStatus.fromJson(data) as T;
    }
    if (t == _i36.Category) {
      return _i36.Category.fromJson(data) as T;
    }
    if (t == _i37.CategoryMapping) {
      return _i37.CategoryMapping.fromJson(data) as T;
    }
    if (t == _i38.Product) {
      return _i38.Product.fromJson(data) as T;
    }
    if (t == _i39.ProductCategory) {
      return _i39.ProductCategory.fromJson(data) as T;
    }
    if (t == _i40.ProductCondition) {
      return _i40.ProductCondition.fromJson(data) as T;
    }
    if (t == _i41.ProductReview) {
      return _i41.ProductReview.fromJson(data) as T;
    }
    if (t == _i42.ProductStatus) {
      return _i42.ProductStatus.fromJson(data) as T;
    }
    if (t == _i43.ProductVariant) {
      return _i43.ProductVariant.fromJson(data) as T;
    }
    if (t == _i44.Wishlist) {
      return _i44.Wishlist.fromJson(data) as T;
    }
    if (t == _i45.WishlistItem) {
      return _i45.WishlistItem.fromJson(data) as T;
    }
    if (t == _i46.AlertType) {
      return _i46.AlertType.fromJson(data) as T;
    }
    if (t == _i47.BillingCycleSummary) {
      return _i47.BillingCycleSummary.fromJson(data) as T;
    }
    if (t == _i48.DailyUsageTracker) {
      return _i48.DailyUsageTracker.fromJson(data) as T;
    }
    if (t == _i49.LimitType) {
      return _i49.LimitType.fromJson(data) as T;
    }
    if (t == _i50.Subscription) {
      return _i50.Subscription.fromJson(data) as T;
    }
    if (t == _i51.SubscriptionEvent) {
      return _i51.SubscriptionEvent.fromJson(data) as T;
    }
    if (t == _i52.SubscriptionInvoice) {
      return _i52.SubscriptionInvoice.fromJson(data) as T;
    }
    if (t == _i53.TierFeature) {
      return _i53.TierFeature.fromJson(data) as T;
    }
    if (t == _i54.ToolUsageLimit) {
      return _i54.ToolUsageLimit.fromJson(data) as T;
    }
    if (t == _i55.UsageAlert) {
      return _i55.UsageAlert.fromJson(data) as T;
    }
    if (t == _i56.UsageClass) {
      return _i56.UsageClass.fromJson(data) as T;
    }
    if (t == _i57.UsageRecord) {
      return _i57.UsageRecord.fromJson(data) as T;
    }
    if (t == _i58.Address) {
      return _i58.Address.fromJson(data) as T;
    }
    if (t == _i59.AuthSession) {
      return _i59.AuthSession.fromJson(data) as T;
    }
    if (t == _i60.CustomerAIPolicy) {
      return _i60.CustomerAIPolicy.fromJson(data) as T;
    }
    if (t == _i61.CustomerProfile) {
      return _i61.CustomerProfile.fromJson(data) as T;
    }
    if (t == _i62.SubscriptionTier) {
      return _i62.SubscriptionTier.fromJson(data) as T;
    }
    if (t == _i63.User) {
      return _i63.User.fromJson(data) as T;
    }
    if (t == _i64.UserStatus) {
      return _i64.UserStatus.fromJson(data) as T;
    }
    if (t == _i65.UserType) {
      return _i65.UserType.fromJson(data) as T;
    }
    if (t == _i66.VendorProfile) {
      return _i66.VendorProfile.fromJson(data) as T;
    }
    if (t == _i67.VendorWallet) {
      return _i67.VendorWallet.fromJson(data) as T;
    }
    if (t == _i68.WalletTransaction) {
      return _i68.WalletTransaction.fromJson(data) as T;
    }
    if (t == _i69.WithdrawalRequest) {
      return _i69.WithdrawalRequest.fromJson(data) as T;
    }
    if (t == _i70.WebhookEvent) {
      return _i70.WebhookEvent.fromJson(data) as T;
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
    if (t == _i1.getType<_i25.OrderEscrow?>()) {
      return (data != null ? _i25.OrderEscrow.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i26.OrderItem?>()) {
      return (data != null ? _i26.OrderItem.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i27.OrderStatus?>()) {
      return (data != null ? _i27.OrderStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i28.PaymentMethod?>()) {
      return (data != null ? _i28.PaymentMethod.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i29.PaymentStatus?>()) {
      return (data != null ? _i29.PaymentStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i30.PaymentTransaction?>()) {
      return (data != null ? _i30.PaymentTransaction.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i31.Refund?>()) {
      return (data != null ? _i31.Refund.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i32.EscrowStatus?>()) {
      return (data != null ? _i32.EscrowStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i33.TransactionStatus?>()) {
      return (data != null ? _i33.TransactionStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i34.WalletTransactionType?>()) {
      return (data != null ? _i34.WalletTransactionType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i35.WithdrawalStatus?>()) {
      return (data != null ? _i35.WithdrawalStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i36.Category?>()) {
      return (data != null ? _i36.Category.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i37.CategoryMapping?>()) {
      return (data != null ? _i37.CategoryMapping.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i38.Product?>()) {
      return (data != null ? _i38.Product.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i39.ProductCategory?>()) {
      return (data != null ? _i39.ProductCategory.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i40.ProductCondition?>()) {
      return (data != null ? _i40.ProductCondition.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i41.ProductReview?>()) {
      return (data != null ? _i41.ProductReview.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i42.ProductStatus?>()) {
      return (data != null ? _i42.ProductStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i43.ProductVariant?>()) {
      return (data != null ? _i43.ProductVariant.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i44.Wishlist?>()) {
      return (data != null ? _i44.Wishlist.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i45.WishlistItem?>()) {
      return (data != null ? _i45.WishlistItem.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i46.AlertType?>()) {
      return (data != null ? _i46.AlertType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i47.BillingCycleSummary?>()) {
      return (data != null ? _i47.BillingCycleSummary.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i48.DailyUsageTracker?>()) {
      return (data != null ? _i48.DailyUsageTracker.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i49.LimitType?>()) {
      return (data != null ? _i49.LimitType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i50.Subscription?>()) {
      return (data != null ? _i50.Subscription.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i51.SubscriptionEvent?>()) {
      return (data != null ? _i51.SubscriptionEvent.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i52.SubscriptionInvoice?>()) {
      return (data != null ? _i52.SubscriptionInvoice.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i53.TierFeature?>()) {
      return (data != null ? _i53.TierFeature.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i54.ToolUsageLimit?>()) {
      return (data != null ? _i54.ToolUsageLimit.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i55.UsageAlert?>()) {
      return (data != null ? _i55.UsageAlert.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i56.UsageClass?>()) {
      return (data != null ? _i56.UsageClass.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i57.UsageRecord?>()) {
      return (data != null ? _i57.UsageRecord.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i58.Address?>()) {
      return (data != null ? _i58.Address.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i59.AuthSession?>()) {
      return (data != null ? _i59.AuthSession.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i60.CustomerAIPolicy?>()) {
      return (data != null ? _i60.CustomerAIPolicy.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i61.CustomerProfile?>()) {
      return (data != null ? _i61.CustomerProfile.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i62.SubscriptionTier?>()) {
      return (data != null ? _i62.SubscriptionTier.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i63.User?>()) {
      return (data != null ? _i63.User.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i64.UserStatus?>()) {
      return (data != null ? _i64.UserStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i65.UserType?>()) {
      return (data != null ? _i65.UserType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i66.VendorProfile?>()) {
      return (data != null ? _i66.VendorProfile.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i67.VendorWallet?>()) {
      return (data != null ? _i67.VendorWallet.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i68.WalletTransaction?>()) {
      return (data != null ? _i68.WalletTransaction.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i69.WithdrawalRequest?>()) {
      return (data != null ? _i69.WithdrawalRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i70.WebhookEvent?>()) {
      return (data != null ? _i70.WebhookEvent.fromJson(data) : null) as T;
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
    if (t == List<_i71.VendorAnalytics>) {
      return (data as List)
              .map((e) => deserialize<_i71.VendorAnalytics>(e))
              .toList()
          as T;
    }
    if (t == Map<String, dynamic>) {
      return (data as Map).map(
            (k, v) => MapEntry(deserialize<String>(k), deserialize<dynamic>(v)),
          )
          as T;
    }
    if (t == List<_i72.ProductAnalytics>) {
      return (data as List)
              .map((e) => deserialize<_i72.ProductAnalytics>(e))
              .toList()
          as T;
    }
    if (t == List<_i73.Product>) {
      return (data as List).map((e) => deserialize<_i73.Product>(e)).toList()
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
    if (t == List<_i74.OrderItem>) {
      return (data as List).map((e) => deserialize<_i74.OrderItem>(e)).toList()
          as T;
    }
    if (t == List<_i75.Order>) {
      return (data as List).map((e) => deserialize<_i75.Order>(e)).toList()
          as T;
    }
    if (t == List<_i76.PaymentTransaction>) {
      return (data as List)
              .map((e) => deserialize<_i76.PaymentTransaction>(e))
              .toList()
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
    if (t == List<_i77.UsageRecord>) {
      return (data as List)
              .map((e) => deserialize<_i77.UsageRecord>(e))
              .toList()
          as T;
    }
    if (t == List<_i78.Address>) {
      return (data as List).map((e) => deserialize<_i78.Address>(e)).toList()
          as T;
    }
    if (t == List<_i79.WithdrawalRequest>) {
      return (data as List)
              .map((e) => deserialize<_i79.WithdrawalRequest>(e))
              .toList()
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
      _i25.OrderEscrow => 'OrderEscrow',
      _i26.OrderItem => 'OrderItem',
      _i27.OrderStatus => 'OrderStatus',
      _i28.PaymentMethod => 'PaymentMethod',
      _i29.PaymentStatus => 'PaymentStatus',
      _i30.PaymentTransaction => 'PaymentTransaction',
      _i31.Refund => 'Refund',
      _i32.EscrowStatus => 'EscrowStatus',
      _i33.TransactionStatus => 'TransactionStatus',
      _i34.WalletTransactionType => 'WalletTransactionType',
      _i35.WithdrawalStatus => 'WithdrawalStatus',
      _i36.Category => 'Category',
      _i37.CategoryMapping => 'CategoryMapping',
      _i38.Product => 'Product',
      _i39.ProductCategory => 'ProductCategory',
      _i40.ProductCondition => 'ProductCondition',
      _i41.ProductReview => 'ProductReview',
      _i42.ProductStatus => 'ProductStatus',
      _i43.ProductVariant => 'ProductVariant',
      _i44.Wishlist => 'Wishlist',
      _i45.WishlistItem => 'WishlistItem',
      _i46.AlertType => 'AlertType',
      _i47.BillingCycleSummary => 'BillingCycleSummary',
      _i48.DailyUsageTracker => 'DailyUsageTracker',
      _i49.LimitType => 'LimitType',
      _i50.Subscription => 'Subscription',
      _i51.SubscriptionEvent => 'SubscriptionEvent',
      _i52.SubscriptionInvoice => 'SubscriptionInvoice',
      _i53.TierFeature => 'TierFeature',
      _i54.ToolUsageLimit => 'ToolUsageLimit',
      _i55.UsageAlert => 'UsageAlert',
      _i56.UsageClass => 'UsageClass',
      _i57.UsageRecord => 'UsageRecord',
      _i58.Address => 'Address',
      _i59.AuthSession => 'AuthSession',
      _i60.CustomerAIPolicy => 'CustomerAIPolicy',
      _i61.CustomerProfile => 'CustomerProfile',
      _i62.SubscriptionTier => 'SubscriptionTier',
      _i63.User => 'User',
      _i64.UserStatus => 'UserStatus',
      _i65.UserType => 'UserType',
      _i66.VendorProfile => 'VendorProfile',
      _i67.VendorWallet => 'VendorWallet',
      _i68.WalletTransaction => 'WalletTransaction',
      _i69.WithdrawalRequest => 'WithdrawalRequest',
      _i70.WebhookEvent => 'WebhookEvent',
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
      case _i25.OrderEscrow():
        return 'OrderEscrow';
      case _i26.OrderItem():
        return 'OrderItem';
      case _i27.OrderStatus():
        return 'OrderStatus';
      case _i28.PaymentMethod():
        return 'PaymentMethod';
      case _i29.PaymentStatus():
        return 'PaymentStatus';
      case _i30.PaymentTransaction():
        return 'PaymentTransaction';
      case _i31.Refund():
        return 'Refund';
      case _i32.EscrowStatus():
        return 'EscrowStatus';
      case _i33.TransactionStatus():
        return 'TransactionStatus';
      case _i34.WalletTransactionType():
        return 'WalletTransactionType';
      case _i35.WithdrawalStatus():
        return 'WithdrawalStatus';
      case _i36.Category():
        return 'Category';
      case _i37.CategoryMapping():
        return 'CategoryMapping';
      case _i38.Product():
        return 'Product';
      case _i39.ProductCategory():
        return 'ProductCategory';
      case _i40.ProductCondition():
        return 'ProductCondition';
      case _i41.ProductReview():
        return 'ProductReview';
      case _i42.ProductStatus():
        return 'ProductStatus';
      case _i43.ProductVariant():
        return 'ProductVariant';
      case _i44.Wishlist():
        return 'Wishlist';
      case _i45.WishlistItem():
        return 'WishlistItem';
      case _i46.AlertType():
        return 'AlertType';
      case _i47.BillingCycleSummary():
        return 'BillingCycleSummary';
      case _i48.DailyUsageTracker():
        return 'DailyUsageTracker';
      case _i49.LimitType():
        return 'LimitType';
      case _i50.Subscription():
        return 'Subscription';
      case _i51.SubscriptionEvent():
        return 'SubscriptionEvent';
      case _i52.SubscriptionInvoice():
        return 'SubscriptionInvoice';
      case _i53.TierFeature():
        return 'TierFeature';
      case _i54.ToolUsageLimit():
        return 'ToolUsageLimit';
      case _i55.UsageAlert():
        return 'UsageAlert';
      case _i56.UsageClass():
        return 'UsageClass';
      case _i57.UsageRecord():
        return 'UsageRecord';
      case _i58.Address():
        return 'Address';
      case _i59.AuthSession():
        return 'AuthSession';
      case _i60.CustomerAIPolicy():
        return 'CustomerAIPolicy';
      case _i61.CustomerProfile():
        return 'CustomerProfile';
      case _i62.SubscriptionTier():
        return 'SubscriptionTier';
      case _i63.User():
        return 'User';
      case _i64.UserStatus():
        return 'UserStatus';
      case _i65.UserType():
        return 'UserType';
      case _i66.VendorProfile():
        return 'VendorProfile';
      case _i67.VendorWallet():
        return 'VendorWallet';
      case _i68.WalletTransaction():
        return 'WalletTransaction';
      case _i69.WithdrawalRequest():
        return 'WithdrawalRequest';
      case _i70.WebhookEvent():
        return 'WebhookEvent';
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
    if (dataClassName == 'OrderEscrow') {
      return deserialize<_i25.OrderEscrow>(data['data']);
    }
    if (dataClassName == 'OrderItem') {
      return deserialize<_i26.OrderItem>(data['data']);
    }
    if (dataClassName == 'OrderStatus') {
      return deserialize<_i27.OrderStatus>(data['data']);
    }
    if (dataClassName == 'PaymentMethod') {
      return deserialize<_i28.PaymentMethod>(data['data']);
    }
    if (dataClassName == 'PaymentStatus') {
      return deserialize<_i29.PaymentStatus>(data['data']);
    }
    if (dataClassName == 'PaymentTransaction') {
      return deserialize<_i30.PaymentTransaction>(data['data']);
    }
    if (dataClassName == 'Refund') {
      return deserialize<_i31.Refund>(data['data']);
    }
    if (dataClassName == 'EscrowStatus') {
      return deserialize<_i32.EscrowStatus>(data['data']);
    }
    if (dataClassName == 'TransactionStatus') {
      return deserialize<_i33.TransactionStatus>(data['data']);
    }
    if (dataClassName == 'WalletTransactionType') {
      return deserialize<_i34.WalletTransactionType>(data['data']);
    }
    if (dataClassName == 'WithdrawalStatus') {
      return deserialize<_i35.WithdrawalStatus>(data['data']);
    }
    if (dataClassName == 'Category') {
      return deserialize<_i36.Category>(data['data']);
    }
    if (dataClassName == 'CategoryMapping') {
      return deserialize<_i37.CategoryMapping>(data['data']);
    }
    if (dataClassName == 'Product') {
      return deserialize<_i38.Product>(data['data']);
    }
    if (dataClassName == 'ProductCategory') {
      return deserialize<_i39.ProductCategory>(data['data']);
    }
    if (dataClassName == 'ProductCondition') {
      return deserialize<_i40.ProductCondition>(data['data']);
    }
    if (dataClassName == 'ProductReview') {
      return deserialize<_i41.ProductReview>(data['data']);
    }
    if (dataClassName == 'ProductStatus') {
      return deserialize<_i42.ProductStatus>(data['data']);
    }
    if (dataClassName == 'ProductVariant') {
      return deserialize<_i43.ProductVariant>(data['data']);
    }
    if (dataClassName == 'Wishlist') {
      return deserialize<_i44.Wishlist>(data['data']);
    }
    if (dataClassName == 'WishlistItem') {
      return deserialize<_i45.WishlistItem>(data['data']);
    }
    if (dataClassName == 'AlertType') {
      return deserialize<_i46.AlertType>(data['data']);
    }
    if (dataClassName == 'BillingCycleSummary') {
      return deserialize<_i47.BillingCycleSummary>(data['data']);
    }
    if (dataClassName == 'DailyUsageTracker') {
      return deserialize<_i48.DailyUsageTracker>(data['data']);
    }
    if (dataClassName == 'LimitType') {
      return deserialize<_i49.LimitType>(data['data']);
    }
    if (dataClassName == 'Subscription') {
      return deserialize<_i50.Subscription>(data['data']);
    }
    if (dataClassName == 'SubscriptionEvent') {
      return deserialize<_i51.SubscriptionEvent>(data['data']);
    }
    if (dataClassName == 'SubscriptionInvoice') {
      return deserialize<_i52.SubscriptionInvoice>(data['data']);
    }
    if (dataClassName == 'TierFeature') {
      return deserialize<_i53.TierFeature>(data['data']);
    }
    if (dataClassName == 'ToolUsageLimit') {
      return deserialize<_i54.ToolUsageLimit>(data['data']);
    }
    if (dataClassName == 'UsageAlert') {
      return deserialize<_i55.UsageAlert>(data['data']);
    }
    if (dataClassName == 'UsageClass') {
      return deserialize<_i56.UsageClass>(data['data']);
    }
    if (dataClassName == 'UsageRecord') {
      return deserialize<_i57.UsageRecord>(data['data']);
    }
    if (dataClassName == 'Address') {
      return deserialize<_i58.Address>(data['data']);
    }
    if (dataClassName == 'AuthSession') {
      return deserialize<_i59.AuthSession>(data['data']);
    }
    if (dataClassName == 'CustomerAIPolicy') {
      return deserialize<_i60.CustomerAIPolicy>(data['data']);
    }
    if (dataClassName == 'CustomerProfile') {
      return deserialize<_i61.CustomerProfile>(data['data']);
    }
    if (dataClassName == 'SubscriptionTier') {
      return deserialize<_i62.SubscriptionTier>(data['data']);
    }
    if (dataClassName == 'User') {
      return deserialize<_i63.User>(data['data']);
    }
    if (dataClassName == 'UserStatus') {
      return deserialize<_i64.UserStatus>(data['data']);
    }
    if (dataClassName == 'UserType') {
      return deserialize<_i65.UserType>(data['data']);
    }
    if (dataClassName == 'VendorProfile') {
      return deserialize<_i66.VendorProfile>(data['data']);
    }
    if (dataClassName == 'VendorWallet') {
      return deserialize<_i67.VendorWallet>(data['data']);
    }
    if (dataClassName == 'WalletTransaction') {
      return deserialize<_i68.WalletTransaction>(data['data']);
    }
    if (dataClassName == 'WithdrawalRequest') {
      return deserialize<_i69.WithdrawalRequest>(data['data']);
    }
    if (dataClassName == 'WebhookEvent') {
      return deserialize<_i70.WebhookEvent>(data['data']);
    }
    return super.deserializeByClassName(data);
  }

  /// Maps any `Record`s known to this [Protocol] to their JSON representation
  ///
  /// Throws in case the record type is not known.
  ///
  /// This method will return `null` (only) for `null` inputs.
  Map<String, dynamic>? mapRecordToJson(Record? record) {
    if (record == null) {
      return null;
    }
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
