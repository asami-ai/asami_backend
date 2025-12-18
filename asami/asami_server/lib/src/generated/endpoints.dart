/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/analytics_endpoint.dart' as _i2;
import '../endpoints/auth_endpoint.dart' as _i3;
import '../endpoints/bot_endpoint.dart' as _i4;
import '../endpoints/cart_endpoint.dart' as _i5;
import '../endpoints/order_endpoint.dart' as _i6;
import '../endpoints/product_endpoint.dart' as _i7;
import '../endpoints/subscription_endpoint.dart' as _i8;
import '../endpoints/telegram_webhook_endpoint.dart' as _i9;
import '../endpoints/usage_endpoint.dart' as _i10;
import '../endpoints/user_endpoint.dart' as _i11;
import '../endpoints/whatsapp_webhook_endpoint.dart' as _i12;
import 'package:uuid/uuid_value.dart' as _i13;
import 'package:asami_server/src/generated/user/user_type.dart' as _i14;
import 'package:asami_server/src/generated/messaging/platfom_type.dart' as _i15;
import 'package:asami_server/src/generated/messaging/message_type.dart' as _i16;
import 'package:asami_server/src/generated/product/product.dart' as _i17;
import 'package:asami_server/src/generated/order/order.dart' as _i18;
import 'package:asami_server/src/generated/order/order_item.dart' as _i19;
import 'package:asami_server/src/generated/order/payment_method.dart' as _i20;
import 'package:asami_server/src/generated/order/order_status.dart' as _i21;
import 'package:asami_server/src/generated/product/product_status.dart' as _i22;
import 'package:asami_server/src/generated/user/subscription_tier.dart' as _i23;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'analytics': _i2.AnalyticsEndpoint()
        ..initialize(
          server,
          'analytics',
          null,
        ),
      'auth': _i3.AuthEndpoint()
        ..initialize(
          server,
          'auth',
          null,
        ),
      'bot': _i4.BotEndpoint()
        ..initialize(
          server,
          'bot',
          null,
        ),
      'cart': _i5.CartEndpoint()
        ..initialize(
          server,
          'cart',
          null,
        ),
      'order': _i6.OrderEndpoint()
        ..initialize(
          server,
          'order',
          null,
        ),
      'product': _i7.ProductEndpoint()
        ..initialize(
          server,
          'product',
          null,
        ),
      'subscription': _i8.SubscriptionEndpoint()
        ..initialize(
          server,
          'subscription',
          null,
        ),
      'telegramWebhook': _i9.TelegramWebhookEndpoint()
        ..initialize(
          server,
          'telegramWebhook',
          null,
        ),
      'usage': _i10.UsageEndpoint()
        ..initialize(
          server,
          'usage',
          null,
        ),
      'user': _i11.UserEndpoint()
        ..initialize(
          server,
          'user',
          null,
        ),
      'whatsAppWebhook': _i12.WhatsAppWebhookEndpoint()
        ..initialize(
          server,
          'whatsAppWebhook',
          null,
        ),
    };
    connectors['analytics'] = _i1.EndpointConnector(
      name: 'analytics',
      endpoint: endpoints['analytics']!,
      methodConnectors: {
        'getVendorAnalytics': _i1.MethodConnector(
          name: 'getVendorAnalytics',
          params: {
            'vendorId': _i1.ParameterDescription(
              name: 'vendorId',
              type: _i1.getType<_i13.UuidValue>(),
              nullable: false,
            ),
            'date': _i1.ParameterDescription(
              name: 'date',
              type: _i1.getType<DateTime>(),
              nullable: false,
            ),
            'period': _i1.ParameterDescription(
              name: 'period',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['analytics'] as _i2.AnalyticsEndpoint)
                  .getVendorAnalytics(
            session,
            vendorId: params['vendorId'],
            date: params['date'],
            period: params['period'],
          ),
        ),
        'getVendorAnalyticsRange': _i1.MethodConnector(
          name: 'getVendorAnalyticsRange',
          params: {
            'vendorId': _i1.ParameterDescription(
              name: 'vendorId',
              type: _i1.getType<_i13.UuidValue>(),
              nullable: false,
            ),
            'startDate': _i1.ParameterDescription(
              name: 'startDate',
              type: _i1.getType<DateTime>(),
              nullable: false,
            ),
            'endDate': _i1.ParameterDescription(
              name: 'endDate',
              type: _i1.getType<DateTime>(),
              nullable: false,
            ),
            'period': _i1.ParameterDescription(
              name: 'period',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['analytics'] as _i2.AnalyticsEndpoint)
                  .getVendorAnalyticsRange(
            session,
            vendorId: params['vendorId'],
            startDate: params['startDate'],
            endDate: params['endDate'],
            period: params['period'],
          ),
        ),
        'getVendorDashboard': _i1.MethodConnector(
          name: 'getVendorDashboard',
          params: {
            'vendorId': _i1.ParameterDescription(
              name: 'vendorId',
              type: _i1.getType<_i13.UuidValue>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['analytics'] as _i2.AnalyticsEndpoint)
                  .getVendorDashboard(
            session,
            params['vendorId'],
          ),
        ),
        'getProductAnalytics': _i1.MethodConnector(
          name: 'getProductAnalytics',
          params: {
            'productId': _i1.ParameterDescription(
              name: 'productId',
              type: _i1.getType<_i13.UuidValue>(),
              nullable: false,
            ),
            'startDate': _i1.ParameterDescription(
              name: 'startDate',
              type: _i1.getType<DateTime>(),
              nullable: false,
            ),
            'endDate': _i1.ParameterDescription(
              name: 'endDate',
              type: _i1.getType<DateTime>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['analytics'] as _i2.AnalyticsEndpoint)
                  .getProductAnalytics(
            session,
            productId: params['productId'],
            startDate: params['startDate'],
            endDate: params['endDate'],
          ),
        ),
        'getTopSellingProducts': _i1.MethodConnector(
          name: 'getTopSellingProducts',
          params: {
            'vendorId': _i1.ParameterDescription(
              name: 'vendorId',
              type: _i1.getType<_i13.UuidValue>(),
              nullable: false,
            ),
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['analytics'] as _i2.AnalyticsEndpoint)
                  .getTopSellingProducts(
            session,
            vendorId: params['vendorId'],
            limit: params['limit'],
          ),
        ),
        'getPaymentMethodBreakdown': _i1.MethodConnector(
          name: 'getPaymentMethodBreakdown',
          params: {
            'vendorId': _i1.ParameterDescription(
              name: 'vendorId',
              type: _i1.getType<_i13.UuidValue>(),
              nullable: false,
            ),
            'startDate': _i1.ParameterDescription(
              name: 'startDate',
              type: _i1.getType<DateTime>(),
              nullable: false,
            ),
            'endDate': _i1.ParameterDescription(
              name: 'endDate',
              type: _i1.getType<DateTime>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['analytics'] as _i2.AnalyticsEndpoint)
                  .getPaymentMethodBreakdown(
            session,
            vendorId: params['vendorId'],
            startDate: params['startDate'],
            endDate: params['endDate'],
          ),
        ),
        'recordDailyAnalytics': _i1.MethodConnector(
          name: 'recordDailyAnalytics',
          params: {
            'date': _i1.ParameterDescription(
              name: 'date',
              type: _i1.getType<DateTime>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['analytics'] as _i2.AnalyticsEndpoint)
                  .recordDailyAnalytics(
            session,
            params['date'],
          ),
        ),
      },
    );
    connectors['auth'] = _i1.EndpointConnector(
      name: 'auth',
      endpoint: endpoints['auth']!,
      methodConnectors: {
        'initiateSignup': _i1.MethodConnector(
          name: 'initiateSignup',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'userType': _i1.ParameterDescription(
              name: 'userType',
              type: _i1.getType<_i14.UserType>(),
              nullable: false,
            ),
            'phoneNumber': _i1.ParameterDescription(
              name: 'phoneNumber',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'firstName': _i1.ParameterDescription(
              name: 'firstName',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'lastName': _i1.ParameterDescription(
              name: 'lastName',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'platform': _i1.ParameterDescription(
              name: 'platform',
              type: _i1.getType<_i15.PlatformType>(),
              nullable: false,
            ),
            'platformUserId': _i1.ParameterDescription(
              name: 'platformUserId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['auth'] as _i3.AuthEndpoint).initiateSignup(
            session,
            email: params['email'],
            userType: params['userType'],
            phoneNumber: params['phoneNumber'],
            firstName: params['firstName'],
            lastName: params['lastName'],
            platform: params['platform'],
            platformUserId: params['platformUserId'],
          ),
        ),
        'verifySignupCode': _i1.MethodConnector(
          name: 'verifySignupCode',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'code': _i1.ParameterDescription(
              name: 'code',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'platform': _i1.ParameterDescription(
              name: 'platform',
              type: _i1.getType<_i15.PlatformType>(),
              nullable: false,
            ),
            'platformUserId': _i1.ParameterDescription(
              name: 'platformUserId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['auth'] as _i3.AuthEndpoint).verifySignupCode(
            session,
            email: params['email'],
            code: params['code'],
            platform: params['platform'],
            platformUserId: params['platformUserId'],
          ),
        ),
        'initiateLogin': _i1.MethodConnector(
          name: 'initiateLogin',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['auth'] as _i3.AuthEndpoint).initiateLogin(
            session,
            email: params['email'],
          ),
        ),
        'verifyLoginCode': _i1.MethodConnector(
          name: 'verifyLoginCode',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'code': _i1.ParameterDescription(
              name: 'code',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'platform': _i1.ParameterDescription(
              name: 'platform',
              type: _i1.getType<_i15.PlatformType>(),
              nullable: false,
            ),
            'platformUserId': _i1.ParameterDescription(
              name: 'platformUserId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['auth'] as _i3.AuthEndpoint).verifyLoginCode(
            session,
            email: params['email'],
            code: params['code'],
            platform: params['platform'],
            platformUserId: params['platformUserId'],
          ),
        ),
        'checkAuth': _i1.MethodConnector(
          name: 'checkAuth',
          params: {
            'platform': _i1.ParameterDescription(
              name: 'platform',
              type: _i1.getType<_i15.PlatformType>(),
              nullable: false,
            ),
            'platformUserId': _i1.ParameterDescription(
              name: 'platformUserId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['auth'] as _i3.AuthEndpoint).checkAuth(
            session,
            platform: params['platform'],
            platformUserId: params['platformUserId'],
          ),
        ),
        'logout': _i1.MethodConnector(
          name: 'logout',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'platform': _i1.ParameterDescription(
              name: 'platform',
              type: _i1.getType<_i15.PlatformType>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['auth'] as _i3.AuthEndpoint).logout(
            session,
            userId: params['userId'],
            platform: params['platform'],
          ),
        ),
        'resendCode': _i1.MethodConnector(
          name: 'resendCode',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['auth'] as _i3.AuthEndpoint).resendCode(
            session,
            email: params['email'],
          ),
        ),
        'upgradeToVendor': _i1.MethodConnector(
          name: 'upgradeToVendor',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'businessName': _i1.ParameterDescription(
              name: 'businessName',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'businessCategory': _i1.ParameterDescription(
              name: 'businessCategory',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['auth'] as _i3.AuthEndpoint).upgradeToVendor(
            session,
            userId: params['userId'],
            businessName: params['businessName'],
            businessCategory: params['businessCategory'],
          ),
        ),
        'deleteTempUser': _i1.MethodConnector(
          name: 'deleteTempUser',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['auth'] as _i3.AuthEndpoint).deleteTempUser(
            session,
            email: params['email'],
          ),
        ),
      },
    );
    connectors['bot'] = _i1.EndpointConnector(
      name: 'bot',
      endpoint: endpoints['bot']!,
      methodConnectors: {
        'processMessage': _i1.MethodConnector(
          name: 'processMessage',
          params: {
            'platformUserId': _i1.ParameterDescription(
              name: 'platformUserId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'platform': _i1.ParameterDescription(
              name: 'platform',
              type: _i1.getType<_i15.PlatformType>(),
              nullable: false,
            ),
            'messageContent': _i1.ParameterDescription(
              name: 'messageContent',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'messageType': _i1.ParameterDescription(
              name: 'messageType',
              type: _i1.getType<_i16.MessageType>(),
              nullable: false,
            ),
            'mediaUrl': _i1.ParameterDescription(
              name: 'mediaUrl',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'platformMessageId': _i1.ParameterDescription(
              name: 'platformMessageId',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['bot'] as _i4.BotEndpoint).processMessage(
            session,
            platformUserId: params['platformUserId'],
            platform: params['platform'],
            messageContent: params['messageContent'],
            messageType: params['messageType'],
            mediaUrl: params['mediaUrl'],
            platformMessageId: params['platformMessageId'],
          ),
        ),
        'sendFormattedMessage': _i1.MethodConnector(
          name: 'sendFormattedMessage',
          params: {
            'platformUserId': _i1.ParameterDescription(
              name: 'platformUserId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'platform': _i1.ParameterDescription(
              name: 'platform',
              type: _i1.getType<_i15.PlatformType>(),
              nullable: false,
            ),
            'message': _i1.ParameterDescription(
              name: 'message',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'interactiveData': _i1.ParameterDescription(
              name: 'interactiveData',
              type: _i1.getType<Map<String, dynamic>?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['bot'] as _i4.BotEndpoint).sendFormattedMessage(
            session,
            platformUserId: params['platformUserId'],
            platform: params['platform'],
            message: params['message'],
            interactiveData: params['interactiveData'],
          ),
        ),
        'sendProductList': _i1.MethodConnector(
          name: 'sendProductList',
          params: {
            'platformUserId': _i1.ParameterDescription(
              name: 'platformUserId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'platform': _i1.ParameterDescription(
              name: 'platform',
              type: _i1.getType<_i15.PlatformType>(),
              nullable: false,
            ),
            'products': _i1.ParameterDescription(
              name: 'products',
              type: _i1.getType<List<_i17.Product>>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['bot'] as _i4.BotEndpoint).sendProductList(
            session,
            platformUserId: params['platformUserId'],
            platform: params['platform'],
            products: params['products'],
          ),
        ),
        'sendOrderConfirmation': _i1.MethodConnector(
          name: 'sendOrderConfirmation',
          params: {
            'platformUserId': _i1.ParameterDescription(
              name: 'platformUserId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'platform': _i1.ParameterDescription(
              name: 'platform',
              type: _i1.getType<_i15.PlatformType>(),
              nullable: false,
            ),
            'order': _i1.ParameterDescription(
              name: 'order',
              type: _i1.getType<_i18.Order>(),
              nullable: false,
            ),
            'items': _i1.ParameterDescription(
              name: 'items',
              type: _i1.getType<List<_i19.OrderItem>>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['bot'] as _i4.BotEndpoint).sendOrderConfirmation(
            session,
            platformUserId: params['platformUserId'],
            platform: params['platform'],
            order: params['order'],
            items: params['items'],
          ),
        ),
      },
    );
    connectors['cart'] = _i1.EndpointConnector(
      name: 'cart',
      endpoint: endpoints['cart']!,
      methodConnectors: {
        'getOrCreateCart': _i1.MethodConnector(
          name: 'getOrCreateCart',
          params: {
            'customerId': _i1.ParameterDescription(
              name: 'customerId',
              type: _i1.getType<_i13.UuidValue>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['cart'] as _i5.CartEndpoint).getOrCreateCart(
            session,
            params['customerId'],
          ),
        ),
        'addToCart': _i1.MethodConnector(
          name: 'addToCart',
          params: {
            'customerId': _i1.ParameterDescription(
              name: 'customerId',
              type: _i1.getType<_i13.UuidValue>(),
              nullable: false,
            ),
            'productId': _i1.ParameterDescription(
              name: 'productId',
              type: _i1.getType<_i13.UuidValue>(),
              nullable: false,
            ),
            'variantId': _i1.ParameterDescription(
              name: 'variantId',
              type: _i1.getType<_i13.UuidValue?>(),
              nullable: true,
            ),
            'quantity': _i1.ParameterDescription(
              name: 'quantity',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'customerNotes': _i1.ParameterDescription(
              name: 'customerNotes',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['cart'] as _i5.CartEndpoint).addToCart(
            session,
            customerId: params['customerId'],
            productId: params['productId'],
            variantId: params['variantId'],
            quantity: params['quantity'],
            customerNotes: params['customerNotes'],
          ),
        ),
        'updateCartItemQuantity': _i1.MethodConnector(
          name: 'updateCartItemQuantity',
          params: {
            'cartItemId': _i1.ParameterDescription(
              name: 'cartItemId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'quantity': _i1.ParameterDescription(
              name: 'quantity',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['cart'] as _i5.CartEndpoint).updateCartItemQuantity(
            session,
            cartItemId: params['cartItemId'],
            quantity: params['quantity'],
          ),
        ),
        'removeFromCart': _i1.MethodConnector(
          name: 'removeFromCart',
          params: {
            'cartItemId': _i1.ParameterDescription(
              name: 'cartItemId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['cart'] as _i5.CartEndpoint).removeFromCart(
            session,
            params['cartItemId'],
          ),
        ),
        'getCartWithItems': _i1.MethodConnector(
          name: 'getCartWithItems',
          params: {
            'customerId': _i1.ParameterDescription(
              name: 'customerId',
              type: _i1.getType<_i13.UuidValue>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['cart'] as _i5.CartEndpoint).getCartWithItems(
            session,
            params['customerId'],
          ),
        ),
        'clearCart': _i1.MethodConnector(
          name: 'clearCart',
          params: {
            'customerId': _i1.ParameterDescription(
              name: 'customerId',
              type: _i1.getType<_i13.UuidValue>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['cart'] as _i5.CartEndpoint).clearCart(
            session,
            params['customerId'],
          ),
        ),
      },
    );
    connectors['order'] = _i1.EndpointConnector(
      name: 'order',
      endpoint: endpoints['order']!,
      methodConnectors: {
        'createOrder': _i1.MethodConnector(
          name: 'createOrder',
          params: {
            'customerId': _i1.ParameterDescription(
              name: 'customerId',
              type: _i1.getType<_i13.UuidValue>(),
              nullable: false,
            ),
            'shippingAddressId': _i1.ParameterDescription(
              name: 'shippingAddressId',
              type: _i1.getType<_i13.UuidValue>(),
              nullable: false,
            ),
            'paymentMethod': _i1.ParameterDescription(
              name: 'paymentMethod',
              type: _i1.getType<_i20.PaymentMethod>(),
              nullable: false,
            ),
            'customerNotes': _i1.ParameterDescription(
              name: 'customerNotes',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'conversationId': _i1.ParameterDescription(
              name: 'conversationId',
              type: _i1.getType<_i13.UuidValue?>(),
              nullable: true,
            ),
            'orderSource': _i1.ParameterDescription(
              name: 'orderSource',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['order'] as _i6.OrderEndpoint).createOrder(
            session,
            customerId: params['customerId'],
            shippingAddressId: params['shippingAddressId'],
            paymentMethod: params['paymentMethod'],
            customerNotes: params['customerNotes'],
            conversationId: params['conversationId'],
            orderSource: params['orderSource'],
          ),
        ),
        'getOrder': _i1.MethodConnector(
          name: 'getOrder',
          params: {
            'orderId': _i1.ParameterDescription(
              name: 'orderId',
              type: _i1.getType<_i13.UuidValue>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['order'] as _i6.OrderEndpoint).getOrder(
            session,
            params['orderId'],
          ),
        ),
        'getOrderWithItems': _i1.MethodConnector(
          name: 'getOrderWithItems',
          params: {
            'orderId': _i1.ParameterDescription(
              name: 'orderId',
              type: _i1.getType<_i13.UuidValue>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['order'] as _i6.OrderEndpoint).getOrderWithItems(
            session,
            params['orderId'],
          ),
        ),
        'getCustomerOrders': _i1.MethodConnector(
          name: 'getCustomerOrders',
          params: {
            'customerId': _i1.ParameterDescription(
              name: 'customerId',
              type: _i1.getType<_i13.UuidValue>(),
              nullable: false,
            ),
            'status': _i1.ParameterDescription(
              name: 'status',
              type: _i1.getType<_i21.OrderStatus?>(),
              nullable: true,
            ),
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'offset': _i1.ParameterDescription(
              name: 'offset',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['order'] as _i6.OrderEndpoint).getCustomerOrders(
            session,
            customerId: params['customerId'],
            status: params['status'],
            limit: params['limit'],
            offset: params['offset'],
          ),
        ),
        'getVendorOrders': _i1.MethodConnector(
          name: 'getVendorOrders',
          params: {
            'vendorId': _i1.ParameterDescription(
              name: 'vendorId',
              type: _i1.getType<_i13.UuidValue>(),
              nullable: false,
            ),
            'status': _i1.ParameterDescription(
              name: 'status',
              type: _i1.getType<_i21.OrderStatus?>(),
              nullable: true,
            ),
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'offset': _i1.ParameterDescription(
              name: 'offset',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['order'] as _i6.OrderEndpoint).getVendorOrders(
            session,
            vendorId: params['vendorId'],
            status: params['status'],
            limit: params['limit'],
            offset: params['offset'],
          ),
        ),
        'updateOrderStatus': _i1.MethodConnector(
          name: 'updateOrderStatus',
          params: {
            'orderId': _i1.ParameterDescription(
              name: 'orderId',
              type: _i1.getType<_i13.UuidValue>(),
              nullable: false,
            ),
            'status': _i1.ParameterDescription(
              name: 'status',
              type: _i1.getType<_i21.OrderStatus>(),
              nullable: false,
            ),
            'trackingNumber': _i1.ParameterDescription(
              name: 'trackingNumber',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'vendorNotes': _i1.ParameterDescription(
              name: 'vendorNotes',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['order'] as _i6.OrderEndpoint).updateOrderStatus(
            session,
            orderId: params['orderId'],
            status: params['status'],
            trackingNumber: params['trackingNumber'],
            vendorNotes: params['vendorNotes'],
          ),
        ),
        'cancelOrder': _i1.MethodConnector(
          name: 'cancelOrder',
          params: {
            'orderId': _i1.ParameterDescription(
              name: 'orderId',
              type: _i1.getType<_i13.UuidValue>(),
              nullable: false,
            ),
            'cancellationReason': _i1.ParameterDescription(
              name: 'cancellationReason',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'refund': _i1.ParameterDescription(
              name: 'refund',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['order'] as _i6.OrderEndpoint).cancelOrder(
            session,
            orderId: params['orderId'],
            cancellationReason: params['cancellationReason'],
            refund: params['refund'],
          ),
        ),
      },
    );
    connectors['product'] = _i1.EndpointConnector(
      name: 'product',
      endpoint: endpoints['product']!,
      methodConnectors: {
        'createProduct': _i1.MethodConnector(
          name: 'createProduct',
          params: {
            'vendorId': _i1.ParameterDescription(
              name: 'vendorId',
              type: _i1.getType<_i13.UuidValue>(),
              nullable: false,
            ),
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'description': _i1.ParameterDescription(
              name: 'description',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'category': _i1.ParameterDescription(
              name: 'category',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'basePrice': _i1.ParameterDescription(
              name: 'basePrice',
              type: _i1.getType<double>(),
              nullable: false,
            ),
            'shortDescription': _i1.ParameterDescription(
              name: 'shortDescription',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'subCategory': _i1.ParameterDescription(
              name: 'subCategory',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'tags': _i1.ParameterDescription(
              name: 'tags',
              type: _i1.getType<List<String>?>(),
              nullable: true,
            ),
            'images': _i1.ParameterDescription(
              name: 'images',
              type: _i1.getType<List<String>?>(),
              nullable: true,
            ),
            'isAiGenerated': _i1.ParameterDescription(
              name: 'isAiGenerated',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
            'aiConfidenceScore': _i1.ParameterDescription(
              name: 'aiConfidenceScore',
              type: _i1.getType<double?>(),
              nullable: true,
            ),
            'quantity': _i1.ParameterDescription(
              name: 'quantity',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sku': _i1.ParameterDescription(
              name: 'sku',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'color': _i1.ParameterDescription(
              name: 'color',
              type: _i1.getType<List<String>?>(),
              nullable: true,
            ),
            'size': _i1.ParameterDescription(
              name: 'size',
              type: _i1.getType<List<String>?>(),
              nullable: true,
            ),
            'material': _i1.ParameterDescription(
              name: 'material',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'brand': _i1.ParameterDescription(
              name: 'brand',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'weight': _i1.ParameterDescription(
              name: 'weight',
              type: _i1.getType<double?>(),
              nullable: true,
            ),
            'weightUnit': _i1.ParameterDescription(
              name: 'weightUnit',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'trackInventory': _i1.ParameterDescription(
              name: 'trackInventory',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['product'] as _i7.ProductEndpoint).createProduct(
            session,
            vendorId: params['vendorId'],
            name: params['name'],
            description: params['description'],
            category: params['category'],
            basePrice: params['basePrice'],
            shortDescription: params['shortDescription'],
            subCategory: params['subCategory'],
            tags: params['tags'],
            images: params['images'],
            isAiGenerated: params['isAiGenerated'],
            aiConfidenceScore: params['aiConfidenceScore'],
            quantity: params['quantity'],
            sku: params['sku'],
            color: params['color'],
            size: params['size'],
            material: params['material'],
            brand: params['brand'],
            weight: params['weight'],
            weightUnit: params['weightUnit'],
            trackInventory: params['trackInventory'],
          ),
        ),
        'updateProduct': _i1.MethodConnector(
          name: 'updateProduct',
          params: {
            'productId': _i1.ParameterDescription(
              name: 'productId',
              type: _i1.getType<_i13.UuidValue>(),
              nullable: false,
            ),
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'description': _i1.ParameterDescription(
              name: 'description',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'shortDescription': _i1.ParameterDescription(
              name: 'shortDescription',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'category': _i1.ParameterDescription(
              name: 'category',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'subCategory': _i1.ParameterDescription(
              name: 'subCategory',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'tags': _i1.ParameterDescription(
              name: 'tags',
              type: _i1.getType<List<String>?>(),
              nullable: true,
            ),
            'basePrice': _i1.ParameterDescription(
              name: 'basePrice',
              type: _i1.getType<double?>(),
              nullable: true,
            ),
            'discountPrice': _i1.ParameterDescription(
              name: 'discountPrice',
              type: _i1.getType<double?>(),
              nullable: true,
            ),
            'quantity': _i1.ParameterDescription(
              name: 'quantity',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
            'status': _i1.ParameterDescription(
              name: 'status',
              type: _i1.getType<_i22.ProductStatus?>(),
              nullable: true,
            ),
            'images': _i1.ParameterDescription(
              name: 'images',
              type: _i1.getType<List<String>?>(),
              nullable: true,
            ),
            'isActive': _i1.ParameterDescription(
              name: 'isActive',
              type: _i1.getType<bool?>(),
              nullable: true,
            ),
            'isFeatured': _i1.ParameterDescription(
              name: 'isFeatured',
              type: _i1.getType<bool?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['product'] as _i7.ProductEndpoint).updateProduct(
            session,
            productId: params['productId'],
            name: params['name'],
            description: params['description'],
            shortDescription: params['shortDescription'],
            category: params['category'],
            subCategory: params['subCategory'],
            tags: params['tags'],
            basePrice: params['basePrice'],
            discountPrice: params['discountPrice'],
            quantity: params['quantity'],
            status: params['status'],
            images: params['images'],
            isActive: params['isActive'],
            isFeatured: params['isFeatured'],
          ),
        ),
        'publishProduct': _i1.MethodConnector(
          name: 'publishProduct',
          params: {
            'productId': _i1.ParameterDescription(
              name: 'productId',
              type: _i1.getType<_i13.UuidValue>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['product'] as _i7.ProductEndpoint).publishProduct(
            session,
            params['productId'],
          ),
        ),
        'getProduct': _i1.MethodConnector(
          name: 'getProduct',
          params: {
            'productId': _i1.ParameterDescription(
              name: 'productId',
              type: _i1.getType<_i13.UuidValue>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['product'] as _i7.ProductEndpoint).getProduct(
            session,
            params['productId'],
          ),
        ),
        'getVendorProducts': _i1.MethodConnector(
          name: 'getVendorProducts',
          params: {
            'vendorId': _i1.ParameterDescription(
              name: 'vendorId',
              type: _i1.getType<_i13.UuidValue>(),
              nullable: false,
            ),
            'status': _i1.ParameterDescription(
              name: 'status',
              type: _i1.getType<_i22.ProductStatus?>(),
              nullable: true,
            ),
            'isActive': _i1.ParameterDescription(
              name: 'isActive',
              type: _i1.getType<bool?>(),
              nullable: true,
            ),
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'offset': _i1.ParameterDescription(
              name: 'offset',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['product'] as _i7.ProductEndpoint).getVendorProducts(
            session,
            vendorId: params['vendorId'],
            status: params['status'],
            isActive: params['isActive'],
            limit: params['limit'],
            offset: params['offset'],
          ),
        ),
        'searchProducts': _i1.MethodConnector(
          name: 'searchProducts',
          params: {
            'query': _i1.ParameterDescription(
              name: 'query',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'category': _i1.ParameterDescription(
              name: 'category',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'minPrice': _i1.ParameterDescription(
              name: 'minPrice',
              type: _i1.getType<double?>(),
              nullable: true,
            ),
            'maxPrice': _i1.ParameterDescription(
              name: 'maxPrice',
              type: _i1.getType<double?>(),
              nullable: true,
            ),
            'tags': _i1.ParameterDescription(
              name: 'tags',
              type: _i1.getType<List<String>?>(),
              nullable: true,
            ),
            'color': _i1.ParameterDescription(
              name: 'color',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'size': _i1.ParameterDescription(
              name: 'size',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'offset': _i1.ParameterDescription(
              name: 'offset',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['product'] as _i7.ProductEndpoint).searchProducts(
            session,
            query: params['query'],
            category: params['category'],
            minPrice: params['minPrice'],
            maxPrice: params['maxPrice'],
            tags: params['tags'],
            color: params['color'],
            size: params['size'],
            limit: params['limit'],
            offset: params['offset'],
          ),
        ),
        'updateInventory': _i1.MethodConnector(
          name: 'updateInventory',
          params: {
            'productId': _i1.ParameterDescription(
              name: 'productId',
              type: _i1.getType<_i13.UuidValue>(),
              nullable: false,
            ),
            'quantity': _i1.ParameterDescription(
              name: 'quantity',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['product'] as _i7.ProductEndpoint).updateInventory(
            session,
            productId: params['productId'],
            quantity: params['quantity'],
          ),
        ),
        'decrementInventory': _i1.MethodConnector(
          name: 'decrementInventory',
          params: {
            'productId': _i1.ParameterDescription(
              name: 'productId',
              type: _i1.getType<_i13.UuidValue>(),
              nullable: false,
            ),
            'quantity': _i1.ParameterDescription(
              name: 'quantity',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['product'] as _i7.ProductEndpoint).decrementInventory(
            session,
            productId: params['productId'],
            quantity: params['quantity'],
          ),
        ),
        'getFeaturedProducts': _i1.MethodConnector(
          name: 'getFeaturedProducts',
          params: {
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['product'] as _i7.ProductEndpoint).getFeaturedProducts(
            session,
            limit: params['limit'],
          ),
        ),
        'getProductsByCategory': _i1.MethodConnector(
          name: 'getProductsByCategory',
          params: {
            'category': _i1.ParameterDescription(
              name: 'category',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'subCategory': _i1.ParameterDescription(
              name: 'subCategory',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'offset': _i1.ParameterDescription(
              name: 'offset',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['product'] as _i7.ProductEndpoint)
                  .getProductsByCategory(
            session,
            category: params['category'],
            subCategory: params['subCategory'],
            limit: params['limit'],
            offset: params['offset'],
          ),
        ),
      },
    );
    connectors['subscription'] = _i1.EndpointConnector(
      name: 'subscription',
      endpoint: endpoints['subscription']!,
      methodConnectors: {
        'getVendorSubscription': _i1.MethodConnector(
          name: 'getVendorSubscription',
          params: {
            'vendorId': _i1.ParameterDescription(
              name: 'vendorId',
              type: _i1.getType<_i13.UuidValue>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['subscription'] as _i8.SubscriptionEndpoint)
                  .getVendorSubscription(
            session,
            params['vendorId'],
          ),
        ),
        'changeTier': _i1.MethodConnector(
          name: 'changeTier',
          params: {
            'vendorId': _i1.ParameterDescription(
              name: 'vendorId',
              type: _i1.getType<_i13.UuidValue>(),
              nullable: false,
            ),
            'newTier': _i1.ParameterDescription(
              name: 'newTier',
              type: _i1.getType<_i23.SubscriptionTier>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['subscription'] as _i8.SubscriptionEndpoint)
                  .changeTier(
            session,
            vendorId: params['vendorId'],
            newTier: params['newTier'],
          ),
        ),
        'getUsageRecords': _i1.MethodConnector(
          name: 'getUsageRecords',
          params: {
            'vendorId': _i1.ParameterDescription(
              name: 'vendorId',
              type: _i1.getType<_i13.UuidValue>(),
              nullable: false,
            ),
            'periodStart': _i1.ParameterDescription(
              name: 'periodStart',
              type: _i1.getType<DateTime>(),
              nullable: false,
            ),
            'periodEnd': _i1.ParameterDescription(
              name: 'periodEnd',
              type: _i1.getType<DateTime>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['subscription'] as _i8.SubscriptionEndpoint)
                  .getUsageRecords(
            session,
            vendorId: params['vendorId'],
            periodStart: params['periodStart'],
            periodEnd: params['periodEnd'],
          ),
        ),
        'generateInvoice': _i1.MethodConnector(
          name: 'generateInvoice',
          params: {
            'subscriptionId': _i1.ParameterDescription(
              name: 'subscriptionId',
              type: _i1.getType<_i13.UuidValue>(),
              nullable: false,
            ),
            'periodStart': _i1.ParameterDescription(
              name: 'periodStart',
              type: _i1.getType<DateTime>(),
              nullable: false,
            ),
            'periodEnd': _i1.ParameterDescription(
              name: 'periodEnd',
              type: _i1.getType<DateTime>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['subscription'] as _i8.SubscriptionEndpoint)
                  .generateInvoice(
            session,
            subscriptionId: params['subscriptionId'],
            periodStart: params['periodStart'],
            periodEnd: params['periodEnd'],
          ),
        ),
        'checkTierLimits': _i1.MethodConnector(
          name: 'checkTierLimits',
          params: {
            'vendorId': _i1.ParameterDescription(
              name: 'vendorId',
              type: _i1.getType<_i13.UuidValue>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['subscription'] as _i8.SubscriptionEndpoint)
                  .checkTierLimits(
            session,
            params['vendorId'],
          ),
        ),
      },
    );
    connectors['telegramWebhook'] = _i1.EndpointConnector(
      name: 'telegramWebhook',
      endpoint: endpoints['telegramWebhook']!,
      methodConnectors: {
        'processWebhook': _i1.MethodConnector(
          name: 'processWebhook',
          params: {
            'payload': _i1.ParameterDescription(
              name: 'payload',
              type: _i1.getType<Map<String, dynamic>>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['telegramWebhook'] as _i9.TelegramWebhookEndpoint)
                  .processWebhook(
            session,
            params['payload'],
          ),
        )
      },
    );
    connectors['usage'] = _i1.EndpointConnector(
      name: 'usage',
      endpoint: endpoints['usage']!,
      methodConnectors: {
        'resetDailyLimits': _i1.MethodConnector(
          name: 'resetDailyLimits',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['usage'] as _i10.UsageEndpoint)
                  .resetDailyLimits(session),
        )
      },
    );
    connectors['user'] = _i1.EndpointConnector(
      name: 'user',
      endpoint: endpoints['user']!,
      methodConnectors: {
        'updateProfile': _i1.MethodConnector(
          name: 'updateProfile',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<_i13.UuidValue>(),
              nullable: false,
            ),
            'firstName': _i1.ParameterDescription(
              name: 'firstName',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'lastName': _i1.ParameterDescription(
              name: 'lastName',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'profileImageUrl': _i1.ParameterDescription(
              name: 'profileImageUrl',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'city': _i1.ParameterDescription(
              name: 'city',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'state': _i1.ParameterDescription(
              name: 'state',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'country': _i1.ParameterDescription(
              name: 'country',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'language': _i1.ParameterDescription(
              name: 'language',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'timezone': _i1.ParameterDescription(
              name: 'timezone',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i11.UserEndpoint).updateProfile(
            session,
            userId: params['userId'],
            firstName: params['firstName'],
            lastName: params['lastName'],
            email: params['email'],
            profileImageUrl: params['profileImageUrl'],
            city: params['city'],
            state: params['state'],
            country: params['country'],
            language: params['language'],
            timezone: params['timezone'],
          ),
        ),
        'getCustomerProfile': _i1.MethodConnector(
          name: 'getCustomerProfile',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<_i13.UuidValue>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i11.UserEndpoint).getCustomerProfile(
            session,
            params['userId'],
          ),
        ),
        'updateCustomerProfile': _i1.MethodConnector(
          name: 'updateCustomerProfile',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<_i13.UuidValue>(),
              nullable: false,
            ),
            'preferredPaymentMethod': _i1.ParameterDescription(
              name: 'preferredPaymentMethod',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'favoriteVendors': _i1.ParameterDescription(
              name: 'favoriteVendors',
              type: _i1.getType<List<String>?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i11.UserEndpoint).updateCustomerProfile(
            session,
            userId: params['userId'],
            preferredPaymentMethod: params['preferredPaymentMethod'],
            favoriteVendors: params['favoriteVendors'],
          ),
        ),
        'getVendorProfile': _i1.MethodConnector(
          name: 'getVendorProfile',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<_i13.UuidValue>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i11.UserEndpoint).getVendorProfile(
            session,
            params['userId'],
          ),
        ),
        'updateVendorProfile': _i1.MethodConnector(
          name: 'updateVendorProfile',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<_i13.UuidValue>(),
              nullable: false,
            ),
            'businessName': _i1.ParameterDescription(
              name: 'businessName',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'businessDescription': _i1.ParameterDescription(
              name: 'businessDescription',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'businessCategory': _i1.ParameterDescription(
              name: 'businessCategory',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'businessLogoUrl': _i1.ParameterDescription(
              name: 'businessLogoUrl',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'businessBannerUrl': _i1.ParameterDescription(
              name: 'businessBannerUrl',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'supportEmail': _i1.ParameterDescription(
              name: 'supportEmail',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'supportPhone': _i1.ParameterDescription(
              name: 'supportPhone',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i11.UserEndpoint).updateVendorProfile(
            session,
            userId: params['userId'],
            businessName: params['businessName'],
            businessDescription: params['businessDescription'],
            businessCategory: params['businessCategory'],
            businessLogoUrl: params['businessLogoUrl'],
            businessBannerUrl: params['businessBannerUrl'],
            supportEmail: params['supportEmail'],
            supportPhone: params['supportPhone'],
          ),
        ),
        'addAddress': _i1.MethodConnector(
          name: 'addAddress',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<_i13.UuidValue>(),
              nullable: false,
            ),
            'label': _i1.ParameterDescription(
              name: 'label',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'recipientName': _i1.ParameterDescription(
              name: 'recipientName',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'phoneNumber': _i1.ParameterDescription(
              name: 'phoneNumber',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'addressLine1': _i1.ParameterDescription(
              name: 'addressLine1',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'addressLine2': _i1.ParameterDescription(
              name: 'addressLine2',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'city': _i1.ParameterDescription(
              name: 'city',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'state': _i1.ParameterDescription(
              name: 'state',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'country': _i1.ParameterDescription(
              name: 'country',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'postalCode': _i1.ParameterDescription(
              name: 'postalCode',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'landmark': _i1.ParameterDescription(
              name: 'landmark',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'isDefault': _i1.ParameterDescription(
              name: 'isDefault',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
            'latitude': _i1.ParameterDescription(
              name: 'latitude',
              type: _i1.getType<double?>(),
              nullable: true,
            ),
            'longitude': _i1.ParameterDescription(
              name: 'longitude',
              type: _i1.getType<double?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i11.UserEndpoint).addAddress(
            session,
            userId: params['userId'],
            label: params['label'],
            recipientName: params['recipientName'],
            phoneNumber: params['phoneNumber'],
            addressLine1: params['addressLine1'],
            addressLine2: params['addressLine2'],
            city: params['city'],
            state: params['state'],
            country: params['country'],
            postalCode: params['postalCode'],
            landmark: params['landmark'],
            isDefault: params['isDefault'],
            latitude: params['latitude'],
            longitude: params['longitude'],
          ),
        ),
        'getUserAddresses': _i1.MethodConnector(
          name: 'getUserAddresses',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<_i13.UuidValue>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i11.UserEndpoint).getUserAddresses(
            session,
            params['userId'],
          ),
        ),
        'setDefaultAddress': _i1.MethodConnector(
          name: 'setDefaultAddress',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<_i13.UuidValue>(),
              nullable: false,
            ),
            'addressId': _i1.ParameterDescription(
              name: 'addressId',
              type: _i1.getType<_i13.UuidValue>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i11.UserEndpoint).setDefaultAddress(
            session,
            userId: params['userId'],
            addressId: params['addressId'],
          ),
        ),
      },
    );
    connectors['whatsAppWebhook'] = _i1.EndpointConnector(
      name: 'whatsAppWebhook',
      endpoint: endpoints['whatsAppWebhook']!,
      methodConnectors: {
        'verifyWebhook': _i1.MethodConnector(
          name: 'verifyWebhook',
          params: {
            'mode': _i1.ParameterDescription(
              name: 'mode',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'token': _i1.ParameterDescription(
              name: 'token',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'challenge': _i1.ParameterDescription(
              name: 'challenge',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['whatsAppWebhook'] as _i12.WhatsAppWebhookEndpoint)
                  .verifyWebhook(
            session,
            mode: params['mode'],
            token: params['token'],
            challenge: params['challenge'],
          ),
        ),
        'processWebhook': _i1.MethodConnector(
          name: 'processWebhook',
          params: {
            'payload': _i1.ParameterDescription(
              name: 'payload',
              type: _i1.getType<Map<String, dynamic>>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['whatsAppWebhook'] as _i12.WhatsAppWebhookEndpoint)
                  .processWebhook(
            session,
            params['payload'],
          ),
        ),
      },
    );
  }
}
