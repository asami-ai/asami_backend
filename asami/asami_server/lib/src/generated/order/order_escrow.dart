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
import '../order/order.dart' as _i2;
import '../order/wallet_enums/escrow_status.dart' as _i3;
import 'package:asami_server/src/generated/protocol.dart' as _i4;

abstract class OrderEscrow
    implements _i1.TableRow<_i1.UuidValue>, _i1.ProtocolSerialization {
  OrderEscrow._({
    _i1.UuidValue? id,
    required this.orderId,
    this.order,
    required this.vendorId,
    required this.customerId,
    required this.totalAmount,
    required this.vendorEarnings,
    required this.platformFee,
    required this.paystackFee,
    required this.status,
    this.expectedDeliveryDate,
    required this.deliveryDeadline,
    this.markedDeliveredAt,
    this.customerAcknowledgedAt,
    this.returnWindowStart,
    this.returnWindowEnd,
    bool? isReturnWindowActive,
    bool? isReturnWindowExpired,
    bool? canRelease,
    this.releaseScheduledAt,
    this.releasedAt,
    this.releaseReason,
    bool? hasActiveReturn,
    this.returnRequestedAt,
    this.refundProcessedAt,
    bool? isAutoReleased,
    bool? isManuallyReleased,
    bool? isRefunded,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : id = id ?? _i1.Uuid().v4obj(),
       isReturnWindowActive = isReturnWindowActive ?? false,
       isReturnWindowExpired = isReturnWindowExpired ?? false,
       canRelease = canRelease ?? false,
       hasActiveReturn = hasActiveReturn ?? false,
       isAutoReleased = isAutoReleased ?? false,
       isManuallyReleased = isManuallyReleased ?? false,
       isRefunded = isRefunded ?? false,
       createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory OrderEscrow({
    _i1.UuidValue? id,
    required _i1.UuidValue orderId,
    _i2.Order? order,
    required _i1.UuidValue vendorId,
    required _i1.UuidValue customerId,
    required double totalAmount,
    required double vendorEarnings,
    required double platformFee,
    required double paystackFee,
    required _i3.EscrowStatus status,
    DateTime? expectedDeliveryDate,
    required DateTime deliveryDeadline,
    DateTime? markedDeliveredAt,
    DateTime? customerAcknowledgedAt,
    DateTime? returnWindowStart,
    DateTime? returnWindowEnd,
    bool? isReturnWindowActive,
    bool? isReturnWindowExpired,
    bool? canRelease,
    DateTime? releaseScheduledAt,
    DateTime? releasedAt,
    String? releaseReason,
    bool? hasActiveReturn,
    DateTime? returnRequestedAt,
    DateTime? refundProcessedAt,
    bool? isAutoReleased,
    bool? isManuallyReleased,
    bool? isRefunded,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _OrderEscrowImpl;

  factory OrderEscrow.fromJson(Map<String, dynamic> jsonSerialization) {
    return OrderEscrow(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      orderId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['orderId'],
      ),
      order: jsonSerialization['order'] == null
          ? null
          : _i4.Protocol().deserialize<_i2.Order>(jsonSerialization['order']),
      vendorId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['vendorId'],
      ),
      customerId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['customerId'],
      ),
      totalAmount: (jsonSerialization['totalAmount'] as num).toDouble(),
      vendorEarnings: (jsonSerialization['vendorEarnings'] as num).toDouble(),
      platformFee: (jsonSerialization['platformFee'] as num).toDouble(),
      paystackFee: (jsonSerialization['paystackFee'] as num).toDouble(),
      status: _i3.EscrowStatus.fromJson(
        (jsonSerialization['status'] as String),
      ),
      expectedDeliveryDate: jsonSerialization['expectedDeliveryDate'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['expectedDeliveryDate'],
            ),
      deliveryDeadline: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['deliveryDeadline'],
      ),
      markedDeliveredAt: jsonSerialization['markedDeliveredAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['markedDeliveredAt'],
            ),
      customerAcknowledgedAt:
          jsonSerialization['customerAcknowledgedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['customerAcknowledgedAt'],
            ),
      returnWindowStart: jsonSerialization['returnWindowStart'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['returnWindowStart'],
            ),
      returnWindowEnd: jsonSerialization['returnWindowEnd'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['returnWindowEnd'],
            ),
      isReturnWindowActive: jsonSerialization['isReturnWindowActive'] as bool?,
      isReturnWindowExpired:
          jsonSerialization['isReturnWindowExpired'] as bool?,
      canRelease: jsonSerialization['canRelease'] as bool?,
      releaseScheduledAt: jsonSerialization['releaseScheduledAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['releaseScheduledAt'],
            ),
      releasedAt: jsonSerialization['releasedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['releasedAt']),
      releaseReason: jsonSerialization['releaseReason'] as String?,
      hasActiveReturn: jsonSerialization['hasActiveReturn'] as bool?,
      returnRequestedAt: jsonSerialization['returnRequestedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['returnRequestedAt'],
            ),
      refundProcessedAt: jsonSerialization['refundProcessedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['refundProcessedAt'],
            ),
      isAutoReleased: jsonSerialization['isAutoReleased'] as bool?,
      isManuallyReleased: jsonSerialization['isManuallyReleased'] as bool?,
      isRefunded: jsonSerialization['isRefunded'] as bool?,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  static final t = OrderEscrowTable();

  static const db = OrderEscrowRepository._();

  @override
  _i1.UuidValue id;

  _i1.UuidValue orderId;

  _i2.Order? order;

  _i1.UuidValue vendorId;

  _i1.UuidValue customerId;

  double totalAmount;

  double vendorEarnings;

  double platformFee;

  double paystackFee;

  _i3.EscrowStatus status;

  DateTime? expectedDeliveryDate;

  DateTime deliveryDeadline;

  DateTime? markedDeliveredAt;

  DateTime? customerAcknowledgedAt;

  DateTime? returnWindowStart;

  DateTime? returnWindowEnd;

  bool isReturnWindowActive;

  bool isReturnWindowExpired;

  bool canRelease;

  DateTime? releaseScheduledAt;

  DateTime? releasedAt;

  String? releaseReason;

  bool hasActiveReturn;

  DateTime? returnRequestedAt;

  DateTime? refundProcessedAt;

  bool isAutoReleased;

  bool isManuallyReleased;

  bool isRefunded;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _i1.Table<_i1.UuidValue> get table => t;

  /// Returns a shallow copy of this [OrderEscrow]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  OrderEscrow copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? orderId,
    _i2.Order? order,
    _i1.UuidValue? vendorId,
    _i1.UuidValue? customerId,
    double? totalAmount,
    double? vendorEarnings,
    double? platformFee,
    double? paystackFee,
    _i3.EscrowStatus? status,
    DateTime? expectedDeliveryDate,
    DateTime? deliveryDeadline,
    DateTime? markedDeliveredAt,
    DateTime? customerAcknowledgedAt,
    DateTime? returnWindowStart,
    DateTime? returnWindowEnd,
    bool? isReturnWindowActive,
    bool? isReturnWindowExpired,
    bool? canRelease,
    DateTime? releaseScheduledAt,
    DateTime? releasedAt,
    String? releaseReason,
    bool? hasActiveReturn,
    DateTime? returnRequestedAt,
    DateTime? refundProcessedAt,
    bool? isAutoReleased,
    bool? isManuallyReleased,
    bool? isRefunded,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'OrderEscrow',
      'id': id.toJson(),
      'orderId': orderId.toJson(),
      if (order != null) 'order': order?.toJson(),
      'vendorId': vendorId.toJson(),
      'customerId': customerId.toJson(),
      'totalAmount': totalAmount,
      'vendorEarnings': vendorEarnings,
      'platformFee': platformFee,
      'paystackFee': paystackFee,
      'status': status.toJson(),
      if (expectedDeliveryDate != null)
        'expectedDeliveryDate': expectedDeliveryDate?.toJson(),
      'deliveryDeadline': deliveryDeadline.toJson(),
      if (markedDeliveredAt != null)
        'markedDeliveredAt': markedDeliveredAt?.toJson(),
      if (customerAcknowledgedAt != null)
        'customerAcknowledgedAt': customerAcknowledgedAt?.toJson(),
      if (returnWindowStart != null)
        'returnWindowStart': returnWindowStart?.toJson(),
      if (returnWindowEnd != null) 'returnWindowEnd': returnWindowEnd?.toJson(),
      'isReturnWindowActive': isReturnWindowActive,
      'isReturnWindowExpired': isReturnWindowExpired,
      'canRelease': canRelease,
      if (releaseScheduledAt != null)
        'releaseScheduledAt': releaseScheduledAt?.toJson(),
      if (releasedAt != null) 'releasedAt': releasedAt?.toJson(),
      if (releaseReason != null) 'releaseReason': releaseReason,
      'hasActiveReturn': hasActiveReturn,
      if (returnRequestedAt != null)
        'returnRequestedAt': returnRequestedAt?.toJson(),
      if (refundProcessedAt != null)
        'refundProcessedAt': refundProcessedAt?.toJson(),
      'isAutoReleased': isAutoReleased,
      'isManuallyReleased': isManuallyReleased,
      'isRefunded': isRefunded,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'OrderEscrow',
      'id': id.toJson(),
      'orderId': orderId.toJson(),
      if (order != null) 'order': order?.toJsonForProtocol(),
      'vendorId': vendorId.toJson(),
      'customerId': customerId.toJson(),
      'totalAmount': totalAmount,
      'vendorEarnings': vendorEarnings,
      'platformFee': platformFee,
      'paystackFee': paystackFee,
      'status': status.toJson(),
      if (expectedDeliveryDate != null)
        'expectedDeliveryDate': expectedDeliveryDate?.toJson(),
      'deliveryDeadline': deliveryDeadline.toJson(),
      if (markedDeliveredAt != null)
        'markedDeliveredAt': markedDeliveredAt?.toJson(),
      if (customerAcknowledgedAt != null)
        'customerAcknowledgedAt': customerAcknowledgedAt?.toJson(),
      if (returnWindowStart != null)
        'returnWindowStart': returnWindowStart?.toJson(),
      if (returnWindowEnd != null) 'returnWindowEnd': returnWindowEnd?.toJson(),
      'isReturnWindowActive': isReturnWindowActive,
      'isReturnWindowExpired': isReturnWindowExpired,
      'canRelease': canRelease,
      if (releaseScheduledAt != null)
        'releaseScheduledAt': releaseScheduledAt?.toJson(),
      if (releasedAt != null) 'releasedAt': releasedAt?.toJson(),
      if (releaseReason != null) 'releaseReason': releaseReason,
      'hasActiveReturn': hasActiveReturn,
      if (returnRequestedAt != null)
        'returnRequestedAt': returnRequestedAt?.toJson(),
      if (refundProcessedAt != null)
        'refundProcessedAt': refundProcessedAt?.toJson(),
      'isAutoReleased': isAutoReleased,
      'isManuallyReleased': isManuallyReleased,
      'isRefunded': isRefunded,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static OrderEscrowInclude include({_i2.OrderInclude? order}) {
    return OrderEscrowInclude._(order: order);
  }

  static OrderEscrowIncludeList includeList({
    _i1.WhereExpressionBuilder<OrderEscrowTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<OrderEscrowTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<OrderEscrowTable>? orderByList,
    OrderEscrowInclude? include,
  }) {
    return OrderEscrowIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(OrderEscrow.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(OrderEscrow.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _OrderEscrowImpl extends OrderEscrow {
  _OrderEscrowImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue orderId,
    _i2.Order? order,
    required _i1.UuidValue vendorId,
    required _i1.UuidValue customerId,
    required double totalAmount,
    required double vendorEarnings,
    required double platformFee,
    required double paystackFee,
    required _i3.EscrowStatus status,
    DateTime? expectedDeliveryDate,
    required DateTime deliveryDeadline,
    DateTime? markedDeliveredAt,
    DateTime? customerAcknowledgedAt,
    DateTime? returnWindowStart,
    DateTime? returnWindowEnd,
    bool? isReturnWindowActive,
    bool? isReturnWindowExpired,
    bool? canRelease,
    DateTime? releaseScheduledAt,
    DateTime? releasedAt,
    String? releaseReason,
    bool? hasActiveReturn,
    DateTime? returnRequestedAt,
    DateTime? refundProcessedAt,
    bool? isAutoReleased,
    bool? isManuallyReleased,
    bool? isRefunded,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         orderId: orderId,
         order: order,
         vendorId: vendorId,
         customerId: customerId,
         totalAmount: totalAmount,
         vendorEarnings: vendorEarnings,
         platformFee: platformFee,
         paystackFee: paystackFee,
         status: status,
         expectedDeliveryDate: expectedDeliveryDate,
         deliveryDeadline: deliveryDeadline,
         markedDeliveredAt: markedDeliveredAt,
         customerAcknowledgedAt: customerAcknowledgedAt,
         returnWindowStart: returnWindowStart,
         returnWindowEnd: returnWindowEnd,
         isReturnWindowActive: isReturnWindowActive,
         isReturnWindowExpired: isReturnWindowExpired,
         canRelease: canRelease,
         releaseScheduledAt: releaseScheduledAt,
         releasedAt: releasedAt,
         releaseReason: releaseReason,
         hasActiveReturn: hasActiveReturn,
         returnRequestedAt: returnRequestedAt,
         refundProcessedAt: refundProcessedAt,
         isAutoReleased: isAutoReleased,
         isManuallyReleased: isManuallyReleased,
         isRefunded: isRefunded,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [OrderEscrow]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  OrderEscrow copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? orderId,
    Object? order = _Undefined,
    _i1.UuidValue? vendorId,
    _i1.UuidValue? customerId,
    double? totalAmount,
    double? vendorEarnings,
    double? platformFee,
    double? paystackFee,
    _i3.EscrowStatus? status,
    Object? expectedDeliveryDate = _Undefined,
    DateTime? deliveryDeadline,
    Object? markedDeliveredAt = _Undefined,
    Object? customerAcknowledgedAt = _Undefined,
    Object? returnWindowStart = _Undefined,
    Object? returnWindowEnd = _Undefined,
    bool? isReturnWindowActive,
    bool? isReturnWindowExpired,
    bool? canRelease,
    Object? releaseScheduledAt = _Undefined,
    Object? releasedAt = _Undefined,
    Object? releaseReason = _Undefined,
    bool? hasActiveReturn,
    Object? returnRequestedAt = _Undefined,
    Object? refundProcessedAt = _Undefined,
    bool? isAutoReleased,
    bool? isManuallyReleased,
    bool? isRefunded,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return OrderEscrow(
      id: id ?? this.id,
      orderId: orderId ?? this.orderId,
      order: order is _i2.Order? ? order : this.order?.copyWith(),
      vendorId: vendorId ?? this.vendorId,
      customerId: customerId ?? this.customerId,
      totalAmount: totalAmount ?? this.totalAmount,
      vendorEarnings: vendorEarnings ?? this.vendorEarnings,
      platformFee: platformFee ?? this.platformFee,
      paystackFee: paystackFee ?? this.paystackFee,
      status: status ?? this.status,
      expectedDeliveryDate: expectedDeliveryDate is DateTime?
          ? expectedDeliveryDate
          : this.expectedDeliveryDate,
      deliveryDeadline: deliveryDeadline ?? this.deliveryDeadline,
      markedDeliveredAt: markedDeliveredAt is DateTime?
          ? markedDeliveredAt
          : this.markedDeliveredAt,
      customerAcknowledgedAt: customerAcknowledgedAt is DateTime?
          ? customerAcknowledgedAt
          : this.customerAcknowledgedAt,
      returnWindowStart: returnWindowStart is DateTime?
          ? returnWindowStart
          : this.returnWindowStart,
      returnWindowEnd: returnWindowEnd is DateTime?
          ? returnWindowEnd
          : this.returnWindowEnd,
      isReturnWindowActive: isReturnWindowActive ?? this.isReturnWindowActive,
      isReturnWindowExpired:
          isReturnWindowExpired ?? this.isReturnWindowExpired,
      canRelease: canRelease ?? this.canRelease,
      releaseScheduledAt: releaseScheduledAt is DateTime?
          ? releaseScheduledAt
          : this.releaseScheduledAt,
      releasedAt: releasedAt is DateTime? ? releasedAt : this.releasedAt,
      releaseReason: releaseReason is String?
          ? releaseReason
          : this.releaseReason,
      hasActiveReturn: hasActiveReturn ?? this.hasActiveReturn,
      returnRequestedAt: returnRequestedAt is DateTime?
          ? returnRequestedAt
          : this.returnRequestedAt,
      refundProcessedAt: refundProcessedAt is DateTime?
          ? refundProcessedAt
          : this.refundProcessedAt,
      isAutoReleased: isAutoReleased ?? this.isAutoReleased,
      isManuallyReleased: isManuallyReleased ?? this.isManuallyReleased,
      isRefunded: isRefunded ?? this.isRefunded,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class OrderEscrowUpdateTable extends _i1.UpdateTable<OrderEscrowTable> {
  OrderEscrowUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> orderId(_i1.UuidValue value) =>
      _i1.ColumnValue(
        table.orderId,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> vendorId(_i1.UuidValue value) =>
      _i1.ColumnValue(
        table.vendorId,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> customerId(
    _i1.UuidValue value,
  ) => _i1.ColumnValue(
    table.customerId,
    value,
  );

  _i1.ColumnValue<double, double> totalAmount(double value) => _i1.ColumnValue(
    table.totalAmount,
    value,
  );

  _i1.ColumnValue<double, double> vendorEarnings(double value) =>
      _i1.ColumnValue(
        table.vendorEarnings,
        value,
      );

  _i1.ColumnValue<double, double> platformFee(double value) => _i1.ColumnValue(
    table.platformFee,
    value,
  );

  _i1.ColumnValue<double, double> paystackFee(double value) => _i1.ColumnValue(
    table.paystackFee,
    value,
  );

  _i1.ColumnValue<_i3.EscrowStatus, _i3.EscrowStatus> status(
    _i3.EscrowStatus value,
  ) => _i1.ColumnValue(
    table.status,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> expectedDeliveryDate(DateTime? value) =>
      _i1.ColumnValue(
        table.expectedDeliveryDate,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> deliveryDeadline(DateTime value) =>
      _i1.ColumnValue(
        table.deliveryDeadline,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> markedDeliveredAt(DateTime? value) =>
      _i1.ColumnValue(
        table.markedDeliveredAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> customerAcknowledgedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.customerAcknowledgedAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> returnWindowStart(DateTime? value) =>
      _i1.ColumnValue(
        table.returnWindowStart,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> returnWindowEnd(DateTime? value) =>
      _i1.ColumnValue(
        table.returnWindowEnd,
        value,
      );

  _i1.ColumnValue<bool, bool> isReturnWindowActive(bool value) =>
      _i1.ColumnValue(
        table.isReturnWindowActive,
        value,
      );

  _i1.ColumnValue<bool, bool> isReturnWindowExpired(bool value) =>
      _i1.ColumnValue(
        table.isReturnWindowExpired,
        value,
      );

  _i1.ColumnValue<bool, bool> canRelease(bool value) => _i1.ColumnValue(
    table.canRelease,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> releaseScheduledAt(DateTime? value) =>
      _i1.ColumnValue(
        table.releaseScheduledAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> releasedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.releasedAt,
        value,
      );

  _i1.ColumnValue<String, String> releaseReason(String? value) =>
      _i1.ColumnValue(
        table.releaseReason,
        value,
      );

  _i1.ColumnValue<bool, bool> hasActiveReturn(bool value) => _i1.ColumnValue(
    table.hasActiveReturn,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> returnRequestedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.returnRequestedAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> refundProcessedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.refundProcessedAt,
        value,
      );

  _i1.ColumnValue<bool, bool> isAutoReleased(bool value) => _i1.ColumnValue(
    table.isAutoReleased,
    value,
  );

  _i1.ColumnValue<bool, bool> isManuallyReleased(bool value) => _i1.ColumnValue(
    table.isManuallyReleased,
    value,
  );

  _i1.ColumnValue<bool, bool> isRefunded(bool value) => _i1.ColumnValue(
    table.isRefunded,
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

class OrderEscrowTable extends _i1.Table<_i1.UuidValue> {
  OrderEscrowTable({super.tableRelation}) : super(tableName: 'order_escrows') {
    updateTable = OrderEscrowUpdateTable(this);
    orderId = _i1.ColumnUuid(
      'orderId',
      this,
    );
    vendorId = _i1.ColumnUuid(
      'vendorId',
      this,
    );
    customerId = _i1.ColumnUuid(
      'customerId',
      this,
    );
    totalAmount = _i1.ColumnDouble(
      'totalAmount',
      this,
    );
    vendorEarnings = _i1.ColumnDouble(
      'vendorEarnings',
      this,
    );
    platformFee = _i1.ColumnDouble(
      'platformFee',
      this,
    );
    paystackFee = _i1.ColumnDouble(
      'paystackFee',
      this,
    );
    status = _i1.ColumnEnum(
      'status',
      this,
      _i1.EnumSerialization.byName,
    );
    expectedDeliveryDate = _i1.ColumnDateTime(
      'expectedDeliveryDate',
      this,
    );
    deliveryDeadline = _i1.ColumnDateTime(
      'deliveryDeadline',
      this,
    );
    markedDeliveredAt = _i1.ColumnDateTime(
      'markedDeliveredAt',
      this,
    );
    customerAcknowledgedAt = _i1.ColumnDateTime(
      'customerAcknowledgedAt',
      this,
    );
    returnWindowStart = _i1.ColumnDateTime(
      'returnWindowStart',
      this,
    );
    returnWindowEnd = _i1.ColumnDateTime(
      'returnWindowEnd',
      this,
    );
    isReturnWindowActive = _i1.ColumnBool(
      'isReturnWindowActive',
      this,
      hasDefault: true,
    );
    isReturnWindowExpired = _i1.ColumnBool(
      'isReturnWindowExpired',
      this,
      hasDefault: true,
    );
    canRelease = _i1.ColumnBool(
      'canRelease',
      this,
      hasDefault: true,
    );
    releaseScheduledAt = _i1.ColumnDateTime(
      'releaseScheduledAt',
      this,
    );
    releasedAt = _i1.ColumnDateTime(
      'releasedAt',
      this,
    );
    releaseReason = _i1.ColumnString(
      'releaseReason',
      this,
    );
    hasActiveReturn = _i1.ColumnBool(
      'hasActiveReturn',
      this,
      hasDefault: true,
    );
    returnRequestedAt = _i1.ColumnDateTime(
      'returnRequestedAt',
      this,
    );
    refundProcessedAt = _i1.ColumnDateTime(
      'refundProcessedAt',
      this,
    );
    isAutoReleased = _i1.ColumnBool(
      'isAutoReleased',
      this,
      hasDefault: true,
    );
    isManuallyReleased = _i1.ColumnBool(
      'isManuallyReleased',
      this,
      hasDefault: true,
    );
    isRefunded = _i1.ColumnBool(
      'isRefunded',
      this,
      hasDefault: true,
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

  late final OrderEscrowUpdateTable updateTable;

  late final _i1.ColumnUuid orderId;

  _i2.OrderTable? _order;

  late final _i1.ColumnUuid vendorId;

  late final _i1.ColumnUuid customerId;

  late final _i1.ColumnDouble totalAmount;

  late final _i1.ColumnDouble vendorEarnings;

  late final _i1.ColumnDouble platformFee;

  late final _i1.ColumnDouble paystackFee;

  late final _i1.ColumnEnum<_i3.EscrowStatus> status;

  late final _i1.ColumnDateTime expectedDeliveryDate;

  late final _i1.ColumnDateTime deliveryDeadline;

  late final _i1.ColumnDateTime markedDeliveredAt;

  late final _i1.ColumnDateTime customerAcknowledgedAt;

  late final _i1.ColumnDateTime returnWindowStart;

  late final _i1.ColumnDateTime returnWindowEnd;

  late final _i1.ColumnBool isReturnWindowActive;

  late final _i1.ColumnBool isReturnWindowExpired;

  late final _i1.ColumnBool canRelease;

  late final _i1.ColumnDateTime releaseScheduledAt;

  late final _i1.ColumnDateTime releasedAt;

  late final _i1.ColumnString releaseReason;

  late final _i1.ColumnBool hasActiveReturn;

  late final _i1.ColumnDateTime returnRequestedAt;

  late final _i1.ColumnDateTime refundProcessedAt;

  late final _i1.ColumnBool isAutoReleased;

  late final _i1.ColumnBool isManuallyReleased;

  late final _i1.ColumnBool isRefunded;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  _i2.OrderTable get order {
    if (_order != null) return _order!;
    _order = _i1.createRelationTable(
      relationFieldName: 'order',
      field: OrderEscrow.t.orderId,
      foreignField: _i2.Order.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.OrderTable(tableRelation: foreignTableRelation),
    );
    return _order!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    orderId,
    vendorId,
    customerId,
    totalAmount,
    vendorEarnings,
    platformFee,
    paystackFee,
    status,
    expectedDeliveryDate,
    deliveryDeadline,
    markedDeliveredAt,
    customerAcknowledgedAt,
    returnWindowStart,
    returnWindowEnd,
    isReturnWindowActive,
    isReturnWindowExpired,
    canRelease,
    releaseScheduledAt,
    releasedAt,
    releaseReason,
    hasActiveReturn,
    returnRequestedAt,
    refundProcessedAt,
    isAutoReleased,
    isManuallyReleased,
    isRefunded,
    createdAt,
    updatedAt,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'order') {
      return order;
    }
    return null;
  }
}

class OrderEscrowInclude extends _i1.IncludeObject {
  OrderEscrowInclude._({_i2.OrderInclude? order}) {
    _order = order;
  }

  _i2.OrderInclude? _order;

  @override
  Map<String, _i1.Include?> get includes => {'order': _order};

  @override
  _i1.Table<_i1.UuidValue> get table => OrderEscrow.t;
}

class OrderEscrowIncludeList extends _i1.IncludeList {
  OrderEscrowIncludeList._({
    _i1.WhereExpressionBuilder<OrderEscrowTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(OrderEscrow.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue> get table => OrderEscrow.t;
}

class OrderEscrowRepository {
  const OrderEscrowRepository._();

  final attachRow = const OrderEscrowAttachRowRepository._();

  /// Returns a list of [OrderEscrow]s matching the given query parameters.
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
  Future<List<OrderEscrow>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<OrderEscrowTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<OrderEscrowTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<OrderEscrowTable>? orderByList,
    _i1.Transaction? transaction,
    OrderEscrowInclude? include,
  }) async {
    return session.db.find<OrderEscrow>(
      where: where?.call(OrderEscrow.t),
      orderBy: orderBy?.call(OrderEscrow.t),
      orderByList: orderByList?.call(OrderEscrow.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [OrderEscrow] matching the given query parameters.
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
  Future<OrderEscrow?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<OrderEscrowTable>? where,
    int? offset,
    _i1.OrderByBuilder<OrderEscrowTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<OrderEscrowTable>? orderByList,
    _i1.Transaction? transaction,
    OrderEscrowInclude? include,
  }) async {
    return session.db.findFirstRow<OrderEscrow>(
      where: where?.call(OrderEscrow.t),
      orderBy: orderBy?.call(OrderEscrow.t),
      orderByList: orderByList?.call(OrderEscrow.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [OrderEscrow] by its [id] or null if no such row exists.
  Future<OrderEscrow?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
    OrderEscrowInclude? include,
  }) async {
    return session.db.findById<OrderEscrow>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [OrderEscrow]s in the list and returns the inserted rows.
  ///
  /// The returned [OrderEscrow]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<OrderEscrow>> insert(
    _i1.Session session,
    List<OrderEscrow> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<OrderEscrow>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [OrderEscrow] and returns the inserted row.
  ///
  /// The returned [OrderEscrow] will have its `id` field set.
  Future<OrderEscrow> insertRow(
    _i1.Session session,
    OrderEscrow row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<OrderEscrow>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [OrderEscrow]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<OrderEscrow>> update(
    _i1.Session session,
    List<OrderEscrow> rows, {
    _i1.ColumnSelections<OrderEscrowTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<OrderEscrow>(
      rows,
      columns: columns?.call(OrderEscrow.t),
      transaction: transaction,
    );
  }

  /// Updates a single [OrderEscrow]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<OrderEscrow> updateRow(
    _i1.Session session,
    OrderEscrow row, {
    _i1.ColumnSelections<OrderEscrowTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<OrderEscrow>(
      row,
      columns: columns?.call(OrderEscrow.t),
      transaction: transaction,
    );
  }

  /// Updates a single [OrderEscrow] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<OrderEscrow?> updateById(
    _i1.Session session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<OrderEscrowUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<OrderEscrow>(
      id,
      columnValues: columnValues(OrderEscrow.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [OrderEscrow]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<OrderEscrow>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<OrderEscrowUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<OrderEscrowTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<OrderEscrowTable>? orderBy,
    _i1.OrderByListBuilder<OrderEscrowTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<OrderEscrow>(
      columnValues: columnValues(OrderEscrow.t.updateTable),
      where: where(OrderEscrow.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(OrderEscrow.t),
      orderByList: orderByList?.call(OrderEscrow.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [OrderEscrow]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<OrderEscrow>> delete(
    _i1.Session session,
    List<OrderEscrow> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<OrderEscrow>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [OrderEscrow].
  Future<OrderEscrow> deleteRow(
    _i1.Session session,
    OrderEscrow row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<OrderEscrow>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<OrderEscrow>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<OrderEscrowTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<OrderEscrow>(
      where: where(OrderEscrow.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<OrderEscrowTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<OrderEscrow>(
      where: where?.call(OrderEscrow.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class OrderEscrowAttachRowRepository {
  const OrderEscrowAttachRowRepository._();

  /// Creates a relation between the given [OrderEscrow] and [Order]
  /// by setting the [OrderEscrow]'s foreign key `orderId` to refer to the [Order].
  Future<void> order(
    _i1.Session session,
    OrderEscrow orderEscrow,
    _i2.Order order, {
    _i1.Transaction? transaction,
  }) async {
    if (orderEscrow.id == null) {
      throw ArgumentError.notNull('orderEscrow.id');
    }
    if (order.id == null) {
      throw ArgumentError.notNull('order.id');
    }

    var $orderEscrow = orderEscrow.copyWith(orderId: order.id);
    await session.db.updateRow<OrderEscrow>(
      $orderEscrow,
      columns: [OrderEscrow.t.orderId],
      transaction: transaction,
    );
  }
}
