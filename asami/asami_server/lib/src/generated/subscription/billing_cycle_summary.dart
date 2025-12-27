/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: unnecessary_null_comparison

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../user/vendor_profile.dart' as _i2;
import '../user/subscription_tier.dart' as _i3;
import '../subscription/subscription_invoice.dart' as _i4;
import 'package:asami_server/src/generated/protocol.dart' as _i5;

abstract class BillingCycleSummary
    implements _i1.TableRow<_i1.UuidValue>, _i1.ProtocolSerialization {
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
      id: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
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
          (jsonSerialization['baseSubscriptionAmount'] as num).toDouble(),
      totalToolCalls: jsonSerialization['totalToolCalls'] as int,
      toolCallsIncluded: jsonSerialization['toolCallsIncluded'] as int,
      toolCallsOverage: jsonSerialization['toolCallsOverage'] as int,
      toolCallsOverageCost: (jsonSerialization['toolCallsOverageCost'] as num)
          .toDouble(),
      totalAIMessages: jsonSerialization['totalAIMessages'] as int,
      aiMessagesIncluded: jsonSerialization['aiMessagesIncluded'] as int,
      aiMessagesOverage: jsonSerialization['aiMessagesOverage'] as int,
      aiMessagesOverageCost: (jsonSerialization['aiMessagesOverageCost'] as num)
          .toDouble(),
      totalProducts: jsonSerialization['totalProducts'] as int,
      productsIncluded: jsonSerialization['productsIncluded'] as int,
      productsOverage: jsonSerialization['productsOverage'] as int,
      productsOverageCost: (jsonSerialization['productsOverageCost'] as num)
          .toDouble(),
      totalAIDescriptions: jsonSerialization['totalAIDescriptions'] as int,
      aiDescriptionsIncluded:
          jsonSerialization['aiDescriptionsIncluded'] as int,
      aiDescriptionsOverage: jsonSerialization['aiDescriptionsOverage'] as int,
      aiDescriptionsOverageCost:
          (jsonSerialization['aiDescriptionsOverageCost'] as num).toDouble(),
      totalTransactionFees: (jsonSerialization['totalTransactionFees'] as num)
          .toDouble(),
      totalUsageCost: (jsonSerialization['totalUsageCost'] as num).toDouble(),
      totalAmount: (jsonSerialization['totalAmount'] as num).toDouble(),
      status: jsonSerialization['status'] as String,
      invoiceId: jsonSerialization['invoiceId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['invoiceId']),
      invoice: jsonSerialization['invoice'] == null
          ? null
          : _i5.Protocol().deserialize<_i4.SubscriptionInvoice>(
              jsonSerialization['invoice'],
            ),
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
    );
  }

  static final t = BillingCycleSummaryTable();

  static const db = BillingCycleSummaryRepository._();

  @override
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

  @override
  _i1.Table<_i1.UuidValue> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'BillingCycleSummary',
      'id': id.toJson(),
      'vendorId': vendorId.toJson(),
      if (vendor != null) 'vendor': vendor?.toJsonForProtocol(),
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
      if (invoice != null) 'invoice': invoice?.toJsonForProtocol(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static BillingCycleSummaryInclude include({
    _i2.VendorProfileInclude? vendor,
    _i4.SubscriptionInvoiceInclude? invoice,
  }) {
    return BillingCycleSummaryInclude._(
      vendor: vendor,
      invoice: invoice,
    );
  }

  static BillingCycleSummaryIncludeList includeList({
    _i1.WhereExpressionBuilder<BillingCycleSummaryTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BillingCycleSummaryTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BillingCycleSummaryTable>? orderByList,
    BillingCycleSummaryInclude? include,
  }) {
    return BillingCycleSummaryIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(BillingCycleSummary.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(BillingCycleSummary.t),
      include: include,
    );
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

class BillingCycleSummaryUpdateTable
    extends _i1.UpdateTable<BillingCycleSummaryTable> {
  BillingCycleSummaryUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> vendorId(_i1.UuidValue value) =>
      _i1.ColumnValue(
        table.vendorId,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> periodStart(DateTime value) =>
      _i1.ColumnValue(
        table.periodStart,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> periodEnd(DateTime value) =>
      _i1.ColumnValue(
        table.periodEnd,
        value,
      );

  _i1.ColumnValue<String, String> billingCycle(String value) => _i1.ColumnValue(
    table.billingCycle,
    value,
  );

  _i1.ColumnValue<_i3.SubscriptionTier, _i3.SubscriptionTier> subscriptionTier(
    _i3.SubscriptionTier value,
  ) => _i1.ColumnValue(
    table.subscriptionTier,
    value,
  );

  _i1.ColumnValue<double, double> baseSubscriptionAmount(double value) =>
      _i1.ColumnValue(
        table.baseSubscriptionAmount,
        value,
      );

  _i1.ColumnValue<int, int> totalToolCalls(int value) => _i1.ColumnValue(
    table.totalToolCalls,
    value,
  );

  _i1.ColumnValue<int, int> toolCallsIncluded(int value) => _i1.ColumnValue(
    table.toolCallsIncluded,
    value,
  );

  _i1.ColumnValue<int, int> toolCallsOverage(int value) => _i1.ColumnValue(
    table.toolCallsOverage,
    value,
  );

  _i1.ColumnValue<double, double> toolCallsOverageCost(double value) =>
      _i1.ColumnValue(
        table.toolCallsOverageCost,
        value,
      );

  _i1.ColumnValue<int, int> totalAIMessages(int value) => _i1.ColumnValue(
    table.totalAIMessages,
    value,
  );

  _i1.ColumnValue<int, int> aiMessagesIncluded(int value) => _i1.ColumnValue(
    table.aiMessagesIncluded,
    value,
  );

  _i1.ColumnValue<int, int> aiMessagesOverage(int value) => _i1.ColumnValue(
    table.aiMessagesOverage,
    value,
  );

  _i1.ColumnValue<double, double> aiMessagesOverageCost(double value) =>
      _i1.ColumnValue(
        table.aiMessagesOverageCost,
        value,
      );

  _i1.ColumnValue<int, int> totalProducts(int value) => _i1.ColumnValue(
    table.totalProducts,
    value,
  );

  _i1.ColumnValue<int, int> productsIncluded(int value) => _i1.ColumnValue(
    table.productsIncluded,
    value,
  );

  _i1.ColumnValue<int, int> productsOverage(int value) => _i1.ColumnValue(
    table.productsOverage,
    value,
  );

  _i1.ColumnValue<double, double> productsOverageCost(double value) =>
      _i1.ColumnValue(
        table.productsOverageCost,
        value,
      );

  _i1.ColumnValue<int, int> totalAIDescriptions(int value) => _i1.ColumnValue(
    table.totalAIDescriptions,
    value,
  );

  _i1.ColumnValue<int, int> aiDescriptionsIncluded(int value) =>
      _i1.ColumnValue(
        table.aiDescriptionsIncluded,
        value,
      );

  _i1.ColumnValue<int, int> aiDescriptionsOverage(int value) => _i1.ColumnValue(
    table.aiDescriptionsOverage,
    value,
  );

  _i1.ColumnValue<double, double> aiDescriptionsOverageCost(double value) =>
      _i1.ColumnValue(
        table.aiDescriptionsOverageCost,
        value,
      );

  _i1.ColumnValue<double, double> totalTransactionFees(double value) =>
      _i1.ColumnValue(
        table.totalTransactionFees,
        value,
      );

  _i1.ColumnValue<double, double> totalUsageCost(double value) =>
      _i1.ColumnValue(
        table.totalUsageCost,
        value,
      );

  _i1.ColumnValue<double, double> totalAmount(double value) => _i1.ColumnValue(
    table.totalAmount,
    value,
  );

  _i1.ColumnValue<String, String> status(String value) => _i1.ColumnValue(
    table.status,
    value,
  );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> invoiceId(
    _i1.UuidValue? value,
  ) => _i1.ColumnValue(
    table.invoiceId,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> updatedAt(DateTime value) =>
      _i1.ColumnValue(
        table.updatedAt,
        value,
      );
}

class BillingCycleSummaryTable extends _i1.Table<_i1.UuidValue> {
  BillingCycleSummaryTable({super.tableRelation})
    : super(tableName: 'billing_cycle_summaries') {
    updateTable = BillingCycleSummaryUpdateTable(this);
    vendorId = _i1.ColumnUuid(
      'vendorId',
      this,
    );
    periodStart = _i1.ColumnDateTime(
      'periodStart',
      this,
    );
    periodEnd = _i1.ColumnDateTime(
      'periodEnd',
      this,
    );
    billingCycle = _i1.ColumnString(
      'billingCycle',
      this,
    );
    subscriptionTier = _i1.ColumnEnum(
      'subscriptionTier',
      this,
      _i1.EnumSerialization.byName,
    );
    baseSubscriptionAmount = _i1.ColumnDouble(
      'baseSubscriptionAmount',
      this,
      hasDefault: true,
    );
    totalToolCalls = _i1.ColumnInt(
      'totalToolCalls',
      this,
      hasDefault: true,
    );
    toolCallsIncluded = _i1.ColumnInt(
      'toolCallsIncluded',
      this,
      hasDefault: true,
    );
    toolCallsOverage = _i1.ColumnInt(
      'toolCallsOverage',
      this,
      hasDefault: true,
    );
    toolCallsOverageCost = _i1.ColumnDouble(
      'toolCallsOverageCost',
      this,
      hasDefault: true,
    );
    totalAIMessages = _i1.ColumnInt(
      'totalAIMessages',
      this,
      hasDefault: true,
    );
    aiMessagesIncluded = _i1.ColumnInt(
      'aiMessagesIncluded',
      this,
      hasDefault: true,
    );
    aiMessagesOverage = _i1.ColumnInt(
      'aiMessagesOverage',
      this,
      hasDefault: true,
    );
    aiMessagesOverageCost = _i1.ColumnDouble(
      'aiMessagesOverageCost',
      this,
      hasDefault: true,
    );
    totalProducts = _i1.ColumnInt(
      'totalProducts',
      this,
      hasDefault: true,
    );
    productsIncluded = _i1.ColumnInt(
      'productsIncluded',
      this,
      hasDefault: true,
    );
    productsOverage = _i1.ColumnInt(
      'productsOverage',
      this,
      hasDefault: true,
    );
    productsOverageCost = _i1.ColumnDouble(
      'productsOverageCost',
      this,
      hasDefault: true,
    );
    totalAIDescriptions = _i1.ColumnInt(
      'totalAIDescriptions',
      this,
      hasDefault: true,
    );
    aiDescriptionsIncluded = _i1.ColumnInt(
      'aiDescriptionsIncluded',
      this,
      hasDefault: true,
    );
    aiDescriptionsOverage = _i1.ColumnInt(
      'aiDescriptionsOverage',
      this,
      hasDefault: true,
    );
    aiDescriptionsOverageCost = _i1.ColumnDouble(
      'aiDescriptionsOverageCost',
      this,
      hasDefault: true,
    );
    totalTransactionFees = _i1.ColumnDouble(
      'totalTransactionFees',
      this,
      hasDefault: true,
    );
    totalUsageCost = _i1.ColumnDouble(
      'totalUsageCost',
      this,
      hasDefault: true,
    );
    totalAmount = _i1.ColumnDouble(
      'totalAmount',
      this,
      hasDefault: true,
    );
    status = _i1.ColumnString(
      'status',
      this,
      hasDefault: true,
    );
    invoiceId = _i1.ColumnUuid(
      'invoiceId',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
    updatedAt = _i1.ColumnDateTime(
      'updatedAt',
      this,
      hasDefault: true,
    );
  }

  late final BillingCycleSummaryUpdateTable updateTable;

  late final _i1.ColumnUuid vendorId;

  _i2.VendorProfileTable? _vendor;

  late final _i1.ColumnDateTime periodStart;

  late final _i1.ColumnDateTime periodEnd;

  late final _i1.ColumnString billingCycle;

  late final _i1.ColumnEnum<_i3.SubscriptionTier> subscriptionTier;

  late final _i1.ColumnDouble baseSubscriptionAmount;

  late final _i1.ColumnInt totalToolCalls;

  late final _i1.ColumnInt toolCallsIncluded;

  late final _i1.ColumnInt toolCallsOverage;

  late final _i1.ColumnDouble toolCallsOverageCost;

  late final _i1.ColumnInt totalAIMessages;

  late final _i1.ColumnInt aiMessagesIncluded;

  late final _i1.ColumnInt aiMessagesOverage;

  late final _i1.ColumnDouble aiMessagesOverageCost;

  late final _i1.ColumnInt totalProducts;

  late final _i1.ColumnInt productsIncluded;

  late final _i1.ColumnInt productsOverage;

  late final _i1.ColumnDouble productsOverageCost;

  late final _i1.ColumnInt totalAIDescriptions;

  late final _i1.ColumnInt aiDescriptionsIncluded;

  late final _i1.ColumnInt aiDescriptionsOverage;

  late final _i1.ColumnDouble aiDescriptionsOverageCost;

  late final _i1.ColumnDouble totalTransactionFees;

  late final _i1.ColumnDouble totalUsageCost;

  late final _i1.ColumnDouble totalAmount;

  late final _i1.ColumnString status;

  late final _i1.ColumnUuid invoiceId;

  _i4.SubscriptionInvoiceTable? _invoice;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  _i2.VendorProfileTable get vendor {
    if (_vendor != null) return _vendor!;
    _vendor = _i1.createRelationTable(
      relationFieldName: 'vendor',
      field: BillingCycleSummary.t.vendorId,
      foreignField: _i2.VendorProfile.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.VendorProfileTable(tableRelation: foreignTableRelation),
    );
    return _vendor!;
  }

  _i4.SubscriptionInvoiceTable get invoice {
    if (_invoice != null) return _invoice!;
    _invoice = _i1.createRelationTable(
      relationFieldName: 'invoice',
      field: BillingCycleSummary.t.invoiceId,
      foreignField: _i4.SubscriptionInvoice.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.SubscriptionInvoiceTable(tableRelation: foreignTableRelation),
    );
    return _invoice!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    vendorId,
    periodStart,
    periodEnd,
    billingCycle,
    subscriptionTier,
    baseSubscriptionAmount,
    totalToolCalls,
    toolCallsIncluded,
    toolCallsOverage,
    toolCallsOverageCost,
    totalAIMessages,
    aiMessagesIncluded,
    aiMessagesOverage,
    aiMessagesOverageCost,
    totalProducts,
    productsIncluded,
    productsOverage,
    productsOverageCost,
    totalAIDescriptions,
    aiDescriptionsIncluded,
    aiDescriptionsOverage,
    aiDescriptionsOverageCost,
    totalTransactionFees,
    totalUsageCost,
    totalAmount,
    status,
    invoiceId,
    createdAt,
    updatedAt,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'vendor') {
      return vendor;
    }
    if (relationField == 'invoice') {
      return invoice;
    }
    return null;
  }
}

class BillingCycleSummaryInclude extends _i1.IncludeObject {
  BillingCycleSummaryInclude._({
    _i2.VendorProfileInclude? vendor,
    _i4.SubscriptionInvoiceInclude? invoice,
  }) {
    _vendor = vendor;
    _invoice = invoice;
  }

  _i2.VendorProfileInclude? _vendor;

  _i4.SubscriptionInvoiceInclude? _invoice;

  @override
  Map<String, _i1.Include?> get includes => {
    'vendor': _vendor,
    'invoice': _invoice,
  };

  @override
  _i1.Table<_i1.UuidValue> get table => BillingCycleSummary.t;
}

class BillingCycleSummaryIncludeList extends _i1.IncludeList {
  BillingCycleSummaryIncludeList._({
    _i1.WhereExpressionBuilder<BillingCycleSummaryTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(BillingCycleSummary.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue> get table => BillingCycleSummary.t;
}

class BillingCycleSummaryRepository {
  const BillingCycleSummaryRepository._();

  final attachRow = const BillingCycleSummaryAttachRowRepository._();

  final detachRow = const BillingCycleSummaryDetachRowRepository._();

  /// Returns a list of [BillingCycleSummary]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<BillingCycleSummary>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BillingCycleSummaryTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BillingCycleSummaryTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BillingCycleSummaryTable>? orderByList,
    _i1.Transaction? transaction,
    BillingCycleSummaryInclude? include,
  }) async {
    return session.db.find<BillingCycleSummary>(
      where: where?.call(BillingCycleSummary.t),
      orderBy: orderBy?.call(BillingCycleSummary.t),
      orderByList: orderByList?.call(BillingCycleSummary.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [BillingCycleSummary] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<BillingCycleSummary?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BillingCycleSummaryTable>? where,
    int? offset,
    _i1.OrderByBuilder<BillingCycleSummaryTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BillingCycleSummaryTable>? orderByList,
    _i1.Transaction? transaction,
    BillingCycleSummaryInclude? include,
  }) async {
    return session.db.findFirstRow<BillingCycleSummary>(
      where: where?.call(BillingCycleSummary.t),
      orderBy: orderBy?.call(BillingCycleSummary.t),
      orderByList: orderByList?.call(BillingCycleSummary.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [BillingCycleSummary] by its [id] or null if no such row exists.
  Future<BillingCycleSummary?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
    BillingCycleSummaryInclude? include,
  }) async {
    return session.db.findById<BillingCycleSummary>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [BillingCycleSummary]s in the list and returns the inserted rows.
  ///
  /// The returned [BillingCycleSummary]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<BillingCycleSummary>> insert(
    _i1.Session session,
    List<BillingCycleSummary> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<BillingCycleSummary>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [BillingCycleSummary] and returns the inserted row.
  ///
  /// The returned [BillingCycleSummary] will have its `id` field set.
  Future<BillingCycleSummary> insertRow(
    _i1.Session session,
    BillingCycleSummary row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<BillingCycleSummary>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [BillingCycleSummary]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<BillingCycleSummary>> update(
    _i1.Session session,
    List<BillingCycleSummary> rows, {
    _i1.ColumnSelections<BillingCycleSummaryTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<BillingCycleSummary>(
      rows,
      columns: columns?.call(BillingCycleSummary.t),
      transaction: transaction,
    );
  }

  /// Updates a single [BillingCycleSummary]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<BillingCycleSummary> updateRow(
    _i1.Session session,
    BillingCycleSummary row, {
    _i1.ColumnSelections<BillingCycleSummaryTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<BillingCycleSummary>(
      row,
      columns: columns?.call(BillingCycleSummary.t),
      transaction: transaction,
    );
  }

  /// Updates a single [BillingCycleSummary] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<BillingCycleSummary?> updateById(
    _i1.Session session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<BillingCycleSummaryUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<BillingCycleSummary>(
      id,
      columnValues: columnValues(BillingCycleSummary.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [BillingCycleSummary]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<BillingCycleSummary>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<BillingCycleSummaryUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<BillingCycleSummaryTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BillingCycleSummaryTable>? orderBy,
    _i1.OrderByListBuilder<BillingCycleSummaryTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<BillingCycleSummary>(
      columnValues: columnValues(BillingCycleSummary.t.updateTable),
      where: where(BillingCycleSummary.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(BillingCycleSummary.t),
      orderByList: orderByList?.call(BillingCycleSummary.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [BillingCycleSummary]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<BillingCycleSummary>> delete(
    _i1.Session session,
    List<BillingCycleSummary> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<BillingCycleSummary>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [BillingCycleSummary].
  Future<BillingCycleSummary> deleteRow(
    _i1.Session session,
    BillingCycleSummary row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<BillingCycleSummary>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<BillingCycleSummary>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<BillingCycleSummaryTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<BillingCycleSummary>(
      where: where(BillingCycleSummary.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BillingCycleSummaryTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<BillingCycleSummary>(
      where: where?.call(BillingCycleSummary.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class BillingCycleSummaryAttachRowRepository {
  const BillingCycleSummaryAttachRowRepository._();

  /// Creates a relation between the given [BillingCycleSummary] and [VendorProfile]
  /// by setting the [BillingCycleSummary]'s foreign key `vendorId` to refer to the [VendorProfile].
  Future<void> vendor(
    _i1.Session session,
    BillingCycleSummary billingCycleSummary,
    _i2.VendorProfile vendor, {
    _i1.Transaction? transaction,
  }) async {
    if (billingCycleSummary.id == null) {
      throw ArgumentError.notNull('billingCycleSummary.id');
    }
    if (vendor.id == null) {
      throw ArgumentError.notNull('vendor.id');
    }

    var $billingCycleSummary = billingCycleSummary.copyWith(
      vendorId: vendor.id,
    );
    await session.db.updateRow<BillingCycleSummary>(
      $billingCycleSummary,
      columns: [BillingCycleSummary.t.vendorId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [BillingCycleSummary] and [SubscriptionInvoice]
  /// by setting the [BillingCycleSummary]'s foreign key `invoiceId` to refer to the [SubscriptionInvoice].
  Future<void> invoice(
    _i1.Session session,
    BillingCycleSummary billingCycleSummary,
    _i4.SubscriptionInvoice invoice, {
    _i1.Transaction? transaction,
  }) async {
    if (billingCycleSummary.id == null) {
      throw ArgumentError.notNull('billingCycleSummary.id');
    }
    if (invoice.id == null) {
      throw ArgumentError.notNull('invoice.id');
    }

    var $billingCycleSummary = billingCycleSummary.copyWith(
      invoiceId: invoice.id,
    );
    await session.db.updateRow<BillingCycleSummary>(
      $billingCycleSummary,
      columns: [BillingCycleSummary.t.invoiceId],
      transaction: transaction,
    );
  }
}

class BillingCycleSummaryDetachRowRepository {
  const BillingCycleSummaryDetachRowRepository._();

  /// Detaches the relation between this [BillingCycleSummary] and the [SubscriptionInvoice] set in `invoice`
  /// by setting the [BillingCycleSummary]'s foreign key `invoiceId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> invoice(
    _i1.Session session,
    BillingCycleSummary billingCycleSummary, {
    _i1.Transaction? transaction,
  }) async {
    if (billingCycleSummary.id == null) {
      throw ArgumentError.notNull('billingCycleSummary.id');
    }

    var $billingCycleSummary = billingCycleSummary.copyWith(invoiceId: null);
    await session.db.updateRow<BillingCycleSummary>(
      $billingCycleSummary,
      columns: [BillingCycleSummary.t.invoiceId],
      transaction: transaction,
    );
  }
}
