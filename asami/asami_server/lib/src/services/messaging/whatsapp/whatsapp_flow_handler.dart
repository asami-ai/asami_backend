// File: server/lib/src/services/messaging/whatsapp/whatsapp_flow_handler.dart

import 'dart:convert';
import 'dart:io';
import 'package:serverpod/serverpod.dart';
import '../../../generated/protocol.dart';
import '../../../endpoints/auth_endpoint.dart';
import '../../../endpoints/product_endpoint.dart';
import '../../auth/auth_state_manager.dart';
import '../../auth/auth_service.dart';

/// Handles WhatsApp Flow completions and data exchange
class WhatsAppFlowHandler {
  final AuthStateManager authStateManager = AuthStateManager();

  /// Process Flow webhook
  Future<Map<String, dynamic>> processFlowWebhook(
    Session session,
    Map<String, dynamic> payload,
  ) async {
    try {
      final flowToken = payload['flow_token'] as String?;
      final action = payload['action'] as String?; // 'data_exchange', 'complete'
      final screenId = payload['screen'] as String?;
      final data = payload['data'] as Map<String, dynamic>?;

      session.log('Flow webhook received: action=$action, screen=$screenId');

      if (action == 'data_exchange') {
        // Mid-flow validation or data processing
        return await _handleDataExchange(session, screenId, data, flowToken);
      } else if (action == 'complete') {
        // Flow completed, process final data
        return await _handleFlowCompletion(session, screenId, data, flowToken);
      }

      return {'error': 'Unknown action'};
    } catch (e, stackTrace) {
      session.log('Flow webhook error: $e', stackTrace: stackTrace);
      return {'error': e.toString()};
    }
  }

  /// Handle mid-flow data exchange (e.g., email validation)
  Future<Map<String, dynamic>> _handleDataExchange(
    Session session,
    String? screenId,
    Map<String, dynamic>? data,
    String? flowToken,
  ) async {
    switch (screenId) {
      case 'CONTACT_INFO':
        // Validate email in real-time
        final email = data?['email'] as String?;
        if (email != null) {
          final authService = AuthService(session);
          if (await authService.emailExists(email)) {
            return {
              'error': 'Email already exists',
              'error_message': 'This email is already registered. Please use a different email or login instead.',
            };
          }
        }
        return {'success': true};

      case 'VERIFICATION':
        // Validate verification code
        final code = data?['verification_code'] as String?;
        final email = data?['email'] as String?;
        
        if (code != null && email != null) {
          final authService = AuthService(session);
          final result = await authService.verifyCode(
            email: email,
            code: code,
          );
          
          if (!result['success']) {
            return {
              'error': 'Invalid code',
              'error_message': result['error'] ?? 'Verification failed',
            };
          }
        }
        return {'success': true};

      default:
        return {'success': true};
    }
  }

  /// Handle flow completion
  Future<Map<String, dynamic>> _handleFlowCompletion(
    Session session,
    String? screenId,
    Map<String, dynamic>? data,
    String? flowToken,
  ) async {
    // Extract platform user ID from flow token or data
    final platformUserId = _extractPlatformUserId(flowToken, data);
    
    if (platformUserId == null) {
      return {'error': 'Missing platform user ID'};
    }

    // Determine flow type and process accordingly
    if (_isSignupFlow(screenId, data)) {
      return await _handleSignupFlow(session, data!, platformUserId);
    } else if (_isProductCreationFlow(screenId, data)) {
      return await _handleProductCreationFlow(session, data!, platformUserId);
    } else if (_isCheckoutFlow(screenId, data)) {
      return await _handleCheckoutFlow(session, data!, platformUserId);
    }

    return {'error': 'Unknown flow type'};
  }

  /// Handle signup flow completion
  Future<Map<String, dynamic>> _handleSignupFlow(
    Session session,
    Map<String, dynamic> data,
    String platformUserId,
  ) async {
    try {
      final email = data['email'] as String;
      final userTypeStr = data['user_type'] as String;
      final firstName = data['first_name'] as String?;
      final lastName = data['last_name'] as String?;
      final phone = data['phone'] as String?;
      final businessName = data['business_name'] as String?;

      final userType = userTypeStr == 'vendor' 
          ? UserType.vendor 
          : UserType.customer;

      // Check if temp conversation exists
      var tempConversation = await authStateManager.getTempAuthConversation(
        session,
        platform: PlatformType.whatsapp,
        platformUserId: platformUserId,
      );

      tempConversation ??= await authStateManager.createTempAuthConversation(
          session,
          platform: PlatformType.whatsapp,
          platformUserId: platformUserId,
          initialState: AuthState.SIGNUP_AWAITING_CODE,
          userType: userType,
          initialData: {
            'auth_email': email,
            'auth_first_name': firstName,
            'auth_last_name': lastName,
            'auth_phone': phone,
            'auth_business_name': businessName,
          },
        );

      // Initiate signup (sends verification code)
      final result = await AuthEndpoint().initiateSignup(
        session,
        email: email,
        userType: userType,
        phoneNumber: phone,
        firstName: firstName,
        lastName: lastName,
        platform: PlatformType.whatsapp,
        platformUserId: platformUserId,
      );

      if (!result['success']) {
        return {
          'error': result['error'],
          'message': result['message'],
        };
      }

      // Update temp conversation state
      await authStateManager.updateState(
        session,
        conversation: tempConversation,
        newState: AuthState.SIGNUP_AWAITING_CODE,
        additionalData: {
          'auth_email': email,
          'auth_user_id': result['user_id'],
          'auth_code_sent_at': DateTime.now().toIso8601String(),
        },
      );

      return {
        'success': true,
        'message': 'Verification code sent to $email',
      };
    } catch (e) {
      session.log('Signup flow error: $e');
      return {
        'error': 'signup_failed',
        'message': 'Failed to complete signup',
      };
    }
  }

