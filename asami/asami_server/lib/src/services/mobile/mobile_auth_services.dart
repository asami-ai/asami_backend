
import 'dart:math';
import 'package:serverpod/serverpod.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import '../../generated/protocol.dart';
import '../messaging/whatsapp/whatsapp_service.dart';
import '../dependency_injection.dart';

/// Mobile authentication service with WhatsApp verification
class MobileAuthService {
  final Session session;
  
  MobileAuthService(this.session);

  /// Initiate mobile authentication
  Future<Map<String, dynamic>> initiateAuth({
    required String phoneNumber,
    required String countryCode,
    required String deviceId,
    required String deviceName,
    String? deviceOS,
    String? appVersion,
  }) async {
    try {
      // Format phone number
      final formattedPhone = _formatPhoneNumber(phoneNumber, countryCode);
      
      // Check if user exists with this phone
      final existingUser = await User.db.findFirstRow(
        session,
        where: (t) => t.phoneNumber.equals(formattedPhone),
      );

      final isNewUser = existingUser == null;
      
      // Generate verification code
      final code = _generateCode();
      
      // Create verification record
      final verification = MobileVerification(
        phoneNumber: formattedPhone,
        countryCode: countryCode,
        verificationCode: code,
        codeExpiresAt: DateTime.now().add(Duration(minutes: 10)),
        userId: existingUser?.id,
        isNewUser: isNewUser,
        deviceId: deviceId,
        attempts: 0,
        createdAt: DateTime.now(),
      );

      await MobileVerification.db.insertRow(session, verification);

      // Send code via WhatsApp
      final sent = await _sendWhatsAppVerification(
        phoneNumber: formattedPhone,
        code: code,
        isNewUser: isNewUser,
        userName: existingUser?.firstName,
      );

      if (!sent) {
        return {
          'success': false,
          'error': 'Failed to send verification code',
        };
      }

      return {
        'success': true,
        'is_new_user': isNewUser,
        'phone_number': formattedPhone,
        'message': 'Verification code sent to WhatsApp',
        'expires_in_minutes': 10,
      };

    } catch (e, stackTrace) {
      session.log('Mobile auth initiation error: $e', stackTrace: stackTrace);
      return {
        'success': false,
        'error': e.toString(),
      };
    }
  }

  /// Verify code and complete authentication
  Future<Map<String, dynamic>> verifyCode({
    required String phoneNumber,
    required String countryCode,
    required String code,
    required String deviceId,
    String? deviceName,
    String? deviceOS,
    String? appVersion,
  }) async {
    try {
      final formattedPhone = _formatPhoneNumber(phoneNumber, countryCode);

      // Get verification record
      final verification = await MobileVerification.db.findFirstRow(
        session,
        where: (t) => 
          t.phoneNumber.equals(formattedPhone) & 
          t.deviceId.equals(deviceId) &
          t.isVerified.equals(false),
        orderBy: (t) => t.createdAt,
        orderDescending: true,
      );

      if (verification == null) {
        return {
          'success': false,
          'error': 'No verification request found',
        };
      }

      // Check attempts
      if (verification.attempts >= 5) {
        return {
          'success': false,
          'error': 'Too many failed attempts. Please request a new code.',
        };
      }

      // Check expiry
      if (verification.codeExpiresAt.isBefore(DateTime.now())) {
        return {
          'success': false,
          'error': 'Verification code expired',
        };
      }

      // Verify code
      if (verification.verificationCode != code) {
        verification.attempts++;
        await MobileVerification.db.updateRow(session, verification);
        
        return {
          'success': false,
          'error': 'Invalid verification code',
          'attempts_remaining': 5 - verification.attempts,
        };
      }

      // Code is valid - proceed with auth
      User user;
      
      if (verification.isNewUser) {
        // Create new user
        user = await _createUserFromVerification(
          verification: verification,
          deviceName: deviceName,
        );
      } else {
        // Get existing user
        user = (await User.db.findById(session, verification.userId!))!;
      }

      // Mark verification as complete
      verification.isVerified = true;
      verification.verifiedAt = DateTime.now();
      await MobileVerification.db.updateRow(session, verification);

      // Create mobile session
      final mobileSession = await _createMobileSession(
        user: user,
        deviceId: deviceId,
        deviceName: deviceName,
        deviceOS: deviceOS,
        appVersion: appVersion,
      );

      return {
        'success': true,
        'is_new_user': verification.isNewUser,
        'user': {
          'id': user.id.uuid,
          'phone_number': user.phoneNumber,
          'email': user.email,
          'first_name': user.firstName,
          'last_name': user.lastName,
          'user_type': user.userType.name,
        },
        'session': {
          'access_token': mobileSession.accessToken,
          'refresh_token': mobileSession.refreshToken,
          'expires_at': mobileSession.tokenExpiresAt.toIso8601String(),
        },
      };

    } catch (e, stackTrace) {
      session.log('Mobile code verification error: $e', stackTrace: stackTrace);
      return {
        'success': false,
        'error': e.toString(),
      };
    }
  }

