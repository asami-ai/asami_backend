// File: server/lib/src/services/messaging/telegram/telegram_commands_setup.dart

import 'package:asami_server/utils/logger/asami_logger.dart';
import 'package:televerse/telegram.dart';
import 'package:televerse/televerse.dart';
import 'telegram_service.dart';

/// Setup Telegram bot commands for inline menu
class TelegramCommandsSetup {
  /// Setup commands on bot initialization
  static Future<void> setupCommands(TelegramService telegramService) async {
    try {
      // ==================== DEFAULT COMMANDS (ALL USERS) ====================
      final defaultCommands = [
        BotCommand(command: 'start', description: '🏠 Main menu'),
        BotCommand(command: 'help', description: '❓ Help & commands'),
        BotCommand(command: 'products', description: '🛍️ Browse products'),
        BotCommand(command: 'categories', description: '📂 Product categories'),
        BotCommand(command: 'cart', description: '🛒 View cart'),
        BotCommand(command: 'orders', description: '📦 Order history'),
        BotCommand(command: 'track', description: '🔍 Track order'),
        BotCommand(command: 'account', description: '👤 Account info'),
        BotCommand(command: 'capabilities', description: '🎯 What I can do'),
        BotCommand(command: 'logout', description: '👋 Sign out'),
      ];

      // Set default commands for all private chats
      await telegramService.setMyCommands(
        commands: defaultCommands,
        scope: BotCommandScope.allPrivateChats(),
      );

      Log.info('✅ Telegram bot commands configured');
      Log.info('   Default commands: ${defaultCommands.length}');

      return;
    } catch (e, stackTrace) {
      Log.info('❌ Failed to setup Telegram commands: $e');
      Log.info('Stack trace: $stackTrace');
    }
  }

  /// ✅ UPDATE: Set commands after user authenticates
  static Future<void> updateUserCommands(
    TelegramService telegramService,
    int userId,
    bool isVendor,
  ) async {
    try {
      final commands = isVendor ? _getVendorCommands() : _getCustomerCommands();

      await telegramService.setMyCommands(
        commands: commands,
        scope: BotCommandScope.chat(
            type: BotCommandScopeType.chat, chatId: ChatID(userId)),
      );

      Log.info(
          '✅ Updated commands for user $userId (${isVendor ? 'vendor' : 'customer'})');
    } catch (e) {
      Log.info('⚠️ Failed to update user commands: $e');
    }
  }

  static List<BotCommand> _getCustomerCommands() {
    return [
      BotCommand(command: 'start', description: '🏠 Main menu'),
      BotCommand(command: 'help', description: '❓ Help & commands'),
      BotCommand(command: 'products', description: '🛍️ Browse products'),
      BotCommand(command: 'categories', description: '📂 Categories'),
      BotCommand(command: 'cart', description: '🛒 View cart'),
      BotCommand(command: 'clearcart', description: '🗑️ Clear cart'),
      BotCommand(command: 'orders', description: '📦 Order history'),
      BotCommand(command: 'track', description: '🔍 Track order'),
      BotCommand(command: 'account', description: '👤 Account info'),
      BotCommand(command: 'status', description: '📊 Your stats'),
      BotCommand(command: 'capabilities', description: '🎯 What I can do'),
      BotCommand(command: 'logout', description: '👋 Sign out'),
    ];
  }

  static List<BotCommand> _getVendorCommands() {
    return [
      BotCommand(command: 'start', description: '🏠 Main menu'),
      BotCommand(command: 'help', description: '❓ Help & commands'),

      // Products
      BotCommand(command: 'myproducts', description: '📦 My products'),
      BotCommand(command: 'addproduct', description: '➕ Add product'),
      BotCommand(command: 'editproduct', description: '✏️ Edit product'),
      BotCommand(command: 'deleteproduct', description: '🗑️ Delete product'),
      BotCommand(command: 'updatestock', description: '📊 Update stock'),
      BotCommand(command: 'inventory', description: '📦 Inventory status'),
      BotCommand(command: 'lowstock', description: '⚠️ Low stock items'),
      BotCommand(command: 'outofstock', description: '❌ Out of stock'),
      BotCommand(command: 'topproducts', description: '🏆 Top sellers'),
      BotCommand(
          command: 'searchproducts', description: '🔍 Search my products'),

      // Orders
      BotCommand(command: 'pending', description: '⏳ Pending orders'),
      BotCommand(command: 'orders', description: '📦 All orders'),
      BotCommand(command: 'vieworder', description: '👁️ View order details'),
      BotCommand(command: 'confirmorder', description: '✅ Confirm order'),
      BotCommand(command: 'shiporder', description: '🚚 Mark as shipped'),
      BotCommand(command: 'cancelorder', description: '❌ Cancel order'),

      // Analytics
      BotCommand(command: 'analytics', description: '📊 Full dashboard'),
      BotCommand(command: 'sales', description: '💰 Sales data'),
      BotCommand(command: 'stats', description: '⚡ Quick stats'),

      // Account
      BotCommand(command: 'subscription', description: '📱 Subscription info'),
      BotCommand(command: 'account', description: '👤 Account details'),
      BotCommand(command: 'status', description: '📊 Business status'),
      BotCommand(command: 'capabilities', description: '🎯 All features'),
      BotCommand(command: 'logout', description: '👋 Sign out'),
    ];
  }

