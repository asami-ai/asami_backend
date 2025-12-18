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
import '../user/subscription_tier.dart' as _i3;

abstract class DailyUsageTracker implements _i1.SerializableModel {
  DailyUsageTracker._({
    _i1.UuidValue? id,
    required this.userId,
    required this.userType,
    required this.date,
    required this.resetAt,
    int? toolCallsCount,
    required this.toolCallsLimit,
    int? aiMessagesCount,
    required this.aiMessagesLimit,
    int? productsCreatedCount,
    required this.productsCreatedLimit,
    int? aiDescriptionsCount,
    required this.aiDescriptionsLimit,
    int? analyticsQueriesCount,
    required this.analyticsQueriesLimit,
    bool? isInGracePeriod,
    int? gracePeriodUsed,
    int? gracePeriodLimit,
    this.subscriptionTier,
    bool? softLimitWarned,
    bool? hardLimitReached,
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : id = id ?? _i1.Uuid().v4obj(),
        toolCallsCount = toolCallsCount ?? 0,
        aiMessagesCount = aiMessagesCount ?? 0,
        productsCreatedCount = productsCreatedCount ?? 0,
        aiDescriptionsCount = aiDescriptionsCount ?? 0,
        analyticsQueriesCount = analyticsQueriesCount ?? 0,
        isInGracePeriod = isInGracePeriod ?? false,
        gracePeriodUsed = gracePeriodUsed ?? 0,
        gracePeriodLimit = gracePeriodLimit ?? 5,
        softLimitWarned = softLimitWarned ?? false,
        hardLimitReached = hardLimitReached ?? false,
        createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  factory DailyUsageTracker({
    _i1.UuidValue? id,
    required _i1.UuidValue userId,
    required _i2.UserType userType,
    required DateTime date,
    required DateTime resetAt,
    int? toolCallsCount,
    required int toolCallsLimit,
    int? aiMessagesCount,
    required int aiMessagesLimit,
    int? productsCreatedCount,
    required int productsCreatedLimit,
    int? aiDescriptionsCount,
    required int aiDescriptionsLimit,
    int? analyticsQueriesCount,
    required int analyticsQueriesLimit,
    bool? isInGracePeriod,
    int? gracePeriodUsed,
    int? gracePeriodLimit,
    _i3.SubscriptionTier? subscriptionTier,
    bool? softLimitWarned,
    bool? hardLimitReached,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _DailyUsageTrackerImpl;

  factory DailyUsageTracker.fromJson(Map<String, dynamic> jsonSerialization) {
    return DailyUsageTracker(
      id: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      userId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      userType: _i2.UserType.fromJson((jsonSerialization['userType'] as int)),
      date: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['date']),
      resetAt: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['resetAt']),
      toolCallsCount: jsonSerialization['toolCallsCount'] as int,
      toolCallsLimit: jsonSerialization['toolCallsLimit'] as int,
      aiMessagesCount: jsonSerialization['aiMessagesCount'] as int,
      aiMessagesLimit: jsonSerialization['aiMessagesLimit'] as int,
      productsCreatedCount: jsonSerialization['productsCreatedCount'] as int,
      productsCreatedLimit: jsonSerialization['productsCreatedLimit'] as int,
      aiDescriptionsCount: jsonSerialization['aiDescriptionsCount'] as int,
      aiDescriptionsLimit: jsonSerialization['aiDescriptionsLimit'] as int,
      analyticsQueriesCount: jsonSerialization['analyticsQueriesCount'] as int,
      analyticsQueriesLimit: jsonSerialization['analyticsQueriesLimit'] as int,
      isInGracePeriod: jsonSerialization['isInGracePeriod'] as bool,
      gracePeriodUsed: jsonSerialization['gracePeriodUsed'] as int,
      gracePeriodLimit: jsonSerialization['gracePeriodLimit'] as int,
      subscriptionTier: jsonSerialization['subscriptionTier'] == null
          ? null
          : _i3.SubscriptionTier.fromJson(
              (jsonSerialization['subscriptionTier'] as int)),
      softLimitWarned: jsonSerialization['softLimitWarned'] as bool,
      hardLimitReached: jsonSerialization['hardLimitReached'] as bool,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _i1.UuidValue id;

  _i1.UuidValue userId;

  _i2.UserType userType;

  DateTime date;

  DateTime resetAt;

  int toolCallsCount;

  int toolCallsLimit;

  int aiMessagesCount;

  int aiMessagesLimit;

  int productsCreatedCount;

  int productsCreatedLimit;

  int aiDescriptionsCount;

  int aiDescriptionsLimit;

  int analyticsQueriesCount;

  int analyticsQueriesLimit;

  bool isInGracePeriod;

  int gracePeriodUsed;

  int gracePeriodLimit;

  _i3.SubscriptionTier? subscriptionTier;

  bool softLimitWarned;

  bool hardLimitReached;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [DailyUsageTracker]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DailyUsageTracker copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? userId,
    _i2.UserType? userType,
    DateTime? date,
    DateTime? resetAt,
    int? toolCallsCount,
    int? toolCallsLimit,
    int? aiMessagesCount,
    int? aiMessagesLimit,
    int? productsCreatedCount,
    int? productsCreatedLimit,
    int? aiDescriptionsCount,
    int? aiDescriptionsLimit,
    int? analyticsQueriesCount,
    int? analyticsQueriesLimit,
    bool? isInGracePeriod,
    int? gracePeriodUsed,
    int? gracePeriodLimit,
    _i3.SubscriptionTier? subscriptionTier,
    bool? softLimitWarned,
    bool? hardLimitReached,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'userId': userId.toJson(),
      'userType': userType.toJson(),
      'date': date.toJson(),
      'resetAt': resetAt.toJson(),
      'toolCallsCount': toolCallsCount,
      'toolCallsLimit': toolCallsLimit,
      'aiMessagesCount': aiMessagesCount,
      'aiMessagesLimit': aiMessagesLimit,
      'productsCreatedCount': productsCreatedCount,
      'productsCreatedLimit': productsCreatedLimit,
      'aiDescriptionsCount': aiDescriptionsCount,
      'aiDescriptionsLimit': aiDescriptionsLimit,
      'analyticsQueriesCount': analyticsQueriesCount,
      'analyticsQueriesLimit': analyticsQueriesLimit,
      'isInGracePeriod': isInGracePeriod,
      'gracePeriodUsed': gracePeriodUsed,
      'gracePeriodLimit': gracePeriodLimit,
      if (subscriptionTier != null)
        'subscriptionTier': subscriptionTier?.toJson(),
      'softLimitWarned': softLimitWarned,
      'hardLimitReached': hardLimitReached,
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

class _DailyUsageTrackerImpl extends DailyUsageTracker {
  _DailyUsageTrackerImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue userId,
    required _i2.UserType userType,
    required DateTime date,
    required DateTime resetAt,
    int? toolCallsCount,
    required int toolCallsLimit,
    int? aiMessagesCount,
    required int aiMessagesLimit,
    int? productsCreatedCount,
    required int productsCreatedLimit,
    int? aiDescriptionsCount,
    required int aiDescriptionsLimit,
    int? analyticsQueriesCount,
    required int analyticsQueriesLimit,
    bool? isInGracePeriod,
    int? gracePeriodUsed,
    int? gracePeriodLimit,
    _i3.SubscriptionTier? subscriptionTier,
    bool? softLimitWarned,
    bool? hardLimitReached,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
          id: id,
          userId: userId,
          userType: userType,
          date: date,
          resetAt: resetAt,
          toolCallsCount: toolCallsCount,
          toolCallsLimit: toolCallsLimit,
          aiMessagesCount: aiMessagesCount,
          aiMessagesLimit: aiMessagesLimit,
          productsCreatedCount: productsCreatedCount,
          productsCreatedLimit: productsCreatedLimit,
          aiDescriptionsCount: aiDescriptionsCount,
          aiDescriptionsLimit: aiDescriptionsLimit,
          analyticsQueriesCount: analyticsQueriesCount,
          analyticsQueriesLimit: analyticsQueriesLimit,
          isInGracePeriod: isInGracePeriod,
          gracePeriodUsed: gracePeriodUsed,
          gracePeriodLimit: gracePeriodLimit,
          subscriptionTier: subscriptionTier,
          softLimitWarned: softLimitWarned,
          hardLimitReached: hardLimitReached,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  /// Returns a shallow copy of this [DailyUsageTracker]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DailyUsageTracker copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? userId,
    _i2.UserType? userType,
    DateTime? date,
    DateTime? resetAt,
    int? toolCallsCount,
    int? toolCallsLimit,
    int? aiMessagesCount,
    int? aiMessagesLimit,
    int? productsCreatedCount,
    int? productsCreatedLimit,
    int? aiDescriptionsCount,
    int? aiDescriptionsLimit,
    int? analyticsQueriesCount,
    int? analyticsQueriesLimit,
    bool? isInGracePeriod,
    int? gracePeriodUsed,
    int? gracePeriodLimit,
    Object? subscriptionTier = _Undefined,
    bool? softLimitWarned,
    bool? hardLimitReached,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return DailyUsageTracker(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      userType: userType ?? this.userType,
      date: date ?? this.date,
      resetAt: resetAt ?? this.resetAt,
      toolCallsCount: toolCallsCount ?? this.toolCallsCount,
      toolCallsLimit: toolCallsLimit ?? this.toolCallsLimit,
      aiMessagesCount: aiMessagesCount ?? this.aiMessagesCount,
      aiMessagesLimit: aiMessagesLimit ?? this.aiMessagesLimit,
      productsCreatedCount: productsCreatedCount ?? this.productsCreatedCount,
      productsCreatedLimit: productsCreatedLimit ?? this.productsCreatedLimit,
      aiDescriptionsCount: aiDescriptionsCount ?? this.aiDescriptionsCount,
      aiDescriptionsLimit: aiDescriptionsLimit ?? this.aiDescriptionsLimit,
      analyticsQueriesCount:
          analyticsQueriesCount ?? this.analyticsQueriesCount,
      analyticsQueriesLimit:
          analyticsQueriesLimit ?? this.analyticsQueriesLimit,
      isInGracePeriod: isInGracePeriod ?? this.isInGracePeriod,
      gracePeriodUsed: gracePeriodUsed ?? this.gracePeriodUsed,
      gracePeriodLimit: gracePeriodLimit ?? this.gracePeriodLimit,
      subscriptionTier: subscriptionTier is _i3.SubscriptionTier?
          ? subscriptionTier
          : this.subscriptionTier,
      softLimitWarned: softLimitWarned ?? this.softLimitWarned,
      hardLimitReached: hardLimitReached ?? this.hardLimitReached,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
