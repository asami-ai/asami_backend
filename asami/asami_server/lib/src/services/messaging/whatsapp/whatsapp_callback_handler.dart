// File: server/lib/src/services/messaging/whatsapp/whatsapp_callback_handler.dart

import 'dart:convert';
import 'package:asami_server/src/services/dependency_injection.dart';
import 'package:serverpod/serverpod.dart' hide Order;
import '../../../endpoints/auth_endpoint.dart';
import '../../../generated/protocol.dart';
import '../../../endpoints/product_endpoint.dart';
import '../../../endpoints/cart_endpoint.dart';
import '../../../endpoints/order_endpoint.dart';
import '../../auth/auth_state_manager.dart';
import 'whatsapp_service.dart';
import 'whatsapp_message_formatter.dart';

class WhatsAppCallbackHandler {
  final WhatsAppService whatsappService;
  final Session session;
  final AuthStateManager authStateManager;

  WhatsAppCallbackHandler({
    required this.whatsappService,
    required this.session,
    required this.authStateManager,
  });

  /// Main callback processing entry point
  /// Called from WhatsAppWebhookHandler when interactive message is received
  Future<void> processInteractiveMessage(
    String from,
    Map<String, dynamic> interactive,
  ) async {
    final type = interactive['type'] as String?;

    try {
      if (type == 'button_reply') {
        await _handleButtonReply(from, interactive['button_reply']);
      } else if (type == 'list_reply') {
        await _handleListReply(from, interactive['list_reply']);
      } else {
        await _sendMessage(from, '❓ Unknown interaction type.');
      }
    } catch (e, stackTrace) {
      session.log('WhatsApp callback error: $e', stackTrace: stackTrace);
      await _sendMessage(from, '❌ Something went wrong. Please try again.');
    }
  }

  // ==================== BUTTON REPLY HANDLER ====================

  Future<void> _handleButtonReply(
    String from,
    Map<String, dynamic> buttonReply,
  ) async {
    final buttonId = buttonReply['id'] as String?;

    if (buttonId == null) return;

    // Route to appropriate handler based on button ID prefix
    if (buttonId.startsWith('auth_')) {
      await _handleAuthCallback(from, buttonId);
    } else if (buttonId.startsWith('product_')) {
      await _handleProductCallback(from, buttonId);
    } else if (buttonId.startsWith('cart_')) {
      await _handleCartCallback(from, buttonId);
    } else if (buttonId.startsWith('order_')) {
      await _handleOrderCallback(from, buttonId);
    } else if (buttonId.startsWith('nav_')) {
      await _handleNavigationCallback(from, buttonId);
    } else if (buttonId.startsWith('vendor_')) {
      await _handleVendorCallback(from, buttonId);
    } else {
      await _sendMessage(from, '❓ Unknown action. Please try again.');
    }
  }

  // ==================== LIST REPLY HANDLER ====================

  Future<void> _handleListReply(
    String from,
    Map<String, dynamic> listReply,
  ) async {
    final itemId = listReply['id'] as String?;

    if (itemId == null) return;

    // Lists are typically used for product browsing, categories, etc.
    if (itemId.startsWith('product_')) {
      await _handleProductCallback(from, itemId);
    } else if (itemId.startsWith('category_')) {
      await _handleCategorySelection(from, itemId);
    } else {
      await _sendMessage(from, '❓ Unknown selection.');
    }
  }

  // ==================== AUTHENTICATION CALLBACKS ====================

  Future<void> _handleAuthCallback(String from, String buttonId) async {
    // Check if user is already logged in and prevent button action
    final user = await User.db
        .findFirstRow(session, where: (t) => t.whatsappId.equals(from));

    if (user != null && user.whatsappAuthenticated) {
      await _sendMessage(from, '''
    Action can't be performed.
    if you're in a registration process, continue by providing required credentials, or
    Type /help for available commands.
    ''');
      return;
    }

    final tempConversation = await authStateManager.getTempAuthConversation(
      session,
      platform: PlatformType.whatsapp,
      platformUserId: from,
    );

    if (buttonId == 'auth_signup_customer') {
      await _handleShopCustomerCallback(from, tempConversation);
    } else if (buttonId == 'auth_signup_vendor') {
      await _handleSellVendorCallback(from, tempConversation);
    } else if (buttonId == 'auth_login') {
      await _handleLoginCallback(from, tempConversation);
    } else if (buttonId == 'auth_resend_code') {
      await _handleResendCodeCallback(from, tempConversation);
    }
  }