  // ==================== INLINE KEYBOARDS ====================
  // ✅ FIXED: Use proper callback data format

  /// Create main menu keyboard
  static List<List<InlineKeyboardButton>> createMainMenu(bool isVendor) {
    if (isVendor) {
      return [
        [
          InlineKeyboardButton(
              text: '📦 My Products', callbackData: '/myproducts'),
          InlineKeyboardButton(
              text: '➕ Add Product', callbackData: '/addproduct'),
        ],
        [
          InlineKeyboardButton(
              text: '⏳ Pending Orders', callbackData: '/pending'),
          InlineKeyboardButton(
              text: '📊 Analytics', callbackData: '/analytics'),
        ],
        [
          InlineKeyboardButton(
              text: '📦 Inventory', callbackData: '/inventory'),
          InlineKeyboardButton(text: '💰 Sales', callbackData: '/sales'),
        ],
        [
          InlineKeyboardButton(
              text: '📱 Subscription', callbackData: '/subscription'),
          InlineKeyboardButton(text: '👤 Account', callbackData: '/account'),
        ],
        [
          InlineKeyboardButton(text: '❓ Help', callbackData: '/help'),
        ],
      ];
    } else {
      return [
        [
          InlineKeyboardButton(
              text: '🛍️ Browse Products', callbackData: '/products'),
          InlineKeyboardButton(
              text: '📂 Categories', callbackData: '/categories'),
        ],
        [
          InlineKeyboardButton(text: '🛒 My Cart', callbackData: '/cart'),
          InlineKeyboardButton(text: '📦 My Orders', callbackData: '/orders'),
        ],
        [
          InlineKeyboardButton(text: '🔍 Track Order', callbackData: '/track'),
          InlineKeyboardButton(text: '📊 Status', callbackData: '/status'),
        ],
        [
          InlineKeyboardButton(text: '👤 Account', callbackData: '/account'),
          InlineKeyboardButton(text: '❓ Help', callbackData: '/help'),
        ],
      ];
    }
  }

  /// Create product management keyboard
  static List<List<InlineKeyboardButton>> createProductManagementMenu() {
    return [
      [
        InlineKeyboardButton(text: '➕ Add New', callbackData: '/addproduct'),
        InlineKeyboardButton(text: '📋 View All', callbackData: '/myproducts'),
      ],
      [
        InlineKeyboardButton(
            text: '🔍 Search', callbackData: '/searchproducts'),
        InlineKeyboardButton(text: '📦 Inventory', callbackData: '/inventory'),
      ],
      [
        InlineKeyboardButton(text: '⚠️ Low Stock', callbackData: '/lowstock'),
        InlineKeyboardButton(
            text: '❌ Out of Stock', callbackData: '/outofstock'),
      ],
      [
        InlineKeyboardButton(
            text: '🏆 Top Products', callbackData: '/topproducts'),
        InlineKeyboardButton(text: '🔙 Main Menu', callbackData: '/start'),
      ],
    ];
  }

  /// Create order management keyboard
  static List<List<InlineKeyboardButton>> createOrderManagementMenu() {
    return [
      [
        InlineKeyboardButton(text: '⏳ Pending', callbackData: '/pending'),
        InlineKeyboardButton(text: '📦 All Orders', callbackData: '/orders'),
      ],
      [
        InlineKeyboardButton(
            text: '👁️ View Details', callbackData: '/vieworder'),
        InlineKeyboardButton(text: '✅ Confirm', callbackData: '/confirmorder'),
      ],
      [
        InlineKeyboardButton(text: '🚚 Ship Order', callbackData: '/shiporder'),
        InlineKeyboardButton(text: '❌ Cancel', callbackData: '/cancelorder'),
      ],
      [
        InlineKeyboardButton(text: '🔙 Main Menu', callbackData: '/start'),
      ],
    ];
  }