  /// Handle product creation flow completion
  Future<Map<String, dynamic>> _handleProductCreationFlow(
    Session session,
    Map<String, dynamic> data,
    String platformUserId,
  ) async {
    try {
      // Get authenticated user
      final user = await User.db.findFirstRow(
        session,
        where: (t) => t.whatsappId.equals(platformUserId) & 
                     t.whatsappAuthenticated.equals(true),
      );

      if (user == null) {
        return {'error': 'User not authenticated'};
      }

      if (user.userType != UserType.vendor) {
        return {'error': 'Only vendors can create products'};
      }

      // Extract product data
      final name = data['product_name'] as String;
      final description = data['description'] as String;
      final shortDescription = data['short_description'] as String?;
      final category = data['category'] as String;
      final basePrice = (data['base_price'] as num).toDouble();
      final discountPrice = (data['discount_price'] as num?)?.toDouble();
      final quantity = (data['quantity'] as num?)?.toInt() ?? 0;
      final sku = data['sku'] as String?;
      
      // Parse comma-separated lists
      final colors = (data['colors'] as String?)?.split(',')
          .map((s) => s.trim()).where((s) => s.isNotEmpty).toList();
      final sizes = (data['sizes'] as String?)?.split(',')
          .map((s) => s.trim()).where((s) => s.isNotEmpty).toList();
      
      final material = data['material'] as String?;
      final brand = data['brand'] as String?;
      final freeShipping = data['free_shipping'] == 'free';
      final shippingCost = freeShipping ? 0.0 : 
          (data['shipping_cost'] as num?)?.toDouble() ?? 0.0;
      final deliveryDays = (data['delivery_days'] as num?)?.toInt();
      final weight = (data['weight'] as num?)?.toDouble();

      // Create product
      final product = await ProductEndpoint().createProduct(
        session,
        vendorId: user.id,
        name: name,
        description: description,
        shortDescription: shortDescription,
        category: category,
        basePrice: basePrice,
        quantity: quantity,
        sku: sku,
        color: colors,
        size: sizes,
        material: material,
        brand: brand,
        weight: weight,
        isAiGenerated: false,
      );

      if (product == null) {
        return {
          'error': 'product_creation_failed',
          'message': 'Failed to create product. You may have reached your limit.',
        };
      }

      // Update product with shipping info
      await ProductEndpoint().updateProduct(
        session,
        productId: product.id,
        discountPrice: discountPrice,
      );

      return {
        'success': true,
        'message': 'Product created successfully!',
        'product_id': product.id.uuid,
        'product_name': product.name,
      };
    } catch (e) {
      session.log('Product creation error: $e');
      return {
        'error': 'product_creation_failed',
        'message': 'Failed to create product',
      };
    }
  }

  /// Handle checkout flow completion
  Future<Map<String, dynamic>> _handleCheckoutFlow(
    Session session,
    Map<String, dynamic> data,
    String platformUserId,
  ) async {
    try {
      // Implementation will come after cart/order endpoints are ready
      return {
        'success': true,
        'message': 'Checkout flow completed',
      };
    } catch (e) {
      session.log('Checkout flow error: $e');
      return {
        'error': 'checkout_failed',
        'message': 'Failed to complete checkout',
      };
    }
  }

  // Helper methods
  String? _extractPlatformUserId(String? flowToken, Map<String, dynamic>? data) {
    // Flow token format: "whatsapp:+2348012345678" or similar
    if (flowToken != null && flowToken.contains(':')) {
      return flowToken.split(':').last;
    }
    
    // Fallback to data
    return data?['platform_user_id'] as String?;
  }

  bool _isSignupFlow(String? screenId, Map<String, dynamic>? data) {
    return screenId == 'SUCCESS' && data?.containsKey('user_type') == true;
  }

  bool _isProductCreationFlow(String? screenId, Map<String, dynamic>? data) {
    return screenId == 'SHIPPING_INFO' && data?.containsKey('product_name') == true;
  }

  bool _isCheckoutFlow(String? screenId, Map<String, dynamic>? data) {
    return screenId == 'PAYMENT_METHOD' && data?.containsKey('payment_method') == true;
  }
}