  Future<void> _handleShopCustomerCallback(
    String from,
    Conversation? tempConversation,
  ) async {
    if (tempConversation == null) {
      tempConversation = await authStateManager.createTempAuthConversation(
        session,
        platform: PlatformType.whatsapp,
        platformUserId: from,
        initialState: AuthState.SIGNUP_AWAITING_EMAIL,
        userType: UserType.customer,
        initialData: {'selected_user_type': 'customer'},
      );
    } else {
      await authStateManager.updateState(
        session,
        conversation: tempConversation,
        newState: AuthState.SIGNUP_AWAITING_EMAIL,
        additionalData: {'selected_user_type': 'customer'},
      );
    }

    await _sendMessage(from, '''
🛍️ Perfect! Let's create your shopping account.

📧 Please send me your email address to get started:
''');
  }

  Future<void> _handleSellVendorCallback(
    String from,
    Conversation? tempConversation,
  ) async {
    if (tempConversation == null) {
      tempConversation = await authStateManager.createTempAuthConversation(
        session,
        platform: PlatformType.whatsapp,
        platformUserId: from,
        initialState: AuthState.SIGNUP_AWAITING_EMAIL,
        userType: UserType.vendor,
        initialData: {'selected_user_type': 'vendor'},
      );
    } else {
      await authStateManager.updateState(
        session,
        conversation: tempConversation,
        newState: AuthState.SIGNUP_AWAITING_EMAIL,
        additionalData: {'selected_user_type': 'vendor'},
      );
    }

    await _sendMessage(from, '''
🏪 Great! Let's set up your vendor account.

Your email will be used to:
• Sync your account across platforms
• Send order notifications
• Manage your business

📧 Please send me your email address:
''');
  }

  Future<void> _handleLoginCallback(
    String from,
    Conversation? tempConversation,
  ) async {
    final user = await User.db
        .findFirstRow(session, where: (t) => t.whatsappId.equals(from));
    if (user != null && user.email != null) {
      await AuthEndpoint().initiateLogin(
        session,
        email: user.email ?? '',
      );
      // Create or update temp conversation for login
      if (tempConversation == null) {
        tempConversation = await authStateManager.createTempAuthConversation(
          session,
          platform: PlatformType.whatsapp,
          platformUserId: from,
          initialState: AuthState.LOGIN_AWAITING_CODE,
          userType: user.userType,
          initialData: {
            'is_login': true,
            'auth_email': user.email,
            'auth_code_sent_at': DateTime.now().toIso8601String(),
            'auth_attempts': 0,
          },
        );
      } else {
        await authStateManager.updateState(
          session,
          conversation: tempConversation,
          newState: AuthState.LOGIN_AWAITING_CODE,
          additionalData: {
            'is_login': true,
            'auth_email': user.email,
            'auth_code_sent_at': DateTime.now().toIso8601String(),
            'auth_attempts': 0,
          },
        );
      }

      await _sendMessage(from, '''
 🔐 I've sent a 6-digit verification code to ${user.email}

Please reply with the code (expires in 10 minutes)

Reply "resend" for a new code.
''');
    } else {
      if (tempConversation == null) {
        tempConversation = await authStateManager.createTempAuthConversation(
          session,
          platform: PlatformType.whatsapp,
          platformUserId: from,
          initialState: AuthState.LOGIN_AWAITING_EMAIL,
          userType: UserType.customer,
          initialData: {'is_login': true},
        );
      } else {
        await authStateManager.updateState(
          session,
          conversation: tempConversation,
          newState: AuthState.LOGIN_AWAITING_EMAIL,
          additionalData: {'is_login': true},
        );
      }

      await _sendMessage(from, '''
📱 Welcome back!

📧 Please send me your email address to log in:
''');
    }
  }

  Future<void> _handleResendCodeCallback(
    String from,
    Conversation? tempConversation,
  ) async {
    if (tempConversation == null) {
      await _sendMessage(from, '❌ No active verification session.');
      return;
    }

    final sessionData = authStateManager.getSessionData(tempConversation);
    final email = sessionData['auth_email'] as String?;

    if (email == null) {
      await _sendMessage(from, '❌ Email not found. Please start over.');
      return;
    }

    await _sendMessage(from, '''
🔄 Processing resend request for $email...

Please wait a moment.
''');
  }

  // ==================== PRODUCT CALLBACKS ====================

  Future<void> _handleProductCallback(String from, String buttonId) async {
    if (buttonId.startsWith('product_view_')) {
      final productId = buttonId.replaceFirst('product_view_', '');
      await _showProductDetails(from, productId);
    } else if (buttonId.startsWith('product_add_cart_')) {
      final productId = buttonId.replaceFirst('product_add_cart_', '');
      await _addProductToCart(from, productId);
    } else if (buttonId.startsWith('product_buy_')) {
      final productId = buttonId.replaceFirst('product_buy_', '');
      await _buyProductNow(from, productId);
    }
  }

