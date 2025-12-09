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
import '../order/order.dart' as _i2;
import '../order/order_item.dart' as _i3;
import '../order/payment_method.dart' as _i4;

abstract class Refund implements _i1.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
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
