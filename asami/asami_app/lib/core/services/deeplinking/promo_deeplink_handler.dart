
// ═══════════════════════════════════════════════════════════
// PROMO DEEP LINK HANDLER
// ═══════════════════════════════════════════════════════════

@injectable
class PromoDeepLinkHandler implements DeepLinkHandler {
  @override
  Future<bool> handle(Uri uri, GoRouter? router) async {
    if (router == null) return false;

    // Promo campaign
    if (uri.path.startsWith('/promo/')) {
      final promoCode = uri.pathSegments.last;
      // Store promo code and navigate home
      router.go(BuyerRoutes.home);
      // TODO: Apply promo code via service
      return true;
    }

    // Referral
    if (uri.path.startsWith('/refer/')) {
      final referralCode = uri.pathSegments.last;
      router.go('${AppRoutes.signup}?ref=$referralCode');
      return true;
    }

    return false;
  }
}