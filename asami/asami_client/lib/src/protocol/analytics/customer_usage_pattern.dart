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
import '../subscription/usage_class.dart' as _i2;

abstract class CustomerUsagePattern implements _i1.SerializableModel {
  CustomerUsagePattern._({
    _i1.UuidValue? id,
    required this.userId,
    double? averageDailyMessages,
    double? averageDailyToolCalls,
    this.peakUsageHour,
    required this.usageClass,
    bool? isAbuser,
    double? abuseScore,
    double? toolSuccessRate,
    double? averageToolExecutionTime,
    double? averageConversationLength,
    double? repetitiveQueryScore,
    bool? shouldThrottle,
    this.throttleReason,
    int? currentThrottleDelay,
    this.lastAnalyzedAt,
    int? analysisCount,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : id = id ?? _i1.Uuid().v4obj(),
       averageDailyMessages = averageDailyMessages ?? 0.0,
       averageDailyToolCalls = averageDailyToolCalls ?? 0.0,
       isAbuser = isAbuser ?? false,
       abuseScore = abuseScore ?? 0.0,
       toolSuccessRate = toolSuccessRate ?? 1.0,
       averageToolExecutionTime = averageToolExecutionTime ?? 0.0,
       averageConversationLength = averageConversationLength ?? 0.0,
       repetitiveQueryScore = repetitiveQueryScore ?? 0.0,
       shouldThrottle = shouldThrottle ?? false,
       currentThrottleDelay = currentThrottleDelay ?? 0,
       analysisCount = analysisCount ?? 0,
       createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory CustomerUsagePattern({
    _i1.UuidValue? id,
    required _i1.UuidValue userId,
    double? averageDailyMessages,
    double? averageDailyToolCalls,
    int? peakUsageHour,
    required _i2.UsageClass usageClass,
    bool? isAbuser,
    double? abuseScore,
    double? toolSuccessRate,
    double? averageToolExecutionTime,
    double? averageConversationLength,
    double? repetitiveQueryScore,
    bool? shouldThrottle,
    String? throttleReason,
    int? currentThrottleDelay,
    DateTime? lastAnalyzedAt,
    int? analysisCount,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _CustomerUsagePatternImpl;

  factory CustomerUsagePattern.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return CustomerUsagePattern(
      id: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      userId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      averageDailyMessages: (jsonSerialization['averageDailyMessages'] as num)
          .toDouble(),
      averageDailyToolCalls: (jsonSerialization['averageDailyToolCalls'] as num)
          .toDouble(),
      peakUsageHour: jsonSerialization['peakUsageHour'] as int?,
      usageClass: _i2.UsageClass.fromJson(
        (jsonSerialization['usageClass'] as String),
      ),
      isAbuser: jsonSerialization['isAbuser'] as bool,
      abuseScore: (jsonSerialization['abuseScore'] as num).toDouble(),
      toolSuccessRate: (jsonSerialization['toolSuccessRate'] as num).toDouble(),
      averageToolExecutionTime:
          (jsonSerialization['averageToolExecutionTime'] as num).toDouble(),
      averageConversationLength:
          (jsonSerialization['averageConversationLength'] as num).toDouble(),
      repetitiveQueryScore: (jsonSerialization['repetitiveQueryScore'] as num)
          .toDouble(),
      shouldThrottle: jsonSerialization['shouldThrottle'] as bool,
      throttleReason: jsonSerialization['throttleReason'] as String?,
      currentThrottleDelay: jsonSerialization['currentThrottleDelay'] as int,
      lastAnalyzedAt: jsonSerialization['lastAnalyzedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastAnalyzedAt'],
            ),
      analysisCount: jsonSerialization['analysisCount'] as int,
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

  double averageDailyMessages;

  double averageDailyToolCalls;

  int? peakUsageHour;

  _i2.UsageClass usageClass;

  bool isAbuser;

  double abuseScore;

  double toolSuccessRate;

  double averageToolExecutionTime;

  double averageConversationLength;

  double repetitiveQueryScore;

  bool shouldThrottle;

  String? throttleReason;

  int currentThrottleDelay;

  DateTime? lastAnalyzedAt;

  int analysisCount;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [CustomerUsagePattern]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CustomerUsagePattern copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? userId,
    double? averageDailyMessages,
    double? averageDailyToolCalls,
    int? peakUsageHour,
    _i2.UsageClass? usageClass,
    bool? isAbuser,
    double? abuseScore,
    double? toolSuccessRate,
    double? averageToolExecutionTime,
    double? averageConversationLength,
    double? repetitiveQueryScore,
    bool? shouldThrottle,
    String? throttleReason,
    int? currentThrottleDelay,
    DateTime? lastAnalyzedAt,
    int? analysisCount,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CustomerUsagePattern',
      'id': id.toJson(),
      'userId': userId.toJson(),
      'averageDailyMessages': averageDailyMessages,
      'averageDailyToolCalls': averageDailyToolCalls,
      if (peakUsageHour != null) 'peakUsageHour': peakUsageHour,
      'usageClass': usageClass.toJson(),
      'isAbuser': isAbuser,
      'abuseScore': abuseScore,
      'toolSuccessRate': toolSuccessRate,
      'averageToolExecutionTime': averageToolExecutionTime,
      'averageConversationLength': averageConversationLength,
      'repetitiveQueryScore': repetitiveQueryScore,
      'shouldThrottle': shouldThrottle,
      if (throttleReason != null) 'throttleReason': throttleReason,
      'currentThrottleDelay': currentThrottleDelay,
      if (lastAnalyzedAt != null) 'lastAnalyzedAt': lastAnalyzedAt?.toJson(),
      'analysisCount': analysisCount,
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

class _CustomerUsagePatternImpl extends CustomerUsagePattern {
  _CustomerUsagePatternImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue userId,
    double? averageDailyMessages,
    double? averageDailyToolCalls,
    int? peakUsageHour,
    required _i2.UsageClass usageClass,
    bool? isAbuser,
    double? abuseScore,
    double? toolSuccessRate,
    double? averageToolExecutionTime,
    double? averageConversationLength,
    double? repetitiveQueryScore,
    bool? shouldThrottle,
    String? throttleReason,
    int? currentThrottleDelay,
    DateTime? lastAnalyzedAt,
    int? analysisCount,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         userId: userId,
         averageDailyMessages: averageDailyMessages,
         averageDailyToolCalls: averageDailyToolCalls,
         peakUsageHour: peakUsageHour,
         usageClass: usageClass,
         isAbuser: isAbuser,
         abuseScore: abuseScore,
         toolSuccessRate: toolSuccessRate,
         averageToolExecutionTime: averageToolExecutionTime,
         averageConversationLength: averageConversationLength,
         repetitiveQueryScore: repetitiveQueryScore,
         shouldThrottle: shouldThrottle,
         throttleReason: throttleReason,
         currentThrottleDelay: currentThrottleDelay,
         lastAnalyzedAt: lastAnalyzedAt,
         analysisCount: analysisCount,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [CustomerUsagePattern]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CustomerUsagePattern copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? userId,
    double? averageDailyMessages,
    double? averageDailyToolCalls,
    Object? peakUsageHour = _Undefined,
    _i2.UsageClass? usageClass,
    bool? isAbuser,
    double? abuseScore,
    double? toolSuccessRate,
    double? averageToolExecutionTime,
    double? averageConversationLength,
    double? repetitiveQueryScore,
    bool? shouldThrottle,
    Object? throttleReason = _Undefined,
    int? currentThrottleDelay,
    Object? lastAnalyzedAt = _Undefined,
    int? analysisCount,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return CustomerUsagePattern(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      averageDailyMessages: averageDailyMessages ?? this.averageDailyMessages,
      averageDailyToolCalls:
          averageDailyToolCalls ?? this.averageDailyToolCalls,
      peakUsageHour: peakUsageHour is int? ? peakUsageHour : this.peakUsageHour,
      usageClass: usageClass ?? this.usageClass,
      isAbuser: isAbuser ?? this.isAbuser,
      abuseScore: abuseScore ?? this.abuseScore,
      toolSuccessRate: toolSuccessRate ?? this.toolSuccessRate,
      averageToolExecutionTime:
          averageToolExecutionTime ?? this.averageToolExecutionTime,
      averageConversationLength:
          averageConversationLength ?? this.averageConversationLength,
      repetitiveQueryScore: repetitiveQueryScore ?? this.repetitiveQueryScore,
      shouldThrottle: shouldThrottle ?? this.shouldThrottle,
      throttleReason: throttleReason is String?
          ? throttleReason
          : this.throttleReason,
      currentThrottleDelay: currentThrottleDelay ?? this.currentThrottleDelay,
      lastAnalyzedAt: lastAnalyzedAt is DateTime?
          ? lastAnalyzedAt
          : this.lastAnalyzedAt,
      analysisCount: analysisCount ?? this.analysisCount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
