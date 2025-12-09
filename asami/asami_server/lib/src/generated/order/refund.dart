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
import '../order/order.dart' as _i2;
import '../order/order_item.dart' as _i3;
import '../order/payment_method.dart' as _i4;

abstract class Refund
    implements _i1.TableRow<_i1.UuidValue>, _i1.ProtocolSerialization {
  Refund._({
    _i1.UuidValue? id,
    required this.orderId,
    this.order,
    this.orderItemId,
    this.orderItem,
    required this.amount,
    String? currency,
    required this.reason,
    this.customerComment,
    String? status,
    bool? isApproved,
    this.approvedBy,
    this.approvedAt,
    required this.refundMethod,
    this.refundTransactionId,
    this.processedAt,
    this.vendorComment,
    this.rejectionReason,
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : id = id ?? _i1.Uuid().v4obj(),
        currency = currency ?? 'USD',
        status = status ?? 'requested',
        isApproved = isApproved ?? false,
        createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  factory Refund({
    _i1.UuidValue? id,
    required _i1.UuidValue orderId,
    _i2.Order? order,
    _i1.UuidValue? orderItemId,
    _i3.OrderItem? orderItem,
    required double amount,
    String? currency,
    required String reason,
    String? customerComment,
    String? status,
    bool? isApproved,
    String? approvedBy,
    DateTime? approvedAt,
    required _i4.PaymentMethod refundMethod,
    String? refundTransactionId,
    DateTime? processedAt,
    String? vendorComment,
    String? rejectionReason,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _RefundImpl;

  factory Refund.fromJson(Map<String, dynamic> jsonSerialization) {
    return Refund(
      id: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      orderId:
          _i1.UuidValueJsonExtension.fromJson(jsonSerialization['orderId']),
      order: jsonSerialization['order'] == null
          ? null
          : _i2.Order.fromJson(
              (jsonSerialization['order'] as Map<String, dynamic>)),
      orderItemId: jsonSerialization['orderItemId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(
              jsonSerialization['orderItemId']),
      orderItem: jsonSerialization['orderItem'] == null
          ? null
          : _i3.OrderItem.fromJson(
              (jsonSerialization['orderItem'] as Map<String, dynamic>)),
      amount: (jsonSerialization['amount'] as num).toDouble(),
      currency: jsonSerialization['currency'] as String,
      reason: jsonSerialization['reason'] as String,
      customerComment: jsonSerialization['customerComment'] as String?,
      status: jsonSerialization['status'] as String,
      isApproved: jsonSerialization['isApproved'] as bool,
      approvedBy: jsonSerialization['approvedBy'] as String?,
      approvedAt: jsonSerialization['approvedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['approvedAt']),
      refundMethod: _i4.PaymentMethod.fromJson(
          (jsonSerialization['refundMethod'] as int)),
      refundTransactionId: jsonSerialization['refundTransactionId'] as String?,
      processedAt: jsonSerialization['processedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['processedAt']),
      vendorComment: jsonSerialization['vendorComment'] as String?,
      rejectionReason: jsonSerialization['rejectionReason'] as String?,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  static final t = RefundTable();

  static const db = RefundRepository._();

  @override
  _i1.UuidValue id;

  _i1.UuidValue orderId;

  _i2.Order? order;

  _i1.UuidValue? orderItemId;

  _i3.OrderItem? orderItem;

  double amount;

  String currency;

  String reason;

  String? customerComment;

  String status;

  bool isApproved;

  String? approvedBy;

  DateTime? approvedAt;

  _i4.PaymentMethod refundMethod;

  String? refundTransactionId;

  DateTime? processedAt;

  String? vendorComment;

  String? rejectionReason;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _i1.Table<_i1.UuidValue> get table => t;

  /// Returns a shallow copy of this [Refund]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Refund copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? orderId,
    _i2.Order? order,
    _i1.UuidValue? orderItemId,
    _i3.OrderItem? orderItem,
    double? amount,
    String? currency,
    String? reason,
    String? customerComment,
    String? status,
    bool? isApproved,
    String? approvedBy,
    DateTime? approvedAt,
    _i4.PaymentMethod? refundMethod,
    String? refundTransactionId,
    DateTime? processedAt,
    String? vendorComment,
    String? rejectionReason,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'orderId': orderId.toJson(),
      if (order != null) 'order': order?.toJson(),
      if (orderItemId != null) 'orderItemId': orderItemId?.toJson(),
      if (orderItem != null) 'orderItem': orderItem?.toJson(),
      'amount': amount,
      'currency': currency,
      'reason': reason,
      if (customerComment != null) 'customerComment': customerComment,
      'status': status,
      'isApproved': isApproved,
      if (approvedBy != null) 'approvedBy': approvedBy,
      if (approvedAt != null) 'approvedAt': approvedAt?.toJson(),
      'refundMethod': refundMethod.toJson(),
      if (refundTransactionId != null)
        'refundTransactionId': refundTransactionId,
      if (processedAt != null) 'processedAt': processedAt?.toJson(),
      if (vendorComment != null) 'vendorComment': vendorComment,
      if (rejectionReason != null) 'rejectionReason': rejectionReason,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'id': id.toJson(),
      'orderId': orderId.toJson(),
      if (order != null) 'order': order?.toJsonForProtocol(),
      if (orderItemId != null) 'orderItemId': orderItemId?.toJson(),
      if (orderItem != null) 'orderItem': orderItem?.toJsonForProtocol(),
      'amount': amount,
      'currency': currency,
      'reason': reason,
      if (customerComment != null) 'customerComment': customerComment,
      'status': status,
      'isApproved': isApproved,
      if (approvedBy != null) 'approvedBy': approvedBy,
      if (approvedAt != null) 'approvedAt': approvedAt?.toJson(),
      'refundMethod': refundMethod.toJson(),
      if (refundTransactionId != null)
        'refundTransactionId': refundTransactionId,
      if (processedAt != null) 'processedAt': processedAt?.toJson(),
      if (vendorComment != null) 'vendorComment': vendorComment,
      if (rejectionReason != null) 'rejectionReason': rejectionReason,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static RefundInclude include({
    _i2.OrderInclude? order,
    _i3.OrderItemInclude? orderItem,
  }) {
    return RefundInclude._(
      order: order,
      orderItem: orderItem,
    );
  }

  static RefundIncludeList includeList({
    _i1.WhereExpressionBuilder<RefundTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RefundTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RefundTable>? orderByList,
    RefundInclude? include,
  }) {
    return RefundIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Refund.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Refund.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RefundImpl extends Refund {
  _RefundImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue orderId,
    _i2.Order? order,
    _i1.UuidValue? orderItemId,
    _i3.OrderItem? orderItem,
    required double amount,
    String? currency,
    required String reason,
    String? customerComment,
    String? status,
    bool? isApproved,
    String? approvedBy,
    DateTime? approvedAt,
    required _i4.PaymentMethod refundMethod,
    String? refundTransactionId,
    DateTime? processedAt,
    String? vendorComment,
    String? rejectionReason,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
          id: id,
          orderId: orderId,
          order: order,
          orderItemId: orderItemId,
          orderItem: orderItem,
          amount: amount,
          currency: currency,
          reason: reason,
          customerComment: customerComment,
          status: status,
          isApproved: isApproved,
          approvedBy: approvedBy,
          approvedAt: approvedAt,
          refundMethod: refundMethod,
          refundTransactionId: refundTransactionId,
          processedAt: processedAt,
          vendorComment: vendorComment,
          rejectionReason: rejectionReason,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  /// Returns a shallow copy of this [Refund]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Refund copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? orderId,
    Object? order = _Undefined,
    Object? orderItemId = _Undefined,
    Object? orderItem = _Undefined,
    double? amount,
    String? currency,
    String? reason,
    Object? customerComment = _Undefined,
    String? status,
    bool? isApproved,
    Object? approvedBy = _Undefined,
    Object? approvedAt = _Undefined,
    _i4.PaymentMethod? refundMethod,
    Object? refundTransactionId = _Undefined,
    Object? processedAt = _Undefined,
    Object? vendorComment = _Undefined,
    Object? rejectionReason = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Refund(
      id: id ?? this.id,
      orderId: orderId ?? this.orderId,
      order: order is _i2.Order? ? order : this.order?.copyWith(),
      orderItemId:
          orderItemId is _i1.UuidValue? ? orderItemId : this.orderItemId,
      orderItem:
          orderItem is _i3.OrderItem? ? orderItem : this.orderItem?.copyWith(),
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      reason: reason ?? this.reason,
      customerComment:
          customerComment is String? ? customerComment : this.customerComment,
      status: status ?? this.status,
      isApproved: isApproved ?? this.isApproved,
      approvedBy: approvedBy is String? ? approvedBy : this.approvedBy,
      approvedAt: approvedAt is DateTime? ? approvedAt : this.approvedAt,
      refundMethod: refundMethod ?? this.refundMethod,
      refundTransactionId: refundTransactionId is String?
          ? refundTransactionId
          : this.refundTransactionId,
      processedAt: processedAt is DateTime? ? processedAt : this.processedAt,
      vendorComment:
          vendorComment is String? ? vendorComment : this.vendorComment,
      rejectionReason:
          rejectionReason is String? ? rejectionReason : this.rejectionReason,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class RefundTable extends _i1.Table<_i1.UuidValue> {
  RefundTable({super.tableRelation}) : super(tableName: 'refunds') {
    orderId = _i1.ColumnUuid(
      'orderId',
      this,
    );
    orderItemId = _i1.ColumnUuid(
      'orderItemId',
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
    reason = _i1.ColumnString(
      'reason',
      this,
    );
    customerComment = _i1.ColumnString(
      'customerComment',
      this,
    );
    status = _i1.ColumnString(
      'status',
      this,
      hasDefault: true,
    );
    isApproved = _i1.ColumnBool(
      'isApproved',
      this,
      hasDefault: true,
    );
    approvedBy = _i1.ColumnString(
      'approvedBy',
      this,
    );
    approvedAt = _i1.ColumnDateTime(
      'approvedAt',
      this,
    );
    refundMethod = _i1.ColumnEnum(
      'refundMethod',
      this,
      _i1.EnumSerialization.byIndex,
    );
    refundTransactionId = _i1.ColumnString(
      'refundTransactionId',
      this,
    );
    processedAt = _i1.ColumnDateTime(
      'processedAt',
      this,
    );
    vendorComment = _i1.ColumnString(
      'vendorComment',
      this,
    );
    rejectionReason = _i1.ColumnString(
      'rejectionReason',
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

  late final _i1.ColumnUuid orderId;

  _i2.OrderTable? _order;

  late final _i1.ColumnUuid orderItemId;

  _i3.OrderItemTable? _orderItem;

  late final _i1.ColumnDouble amount;

  late final _i1.ColumnString currency;

  late final _i1.ColumnString reason;

  late final _i1.ColumnString customerComment;

  late final _i1.ColumnString status;

  late final _i1.ColumnBool isApproved;

  late final _i1.ColumnString approvedBy;

  late final _i1.ColumnDateTime approvedAt;

  late final _i1.ColumnEnum<_i4.PaymentMethod> refundMethod;

  late final _i1.ColumnString refundTransactionId;

  late final _i1.ColumnDateTime processedAt;

  late final _i1.ColumnString vendorComment;

  late final _i1.ColumnString rejectionReason;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  _i2.OrderTable get order {
    if (_order != null) return _order!;
    _order = _i1.createRelationTable(
      relationFieldName: 'order',
      field: Refund.t.orderId,
      foreignField: _i2.Order.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.OrderTable(tableRelation: foreignTableRelation),
    );
    return _order!;
  }

  _i3.OrderItemTable get orderItem {
    if (_orderItem != null) return _orderItem!;
    _orderItem = _i1.createRelationTable(
      relationFieldName: 'orderItem',
      field: Refund.t.orderItemId,
      foreignField: _i3.OrderItem.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.OrderItemTable(tableRelation: foreignTableRelation),
    );
    return _orderItem!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        orderId,
        orderItemId,
        amount,
        currency,
        reason,
        customerComment,
        status,
        isApproved,
        approvedBy,
        approvedAt,
        refundMethod,
        refundTransactionId,
        processedAt,
        vendorComment,
        rejectionReason,
        createdAt,
        updatedAt,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'order') {
      return order;
    }
    if (relationField == 'orderItem') {
      return orderItem;
    }
    return null;
  }
}

class RefundInclude extends _i1.IncludeObject {
  RefundInclude._({
    _i2.OrderInclude? order,
    _i3.OrderItemInclude? orderItem,
  }) {
    _order = order;
    _orderItem = orderItem;
  }

  _i2.OrderInclude? _order;

  _i3.OrderItemInclude? _orderItem;

  @override
  Map<String, _i1.Include?> get includes => {
        'order': _order,
        'orderItem': _orderItem,
      };

  @override
  _i1.Table<_i1.UuidValue> get table => Refund.t;
}

class RefundIncludeList extends _i1.IncludeList {
  RefundIncludeList._({
    _i1.WhereExpressionBuilder<RefundTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Refund.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue> get table => Refund.t;
}

class RefundRepository {
  const RefundRepository._();

  final attachRow = const RefundAttachRowRepository._();

  final detachRow = const RefundDetachRowRepository._();

  /// Returns a list of [Refund]s matching the given query parameters.
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
  Future<List<Refund>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RefundTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RefundTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RefundTable>? orderByList,
    _i1.Transaction? transaction,
    RefundInclude? include,
  }) async {
    return session.db.find<Refund>(
      where: where?.call(Refund.t),
      orderBy: orderBy?.call(Refund.t),
      orderByList: orderByList?.call(Refund.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Refund] matching the given query parameters.
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
  Future<Refund?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RefundTable>? where,
    int? offset,
    _i1.OrderByBuilder<RefundTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RefundTable>? orderByList,
    _i1.Transaction? transaction,
    RefundInclude? include,
  }) async {
    return session.db.findFirstRow<Refund>(
      where: where?.call(Refund.t),
      orderBy: orderBy?.call(Refund.t),
      orderByList: orderByList?.call(Refund.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Refund] by its [id] or null if no such row exists.
  Future<Refund?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
    RefundInclude? include,
  }) async {
    return session.db.findById<Refund>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Refund]s in the list and returns the inserted rows.
  ///
  /// The returned [Refund]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Refund>> insert(
    _i1.Session session,
    List<Refund> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Refund>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Refund] and returns the inserted row.
  ///
  /// The returned [Refund] will have its `id` field set.
  Future<Refund> insertRow(
    _i1.Session session,
    Refund row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Refund>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Refund]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Refund>> update(
    _i1.Session session,
    List<Refund> rows, {
    _i1.ColumnSelections<RefundTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Refund>(
      rows,
      columns: columns?.call(Refund.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Refund]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Refund> updateRow(
    _i1.Session session,
    Refund row, {
    _i1.ColumnSelections<RefundTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Refund>(
      row,
      columns: columns?.call(Refund.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Refund]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Refund>> delete(
    _i1.Session session,
    List<Refund> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Refund>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Refund].
  Future<Refund> deleteRow(
    _i1.Session session,
    Refund row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Refund>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Refund>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<RefundTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Refund>(
      where: where(Refund.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RefundTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Refund>(
      where: where?.call(Refund.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class RefundAttachRowRepository {
  const RefundAttachRowRepository._();

  /// Creates a relation between the given [Refund] and [Order]
  /// by setting the [Refund]'s foreign key `orderId` to refer to the [Order].
  Future<void> order(
    _i1.Session session,
    Refund refund,
    _i2.Order order, {
    _i1.Transaction? transaction,
  }) async {
    if (refund.id == null) {
      throw ArgumentError.notNull('refund.id');
    }
    if (order.id == null) {
      throw ArgumentError.notNull('order.id');
    }

    var $refund = refund.copyWith(orderId: order.id);
    await session.db.updateRow<Refund>(
      $refund,
      columns: [Refund.t.orderId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [Refund] and [OrderItem]
  /// by setting the [Refund]'s foreign key `orderItemId` to refer to the [OrderItem].
  Future<void> orderItem(
    _i1.Session session,
    Refund refund,
    _i3.OrderItem orderItem, {
    _i1.Transaction? transaction,
  }) async {
    if (refund.id == null) {
      throw ArgumentError.notNull('refund.id');
    }
    if (orderItem.id == null) {
      throw ArgumentError.notNull('orderItem.id');
    }

    var $refund = refund.copyWith(orderItemId: orderItem.id);
    await session.db.updateRow<Refund>(
      $refund,
      columns: [Refund.t.orderItemId],
      transaction: transaction,
    );
  }
}

class RefundDetachRowRepository {
  const RefundDetachRowRepository._();

  /// Detaches the relation between this [Refund] and the [OrderItem] set in `orderItem`
  /// by setting the [Refund]'s foreign key `orderItemId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> orderItem(
    _i1.Session session,
    Refund refund, {
    _i1.Transaction? transaction,
  }) async {
    if (refund.id == null) {
      throw ArgumentError.notNull('refund.id');
    }

    var $refund = refund.copyWith(orderItemId: null);
    await session.db.updateRow<Refund>(
      $refund,
      columns: [Refund.t.orderItemId],
      transaction: transaction,
    );
  }
}
