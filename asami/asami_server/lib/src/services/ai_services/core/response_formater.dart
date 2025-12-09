
// File: server/lib/src/ai/core/response_formatter.dart
import '../../../generated/protocol.dart';

class ResponseFormatter {
  /// Format AI response based on intent and platform
  Future<Map<String, dynamic>> format({
    required String text,
    required PlatformType platform,
    required UserType userType,
    required String intent,
    Conversation? conversationContext,
  }) async {
    // Determine response type based on intent
    final responseType = _getResponseType(intent);

    switch (responseType) {
      case ResponseType.plainText:
        return _formatPlainText(text, platform);
      
      case ResponseType.productList:
        return _formatProductList(text, platform);
      
      case ResponseType.analyticsWidget:
        return _formatAnalytics(text, platform, userType);
      
      case ResponseType.orderSummary:
        return _formatOrderSummary(text, platform);
      
      case ResponseType.inlineMenu:
        return _formatInlineMenu(text, platform);
      
      default:
        return _formatPlainText(text, platform);
    }
  }

  ResponseType _getResponseType(String intent) {
    switch (intent) {
      case 'product_search':
      case 'product_recommendation':
        return ResponseType.productList;
      
      case 'analytics_request':
      case 'sales_summary':
        return ResponseType.analyticsWidget;
      
      case 'order_inquiry':
      case 'order_created':
        return ResponseType.orderSummary;
      
      case 'menu_request':
      case 'capabilities':
        return ResponseType.inlineMenu;
      
      default:
        return ResponseType.plainText;
    }
  }

  Map<String, dynamic> _formatPlainText(String text, PlatformType platform) {
    return {
      'type': 'text',
      'text': text,
      'metadata': {},
    };
  }

  Map<String, dynamic> _formatProductList(String text, PlatformType platform) {
    // Extract product data from AI response (if embedded)
    // Or signal that frontend should render product cards
    
    return {
      'type': 'product_list',
      'text': text,
      'metadata': {
        'render_as': 'product_cards', // Hint for frontend
        'platform_specific': {
          'whatsapp': {
            'use_template': false, // Just send as formatted text
          },
          'telegram': {
            'use_inline_keyboard': true, // Add "View" buttons
          },
        },
      },
    };
  }

  Map<String, dynamic> _formatAnalytics(
    String text,
    PlatformType platform,
    UserType userType,
  ) {
    if (userType != UserType.vendor) {
      return _formatPlainText(text, platform);
    }

    // For vendors, analytics can be rendered as widgets
    return {
      'type': 'analytics_widget',
      'text': text,
      'metadata': {
        'widget_type': 'dashboard',
        'render_hint': 'Show as scrollable metric cards',
        'platform_specific': {
          'whatsapp': {
            'format': 'text_with_emoji', // 📊 Revenue: ₦50,000
          },
          'telegram': {
            'format': 'text_with_inline_buttons',
            'buttons': [
              {'text': '📊 Full Dashboard', 'url': 'https://vendor.asami.com/analytics'},
            ],
          },
          'web': {
            'widget_id': 'VendorDashboard',
            'props': {
              'showCharts': true,
              'timeRange': 'week',
            },
          },
        },
      },
    };
  }

  Map<String, dynamic> _formatOrderSummary(String text, PlatformType platform) {
    return {
      'type': 'order_summary',
      'text': text,
      'metadata': {
        'format': 'structured',
        'platform_specific': {
          'whatsapp': {
            'use_formatting': true, // *bold*, _italic_
          },
          'telegram': {
            'parse_mode': 'markdown',
          },
        },
      },
    };
  }

  Map<String, dynamic> _formatInlineMenu(String text, PlatformType platform) {
    // Create platform-specific inline menus
    return {
      'type': 'inline_menu',
      'text': text,
      'metadata': {
        'menu_items': [
          {'id': 'help', 'text': 'Help'},
          {'id': 'products', 'text': 'Products'},
          {'id': 'orders', 'text': 'Orders'},
        ],
        'platform_specific': {
          'whatsapp': {
            'use_list': true, // WhatsApp List Message
          },
          'telegram': {
            'use_inline_keyboard': true,
          },
        },
      },
    };
  }
}

enum ResponseType {
  plainText,
  productList,
  analyticsWidget,
  orderSummary,
  inlineMenu,
  error,
}
// ```

// ### Platform-Specific Rendering

// The messaging services (WhatsApp, Telegram) will interpret the response metadata:
// ```dart
// In WhatsAppServiceAdapter or TelegramServiceAdapter

// Future<MessagingResult> sendFormattedResponse({
//   required String recipient,
//   required Map<String, dynamic> formattedResponse,
// }) async {
//   final type = formattedResponse['type'];
//   final text = formattedResponse['text'];
//   final metadata = formattedResponse['metadata'];

//   switch (type) {
//     case 'text':
//       return await sendText(recipient: recipient, text: text);
    
//     case 'product_list':
//       // WhatsApp: Send formatted text
//       // Could enhance with product images in future
//       return await sendText(recipient: recipient, text: text);
    
//     case 'analytics_widget':
//       final platformMeta = metadata['platform_specific']['whatsapp'];
//       if (platformMeta['use_inline_buttons'] == true) {
//         // Send with buttons
//       }
//       return await sendText(recipient: recipient, text: text);
    
//     case 'inline_menu':
//       final platformMeta = metadata['platform_specific']['whatsapp'];
//       if (platformMeta['use_list'] == true) {
//         return await sendList(...); // Use WhatsApp List Message
//       }
//       return await sendText(recipient: recipient, text: text);
    
//     default:
//       return await sendText(recipient: recipient, text: text);
//   }
// }