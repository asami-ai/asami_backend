/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: unnecessary_null_comparison

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../user/subscription_tier.dart' as _i2;
import '../user/user.dart' as _i3;
import 'package:asami_server/src/generated/protocol.dart' as _i4;

abstract class VendorProfile
    implements _i1.TableRow<_i1.UuidValue>, _i1.ProtocolSerialization {
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

  static final t = VendorProfileTable();

  static const db = VendorProfileRepository._();

  @override
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

  @override
  _i1.Table<_i1.UuidValue> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'VendorProfile',
      'id': id.toJson(),
      'userId': userId.toJson(),
      if (user != null) 'user': user?.toJsonForProtocol(),
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

  static VendorProfileInclude include({_i3.UserInclude? user}) {
    return VendorProfileInclude._(user: user);
  }

  static VendorProfileIncludeList includeList({
    _i1.WhereExpressionBuilder<VendorProfileTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<VendorProfileTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<VendorProfileTable>? orderByList,
    VendorProfileInclude? include,
  }) {
    return VendorProfileIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(VendorProfile.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(VendorProfile.t),
      include: include,
    );
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

class VendorProfileUpdateTable extends _i1.UpdateTable<VendorProfileTable> {
  VendorProfileUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> userId(_i1.UuidValue value) =>
      _i1.ColumnValue(
        table.userId,
        value,
      );

  _i1.ColumnValue<String, String> businessName(String value) => _i1.ColumnValue(
    table.businessName,
    value,
  );

  _i1.ColumnValue<String, String> businessDescription(String? value) =>
      _i1.ColumnValue(
        table.businessDescription,
        value,
      );

  _i1.ColumnValue<String, String> businessCategory(String value) =>
      _i1.ColumnValue(
        table.businessCategory,
        value,
      );

  _i1.ColumnValue<String, String> businessLogoUrl(String? value) =>
      _i1.ColumnValue(
        table.businessLogoUrl,
        value,
      );

  _i1.ColumnValue<String, String> businessBannerUrl(String? value) =>
      _i1.ColumnValue(
        table.businessBannerUrl,
        value,
      );

  _i1.ColumnValue<String, String> businessRegistrationNumber(String? value) =>
      _i1.ColumnValue(
        table.businessRegistrationNumber,
        value,
      );

  _i1.ColumnValue<String, String> taxId(String? value) => _i1.ColumnValue(
    table.taxId,
    value,
  );

  _i1.ColumnValue<bool, bool> isVerified(bool value) => _i1.ColumnValue(
    table.isVerified,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> verifiedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.verifiedAt,
        value,
      );

  _i1.ColumnValue<_i2.SubscriptionTier, _i2.SubscriptionTier> subscriptionTier(
    _i2.SubscriptionTier value,
  ) => _i1.ColumnValue(
    table.subscriptionTier,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> subscriptionStartDate(DateTime? value) =>
      _i1.ColumnValue(
        table.subscriptionStartDate,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> subscriptionEndDate(DateTime? value) =>
      _i1.ColumnValue(
        table.subscriptionEndDate,
        value,
      );

  _i1.ColumnValue<bool, bool> autoRenew(bool value) => _i1.ColumnValue(
    table.autoRenew,
    value,
  );

  _i1.ColumnValue<int, int> productLimit(int value) => _i1.ColumnValue(
    table.productLimit,
    value,
  );

  _i1.ColumnValue<int, int> currentProductCount(int value) => _i1.ColumnValue(
    table.currentProductCount,
    value,
  );

  _i1.ColumnValue<int, int> aiDescriptionsLimit(int value) => _i1.ColumnValue(
    table.aiDescriptionsLimit,
    value,
  );

  _i1.ColumnValue<int, int> aiDescriptionsUsed(int value) => _i1.ColumnValue(
    table.aiDescriptionsUsed,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> monthlyResetDate(DateTime? value) =>
      _i1.ColumnValue(
        table.monthlyResetDate,
        value,
      );

  _i1.ColumnValue<int, int> totalProducts(int value) => _i1.ColumnValue(
    table.totalProducts,
    value,
  );

  _i1.ColumnValue<int, int> activeProducts(int value) => _i1.ColumnValue(
    table.activeProducts,
    value,
  );

  _i1.ColumnValue<int, int> totalOrders(int value) => _i1.ColumnValue(
    table.totalOrders,
    value,
  );

  _i1.ColumnValue<double, double> totalRevenue(double value) => _i1.ColumnValue(
    table.totalRevenue,
    value,
  );

  _i1.ColumnValue<double, double> averageRating(double value) =>
      _i1.ColumnValue(
        table.averageRating,
        value,
      );

  _i1.ColumnValue<int, int> totalReviews(int value) => _i1.ColumnValue(
    table.totalReviews,
    value,
  );

  _i1.ColumnValue<double, double> platformTransactionFee(double value) =>
      _i1.ColumnValue(
        table.platformTransactionFee,
        value,
      );

  _i1.ColumnValue<double, double> totalPlatformFees(double value) =>
      _i1.ColumnValue(
        table.totalPlatformFees,
        value,
      );

  _i1.ColumnValue<double, double> pendingPayouts(double value) =>
      _i1.ColumnValue(
        table.pendingPayouts,
        value,
      );

  _i1.ColumnValue<double, double> totalPayouts(double value) => _i1.ColumnValue(
    table.totalPayouts,
    value,
  );

  _i1.ColumnValue<String, String> supportEmail(String? value) =>
      _i1.ColumnValue(
        table.supportEmail,
        value,
      );

  _i1.ColumnValue<String, String> supportPhone(String? value) =>
      _i1.ColumnValue(
        table.supportPhone,
        value,
      );

  _i1.ColumnValue<int, int> responseTime(int? value) => _i1.ColumnValue(
    table.responseTime,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> updatedAt(DateTime value) =>
      _i1.ColumnValue(
        table.updatedAt,
        value,
      );
}

class VendorProfileTable extends _i1.Table<_i1.UuidValue> {
  VendorProfileTable({super.tableRelation})
    : super(tableName: 'vendor_profiles') {
    updateTable = VendorProfileUpdateTable(this);
    userId = _i1.ColumnUuid(
      'userId',
      this,
    );
    businessName = _i1.ColumnString(
      'businessName',
      this,
    );
    businessDescription = _i1.ColumnString(
      'businessDescription',
      this,
    );
    businessCategory = _i1.ColumnString(
      'businessCategory',
      this,
    );
    businessLogoUrl = _i1.ColumnString(
      'businessLogoUrl',
      this,
    );
    businessBannerUrl = _i1.ColumnString(
      'businessBannerUrl',
      this,
    );
    businessRegistrationNumber = _i1.ColumnString(
      'businessRegistrationNumber',
      this,
    );
    taxId = _i1.ColumnString(
      'taxId',
      this,
    );
    isVerified = _i1.ColumnBool(
      'isVerified',
      this,
      hasDefault: true,
    );
    verifiedAt = _i1.ColumnDateTime(
      'verifiedAt',
      this,
    );
    subscriptionTier = _i1.ColumnEnum(
      'subscriptionTier',
      this,
      _i1.EnumSerialization.byName,
      hasDefault: true,
    );
    subscriptionStartDate = _i1.ColumnDateTime(
      'subscriptionStartDate',
      this,
    );
    subscriptionEndDate = _i1.ColumnDateTime(
      'subscriptionEndDate',
      this,
    );
    autoRenew = _i1.ColumnBool(
      'autoRenew',
      this,
      hasDefault: true,
    );
    productLimit = _i1.ColumnInt(
      'productLimit',
      this,
      hasDefault: true,
    );
    currentProductCount = _i1.ColumnInt(
      'currentProductCount',
      this,
      hasDefault: true,
    );
    aiDescriptionsLimit = _i1.ColumnInt(
      'aiDescriptionsLimit',
      this,
      hasDefault: true,
    );
    aiDescriptionsUsed = _i1.ColumnInt(
      'aiDescriptionsUsed',
      this,
      hasDefault: true,
    );
    monthlyResetDate = _i1.ColumnDateTime(
      'monthlyResetDate',
      this,
    );
    totalProducts = _i1.ColumnInt(
      'totalProducts',
      this,
      hasDefault: true,
    );
    activeProducts = _i1.ColumnInt(
      'activeProducts',
      this,
      hasDefault: true,
    );
    totalOrders = _i1.ColumnInt(
      'totalOrders',
      this,
      hasDefault: true,
    );
    totalRevenue = _i1.ColumnDouble(
      'totalRevenue',
      this,
      hasDefault: true,
    );
    averageRating = _i1.ColumnDouble(
      'averageRating',
      this,
      hasDefault: true,
    );
    totalReviews = _i1.ColumnInt(
      'totalReviews',
      this,
      hasDefault: true,
    );
    platformTransactionFee = _i1.ColumnDouble(
      'platformTransactionFee',
      this,
      hasDefault: true,
    );
    totalPlatformFees = _i1.ColumnDouble(
      'totalPlatformFees',
      this,
      hasDefault: true,
    );
    pendingPayouts = _i1.ColumnDouble(
      'pendingPayouts',
      this,
      hasDefault: true,
    );
    totalPayouts = _i1.ColumnDouble(
      'totalPayouts',
      this,
      hasDefault: true,
    );
    supportEmail = _i1.ColumnString(
      'supportEmail',
      this,
    );
    supportPhone = _i1.ColumnString(
      'supportPhone',
      this,
    );
    responseTime = _i1.ColumnInt(
      'responseTime',
      this,
      hasDefault: true,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
    updatedAt = _i1.ColumnDateTime(
      'updatedAt',
      this,
      hasDefault: true,
    );
  }

  late final VendorProfileUpdateTable updateTable;

  late final _i1.ColumnUuid userId;

  _i3.UserTable? _user;

  late final _i1.ColumnString businessName;

  late final _i1.ColumnString businessDescription;

  late final _i1.ColumnString businessCategory;

  late final _i1.ColumnString businessLogoUrl;

  late final _i1.ColumnString businessBannerUrl;

  late final _i1.ColumnString businessRegistrationNumber;

  late final _i1.ColumnString taxId;

  late final _i1.ColumnBool isVerified;

  late final _i1.ColumnDateTime verifiedAt;

  late final _i1.ColumnEnum<_i2.SubscriptionTier> subscriptionTier;

  late final _i1.ColumnDateTime subscriptionStartDate;

  late final _i1.ColumnDateTime subscriptionEndDate;

  late final _i1.ColumnBool autoRenew;

  late final _i1.ColumnInt productLimit;

  late final _i1.ColumnInt currentProductCount;

  late final _i1.ColumnInt aiDescriptionsLimit;

  late final _i1.ColumnInt aiDescriptionsUsed;

  late final _i1.ColumnDateTime monthlyResetDate;

  late final _i1.ColumnInt totalProducts;

  late final _i1.ColumnInt activeProducts;

  late final _i1.ColumnInt totalOrders;

  late final _i1.ColumnDouble totalRevenue;

  late final _i1.ColumnDouble averageRating;

  late final _i1.ColumnInt totalReviews;

  late final _i1.ColumnDouble platformTransactionFee;

  late final _i1.ColumnDouble totalPlatformFees;

  late final _i1.ColumnDouble pendingPayouts;

  late final _i1.ColumnDouble totalPayouts;

  late final _i1.ColumnString supportEmail;

  late final _i1.ColumnString supportPhone;

  late final _i1.ColumnInt responseTime;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  _i3.UserTable get user {
    if (_user != null) return _user!;
    _user = _i1.createRelationTable(
      relationFieldName: 'user',
      field: VendorProfile.t.userId,
      foreignField: _i3.User.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.UserTable(tableRelation: foreignTableRelation),
    );
    return _user!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    userId,
    businessName,
    businessDescription,
    businessCategory,
    businessLogoUrl,
    businessBannerUrl,
    businessRegistrationNumber,
    taxId,
    isVerified,
    verifiedAt,
    subscriptionTier,
    subscriptionStartDate,
    subscriptionEndDate,
    autoRenew,
    productLimit,
    currentProductCount,
    aiDescriptionsLimit,
    aiDescriptionsUsed,
    monthlyResetDate,
    totalProducts,
    activeProducts,
    totalOrders,
    totalRevenue,
    averageRating,
    totalReviews,
    platformTransactionFee,
    totalPlatformFees,
    pendingPayouts,
    totalPayouts,
    supportEmail,
    supportPhone,
    responseTime,
    createdAt,
    updatedAt,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'user') {
      return user;
    }
    return null;
  }
}

class VendorProfileInclude extends _i1.IncludeObject {
  VendorProfileInclude._({_i3.UserInclude? user}) {
    _user = user;
  }

  _i3.UserInclude? _user;

  @override
  Map<String, _i1.Include?> get includes => {'user': _user};

  @override
  _i1.Table<_i1.UuidValue> get table => VendorProfile.t;
}

class VendorProfileIncludeList extends _i1.IncludeList {
  VendorProfileIncludeList._({
    _i1.WhereExpressionBuilder<VendorProfileTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(VendorProfile.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue> get table => VendorProfile.t;
}

class VendorProfileRepository {
  const VendorProfileRepository._();

  final attachRow = const VendorProfileAttachRowRepository._();

  /// Returns a list of [VendorProfile]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<VendorProfile>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<VendorProfileTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<VendorProfileTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<VendorProfileTable>? orderByList,
    _i1.Transaction? transaction,
    VendorProfileInclude? include,
  }) async {
    return session.db.find<VendorProfile>(
      where: where?.call(VendorProfile.t),
      orderBy: orderBy?.call(VendorProfile.t),
      orderByList: orderByList?.call(VendorProfile.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [VendorProfile] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<VendorProfile?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<VendorProfileTable>? where,
    int? offset,
    _i1.OrderByBuilder<VendorProfileTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<VendorProfileTable>? orderByList,
    _i1.Transaction? transaction,
    VendorProfileInclude? include,
  }) async {
    return session.db.findFirstRow<VendorProfile>(
      where: where?.call(VendorProfile.t),
      orderBy: orderBy?.call(VendorProfile.t),
      orderByList: orderByList?.call(VendorProfile.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [VendorProfile] by its [id] or null if no such row exists.
  Future<VendorProfile?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
    VendorProfileInclude? include,
  }) async {
    return session.db.findById<VendorProfile>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [VendorProfile]s in the list and returns the inserted rows.
  ///
  /// The returned [VendorProfile]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<VendorProfile>> insert(
    _i1.Session session,
    List<VendorProfile> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<VendorProfile>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [VendorProfile] and returns the inserted row.
  ///
  /// The returned [VendorProfile] will have its `id` field set.
  Future<VendorProfile> insertRow(
    _i1.Session session,
    VendorProfile row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<VendorProfile>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [VendorProfile]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<VendorProfile>> update(
    _i1.Session session,
    List<VendorProfile> rows, {
    _i1.ColumnSelections<VendorProfileTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<VendorProfile>(
      rows,
      columns: columns?.call(VendorProfile.t),
      transaction: transaction,
    );
  }

  /// Updates a single [VendorProfile]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<VendorProfile> updateRow(
    _i1.Session session,
    VendorProfile row, {
    _i1.ColumnSelections<VendorProfileTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<VendorProfile>(
      row,
      columns: columns?.call(VendorProfile.t),
      transaction: transaction,
    );
  }

  /// Updates a single [VendorProfile] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<VendorProfile?> updateById(
    _i1.Session session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<VendorProfileUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<VendorProfile>(
      id,
      columnValues: columnValues(VendorProfile.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [VendorProfile]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<VendorProfile>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<VendorProfileUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<VendorProfileTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<VendorProfileTable>? orderBy,
    _i1.OrderByListBuilder<VendorProfileTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<VendorProfile>(
      columnValues: columnValues(VendorProfile.t.updateTable),
      where: where(VendorProfile.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(VendorProfile.t),
      orderByList: orderByList?.call(VendorProfile.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [VendorProfile]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<VendorProfile>> delete(
    _i1.Session session,
    List<VendorProfile> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<VendorProfile>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [VendorProfile].
  Future<VendorProfile> deleteRow(
    _i1.Session session,
    VendorProfile row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<VendorProfile>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<VendorProfile>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<VendorProfileTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<VendorProfile>(
      where: where(VendorProfile.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<VendorProfileTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<VendorProfile>(
      where: where?.call(VendorProfile.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class VendorProfileAttachRowRepository {
  const VendorProfileAttachRowRepository._();

  /// Creates a relation between the given [VendorProfile] and [User]
  /// by setting the [VendorProfile]'s foreign key `userId` to refer to the [User].
  Future<void> user(
    _i1.Session session,
    VendorProfile vendorProfile,
    _i3.User user, {
    _i1.Transaction? transaction,
  }) async {
    if (vendorProfile.id == null) {
      throw ArgumentError.notNull('vendorProfile.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $vendorProfile = vendorProfile.copyWith(userId: user.id);
    await session.db.updateRow<VendorProfile>(
      $vendorProfile,
      columns: [VendorProfile.t.userId],
      transaction: transaction,
    );
  }
}
