/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: unnecessary_null_comparison

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../subscription/subscription.dart' as _i2;
import '../order/payment_method.dart' as _i3;

abstract class SubscriptionInvoice
    implements _i1.TableRow<_i1.UuidValue>, _i1.ProtocolSerialization {
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
  })  : id = id ?? _i1.Uuid().v4obj(),
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
          jsonSerialization['subscriptionId']),
      subscription: jsonSerialization['subscription'] == null
          ? null
          : _i2.Subscription.fromJson(
              (jsonSerialization['subscription'] as Map<String, dynamic>)),
      vendorId:
          _i1.UuidValueJsonExtension.fromJson(jsonSerialization['vendorId']),
      invoiceNumber: jsonSerialization['invoiceNumber'] as String,
      amount: (jsonSerialization['amount'] as num).toDouble(),
      currency: jsonSerialization['currency'] as String,
      subscriptionAmount:
          (jsonSerialization['subscriptionAmount'] as num).toDouble(),
      usageCharges: (jsonSerialization['usageCharges'] as num).toDouble(),
      taxAmount: (jsonSerialization['taxAmount'] as num).toDouble(),
      discountAmount: (jsonSerialization['discountAmount'] as num).toDouble(),
      status: jsonSerialization['status'] as String,
      isPaid: jsonSerialization['isPaid'] as bool,
      paymentMethod: jsonSerialization['paymentMethod'] == null
          ? null
          : _i3.PaymentMethod.fromJson(
              (jsonSerialization['paymentMethod'] as int)),
      paymentTransactionId:
          jsonSerialization['paymentTransactionId'] as String?,
      paidAt: jsonSerialization['paidAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['paidAt']),
      periodStart:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['periodStart']),
      periodEnd:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['periodEnd']),
      dueDate: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['dueDate']),
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  static final t = SubscriptionInvoiceTable();

  static const db = SubscriptionInvoiceRepository._();

  @override
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

  @override
  _i1.Table<_i1.UuidValue> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'id': id.toJson(),
      'subscriptionId': subscriptionId.toJson(),
      if (subscription != null)
        'subscription': subscription?.toJsonForProtocol(),
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

  static SubscriptionInvoiceInclude include(
      {_i2.SubscriptionInclude? subscription}) {
    return SubscriptionInvoiceInclude._(subscription: subscription);
  }

  static SubscriptionInvoiceIncludeList includeList({
    _i1.WhereExpressionBuilder<SubscriptionInvoiceTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SubscriptionInvoiceTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SubscriptionInvoiceTable>? orderByList,
    SubscriptionInvoiceInclude? include,
  }) {
    return SubscriptionInvoiceIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(SubscriptionInvoice.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(SubscriptionInvoice.t),
      include: include,
    );
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

class SubscriptionInvoiceTable extends _i1.Table<_i1.UuidValue> {
  SubscriptionInvoiceTable({super.tableRelation})
      : super(tableName: 'subscription_invoices') {
    subscriptionId = _i1.ColumnUuid(
      'subscriptionId',
      this,
    );
    vendorId = _i1.ColumnUuid(
      'vendorId',
      this,
    );
    invoiceNumber = _i1.ColumnString(
      'invoiceNumber',
      this,
    );
    amount = _i1.ColumnDouble(
      'amount',
      this,
    );
    currency = _i1.ColumnString(
      'currency',
      this,
      hasDefault: true,
    );
    subscriptionAmount = _i1.ColumnDouble(
      'subscriptionAmount',
      this,
      hasDefault: true,
    );
    usageCharges = _i1.ColumnDouble(
      'usageCharges',
      this,
      hasDefault: true,
    );
    taxAmount = _i1.ColumnDouble(
      'taxAmount',
      this,
      hasDefault: true,
    );
    discountAmount = _i1.ColumnDouble(
      'discountAmount',
      this,
      hasDefault: true,
    );
    status = _i1.ColumnString(
      'status',
      this,
      hasDefault: true,
    );
    isPaid = _i1.ColumnBool(
      'isPaid',
      this,
      hasDefault: true,
    );
    paymentMethod = _i1.ColumnEnum(
      'paymentMethod',
      this,
      _i1.EnumSerialization.byIndex,
    );
    paymentTransactionId = _i1.ColumnString(
      'paymentTransactionId',
      this,
    );
    paidAt = _i1.ColumnDateTime(
      'paidAt',
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
    dueDate = _i1.ColumnDateTime(
      'dueDate',
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

  late final _i1.ColumnUuid subscriptionId;

  _i2.SubscriptionTable? _subscription;

  late final _i1.ColumnUuid vendorId;

  late final _i1.ColumnString invoiceNumber;

  late final _i1.ColumnDouble amount;

  late final _i1.ColumnString currency;

  late final _i1.ColumnDouble subscriptionAmount;

  late final _i1.ColumnDouble usageCharges;

  late final _i1.ColumnDouble taxAmount;

  late final _i1.ColumnDouble discountAmount;

  late final _i1.ColumnString status;

  late final _i1.ColumnBool isPaid;

  late final _i1.ColumnEnum<_i3.PaymentMethod> paymentMethod;

  late final _i1.ColumnString paymentTransactionId;

  late final _i1.ColumnDateTime paidAt;

  late final _i1.ColumnDateTime periodStart;

  late final _i1.ColumnDateTime periodEnd;

  late final _i1.ColumnDateTime dueDate;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  _i2.SubscriptionTable get subscription {
    if (_subscription != null) return _subscription!;
    _subscription = _i1.createRelationTable(
      relationFieldName: 'subscription',
      field: SubscriptionInvoice.t.subscriptionId,
      foreignField: _i2.Subscription.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.SubscriptionTable(tableRelation: foreignTableRelation),
    );
    return _subscription!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        subscriptionId,
        vendorId,
        invoiceNumber,
        amount,
        currency,
        subscriptionAmount,
        usageCharges,
        taxAmount,
        discountAmount,
        status,
        isPaid,
        paymentMethod,
        paymentTransactionId,
        paidAt,
        periodStart,
        periodEnd,
        dueDate,
        createdAt,
        updatedAt,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'subscription') {
      return subscription;
    }
    return null;
  }
}

class SubscriptionInvoiceInclude extends _i1.IncludeObject {
  SubscriptionInvoiceInclude._({_i2.SubscriptionInclude? subscription}) {
    _subscription = subscription;
  }

  _i2.SubscriptionInclude? _subscription;

  @override
  Map<String, _i1.Include?> get includes => {'subscription': _subscription};

  @override
  _i1.Table<_i1.UuidValue> get table => SubscriptionInvoice.t;
}

class SubscriptionInvoiceIncludeList extends _i1.IncludeList {
  SubscriptionInvoiceIncludeList._({
    _i1.WhereExpressionBuilder<SubscriptionInvoiceTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(SubscriptionInvoice.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue> get table => SubscriptionInvoice.t;
}

class SubscriptionInvoiceRepository {
  const SubscriptionInvoiceRepository._();

  final attachRow = const SubscriptionInvoiceAttachRowRepository._();

  /// Returns a list of [SubscriptionInvoice]s matching the given query parameters.
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
  Future<List<SubscriptionInvoice>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SubscriptionInvoiceTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SubscriptionInvoiceTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SubscriptionInvoiceTable>? orderByList,
    _i1.Transaction? transaction,
    SubscriptionInvoiceInclude? include,
  }) async {
    return session.db.find<SubscriptionInvoice>(
      where: where?.call(SubscriptionInvoice.t),
      orderBy: orderBy?.call(SubscriptionInvoice.t),
      orderByList: orderByList?.call(SubscriptionInvoice.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [SubscriptionInvoice] matching the given query parameters.
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
  Future<SubscriptionInvoice?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SubscriptionInvoiceTable>? where,
    int? offset,
    _i1.OrderByBuilder<SubscriptionInvoiceTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SubscriptionInvoiceTable>? orderByList,
    _i1.Transaction? transaction,
    SubscriptionInvoiceInclude? include,
  }) async {
    return session.db.findFirstRow<SubscriptionInvoice>(
      where: where?.call(SubscriptionInvoice.t),
      orderBy: orderBy?.call(SubscriptionInvoice.t),
      orderByList: orderByList?.call(SubscriptionInvoice.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [SubscriptionInvoice] by its [id] or null if no such row exists.
  Future<SubscriptionInvoice?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
    SubscriptionInvoiceInclude? include,
  }) async {
    return session.db.findById<SubscriptionInvoice>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [SubscriptionInvoice]s in the list and returns the inserted rows.
  ///
  /// The returned [SubscriptionInvoice]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<SubscriptionInvoice>> insert(
    _i1.Session session,
    List<SubscriptionInvoice> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<SubscriptionInvoice>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [SubscriptionInvoice] and returns the inserted row.
  ///
  /// The returned [SubscriptionInvoice] will have its `id` field set.
  Future<SubscriptionInvoice> insertRow(
    _i1.Session session,
    SubscriptionInvoice row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<SubscriptionInvoice>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [SubscriptionInvoice]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<SubscriptionInvoice>> update(
    _i1.Session session,
    List<SubscriptionInvoice> rows, {
    _i1.ColumnSelections<SubscriptionInvoiceTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<SubscriptionInvoice>(
      rows,
      columns: columns?.call(SubscriptionInvoice.t),
      transaction: transaction,
    );
  }

  /// Updates a single [SubscriptionInvoice]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<SubscriptionInvoice> updateRow(
    _i1.Session session,
    SubscriptionInvoice row, {
    _i1.ColumnSelections<SubscriptionInvoiceTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<SubscriptionInvoice>(
      row,
      columns: columns?.call(SubscriptionInvoice.t),
      transaction: transaction,
    );
  }

  /// Deletes all [SubscriptionInvoice]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<SubscriptionInvoice>> delete(
    _i1.Session session,
    List<SubscriptionInvoice> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<SubscriptionInvoice>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [SubscriptionInvoice].
  Future<SubscriptionInvoice> deleteRow(
    _i1.Session session,
    SubscriptionInvoice row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<SubscriptionInvoice>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<SubscriptionInvoice>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<SubscriptionInvoiceTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<SubscriptionInvoice>(
      where: where(SubscriptionInvoice.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SubscriptionInvoiceTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<SubscriptionInvoice>(
      where: where?.call(SubscriptionInvoice.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class SubscriptionInvoiceAttachRowRepository {
  const SubscriptionInvoiceAttachRowRepository._();

  /// Creates a relation between the given [SubscriptionInvoice] and [Subscription]
  /// by setting the [SubscriptionInvoice]'s foreign key `subscriptionId` to refer to the [Subscription].
  Future<void> subscription(
    _i1.Session session,
    SubscriptionInvoice subscriptionInvoice,
    _i2.Subscription subscription, {
    _i1.Transaction? transaction,
  }) async {
    if (subscriptionInvoice.id == null) {
      throw ArgumentError.notNull('subscriptionInvoice.id');
    }
    if (subscription.id == null) {
      throw ArgumentError.notNull('subscription.id');
    }

    var $subscriptionInvoice =
        subscriptionInvoice.copyWith(subscriptionId: subscription.id);
    await session.db.updateRow<SubscriptionInvoice>(
      $subscriptionInvoice,
      columns: [SubscriptionInvoice.t.subscriptionId],
      transaction: transaction,
    );
  }
}
