
import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class UserEndpoint extends Endpoint {
  /// Update user profile
  Future<User?> updateProfile(
    Session session, {
    required UuidValue userId,
    String? firstName,
    String? lastName,
    String? email,
    String? profileImageUrl,
    String? city,
    String? state,
    String? country,
    String? language,
    String? timezone,
  }) async {
    try {
      final user = await User.db.findFirstRow(
        session,
        where: (t) => t.id.equals(userId),
      );

      if (user == null) return null;

      if (firstName != null) user.firstName = firstName;
      if (lastName != null) user.lastName = lastName;
      if (email != null) user.email = email;
      if (profileImageUrl != null) user.profileImageUrl = profileImageUrl;
      if (city != null) user.city = city;
      if (state != null) user.state = state;
      if (country != null) user.country = country;
      if (language != null) user.language = language;
      if (timezone != null) user.timezone = timezone;
      
      user.updatedAt = DateTime.now();

      return await User.db.updateRow(session, user);
    } catch (e) {
      session.log('Update profile error: $e');
      return null;
    }
  }

  /// Get customer profile
  Future<CustomerProfile?> getCustomerProfile(
    Session session,
    UuidValue userId,
  ) async {
    return await CustomerProfile.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(userId),
    );
  }

  /// Update customer profile
  Future<CustomerProfile?> updateCustomerProfile(
    Session session, {
    required UuidValue userId,
    String? preferredPaymentMethod,
    List<String>? favoriteVendors,
  }) async {
    final profile = await getCustomerProfile(session, userId);
    if (profile == null) return null;

    if (preferredPaymentMethod != null) {
      profile.preferredPaymentMethod = preferredPaymentMethod;
    }
    if (favoriteVendors != null) {
      profile.favoriteVendors = favoriteVendors;
    }

    profile.updatedAt = DateTime.now();
    return await CustomerProfile.db.updateRow(session, profile);
  }

  /// Get vendor profile
  Future<VendorProfile?> getVendorProfile(
    Session session,
    UuidValue userId,
  ) async {
    return await VendorProfile.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(userId),
    );
  }

  /// Update vendor profile
  Future<VendorProfile?> updateVendorProfile(
    Session session, {
    required UuidValue userId,
    String? businessName,
    String? businessDescription,
    String? businessCategory,
    String? businessLogoUrl,
    String? businessBannerUrl,
    String? supportEmail,
    String? supportPhone,
  }) async {
    final profile = await getVendorProfile(session, userId);
    if (profile == null) return null;

    if (businessName != null) profile.businessName = businessName;
    if (businessDescription != null) profile.businessDescription = businessDescription;
    if (businessCategory != null) profile.businessCategory = businessCategory;
    if (businessLogoUrl != null) profile.businessLogoUrl = businessLogoUrl;
    if (businessBannerUrl != null) profile.businessBannerUrl = businessBannerUrl;
    if (supportEmail != null) profile.supportEmail = supportEmail;
    if (supportPhone != null) profile.supportPhone = supportPhone;

    profile.updatedAt = DateTime.now();
    return await VendorProfile.db.updateRow(session, profile);
  }

  /// Add address
  Future<Address?> addAddress(
    Session session, {
    required UuidValue userId,
    required String label,
    required String recipientName,
    required String phoneNumber,
    required String addressLine1,
    String? addressLine2,
    required String city,
    required String state,
    required String country,
    required String postalCode,
    String? landmark,
    bool isDefault = false,
    double? latitude,
    double? longitude,
  }) async {
    try {
      // If this is default, unset other defaults
      if (isDefault) {
        await _unsetDefaultAddresses(session, userId);
      }

      final addressId = const Uuid().v4obj();

      final address = Address(
        id: addressId,
        userId: userId,
        label: label,
        recipientName: recipientName,
        phoneNumber: phoneNumber,
        addressLine1: addressLine1,
        addressLine2: addressLine2,
        city: city,
        state: state,
        country: country,
        postalCode: postalCode,
        landmark: landmark,
        isDefault: isDefault,
        latitude: latitude,
        longitude: longitude,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      return await Address.db.insertRow(session, address);
    } catch (e) {
      session.log('Add address error: $e');
      return null;
    }
  }

  /// Get user addresses
  Future<List<Address>> getUserAddresses(
    Session session,
    UuidValue userId,
  ) async {
    return await Address.db.find(
      session,
      where: (t) => t.userId.equals(userId) & t.isActive.equals(true),
      orderBy: (t) => t.isDefault,
      orderDescending: true,
    );
  }

  /// Set default address
  Future<bool> setDefaultAddress(
    Session session, {
    required UuidValue userId,
    required UuidValue addressId,
  }) async {
    try {
      await _unsetDefaultAddresses(session, userId);

      final address = await Address.db.findFirstRow(
        session,
        where: (t) => t.id.equals(addressId) & t.userId.equals(userId),
      );

      if (address == null) return false;

      address.isDefault = true;
      address.updatedAt = DateTime.now();
      await Address.db.updateRow(session, address);

      return true;
    } catch (e) {
      session.log('Set default address error: $e');
      return false;
    }
  }

  Future<void> _unsetDefaultAddresses(Session session, UuidValue userId) async {
    final addresses = await Address.db.find(
      session,
      where: (t) => t.userId.equals(userId) & t.isDefault.equals(true),
    );

    for (var addr in addresses) {
      addr.isDefault = false;
      addr.updatedAt = DateTime.now();
      await Address.db.updateRow(session, addr);
    }
  }
}