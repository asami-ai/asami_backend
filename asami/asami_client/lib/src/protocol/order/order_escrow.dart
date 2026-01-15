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
import '../order/order.dart' as _i2;
import '../order/wallet_enums/escrow_status.dart' as _i3;
import 'package:asami_client/src/protocol/protocol.dart' as _i4;

abstract class OrderEscrow implements _i1.SerializableModel {
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

  /// The id of the object.
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
