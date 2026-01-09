// File: server/lib/src/services/messaging/telegram/telegram_callback_handler.dart

import 'dart:convert';
import 'package:asami_server/src/services/dependency_injection.dart';
import 'package:serverpod/serverpod.dart' hide Order;
import 'package:televerse/telegram.dart' hide User;
import 'package:televerse/televerse.dart';
import '../../../endpoints/auth_endpoint.dart';
import '../../../generated/protocol.dart';
import '../../../endpoints/product_endpoint.dart';
import '../../../endpoints/cart_endpoint.dart';
import '../../../endpoints/order_endpoint.dart';
import '../../auth/auth_state_manager.dart';
import 'telegram_service.dart';

class TelegramCallbackHandler {
  final TelegramService telegramService;
  final Session session;
  final AuthStateManager authStateManager;

  TelegramCallbackHandler({
    required this.telegramService,
    required this.session,
    required this.authStateManager,
  });

  /// Main callback processing entry point
  /// Called from TelegramWebhookHandler._processCallbackQuery
  Future<void> processCallbackQuery(CallbackQuery query) async {
    final data = query.data;
    if (data == null) return;

    final chatId = query.from.id.toString();

    try {
      // Answer callback query immediately to remove loading state
      await telegramService.answerCallbackQuery(
        callbackQueryId: query.id,
        text: '✅ Processing...',
      );

      // Route to appropriate handler based on callback data prefix
      if (data.startsWith('auth_')) {
        await _handleAuthCallback(query, chatId, data);
      } else if (data.startsWith('product_')) {
        await _handleProductCallback(query, chatId, data);
      } else if (data.startsWith('cart_')) {
        await _handleCartCallback(query, chatId, data);
      } else if (data.startsWith('order_')) {
        await _handleOrderCallback(query, chatId, data);
      } else if (data.startsWith('nav_')) {
        await _handleNavigationCallback(query, chatId, data);
      } else {
        // Unknown callback
        await _sendMessage(chatId, '❓ Unknown action. Please try again.');
      }
    } catch (e, stackTrace) {
      session.log('Callback error: $e', stackTrace: stackTrace);
      await _sendMessage(chatId, '❌ Something went wrong. Please try again.');
    }
  }

  // ==================== AUTHENTICATION CALLBACKS ====================

  Future<void> _handleAuthCallback(
    CallbackQuery query,
    String chatId,
    String data,
  ) async {
    // Check if user is already logged in and prevent button action
    final user = await User.db
        .findFirstRow(session, where: (t) => t.telegramId.equals(chatId));

    if (user != null && user.telegramAuthenticated) {
      await _sendMessage(chatId, '''
    Action can't be performed.
    if you're in a registration process, continue by providing required credentials, or
    Type /help for available commands.
    ''');
      return;
    }
    // Check if user already has a temp auth conversation
    final tempConversation = await authStateManager.getTempAuthConversation(
      session,
      platform: PlatformType.telegram,
      platformUserId: chatId,
    );

    if (data == 'auth_customer') {
      await _handleShopCustomerCallback(chatId, tempConversation);
    } else if (data == 'auth_vendor') {
      await _handleSellVendorCallback(chatId, tempConversation);
    } else if (data == 'auth_login') {
      await _handleLoginCallback(chatId, tempConversation);
    } else if (data == 'auth_resend_code') {
      await _handleResendCodeCallback(chatId, tempConversation);
    }
  }

  Future<void> _handleShopCustomerCallback(
    String chatId,
    Conversation? tempConversation,
  ) async {
    // Create or update temp conversation for customer signup
    if (tempConversation == null) {
      tempConversation = await authStateManager.createTempAuthConversation(
        session,
        platform: PlatformType.telegram,
        platformUserId: chatId,
        initialState: AuthState.SIGNUP_AWAITING_EMAIL,
        userType: UserType.customer,
        initialData: {
          'selected_user_type': 'customer',
        },
      );
    } else {
      await authStateManager.updateState(
        session,
        conversation: tempConversation,
        newState: AuthState.SIGNUP_AWAITING_EMAIL,
        additionalData: {
          'selected_user_type': 'customer',
        },
      );
    }

    await _sendMessage(chatId, '''
🛍️ Perfect! Let's create your shopping account. 

📧 Please send me your email address to get started:
''');
  }

