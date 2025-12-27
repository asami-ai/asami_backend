/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import '../user/subscription_tier.dart' as _i2;
import '../user/user.dart' as _i3;
import 'package:asami_client/src/protocol/protocol.dart' as _i4;

abstract class VendorProfile implements _i1.SerializableModel {
  VendorProfile._({
    _i1.UuidValue? id,
    required this.userId,
    this.user,
    required this.businessName,
    this.businessDescription,
    required this.businessCategory,
    this.businessLogoUrl,
    this.businessBannerUrl,
    this.businessRegistrationNumber,
    this.taxId,
    bool? isVerified,
    this.verifiedAt,
    _i2.SubscriptionTier? subscriptionTier,
    this.subscriptionStartDate,
    this.subscriptionEndDate,
    bool? autoRenew,
    int? productLimit,
    int? currentProductCount,
    int? aiDescriptionsLimit,
    int? aiDescriptionsUsed,
    this.monthlyResetDate,
    int? totalProducts,
    int? activeProducts,
    int? totalOrders,
    double? totalRevenue,
    double? averageRating,
    int? totalReviews,
    double? platformTransactionFee,
    double? totalPlatformFees,
    double? pendingPayouts,
    double? totalPayouts,
    this.supportEmail,
    this.supportPhone,
    int? responseTime,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : id = id ?? _i1.Uuid().v4obj(),
       isVerified = isVerified ?? false,
       subscriptionTier = subscriptionTier ?? _i2.SubscriptionTier.freemium,
       autoRenew = autoRenew ?? true,
       productLimit = productLimit ?? 20,
       currentProductCount = currentProductCount ?? 0,
       aiDescriptionsLimit = aiDescriptionsLimit ?? 50,
       aiDescriptionsUsed = aiDescriptionsUsed ?? 0,
       totalProducts = totalProducts ?? 0,
       activeProducts = activeProducts ?? 0,
       totalOrders = totalOrders ?? 0,
       totalRevenue = totalRevenue ?? 0.0,
       averageRating = averageRating ?? 0.0,
       totalReviews = totalReviews ?? 0,
       platformTransactionFee = platformTransactionFee ?? 0.05,
       totalPlatformFees = totalPlatformFees ?? 0.0,
       pendingPayouts = pendingPayouts ?? 0.0,
       totalPayouts = totalPayouts ?? 0.0,
       responseTime = responseTime ?? 24,
       createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory VendorProfile({
    _i1.UuidValue? id,
    required _i1.UuidValue userId,
    _i3.User? user,
    required String businessName,
    String? businessDescription,
    required String businessCategory,
    String? businessLogoUrl,
    String? businessBannerUrl,
    String? businessRegistrationNumber,
    String? taxId,
    bool? isVerified,
    DateTime? verifiedAt,
    _i2.SubscriptionTier? subscriptionTier,
    DateTime? subscriptionStartDate,
    DateTime? subscriptionEndDate,
    bool? autoRenew,
    int? productLimit,
    int? currentProductCount,
    int? aiDescriptionsLimit,
    int? aiDescriptionsUsed,
    DateTime? monthlyResetDate,
    int? totalProducts,
    int? activeProducts,
    int? totalOrders,
    double? totalRevenue,
    double? averageRating,
    int? totalReviews,
    double? platformTransactionFee,
    double? totalPlatformFees,
    double? pendingPayouts,
    double? totalPayouts,
    String? supportEmail,
    String? supportPhone,
    int? responseTime,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _VendorProfileImpl;

  factory VendorProfile.fromJson(Map<String, dynamic> jsonSerialization) {
    return VendorProfile(
      id: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      userId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      user: jsonSerialization['user'] == null
          ? null
          : _i4.Protocol().deserialize<_i3.User>(jsonSerialization['user']),
      businessName: jsonSerialization['businessName'] as String,
      businessDescription: jsonSerialization['businessDescription'] as String?,
      businessCategory: jsonSerialization['businessCategory'] as String,
      businessLogoUrl: jsonSerialization['businessLogoUrl'] as String?,
      businessBannerUrl: jsonSerialization['businessBannerUrl'] as String?,
      businessRegistrationNumber:
          jsonSerialization['businessRegistrationNumber'] as String?,
      taxId: jsonSerialization['taxId'] as String?,
      isVerified: jsonSerialization['isVerified'] as bool,
      verifiedAt: jsonSerialization['verifiedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['verifiedAt']),
      subscriptionTier: _i2.SubscriptionTier.fromJson(
        (jsonSerialization['subscriptionTier'] as String),
      ),
      subscriptionStartDate: jsonSerialization['subscriptionStartDate'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['subscriptionStartDate'],
            ),
      subscriptionEndDate: jsonSerialization['subscriptionEndDate'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['subscriptionEndDate'],
            ),
      autoRenew: jsonSerialization['autoRenew'] as bool,
      productLimit: jsonSerialization['productLimit'] as int,
      currentProductCount: jsonSerialization['currentProductCount'] as int,
      aiDescriptionsLimit: jsonSerialization['aiDescriptionsLimit'] as int,
      aiDescriptionsUsed: jsonSerialization['aiDescriptionsUsed'] as int,
      monthlyResetDate: jsonSerialization['monthlyResetDate'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['monthlyResetDate'],
            ),
      totalProducts: jsonSerialization['totalProducts'] as int,
      activeProducts: jsonSerialization['activeProducts'] as int,
      totalOrders: jsonSerialization['totalOrders'] as int,
      totalRevenue: (jsonSerialization['totalRevenue'] as num).toDouble(),
      averageRating: (jsonSerialization['averageRating'] as num).toDouble(),
      totalReviews: jsonSerialization['totalReviews'] as int,
      platformTransactionFee:
          (jsonSerialization['platformTransactionFee'] as num).toDouble(),
      totalPlatformFees: (jsonSerialization['totalPlatformFees'] as num)
          .toDouble(),
      pendingPayouts: (jsonSerialization['pendingPayouts'] as num).toDouble(),
      totalPayouts: (jsonSerialization['totalPayouts'] as num).toDouble(),
      supportEmail: jsonSerialization['supportEmail'] as String?,
      supportPhone: jsonSerialization['supportPhone'] as String?,
      responseTime: jsonSerialization['responseTime'] as int?,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
    );
  }

  /// The id of the object.
  _i1.UuidValue id;

  _i1.UuidValue userId;

  _i3.User? user;

  String businessName;

  String? businessDescription;

  String businessCategory;

  String? businessLogoUrl;

  String? businessBannerUrl;

  String? businessRegistrationNumber;

  String? taxId;

  bool isVerified;

  DateTime? verifiedAt;

  _i2.SubscriptionTier subscriptionTier;

  DateTime? subscriptionStartDate;

  DateTime? subscriptionEndDate;

  bool autoRenew;

  int productLimit;

  int currentProductCount;

  int aiDescriptionsLimit;

  int aiDescriptionsUsed;

  DateTime? monthlyResetDate;

  int totalProducts;

  int activeProducts;

  int totalOrders;

  double totalRevenue;

  double averageRating;

  int totalReviews;

  double platformTransactionFee;

  double totalPlatformFees;

  double pendingPayouts;

  double totalPayouts;

  String? supportEmail;

  String? supportPhone;

  int? responseTime;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [VendorProfile]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  VendorProfile copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? userId,
    _i3.User? user,
    String? businessName,
    String? businessDescription,
    String? businessCategory,
    String? businessLogoUrl,
    String? businessBannerUrl,
    String? businessRegistrationNumber,
    String? taxId,
    bool? isVerified,
    DateTime? verifiedAt,
    _i2.SubscriptionTier? subscriptionTier,
    DateTime? subscriptionStartDate,
    DateTime? subscriptionEndDate,
    bool? autoRenew,
    int? productLimit,
    int? currentProductCount,
    int? aiDescriptionsLimit,
    int? aiDescriptionsUsed,
    DateTime? monthlyResetDate,
    int? totalProducts,
    int? activeProducts,
    int? totalOrders,
    double? totalRevenue,
    double? averageRating,
    int? totalReviews,
    double? platformTransactionFee,
    double? totalPlatformFees,
    double? pendingPayouts,
    double? totalPayouts,
    String? supportEmail,
    String? supportPhone,
    int? responseTime,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'VendorProfile',
      'id': id.toJson(),
      'userId': userId.toJson(),
      if (user != null) 'user': user?.toJson(),
      'businessName': businessName,
      if (businessDescription != null)
        'businessDescription': businessDescription,
      'businessCategory': businessCategory,
      if (businessLogoUrl != null) 'businessLogoUrl': businessLogoUrl,
      if (businessBannerUrl != null) 'businessBannerUrl': businessBannerUrl,
      if (businessRegistrationNumber != null)
        'businessRegistrationNumber': businessRegistrationNumber,
      if (taxId != null) 'taxId': taxId,
      'isVerified': isVerified,
      if (verifiedAt != null) 'verifiedAt': verifiedAt?.toJson(),
      'subscriptionTier': subscriptionTier.toJson(),
      if (subscriptionStartDate != null)
        'subscriptionStartDate': subscriptionStartDate?.toJson(),
      if (subscriptionEndDate != null)
        'subscriptionEndDate': subscriptionEndDate?.toJson(),
      'autoRenew': autoRenew,
      'productLimit': productLimit,
      'currentProductCount': currentProductCount,
      'aiDescriptionsLimit': aiDescriptionsLimit,
      'aiDescriptionsUsed': aiDescriptionsUsed,
      if (monthlyResetDate != null)
        'monthlyResetDate': monthlyResetDate?.toJson(),
      'totalProducts': totalProducts,
      'activeProducts': activeProducts,
      'totalOrders': totalOrders,
      'totalRevenue': totalRevenue,
      'averageRating': averageRating,
      'totalReviews': totalReviews,
      'platformTransactionFee': platformTransactionFee,
      'totalPlatformFees': totalPlatformFees,
      'pendingPayouts': pendingPayouts,
      'totalPayouts': totalPayouts,
      if (supportEmail != null) 'supportEmail': supportEmail,
      if (supportPhone != null) 'supportPhone': supportPhone,
      if (responseTime != null) 'responseTime': responseTime,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _VendorProfileImpl extends VendorProfile {
  _VendorProfileImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue userId,
    _i3.User? user,
    required String businessName,
    String? businessDescription,
    required String businessCategory,
    String? businessLogoUrl,
    String? businessBannerUrl,
    String? businessRegistrationNumber,
    String? taxId,
    bool? isVerified,
    DateTime? verifiedAt,
    _i2.SubscriptionTier? subscriptionTier,
    DateTime? subscriptionStartDate,
    DateTime? subscriptionEndDate,
    bool? autoRenew,
    int? productLimit,
    int? currentProductCount,
    int? aiDescriptionsLimit,
    int? aiDescriptionsUsed,
    DateTime? monthlyResetDate,
    int? totalProducts,
    int? activeProducts,
    int? totalOrders,
    double? totalRevenue,
    double? averageRating,
    int? totalReviews,
    double? platformTransactionFee,
    double? totalPlatformFees,
    double? pendingPayouts,
    double? totalPayouts,
    String? supportEmail,
    String? supportPhone,
    int? responseTime,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         userId: userId,
         user: user,
         businessName: businessName,
         businessDescription: businessDescription,
         businessCategory: businessCategory,
         businessLogoUrl: businessLogoUrl,
         businessBannerUrl: businessBannerUrl,
         businessRegistrationNumber: businessRegistrationNumber,
         taxId: taxId,
         isVerified: isVerified,
         verifiedAt: verifiedAt,
         subscriptionTier: subscriptionTier,
         subscriptionStartDate: subscriptionStartDate,
         subscriptionEndDate: subscriptionEndDate,
         autoRenew: autoRenew,
         productLimit: productLimit,
         currentProductCount: currentProductCount,
         aiDescriptionsLimit: aiDescriptionsLimit,
         aiDescriptionsUsed: aiDescriptionsUsed,
         monthlyResetDate: monthlyResetDate,
         totalProducts: totalProducts,
         activeProducts: activeProducts,
         totalOrders: totalOrders,
         totalRevenue: totalRevenue,
         averageRating: averageRating,
         totalReviews: totalReviews,
         platformTransactionFee: platformTransactionFee,
         totalPlatformFees: totalPlatformFees,
         pendingPayouts: pendingPayouts,
         totalPayouts: totalPayouts,
         supportEmail: supportEmail,
         supportPhone: supportPhone,
         responseTime: responseTime,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [VendorProfile]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  VendorProfile copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? userId,
    Object? user = _Undefined,
    String? businessName,
    Object? businessDescription = _Undefined,
    String? businessCategory,
    Object? businessLogoUrl = _Undefined,
    Object? businessBannerUrl = _Undefined,
    Object? businessRegistrationNumber = _Undefined,
    Object? taxId = _Undefined,
    bool? isVerified,
    Object? verifiedAt = _Undefined,
    _i2.SubscriptionTier? subscriptionTier,
    Object? subscriptionStartDate = _Undefined,
    Object? subscriptionEndDate = _Undefined,
    bool? autoRenew,
    int? productLimit,
    int? currentProductCount,
    int? aiDescriptionsLimit,
    int? aiDescriptionsUsed,
    Object? monthlyResetDate = _Undefined,
    int? totalProducts,
    int? activeProducts,
    int? totalOrders,
    double? totalRevenue,
    double? averageRating,
    int? totalReviews,
    double? platformTransactionFee,
    double? totalPlatformFees,
    double? pendingPayouts,
    double? totalPayouts,
    Object? supportEmail = _Undefined,
    Object? supportPhone = _Undefined,
    Object? responseTime = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return VendorProfile(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      user: user is _i3.User? ? user : this.user?.copyWith(),
      businessName: businessName ?? this.businessName,
      businessDescription: businessDescription is String?
          ? businessDescription
          : this.businessDescription,
      businessCategory: businessCategory ?? this.businessCategory,
      businessLogoUrl: businessLogoUrl is String?
          ? businessLogoUrl
          : this.businessLogoUrl,
      businessBannerUrl: businessBannerUrl is String?
          ? businessBannerUrl
          : this.businessBannerUrl,
      businessRegistrationNumber: businessRegistrationNumber is String?
          ? businessRegistrationNumber
          : this.businessRegistrationNumber,
      taxId: taxId is String? ? taxId : this.taxId,
      isVerified: isVerified ?? this.isVerified,
      verifiedAt: verifiedAt is DateTime? ? verifiedAt : this.verifiedAt,
      subscriptionTier: subscriptionTier ?? this.subscriptionTier,
      subscriptionStartDate: subscriptionStartDate is DateTime?
          ? subscriptionStartDate
          : this.subscriptionStartDate,
      subscriptionEndDate: subscriptionEndDate is DateTime?
          ? subscriptionEndDate
          : this.subscriptionEndDate,
      autoRenew: autoRenew ?? this.autoRenew,
      productLimit: productLimit ?? this.productLimit,
      currentProductCount: currentProductCount ?? this.currentProductCount,
      aiDescriptionsLimit: aiDescriptionsLimit ?? this.aiDescriptionsLimit,
      aiDescriptionsUsed: aiDescriptionsUsed ?? this.aiDescriptionsUsed,
      monthlyResetDate: monthlyResetDate is DateTime?
          ? monthlyResetDate
          : this.monthlyResetDate,
      totalProducts: totalProducts ?? this.totalProducts,
      activeProducts: activeProducts ?? this.activeProducts,
      totalOrders: totalOrders ?? this.totalOrders,
      totalRevenue: totalRevenue ?? this.totalRevenue,
      averageRating: averageRating ?? this.averageRating,
      totalReviews: totalReviews ?? this.totalReviews,
      platformTransactionFee:
          platformTransactionFee ?? this.platformTransactionFee,
      totalPlatformFees: totalPlatformFees ?? this.totalPlatformFees,
      pendingPayouts: pendingPayouts ?? this.pendingPayouts,
      totalPayouts: totalPayouts ?? this.totalPayouts,
      supportEmail: supportEmail is String? ? supportEmail : this.supportEmail,
      supportPhone: supportPhone is String? ? supportPhone : this.supportPhone,
      responseTime: responseTime is int? ? responseTime : this.responseTime,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