  /// Validate access token
  Future<MobileSession?> validateToken(String accessToken) async {
    try {
      final mobileSession = await MobileSession.db.findFirstRow(
        session,
        where: (t) => 
          t.accessToken.equals(accessToken) & 
          t.isActive.equals(true) &
          t.isRevoked.equals(false),
      );

      if (mobileSession == null) return null;

      // Check expiry
      if (mobileSession.tokenExpiresAt.isBefore(DateTime.now())) {
        return null;
      }

      // Update last used
      mobileSession.lastUsedAt = DateTime.now();
      await MobileSession.db.updateRow(session, mobileSession);

      return mobileSession;

    } catch (e) {
      session.log('Token validation error: $e');
      return null;
    }
  }

  /// Refresh access token
  Future<Map<String, dynamic>> refreshToken({
    required String refreshToken,
    required String deviceId,
  }) async {
    try {
      final mobileSession = await MobileSession.db.findFirstRow(
        session,
        where: (t) => 
          t.refreshToken.equals(refreshToken) & 
          t.deviceId.equals(deviceId) &
          t.isActive.equals(true) &
          t.isRevoked.equals(false),
      );

      if (mobileSession == null) {
        return {
          'success': false,
          'error': 'Invalid refresh token',
        };
      }

      // Generate new tokens
      final newAccessToken = _generateToken();
      final newRefreshToken = _generateToken();

      mobileSession.accessToken = newAccessToken;
      mobileSession.refreshToken = newRefreshToken;
      mobileSession.tokenExpiresAt = DateTime.now().add(Duration(days: 30));
      mobileSession.updatedAt = DateTime.now();

      await MobileSession.db.updateRow(session, mobileSession);

      return {
        'success': true,
        'access_token': newAccessToken,
        'refresh_token': newRefreshToken,
        'expires_at': mobileSession.tokenExpiresAt.toIso8601String(),
      };

    } catch (e) {
      session.log('Token refresh error: $e');
      return {
        'success': false,
        'error': e.toString(),
      };
    }
  }

  /// Logout (revoke session)
  Future<bool> logout({
    required String accessToken,
    required String deviceId,
  }) async {
    try {
      final mobileSession = await MobileSession.db.findFirstRow(
        session,
        where: (t) => 
          t.accessToken.equals(accessToken) & 
          t.deviceId.equals(deviceId),
      );

      if (mobileSession == null) return false;

      mobileSession.isActive = false;
      mobileSession.isRevoked = true;
      mobileSession.revokedAt = DateTime.now();

      await MobileSession.db.updateRow(session, mobileSession);
      return true;

    } catch (e) {
      session.log('Logout error: $e');
      return false;
    }
  }