  /// Create analytics keyboard
  static List<List<InlineKeyboardButton>> createAnalyticsMenu() {
    return [
      [
        InlineKeyboardButton(
            text: '📊 Full Dashboard', callbackData: '/analytics'),
        InlineKeyboardButton(text: '⚡ Quick Stats', callbackData: '/stats'),
      ],
      [
        InlineKeyboardButton(text: '💰 Sales Data', callbackData: '/sales'),
        InlineKeyboardButton(
            text: '🏆 Top Products', callbackData: '/topproducts'),
      ],
      [
        InlineKeyboardButton(
            text: '📦 Inventory Status', callbackData: '/inventory'),
        InlineKeyboardButton(text: '📊 Status', callbackData: '/status'),
      ],
      [
        InlineKeyboardButton(text: '🔙 Main Menu', callbackData: '/start'),
      ],
    ];
  }

  /// Create shopping keyboard (for customers)
  static List<List<InlineKeyboardButton>> createShoppingMenu() {
    return [
      [
        InlineKeyboardButton(
            text: '🛍️ Browse Products', callbackData: '/products'),
        InlineKeyboardButton(
            text: '📂 Categories', callbackData: '/categories'),
      ],
      [
        InlineKeyboardButton(text: '🛒 View Cart', callbackData: '/cart'),
        InlineKeyboardButton(
            text: '🗑️ Clear Cart', callbackData: '/clearcart'),
      ],
      [
        InlineKeyboardButton(text: '🔙 Main Menu', callbackData: '/start'),
      ],
    ];
  }

  /// Create order tracking keyboard (for customers)
  static List<List<InlineKeyboardButton>> createOrderTrackingMenu() {
    return [
      [
        InlineKeyboardButton(text: '📦 My Orders', callbackData: '/orders'),
        InlineKeyboardButton(text: '🔍 Track Order', callbackData: '/track'),
      ],
      [
        InlineKeyboardButton(text: '📊 Status', callbackData: '/status'),
        InlineKeyboardButton(
            text: '❌ Cancel Order', callbackData: '/cancelorder'),
      ],
      [
        InlineKeyboardButton(text: '🔙 Main Menu', callbackData: '/start'),
      ],
    ];
  }

  /// Create account management keyboard
  static List<List<InlineKeyboardButton>> createAccountMenu(bool isVendor) {
    if (isVendor) {
      return [
        [
          InlineKeyboardButton(
              text: '👤 Account Info', callbackData: '/account'),
          InlineKeyboardButton(text: '📊 Status', callbackData: '/status'),
        ],
        [
          InlineKeyboardButton(
              text: '📱 Subscription', callbackData: '/subscription'),
          InlineKeyboardButton(
              text: '🎯 Capabilities', callbackData: '/capabilities'),
        ],
        [
          InlineKeyboardButton(text: '❓ Help', callbackData: '/help'),
          InlineKeyboardButton(text: '👋 Logout', callbackData: '/logout'),
        ],
        [
          InlineKeyboardButton(text: '🔙 Main Menu', callbackData: '/start'),
        ],
      ];
    } else {
      return [
        [
          InlineKeyboardButton(
              text: '👤 Account Info', callbackData: '/account'),
          InlineKeyboardButton(text: '📊 Status', callbackData: '/status'),
        ],
        [
          InlineKeyboardButton(
              text: '🎯 Capabilities', callbackData: '/capabilities'),
          InlineKeyboardButton(text: '❓ Help', callbackData: '/help'),
        ],
        [
          InlineKeyboardButton(text: '👋 Logout', callbackData: '/logout'),
          InlineKeyboardButton(text: '🔙 Main Menu', callbackData: '/start'),
        ],
      ];
    }
  }

