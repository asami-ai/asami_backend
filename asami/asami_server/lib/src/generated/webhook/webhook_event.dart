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
import '../order/payment_transaction.dart' as _i2;
import 'package:asami_server/src/generated/protocol.dart' as _i3;

abstract class WebhookEvent
    implements _i1.TableRow<_i1.UuidValue>, _i1.ProtocolSerialization {
  WebhookEvent._({
    _i1.UuidValue? id,
    required this.eventType,
    this.eventId,
    this.paymentTransactionId,
    this.paymentTransaction,
    this.transactionReference,
    required this.rawPayload,
    this.processedPayload,
    String? status,
    this.processedAt,
    int? retryCount,
    this.lastRetryAt,
    this.errorMessage,
    bool? isVerified,
    this.verifiedAt,
    String? source,
    this.ipAddress,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : id = id ?? _i1.Uuid().v4obj(),
       status = status ?? 'received',
       retryCount = retryCount ?? 0,
       isVerified = isVerified ?? false,
       source = source ?? 'paystack',
       createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory WebhookEvent({
    _i1.UuidValue? id,
    required String eventType,
    String? eventId,
    _i1.UuidValue? paymentTransactionId,
    _i2.PaymentTransaction? paymentTransaction,
    String? transactionReference,
    required String rawPayload,
    String? processedPayload,
    String? status,
    DateTime? processedAt,
    int? retryCount,
    DateTime? lastRetryAt,
    String? errorMessage,
    bool? isVerified,
    DateTime? verifiedAt,
    String? source,
    String? ipAddress,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _WebhookEventImpl;

  factory WebhookEvent.fromJson(Map<String, dynamic> jsonSerialization) {
    return WebhookEvent(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      eventType: jsonSerialization['eventType'] as String,
      eventId: jsonSerialization['eventId'] as String?,
      paymentTransactionId: jsonSerialization['paymentTransactionId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(
              jsonSerialization['paymentTransactionId'],
            ),
      paymentTransaction: jsonSerialization['paymentTransaction'] == null
          ? null
          : _i3.Protocol().deserialize<_i2.PaymentTransaction>(
              jsonSerialization['paymentTransaction'],
            ),
      transactionReference:
          jsonSerialization['transactionReference'] as String?,
      rawPayload: jsonSerialization['rawPayload'] as String,
      processedPayload: jsonSerialization['processedPayload'] as String?,
      status: jsonSerialization['status'] as String?,
      processedAt: jsonSerialization['processedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['processedAt'],
            ),
      retryCount: jsonSerialization['retryCount'] as int?,
      lastRetryAt: jsonSerialization['lastRetryAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastRetryAt'],
            ),
      errorMessage: jsonSerialization['errorMessage'] as String?,
      isVerified: jsonSerialization['isVerified'] as bool?,
      verifiedAt: jsonSerialization['verifiedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['verifiedAt']),
      source: jsonSerialization['source'] as String?,
      ipAddress: jsonSerialization['ipAddress'] as String?,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  static final t = WebhookEventTable();

  static const db = WebhookEventRepository._();

  @override
  _i1.UuidValue id;

  String eventType;

  String? eventId;

  _i1.UuidValue? paymentTransactionId;

  _i2.PaymentTransaction? paymentTransaction;

  String? transactionReference;

  String rawPayload;

  String? processedPayload;

  String status;

  DateTime? processedAt;

  int retryCount;

  DateTime? lastRetryAt;

  String? errorMessage;

  bool isVerified;

  DateTime? verifiedAt;

  String source;

  String? ipAddress;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _i1.Table<_i1.UuidValue> get table => t;

  /// Returns a shallow copy of this [WebhookEvent]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  WebhookEvent copyWith({
    _i1.UuidValue? id,
    String? eventType,
    String? eventId,
    _i1.UuidValue? paymentTransactionId,
    _i2.PaymentTransaction? paymentTransaction,
    String? transactionReference,
    String? rawPayload,
    String? processedPayload,
    String? status,
    DateTime? processedAt,
    int? retryCount,
    DateTime? lastRetryAt,
    String? errorMessage,
    bool? isVerified,
    DateTime? verifiedAt,
    String? source,
    String? ipAddress,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'WebhookEvent',
      'id': id.toJson(),
      'eventType': eventType,
      if (eventId != null) 'eventId': eventId,
      if (paymentTransactionId != null)
        'paymentTransactionId': paymentTransactionId?.toJson(),
      if (paymentTransaction != null)
        'paymentTransaction': paymentTransaction?.toJson(),
      if (transactionReference != null)
        'transactionReference': transactionReference,
      'rawPayload': rawPayload,
      if (processedPayload != null) 'processedPayload': processedPayload,
      'status': status,
      if (processedAt != null) 'processedAt': processedAt?.toJson(),
      'retryCount': retryCount,
      if (lastRetryAt != null) 'lastRetryAt': lastRetryAt?.toJson(),
      if (errorMessage != null) 'errorMessage': errorMessage,
      'isVerified': isVerified,
      if (verifiedAt != null) 'verifiedAt': verifiedAt?.toJson(),
      'source': source,
      if (ipAddress != null) 'ipAddress': ipAddress,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'WebhookEvent',
      'id': id.toJson(),
      'eventType': eventType,
      if (eventId != null) 'eventId': eventId,
      if (paymentTransactionId != null)
        'paymentTransactionId': paymentTransactionId?.toJson(),
      if (paymentTransaction != null)
        'paymentTransaction': paymentTransaction?.toJsonForProtocol(),
      if (transactionReference != null)
        'transactionReference': transactionReference,
      'rawPayload': rawPayload,
      if (processedPayload != null) 'processedPayload': processedPayload,
      'status': status,
      if (processedAt != null) 'processedAt': processedAt?.toJson(),
      'retryCount': retryCount,
      if (lastRetryAt != null) 'lastRetryAt': lastRetryAt?.toJson(),
      if (errorMessage != null) 'errorMessage': errorMessage,
      'isVerified': isVerified,
      if (verifiedAt != null) 'verifiedAt': verifiedAt?.toJson(),
      'source': source,
      if (ipAddress != null) 'ipAddress': ipAddress,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static WebhookEventInclude include({
    _i2.PaymentTransactionInclude? paymentTransaction,
  }) {
    return WebhookEventInclude._(paymentTransaction: paymentTransaction);
  }

  static WebhookEventIncludeList includeList({
    _i1.WhereExpressionBuilder<WebhookEventTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<WebhookEventTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<WebhookEventTable>? orderByList,
    WebhookEventInclude? include,
  }) {
    return WebhookEventIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(WebhookEvent.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(WebhookEvent.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _WebhookEventImpl extends WebhookEvent {
  _WebhookEventImpl({
    _i1.UuidValue? id,
    required String eventType,
    String? eventId,
    _i1.UuidValue? paymentTransactionId,
    _i2.PaymentTransaction? paymentTransaction,
    String? transactionReference,
    required String rawPayload,
    String? processedPayload,
    String? status,
    DateTime? processedAt,
    int? retryCount,
    DateTime? lastRetryAt,
    String? errorMessage,
    bool? isVerified,
    DateTime? verifiedAt,
    String? source,
    String? ipAddress,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         eventType: eventType,
         eventId: eventId,
         paymentTransactionId: paymentTransactionId,
         paymentTransaction: paymentTransaction,
         transactionReference: transactionReference,
         rawPayload: rawPayload,
         processedPayload: processedPayload,
         status: status,
         processedAt: processedAt,
         retryCount: retryCount,
         lastRetryAt: lastRetryAt,
         errorMessage: errorMessage,
         isVerified: isVerified,
         verifiedAt: verifiedAt,
         source: source,
         ipAddress: ipAddress,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [WebhookEvent]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  WebhookEvent copyWith({
    _i1.UuidValue? id,
    String? eventType,
    Object? eventId = _Undefined,
    Object? paymentTransactionId = _Undefined,
    Object? paymentTransaction = _Undefined,
    Object? transactionReference = _Undefined,
    String? rawPayload,
    Object? processedPayload = _Undefined,
    String? status,
    Object? processedAt = _Undefined,
    int? retryCount,
    Object? lastRetryAt = _Undefined,
    Object? errorMessage = _Undefined,
    bool? isVerified,
    Object? verifiedAt = _Undefined,
    String? source,
    Object? ipAddress = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return WebhookEvent(
      id: id ?? this.id,
      eventType: eventType ?? this.eventType,
      eventId: eventId is String? ? eventId : this.eventId,
      paymentTransactionId: paymentTransactionId is _i1.UuidValue?
          ? paymentTransactionId
          : this.paymentTransactionId,
      paymentTransaction: paymentTransaction is _i2.PaymentTransaction?
          ? paymentTransaction
          : this.paymentTransaction?.copyWith(),
      transactionReference: transactionReference is String?
          ? transactionReference
          : this.transactionReference,
      rawPayload: rawPayload ?? this.rawPayload,
      processedPayload: processedPayload is String?
          ? processedPayload
          : this.processedPayload,
      status: status ?? this.status,
      processedAt: processedAt is DateTime? ? processedAt : this.processedAt,
      retryCount: retryCount ?? this.retryCount,
      lastRetryAt: lastRetryAt is DateTime? ? lastRetryAt : this.lastRetryAt,
      errorMessage: errorMessage is String? ? errorMessage : this.errorMessage,
      isVerified: isVerified ?? this.isVerified,
      verifiedAt: verifiedAt is DateTime? ? verifiedAt : this.verifiedAt,
      source: source ?? this.source,
      ipAddress: ipAddress is String? ? ipAddress : this.ipAddress,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class WebhookEventUpdateTable extends _i1.UpdateTable<WebhookEventTable> {
  WebhookEventUpdateTable(super.table);

  _i1.ColumnValue<String, String> eventType(String value) => _i1.ColumnValue(
    table.eventType,
    value,
  );

  _i1.ColumnValue<String, String> eventId(String? value) => _i1.ColumnValue(
    table.eventId,
    value,
  );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> paymentTransactionId(
    _i1.UuidValue? value,
  ) => _i1.ColumnValue(
    table.paymentTransactionId,
    value,
  );

  _i1.ColumnValue<String, String> transactionReference(String? value) =>
      _i1.ColumnValue(
        table.transactionReference,
        value,
      );

  _i1.ColumnValue<String, String> rawPayload(String value) => _i1.ColumnValue(
    table.rawPayload,
    value,
  );

  _i1.ColumnValue<String, String> processedPayload(String? value) =>
      _i1.ColumnValue(
        table.processedPayload,
        value,
      );

  _i1.ColumnValue<String, String> status(String value) => _i1.ColumnValue(
    table.status,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> processedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.processedAt,
        value,
      );

  _i1.ColumnValue<int, int> retryCount(int value) => _i1.ColumnValue(
    table.retryCount,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> lastRetryAt(DateTime? value) =>
      _i1.ColumnValue(
        table.lastRetryAt,
        value,
      );

  _i1.ColumnValue<String, String> errorMessage(String? value) =>
      _i1.ColumnValue(
        table.errorMessage,
        value,
      );

  _i1.ColumnValue<bool, bool> isVerified(bool value) => _i1.ColumnValue(
    table.isVerified,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> verifiedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.verifiedAt,
        value,
      );

  _i1.ColumnValue<String, String> source(String value) => _i1.ColumnValue(
    table.source,
    value,
  );

  _i1.ColumnValue<String, String> ipAddress(String? value) => _i1.ColumnValue(
    table.ipAddress,
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

class WebhookEventTable extends _i1.Table<_i1.UuidValue> {
  WebhookEventTable({super.tableRelation})
    : super(tableName: 'webhook_events') {
    updateTable = WebhookEventUpdateTable(this);
    eventType = _i1.ColumnString(
      'eventType',
      this,
    );
    eventId = _i1.ColumnString(
      'eventId',
      this,
    );
    paymentTransactionId = _i1.ColumnUuid(
      'paymentTransactionId',
      this,
    );
    transactionReference = _i1.ColumnString(
      'transactionReference',
      this,
    );
    rawPayload = _i1.ColumnString(
      'rawPayload',
      this,
    );
    processedPayload = _i1.ColumnString(
      'processedPayload',
      this,
    );
    status = _i1.ColumnString(
      'status',
      this,
      hasDefault: true,
    );
    processedAt = _i1.ColumnDateTime(
      'processedAt',
      this,
    );
    retryCount = _i1.ColumnInt(
      'retryCount',
      this,
      hasDefault: true,
    );
    lastRetryAt = _i1.ColumnDateTime(
      'lastRetryAt',
      this,
    );
    errorMessage = _i1.ColumnString(
      'errorMessage',
      this,
    );
    isVerified = _i1.ColumnBool(
      'isVerified',
      this,
      hasDefault: true,
    );
    verifiedAt = _i1.ColumnDateTime(
      'verifiedAt',
      this,
    );
    source = _i1.ColumnString(
      'source',
      this,
      hasDefault: true,
    );
    ipAddress = _i1.ColumnString(
      'ipAddress',
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

  late final WebhookEventUpdateTable updateTable;

  late final _i1.ColumnString eventType;

  late final _i1.ColumnString eventId;

  late final _i1.ColumnUuid paymentTransactionId;

  _i2.PaymentTransactionTable? _paymentTransaction;

  late final _i1.ColumnString transactionReference;

  late final _i1.ColumnString rawPayload;

  late final _i1.ColumnString processedPayload;

  late final _i1.ColumnString status;

  late final _i1.ColumnDateTime processedAt;

  late final _i1.ColumnInt retryCount;

  late final _i1.ColumnDateTime lastRetryAt;

  late final _i1.ColumnString errorMessage;

  late final _i1.ColumnBool isVerified;

  late final _i1.ColumnDateTime verifiedAt;

  late final _i1.ColumnString source;

  late final _i1.ColumnString ipAddress;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  _i2.PaymentTransactionTable get paymentTransaction {
    if (_paymentTransaction != null) return _paymentTransaction!;
    _paymentTransaction = _i1.createRelationTable(
      relationFieldName: 'paymentTransaction',
      field: WebhookEvent.t.paymentTransactionId,
      foreignField: _i2.PaymentTransaction.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.PaymentTransactionTable(tableRelation: foreignTableRelation),
    );
    return _paymentTransaction!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    eventType,
    eventId,
    paymentTransactionId,
    transactionReference,
    rawPayload,
    processedPayload,
    status,
    processedAt,
    retryCount,
    lastRetryAt,
    errorMessage,
    isVerified,
    verifiedAt,
    source,
    ipAddress,
    createdAt,
    updatedAt,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'paymentTransaction') {
      return paymentTransaction;
    }
    return null;
  }
}

class WebhookEventInclude extends _i1.IncludeObject {
  WebhookEventInclude._({_i2.PaymentTransactionInclude? paymentTransaction}) {
    _paymentTransaction = paymentTransaction;
  }

  _i2.PaymentTransactionInclude? _paymentTransaction;

  @override
  Map<String, _i1.Include?> get includes => {
    'paymentTransaction': _paymentTransaction,
  };

  @override
  _i1.Table<_i1.UuidValue> get table => WebhookEvent.t;
}

class WebhookEventIncludeList extends _i1.IncludeList {
  WebhookEventIncludeList._({
    _i1.WhereExpressionBuilder<WebhookEventTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(WebhookEvent.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue> get table => WebhookEvent.t;
}

class WebhookEventRepository {
  const WebhookEventRepository._();

  final attachRow = const WebhookEventAttachRowRepository._();

  final detachRow = const WebhookEventDetachRowRepository._();

  /// Returns a list of [WebhookEvent]s matching the given query parameters.
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
  Future<List<WebhookEvent>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<WebhookEventTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<WebhookEventTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<WebhookEventTable>? orderByList,
    _i1.Transaction? transaction,
    WebhookEventInclude? include,
  }) async {
    return session.db.find<WebhookEvent>(
      where: where?.call(WebhookEvent.t),
      orderBy: orderBy?.call(WebhookEvent.t),
      orderByList: orderByList?.call(WebhookEvent.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [WebhookEvent] matching the given query parameters.
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
  Future<WebhookEvent?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<WebhookEventTable>? where,
    int? offset,
    _i1.OrderByBuilder<WebhookEventTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<WebhookEventTable>? orderByList,
    _i1.Transaction? transaction,
    WebhookEventInclude? include,
  }) async {
    return session.db.findFirstRow<WebhookEvent>(
      where: where?.call(WebhookEvent.t),
      orderBy: orderBy?.call(WebhookEvent.t),
      orderByList: orderByList?.call(WebhookEvent.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [WebhookEvent] by its [id] or null if no such row exists.
  Future<WebhookEvent?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
    WebhookEventInclude? include,
  }) async {
    return session.db.findById<WebhookEvent>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [WebhookEvent]s in the list and returns the inserted rows.
  ///
  /// The returned [WebhookEvent]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<WebhookEvent>> insert(
    _i1.Session session,
    List<WebhookEvent> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<WebhookEvent>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [WebhookEvent] and returns the inserted row.
  ///
  /// The returned [WebhookEvent] will have its `id` field set.
  Future<WebhookEvent> insertRow(
    _i1.Session session,
    WebhookEvent row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<WebhookEvent>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [WebhookEvent]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<WebhookEvent>> update(
    _i1.Session session,
    List<WebhookEvent> rows, {
    _i1.ColumnSelections<WebhookEventTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<WebhookEvent>(
      rows,
      columns: columns?.call(WebhookEvent.t),
      transaction: transaction,
    );
  }

  /// Updates a single [WebhookEvent]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<WebhookEvent> updateRow(
    _i1.Session session,
    WebhookEvent row, {
    _i1.ColumnSelections<WebhookEventTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<WebhookEvent>(
      row,
      columns: columns?.call(WebhookEvent.t),
      transaction: transaction,
    );
  }

  /// Updates a single [WebhookEvent] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<WebhookEvent?> updateById(
    _i1.Session session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<WebhookEventUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<WebhookEvent>(
      id,
      columnValues: columnValues(WebhookEvent.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [WebhookEvent]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<WebhookEvent>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<WebhookEventUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<WebhookEventTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<WebhookEventTable>? orderBy,
    _i1.OrderByListBuilder<WebhookEventTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<WebhookEvent>(
      columnValues: columnValues(WebhookEvent.t.updateTable),
      where: where(WebhookEvent.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(WebhookEvent.t),
      orderByList: orderByList?.call(WebhookEvent.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [WebhookEvent]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<WebhookEvent>> delete(
    _i1.Session session,
    List<WebhookEvent> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<WebhookEvent>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [WebhookEvent].
  Future<WebhookEvent> deleteRow(
    _i1.Session session,
    WebhookEvent row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<WebhookEvent>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<WebhookEvent>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<WebhookEventTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<WebhookEvent>(
      where: where(WebhookEvent.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<WebhookEventTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<WebhookEvent>(
      where: where?.call(WebhookEvent.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class WebhookEventAttachRowRepository {
  const WebhookEventAttachRowRepository._();

  /// Creates a relation between the given [WebhookEvent] and [PaymentTransaction]
  /// by setting the [WebhookEvent]'s foreign key `paymentTransactionId` to refer to the [PaymentTransaction].
  Future<void> paymentTransaction(
    _i1.Session session,
    WebhookEvent webhookEvent,
    _i2.PaymentTransaction paymentTransaction, {
    _i1.Transaction? transaction,
  }) async {
    if (webhookEvent.id == null) {
      throw ArgumentError.notNull('webhookEvent.id');
    }
    if (paymentTransaction.id == null) {
      throw ArgumentError.notNull('paymentTransaction.id');
    }

    var $webhookEvent = webhookEvent.copyWith(
      paymentTransactionId: paymentTransaction.id,
    );
    await session.db.updateRow<WebhookEvent>(
      $webhookEvent,
      columns: [WebhookEvent.t.paymentTransactionId],
      transaction: transaction,
    );
  }
}

class WebhookEventDetachRowRepository {
  const WebhookEventDetachRowRepository._();

  /// Detaches the relation between this [WebhookEvent] and the [PaymentTransaction] set in `paymentTransaction`
  /// by setting the [WebhookEvent]'s foreign key `paymentTransactionId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> paymentTransaction(
    _i1.Session session,
    WebhookEvent webhookEvent, {
    _i1.Transaction? transaction,
  }) async {
    if (webhookEvent.id == null) {
      throw ArgumentError.notNull('webhookEvent.id');
    }

    var $webhookEvent = webhookEvent.copyWith(paymentTransactionId: null);
    await session.db.updateRow<WebhookEvent>(
      $webhookEvent,
      columns: [WebhookEvent.t.paymentTransactionId],
      transaction: transaction,
    );
  }
}
