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
import '../user/vendor_profile.dart' as _i2;
import '../user/subscription_tier.dart' as _i3;
import 'package:asami_client/src/protocol/protocol.dart' as _i4;

abstract class Subscription implements _i1.SerializableModel {
  Subscription._({
    _i1.UuidValue? id,
    required this.vendorId,
    this.vendor,
    required this.tier,
    String? status,
    String? billingCycle,
    required this.amount,
    String? currency,
    required this.currentPeriodStart,
    required this.currentPeriodEnd,
    required this.productLimit,
    required this.aiDescriptionsLimit,
    required this.platformTransactionFee,
    bool? autoRenew,
    bool? cancelAtPeriodEnd,
    bool? isTrialing,
    this.trialStart,
    this.trialEnd,
    this.cancelledAt,
    this.cancellationReason,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : id = id ?? _i1.Uuid().v4obj(),
       status = status ?? 'active',
       billingCycle = billingCycle ?? 'monthly',
       currency = currency ?? 'USD',
       autoRenew = autoRenew ?? true,
       cancelAtPeriodEnd = cancelAtPeriodEnd ?? false,
       isTrialing = isTrialing ?? false,
       createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory Subscription({
    _i1.UuidValue? id,
    required _i1.UuidValue vendorId,
    _i2.VendorProfile? vendor,
    required _i3.SubscriptionTier tier,
    String? status,
    String? billingCycle,
    required double amount,
    String? currency,
    required DateTime currentPeriodStart,
    required DateTime currentPeriodEnd,
    required int productLimit,
    required int aiDescriptionsLimit,
    required double platformTransactionFee,
    bool? autoRenew,
    bool? cancelAtPeriodEnd,
    bool? isTrialing,
    DateTime? trialStart,
    DateTime? trialEnd,
    DateTime? cancelledAt,
    String? cancellationReason,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _SubscriptionImpl;

  factory Subscription.fromJson(Map<String, dynamic> jsonSerialization) {
    return Subscription(
      id: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      vendorId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['vendorId'],
      ),
      vendor: jsonSerialization['vendor'] == null
          ? null
          : _i4.Protocol().deserialize<_i2.VendorProfile>(
              jsonSerialization['vendor'],
            ),
      tier: _i3.SubscriptionTier.fromJson(
        (jsonSerialization['tier'] as String),
      ),
      status: jsonSerialization['status'] as String,
      billingCycle: jsonSerialization['billingCycle'] as String,
      amount: (jsonSerialization['amount'] as num).toDouble(),
      currency: jsonSerialization['currency'] as String,
      currentPeriodStart: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['currentPeriodStart'],
      ),
      currentPeriodEnd: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['currentPeriodEnd'],
      ),
      productLimit: jsonSerialization['productLimit'] as int,
      aiDescriptionsLimit: jsonSerialization['aiDescriptionsLimit'] as int,
      platformTransactionFee:
          (jsonSerialization['platformTransactionFee'] as num).toDouble(),
      autoRenew: jsonSerialization['autoRenew'] as bool,
      cancelAtPeriodEnd: jsonSerialization['cancelAtPeriodEnd'] as bool,
      isTrialing: jsonSerialization['isTrialing'] as bool,
      trialStart: jsonSerialization['trialStart'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['trialStart']),
      trialEnd: jsonSerialization['trialEnd'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['trialEnd']),
      cancelledAt: jsonSerialization['cancelledAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['cancelledAt'],
            ),
      cancellationReason: jsonSerialization['cancellationReason'] as String?,
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

  _i1.UuidValue vendorId;

  _i2.VendorProfile? vendor;

  _i3.SubscriptionTier tier;

  String status;

  String billingCycle;

  double amount;

  String currency;

  DateTime currentPeriodStart;

  DateTime currentPeriodEnd;

  int productLimit;

  int aiDescriptionsLimit;

  double platformTransactionFee;

  bool autoRenew;

  bool cancelAtPeriodEnd;

  bool isTrialing;

  DateTime? trialStart;

  DateTime? trialEnd;

  DateTime? cancelledAt;

  String? cancellationReason;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [Subscription]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Subscription copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? vendorId,
    _i2.VendorProfile? vendor,
    _i3.SubscriptionTier? tier,
    String? status,
    String? billingCycle,
    double? amount,
    String? currency,
    DateTime? currentPeriodStart,
    DateTime? currentPeriodEnd,
    int? productLimit,
    int? aiDescriptionsLimit,
    double? platformTransactionFee,
    bool? autoRenew,
    bool? cancelAtPeriodEnd,
    bool? isTrialing,
    DateTime? trialStart,
    DateTime? trialEnd,
    DateTime? cancelledAt,
    String? cancellationReason,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Subscription',
      'id': id.toJson(),
      'vendorId': vendorId.toJson(),
      if (vendor != null) 'vendor': vendor?.toJson(),
      'tier': tier.toJson(),
      'status': status,
      'billingCycle': billingCycle,
      'amount': amount,
      'currency': currency,
      'currentPeriodStart': currentPeriodStart.toJson(),
      'currentPeriodEnd': currentPeriodEnd.toJson(),
      'productLimit': productLimit,
      'aiDescriptionsLimit': aiDescriptionsLimit,
      'platformTransactionFee': platformTransactionFee,
      'autoRenew': autoRenew,
      'cancelAtPeriodEnd': cancelAtPeriodEnd,
      'isTrialing': isTrialing,
      if (trialStart != null) 'trialStart': trialStart?.toJson(),
      if (trialEnd != null) 'trialEnd': trialEnd?.toJson(),
      if (cancelledAt != null) 'cancelledAt': cancelledAt?.toJson(),
      if (cancellationReason != null) 'cancellationReason': cancellationReason,
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

class _SubscriptionImpl extends Subscription {
  _SubscriptionImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue vendorId,
    _i2.VendorProfile? vendor,
    required _i3.SubscriptionTier tier,
    String? status,
    String? billingCycle,
    required double amount,
    String? currency,
    required DateTime currentPeriodStart,
    required DateTime currentPeriodEnd,
    required int productLimit,
    required int aiDescriptionsLimit,
    required double platformTransactionFee,
    bool? autoRenew,
    bool? cancelAtPeriodEnd,
    bool? isTrialing,
    DateTime? trialStart,
    DateTime? trialEnd,
    DateTime? cancelledAt,
    String? cancellationReason,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         vendorId: vendorId,
         vendor: vendor,
         tier: tier,
         status: status,
         billingCycle: billingCycle,
         amount: amount,
         currency: currency,
         currentPeriodStart: currentPeriodStart,
         currentPeriodEnd: currentPeriodEnd,
         productLimit: productLimit,
         aiDescriptionsLimit: aiDescriptionsLimit,
         platformTransactionFee: platformTransactionFee,
         autoRenew: autoRenew,
         cancelAtPeriodEnd: cancelAtPeriodEnd,
         isTrialing: isTrialing,
         trialStart: trialStart,
         trialEnd: trialEnd,
         cancelledAt: cancelledAt,
         cancellationReason: cancellationReason,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [Subscription]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Subscription copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? vendorId,
    Object? vendor = _Undefined,
    _i3.SubscriptionTier? tier,
    String? status,
    String? billingCycle,
    double? amount,
    String? currency,
    DateTime? currentPeriodStart,
    DateTime? currentPeriodEnd,
    int? productLimit,
    int? aiDescriptionsLimit,
    double? platformTransactionFee,
    bool? autoRenew,
    bool? cancelAtPeriodEnd,
    bool? isTrialing,
    Object? trialStart = _Undefined,
    Object? trialEnd = _Undefined,
    Object? cancelledAt = _Undefined,
    Object? cancellationReason = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Subscription(
      id: id ?? this.id,
      vendorId: vendorId ?? this.vendorId,
      vendor: vendor is _i2.VendorProfile? ? vendor : this.vendor?.copyWith(),
      tier: tier ?? this.tier,
      status: status ?? this.status,
      billingCycle: billingCycle ?? this.billingCycle,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      currentPeriodStart: currentPeriodStart ?? this.currentPeriodStart,
      currentPeriodEnd: currentPeriodEnd ?? this.currentPeriodEnd,
      productLimit: productLimit ?? this.productLimit,
      aiDescriptionsLimit: aiDescriptionsLimit ?? this.aiDescriptionsLimit,
      platformTransactionFee:
          platformTransactionFee ?? this.platformTransactionFee,
      autoRenew: autoRenew ?? this.autoRenew,
      cancelAtPeriodEnd: cancelAtPeriodEnd ?? this.cancelAtPeriodEnd,
      isTrialing: isTrialing ?? this.isTrialing,
      trialStart: trialStart is DateTime? ? trialStart : this.trialStart,
      trialEnd: trialEnd is DateTime? ? trialEnd : this.trialEnd,
      cancelledAt: cancelledAt is DateTime? ? cancelledAt : this.cancelledAt,
      cancellationReason: cancellationReason is String?
          ? cancellationReason
          : this.cancellationReason,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