  Future<void> _showProductDetails(String from, String productId) async {
    final product = await ProductEndpoint().getProduct(
      session,
      UuidValue.fromString(productId),
    );

    if (product == null) {
      await _sendMessage(from, '❌ Product not found.');
      return;
    }

    // Send product image if available
    if (product.thumbnailUrl != null) {
      await whatsappService.sendImageByUrl(
        phoneNumber: from,
        imageUrl: product.thumbnailUrl!,
      );
    }

    // Format product details
    final details = WhatsAppMessageFormatter.formatProductDetails(product);

    // Send with action buttons
    await whatsappService.sendInteractiveReplyButton(
      phoneNumber: from,
      bodyText: details,
      footerText: 'Powered by Asami',
      headerInteractive: product.thumbnailUrl != null
          ? {
              "type": "image",
              "image": {"link": product.thumbnailUrl!}
            }
          : {"type": "text", "text": product.name},
      interactiveReplyButtons: [
        {
          'type': 'reply',
          'reply': {
            'id': 'product_add_cart_$productId',
            'title': '🛒 Add to Cart',
          }
        },
        {
          'type': 'reply',
          'reply': {
            'id': 'product_buy_$productId',
            'title': '💳 Buy Now',
          }
        },
        {
          'type': 'reply',
          'reply': {
            'id': 'product_save_$productId',
            'title': '❤️ Save',
          }
        },
      ],
    );
  }

  Future<void> _addProductToCart(String from, String productId) async {
    final user = await User.db.findFirstRow(
      session,
      where: (t) => t.whatsappId.equals(from),
    );

    if (user == null) {
      await _sendMessage(from, '❌ Please authenticate first.');
      return;
    }

    final result = await CartEndpoint().addToCart(
      session,
      customerId: user.id,
      productId: UuidValue.fromString(productId),
      quantity: 1,
    );

    if (result == null) {
      await _sendMessage(from, '❌ Failed to add to cart.');
      return;
    }

    final cartData = await CartEndpoint().getCartWithItems(session, user.id);
    final cart = cartData?['cart'] as Cart?;

    await whatsappService.sendInteractiveReplyButton(
      phoneNumber: from,
      bodyText: '''
✅ Added to cart!

🛒 Cart: ${cart?.itemCount ?? 1} items | ₦${cart?.subtotal.toStringAsFixed(2) ?? '0.00'}

What next?
''',
      footerText: '',
      headerInteractive: {"type": "text", "text": "Item Added"},
      interactiveReplyButtons: [
        {
          'type': 'reply',
          'reply': {
            'id': 'cart_view',
            'title': '🛒 View Cart',
          }
        },
        {
          'type': 'reply',
          'reply': {
            'id': 'nav_products',
            'title': '🛍️ Continue',
          }
        },
        {
          'type': 'reply',
          'reply': {
            'id': 'cart_checkout',
            'title': '💳 Checkout',
          }
        },
      ],
    );
  }

  Future<void> _buyProductNow(String from, String productId) async {
    await _sendMessage(from, '''
💳 *Quick Checkout*

To complete your purchase, I need your delivery address.

Please reply with your address or use /checkout to enter details step by step.
''');

    final conversation = await _getOrCreateConversation(from);

    final sessionData = <String, dynamic>{
      'checkout_product_id': productId,
      'checkout_state': 'awaiting_address',
    };
    conversation.sessionData = jsonEncode(sessionData);
    await Conversation.db.updateRow(session, conversation);
  }

  // ==================== CART CALLBACKS ====================

  Future<void> _handleCartCallback(String from, String buttonId) async {
    if (buttonId == 'cart_view') {
      await _showCart(from);
    } else if (buttonId == 'cart_checkout') {
      await _startCheckout(from);
    } else if (buttonId.startsWith('cart_remove_')) {
      final cartItemId = int.parse(buttonId.replaceFirst('cart_remove_', ''));
      await _removeFromCart(from, cartItemId);
    } else if (buttonId == 'cart_clear') {
      await _clearCart(from);
    }
  }

