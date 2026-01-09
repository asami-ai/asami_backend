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
import '../subscription/limit_type.dart' as _i3;

abstract class ToolUsageLimit implements _i1.SerializableModel {
  ToolUsageLimit._({
    _i1.UuidValue? id,
    required this.tier,
    required this.limitType,
    required this.dailyLimit,
    this.monthlyLimit,
    bool? allowGracePeriod,
    int? gracePeriodActions,
    this.restrictedTools,
    this.allowedToolsAfterLimit,
    double? costPerUsage,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : id = id ?? _i1.Uuid().v4obj(),
       allowGracePeriod = allowGracePeriod ?? true,
       gracePeriodActions = gracePeriodActions ?? 5,
       costPerUsage = costPerUsage ?? 0.0,
       isActive = isActive ?? true,
       createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory ToolUsageLimit({
    _i1.UuidValue? id,
    required _i2.SubscriptionTier tier,
    required _i3.LimitType limitType,
    required int dailyLimit,
    int? monthlyLimit,
    bool? allowGracePeriod,
    int? gracePeriodActions,
    String? restrictedTools,
    String? allowedToolsAfterLimit,
    double? costPerUsage,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _ToolUsageLimitImpl;

  factory ToolUsageLimit.fromJson(Map<String, dynamic> jsonSerialization) {
    return ToolUsageLimit(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      tier: _i2.SubscriptionTier.fromJson(
        (jsonSerialization['tier'] as String),
      ),
      limitType: _i3.LimitType.fromJson(
        (jsonSerialization['limitType'] as String),
      ),
      dailyLimit: jsonSerialization['dailyLimit'] as int,
      monthlyLimit: jsonSerialization['monthlyLimit'] as int?,
      allowGracePeriod: jsonSerialization['allowGracePeriod'] as bool?,
      gracePeriodActions: jsonSerialization['gracePeriodActions'] as int?,
      restrictedTools: jsonSerialization['restrictedTools'] as String?,
      allowedToolsAfterLimit:
          jsonSerialization['allowedToolsAfterLimit'] as String?,
      costPerUsage: (jsonSerialization['costPerUsage'] as num?)?.toDouble(),
      isActive: jsonSerialization['isActive'] as bool?,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  /// The id of the object.
  _i1.UuidValue id;

  _i2.SubscriptionTier tier;

  _i3.LimitType limitType;

  int dailyLimit;

  int? monthlyLimit;

  bool allowGracePeriod;

  int gracePeriodActions;

  String? restrictedTools;

  String? allowedToolsAfterLimit;

  double costPerUsage;

  bool isActive;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [ToolUsageLimit]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ToolUsageLimit copyWith({
    _i1.UuidValue? id,
    _i2.SubscriptionTier? tier,
    _i3.LimitType? limitType,
    int? dailyLimit,
    int? monthlyLimit,
    bool? allowGracePeriod,
    int? gracePeriodActions,
    String? restrictedTools,
    String? allowedToolsAfterLimit,
    double? costPerUsage,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ToolUsageLimit',
      'id': id.toJson(),
      'tier': tier.toJson(),
      'limitType': limitType.toJson(),
      'dailyLimit': dailyLimit,
      if (monthlyLimit != null) 'monthlyLimit': monthlyLimit,
      'allowGracePeriod': allowGracePeriod,
      'gracePeriodActions': gracePeriodActions,
      if (restrictedTools != null) 'restrictedTools': restrictedTools,
      if (allowedToolsAfterLimit != null)
        'allowedToolsAfterLimit': allowedToolsAfterLimit,
      'costPerUsage': costPerUsage,
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

class _Undefined {}

class _ToolUsageLimitImpl extends ToolUsageLimit {
  _ToolUsageLimitImpl({
    _i1.UuidValue? id,
    required _i2.SubscriptionTier tier,
    required _i3.LimitType limitType,
    required int dailyLimit,
    int? monthlyLimit,
    bool? allowGracePeriod,
    int? gracePeriodActions,
    String? restrictedTools,
    String? allowedToolsAfterLimit,
    double? costPerUsage,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         tier: tier,
         limitType: limitType,
         dailyLimit: dailyLimit,
         monthlyLimit: monthlyLimit,
         allowGracePeriod: allowGracePeriod,
         gracePeriodActions: gracePeriodActions,
         restrictedTools: restrictedTools,
         allowedToolsAfterLimit: allowedToolsAfterLimit,
         costPerUsage: costPerUsage,
         isActive: isActive,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [ToolUsageLimit]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ToolUsageLimit copyWith({
    _i1.UuidValue? id,
    _i2.SubscriptionTier? tier,
    _i3.LimitType? limitType,
    int? dailyLimit,
    Object? monthlyLimit = _Undefined,
    bool? allowGracePeriod,
    int? gracePeriodActions,
    Object? restrictedTools = _Undefined,
    Object? allowedToolsAfterLimit = _Undefined,
    double? costPerUsage,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ToolUsageLimit(
      id: id ?? this.id,
      tier: tier ?? this.tier,
      limitType: limitType ?? this.limitType,
      dailyLimit: dailyLimit ?? this.dailyLimit,
      monthlyLimit: monthlyLimit is int? ? monthlyLimit : this.monthlyLimit,
      allowGracePeriod: allowGracePeriod ?? this.allowGracePeriod,
      gracePeriodActions: gracePeriodActions ?? this.gracePeriodActions,
      restrictedTools: restrictedTools is String?
          ? restrictedTools
          : this.restrictedTools,
      allowedToolsAfterLimit: allowedToolsAfterLimit is String?
          ? allowedToolsAfterLimit
          : this.allowedToolsAfterLimit,
      costPerUsage: costPerUsage ?? this.costPerUsage,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
