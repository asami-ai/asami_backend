
class IntentAnalyzer {
  String analyze(String aiResponse, String userMessage) {
    final response = aiResponse.toLowerCase();
    final message = userMessage.toLowerCase();

    // Order related
    if (response.contains('order') || message.contains('order')) {
      if (response.contains('track') || message.contains('track')) {
        return 'order_tracking';
      }
      if (response.contains('created') || response.contains('placed')) {
        return 'order_created';
      }
      return 'order_inquiry';
    }

    // Product related
    if (response.contains('product') || message.contains('product')) {
      if (response.contains('found') || response.contains('showing')) {
        return 'product_search';
      }
      if (response.contains('recommend')) {
        return 'product_recommendation';
      }
      if (response.contains('details') || response.contains('about')) {
        return 'product_details';
      }
      return 'product_inquiry';
    }

    // Cart related
    if (response.contains('cart') || message.contains('cart')) {
      if (response.contains('added')) return 'cart_add';
      if (response.contains('removed')) return 'cart_remove';
      return 'cart_inquiry';
    }

    // Analytics (vendor)
    if (response.contains('sales') || response.contains('revenue') ||
        response.contains('analytics') || response.contains('dashboard')) {
      return 'analytics_request';
    }

    // Help/Support
    if (response.contains('help') || message.contains('help')) {
      return 'help_request';
    }

    // Greeting
    if (message.contains('hi') || message.contains('hello') ||
        message.contains('hey')) {
      return 'greeting';
    }

    return 'general_query';
  }
}
