// File: server/lib/src/endpoints/payment_endpoint.dart

import 'dart:convert';
import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';
import '../services/payment/paystack_service.dart';
import '../../utils/logger/asami_logger.dart';

class PaymentEndpoint extends Endpoint {
  /// Initialize payment for a product (Buy Now)
  Future<Map<String, dynamic>> initializeProductPayment(
    Session session, {
    required String userId,
    required String productId,
    required String conversationId,
    required PlatformType platform,
    int quantity = 1,
  }) async {
    Log.setSession(session);

    try {
      Log.info('💳 Initializing product payment',
          data: {
            'userId': userId,
            'productId': productId,
            'quantity': quantity,
            'platform': platform.name,
          },
          session: session);

      // ========== STEP 1: GET USER ==========
      Log.debug('📝 Fetching user...', session: session);
      final user = await User.db.findById(
        session,
        UuidValue.fromString(userId),
      );

      if (user == null) {
        Log.error('❌ User not found', error: userId, session: session);
        return {'success': false, 'error': 'User not found'};
      }

      Log.success('✅ User found',
          data: {
            'email': user.email,
            'phone': user.phoneNumber.isNotEmpty
                ? user.phoneNumber
                : user.whatsappId,
          },
          session: session);

      // ========== STEP 2: GET PRODUCT ==========
      Log.debug('📦 Fetching product...', session: session);
      final product = await Product.db.findById(
        session,
        UuidValue.fromString(productId),
      );

      if (product == null) {
        Log.error('❌ Product not found', error: productId, session: session);
        return {'success': false, 'error': 'Product not found'};
      }

      Log.success('✅ Product found',
          data: {
            'name': product.name,
            'price': product.basePrice,
            'stock': product.quantity,
          },
          session: session);

      // ========== STEP 3: CHECK STOCK ==========
      Log.debug('📊 Checking stock availability...', session: session);
      if (product.quantity < quantity) {
        Log.warning('⚠️ Insufficient stock',
            data: {
              'requested': quantity,
              'available': product.quantity,
            },
            session: session);

        return {
          'success': false,
          'error': 'Insufficient stock. Only ${product.quantity} available',
        };
      }

      Log.success('✅ Stock available', session: session);

      // ========== STEP 4: CALCULATE AMOUNTS ==========
      Log.debug('💰 Calculating payment amounts...', session: session);

      final productPrice = product.discountPrice ?? product.basePrice;
      final subtotal = productPrice * quantity;
      final shippingCost = product.freeShipping ? 0.0 : product.shippingCost;
      final totalAmount = subtotal + shippingCost;

      Log.info('💵 Amount breakdown',
          data: {
            'unit_price': productPrice,
            'quantity': quantity,
            'subtotal': subtotal,
            'shipping': shippingCost,
            'total': totalAmount,
          },
          session: session);

      // ========== STEP 5: GENERATE REFERENCE ==========
      final reference = PaystackService.generateReference(prefix: 'PROD');
      Log.info('🔑 Generated reference',
          data: {'reference': reference}, session: session);

      // ========== STEP 6: CALCULATE FEES ==========
      final paystackFee = PaystackService.calculatePaystackFee(totalAmount);
      final netAmount = totalAmount - paystackFee;

      Log.info('💸 Fee calculation',
          data: {
            'paystack_fee': paystackFee,
            'net_amount': netAmount,
          },
          session: session);

      // ========== STEP 7: GET PAYSTACK SERVICE ==========
      Log.debug('🔌 Initializing Paystack service...', session: session);

      final secretKey = session.serverpod.getPassword('paystackSecretKey');
      final publicKey = session.serverpod.getPassword('paystackPublicKey');

      if (secretKey == null || secretKey.isEmpty) {
        Log.critical('❌ Paystack secret key not configured', session: session);
        return {'success': false, 'error': 'Payment gateway not configured'};
      }

      final paystackService = PaystackService(
        secretKey: secretKey,
        publicKey: publicKey ?? '',
      );

      Log.success('✅ Paystack service initialized', session: session);

      // ========== STEP 8: SET EXPIRY ==========
      final expiresAt = DateTime.now().add(Duration(minutes: 30));
      Log.debug('⏰ Payment expiry set',
          data: {
            'expires_at': expiresAt.toIso8601String(),
          },
          session: session);

      // ========== STEP 9: BUILD METADATA ==========
      final metadata = {
        'product_id': productId,
        'vendor_id': product.vendorId.uuid,
        'user_id': userId,
        'conversation_id': conversationId,
        'product_name': product.name,
        'quantity': quantity,
        'unit_price': product.basePrice,
        'platform': platform.name,
        'subtotal': subtotal,
        'shipping': shippingCost,
        'total': totalAmount,
        'paystack_fee': paystackFee,
        'net_amount': netAmount,
      };

      Log.debug('📋 Payment metadata', data: metadata, session: session);

      // ========== STEP 10: INITIALIZE WITH PAYSTACK ==========
      Log.apiRequest(
        endpoint: 'Paystack /transaction/initialize',
        method: 'POST',
        params: {
          'email': user.email ?? user.phoneNumber,
          'amount': totalAmount,
          'reference': reference,
        },
        session: session,
      );

      final initResult = await paystackService.initializeTransaction(
        email: user.email ?? user.phoneNumber,
        amount: totalAmount,
        reference: reference,
        metadata: metadata,
        channels: [
          'card',
          'bank',
          'ussd',
          'qr',
          'mobile_money',
          'bank_transfer'
        ],
      );

      Log.apiResponse(
        endpoint: 'Paystack /transaction/initialize',
        statusCode: initResult['success'] ? 200 : 400,
        data: initResult,
        session: session,
      );

      if (!initResult['success']) {
        Log.paymentFailed(
          reference: reference,
          reason: initResult['error'] ?? 'Unknown error',
          session: session,
        );

        return {
          'success': false,
          'error': initResult['error'],
        };
      }

      Log.success('✅ Paystack initialization successful',
          data: {
            'authorization_url': initResult['authorization_url'],
            'access_code': initResult['access_code'],
          },
          session: session);

      // ========== STEP 11: CREATE TRANSACTION RECORD ==========
      Log.debug('💾 Creating transaction record...', session: session);

      final transaction = PaymentTransaction(
        reference: reference,
        userId: user.id,
        amount: totalAmount,
        currency: product.currency,
        customerEmail: user.email ?? user.phoneNumber,
        customerPhone: user.phoneNumber,
        customerName: '${user.firstName ?? ''} ${user.lastName ?? ''}'.trim(),
        authorizationUrl: initResult['authorization_url'],
        accessCode: initResult['access_code'],
        platformType: platform,
        conversationId: UuidValue.fromString(conversationId),
        expiresAt: expiresAt,
        paystackFee: paystackFee,
        netAmount: netAmount,
        metadata: jsonEncode(metadata),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await PaymentTransaction.db.insertRow(session, transaction);

      Log.success('✅ Transaction record created',
          data: {
            'transaction_id': transaction.id.uuid,
            'reference': reference,
          },
          session: session);

      Log.paymentInit(
        reference: reference,
        amount: totalAmount,
        userId: userId,
        productId: productId,
        session: session,
      );

      return {
        'success': true,
        'reference': reference,
        'authorization_url': initResult['authorization_url'],
        'access_code': initResult['access_code'],
        'amount': totalAmount,
        'expires_at': expiresAt.toIso8601String(),
        'expires_in_minutes': 30,
      };
    } catch (e, stackTrace) {
      Log.error(
        'Payment initialization error',
        error: e,
        stackTrace: stackTrace,
        session: session,
      );

      return {
        'success': false,
        'error': 'Failed to initialize payment: ${e.toString()}',
      };
    } finally {
      Log.clearSession();
    }
  }

  /// Initialize payment for cart checkout
  Future<Map<String, dynamic>> initializeCartPayment(
    Session session, {
    required String userId,
    required String conversationId,
    required PlatformType platform,
    required String shippingAddressId,
  }) async {
    Log.setSession(session);

    try {
      Log.info('🛒 Initializing cart payment',
          data: {
            'userId': userId,
            'platform': platform.name,
          },
          session: session);

      // ========== STEP 1: GET USER ==========
      Log.debug('📝 Fetching user...', session: session);
      final user = await User.db.findById(
        session,
        UuidValue.fromString(userId),
      );

      if (user == null) {
        Log.error('❌ User not found', error: userId, session: session);
        return {'success': false, 'error': 'User not found'};
      }

      Log.success('✅ User found', session: session);

      // ========== STEP 2: GET CART ==========
      Log.debug('🛒 Fetching cart...', session: session);
      final cartData = await Cart.db.findFirstRow(
        session,
        where: (t) => t.customerId.equals(user.id) & t.isActive.equals(true),
      );

      if (cartData == null) {
        Log.warning('⚠️ Cart not found or empty', session: session);
        return {'success': false, 'error': 'Cart is empty'};
      }

      Log.success('✅ Cart found',
          data: {
            'cart_id': cartData.id.uuid,
            'subtotal': cartData.subtotal,
          },
          session: session);

      // ========== STEP 3: GET CART ITEMS ==========
      Log.debug('📦 Fetching cart items...', session: session);
      final cartItems = await CartItem.db.find(
        session,
        where: (t) => t.cartId.equals(cartData.id),
      );

      if (cartItems.isEmpty) {
        Log.warning('⚠️ No items in cart', session: session);
        return {'success': false, 'error': 'Cart is empty'};
      }

      Log.success('✅ Cart items found',
          data: {
            'item_count': cartItems.length,
          },
          session: session);

      final totalAmount = cartData.subtotal;

      // ========== STEP 4: GENERATE REFERENCE ==========
      final reference = PaystackService.generateReference(prefix: 'CART');
      Log.info('🔑 Generated reference',
          data: {'reference': reference}, session: session);

      // ========== STEP 5: GET PAYSTACK SERVICE ==========
      final paystackService = PaystackService(
        secretKey: session.serverpod.getPassword('paystackSecretKey') ?? '',
        publicKey: session.serverpod.getPassword('paystackPublicKey') ?? '',
      );

      final expiresAt = DateTime.now().add(Duration(minutes: 30));

      // ========== STEP 6: INITIALIZE WITH PAYSTACK ==========
      Log.apiRequest(
        endpoint: 'Paystack /transaction/initialize',
        method: 'POST',
        params: {
          'cart_id': cartData.id.uuid,
          'amount': totalAmount,
        },
        session: session,
      );

      final initResult = await paystackService.initializeTransaction(
        email: user.email ?? user.phoneNumber,
        amount: totalAmount,
        reference: reference,
        metadata: {
          'cart_id': cartData.id.uuid,
          'item_count': cartItems.length,
          'user_id': userId,
          'conversation_id': conversationId,
          'platform': platform.name,
          'shipping_address_id': shippingAddressId,
        },
      );

      Log.apiResponse(
        endpoint: 'Paystack /transaction/initialize',
        statusCode: initResult['success'] ? 200 : 400,
        data: initResult,
        session: session,
      );

      if (!initResult['success']) {
        Log.paymentFailed(
          reference: reference,
          reason: initResult['error'] ?? 'Unknown error',
          session: session,
        );

        return {
          'success': false,
          'error': initResult['error'],
        };
      }

      // ========== STEP 7: CREATE TRANSACTION RECORD ==========
      final paystackFee = PaystackService.calculatePaystackFee(totalAmount);

      final transaction = PaymentTransaction(
        reference: reference,
        userId: user.id,
        amount: totalAmount,
        currency: 'NGN',
        customerEmail: user.email ?? user.phoneNumber,
        customerPhone: user.phoneNumber,
        customerName: '${user.firstName ?? ''} ${user.lastName ?? ''}'.trim(),
        authorizationUrl: initResult['authorization_url'],
        accessCode: initResult['access_code'],
        platformType: platform,
        conversationId: UuidValue.fromString(conversationId),
        expiresAt: expiresAt,
        paystackFee: paystackFee,
        netAmount: totalAmount - paystackFee,
        metadata: jsonEncode({
          'cart_id': cartData.id.uuid,
          'item_count': cartItems.length,
          'shipping_address_id': shippingAddressId,
        }),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await PaymentTransaction.db.insertRow(session, transaction);

      Log.paymentInit(
        reference: reference,
        amount: totalAmount,
        userId: userId,
        cartId: cartData.id.uuid,
        session: session,
      );

      return {
        'success': true,
        'reference': reference,
        'authorization_url': initResult['authorization_url'],
        'access_code': initResult['access_code'],
        'amount': totalAmount,
        'expires_at': expiresAt.toIso8601String(),
      };
    } catch (e, stackTrace) {
      Log.error(
        'Cart payment initialization error',
        error: e,
        stackTrace: stackTrace,
        session: session,
      );

      return {
        'success': false,
        'error': 'Failed to initialize payment: ${e.toString()}',
      };
    } finally {
      Log.clearSession();
    }
  }

  /// Verify payment transaction
  Future<Map<String, dynamic>> verifyPayment(
    Session session,
    String reference,
  ) async {
    Log.setSession(session);

    try {
      Log.info('🔍 Verifying payment',
          data: {'reference': reference}, session: session);

      // ========== STEP 1: GET TRANSACTION ==========
      Log.debug('💾 Fetching transaction from database...', session: session);
      final transaction = await PaymentTransaction.db.findFirstRow(
        session,
        where: (t) => t.reference.equals(reference),
      );

      if (transaction == null) {
        Log.error('❌ Transaction not found in database',
            error: reference, session: session);
        return {'success': false, 'error': 'Transaction not found'};
      }

      Log.success('✅ Transaction found',
          data: {
            'status': transaction.status.name,
            'amount': transaction.amount,
          },
          session: session);

      // ========== STEP 2: CHECK IF ALREADY VERIFIED ==========
      if (transaction.status == PaymentStatus.completed) {
        Log.info('ℹ️ Transaction already verified', session: session);
        return {
          'success': true,
          'status': 'already_verified',
          'transaction': transaction,
        };
      }

      // ========== STEP 3: GET PAYSTACK SERVICE ==========
      final paystackService = PaystackService(
        secretKey: session.serverpod.getPassword('paystackSecretKey') ?? '',
        publicKey: session.serverpod.getPassword('paystackPublicKey') ?? '',
      );

      // ========== STEP 4: VERIFY WITH PAYSTACK ==========
      Log.apiRequest(
        endpoint: 'Paystack /transaction/verify/$reference',
        method: 'GET',
        session: session,
      );

      final verifyResult = await paystackService.verifyTransaction(reference);

      Log.apiResponse(
        endpoint: 'Paystack /transaction/verify',
        statusCode: verifyResult['success'] ? 200 : 400,
        data: verifyResult,
        session: session,
      );

      if (!verifyResult['success']) {
        Log.warning('⚠️ Paystack verification failed',
            data: {
              'error': verifyResult['error'],
            },
            session: session);

        transaction.verificationAttempts++;
        transaction.failureReason = verifyResult['error'];
        await PaymentTransaction.db.updateRow(session, transaction);

        return {
          'success': false,
          'error': verifyResult['error'],
        };
      }

      // ========== STEP 5: UPDATE TRANSACTION ==========
      Log.debug('💾 Updating transaction status...', session: session);

      final oldStatus = transaction.status;
      transaction.status = verifyResult['status'] == 'success'
          ? PaymentStatus.completed
          : PaymentStatus.failed;
      transaction.paidAt = verifyResult['paid_at'] != null
          ? DateTime.parse(verifyResult['paid_at'])
          : null;
      transaction.channel = verifyResult['channel'];
      transaction.transactionId = verifyResult['reference'];
      transaction.verifiedAt = DateTime.now();
      transaction.gatewayResponse = jsonEncode(verifyResult);
      transaction.updatedAt = DateTime.now();

      await PaymentTransaction.db.updateRow(session, transaction);

      Log.stateChange(
        entity: 'PaymentTransaction',
        from: oldStatus.name,
        to: transaction.status.name,
        session: session,
      );

      if (transaction.status == PaymentStatus.completed) {
        Log.paymentSuccess(
          reference: reference,
          amount: transaction.amount,
          session: session,
        );
      } else {
        Log.paymentFailed(
          reference: reference,
          reason: 'Verification returned failed status',
          session: session,
        );
      }

      return {
        'success': true,
        'status': transaction.status.name,
        'transaction': transaction,
        'verification_data': verifyResult,
      };
    } catch (e, stackTrace) {
      Log.error(
        'Payment verification error',
        error: e,
        stackTrace: stackTrace,
        session: session,
      );

      return {
        'success': false,
        'error': 'Verification failed: ${e.toString()}',
      };
    } finally {
      Log.clearSession();
    }
  }

  /// Get transaction by reference
  Future<PaymentTransaction?> getTransaction(
    Session session,
    String reference,
  ) async {
    Log.setSession(session);
    Log.debug('🔎 Getting transaction',
        data: {'reference': reference}, session: session);

    try {
      final transaction = await PaymentTransaction.db.findFirstRow(
        session,
        where: (t) => t.reference.equals(reference),
      );

      if (transaction != null) {
        Log.success('✅ Transaction retrieved', session: session);
      } else {
        Log.warning('⚠️ Transaction not found', session: session);
      }

      return transaction;
    } finally {
      Log.clearSession();
    }
  }

  /// Get user transactions
  Future<List<PaymentTransaction>> getUserTransactions(
    Session session, {
    required String userId,
    PaymentStatus? status,
    int limit = 20,
  }) async {
    Log.setSession(session);
    Log.debug('📋 Getting user transactions',
        data: {
          'userId': userId,
          'status': status?.name,
          'limit': limit,
        },
        session: session);

    try {
      final transactions = await PaymentTransaction.db.find(
        session,
        where: (t) => status != null
            ? t.userId.equals(UuidValue.fromString(userId)) &
                t.status.equals(status)
            : t.userId.equals(UuidValue.fromString(userId)),
        orderBy: (t) => t.createdAt,
        orderDescending: true,
        limit: limit,
      );

      Log.success('✅ Retrieved ${transactions.length} transactions',
          session: session);
      return transactions;
    } finally {
      Log.clearSession();
    }
  }

  /// Mark expired transactions
  Future<int> markExpiredTransactions(Session session) async {
    Log.setSession(session);
    Log.info('⏰ Marking expired transactions...', session: session);

    try {
      final now = DateTime.now();

      final expiredTransactions = await PaymentTransaction.db.find(
        session,
        where: (t) =>
            t.status.equals(PaymentStatus.pending) &
            (t.expiresAt < now) &
            t.isExpired.equals(false),
      );

      Log.info('Found ${expiredTransactions.length} expired transactions',
          session: session);

      for (var transaction in expiredTransactions) {
        transaction.isExpired = true;
        transaction.status = PaymentStatus.expired;
        transaction.failureReason = 'Payment link expired';
        transaction.updatedAt = now;

        await PaymentTransaction.db.updateRow(session, transaction);

        Log.warning('⏰ Expired transaction',
            data: {
              'reference': transaction.reference,
            },
            session: session);
      }

      Log.success(
          '✅ Marked ${expiredTransactions.length} transactions as expired',
          session: session);
      return expiredTransactions.length;
    } finally {
      Log.clearSession();
    }
  }
}
