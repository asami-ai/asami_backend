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
import '../subscription/subscription_invoice.dart' as _i3;
import 'package:asami_server/src/generated/protocol.dart' as _i4;

abstract class UsageRecord
    implements _i1.TableRow<_i1.UuidValue>, _i1.ProtocolSerialization {
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
  }) : id = id ?? _i1.Uuid().v4obj(),
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
      vendorId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['vendorId'],
      ),
      vendor: jsonSerialization['vendor'] == null
          ? null
          : _i4.Protocol().deserialize<_i2.VendorProfile>(
              jsonSerialization['vendor'],
            ),
      subscriptionId: jsonSerialization['subscriptionId'] as String?,
      usageType: jsonSerialization['usageType'] as String,
      quantity: jsonSerialization['quantity'] as int,
      unitPrice: (jsonSerialization['unitPrice'] as num).toDouble(),
      totalAmount: (jsonSerialization['totalAmount'] as num).toDouble(),
      currency: jsonSerialization['currency'] as String,
      resourceId: jsonSerialization['resourceId'] as String?,
      metadata: jsonSerialization['metadata'] as String?,
      billingPeriodStart: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['billingPeriodStart'],
      ),
      billingPeriodEnd: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['billingPeriodEnd'],
      ),
      invoiceId: jsonSerialization['invoiceId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['invoiceId']),
      invoice: jsonSerialization['invoice'] == null
          ? null
          : _i4.Protocol().deserialize<_i3.SubscriptionInvoice>(
              jsonSerialization['invoice'],
            ),
      isBilled: jsonSerialization['isBilled'] as bool,
      billedAt: jsonSerialization['billedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['billedAt']),
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  static final t = UsageRecordTable();

  static const db = UsageRecordRepository._();

  @override
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

  @override
  _i1.Table<_i1.UuidValue> get table => t;

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
      '__className__': 'UsageRecord',
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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'UsageRecord',
      'id': id.toJson(),
      'vendorId': vendorId.toJson(),
      if (vendor != null) 'vendor': vendor?.toJsonForProtocol(),
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
      if (invoice != null) 'invoice': invoice?.toJsonForProtocol(),
      'isBilled': isBilled,
      if (billedAt != null) 'billedAt': billedAt?.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  static UsageRecordInclude include({
    _i2.VendorProfileInclude? vendor,
    _i3.SubscriptionInvoiceInclude? invoice,
  }) {
    return UsageRecordInclude._(
      vendor: vendor,
      invoice: invoice,
    );
  }

  static UsageRecordIncludeList includeList({
    _i1.WhereExpressionBuilder<UsageRecordTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UsageRecordTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UsageRecordTable>? orderByList,
    UsageRecordInclude? include,
  }) {
    return UsageRecordIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(UsageRecord.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(UsageRecord.t),
      include: include,
    );
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
      subscriptionId: subscriptionId is String?
          ? subscriptionId
          : this.subscriptionId,
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

class UsageRecordUpdateTable extends _i1.UpdateTable<UsageRecordTable> {
  UsageRecordUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> vendorId(_i1.UuidValue value) =>
      _i1.ColumnValue(
        table.vendorId,
        value,
      );

  _i1.ColumnValue<String, String> subscriptionId(String? value) =>
      _i1.ColumnValue(
        table.subscriptionId,
        value,
      );

  _i1.ColumnValue<String, String> usageType(String value) => _i1.ColumnValue(
    table.usageType,
    value,
  );

  _i1.ColumnValue<int, int> quantity(int value) => _i1.ColumnValue(
    table.quantity,
    value,
  );

  _i1.ColumnValue<double, double> unitPrice(double value) => _i1.ColumnValue(
    table.unitPrice,
    value,
  );

  _i1.ColumnValue<double, double> totalAmount(double value) => _i1.ColumnValue(
    table.totalAmount,
    value,
  );

  _i1.ColumnValue<String, String> currency(String value) => _i1.ColumnValue(
    table.currency,
    value,
  );

  _i1.ColumnValue<String, String> resourceId(String? value) => _i1.ColumnValue(
    table.resourceId,
    value,
  );

  _i1.ColumnValue<String, String> metadata(String? value) => _i1.ColumnValue(
    table.metadata,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> billingPeriodStart(DateTime value) =>
      _i1.ColumnValue(
        table.billingPeriodStart,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> billingPeriodEnd(DateTime value) =>
      _i1.ColumnValue(
        table.billingPeriodEnd,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> invoiceId(
    _i1.UuidValue? value,
  ) => _i1.ColumnValue(
    table.invoiceId,
    value,
  );

  _i1.ColumnValue<bool, bool> isBilled(bool value) => _i1.ColumnValue(
    table.isBilled,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> billedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.billedAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );
}

class UsageRecordTable extends _i1.Table<_i1.UuidValue> {
  UsageRecordTable({super.tableRelation}) : super(tableName: 'usage_records') {
    updateTable = UsageRecordUpdateTable(this);
    vendorId = _i1.ColumnUuid(
      'vendorId',
      this,
    );
    subscriptionId = _i1.ColumnString(
      'subscriptionId',
      this,
    );
    usageType = _i1.ColumnString(
      'usageType',
      this,
    );
    quantity = _i1.ColumnInt(
      'quantity',
      this,
      hasDefault: true,
    );
    unitPrice = _i1.ColumnDouble(
      'unitPrice',
      this,
    );
    totalAmount = _i1.ColumnDouble(
      'totalAmount',
      this,
    );
    currency = _i1.ColumnString(
      'currency',
      this,
      hasDefault: true,
    );
    resourceId = _i1.ColumnString(
      'resourceId',
      this,
    );
    metadata = _i1.ColumnString(
      'metadata',
      this,
    );
    billingPeriodStart = _i1.ColumnDateTime(
      'billingPeriodStart',
      this,
    );
    billingPeriodEnd = _i1.ColumnDateTime(
      'billingPeriodEnd',
      this,
    );
    invoiceId = _i1.ColumnUuid(
      'invoiceId',
      this,
    );
    isBilled = _i1.ColumnBool(
      'isBilled',
      this,
      hasDefault: true,
    );
    billedAt = _i1.ColumnDateTime(
      'billedAt',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
  }

  late final UsageRecordUpdateTable updateTable;

  late final _i1.ColumnUuid vendorId;

  _i2.VendorProfileTable? _vendor;

  late final _i1.ColumnString subscriptionId;

  late final _i1.ColumnString usageType;

  late final _i1.ColumnInt quantity;

  late final _i1.ColumnDouble unitPrice;

  late final _i1.ColumnDouble totalAmount;

  late final _i1.ColumnString currency;

  late final _i1.ColumnString resourceId;

  late final _i1.ColumnString metadata;

  late final _i1.ColumnDateTime billingPeriodStart;

  late final _i1.ColumnDateTime billingPeriodEnd;

  late final _i1.ColumnUuid invoiceId;

  _i3.SubscriptionInvoiceTable? _invoice;

  late final _i1.ColumnBool isBilled;

  late final _i1.ColumnDateTime billedAt;

  late final _i1.ColumnDateTime createdAt;

  _i2.VendorProfileTable get vendor {
    if (_vendor != null) return _vendor!;
    _vendor = _i1.createRelationTable(
      relationFieldName: 'vendor',
      field: UsageRecord.t.vendorId,
      foreignField: _i2.VendorProfile.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.VendorProfileTable(tableRelation: foreignTableRelation),
    );
    return _vendor!;
  }

  _i3.SubscriptionInvoiceTable get invoice {
    if (_invoice != null) return _invoice!;
    _invoice = _i1.createRelationTable(
      relationFieldName: 'invoice',
      field: UsageRecord.t.invoiceId,
      foreignField: _i3.SubscriptionInvoice.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.SubscriptionInvoiceTable(tableRelation: foreignTableRelation),
    );
    return _invoice!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    vendorId,
    subscriptionId,
    usageType,
    quantity,
    unitPrice,
    totalAmount,
    currency,
    resourceId,
    metadata,
    billingPeriodStart,
    billingPeriodEnd,
    invoiceId,
    isBilled,
    billedAt,
    createdAt,
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

class UsageRecordInclude extends _i1.IncludeObject {
  UsageRecordInclude._({
    _i2.VendorProfileInclude? vendor,
    _i3.SubscriptionInvoiceInclude? invoice,
  }) {
    _vendor = vendor;
    _invoice = invoice;
  }

  _i2.VendorProfileInclude? _vendor;

  _i3.SubscriptionInvoiceInclude? _invoice;

  @override
  Map<String, _i1.Include?> get includes => {
    'vendor': _vendor,
    'invoice': _invoice,
  };

  @override
  _i1.Table<_i1.UuidValue> get table => UsageRecord.t;
}

class UsageRecordIncludeList extends _i1.IncludeList {
  UsageRecordIncludeList._({
    _i1.WhereExpressionBuilder<UsageRecordTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(UsageRecord.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue> get table => UsageRecord.t;
}

class UsageRecordRepository {
  const UsageRecordRepository._();

  final attachRow = const UsageRecordAttachRowRepository._();

  final detachRow = const UsageRecordDetachRowRepository._();

  /// Returns a list of [UsageRecord]s matching the given query parameters.
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
  Future<List<UsageRecord>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UsageRecordTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UsageRecordTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UsageRecordTable>? orderByList,
    _i1.Transaction? transaction,
    UsageRecordInclude? include,
  }) async {
    return session.db.find<UsageRecord>(
      where: where?.call(UsageRecord.t),
      orderBy: orderBy?.call(UsageRecord.t),
      orderByList: orderByList?.call(UsageRecord.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [UsageRecord] matching the given query parameters.
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
  Future<UsageRecord?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UsageRecordTable>? where,
    int? offset,
    _i1.OrderByBuilder<UsageRecordTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UsageRecordTable>? orderByList,
    _i1.Transaction? transaction,
    UsageRecordInclude? include,
  }) async {
    return session.db.findFirstRow<UsageRecord>(
      where: where?.call(UsageRecord.t),
      orderBy: orderBy?.call(UsageRecord.t),
      orderByList: orderByList?.call(UsageRecord.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [UsageRecord] by its [id] or null if no such row exists.
  Future<UsageRecord?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
    UsageRecordInclude? include,
  }) async {
    return session.db.findById<UsageRecord>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [UsageRecord]s in the list and returns the inserted rows.
  ///
  /// The returned [UsageRecord]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<UsageRecord>> insert(
    _i1.Session session,
    List<UsageRecord> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<UsageRecord>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [UsageRecord] and returns the inserted row.
  ///
  /// The returned [UsageRecord] will have its `id` field set.
  Future<UsageRecord> insertRow(
    _i1.Session session,
    UsageRecord row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<UsageRecord>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [UsageRecord]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<UsageRecord>> update(
    _i1.Session session,
    List<UsageRecord> rows, {
    _i1.ColumnSelections<UsageRecordTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<UsageRecord>(
      rows,
      columns: columns?.call(UsageRecord.t),
      transaction: transaction,
    );
  }

  /// Updates a single [UsageRecord]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<UsageRecord> updateRow(
    _i1.Session session,
    UsageRecord row, {
    _i1.ColumnSelections<UsageRecordTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<UsageRecord>(
      row,
      columns: columns?.call(UsageRecord.t),
      transaction: transaction,
    );
  }

  /// Updates a single [UsageRecord] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<UsageRecord?> updateById(
    _i1.Session session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<UsageRecordUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<UsageRecord>(
      id,
      columnValues: columnValues(UsageRecord.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [UsageRecord]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<UsageRecord>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<UsageRecordUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<UsageRecordTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UsageRecordTable>? orderBy,
    _i1.OrderByListBuilder<UsageRecordTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<UsageRecord>(
      columnValues: columnValues(UsageRecord.t.updateTable),
      where: where(UsageRecord.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(UsageRecord.t),
      orderByList: orderByList?.call(UsageRecord.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [UsageRecord]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<UsageRecord>> delete(
    _i1.Session session,
    List<UsageRecord> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<UsageRecord>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [UsageRecord].
  Future<UsageRecord> deleteRow(
    _i1.Session session,
    UsageRecord row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<UsageRecord>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<UsageRecord>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<UsageRecordTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<UsageRecord>(
      where: where(UsageRecord.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UsageRecordTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<UsageRecord>(
      where: where?.call(UsageRecord.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class UsageRecordAttachRowRepository {
  const UsageRecordAttachRowRepository._();

  /// Creates a relation between the given [UsageRecord] and [VendorProfile]
  /// by setting the [UsageRecord]'s foreign key `vendorId` to refer to the [VendorProfile].
  Future<void> vendor(
    _i1.Session session,
    UsageRecord usageRecord,
    _i2.VendorProfile vendor, {
    _i1.Transaction? transaction,
  }) async {
    if (usageRecord.id == null) {
      throw ArgumentError.notNull('usageRecord.id');
    }
    if (vendor.id == null) {
      throw ArgumentError.notNull('vendor.id');
    }

    var $usageRecord = usageRecord.copyWith(vendorId: vendor.id);
    await session.db.updateRow<UsageRecord>(
      $usageRecord,
      columns: [UsageRecord.t.vendorId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [UsageRecord] and [SubscriptionInvoice]
  /// by setting the [UsageRecord]'s foreign key `invoiceId` to refer to the [SubscriptionInvoice].
  Future<void> invoice(
    _i1.Session session,
    UsageRecord usageRecord,
    _i3.SubscriptionInvoice invoice, {
    _i1.Transaction? transaction,
  }) async {
    if (usageRecord.id == null) {
      throw ArgumentError.notNull('usageRecord.id');
    }
    if (invoice.id == null) {
      throw ArgumentError.notNull('invoice.id');
    }

    var $usageRecord = usageRecord.copyWith(invoiceId: invoice.id);
    await session.db.updateRow<UsageRecord>(
      $usageRecord,
      columns: [UsageRecord.t.invoiceId],
      transaction: transaction,
    );
  }
}

class UsageRecordDetachRowRepository {
  const UsageRecordDetachRowRepository._();

  /// Detaches the relation between this [UsageRecord] and the [SubscriptionInvoice] set in `invoice`
  /// by setting the [UsageRecord]'s foreign key `invoiceId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> invoice(
    _i1.Session session,
    UsageRecord usageRecord, {
    _i1.Transaction? transaction,
  }) async {
    if (usageRecord.id == null) {
      throw ArgumentError.notNull('usageRecord.id');
    }

    var $usageRecord = usageRecord.copyWith(invoiceId: null);
    await session.db.updateRow<UsageRecord>(
      $usageRecord,
      columns: [UsageRecord.t.invoiceId],
      transaction: transaction,
    );
  }
}
