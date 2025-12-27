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

abstract class CustomerAIPolicy implements _i1.SerializableModel {
  CustomerAIPolicy._({
    _i1.UuidValue? id,
    required this.policyName,
    this.description,
    int? dailyMessageLimit,
    int? dailyToolCallLimit,
    bool? requireExplicitIntent,
    double? minimumConfidenceScore,
    int? throttleAfterCount,
    int? throttleDelaySeconds,
    bool? enableProgressiveRestrictions,
    this.restrictionThresholds,
    double? maxDailyCost,
    double? warnAtCostPercentage,
    bool? isActive,
    bool? isDefault,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : id = id ?? _i1.Uuid().v4obj(),
       dailyMessageLimit = dailyMessageLimit ?? 100,
       dailyToolCallLimit = dailyToolCallLimit ?? 20,
       requireExplicitIntent = requireExplicitIntent ?? true,
       minimumConfidenceScore = minimumConfidenceScore ?? 0.8,
       throttleAfterCount = throttleAfterCount ?? 50,
       throttleDelaySeconds = throttleDelaySeconds ?? 2,
       enableProgressiveRestrictions = enableProgressiveRestrictions ?? true,
       maxDailyCost = maxDailyCost ?? 1.0,
       warnAtCostPercentage = warnAtCostPercentage ?? 0.8,
       isActive = isActive ?? true,
       isDefault = isDefault ?? false,
       createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory CustomerAIPolicy({
    _i1.UuidValue? id,
    required String policyName,
    String? description,
    int? dailyMessageLimit,
    int? dailyToolCallLimit,
    bool? requireExplicitIntent,
    double? minimumConfidenceScore,
    int? throttleAfterCount,
    int? throttleDelaySeconds,
    bool? enableProgressiveRestrictions,
    String? restrictionThresholds,
    double? maxDailyCost,
    double? warnAtCostPercentage,
    bool? isActive,
    bool? isDefault,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _CustomerAIPolicyImpl;

  factory CustomerAIPolicy.fromJson(Map<String, dynamic> jsonSerialization) {
    return CustomerAIPolicy(
      id: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      policyName: jsonSerialization['policyName'] as String,
      description: jsonSerialization['description'] as String?,
      dailyMessageLimit: jsonSerialization['dailyMessageLimit'] as int,
      dailyToolCallLimit: jsonSerialization['dailyToolCallLimit'] as int,
      requireExplicitIntent: jsonSerialization['requireExplicitIntent'] as bool,
      minimumConfidenceScore:
          (jsonSerialization['minimumConfidenceScore'] as num).toDouble(),
      throttleAfterCount: jsonSerialization['throttleAfterCount'] as int,
      throttleDelaySeconds: jsonSerialization['throttleDelaySeconds'] as int,
      enableProgressiveRestrictions:
          jsonSerialization['enableProgressiveRestrictions'] as bool,
      restrictionThresholds:
          jsonSerialization['restrictionThresholds'] as String?,
      maxDailyCost: (jsonSerialization['maxDailyCost'] as num).toDouble(),
      warnAtCostPercentage: (jsonSerialization['warnAtCostPercentage'] as num)
          .toDouble(),
      isActive: jsonSerialization['isActive'] as bool,
      isDefault: jsonSerialization['isDefault'] as bool,
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

  String policyName;

  String? description;

  int dailyMessageLimit;

  int dailyToolCallLimit;

  bool requireExplicitIntent;

  double minimumConfidenceScore;

  int throttleAfterCount;

  int throttleDelaySeconds;

  bool enableProgressiveRestrictions;

  String? restrictionThresholds;

  double maxDailyCost;

  double warnAtCostPercentage;

  bool isActive;

  bool isDefault;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [CustomerAIPolicy]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CustomerAIPolicy copyWith({
    _i1.UuidValue? id,
    String? policyName,
    String? description,
    int? dailyMessageLimit,
    int? dailyToolCallLimit,
    bool? requireExplicitIntent,
    double? minimumConfidenceScore,
    int? throttleAfterCount,
    int? throttleDelaySeconds,
    bool? enableProgressiveRestrictions,
    String? restrictionThresholds,
    double? maxDailyCost,
    double? warnAtCostPercentage,
    bool? isActive,
    bool? isDefault,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CustomerAIPolicy',
      'id': id.toJson(),
      'policyName': policyName,
      if (description != null) 'description': description,
      'dailyMessageLimit': dailyMessageLimit,
      'dailyToolCallLimit': dailyToolCallLimit,
      'requireExplicitIntent': requireExplicitIntent,
      'minimumConfidenceScore': minimumConfidenceScore,
      'throttleAfterCount': throttleAfterCount,
      'throttleDelaySeconds': throttleDelaySeconds,
      'enableProgressiveRestrictions': enableProgressiveRestrictions,
      if (restrictionThresholds != null)
        'restrictionThresholds': restrictionThresholds,
      'maxDailyCost': maxDailyCost,
      'warnAtCostPercentage': warnAtCostPercentage,
      'isActive': isActive,
      'isDefault': isDefault,
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

class _CustomerAIPolicyImpl extends CustomerAIPolicy {
  _CustomerAIPolicyImpl({
    _i1.UuidValue? id,
    required String policyName,
    String? description,
    int? dailyMessageLimit,
    int? dailyToolCallLimit,
    bool? requireExplicitIntent,
    double? minimumConfidenceScore,
    int? throttleAfterCount,
    int? throttleDelaySeconds,
    bool? enableProgressiveRestrictions,
    String? restrictionThresholds,
    double? maxDailyCost,
    double? warnAtCostPercentage,
    bool? isActive,
    bool? isDefault,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         policyName: policyName,
         description: description,
         dailyMessageLimit: dailyMessageLimit,
         dailyToolCallLimit: dailyToolCallLimit,
         requireExplicitIntent: requireExplicitIntent,
         minimumConfidenceScore: minimumConfidenceScore,
         throttleAfterCount: throttleAfterCount,
         throttleDelaySeconds: throttleDelaySeconds,
         enableProgressiveRestrictions: enableProgressiveRestrictions,
         restrictionThresholds: restrictionThresholds,
         maxDailyCost: maxDailyCost,
         warnAtCostPercentage: warnAtCostPercentage,
         isActive: isActive,
         isDefault: isDefault,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [CustomerAIPolicy]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CustomerAIPolicy copyWith({
    _i1.UuidValue? id,
    String? policyName,
    Object? description = _Undefined,
    int? dailyMessageLimit,
    int? dailyToolCallLimit,
    bool? requireExplicitIntent,
    double? minimumConfidenceScore,
    int? throttleAfterCount,
    int? throttleDelaySeconds,
    bool? enableProgressiveRestrictions,
    Object? restrictionThresholds = _Undefined,
    double? maxDailyCost,
    double? warnAtCostPercentage,
    bool? isActive,
    bool? isDefault,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return CustomerAIPolicy(
      id: id ?? this.id,
      policyName: policyName ?? this.policyName,
      description: description is String? ? description : this.description,
      dailyMessageLimit: dailyMessageLimit ?? this.dailyMessageLimit,
      dailyToolCallLimit: dailyToolCallLimit ?? this.dailyToolCallLimit,
      requireExplicitIntent:
          requireExplicitIntent ?? this.requireExplicitIntent,
      minimumConfidenceScore:
          minimumConfidenceScore ?? this.minimumConfidenceScore,
      throttleAfterCount: throttleAfterCount ?? this.throttleAfterCount,
      throttleDelaySeconds: throttleDelaySeconds ?? this.throttleDelaySeconds,
      enableProgressiveRestrictions:
          enableProgressiveRestrictions ?? this.enableProgressiveRestrictions,
      restrictionThresholds: restrictionThresholds is String?
          ? restrictionThresholds
          : this.restrictionThresholds,
      maxDailyCost: maxDailyCost ?? this.maxDailyCost,
      warnAtCostPercentage: warnAtCostPercentage ?? this.warnAtCostPercentage,
      isActive: isActive ?? this.isActive,
      isDefault: isDefault ?? this.isDefault,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
