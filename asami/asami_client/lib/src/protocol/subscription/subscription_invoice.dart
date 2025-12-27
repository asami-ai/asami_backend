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
import '../order/payment_method.dart' as _i3;
import 'package:asami_client/src/protocol/protocol.dart' as _i4;

abstract class SubscriptionInvoice implements _i1.SerializableModel {
  SubscriptionInvoice._({
    _i1.UuidValue? id,
    required this.subscriptionId,
    this.subscription,
    required this.vendorId,
    required this.invoiceNumber,
    required this.amount,
    String? currency,
    double? subscriptionAmount,
    double? usageCharges,
    double? taxAmount,
    double? discountAmount,
    String? status,
    bool? isPaid,
    this.paymentMethod,
    this.paymentTransactionId,
    this.paidAt,
    required this.periodStart,
    required this.periodEnd,
    required this.dueDate,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : id = id ?? _i1.Uuid().v4obj(),
       currency = currency ?? 'USD',
       subscriptionAmount = subscriptionAmount ?? 0.0,
       usageCharges = usageCharges ?? 0.0,
       taxAmount = taxAmount ?? 0.0,
       discountAmount = discountAmount ?? 0.0,
       status = status ?? 'pending',
       isPaid = isPaid ?? false,
       createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory SubscriptionInvoice({
    _i1.UuidValue? id,
    required _i1.UuidValue subscriptionId,
    _i2.Subscription? subscription,
    required _i1.UuidValue vendorId,
    required String invoiceNumber,
    required double amount,
    String? currency,
    double? subscriptionAmount,
    double? usageCharges,
    double? taxAmount,
    double? discountAmount,
    String? status,
    bool? isPaid,
    _i3.PaymentMethod? paymentMethod,
    String? paymentTransactionId,
    DateTime? paidAt,
    required DateTime periodStart,
    required DateTime periodEnd,
    required DateTime dueDate,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _SubscriptionInvoiceImpl;

  factory SubscriptionInvoice.fromJson(Map<String, dynamic> jsonSerialization) {
    return SubscriptionInvoice(
      id: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
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
      invoiceNumber: jsonSerialization['invoiceNumber'] as String,
      amount: (jsonSerialization['amount'] as num).toDouble(),
      currency: jsonSerialization['currency'] as String,
      subscriptionAmount: (jsonSerialization['subscriptionAmount'] as num)
          .toDouble(),
      usageCharges: (jsonSerialization['usageCharges'] as num).toDouble(),
      taxAmount: (jsonSerialization['taxAmount'] as num).toDouble(),
      discountAmount: (jsonSerialization['discountAmount'] as num).toDouble(),
      status: jsonSerialization['status'] as String,
      isPaid: jsonSerialization['isPaid'] as bool,
      paymentMethod: jsonSerialization['paymentMethod'] == null
          ? null
          : _i3.PaymentMethod.fromJson(
              (jsonSerialization['paymentMethod'] as String),
            ),
      paymentTransactionId:
          jsonSerialization['paymentTransactionId'] as String?,
      paidAt: jsonSerialization['paidAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['paidAt']),
      periodStart: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['periodStart'],
      ),
      periodEnd: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['periodEnd'],
      ),
      dueDate: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['dueDate']),
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

  _i1.UuidValue subscriptionId;

  _i2.Subscription? subscription;

  _i1.UuidValue vendorId;

  String invoiceNumber;

  double amount;

  String currency;

  double subscriptionAmount;

  double usageCharges;

  double taxAmount;

  double discountAmount;

  String status;

  bool isPaid;

  _i3.PaymentMethod? paymentMethod;

  String? paymentTransactionId;

  DateTime? paidAt;

  DateTime periodStart;

  DateTime periodEnd;

  DateTime dueDate;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [SubscriptionInvoice]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SubscriptionInvoice copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? subscriptionId,
    _i2.Subscription? subscription,
    _i1.UuidValue? vendorId,
    String? invoiceNumber,
    double? amount,
    String? currency,
    double? subscriptionAmount,
    double? usageCharges,
    double? taxAmount,
    double? discountAmount,
    String? status,
    bool? isPaid,
    _i3.PaymentMethod? paymentMethod,
    String? paymentTransactionId,
    DateTime? paidAt,
    DateTime? periodStart,
    DateTime? periodEnd,
    DateTime? dueDate,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'SubscriptionInvoice',
      'id': id.toJson(),
      'subscriptionId': subscriptionId.toJson(),
      if (subscription != null) 'subscription': subscription?.toJson(),
      'vendorId': vendorId.toJson(),
      'invoiceNumber': invoiceNumber,
      'amount': amount,
      'currency': currency,
      'subscriptionAmount': subscriptionAmount,
      'usageCharges': usageCharges,
      'taxAmount': taxAmount,
      'discountAmount': discountAmount,
      'status': status,
      'isPaid': isPaid,
      if (paymentMethod != null) 'paymentMethod': paymentMethod?.toJson(),
      if (paymentTransactionId != null)
        'paymentTransactionId': paymentTransactionId,
      if (paidAt != null) 'paidAt': paidAt?.toJson(),
      'periodStart': periodStart.toJson(),
      'periodEnd': periodEnd.toJson(),
      'dueDate': dueDate.toJson(),
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

class _SubscriptionInvoiceImpl extends SubscriptionInvoice {
  _SubscriptionInvoiceImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue subscriptionId,
    _i2.Subscription? subscription,
    required _i1.UuidValue vendorId,
    required String invoiceNumber,
    required double amount,
    String? currency,
    double? subscriptionAmount,
    double? usageCharges,
    double? taxAmount,
    double? discountAmount,
    String? status,
    bool? isPaid,
    _i3.PaymentMethod? paymentMethod,
    String? paymentTransactionId,
    DateTime? paidAt,
    required DateTime periodStart,
    required DateTime periodEnd,
    required DateTime dueDate,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         subscriptionId: subscriptionId,
         subscription: subscription,
         vendorId: vendorId,
         invoiceNumber: invoiceNumber,
         amount: amount,
         currency: currency,
         subscriptionAmount: subscriptionAmount,
         usageCharges: usageCharges,
         taxAmount: taxAmount,
         discountAmount: discountAmount,
         status: status,
         isPaid: isPaid,
         paymentMethod: paymentMethod,
         paymentTransactionId: paymentTransactionId,
         paidAt: paidAt,
         periodStart: periodStart,
         periodEnd: periodEnd,
         dueDate: dueDate,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [SubscriptionInvoice]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SubscriptionInvoice copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? subscriptionId,
    Object? subscription = _Undefined,
    _i1.UuidValue? vendorId,
    String? invoiceNumber,
    double? amount,
    String? currency,
    double? subscriptionAmount,
    double? usageCharges,
    double? taxAmount,
    double? discountAmount,
    String? status,
    bool? isPaid,
    Object? paymentMethod = _Undefined,
    Object? paymentTransactionId = _Undefined,
    Object? paidAt = _Undefined,
    DateTime? periodStart,
    DateTime? periodEnd,
    DateTime? dueDate,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return SubscriptionInvoice(
      id: id ?? this.id,
      subscriptionId: subscriptionId ?? this.subscriptionId,
      subscription: subscription is _i2.Subscription?
          ? subscription
          : this.subscription?.copyWith(),
      vendorId: vendorId ?? this.vendorId,
      invoiceNumber: invoiceNumber ?? this.invoiceNumber,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      subscriptionAmount: subscriptionAmount ?? this.subscriptionAmount,
      usageCharges: usageCharges ?? this.usageCharges,
      taxAmount: taxAmount ?? this.taxAmount,
      discountAmount: discountAmount ?? this.discountAmount,
      status: status ?? this.status,
      isPaid: isPaid ?? this.isPaid,
      paymentMethod: paymentMethod is _i3.PaymentMethod?
          ? paymentMethod
          : this.paymentMethod,
      paymentTransactionId: paymentTransactionId is String?
          ? paymentTransactionId
          : this.paymentTransactionId,
      paidAt: paidAt is DateTime? ? paidAt : this.paidAt,
      periodStart: periodStart ?? this.periodStart,
      periodEnd: periodEnd ?? this.periodEnd,
      dueDate: dueDate ?? this.dueDate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
