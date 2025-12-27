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
import '../subscription/subscription.dart' as _i2;
import '../user/subscription_tier.dart' as _i3;
import 'package:asami_client/src/protocol/protocol.dart' as _i4;

abstract class SubscriptionEvent implements _i1.SerializableModel {
  SubscriptionEvent._({
    this.id,
    required this.eventId,
    required this.subscriptionId,
    this.subscription,
    required this.vendorId,
    required this.eventType,
    this.eventData,
    required this.createdAt,
    this.tier,
    this.previousTier,
  });

  factory SubscriptionEvent({
    int? id,
    required _i1.UuidValue eventId,
    required _i1.UuidValue subscriptionId,
    _i2.Subscription? subscription,
    required _i1.UuidValue vendorId,
    required String eventType,
    String? eventData,
    required DateTime createdAt,
    _i3.SubscriptionTier? tier,
    _i3.SubscriptionTier? previousTier,
  }) = _SubscriptionEventImpl;

  factory SubscriptionEvent.fromJson(Map<String, dynamic> jsonSerialization) {
    return SubscriptionEvent(
      id: jsonSerialization['id'] as int?,
      eventId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['eventId'],
      ),
      subscriptionId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['subscriptionId'],
      ),
      subscription: jsonSerialization['subscription'] == null
          ? null
          : _i4.Protocol().deserialize<_i2.Subscription>(
              jsonSerialization['subscription'],
            ),
      vendorId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['vendorId'],
      ),
      eventType: jsonSerialization['eventType'] as String,
      eventData: jsonSerialization['eventData'] as String?,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      tier: jsonSerialization['tier'] == null
          ? null
          : _i3.SubscriptionTier.fromJson(
              (jsonSerialization['tier'] as String),
            ),
      previousTier: jsonSerialization['previousTier'] == null
          ? null
          : _i3.SubscriptionTier.fromJson(
              (jsonSerialization['previousTier'] as String),
            ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  _i1.UuidValue eventId;

  _i1.UuidValue subscriptionId;

  _i2.Subscription? subscription;

  _i1.UuidValue vendorId;

  String eventType;

  String? eventData;

  DateTime createdAt;

  _i3.SubscriptionTier? tier;

  _i3.SubscriptionTier? previousTier;

  /// Returns a shallow copy of this [SubscriptionEvent]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SubscriptionEvent copyWith({
    int? id,
    _i1.UuidValue? eventId,
    _i1.UuidValue? subscriptionId,
    _i2.Subscription? subscription,
    _i1.UuidValue? vendorId,
    String? eventType,
    String? eventData,
    DateTime? createdAt,
    _i3.SubscriptionTier? tier,
    _i3.SubscriptionTier? previousTier,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'SubscriptionEvent',
      if (id != null) 'id': id,
      'eventId': eventId.toJson(),
      'subscriptionId': subscriptionId.toJson(),
      if (subscription != null) 'subscription': subscription?.toJson(),
      'vendorId': vendorId.toJson(),
      'eventType': eventType,
      if (eventData != null) 'eventData': eventData,
      'createdAt': createdAt.toJson(),
      if (tier != null) 'tier': tier?.toJson(),
      if (previousTier != null) 'previousTier': previousTier?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SubscriptionEventImpl extends SubscriptionEvent {
  _SubscriptionEventImpl({
    int? id,
    required _i1.UuidValue eventId,
    required _i1.UuidValue subscriptionId,
    _i2.Subscription? subscription,
    required _i1.UuidValue vendorId,
    required String eventType,
    String? eventData,
    required DateTime createdAt,
    _i3.SubscriptionTier? tier,
    _i3.SubscriptionTier? previousTier,
  }) : super._(
         id: id,
         eventId: eventId,
         subscriptionId: subscriptionId,
         subscription: subscription,
         vendorId: vendorId,
         eventType: eventType,
         eventData: eventData,
         createdAt: createdAt,
         tier: tier,
         previousTier: previousTier,
       );

  /// Returns a shallow copy of this [SubscriptionEvent]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SubscriptionEvent copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? eventId,
    _i1.UuidValue? subscriptionId,
    Object? subscription = _Undefined,
    _i1.UuidValue? vendorId,
    String? eventType,
    Object? eventData = _Undefined,
    DateTime? createdAt,
    Object? tier = _Undefined,
    Object? previousTier = _Undefined,
  }) {
    return SubscriptionEvent(
      id: id is int? ? id : this.id,
      eventId: eventId ?? this.eventId,
      subscriptionId: subscriptionId ?? this.subscriptionId,
      subscription: subscription is _i2.Subscription?
          ? subscription
          : this.subscription?.copyWith(),
      vendorId: vendorId ?? this.vendorId,
      eventType: eventType ?? this.eventType,
      eventData: eventData is String? ? eventData : this.eventData,
      createdAt: createdAt ?? this.createdAt,
      tier: tier is _i3.SubscriptionTier? ? tier : this.tier,
      previousTier: previousTier is _i3.SubscriptionTier?
          ? previousTier
          : this.previousTier,
    );
  }
}