  Future<void> _handleSellVendorCallback(
    String chatId,
    Conversation? tempConversation,
  ) async {
    // Create or update temp conversation for vendor signup
    if (tempConversation == null) {
      tempConversation = await authStateManager.createTempAuthConversation(
        session,
        platform: PlatformType.telegram,
        platformUserId: chatId,
        initialState: AuthState.SIGNUP_AWAITING_EMAIL,
        userType: UserType.vendor,
        initialData: {
          'selected_user_type': 'vendor',
        },
      );
    } else {
      await authStateManager.updateState(
        session,
        conversation: tempConversation,
        newState: AuthState.SIGNUP_AWAITING_EMAIL,
        additionalData: {
          'selected_user_type': 'vendor',
        },
      );
    }

    await _sendMessage(chatId, '''
🏪 Great! Let's set up your vendor account.

Your email will be used to:
• Sync your account across platforms
• Send order notifications  
• Manage your business

📧 Please send me your email address:
''');
  }

  Future<void> _handleLoginCallback(
    String chatId,
    Conversation? tempConversation,
  ) async {
    // Create or update temp conversation for login
    if (tempConversation == null) {
      tempConversation = await authStateManager.createTempAuthConversation(
        session,
        platform: PlatformType.telegram,
        platformUserId: chatId,
        initialState: AuthState.LOGIN_AWAITING_EMAIL,
        userType: UserType.customer,
        initialData: {
          'is_login': true,
        },
      );
    } else {
      await authStateManager.updateState(
        session,
        conversation: tempConversation,
        newState: AuthState.LOGIN_AWAITING_EMAIL,
        additionalData: {
          'is_login': true,
        },
      );
    }

    final user = await User.db
        .findFirstRow(session, where: (t) => t.telegramId.equals(chatId));
    if (user != null && user.email != null) {
      await AuthEndpoint().initiateLogin(
        session,
        email: user.email ?? '',
      );
      await _sendMessage(chatId, '''
 🔐 I've sent a 6-digit verification code to ${user.email}

Please reply with the code (expires in 10 minutes)

Reply "resend" for a new code.
''');
    } else {
        await _sendMessage(chatId, '''
📱 Welcome back!

📧 Please send me your email address to log in:
''');
    }
  }

  Future<void> _handleResendCodeCallback(
    String chatId,
    Conversation? tempConversation,
  ) async {
    if (tempConversation == null) {
      await _sendMessage(chatId, '❌ No active verification session.');
      return;
    }

    final sessionData = authStateManager.getSessionData(tempConversation);
    final email = sessionData['auth_email'] as String?;

    if (email == null) {
      await _sendMessage(chatId, '❌ Email not found. Please start over.');
      return;
    }

    // Import AuthEndpoint dynamically to avoid circular dependencies
    // The bot_endpoint will handle the actual resend
    await _sendMessage(chatId, '''
🔄 Processing resend request for $email...

Please wait a moment.
''');
  }

  // ==================== PRODUCT CALLBACKS ====================

  Future<void> _handleProductCallback(
    CallbackQuery query,
    String chatId,
    String data,
  ) async {
    if (data.startsWith('product_view_')) {
      final productId = data.replaceFirst('product_view_', '');
      await _showProductDetails(chatId, productId);
    } else if (data.startsWith('product_add_cart_')) {
      final productId = data.replaceFirst('product_add_cart_', '');
      await _addProductToCart(chatId, productId);
    } else if (data.startsWith('product_buy_')) {
      final productId = data.replaceFirst('product_buy_', '');
      await _buyProductNow(chatId, productId);
    }
  }

  Future<void> _showProductDetails(String chatId, String productId) async {
    final product = await ProductEndpoint().getProduct(
      session,
      UuidValue.fromString(productId),
    );

    if (product == null) {
      await _sendMessage(chatId, '❌ Product not found.');
      return;
    }

    // Send product image if available
    if (product.thumbnailUrl != null) {
      await telegramService.sendPhoto(
        chatId: int.parse(chatId),
        photoUrl: product.thumbnailUrl!,
      );
    }

    // Format product details
    final details = '''
💎 **${product.name}**
₦${product.basePrice.toStringAsFixed(2)}${product.discountPrice != null ? ' ~~₦${product.discountPrice!.toStringAsFixed(2)}~~' : ''} | ⭐ ${product.averageRating.toStringAsFixed(1)} (${product.totalReviews} reviews)
━━━━━━━━━━━━━━━━

${product.description}

📦 Stock: ${product.quantity} available
🚚 Delivery: ${product.estimatedDeliveryDays ?? 3} days
${product.color?.isNotEmpty == true ? '🎨 Colors: ${product.color!.join(', ')}\n' : ''}${product.size?.isNotEmpty == true ? '📏 Sizes: ${product.size!.join(', ')}\n' : ''}
${product.freeShipping ? '✅ Free Shipping' : '💰 Shipping: ₦${product.shippingCost.toStringAsFixed(2)}'}
''';

    // Create inline keyboard
    final keyboard = [
      [
        InlineKeyboardButton(
          text: '🛒 Add to Cart',
          callbackData: 'product_add_cart_$productId',
        ),
        InlineKeyboardButton(
          text: '💳 Buy Now',
          callbackData: 'product_buy_$productId',
        ),
      ],
      [
        InlineKeyboardButton(
          text: '❤️ Save for Later',
          callbackData: 'product_save_$productId',
        ),
        InlineKeyboardButton(
          text: '🏪 Vendor Info',
          callbackData: 'vendor_info_${product.vendorId.uuid}',
        ),
      ],
    ];

    await telegramService.sendInlineKeyboard(
      chatId: int.parse(chatId),
      text: details,
      keyboard: keyboard,
      parseMode: ParseMode.markdown,
    );
  }

