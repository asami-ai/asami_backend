// File: server/lib/src/services/auth/auth_service.dart

import 'dart:math';
import 'package:serverpod/serverpod.dart' hide Message;
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import '../../generated/protocol.dart' hide Message, Address;

class AuthService {
  final Session session;
  
  AuthService(this.session);
  
  /// Generate 6-digit verification code
  String generateVerificationCode() {
    final random = Random.secure();
    return (100000 + random.nextInt(900000)).toString();
  }
  
  /// Send verification email
  Future<bool> sendVerificationEmail({
    required String email,
    required String code,
    required String userName,
  }) async {
    try {
      // kmjr exbq abox jbta
      // Get SMTP credentials from Serverpod secrets
      final smtpHost = session.serverpod.getPassword('smtpHost') ?? '';
      final smtpPort = int.parse(session.serverpod.getPassword('smtpPort') ?? '587');
      final smtpUser = session.serverpod.getPassword('smtpUser') ?? '';
      final smtpPass = session.serverpod.getPassword('smtpPassword') ?? '';
      
      final smtpServer = SmtpServer(
        smtpHost,
        port: smtpPort,
        username: smtpUser,
        password: smtpPass,
        ssl: true
      );
      
      final message = Message()
        ..from = Address(smtpUser, 'Asami')
        ..recipients.add(email)
        ..subject = 'Your Asami Verification Code'
        ..html = '''
          <!DOCTYPE html>
          <html>
          <head>
            <style>
              body { font-family: Arial, sans-serif; line-height: 1.6; color: #333; }
              .container { max-width: 600px; margin: 0 auto; padding: 20px; }
              .header { background: #4CAF50; color: white; padding: 20px; text-align: center; }
              .content { background: #f9f9f9; padding: 30px; }
              .code { font-size: 32px; font-weight: bold; letter-spacing: 5px; 
                      color: #4CAF50; text-align: center; padding: 20px; 
                      background: white; border-radius: 8px; margin: 20px 0; }
              .footer { text-align: center; padding: 20px; font-size: 12px; color: #666; }
            </style>
          </head>
          <body>
            <div class="container">
              <div class="header">
                <h1>🛍️ Asami Verification</h1>
              </div>
              <div class="content">
                <p>Hi ${userName.isNotEmpty ? userName : 'there'},</p>
                <p>Your verification code is:</p>
                <div class="code">$code</div>
                <p>This code will expire in <strong>10 minutes</strong>.</p>
                <p>If you didn't request this code, please ignore this email.</p>
              </div>
              <div class="footer">
                <p>© ${DateTime.now().year} Asami. All rights reserved.</p>
              </div>
            </div>
          </body>
          </html>
        ''';
      
      await send(message, smtpServer);
      return true;
    } catch (e) {
      session.log('Email send failed: $e');
      return false;
    }
  }
  
  /// Create or update verification code
  Future<bool> createVerificationCode({
    required String email,
    required String code,
  }) async {
    try {
      final user = await User.db.findFirstRow(
        session,
        where: (t) => t.email.equals(email),
      );
      
      if (user == null) return false;
      
      user.verificationCode = code;
      user.verificationCodeExpiry = DateTime.now().add(Duration(minutes: 10));
      user.verificationAttempts = 0;
      
      await User.db.updateRow(session, user);
      return true;
    } catch (e) {
      session.log('Create verification code error: $e');
      return false;
    }
  }
  
  /// Verify code
  Future<Map<String, dynamic>> verifyCode({
    required String email,
    required String code,
  }) async {
    try {
      final user = await User.db.findFirstRow(
        session,
        where: (t) => t.email.equals(email),
      );
      
      if (user == null) {
        return {'success': false, 'error': 'User not found'};
      }
      
      // Check too many attempts
      if (user.verificationAttempts >= 5) {
        return {
          'success': false,
          'error': 'Too many failed attempts. Request a new code.',
          'rate_limited': true,
        };
      }
      
      // Check expiry
      if (user.verificationCodeExpiry == null ||
          user.verificationCodeExpiry!.isBefore(DateTime.now())) {
        return {'success': false, 'error': 'Code expired'};
      }
      
      // Verify code
      if (user.verificationCode != code) {
        user.verificationAttempts++;
        await User.db.updateRow(session, user);
        
        return {
          'success': false,
          'error': 'Invalid code',
          'attempts_remaining': 5 - user.verificationAttempts,
        };
      }
      
      // Success - mark email as verified
      user.emailVerified = true;
      user.emailVerifiedAt = DateTime.now();
      user.verificationCode = null;
      user.verificationCodeExpiry = null;
      user.verificationAttempts = 0;
      
      await User.db.updateRow(session, user);
      
      return {
        'success': true,
        'user_id': user.id.uuid,
        'user': user,
      };
    } catch (e) {
      session.log('Verify code error: $e');
      return {'success': false, 'error': 'Verification failed'};
    }
  }
  
