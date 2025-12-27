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

abstract class TierFeature implements _i1.SerializableModel {
  TierFeature._({
    _i1.UuidValue? id,
    required this.tier,
    required this.dailyToolCallLimit,
    required this.monthlyToolCallLimit,
    required this.dailyAIMessageLimit,
    required this.monthlyAIMessageLimit,
    required this.productLimit,
    required this.aiDescriptionLimit,
    bool? allowBulkOperations,
    bool? allowAdvancedAnalytics,
    bool? allowAPIAccess,
    bool? allowWhiteLabel,
    String? supportPriority,
    int? supportResponseTime,
    required this.monthlyPrice,
    required this.yearlyPrice,
    required this.platformTransactionFee,
    double? overageToolCallPrice,
    double? overageAIMessagePrice,
    double? overageProductPrice,
    double? overageAIDescriptionPrice,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : id = id ?? _i1.Uuid().v4obj(),
       allowBulkOperations = allowBulkOperations ?? false,
       allowAdvancedAnalytics = allowAdvancedAnalytics ?? false,
       allowAPIAccess = allowAPIAccess ?? false,
       allowWhiteLabel = allowWhiteLabel ?? false,
       supportPriority = supportPriority ?? 'standard',
       supportResponseTime = supportResponseTime ?? 24,
       overageToolCallPrice = overageToolCallPrice ?? 0.01,
       overageAIMessagePrice = overageAIMessagePrice ?? 0.001,
       overageProductPrice = overageProductPrice ?? 1.0,
       overageAIDescriptionPrice = overageAIDescriptionPrice ?? 0.1,
       isActive = isActive ?? true,
       createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory TierFeature({
    _i1.UuidValue? id,
    required _i2.SubscriptionTier tier,
    required int dailyToolCallLimit,
    required int monthlyToolCallLimit,
    required int dailyAIMessageLimit,
    required int monthlyAIMessageLimit,
    required int productLimit,
    required int aiDescriptionLimit,
    bool? allowBulkOperations,
    bool? allowAdvancedAnalytics,
    bool? allowAPIAccess,
    bool? allowWhiteLabel,
    String? supportPriority,
    int? supportResponseTime,
    required double monthlyPrice,
    required double yearlyPrice,
    required double platformTransactionFee,
    double? overageToolCallPrice,
    double? overageAIMessagePrice,
    double? overageProductPrice,
    double? overageAIDescriptionPrice,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _TierFeatureImpl;

  factory TierFeature.fromJson(Map<String, dynamic> jsonSerialization) {
    return TierFeature(
      id: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      tier: _i2.SubscriptionTier.fromJson(
        (jsonSerialization['tier'] as String),
      ),
      dailyToolCallLimit: jsonSerialization['dailyToolCallLimit'] as int,
      monthlyToolCallLimit: jsonSerialization['monthlyToolCallLimit'] as int,
      dailyAIMessageLimit: jsonSerialization['dailyAIMessageLimit'] as int,
      monthlyAIMessageLimit: jsonSerialization['monthlyAIMessageLimit'] as int,
      productLimit: jsonSerialization['productLimit'] as int,
      aiDescriptionLimit: jsonSerialization['aiDescriptionLimit'] as int,
      allowBulkOperations: jsonSerialization['allowBulkOperations'] as bool,
      allowAdvancedAnalytics:
          jsonSerialization['allowAdvancedAnalytics'] as bool,
      allowAPIAccess: jsonSerialization['allowAPIAccess'] as bool,
      allowWhiteLabel: jsonSerialization['allowWhiteLabel'] as bool,
      supportPriority: jsonSerialization['supportPriority'] as String,
      supportResponseTime: jsonSerialization['supportResponseTime'] as int,
      monthlyPrice: (jsonSerialization['monthlyPrice'] as num).toDouble(),
      yearlyPrice: (jsonSerialization['yearlyPrice'] as num).toDouble(),
      platformTransactionFee:
          (jsonSerialization['platformTransactionFee'] as num).toDouble(),
      overageToolCallPrice: (jsonSerialization['overageToolCallPrice'] as num)
          .toDouble(),
      overageAIMessagePrice: (jsonSerialization['overageAIMessagePrice'] as num)
          .toDouble(),
      overageProductPrice: (jsonSerialization['overageProductPrice'] as num)
          .toDouble(),
      overageAIDescriptionPrice:
          (jsonSerialization['overageAIDescriptionPrice'] as num).toDouble(),
      isActive: jsonSerialization['isActive'] as bool,
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

  _i2.SubscriptionTier tier;

  int dailyToolCallLimit;

  int monthlyToolCallLimit;

  int dailyAIMessageLimit;

  int monthlyAIMessageLimit;

  int productLimit;

  int aiDescriptionLimit;

  bool allowBulkOperations;

  bool allowAdvancedAnalytics;

  bool allowAPIAccess;

  bool allowWhiteLabel;

  String supportPriority;

  int supportResponseTime;

  double monthlyPrice;

  double yearlyPrice;

  double platformTransactionFee;

  double overageToolCallPrice;

  double overageAIMessagePrice;

  double overageProductPrice;

  double overageAIDescriptionPrice;

  bool isActive;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [TierFeature]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  TierFeature copyWith({
    _i1.UuidValue? id,
    _i2.SubscriptionTier? tier,
    int? dailyToolCallLimit,
    int? monthlyToolCallLimit,
    int? dailyAIMessageLimit,
    int? monthlyAIMessageLimit,
    int? productLimit,
    int? aiDescriptionLimit,
    bool? allowBulkOperations,
    bool? allowAdvancedAnalytics,
    bool? allowAPIAccess,
    bool? allowWhiteLabel,
    String? supportPriority,
    int? supportResponseTime,
    double? monthlyPrice,
    double? yearlyPrice,
    double? platformTransactionFee,
    double? overageToolCallPrice,
    double? overageAIMessagePrice,
    double? overageProductPrice,
    double? overageAIDescriptionPrice,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'TierFeature',
      'id': id.toJson(),
      'tier': tier.toJson(),
      'dailyToolCallLimit': dailyToolCallLimit,
      'monthlyToolCallLimit': monthlyToolCallLimit,
      'dailyAIMessageLimit': dailyAIMessageLimit,
      'monthlyAIMessageLimit': monthlyAIMessageLimit,
      'productLimit': productLimit,
      'aiDescriptionLimit': aiDescriptionLimit,
      'allowBulkOperations': allowBulkOperations,
      'allowAdvancedAnalytics': allowAdvancedAnalytics,
      'allowAPIAccess': allowAPIAccess,
      'allowWhiteLabel': allowWhiteLabel,
      'supportPriority': supportPriority,
      'supportResponseTime': supportResponseTime,
      'monthlyPrice': monthlyPrice,
      'yearlyPrice': yearlyPrice,
      'platformTransactionFee': platformTransactionFee,
      'overageToolCallPrice': overageToolCallPrice,
      'overageAIMessagePrice': overageAIMessagePrice,
      'overageProductPrice': overageProductPrice,
      'overageAIDescriptionPrice': overageAIDescriptionPrice,
      'isActive': isActive,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _TierFeatureImpl extends TierFeature {
  _TierFeatureImpl({
    _i1.UuidValue? id,
    required _i2.SubscriptionTier tier,
    required int dailyToolCallLimit,
    required int monthlyToolCallLimit,
    required int dailyAIMessageLimit,
    required int monthlyAIMessageLimit,
    required int productLimit,
    required int aiDescriptionLimit,
    bool? allowBulkOperations,
    bool? allowAdvancedAnalytics,
    bool? allowAPIAccess,
    bool? allowWhiteLabel,
    String? supportPriority,
    int? supportResponseTime,
    required double monthlyPrice,
    required double yearlyPrice,
    required double platformTransactionFee,
    double? overageToolCallPrice,
    double? overageAIMessagePrice,
    double? overageProductPrice,
    double? overageAIDescriptionPrice,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         tier: tier,
         dailyToolCallLimit: dailyToolCallLimit,
         monthlyToolCallLimit: monthlyToolCallLimit,
         dailyAIMessageLimit: dailyAIMessageLimit,
         monthlyAIMessageLimit: monthlyAIMessageLimit,
         productLimit: productLimit,
         aiDescriptionLimit: aiDescriptionLimit,
         allowBulkOperations: allowBulkOperations,
         allowAdvancedAnalytics: allowAdvancedAnalytics,
         allowAPIAccess: allowAPIAccess,
         allowWhiteLabel: allowWhiteLabel,
         supportPriority: supportPriority,
         supportResponseTime: supportResponseTime,
         monthlyPrice: monthlyPrice,
         yearlyPrice: yearlyPrice,
         platformTransactionFee: platformTransactionFee,
         overageToolCallPrice: overageToolCallPrice,
         overageAIMessagePrice: overageAIMessagePrice,
         overageProductPrice: overageProductPrice,
         overageAIDescriptionPrice: overageAIDescriptionPrice,
         isActive: isActive,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [TierFeature]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  TierFeature copyWith({
    _i1.UuidValue? id,
    _i2.SubscriptionTier? tier,
    int? dailyToolCallLimit,
    int? monthlyToolCallLimit,
    int? dailyAIMessageLimit,
    int? monthlyAIMessageLimit,
    int? productLimit,
    int? aiDescriptionLimit,
    bool? allowBulkOperations,
    bool? allowAdvancedAnalytics,
    bool? allowAPIAccess,
    bool? allowWhiteLabel,
    String? supportPriority,
    int? supportResponseTime,
    double? monthlyPrice,
    double? yearlyPrice,
    double? platformTransactionFee,
    double? overageToolCallPrice,
    double? overageAIMessagePrice,
    double? overageProductPrice,
    double? overageAIDescriptionPrice,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return TierFeature(
      id: id ?? this.id,
      tier: tier ?? this.tier,
      dailyToolCallLimit: dailyToolCallLimit ?? this.dailyToolCallLimit,
      monthlyToolCallLimit: monthlyToolCallLimit ?? this.monthlyToolCallLimit,
      dailyAIMessageLimit: dailyAIMessageLimit ?? this.dailyAIMessageLimit,
      monthlyAIMessageLimit:
          monthlyAIMessageLimit ?? this.monthlyAIMessageLimit,
      productLimit: productLimit ?? this.productLimit,
      aiDescriptionLimit: aiDescriptionLimit ?? this.aiDescriptionLimit,
      allowBulkOperations: allowBulkOperations ?? this.allowBulkOperations,
      allowAdvancedAnalytics:
          allowAdvancedAnalytics ?? this.allowAdvancedAnalytics,
      allowAPIAccess: allowAPIAccess ?? this.allowAPIAccess,
      allowWhiteLabel: allowWhiteLabel ?? this.allowWhiteLabel,
      supportPriority: supportPriority ?? this.supportPriority,
      supportResponseTime: supportResponseTime ?? this.supportResponseTime,
      monthlyPrice: monthlyPrice ?? this.monthlyPrice,
      yearlyPrice: yearlyPrice ?? this.yearlyPrice,
      platformTransactionFee:
          platformTransactionFee ?? this.platformTransactionFee,
      overageToolCallPrice: overageToolCallPrice ?? this.overageToolCallPrice,
      overageAIMessagePrice:
          overageAIMessagePrice ?? this.overageAIMessagePrice,
      overageProductPrice: overageProductPrice ?? this.overageProductPrice,
      overageAIDescriptionPrice:
          overageAIDescriptionPrice ?? this.overageAIDescriptionPrice,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
