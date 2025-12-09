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
import '../user/vendor_profile.dart' as _i2;
import '../subscription/subscription_invoice.dart' as _i3;

abstract class UsageRecord implements _i1.SerializableModel {
  UsageRecord._({
    _i1.UuidValue? id,
    required this.vendorId,
    this.vendor,
    this.subscriptionId,
    required this.usageType,
    int? quantity,
    required this.unitPrice,
    required this.totalAmount,
    String? currency,
    this.resourceId,
    this.metadata,
    required this.billingPeriodStart,
    required this.billingPeriodEnd,
    this.invoiceId,
    this.invoice,
    bool? isBilled,
    this.billedAt,
    DateTime? createdAt,
  })  : id = id ?? _i1.Uuid().v4obj(),
        quantity = quantity ?? 1,
        currency = currency ?? 'USD',
        isBilled = isBilled ?? false,
        createdAt = createdAt ?? DateTime.now();

  factory UsageRecord({
    _i1.UuidValue? id,
    required _i1.UuidValue vendorId,
    _i2.VendorProfile? vendor,
    String? subscriptionId,
    required String usageType,
    int? quantity,
    required double unitPrice,
    required double totalAmount,
    String? currency,
    String? resourceId,
    String? metadata,
    required DateTime billingPeriodStart,
    required DateTime billingPeriodEnd,
    _i1.UuidValue? invoiceId,
    _i3.SubscriptionInvoice? invoice,
    bool? isBilled,
    DateTime? billedAt,
    DateTime? createdAt,
  }) = _UsageRecordImpl;

