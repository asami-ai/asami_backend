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
import '../subscription/subscription_invoice.dart' as _i4;
import 'package:asami_client/src/protocol/protocol.dart' as _i5;

abstract class BillingCycleSummary implements _i1.SerializableModel {
  BillingCycleSummary._({
    _i1.UuidValue? id,
    required this.vendorId,
    this.vendor,
    required this.periodStart,
    required this.periodEnd,
    required this.billingCycle,
    required this.subscriptionTier,
    double? baseSubscriptionAmount,
    int? totalToolCalls,
    int? toolCallsIncluded,
    int? toolCallsOverage,
    double? toolCallsOverageCost,
    int? totalAIMessages,
    int? aiMessagesIncluded,
    int? aiMessagesOverage,
    double? aiMessagesOverageCost,
    int? totalProducts,
    int? productsIncluded,
    int? productsOverage,
    double? productsOverageCost,
    int? totalAIDescriptions,
    int? aiDescriptionsIncluded,
    int? aiDescriptionsOverage,
    double? aiDescriptionsOverageCost,
    double? totalTransactionFees,
    double? totalUsageCost,
    double? totalAmount,
    String? status,
    this.invoiceId,
    this.invoice,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : id = id ?? _i1.Uuid().v4obj(),
       baseSubscriptionAmount = baseSubscriptionAmount ?? 0.0,
       totalToolCalls = totalToolCalls ?? 0,
       toolCallsIncluded = toolCallsIncluded ?? 0,
       toolCallsOverage = toolCallsOverage ?? 0,
       toolCallsOverageCost = toolCallsOverageCost ?? 0.0,
       totalAIMessages = totalAIMessages ?? 0,
       aiMessagesIncluded = aiMessagesIncluded ?? 0,
       aiMessagesOverage = aiMessagesOverage ?? 0,
       aiMessagesOverageCost = aiMessagesOverageCost ?? 0.0,
       totalProducts = totalProducts ?? 0,
       productsIncluded = productsIncluded ?? 0,
       productsOverage = productsOverage ?? 0,
       productsOverageCost = productsOverageCost ?? 0.0,
       totalAIDescriptions = totalAIDescriptions ?? 0,
       aiDescriptionsIncluded = aiDescriptionsIncluded ?? 0,
       aiDescriptionsOverage = aiDescriptionsOverage ?? 0,
       aiDescriptionsOverageCost = aiDescriptionsOverageCost ?? 0.0,
       totalTransactionFees = totalTransactionFees ?? 0.0,
       totalUsageCost = totalUsageCost ?? 0.0,
       totalAmount = totalAmount ?? 0.0,
       status = status ?? 'draft',
       createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory BillingCycleSummary({
    _i1.UuidValue? id,
    required _i1.UuidValue vendorId,
    _i2.VendorProfile? vendor,
    required DateTime periodStart,
    required DateTime periodEnd,
    required String billingCycle,
    required _i3.SubscriptionTier subscriptionTier,
    double? baseSubscriptionAmount,
    int? totalToolCalls,
    int? toolCallsIncluded,
    int? toolCallsOverage,
    double? toolCallsOverageCost,
    int? totalAIMessages,
    int? aiMessagesIncluded,
    int? aiMessagesOverage,
    double? aiMessagesOverageCost,
    int? totalProducts,
    int? productsIncluded,
    int? productsOverage,
    double? productsOverageCost,
    int? totalAIDescriptions,
    int? aiDescriptionsIncluded,
    int? aiDescriptionsOverage,
    double? aiDescriptionsOverageCost,
    double? totalTransactionFees,
    double? totalUsageCost,
    double? totalAmount,
    String? status,
    _i1.UuidValue? invoiceId,
    _i4.SubscriptionInvoice? invoice,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _BillingCycleSummaryImpl;

  factory BillingCycleSummary.fromJson(Map<String, dynamic> jsonSerialization) {
    return BillingCycleSummary(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      vendorId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['vendorId'],
      ),
      vendor: jsonSerialization['vendor'] == null
          ? null
          : _i5.Protocol().deserialize<_i2.VendorProfile>(
              jsonSerialization['vendor'],
            ),
      periodStart: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['periodStart'],
      ),
      periodEnd: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['periodEnd'],
      ),
      billingCycle: jsonSerialization['billingCycle'] as String,
      subscriptionTier: _i3.SubscriptionTier.fromJson(
        (jsonSerialization['subscriptionTier'] as String),
      ),
      baseSubscriptionAmount:
          (jsonSerialization['baseSubscriptionAmount'] as num?)?.toDouble(),
      totalToolCalls: jsonSerialization['totalToolCalls'] as int?,
      toolCallsIncluded: jsonSerialization['toolCallsIncluded'] as int?,
      toolCallsOverage: jsonSerialization['toolCallsOverage'] as int?,
      toolCallsOverageCost: (jsonSerialization['toolCallsOverageCost'] as num?)
          ?.toDouble(),
      totalAIMessages: jsonSerialization['totalAIMessages'] as int?,
      aiMessagesIncluded: jsonSerialization['aiMessagesIncluded'] as int?,
      aiMessagesOverage: jsonSerialization['aiMessagesOverage'] as int?,
      aiMessagesOverageCost:
          (jsonSerialization['aiMessagesOverageCost'] as num?)?.toDouble(),
      totalProducts: jsonSerialization['totalProducts'] as int?,
      productsIncluded: jsonSerialization['productsIncluded'] as int?,
      productsOverage: jsonSerialization['productsOverage'] as int?,
      productsOverageCost: (jsonSerialization['productsOverageCost'] as num?)
          ?.toDouble(),
      totalAIDescriptions: jsonSerialization['totalAIDescriptions'] as int?,
      aiDescriptionsIncluded:
          jsonSerialization['aiDescriptionsIncluded'] as int?,
      aiDescriptionsOverage: jsonSerialization['aiDescriptionsOverage'] as int?,
      aiDescriptionsOverageCost:
          (jsonSerialization['aiDescriptionsOverageCost'] as num?)?.toDouble(),
      totalTransactionFees: (jsonSerialization['totalTransactionFees'] as num?)
          ?.toDouble(),
      totalUsageCost: (jsonSerialization['totalUsageCost'] as num?)?.toDouble(),
      totalAmount: (jsonSerialization['totalAmount'] as num?)?.toDouble(),
      status: jsonSerialization['status'] as String?,
      invoiceId: jsonSerialization['invoiceId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['invoiceId']),
      invoice: jsonSerialization['invoice'] == null
          ? null
          : _i5.Protocol().deserialize<_i4.SubscriptionInvoice>(
              jsonSerialization['invoice'],
            ),
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

  _i1.UuidValue vendorId;

  _i2.VendorProfile? vendor;

  DateTime periodStart;

  DateTime periodEnd;

  String billingCycle;

  _i3.SubscriptionTier subscriptionTier;

  double baseSubscriptionAmount;

  int totalToolCalls;

  int toolCallsIncluded;

  int toolCallsOverage;

  double toolCallsOverageCost;

  int totalAIMessages;

  int aiMessagesIncluded;

  int aiMessagesOverage;

  double aiMessagesOverageCost;

  int totalProducts;

  int productsIncluded;

  int productsOverage;

  double productsOverageCost;

  int totalAIDescriptions;

  int aiDescriptionsIncluded;

  int aiDescriptionsOverage;

  double aiDescriptionsOverageCost;

  double totalTransactionFees;

  double totalUsageCost;

  double totalAmount;

  String status;

  _i1.UuidValue? invoiceId;

  _i4.SubscriptionInvoice? invoice;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [BillingCycleSummary]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  BillingCycleSummary copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? vendorId,
    _i2.VendorProfile? vendor,
    DateTime? periodStart,
    DateTime? periodEnd,
    String? billingCycle,
    _i3.SubscriptionTier? subscriptionTier,
    double? baseSubscriptionAmount,
    int? totalToolCalls,
    int? toolCallsIncluded,
    int? toolCallsOverage,
    double? toolCallsOverageCost,
    int? totalAIMessages,
    int? aiMessagesIncluded,
    int? aiMessagesOverage,
    double? aiMessagesOverageCost,
    int? totalProducts,
    int? productsIncluded,
    int? productsOverage,
    double? productsOverageCost,
    int? totalAIDescriptions,
    int? aiDescriptionsIncluded,
    int? aiDescriptionsOverage,
    double? aiDescriptionsOverageCost,
    double? totalTransactionFees,
    double? totalUsageCost,
    double? totalAmount,
    String? status,
    _i1.UuidValue? invoiceId,
    _i4.SubscriptionInvoice? invoice,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'BillingCycleSummary',
      'id': id.toJson(),
      'vendorId': vendorId.toJson(),
      if (vendor != null) 'vendor': vendor?.toJson(),
      'periodStart': periodStart.toJson(),
      'periodEnd': periodEnd.toJson(),
      'billingCycle': billingCycle,
      'subscriptionTier': subscriptionTier.toJson(),
      'baseSubscriptionAmount': baseSubscriptionAmount,
      'totalToolCalls': totalToolCalls,
      'toolCallsIncluded': toolCallsIncluded,
      'toolCallsOverage': toolCallsOverage,
      'toolCallsOverageCost': toolCallsOverageCost,
      'totalAIMessages': totalAIMessages,
      'aiMessagesIncluded': aiMessagesIncluded,
      'aiMessagesOverage': aiMessagesOverage,
      'aiMessagesOverageCost': aiMessagesOverageCost,
      'totalProducts': totalProducts,
      'productsIncluded': productsIncluded,
      'productsOverage': productsOverage,
      'productsOverageCost': productsOverageCost,
      'totalAIDescriptions': totalAIDescriptions,
      'aiDescriptionsIncluded': aiDescriptionsIncluded,
      'aiDescriptionsOverage': aiDescriptionsOverage,
      'aiDescriptionsOverageCost': aiDescriptionsOverageCost,
      'totalTransactionFees': totalTransactionFees,
      'totalUsageCost': totalUsageCost,
      'totalAmount': totalAmount,
      'status': status,
      if (invoiceId != null) 'invoiceId': invoiceId?.toJson(),
      if (invoice != null) 'invoice': invoice?.toJson(),
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

class _BillingCycleSummaryImpl extends BillingCycleSummary {
  _BillingCycleSummaryImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue vendorId,
    _i2.VendorProfile? vendor,
    required DateTime periodStart,
    required DateTime periodEnd,
    required String billingCycle,
    required _i3.SubscriptionTier subscriptionTier,
    double? baseSubscriptionAmount,
    int? totalToolCalls,
    int? toolCallsIncluded,
    int? toolCallsOverage,
    double? toolCallsOverageCost,
    int? totalAIMessages,
    int? aiMessagesIncluded,
    int? aiMessagesOverage,
    double? aiMessagesOverageCost,
    int? totalProducts,
    int? productsIncluded,
    int? productsOverage,
    double? productsOverageCost,
    int? totalAIDescriptions,
    int? aiDescriptionsIncluded,
    int? aiDescriptionsOverage,
    double? aiDescriptionsOverageCost,
    double? totalTransactionFees,
    double? totalUsageCost,
    double? totalAmount,
    String? status,
    _i1.UuidValue? invoiceId,
    _i4.SubscriptionInvoice? invoice,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         vendorId: vendorId,
         vendor: vendor,
         periodStart: periodStart,
         periodEnd: periodEnd,
         billingCycle: billingCycle,
         subscriptionTier: subscriptionTier,
         baseSubscriptionAmount: baseSubscriptionAmount,
         totalToolCalls: totalToolCalls,
         toolCallsIncluded: toolCallsIncluded,
         toolCallsOverage: toolCallsOverage,
         toolCallsOverageCost: toolCallsOverageCost,
         totalAIMessages: totalAIMessages,
         aiMessagesIncluded: aiMessagesIncluded,
         aiMessagesOverage: aiMessagesOverage,
         aiMessagesOverageCost: aiMessagesOverageCost,
         totalProducts: totalProducts,
         productsIncluded: productsIncluded,
         productsOverage: productsOverage,
         productsOverageCost: productsOverageCost,
         totalAIDescriptions: totalAIDescriptions,
         aiDescriptionsIncluded: aiDescriptionsIncluded,
         aiDescriptionsOverage: aiDescriptionsOverage,
         aiDescriptionsOverageCost: aiDescriptionsOverageCost,
         totalTransactionFees: totalTransactionFees,
         totalUsageCost: totalUsageCost,
         totalAmount: totalAmount,
         status: status,
         invoiceId: invoiceId,
         invoice: invoice,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [BillingCycleSummary]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  BillingCycleSummary copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? vendorId,
    Object? vendor = _Undefined,
    DateTime? periodStart,
    DateTime? periodEnd,
    String? billingCycle,
    _i3.SubscriptionTier? subscriptionTier,
    double? baseSubscriptionAmount,
    int? totalToolCalls,
    int? toolCallsIncluded,
    int? toolCallsOverage,
    double? toolCallsOverageCost,
    int? totalAIMessages,
    int? aiMessagesIncluded,
    int? aiMessagesOverage,
    double? aiMessagesOverageCost,
    int? totalProducts,
    int? productsIncluded,
    int? productsOverage,
    double? productsOverageCost,
    int? totalAIDescriptions,
    int? aiDescriptionsIncluded,
    int? aiDescriptionsOverage,
    double? aiDescriptionsOverageCost,
    double? totalTransactionFees,
    double? totalUsageCost,
    double? totalAmount,
    String? status,
    Object? invoiceId = _Undefined,
    Object? invoice = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return BillingCycleSummary(
      id: id ?? this.id,
      vendorId: vendorId ?? this.vendorId,
      vendor: vendor is _i2.VendorProfile? ? vendor : this.vendor?.copyWith(),
      periodStart: periodStart ?? this.periodStart,
      periodEnd: periodEnd ?? this.periodEnd,
      billingCycle: billingCycle ?? this.billingCycle,
      subscriptionTier: subscriptionTier ?? this.subscriptionTier,
      baseSubscriptionAmount:
          baseSubscriptionAmount ?? this.baseSubscriptionAmount,
      totalToolCalls: totalToolCalls ?? this.totalToolCalls,
      toolCallsIncluded: toolCallsIncluded ?? this.toolCallsIncluded,
      toolCallsOverage: toolCallsOverage ?? this.toolCallsOverage,
      toolCallsOverageCost: toolCallsOverageCost ?? this.toolCallsOverageCost,
      totalAIMessages: totalAIMessages ?? this.totalAIMessages,
      aiMessagesIncluded: aiMessagesIncluded ?? this.aiMessagesIncluded,
      aiMessagesOverage: aiMessagesOverage ?? this.aiMessagesOverage,
      aiMessagesOverageCost:
          aiMessagesOverageCost ?? this.aiMessagesOverageCost,
      totalProducts: totalProducts ?? this.totalProducts,
      productsIncluded: productsIncluded ?? this.productsIncluded,
      productsOverage: productsOverage ?? this.productsOverage,
      productsOverageCost: productsOverageCost ?? this.productsOverageCost,
      totalAIDescriptions: totalAIDescriptions ?? this.totalAIDescriptions,
      aiDescriptionsIncluded:
          aiDescriptionsIncluded ?? this.aiDescriptionsIncluded,
      aiDescriptionsOverage:
          aiDescriptionsOverage ?? this.aiDescriptionsOverage,
      aiDescriptionsOverageCost:
          aiDescriptionsOverageCost ?? this.aiDescriptionsOverageCost,
      totalTransactionFees: totalTransactionFees ?? this.totalTransactionFees,
      totalUsageCost: totalUsageCost ?? this.totalUsageCost,
      totalAmount: totalAmount ?? this.totalAmount,
      status: status ?? this.status,
      invoiceId: invoiceId is _i1.UuidValue? ? invoiceId : this.invoiceId,
      invoice: invoice is _i4.SubscriptionInvoice?
          ? invoice
          : this.invoice?.copyWith(),
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