  Future<void> _addProductToCart(String chatId, String productId) async {
    // Get user
    final user = await User.db.findFirstRow(
      session,
      where: (t) => t.telegramId.equals(chatId),
    );

    if (user == null) {
      await _sendMessage(chatId, '❌ Please authenticate first.');
      return;
    }

    // Add to cart (default quantity = 1)
    final result = await CartEndpoint().addToCart(
      session,
      customerId: user.id,
      productId: UuidValue.fromString(productId),
      quantity: 1,
    );

    if (result == null) {
      await _sendMessage(chatId, '❌ Failed to add to cart.');
      return;
    }

    // Get cart summary
    final cartData = await CartEndpoint().getCartWithItems(session, user.id);
    final cart = cartData?['cart'] as Cart?;

    final keyboard = [
      [
        InlineKeyboardButton(
          text: '🛒 View Cart',
          callbackData: 'cart_view',
        ),
        InlineKeyboardButton(
          text: '🛍️ Continue Shopping',
          callbackData: 'nav_products',
        ),
      ],
      [
        InlineKeyboardButton(
          text: '💳 Checkout',
          callbackData: 'cart_checkout',
        ),
      ],
    ];

    await telegramService.sendInlineKeyboard(
      chatId: int.parse(chatId),
      text: '''
✅ Added to cart!

🛒 Cart: ${cart?.itemCount ?? 1} items | ₦${cart?.subtotal.toStringAsFixed(2) ?? '0.00'}

What next?
''',
      keyboard: keyboard,
    );
  }

  Future<void> _buyProductNow(String chatId, String productId) async {
    await _sendMessage(chatId, '''
💳 **Quick Checkout**

To complete your purchase, I need your delivery address.

Please reply with your address or use /checkout to enter details step by step.
''');

    // Update conversation state for checkout
    final conversation = await _getOrCreateConversation(chatId);

    final sessionData = <String, dynamic>{
      'checkout_product_id': productId,
      'checkout_state': 'awaiting_address',
    };
    conversation.sessionData = jsonEncode(sessionData);
    await Conversation.db.updateRow(session, conversation);
  }

  // ==================== CART CALLBACKS ====================

  Future<void> _handleCartCallback(
    CallbackQuery query,
    String chatId,
    String data,
  ) async {
    if (data == 'cart_view') {
      await _showCart(chatId);
    } else if (data == 'cart_checkout') {
      await _startCheckout(chatId);
    } else if (data.startsWith('cart_remove_')) {
      final cartItemId = int.parse(data.replaceFirst('cart_remove_', ''));
      await _removeFromCart(chatId, cartItemId);
    } else if (data == 'cart_clear') {
      await _clearCart(chatId);
    }
  }

