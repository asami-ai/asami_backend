/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import '../user/user_type.dart' as _i2;

abstract class ToolUsageLog implements _i1.SerializableModel {
  ToolUsageLog._({
    _i1.UuidValue? id,
    required this.userId,
    required this.userType,
    this.conversationId,
    required this.toolName,
    this.toolCategory,
    this.arguments,
    bool? success,
    required this.executionTimeMs,
    this.errorMessage,
    double? costIncurred,
    bool? isBillable,
    this.billingPeriodStart,
    this.billingPeriodEnd,
    bool? wasWithinLimit,
    bool? usedGracePeriod,
    bool? deniedDueToLimit,
    this.platform,
    this.ipAddress,
    this.userAgent,
    DateTime? createdAt,
  })  : id = id ?? _i1.Uuid().v4obj(),
        success = success ?? true,
        costIncurred = costIncurred ?? 0.0,
        isBillable = isBillable ?? false,
        wasWithinLimit = wasWithinLimit ?? true,
        usedGracePeriod = usedGracePeriod ?? false,
        deniedDueToLimit = deniedDueToLimit ?? false,
        createdAt = createdAt ?? DateTime.now();

  factory ToolUsageLog({
    _i1.UuidValue? id,
    required _i1.UuidValue userId,
    required _i2.UserType userType,
    _i1.UuidValue? conversationId,
    required String toolName,
    String? toolCategory,
    String? arguments,
    bool? success,
    required int executionTimeMs,
    String? errorMessage,
    double? costIncurred,
    bool? isBillable,
    DateTime? billingPeriodStart,
    DateTime? billingPeriodEnd,
    bool? wasWithinLimit,
    bool? usedGracePeriod,
    bool? deniedDueToLimit,
    String? platform,
    String? ipAddress,
    String? userAgent,
    DateTime? createdAt,
  }) = _ToolUsageLogImpl;

