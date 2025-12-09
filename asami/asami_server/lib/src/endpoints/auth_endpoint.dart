import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class AuthEndpoint extends Endpoint {
  /// Register new user (customer or vendor)
  Future<User?> register(
    Session session, {
    required String phoneNumber,
    required String countryCode,
    required UserType userType,
    String? email,
    String? firstName,
    String? lastName,
    String? whatsappId,
    String? telegramId,
  }) async {
    try {
      // Check if user exists
      final existing = await User.db.findFirstRow(
        session,
        where: (t) => t.phoneNumber.equals(phoneNumber) & t.countryCode.equals(countryCode),
      );

      if (existing != null) {
        throw Exception('User already exists with this phone number');
      }

      // Generate unique userId
      final userId = Uuid().v4obj();

      final user = User(
        id: userId,
        userType: userType,
        phoneNumber: phoneNumber,
        countryCode: countryCode,
        email: email,
        firstName: firstName,
        lastName: lastName,
        whatsappId: whatsappId,
        telegramId: telegramId,
        status: UserStatus.active,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      final createdUser = await User.db.insertRow(session, user);

      // Create profile based on user type
      if (userType == UserType.customer) {
        await _createCustomerProfile(session, createdUser.id);
      } else if (userType == UserType.vendor) {
        await _createVendorProfile(session, createdUser.id);
      }

      return createdUser;
    } catch (e) {
      session.log('Registration error: $e');
      return null;
    }
  }

  /// Verify phone number
  Future<bool> verifyPhone(
    Session session, {
    required UuidValue userId,
    required String verificationCode,
  }) async {
    try {
      // TODO: Implement actual verification logic with SMS service
      // For now, accept any code for development
      
      final user = await User.db.findFirstRow(
        session,
        where: (t) => t.id.equals(userId),
      );

      if (user == null) return false;

      user.isPhoneVerified = true;
      user.updatedAt = DateTime.now();

      await User.db.updateRow(session, user);
      return true;
    } catch (e) {
      session.log('Phone verification error: $e');
      return false;
    }
  }

  /// Get user by userId
  Future<User?> getUser(Session session, UuidValue userId) async {
    return await User.db.findFirstRow(
      session,
      where: (t) => t.id.equals(userId),
    );
  }

  /// Get user by phone number
  Future<User?> getUserByPhone(
    Session session,
    String phoneNumber,
    String countryCode,
  ) async {
    return await User.db.findFirstRow(
      session,
      where: (t) => t.phoneNumber.equals(phoneNumber) & t.countryCode.equals(countryCode),
    );
  }

  /// Get or create user by WhatsApp ID
  Future<User?> getOrCreateUserByWhatsApp(
    Session session, {
    required String whatsappId,
    required String phoneNumber,
    String? name,
    UserType userType = UserType.customer,
  }) async {
    // Try to find existing user
    var user = await User.db.findFirstRow(
      session,
      where: (t) => t.whatsappId.equals(whatsappId),
    );

    if (user != null) return user;

    // Create new user
    final userId =  Uuid().v4obj();
    
    user = User(
      id: userId,
      userType: userType,
      phoneNumber: phoneNumber,
      countryCode: '+1', // Default, should be extracted from phone
      whatsappId: whatsappId,
      firstName: name,
      status: UserStatus.active,
      isPhoneVerified: true, // Auto-verify for WhatsApp users
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      lastActiveAt: DateTime.now(),
    );

    final createdUser = await User.db.insertRow(session, user);

    // Create profile
    if (userType == UserType.customer) {
      await _createCustomerProfile(session, createdUser.id);
    } else {
      await _createVendorProfile(session, createdUser.id);
    }

    return createdUser;
  }

  /// Get or create user by Telegram ID
  Future<User?> getOrCreateUserByTelegram(
    Session session, {
    required String telegramId,
    required String username,
    String? firstName,
    String? lastName,
    UserType userType = UserType.customer,
  }) async {
    // Try to find existing user
    var user = await User.db.findFirstRow(
      session,
      where: (t) => t.telegramId.equals(telegramId),
    );

    if (user != null) return user;

    // Create new user
    final userId = Uuid().v4obj();
    
    user = User(
      id: userId,
      userType: userType,
      phoneNumber: username, // Using username as phone placeholder
      countryCode: '+0',
      telegramId: telegramId,
      firstName: firstName,
      lastName: lastName,
      status: UserStatus.active,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      lastActiveAt: DateTime.now(),
    );

    final createdUser = await User.db.insertRow(session, user);

    // Create profile
    if (userType == UserType.customer) {
      await _createCustomerProfile(session, createdUser.id);
    } else {
      await _createVendorProfile(session, createdUser.id);
    }

    return createdUser;
  }

  /// Update user last active timestamp
  Future<void> updateLastActive(Session session, UuidValue userId) async {
    final user = await User.db.findFirstRow(
      session,
      where: (t) => t.id.equals(userId),
    );

    if (user != null) {
      user.lastActiveAt = DateTime.now();
      user.updatedAt = DateTime.now();
      await User.db.updateRow(session, user);
    }
  }

  // Private helper methods
  Future<void> _createCustomerProfile(Session session, UuidValue userId) async {
    final profile = CustomerProfile(
      userId: userId,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    await CustomerProfile.db.insertRow(session, profile);
  }

  Future<void> _createVendorProfile(Session session, UuidValue userId) async {
    final profile = VendorProfile(
      userId: userId,
      businessName: 'My Business', // Placeholder
      businessCategory: 'General',
      subscriptionTier: SubscriptionTier.freemium,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    await VendorProfile.db.insertRow(session, profile);
  }
}