  factory UsageRecord.fromJson(Map<String, dynamic> jsonSerialization) {
    return UsageRecord(
      id: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      vendorId:
          _i1.UuidValueJsonExtension.fromJson(jsonSerialization['vendorId']),
      vendor: jsonSerialization['vendor'] == null
          ? null
          : _i2.VendorProfile.fromJson(
              (jsonSerialization['vendor'] as Map<String, dynamic>)),
      subscriptionId: jsonSerialization['subscriptionId'] as String?,
      usageType: jsonSerialization['usageType'] as String,
      quantity: jsonSerialization['quantity'] as int,
      unitPrice: (jsonSerialization['unitPrice'] as num).toDouble(),
      totalAmount: (jsonSerialization['totalAmount'] as num).toDouble(),
      currency: jsonSerialization['currency'] as String,
      resourceId: jsonSerialization['resourceId'] as String?,
      metadata: jsonSerialization['metadata'] as String?,
      billingPeriodStart: _i1.DateTimeJsonExtension.fromJson(
          jsonSerialization['billingPeriodStart']),
      billingPeriodEnd: _i1.DateTimeJsonExtension.fromJson(
          jsonSerialization['billingPeriodEnd']),
      invoiceId: jsonSerialization['invoiceId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['invoiceId']),
      invoice: jsonSerialization['invoice'] == null
          ? null
          : _i3.SubscriptionInvoice.fromJson(
              (jsonSerialization['invoice'] as Map<String, dynamic>)),
      isBilled: jsonSerialization['isBilled'] as bool,
      billedAt: jsonSerialization['billedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['billedAt']),
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _i1.UuidValue id;

  _i1.UuidValue vendorId;

  _i2.VendorProfile? vendor;

  String? subscriptionId;

  String usageType;

  int quantity;

  double unitPrice;

  double totalAmount;

  String currency;

  String? resourceId;

  String? metadata;

  DateTime billingPeriodStart;

  DateTime billingPeriodEnd;

  _i1.UuidValue? invoiceId;

  _i3.SubscriptionInvoice? invoice;

  bool isBilled;

  DateTime? billedAt;

  DateTime createdAt;

  /// Returns a shallow copy of this [UsageRecord]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UsageRecord copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? vendorId,
    _i2.VendorProfile? vendor,
    String? subscriptionId,
    String? usageType,
    int? quantity,
    double? unitPrice,
    double? totalAmount,
    String? currency,
    String? resourceId,
    String? metadata,
    DateTime? billingPeriodStart,
    DateTime? billingPeriodEnd,
    _i1.UuidValue? invoiceId,
    _i3.SubscriptionInvoice? invoice,
    bool? isBilled,
    DateTime? billedAt,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'vendorId': vendorId.toJson(),
      if (vendor != null) 'vendor': vendor?.toJson(),
      if (subscriptionId != null) 'subscriptionId': subscriptionId,
      'usageType': usageType,
      'quantity': quantity,
      'unitPrice': unitPrice,
      'totalAmount': totalAmount,
      'currency': currency,
      if (resourceId != null) 'resourceId': resourceId,
      if (metadata != null) 'metadata': metadata,
      'billingPeriodStart': billingPeriodStart.toJson(),
      'billingPeriodEnd': billingPeriodEnd.toJson(),
      if (invoiceId != null) 'invoiceId': invoiceId?.toJson(),
      if (invoice != null) 'invoice': invoice?.toJson(),
      'isBilled': isBilled,
      if (billedAt != null) 'billedAt': billedAt?.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UsageRecordImpl extends UsageRecord {
  _UsageRecordImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue vendorId,
    _i2.VendorProfile? vendor,
    String? subscriptionId,
    required String usageType,
    int? quantity,
    required double unitPrice,
    required double totalAmount,
    String? currency,
    String? resourceId,
    String? metadata,
    required DateTime billingPeriodStart,
    required DateTime billingPeriodEnd,
    _i1.UuidValue? invoiceId,
    _i3.SubscriptionInvoice? invoice,
    bool? isBilled,
    DateTime? billedAt,
    DateTime? createdAt,
  }) : super._(
          id: id,
          vendorId: vendorId,
          vendor: vendor,
          subscriptionId: subscriptionId,
          usageType: usageType,
          quantity: quantity,
          unitPrice: unitPrice,
          totalAmount: totalAmount,
          currency: currency,
          resourceId: resourceId,
          metadata: metadata,
          billingPeriodStart: billingPeriodStart,
          billingPeriodEnd: billingPeriodEnd,
          invoiceId: invoiceId,
          invoice: invoice,
          isBilled: isBilled,
          billedAt: billedAt,
          createdAt: createdAt,
        );

  /// Returns a shallow copy of this [UsageRecord]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UsageRecord copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? vendorId,
    Object? vendor = _Undefined,
    Object? subscriptionId = _Undefined,
    String? usageType,
    int? quantity,
    double? unitPrice,
    double? totalAmount,
    String? currency,
    Object? resourceId = _Undefined,
    Object? metadata = _Undefined,
    DateTime? billingPeriodStart,
    DateTime? billingPeriodEnd,
    Object? invoiceId = _Undefined,
    Object? invoice = _Undefined,
    bool? isBilled,
    Object? billedAt = _Undefined,
    DateTime? createdAt,
  }) {
    return UsageRecord(
      id: id ?? this.id,
      vendorId: vendorId ?? this.vendorId,
      vendor: vendor is _i2.VendorProfile? ? vendor : this.vendor?.copyWith(),
      subscriptionId:
          subscriptionId is String? ? subscriptionId : this.subscriptionId,
      usageType: usageType ?? this.usageType,
      quantity: quantity ?? this.quantity,
      unitPrice: unitPrice ?? this.unitPrice,
      totalAmount: totalAmount ?? this.totalAmount,
      currency: currency ?? this.currency,
      resourceId: resourceId is String? ? resourceId : this.resourceId,
      metadata: metadata is String? ? metadata : this.metadata,
      billingPeriodStart: billingPeriodStart ?? this.billingPeriodStart,
      billingPeriodEnd: billingPeriodEnd ?? this.billingPeriodEnd,
      invoiceId: invoiceId is _i1.UuidValue? ? invoiceId : this.invoiceId,
      invoice: invoice is _i3.SubscriptionInvoice?
          ? invoice
          : this.invoice?.copyWith(),
      isBilled: isBilled ?? this.isBilled,
      billedAt: billedAt is DateTime? ? billedAt : this.billedAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