  factory ToolUsageLog.fromJson(Map<String, dynamic> jsonSerialization) {
    return ToolUsageLog(
      id: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      userId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      userType: _i2.UserType.fromJson((jsonSerialization['userType'] as int)),
      conversationId: jsonSerialization['conversationId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(
              jsonSerialization['conversationId']),
      toolName: jsonSerialization['toolName'] as String,
      toolCategory: jsonSerialization['toolCategory'] as String?,
      arguments: jsonSerialization['arguments'] as String?,
      success: jsonSerialization['success'] as bool,
      executionTimeMs: jsonSerialization['executionTimeMs'] as int,
      errorMessage: jsonSerialization['errorMessage'] as String?,
      costIncurred: (jsonSerialization['costIncurred'] as num).toDouble(),
      isBillable: jsonSerialization['isBillable'] as bool,
      billingPeriodStart: jsonSerialization['billingPeriodStart'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['billingPeriodStart']),
      billingPeriodEnd: jsonSerialization['billingPeriodEnd'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['billingPeriodEnd']),
      wasWithinLimit: jsonSerialization['wasWithinLimit'] as bool,
      usedGracePeriod: jsonSerialization['usedGracePeriod'] as bool,
      deniedDueToLimit: jsonSerialization['deniedDueToLimit'] as bool,
      platform: jsonSerialization['platform'] as String?,
      ipAddress: jsonSerialization['ipAddress'] as String?,
      userAgent: jsonSerialization['userAgent'] as String?,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _i1.UuidValue id;

  _i1.UuidValue userId;

  _i2.UserType userType;

  _i1.UuidValue? conversationId;

  String toolName;

  String? toolCategory;

  String? arguments;

  bool success;

  int executionTimeMs;

  String? errorMessage;

  double costIncurred;

  bool isBillable;

  DateTime? billingPeriodStart;

  DateTime? billingPeriodEnd;

  bool wasWithinLimit;

  bool usedGracePeriod;

  bool deniedDueToLimit;

  String? platform;

  String? ipAddress;

  String? userAgent;

  DateTime createdAt;

  /// Returns a shallow copy of this [ToolUsageLog]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ToolUsageLog copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? userId,
    _i2.UserType? userType,
    _i1.UuidValue? conversationId,
    String? toolName,
    String? toolCategory,
    String? arguments,
    bool? success,
    int? executionTimeMs,
    String? errorMessage,
    double? costIncurred,
    bool? isBillable,
    DateTime? billingPeriodStart,
    DateTime? billingPeriodEnd,
    bool? wasWithinLimit,
    bool? usedGracePeriod,
    bool? deniedDueToLimit,
    String? platform,
    String? ipAddress,
    String? userAgent,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'userId': userId.toJson(),
      'userType': userType.toJson(),
      if (conversationId != null) 'conversationId': conversationId?.toJson(),
      'toolName': toolName,
      if (toolCategory != null) 'toolCategory': toolCategory,
      if (arguments != null) 'arguments': arguments,
      'success': success,
      'executionTimeMs': executionTimeMs,
      if (errorMessage != null) 'errorMessage': errorMessage,
      'costIncurred': costIncurred,
      'isBillable': isBillable,
      if (billingPeriodStart != null)
        'billingPeriodStart': billingPeriodStart?.toJson(),
      if (billingPeriodEnd != null)
        'billingPeriodEnd': billingPeriodEnd?.toJson(),
      'wasWithinLimit': wasWithinLimit,
      'usedGracePeriod': usedGracePeriod,
      'deniedDueToLimit': deniedDueToLimit,
      if (platform != null) 'platform': platform,
      if (ipAddress != null) 'ipAddress': ipAddress,
      if (userAgent != null) 'userAgent': userAgent,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ToolUsageLogImpl extends ToolUsageLog {
  _ToolUsageLogImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue userId,
    required _i2.UserType userType,
    _i1.UuidValue? conversationId,
    required String toolName,
    String? toolCategory,
    String? arguments,
    bool? success,
    required int executionTimeMs,
    String? errorMessage,
    double? costIncurred,
    bool? isBillable,
    DateTime? billingPeriodStart,
    DateTime? billingPeriodEnd,
    bool? wasWithinLimit,
    bool? usedGracePeriod,
    bool? deniedDueToLimit,
    String? platform,
    String? ipAddress,
    String? userAgent,
    DateTime? createdAt,
  }) : super._(
          id: id,
          userId: userId,
          userType: userType,
          conversationId: conversationId,
          toolName: toolName,
          toolCategory: toolCategory,
          arguments: arguments,
          success: success,
          executionTimeMs: executionTimeMs,
          errorMessage: errorMessage,
          costIncurred: costIncurred,
          isBillable: isBillable,
          billingPeriodStart: billingPeriodStart,
          billingPeriodEnd: billingPeriodEnd,
          wasWithinLimit: wasWithinLimit,
          usedGracePeriod: usedGracePeriod,
          deniedDueToLimit: deniedDueToLimit,
          platform: platform,
          ipAddress: ipAddress,
          userAgent: userAgent,
          createdAt: createdAt,
        );

  /// Returns a shallow copy of this [ToolUsageLog]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ToolUsageLog copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? userId,
    _i2.UserType? userType,
    Object? conversationId = _Undefined,
    String? toolName,
    Object? toolCategory = _Undefined,
    Object? arguments = _Undefined,
    bool? success,
    int? executionTimeMs,
    Object? errorMessage = _Undefined,
    double? costIncurred,
    bool? isBillable,
    Object? billingPeriodStart = _Undefined,
    Object? billingPeriodEnd = _Undefined,
    bool? wasWithinLimit,
    bool? usedGracePeriod,
    bool? deniedDueToLimit,
    Object? platform = _Undefined,
    Object? ipAddress = _Undefined,
    Object? userAgent = _Undefined,
    DateTime? createdAt,
  }) {
    return ToolUsageLog(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      userType: userType ?? this.userType,
      conversationId: conversationId is _i1.UuidValue?
          ? conversationId
          : this.conversationId,
      toolName: toolName ?? this.toolName,
      toolCategory: toolCategory is String? ? toolCategory : this.toolCategory,
      arguments: arguments is String? ? arguments : this.arguments,
      success: success ?? this.success,
      executionTimeMs: executionTimeMs ?? this.executionTimeMs,
      errorMessage: errorMessage is String? ? errorMessage : this.errorMessage,
      costIncurred: costIncurred ?? this.costIncurred,
      isBillable: isBillable ?? this.isBillable,
      billingPeriodStart: billingPeriodStart is DateTime?
          ? billingPeriodStart
          : this.billingPeriodStart,
      billingPeriodEnd: billingPeriodEnd is DateTime?
          ? billingPeriodEnd
          : this.billingPeriodEnd,
      wasWithinLimit: wasWithinLimit ?? this.wasWithinLimit,
      usedGracePeriod: usedGracePeriod ?? this.usedGracePeriod,
      deniedDueToLimit: deniedDueToLimit ?? this.deniedDueToLimit,
      platform: platform is String? ? platform : this.platform,
      ipAddress: ipAddress is String? ? ipAddress : this.ipAddress,
      userAgent: userAgent is String? ? userAgent : this.userAgent,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
