// File: server/lib/src/endpoints/auth_endpoint.dart

import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';
import '../services/auth/auth_service.dart';

class AuthEndpoint extends Endpoint {
  /// Initiate signup process
  Future<Map<String, dynamic>> initiateSignup(
    Session session, {
    required String email,
    required UserType userType,
    String? phoneNumber,
    String? firstName,
    String? lastName,
    required PlatformType platform,
    required String platformUserId,
  }) async {
    try {
      final authService = AuthService(session);

      // Check if email already exists
      if (await authService.emailExists(email)) {
        return {
          'success': false,
          'error': 'email_exists',
          'message':
              'This email is already registered. Did you mean to log in?',
        };
      }

      // Create user (unverified)
      final userId = Uuid().v4obj();
      final user = User(
        id: userId,
        userType: userType,
        email: email,
        phoneNumber: phoneNumber ?? '',
        countryCode: '+0',
        firstName: firstName,
        lastName: lastName,
        status: UserStatus.pending_verification,
        emailVerified: false,
        whatsappId: platform == PlatformType.whatsapp ? platformUserId : null,
        telegramId: platform == PlatformType.telegram ? platformUserId : null,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      final createdUser = await User.db.insertRow(session, user);

      // Create profile based on user type
      if (userType == UserType.customer) {
        final profile = CustomerProfile(
          id: createdUser.id,
          userId: createdUser.id,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
        await CustomerProfile.db.insertRow(session, profile);
      } else {
        final profile = VendorProfile(
          id: createdUser.id,
          userId: createdUser.id,
          businessName: 'My Business',
          businessCategory: 'General',
          subscriptionTier: SubscriptionTier.freemium,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
        await VendorProfile.db.insertRow(session, profile);
      }

      // Generate and send verification code
      final code = authService.generateVerificationCode();
      await authService.createVerificationCode(email: email, code: code);

      final sent = await authService.sendVerificationEmail(
        email: email,
        code: code,
        userName: firstName ?? '',
      );

      if (!sent) {
        return {
          'success': false,
          'error': 'email_send_failed',
          'message': 'Failed to send verification email',
        };
      }

      return {
        'success': true,
        'user_id': createdUser.id.uuid,
        'message': 'Verification code sent to $email',
        'requires_verification': true,
      };
    } catch (e) {
      session.log('Signup initiation error: $e');
      return {
        'success': false,
        'error': 'signup_failed',
        'message': 'Signup failed. Please try again.',
      };
    }
  }

  /// Verify signup code
  Future<Map<String, dynamic>> verifySignupCode(
    Session session, {
    required String email,
    required String code,
    required PlatformType platform,
    required String platformUserId,
  }) async {
    try {
      final authService = AuthService(session);

      // Verify code
      final verifyResult = await authService.verifyCode(
        email: email,
        code: code,
      );

      if (!verifyResult['success']) {
        return verifyResult;
      }

      // Authenticate platform
      final authResult = await authService.authenticatePlatform(
        userId: verifyResult['user_id'],
        platform: platform,
        platformUserId: platformUserId,
      );

      if (!authResult['success']) {
        return authResult;
      }

      return {
        'success': true,
        'user': authResult['user'],
        'session_id': authResult['session_id'],
        'message': 'Account created and verified successfully!',
      };
    } catch (e) {
      session.log('Signup verification error: $e');
      return {
        'success': false,
        'error': 'verification_failed',
        'message': 'Verification failed',
      };
    }
  }

  /// Initiate login
  Future<Map<String, dynamic>> initiateLogin(
    Session session, {
    required String email,
  }) async {
    try {
      final authService = AuthService(session);

      // Check if user exists
      if (!await authService.emailExists(email)) {
        return {
          'success': false,
          'error': 'user_not_found',
          'message': 'No account found with this email',
        };
      }

      // Generate and send verification code
      final code = authService.generateVerificationCode();
      await authService.createVerificationCode(email: email, code: code);

      final user = await User.db.findFirstRow(
        session,
        where: (t) => t.email.equals(email),
      );

      final sent = await authService.sendVerificationEmail(
        email: email,
        code: code,
        userName: user?.firstName ?? '',
      );

      if (!sent) {
        return {
          'success': false,
          'error': 'email_send_failed',
          'message': 'Failed to send verification code',
        };
      }

      return {
        'success': true,
        'message': 'Verification code sent to $email',
        'requires_verification': true,
      };
    } catch (e) {
      session.log('Login initiation error: $e');
      return {
        'success': false,
        'error': 'login_failed',
        'message': 'Login failed. Please try again.',
      };
    }
  }

  /// Verify login code
  Future<Map<String, dynamic>> verifyLoginCode(
    Session session, {
    required String email,
    required String code,
    required PlatformType platform,
    required String platformUserId,
  }) async {
    try {
      final authService = AuthService(session);

      // Verify code
      final verifyResult = await authService.verifyCode(
        email: email,
        code: code,
      );

      if (!verifyResult['success']) {
        return verifyResult;
      }

      // Authenticate platform
      final authResult = await authService.authenticatePlatform(
        userId: verifyResult['user_id'],
        platform: platform,
        platformUserId: platformUserId,
      );

      if (!authResult['success']) {
        return authResult;
      }

      return {
        'success': true,
        'user': authResult['user'],
        'session_id': authResult['session_id'],
        'message': 'Logged in successfully!',
      };
    } catch (e) {
      session.log('Login verification error: $e');
      return {
        'success': false,
        'error': 'verification_failed',
        'message': 'Login verification failed',
      };
    }
  }

  /// Check authentication status
  Future<Map<String, dynamic>> checkAuth(
    Session session, {
    required PlatformType platform,
    required String platformUserId,
  }) async {
    try {
      final authService = AuthService(session);

      return await authService.checkAuthentication(
        platform: platform,
        platformUserId: platformUserId,
      );
    } catch (e) {
      session.log('Check auth error: $e');
      return {
        'authenticated': false,
        'error': 'check_failed',
      };
    }
  }

  /// Logout
  Future<Map<String, dynamic>> logout(
    Session session, {
    required String userId,
    required PlatformType platform,
  }) async {
    try {
      final authService = AuthService(session);

      final success = await authService.logout(
        userId: userId,
        platform: platform,
      );

      if (success) {
        return {
          'success': true,
          'message': 'Logged out successfully',
        };
      }

      return {
        'success': false,
        'error': 'logout_failed',
        'message': 'Logout failed',
      };
    } catch (e) {
      session.log('Logout error: $e');
      return {
        'success': false,
        'error': 'logout_failed',
        'message': 'Logout failed',
      };
    }
  }

  /// Resend verification code
  Future<Map<String, dynamic>> resendCode(
    Session session, {
    required String email,
  }) async {
    try {
      final authService = AuthService(session);

      return await authService.resendVerificationCode(email: email);
    } catch (e) {
      session.log('Resend code error: $e');
      return {
        'success': false,
        'error': 'resend_failed',
        'message': 'Failed to resend code',
      };
    }
  }

  /// Upgrade customer to vendor
  Future<Map<String, dynamic>> upgradeToVendor(
    Session session, {
    required String userId,
    required String businessName,
    required String businessCategory,
  }) async {
    try {
      final user =
          await User.db.findById(session, UuidValue.fromString(userId));

      if (user == null) {
        return {
          'success': false,
          'error': 'user_not_found',
          'message': 'User not found',
        };
      }

      if (user.userType == UserType.vendor) {
        return {
          'success': false,
          'error': 'already_vendor',
          'message': 'User is already a vendor',
        };
      }

      // Update user type
      user.userType = UserType.vendor;
      await User.db.updateRow(session, user);

      // Create vendor profile
      final profile = VendorProfile(
        id: user.id,
        userId: user.id,
        businessName: businessName,
        businessCategory: businessCategory,
        subscriptionTier: SubscriptionTier.freemium,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await VendorProfile.db.insertRow(session, profile);

      return {
        'success': true,
        'message': 'Successfully upgraded to vendor account!',
        'user': user,
      };
    } catch (e) {
      session.log('Upgrade to vendor error: $e');
      return {
        'success': false,
        'error': 'upgrade_failed',
        'message': 'Upgrade failed',
      };
    }
  }

  Future<bool> deleteTempUser(Session session, {required String email}) async {
    final user = await User.db.findFirstRow(
      session,
      where: (t) => t.email.equals(email),
    );

    if (user == null) return false;
    await User.db.deleteRow(session, user);
    return true;
  }
}


/// Update user last active timestamp
  // Future<void> updateLastActive(Session session, UuidValue userId) async {
  //   final user = await User.db.findFirstRow(
  //     session,
  //     where: (t) => t.id.equals(userId),
  //   );

  //   if (user != null) {
  //     user.lastActiveAt = DateTime.now();
  //     user.updatedAt = DateTime.now();
  //     await User.db.updateRow(session, user);
  //   }
  // }