  /// ✅ Create product detail keyboard
  static List<List<InlineKeyboardButton>> createProductDetailMenu(
      String productId, String vendorId) {
    return [
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
          callbackData: 'vendor_info_$vendorId',
        ),
      ],
      [
        InlineKeyboardButton(
          text: '🔙 Back to Products',
          callbackData: '/products',
        ),
      ],
    ];
  }

  /// ✅ Create cart item keyboard
  static List<List<InlineKeyboardButton>> createCartItemMenu(
      String cartItemId) {
    return [
      [
        InlineKeyboardButton(
          text: '➕ Increase',
          callbackData: 'cart_increase_$cartItemId',
        ),
        InlineKeyboardButton(
          text: '➖ Decrease',
          callbackData: 'cart_decrease_$cartItemId',
        ),
      ],
      [
        InlineKeyboardButton(
          text: '🗑️ Remove',
          callbackData: 'cart_remove_$cartItemId',
        ),
      ],
    ];
  }

  /// ✅ Create checkout keyboard
  static List<List<InlineKeyboardButton>> createCheckoutMenu() {
    return [
      [
        InlineKeyboardButton(
          text: '💳 Proceed to Checkout',
          callbackData: 'checkout_proceed',
        ),
      ],
      [
        InlineKeyboardButton(
          text: '🛍️ Continue Shopping',
          callbackData: '/products',
        ),
        InlineKeyboardButton(
          text: '🗑️ Clear Cart',
          callbackData: '/clearcart',
        ),
      ],
    ];
  }

  /// ✅ Create order action keyboard (for vendors)
  static List<List<InlineKeyboardButton>> createOrderActionMenu(
      String orderId) {
    return [
      [
        InlineKeyboardButton(
          text: '✅ Confirm Order',
          callbackData: 'order_confirm_$orderId',
        ),
        InlineKeyboardButton(
          text: '❌ Cancel Order',
          callbackData: 'order_cancel_$orderId',
        ),
      ],
      [
        InlineKeyboardButton(
          text: '🚚 Mark as Shipped',
          callbackData: 'order_ship_$orderId',
        ),
        InlineKeyboardButton(
          text: '📦 Mark Delivered',
          callbackData: 'order_deliver_$orderId',
        ),
      ],
      [
        InlineKeyboardButton(
          text: '👁️ View Details',
          callbackData: 'order_view_$orderId',
        ),
      ],
      [
        InlineKeyboardButton(
          text: '🔙 Back to Orders',
          callbackData: '/orders',
        ),
      ],
    ];
  }

  /// ✅ Create category selection keyboard
  static List<List<InlineKeyboardButton>> createCategoryMenu(
      List<String> categories) {
    final buttons = <List<InlineKeyboardButton>>[];

    // Create rows of 2 buttons each
    for (var i = 0; i < categories.length; i += 2) {
      final row = <InlineKeyboardButton>[];

      row.add(InlineKeyboardButton(
        text: categories[i],
        callbackData:
            'category_${categories[i].toLowerCase().replaceAll(' ', '_')}',
      ));

      if (i + 1 < categories.length) {
        row.add(InlineKeyboardButton(
          text: categories[i + 1],
          callbackData:
              'category_${categories[i + 1].toLowerCase().replaceAll(' ', '_')}',
        ));
      }

      buttons.add(row);
    }

    // Add back button
    buttons.add([
      InlineKeyboardButton(text: '🔙 Main Menu', callbackData: '/start'),
    ]);

    return buttons;
  }

  /// ✅ Create pagination keyboard
  static List<List<InlineKeyboardButton>> createPaginationMenu({
    required int currentPage,
    required int totalPages,
    required String dataType, // 'products', 'orders', etc.
  }) {
    final buttons = <InlineKeyboardButton>[];

    if (currentPage > 1) {
      buttons.add(InlineKeyboardButton(
        text: '⬅️ Previous',
        callbackData: '${dataType}_page_${currentPage - 1}',
      ));
    }

    buttons.add(InlineKeyboardButton(
      text: '📄 $currentPage/$totalPages',
      callbackData: 'page_info',
    ));

    if (currentPage < totalPages) {
      buttons.add(InlineKeyboardButton(
        text: 'Next ➡️',
        callbackData: '${dataType}_page_${currentPage + 1}',
      ));
    }

    return [
      buttons,
      [
        InlineKeyboardButton(text: '🔙 Back', callbackData: '/start'),
      ],
    ];
  }

  /// ✅ Create confirmation keyboard
  static List<List<InlineKeyboardButton>> createConfirmationMenu({
    required String action,
    required String itemId,
  }) {
    return [
      [
        InlineKeyboardButton(
          text: '✅ Yes, Confirm',
          callbackData: '${action}_confirm_$itemId',
        ),
        InlineKeyboardButton(
          text: '❌ No, Cancel',
          callbackData: '${action}_cancel_$itemId',
        ),
      ],
    ];
  }
}
