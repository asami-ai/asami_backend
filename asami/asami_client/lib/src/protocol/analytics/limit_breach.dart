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
import '../user/user_type.dart' as _i2;
import '../subscription/limit_type.dart' as _i3;
import '../user/subscription_tier.dart' as _i4;
import '../analytics/breach_severity.dart' as _i5;

abstract class LimitBreachLog implements _i1.SerializableModel {
  LimitBreachLog._({
    _i1.UuidValue? id,
    required this.userId,
    required this.userType,
    required this.limitType,
    required this.attemptedAction,
    required this.currentUsage,
    required this.limitValue,
    this.subscriptionTier,
    this.conversationId,
    required this.actionTaken,
    bool? userNotified,
    required this.severity,
    DateTime? breachedAt,
  }) : id = id ?? _i1.Uuid().v4obj(),
       userNotified = userNotified ?? false,
       breachedAt = breachedAt ?? DateTime.now();

  factory LimitBreachLog({
    _i1.UuidValue? id,
    required _i1.UuidValue userId,
    required _i2.UserType userType,
    required _i3.LimitType limitType,
    required String attemptedAction,
    required int currentUsage,
    required int limitValue,
    _i4.SubscriptionTier? subscriptionTier,
    _i1.UuidValue? conversationId,
    required String actionTaken,
    bool? userNotified,
    required _i5.BreachSeverity severity,
    DateTime? breachedAt,
  }) = _LimitBreachLogImpl;

  factory LimitBreachLog.fromJson(Map<String, dynamic> jsonSerialization) {
    return LimitBreachLog(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      userId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      userType: _i2.UserType.fromJson(
        (jsonSerialization['userType'] as String),
      ),
      limitType: _i3.LimitType.fromJson(
        (jsonSerialization['limitType'] as String),
      ),
      attemptedAction: jsonSerialization['attemptedAction'] as String,
      currentUsage: jsonSerialization['currentUsage'] as int,
      limitValue: jsonSerialization['limitValue'] as int,
      subscriptionTier: jsonSerialization['subscriptionTier'] == null
          ? null
          : _i4.SubscriptionTier.fromJson(
              (jsonSerialization['subscriptionTier'] as String),
            ),
      conversationId: jsonSerialization['conversationId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(
              jsonSerialization['conversationId'],
            ),
      actionTaken: jsonSerialization['actionTaken'] as String,
      userNotified: jsonSerialization['userNotified'] as bool?,
      severity: _i5.BreachSeverity.fromJson(
        (jsonSerialization['severity'] as String),
      ),
      breachedAt: jsonSerialization['breachedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['breachedAt']),
    );
  }

  /// The id of the object.
  _i1.UuidValue id;

  _i1.UuidValue userId;

  _i2.UserType userType;

  _i3.LimitType limitType;

  String attemptedAction;

  int currentUsage;

  int limitValue;

  _i4.SubscriptionTier? subscriptionTier;

  _i1.UuidValue? conversationId;

  String actionTaken;

  bool userNotified;

  _i5.BreachSeverity severity;

  DateTime breachedAt;

  /// Returns a shallow copy of this [LimitBreachLog]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  LimitBreachLog copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? userId,
    _i2.UserType? userType,
    _i3.LimitType? limitType,
    String? attemptedAction,
    int? currentUsage,
    int? limitValue,
    _i4.SubscriptionTier? subscriptionTier,
    _i1.UuidValue? conversationId,
    String? actionTaken,
    bool? userNotified,
    _i5.BreachSeverity? severity,
    DateTime? breachedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'LimitBreachLog',
      'id': id.toJson(),
      'userId': userId.toJson(),
      'userType': userType.toJson(),
      'limitType': limitType.toJson(),
      'attemptedAction': attemptedAction,
      'currentUsage': currentUsage,
      'limitValue': limitValue,
      if (subscriptionTier != null)
        'subscriptionTier': subscriptionTier?.toJson(),
      if (conversationId != null) 'conversationId': conversationId?.toJson(),
      'actionTaken': actionTaken,
      'userNotified': userNotified,
      'severity': severity.toJson(),
      'breachedAt': breachedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _LimitBreachLogImpl extends LimitBreachLog {
  _LimitBreachLogImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue userId,
    required _i2.UserType userType,
    required _i3.LimitType limitType,
    required String attemptedAction,
    required int currentUsage,
    required int limitValue,
    _i4.SubscriptionTier? subscriptionTier,
    _i1.UuidValue? conversationId,
    required String actionTaken,
    bool? userNotified,
    required _i5.BreachSeverity severity,
    DateTime? breachedAt,
  }) : super._(
         id: id,
         userId: userId,
         userType: userType,
         limitType: limitType,
         attemptedAction: attemptedAction,
         currentUsage: currentUsage,
         limitValue: limitValue,
         subscriptionTier: subscriptionTier,
         conversationId: conversationId,
         actionTaken: actionTaken,
         userNotified: userNotified,
         severity: severity,
         breachedAt: breachedAt,
       );

  /// Returns a shallow copy of this [LimitBreachLog]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  LimitBreachLog copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? userId,
    _i2.UserType? userType,
    _i3.LimitType? limitType,
    String? attemptedAction,
    int? currentUsage,
    int? limitValue,
    Object? subscriptionTier = _Undefined,
    Object? conversationId = _Undefined,
    String? actionTaken,
    bool? userNotified,
    _i5.BreachSeverity? severity,
    DateTime? breachedAt,
  }) {
    return LimitBreachLog(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      userType: userType ?? this.userType,
      limitType: limitType ?? this.limitType,
      attemptedAction: attemptedAction ?? this.attemptedAction,
      currentUsage: currentUsage ?? this.currentUsage,
      limitValue: limitValue ?? this.limitValue,
      subscriptionTier: subscriptionTier is _i4.SubscriptionTier?
          ? subscriptionTier
          : this.subscriptionTier,
      conversationId: conversationId is _i1.UuidValue?
          ? conversationId
          : this.conversationId,
      actionTaken: actionTaken ?? this.actionTaken,
      userNotified: userNotified ?? this.userNotified,
      severity: severity ?? this.severity,
      breachedAt: breachedAt ?? this.breachedAt,
    );
  }
}
