// ============================================================================
// ROUTE GUARDS - Additional security and validation middleware
// ============================================================================

import 'package:asami_client/asami_client.dart';

import 'routes.dart';

// ═══════════════════════════════════════════════════════════
// ROUTE GUARD INTERFACE
// ═══════════════════════════════════════════════════════════

abstract class RouteGuard {
  /// Returns null if access is allowed, otherwise returns redirect path
  Future<String?> canAccess(User? user, String requestedRoute);
}

// ═══════════════════════════════════════════════════════════
// AUTHENTICATION GUARD
// ═══════════════════════════════════════════════════════════

class AuthenticationGuard implements RouteGuard {
  @override
  Future<String?> canAccess(User? user, String requestedRoute) async {
    // Allow auth routes without authentication
    if (RouteUtils.isAuthRoute(requestedRoute)) {
      return null;
    }

    // Require authentication for all other routes
    if (user == null) {
      return AppRoutes.login;
    }

    return null;
  }
}

// ═══════════════════════════════════════════════════════════
// PLATFORM VERIFICATION GUARD
// ═══════════════════════════════════════════════════════════

class PlatformVerificationGuard implements RouteGuard {
  @override
  Future<String?> canAccess(User? user, String requestedRoute) async {
    if (user == null) return null;

    // Skip verification check for auth routes
    if (RouteUtils.isAuthRoute(requestedRoute)) {
      return null;
    }

    // Check if web platform is authenticated
    if (!user.webAuthenticated) {
      // Only redirect if not already on verification page
      if (!requestedRoute.startsWith(AppRoutes.verification)) {
        return '${AppRoutes.verification}?phone=${user.phoneNumber}&code=${user.countryCode}';
      }
    }

    return null;
  }
}

// ═══════════════════════════════════════════════════════════
// USER TYPE ACCESS GUARD
// ═══════════════════════════════════════════════════════════

class UserTypeAccessGuard implements RouteGuard {
  @override
  Future<String?> canAccess(User? user, String requestedRoute) async {
    if (user == null) return null;

    // Allow auth routes for all
    if (RouteUtils.isAuthRoute(requestedRoute)) {
      return null;
    }

    final userType = user.userType;

    // Check vendor accessing customer routes
    if (userType == UserType.vendor && RouteUtils.isCustomerRoute(requestedRoute)) {
      return VendorRoutes.home;
    }

    // Check customer accessing vendor routes
    if (userType == UserType.customer && RouteUtils.isVendorRoute(requestedRoute)) {
      return BuyerRoutes.home;
    }

    return null;
  }
}

// ═══════════════════════════════════════════════════════════
// EMAIL VERIFICATION GUARD (Optional)
// ═══════════════════════════════════════════════════════════

class EmailVerificationGuard implements RouteGuard {
  final bool enforceEmailVerification;

  EmailVerificationGuard({this.enforceEmailVerification = false});

  @override
  Future<String?> canAccess(User? user, String requestedRoute) async {
    if (!enforceEmailVerification) return null;
    if (user == null) return null;
    if (user.email == null) return null;

    // Allow auth routes
    if (RouteUtils.isAuthRoute(requestedRoute)) {
      return null;
    }

    // Check if email is verified
    if (!user.emailVerified) {
      // Redirect to verification or show warning
      // For now, we'll allow access but you could redirect
      return null;
    }

    return null;
  }
}

// ═══════════════════════════════════════════════════════════
// ACCOUNT STATUS GUARD
// ═══════════════════════════════════════════════════════════

class AccountStatusGuard implements RouteGuard {
  @override
  Future<String?> canAccess(User? user, String requestedRoute) async {
    if (user == null) return null;

    // Allow auth routes
    if (RouteUtils.isAuthRoute(requestedRoute)) {
      return null;
    }

    // Check if account is active
    if (user.status != UserStatus.active) {
      // Could redirect to account suspended page
      return AppRoutes.login;
    }

    return null;
  }
}

// ═══════════════════════════════════════════════════════════
// COMPOSITE GUARD - Combines multiple guards
// ═══════════════════════════════════════════════════════════

class CompositeRouteGuard implements RouteGuard {
  final List<RouteGuard> guards;

  CompositeRouteGuard(this.guards);

  @override
  Future<String?> canAccess(User? user, String requestedRoute) async {
    for (final guard in guards) {
      final redirect = await guard.canAccess(user, requestedRoute);
      if (redirect != null) {
        return redirect; // Return first redirect found
      }
    }
    return null; // All guards passed
  }
}

// ═══════════════════════════════════════════════════════════
// DEFAULT GUARD FACTORY
// ═══════════════════════════════════════════════════════════

class RouteGuardFactory {
  static RouteGuard createDefaultGuard() {
    return CompositeRouteGuard([
      AuthenticationGuard(),
      AccountStatusGuard(),
      PlatformVerificationGuard(),
      UserTypeAccessGuard(),
    ]);
  }

  static RouteGuard createStrictGuard() {
    return CompositeRouteGuard([
      AuthenticationGuard(),
      AccountStatusGuard(),
      PlatformVerificationGuard(),
      UserTypeAccessGuard(),
      EmailVerificationGuard(enforceEmailVerification: true),
    ]);
  }
}

// ═══════════════════════════════════════════════════════════
// USAGE IN ROUTER
// ═══════════════════════════════════════════════════════════
/*
Example usage in AppRouter:

final routeGuard = RouteGuardFactory.createDefaultGuard();

redirect: (context, state) async {
  final authBloc = getIt<AuthBloc>();
  final authState = authBloc.state;
  
  final user = authState is AuthenticatedState ? authState.user : null;
  final requestedRoute = state.matchedLocation;
  
  // Apply route guards
  final redirectPath = await routeGuard.canAccess(user, requestedRoute);
  if (redirectPath != null) {
    return redirectPath;
  }
  
  // Continue with other redirect logic...
  return null;
}
*/