  Future<void> _showCart(String from) async {
    final user = await User.db.findFirstRow(
      session,
      where: (t) => t.whatsappId.equals(from),
    );

    if (user == null) {
      await _sendMessage(from, '❌ Please authenticate first.');
      return;
    }

    final cartData = await CartEndpoint().getCartWithItems(session, user.id);

    if (cartData == null || (cartData['items'] as List).isEmpty) {
      await whatsappService.sendInteractiveReplyButton(
        phoneNumber: from,
        bodyText: '''
🛒 Your cart is empty

Start shopping with /products
''',
        footerText: '',
        headerInteractive: {"type": "text", "text": "Empty Cart"},
        interactiveReplyButtons: [
          {
            'type': 'reply',
            'reply': {
              'id': 'nav_products',
              'title': '🛍️ Browse Products',
            }
          },
        ],
      );
      return;
    }

    final cart = cartData['cart'] as Cart;
    final items = cartData['items'] as List<CartItem>;

    final formattedCart =
        WhatsAppMessageFormatter.formatCartSummary(cart, items);

    await whatsappService.sendInteractiveReplyButton(
      phoneNumber: from,
      bodyText: formattedCart,
      footerText: 'Powered by Asami',
      headerInteractive: {"type": "text", "text": "Your Shopping Cart"},
      interactiveReplyButtons: [
        {
          'type': 'reply',
          'reply': {
            'id': 'cart_checkout',
            'title': '💳 Checkout',
          }
        },
        {
          'type': 'reply',
          'reply': {
            'id': 'nav_products',
            'title': '🛍️ Continue',
          }
        },
        {
          'type': 'reply',
          'reply': {
            'id': 'cart_clear',
            'title': '🗑️ Clear Cart',
          }
        },
      ],
    );
  }

  Future<void> _startCheckout(String from) async {
    await _sendMessage(from, '''
💳 *Checkout*

Please provide your delivery address:

Reply with:
```
Name
Phone Number
Street Address
City, State
```

Or use the /address command to manage saved addresses.
''');

    final conversation = await _getOrCreateConversation(from);

    final sessionData = <String, dynamic>{
      'checkout_state': 'awaiting_address',
    };
    conversation.sessionData = jsonEncode(sessionData);
    await Conversation.db.updateRow(session, conversation);
  }

  Future<void> _removeFromCart(String from, int cartItemId) async {
    final success = await CartEndpoint().removeFromCart(session, cartItemId);

    if (success) {
      await _sendMessage(from, '✅ Item removed from cart');
      await _showCart(from);
    } else {
      await _sendMessage(from, '❌ Failed to remove item');
    }
  }

  Future<void> _clearCart(String from) async {
    final user = await User.db.findFirstRow(
      session,
      where: (t) => t.whatsappId.equals(from),
    );

    if (user == null) return;

    final success = await CartEndpoint().clearCart(session, user.id);

    if (success) {
      await _sendMessage(from, '✅ Cart cleared');
    } else {
      await _sendMessage(from, '❌ Failed to clear cart');
    }
  }

  // ==================== NAVIGATION CALLBACKS ====================

  Future<void> _handleNavigationCallback(String from, String buttonId) async {
    if (buttonId == 'nav_products') {
      await _sendMessage(from, '''
🛍️ *Product Search*

What are you looking for?

You can:
• Type keywords (e.g., "laptop")
• Browse by category
• Or just describe what you need!
''');
    } else if (buttonId == 'nav_orders') {
      await _sendMessage(from, '📦 Use /orders to view your orders.');
    } else if (buttonId == 'nav_menu') {
      await getIt<AuthStateManager>().showWhatsappMenu(from, session);
    }
  }

  // ==================== VENDOR CALLBACKS ====================

  Future<void> _handleVendorCallback(String from, String buttonId) async {
    if (buttonId == 'vendor_analytics') {
      await _sendMessage(
          from, 'Use /analytics to view your business dashboard.');
    } else if (buttonId == 'vendor_products') {
      await _sendMessage(
          from, 'Use /myproducts to manage your product catalog.');
    }
  }

  // ==================== ORDER CALLBACKS ====================

  Future<void> _handleOrderCallback(String from, String buttonId) async {
    await _sendMessage(from, '📦 Use /orders to manage your orders.');
  }

  // ==================== CATEGORY SELECTION ====================

  Future<void> _handleCategorySelection(String from, String itemId) async {
    final category = itemId.replaceFirst('category_', '');
    await _sendMessage(from, '''
📂 Browsing: $category

Searching for products in this category...
''');

    // Trigger product search via AI
    // The bot_endpoint will handle the actual search
  }

  // ==================== HELPER METHODS ====================

  Future<Conversation> _getOrCreateConversation(String platformUserId) async {
    var conversation = await Conversation.db.findFirstRow(
      session,
      where: (t) =>
          t.platformUserId.equals(platformUserId) &
          t.platform.equals(PlatformType.whatsapp),
    );

    if (conversation != null) return conversation;

    conversation = Conversation(
      // userId: UuidValue.fromString('00000000-0000-0000-0000-000000000000'),
      platform: PlatformType.whatsapp,
      platformUserId: platformUserId,
      userType: UserType.customer,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    return await Conversation.db.insertRow(session, conversation);
  }

  Future<void> _sendMessage(String phoneNumber, String text) async {
    await whatsappService.sendMessage(
      phoneNumber: phoneNumber,
      text: text,
    );
  }
}