  /// Authenticate platform
  Future<Map<String, dynamic>> authenticatePlatform({
    required String userId,
    required PlatformType platform,
    required String platformUserId,
    String? deviceInfo,
  }) async {
    try {
      final user = await User.db.findById(session, UuidValue.fromString(userId));
      
      if (user == null) {
        return {'success': false, 'error': 'User not found'};
      }
      
      // Update platform authentication status
      switch (platform) {
        case PlatformType.whatsapp:
          user.whatsappAuthenticated = true;
          user.lastWhatsappLogin = DateTime.now();
          user.whatsappId = platformUserId;
          break;
        case PlatformType.telegram:
          user.telegramAuthenticated = true;
          user.lastTelegramLogin = DateTime.now();
          user.telegramId = platformUserId;
          break;
        default:
          break;
      }
      
      await User.db.updateRow(session, user);
      
      // Create auth session
      final sessionId = Uuid().v4obj();
      final authSession = AuthSession(
        id: sessionId,
        userId: user.id,
        platform: platform,
        platformUserId: platformUserId,
        isActive: true,
        loginAt: DateTime.now(),
        deviceInfo: deviceInfo,
        createdAt: DateTime.now(),
      );
      
      await AuthSession.db.insertRow(session, authSession);
      
      return {
        'success': true,
        'user': user,
        'session_id': sessionId.uuid,
      };
    } catch (e) {
      session.log('Authenticate platform error: $e');
      return {'success': false, 'error': 'Authentication failed'};
    }
  }
  
  /// Check if user is authenticated on platform
  Future<Map<String, dynamic>> checkAuthentication({
    required PlatformType platform,
    required String platformUserId,
  }) async {
    try {
      User? user;
      
      switch (platform) {
        case PlatformType.whatsapp:
          user = await User.db.findFirstRow(
            session,
            where: (t) => t.whatsappId.equals(platformUserId) & 
                         t.whatsappAuthenticated.equals(true),
          );
          break;
        case PlatformType.telegram:
          user = await User.db.findFirstRow(
            session,
            where: (t) => t.telegramId.equals(platformUserId) & 
                         t.telegramAuthenticated.equals(true),
          );
          break;
        default:
          break;
      }
      
      if (user != null) {
        // Check if there's an active session
        final activeSession = await AuthSession.db.findFirstRow(
          session,
          where: (t) => 
            t.userId.equals(user?.id) & 
            t.platform.equals(platform) & 
            t.isActive.equals(true),
        );
        
        return {
          'authenticated': true,
          'user': user,
          'session': activeSession,
        };
      }
      
      // Check if user exists but on different platform
      User? userLoggedOut;
      
      if (platform == PlatformType.telegram) {
        userLoggedOut = await User.db.findFirstRow(
          session,
          where: (t) => t.telegramId.equals(platformUserId),
        );
      } else if (platform == PlatformType.whatsapp) {
        userLoggedOut = await User.db.findFirstRow(
          session,
          where: (t) => t.whatsappId.equals(platformUserId),
        );
      }
      
      if (userLoggedOut != null && userLoggedOut.email != null) {
        return {
          'authenticated': false,
          'known_user': true,
          'user_email': userLoggedOut.email,
          'requires_login': true,
        };
      }
      
      return {
        'authenticated': false,
        'known_user': false,
        'new_user': true,
      };
    } catch (e) {
      session.log('Check authentication error: $e');
      return {'authenticated': false, 'error': 'Check failed'};
    }
  }
  
  /// Logout from platform
  Future<bool> logout({
    required String userId,
    required PlatformType platform,
  }) async {
    try {
      final user = await User.db.findById(session, UuidValue.fromString(userId));
      
      if (user == null) return false;
      
      // Update platform authentication status
      switch (platform) {
        case PlatformType.whatsapp:
          user.whatsappAuthenticated = false;
          break;
        case PlatformType.telegram:
          user.telegramAuthenticated = false;
          break;
        default:
          break;
      }
      
      await User.db.updateRow(session, user);
      
      // Deactivate all sessions for this platform
      final sessions = await AuthSession.db.find(
        session,
        where: (t) => 
          t.userId.equals(user.id) & 
          t.platform.equals(platform) & 
          t.isActive.equals(true),
      );
      
      for (var s in sessions) {
        s.isActive = false;
        s.logoutAt = DateTime.now();
        await AuthSession.db.updateRow(session, s);
      }
      
      return true;
    } catch (e) {
      session.log('Logout error: $e');
      return false;
    }
  }
  
  /// Check if email exists
  Future<bool> emailExists(String email) async {
    final user = await User.db.findFirstRow(
      session,
      where: (t) => t.email.equals(email),
    );
    return user != null;
  }
  
  /// Request verification resend (with rate limiting)
  Future<Map<String, dynamic>> resendVerificationCode({
    required String email,
  }) async {
    try {
      final user = await User.db.findFirstRow(
        session,
        where: (t) => t.email.equals(email),
      );
      
      if (user == null) {
        return {'success': false, 'error': 'User not found'};
      }
      
      // Rate limiting: Check last request time
      if (user.verificationCodeExpiry != null) {
        final timeSinceLastCode = DateTime.now().difference(
          user.verificationCodeExpiry!.subtract(Duration(minutes: 10))
        );
        
        if (timeSinceLastCode.inSeconds < 60) {
          return {
            'success': false,
            'error': 'Please wait before requesting a new code',
            'retry_after': 60 - timeSinceLastCode.inSeconds,
          };
        }
      }
      
      // Generate and send new code
      final code = generateVerificationCode();
      await createVerificationCode(email: email, code: code);
      
      final sent = await sendVerificationEmail(
        email: email,
        code: code,
        userName: user.firstName ?? '',
      );
      
      if (!sent) {
        return {'success': false, 'error': 'Failed to send email'};
      }
      
      return {
        'success': true,
        'message': 'Verification code sent',
      };
    } catch (e) {
      session.log('Resend verification error: $e');
      return {'success': false, 'error': 'Resend failed'};
    }
  }
}