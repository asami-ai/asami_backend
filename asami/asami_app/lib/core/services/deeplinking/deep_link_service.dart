// ============================================================================
// DEEP LINK SERVICE - Using app_links (Better than uni_links)
// Location: lib/core/services/deep_link_service.dart
// ============================================================================

import 'dart:async';
import 'package:app_links/app_links.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

@singleton
class DeepLinkService {
  final AppLinks _appLinks = AppLinks();
  StreamSubscription<Uri>? _linkSubscription;
  final List<DeepLinkHandler> _handlers = [];
  GoRouter? _router;

  // Set router reference
  void setRouter(GoRouter router) {
    _router = router;
  }

  // Initialize deep linking
  Future<void> initialize() async {
    // Handle initial deep link (app opened from terminated state)
    try {
      final initialUri = await _appLinks.getInitialLink();
      if (initialUri != null) {
        debugPrint('📱 Initial deep link: $initialUri');
        await _handleDeepLink(initialUri);
      }
    } catch (e) {
      debugPrint('❌ Failed to get initial link: $e');
    }

    // Listen for deep links while app is running
    _linkSubscription = _appLinks.uriLinkStream.listen(
      (uri) {
        debugPrint('📱 Deep link received: $uri');
        _handleDeepLink(uri);
      },
      onError: (err) {
        debugPrint('❌ Deep link error: $err');
      },
    );

    debugPrint('✅ Deep Link Service initialized');
  }

  // Register a deep link handler
  void registerHandler(DeepLinkHandler handler) {
    _handlers.add(handler);
  }

  // Handle incoming deep links
  Future<void> _handleDeepLink(Uri uri) async {
    debugPrint('🔗 Processing deep link:');
    debugPrint('  - Scheme: ${uri.scheme}');
    debugPrint('  - Host: ${uri.host}');
    debugPrint('  - Path: ${uri.path}');
    debugPrint('  - Params: ${uri.queryParameters}');

    // Try all registered handlers
    for (final handler in _handlers) {
      if (await handler.handle(uri, _router)) {
        debugPrint('✅ Deep link handled by ${handler.runtimeType}');
        return;
      }
    }

    debugPrint('⚠️ No handler found for deep link: $uri');
  }

  // Dispose
  void dispose() {
    _linkSubscription?.cancel();
  }
}

// ═══════════════════════════════════════════════════════════
// DEEP LINK HANDLER INTERFACE
// ═══════════════════════════════════════════════════════════

abstract class DeepLinkHandler {
  Future<bool> handle(Uri uri, GoRouter? router);
}