  /// Resend verification code
  Future<Map<String, dynamic>> resendCode({
    required String phoneNumber,
    required String countryCode,
    required String deviceId,
  }) async {
    try {
      final formattedPhone = _formatPhoneNumber(phoneNumber, countryCode);

      // Get latest verification
      final verification = await MobileVerification.db.findFirstRow(
        session,
        where: (t) => 
          t.phoneNumber.equals(formattedPhone) & 
          t.deviceId.equals(deviceId),
        orderBy: (t) => t.createdAt,
        orderDescending: true,
      );

      if (verification == null) {
        return {
          'success': false,
          'error': 'No verification request found',
        };
      }

      // Rate limiting
      final timeSinceCreation = DateTime.now().difference(verification.createdAt);
      if (timeSinceCreation.inSeconds < 60) {
        return {
          'success': false,
          'error': 'Please wait before requesting a new code',
          'retry_after': 60 - timeSinceCreation.inSeconds,
        };
      }

      // Generate new code
      final newCode = _generateCode();
      
      // Create new verification
      final newVerification = MobileVerification(
        phoneNumber: formattedPhone,
        countryCode: countryCode,
        verificationCode: newCode,
        codeExpiresAt: DateTime.now().add(Duration(minutes: 10)),
        userId: verification.userId,
        isNewUser: verification.isNewUser,
        deviceId: deviceId,
        attempts: 0,
        createdAt: DateTime.now(),
      );

      await MobileVerification.db.insertRow(session, newVerification);

      // Send via WhatsApp
      final user = verification.userId != null
          ? await User.db.findById(session, verification.userId!)
          : null;

      final sent = await _sendWhatsAppVerification(
        phoneNumber: formattedPhone,
        code: newCode,
        isNewUser: verification.isNewUser,
        userName: user?.firstName,
      );

      if (!sent) {
        return {
          'success': false,
          'error': 'Failed to send verification code',
        };
      }

      return {
        'success': true,
        'message': 'New verification code sent',
      };

    } catch (e) {
      session.log('Resend code error: $e');
      return {
        'success': false,
        'error': e.toString(),
      };
    }
  }

  // ========== Private Helpers ==========

  Future<User> _createUserFromVerification({
    required MobileVerification verification,
    String? deviceName,
  }) async {
    final userId = Uuid().v4obj();
    
    final user = User(
      id: userId,
      userType: UserType.customer, // Default to customer
      phoneNumber: verification.phoneNumber,
      countryCode: verification.countryCode,
      status: UserStatus.active,
      emailVerified: false,
      phoneVerified: true,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    final createdUser = await User.db.insertRow(session, user);

    // Create customer profile
    final profile = CustomerProfile(
      id: createdUser.id,
      userId: createdUser.id,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    await CustomerProfile.db.insertRow(session, profile);

    return createdUser;
  }

  Future<MobileSession> _createMobileSession({
    required User user,
    required String deviceId,
    String? deviceName,
    String? deviceOS,
    String? appVersion,
  }) async {
    final accessToken = _generateToken();
    final refreshToken = _generateToken();

    final mobileSession = MobileSession(
      userId: user.id,
      deviceId: deviceId,
      deviceName: deviceName,
      deviceOS: deviceOS,
      appVersion: appVersion,
      accessToken: accessToken,
      refreshToken: refreshToken,
      tokenExpiresAt: DateTime.now().add(Duration(days: 30)),
      isActive: true,
      lastUsedAt: DateTime.now(),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    return await MobileSession.db.insertRow(session, mobileSession);
  }

  Future<bool> _sendWhatsAppVerification({
    required String phoneNumber,
    required String code,
    required bool isNewUser,
    String? userName,
  }) async {
    try {
      final whatsappService = getIt<WhatsAppService>();

      final message = '''
ðŸ"± Asami Mobile App

${isNewUser ? 'Welcome!' : 'Welcome back${userName != null ? ', $userName' : ''}!'}

Your verification code is: *$code*

This code will expire in 10 minutes.

If you didn't request this code, please ignore this message.
''';

      final result = await whatsappService.sendMessage(
        phoneNumber: phoneNumber,
        text: message,
      );

      return result.isSuccess;

    } catch (e) {
      session.log('WhatsApp send error: $e');
      return false;
    }
  }

  String _generateCode() {
    final random = Random.secure();
    return (100000 + random.nextInt(900000)).toString();
  }

  String _generateToken() {
    final random = Random.secure();
    final values = List<int>.generate(32, (i) => random.nextInt(256));
    return base64Url.encode(values).replaceAll('=', '');
  }

  String _formatPhoneNumber(String phone, String countryCode) {
    // Remove all non-numeric characters
    String cleaned = phone.replaceAll(RegExp(r'[^\d]'), '');
    
    // Add country code if not present
    if (!cleaned.startsWith(countryCode.replaceAll('+', ''))) {
      cleaned = countryCode.replaceAll('+', '') + cleaned;
    }
    
    return cleaned;
  }
}