  Future<void> _showCart(String chatId) async {
    final user = await User.db.findFirstRow(
      session,
      where: (t) => t.telegramId.equals(chatId),
    );

    if (user == null) {
      await _sendMessage(chatId, '❌ Please authenticate first.');
      return;
    }

    final cartData = await CartEndpoint().getCartWithItems(session, user.id);

    if (cartData == null || (cartData['items'] as List).isEmpty) {
      final keyboard = [
        [
          InlineKeyboardButton(
            text: '🛍️ Browse Products',
            callbackData: 'nav_products',
          ),
        ],
      ];

      await telegramService.sendInlineKeyboard(
        chatId: int.parse(chatId),
        text: '''
🛒 Your cart is empty

Start shopping with /products
''',
        keyboard: keyboard,
      );
      return;
    }

    final cart = cartData['cart'] as Cart;
    final items = cartData['items'] as List<CartItem>;

    // Format cart
    final buffer = StringBuffer();
    buffer.writeln('🛒 **Your Cart**\n');

    for (var i = 0; i < items.length; i++) {
      final item = items[i];
      buffer.writeln('${i + 1}. Item x${item.quantity}');
      buffer.writeln('   ₦${item.subtotal.toStringAsFixed(2)}\n');
    }

    buffer.writeln('━━━━━━━━━━━━━━━━');
    buffer.writeln('**Subtotal:** ₦${cart.subtotal.toStringAsFixed(2)}');

    // Create keyboard with remove buttons
    List<List<InlineKeyboardButton>> keyboard = [];

    for (var i = 0; i < items.length; i++) {
      final item = items[i];
      keyboard.add([
        InlineKeyboardButton(
          text: '🗑️ Remove Item ${i + 1}',
          callbackData: 'cart_remove_${item.id}',
        ),
      ]);
    }

    // Action buttons
    keyboard.addAll([
      [
        InlineKeyboardButton(
          text: '💳 Checkout',
          callbackData: 'cart_checkout',
        ),
        InlineKeyboardButton(
          text: '🛍️ Continue Shopping',
          callbackData: 'nav_products',
        ),
      ],
      [
        InlineKeyboardButton(
          text: '🗑️ Clear Cart',
          callbackData: 'cart_clear',
        ),
      ],
    ]);

    await telegramService.sendInlineKeyboard(
      chatId: int.parse(chatId),
      text: buffer.toString(),
      keyboard: keyboard,
      parseMode: ParseMode.markdown,
    );
  }

  Future<void> _startCheckout(String chatId) async {
    await _sendMessage(chatId, '''
💳 **Checkout**

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

    // Update conversation state
    final conversation = await _getOrCreateConversation(chatId);

    final sessionData = <String, dynamic>{
      'checkout_state': 'awaiting_address',
    };
    conversation.sessionData = jsonEncode(sessionData);
    await Conversation.db.updateRow(session, conversation);
  }

  Future<void> _removeFromCart(String chatId, int cartItemId) async {
    final success = await CartEndpoint().removeFromCart(session, cartItemId);

    if (success) {
      await _sendMessage(chatId, '✅ Item removed from cart');
      // Show updated cart
      await _showCart(chatId);
    } else {
      await _sendMessage(chatId, '❌ Failed to remove item');
    }
  }

  Future<void> _clearCart(String chatId) async {
    final user = await User.db.findFirstRow(
      session,
      where: (t) => t.telegramId.equals(chatId),
    );

    if (user == null) return;

    final success = await CartEndpoint().clearCart(session, user.id);

    if (success) {
      await _sendMessage(chatId, '✅ Cart cleared');
    } else {
      await _sendMessage(chatId, '❌ Failed to clear cart');
    }
  }

  // ==================== NAVIGATION CALLBACKS ====================

  Future<void> _handleNavigationCallback(
    CallbackQuery query,
    String chatId,
    String data,
  ) async {
    if (data == 'nav_products') {
      await _sendMessage(chatId, '''
🛍️ **Product Search**

What are you looking for?

You can:
• Type keywords (e.g., "laptop")
• Browse by category
• Or just describe what you need!
''');
    } else if (data == 'nav_orders') {
      // Show orders - implement later
      await _sendMessage(chatId, '📦 Orders feature coming soon!');
    } else if (data == 'nav_menu') {
      await getIt<AuthStateManager>().showTelegramMenu(chatId, session);
    }
  }

  // ==================== ORDER CALLBACKS ====================

  Future<void> _handleOrderCallback(
    CallbackQuery query,
    String chatId,
    String data,
  ) async {
    await _sendMessage(chatId, '📦 Order management coming soon!');
  }

  // ==================== HELPER METHODS ====================

  Future<Conversation> _getOrCreateConversation(String platformUserId) async {
    var conversation = await Conversation.db.findFirstRow(
      session,
      where: (t) =>
          t.platformUserId.equals(platformUserId) &
          t.platform.equals(PlatformType.telegram),
    );

    if (conversation != null) return conversation;

    // Create new conversation
    conversation = Conversation(
      // userId: UuidValue.fromString('00000000-0000-0000-0000-000000000000'),
      platform: PlatformType.telegram,
      platformUserId: platformUserId,
      userType: UserType.customer,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    return await Conversation.db.insertRow(session, conversation);
  }

  Future<void> _sendMessage(String chatId, String text) async {
    await telegramService.sendTextMessage(
      chatId: int.parse(chatId),
      text: text,
      parseMode: ParseMode.markdown,
    );
  }
}
