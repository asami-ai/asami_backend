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
import '../order/payment_method.dart' as _i3;
import '../order/payment_status.dart' as _i4;
import 'package:asami_client/src/protocol/protocol.dart' as _i5;

abstract class PaymentTransaction implements _i1.SerializableModel {
  PaymentTransaction._({
    _i1.UuidValue? id,
    required this.orderId,
    this.order,
    required this.amount,
    String? currency,
    required this.paymentMethod,
    required this.paymentStatus,
    required this.gatewayName,
    this.gatewayTransactionId,
    this.gatewayResponse,
    this.cryptoType,
    this.cryptoAmount,
    this.walletAddress,
    this.transactionHash,
    this.blockchainNetwork,
    this.conversionRate,
    double? platformFee,
    double? gatewayFee,
    bool? isPending,
    bool? isCompleted,
    bool? isFailed,
    this.metadata,
    this.failureReason,
    DateTime? createdAt,
    DateTime? updatedAt,
    this.completedAt,
    this.failedAt,
  }) : id = id ?? _i1.Uuid().v4obj(),
       currency = currency ?? 'USD',
       platformFee = platformFee ?? 0.0,
       gatewayFee = gatewayFee ?? 0.0,
       isPending = isPending ?? true,
       isCompleted = isCompleted ?? false,
       isFailed = isFailed ?? false,
       createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory PaymentTransaction({
    _i1.UuidValue? id,
    required _i1.UuidValue orderId,
    _i2.Order? order,
    required double amount,
    String? currency,
    required _i3.PaymentMethod paymentMethod,
    required _i4.PaymentStatus paymentStatus,
    required String gatewayName,
    String? gatewayTransactionId,
    String? gatewayResponse,
    String? cryptoType,
    double? cryptoAmount,
    String? walletAddress,
    String? transactionHash,
    String? blockchainNetwork,
    double? conversionRate,
    double? platformFee,
    double? gatewayFee,
    bool? isPending,
    bool? isCompleted,
    bool? isFailed,
    String? metadata,
    String? failureReason,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? completedAt,
    DateTime? failedAt,
  }) = _PaymentTransactionImpl;

  factory PaymentTransaction.fromJson(Map<String, dynamic> jsonSerialization) {
    return PaymentTransaction(
      id: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      orderId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['orderId'],
      ),
      order: jsonSerialization['order'] == null
          ? null
          : _i5.Protocol().deserialize<_i2.Order>(jsonSerialization['order']),
      amount: (jsonSerialization['amount'] as num).toDouble(),
      currency: jsonSerialization['currency'] as String,
      paymentMethod: _i3.PaymentMethod.fromJson(
        (jsonSerialization['paymentMethod'] as String),
      ),
      paymentStatus: _i4.PaymentStatus.fromJson(
        (jsonSerialization['paymentStatus'] as String),
      ),
      gatewayName: jsonSerialization['gatewayName'] as String,
      gatewayTransactionId:
          jsonSerialization['gatewayTransactionId'] as String?,
      gatewayResponse: jsonSerialization['gatewayResponse'] as String?,
      cryptoType: jsonSerialization['cryptoType'] as String?,
      cryptoAmount: (jsonSerialization['cryptoAmount'] as num?)?.toDouble(),
      walletAddress: jsonSerialization['walletAddress'] as String?,
      transactionHash: jsonSerialization['transactionHash'] as String?,
      blockchainNetwork: jsonSerialization['blockchainNetwork'] as String?,
      conversionRate: (jsonSerialization['conversionRate'] as num?)?.toDouble(),
      platformFee: (jsonSerialization['platformFee'] as num).toDouble(),
      gatewayFee: (jsonSerialization['gatewayFee'] as num).toDouble(),
      isPending: jsonSerialization['isPending'] as bool,
      isCompleted: jsonSerialization['isCompleted'] as bool,
      isFailed: jsonSerialization['isFailed'] as bool,
      metadata: jsonSerialization['metadata'] as String?,
      failureReason: jsonSerialization['failureReason'] as String?,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
      completedAt: jsonSerialization['completedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['completedAt'],
            ),
      failedAt: jsonSerialization['failedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['failedAt']),
    );
  }

  /// The id of the object.
  _i1.UuidValue id;

  _i1.UuidValue orderId;

  _i2.Order? order;

  double amount;

  String currency;

  _i3.PaymentMethod paymentMethod;

  _i4.PaymentStatus paymentStatus;

  String gatewayName;

  String? gatewayTransactionId;

  String? gatewayResponse;

  String? cryptoType;

  double? cryptoAmount;

  String? walletAddress;

  String? transactionHash;

  String? blockchainNetwork;

  double? conversionRate;

  double platformFee;

  double gatewayFee;

  bool isPending;

  bool isCompleted;

  bool isFailed;

  String? metadata;

  String? failureReason;

  DateTime createdAt;

  DateTime updatedAt;

  DateTime? completedAt;

  DateTime? failedAt;

  /// Returns a shallow copy of this [PaymentTransaction]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PaymentTransaction copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? orderId,
    _i2.Order? order,
    double? amount,
    String? currency,
    _i3.PaymentMethod? paymentMethod,
    _i4.PaymentStatus? paymentStatus,
    String? gatewayName,
    String? gatewayTransactionId,
    String? gatewayResponse,
    String? cryptoType,
    double? cryptoAmount,
    String? walletAddress,
    String? transactionHash,
    String? blockchainNetwork,
    double? conversionRate,
    double? platformFee,
    double? gatewayFee,
    bool? isPending,
    bool? isCompleted,
    bool? isFailed,
    String? metadata,
    String? failureReason,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? completedAt,
    DateTime? failedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'PaymentTransaction',
      'id': id.toJson(),
      'orderId': orderId.toJson(),
      if (order != null) 'order': order?.toJson(),
      'amount': amount,
      'currency': currency,
      'paymentMethod': paymentMethod.toJson(),
      'paymentStatus': paymentStatus.toJson(),
      'gatewayName': gatewayName,
      if (gatewayTransactionId != null)
        'gatewayTransactionId': gatewayTransactionId,
      if (gatewayResponse != null) 'gatewayResponse': gatewayResponse,
      if (cryptoType != null) 'cryptoType': cryptoType,
      if (cryptoAmount != null) 'cryptoAmount': cryptoAmount,
      if (walletAddress != null) 'walletAddress': walletAddress,
      if (transactionHash != null) 'transactionHash': transactionHash,
      if (blockchainNetwork != null) 'blockchainNetwork': blockchainNetwork,
      if (conversionRate != null) 'conversionRate': conversionRate,
      'platformFee': platformFee,
      'gatewayFee': gatewayFee,
      'isPending': isPending,
      'isCompleted': isCompleted,
      'isFailed': isFailed,
      if (metadata != null) 'metadata': metadata,
      if (failureReason != null) 'failureReason': failureReason,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      if (completedAt != null) 'completedAt': completedAt?.toJson(),
      if (failedAt != null) 'failedAt': failedAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PaymentTransactionImpl extends PaymentTransaction {
  _PaymentTransactionImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue orderId,
    _i2.Order? order,
    required double amount,
    String? currency,
    required _i3.PaymentMethod paymentMethod,
    required _i4.PaymentStatus paymentStatus,
    required String gatewayName,
    String? gatewayTransactionId,
    String? gatewayResponse,
    String? cryptoType,
    double? cryptoAmount,
    String? walletAddress,
    String? transactionHash,
    String? blockchainNetwork,
    double? conversionRate,
    double? platformFee,
    double? gatewayFee,
    bool? isPending,
    bool? isCompleted,
    bool? isFailed,
    String? metadata,
    String? failureReason,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? completedAt,
    DateTime? failedAt,
  }) : super._(
         id: id,
         orderId: orderId,
         order: order,
         amount: amount,
         currency: currency,
         paymentMethod: paymentMethod,
         paymentStatus: paymentStatus,
         gatewayName: gatewayName,
         gatewayTransactionId: gatewayTransactionId,
         gatewayResponse: gatewayResponse,
         cryptoType: cryptoType,
         cryptoAmount: cryptoAmount,
         walletAddress: walletAddress,
         transactionHash: transactionHash,
         blockchainNetwork: blockchainNetwork,
         conversionRate: conversionRate,
         platformFee: platformFee,
         gatewayFee: gatewayFee,
         isPending: isPending,
         isCompleted: isCompleted,
         isFailed: isFailed,
         metadata: metadata,
         failureReason: failureReason,
         createdAt: createdAt,
         updatedAt: updatedAt,
         completedAt: completedAt,
         failedAt: failedAt,
       );

  /// Returns a shallow copy of this [PaymentTransaction]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PaymentTransaction copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? orderId,
    Object? order = _Undefined,
    double? amount,
    String? currency,
    _i3.PaymentMethod? paymentMethod,
    _i4.PaymentStatus? paymentStatus,
    String? gatewayName,
    Object? gatewayTransactionId = _Undefined,
    Object? gatewayResponse = _Undefined,
    Object? cryptoType = _Undefined,
    Object? cryptoAmount = _Undefined,
    Object? walletAddress = _Undefined,
    Object? transactionHash = _Undefined,
    Object? blockchainNetwork = _Undefined,
    Object? conversionRate = _Undefined,
    double? platformFee,
    double? gatewayFee,
    bool? isPending,
    bool? isCompleted,
    bool? isFailed,
    Object? metadata = _Undefined,
    Object? failureReason = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
    Object? completedAt = _Undefined,
    Object? failedAt = _Undefined,
  }) {
    return PaymentTransaction(
      id: id ?? this.id,
      orderId: orderId ?? this.orderId,
      order: order is _i2.Order? ? order : this.order?.copyWith(),
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      gatewayName: gatewayName ?? this.gatewayName,
      gatewayTransactionId: gatewayTransactionId is String?
          ? gatewayTransactionId
          : this.gatewayTransactionId,
      gatewayResponse: gatewayResponse is String?
          ? gatewayResponse
          : this.gatewayResponse,
      cryptoType: cryptoType is String? ? cryptoType : this.cryptoType,
      cryptoAmount: cryptoAmount is double? ? cryptoAmount : this.cryptoAmount,
      walletAddress: walletAddress is String?
          ? walletAddress
          : this.walletAddress,
      transactionHash: transactionHash is String?
          ? transactionHash
          : this.transactionHash,
      blockchainNetwork: blockchainNetwork is String?
          ? blockchainNetwork
          : this.blockchainNetwork,
      conversionRate: conversionRate is double?
          ? conversionRate
          : this.conversionRate,
      platformFee: platformFee ?? this.platformFee,
      gatewayFee: gatewayFee ?? this.gatewayFee,
      isPending: isPending ?? this.isPending,
      isCompleted: isCompleted ?? this.isCompleted,
      isFailed: isFailed ?? this.isFailed,
      metadata: metadata is String? ? metadata : this.metadata,
      failureReason: failureReason is String?
          ? failureReason
          : this.failureReason,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      completedAt: completedAt is DateTime? ? completedAt : this.completedAt,
      failedAt: failedAt is DateTime? ? failedAt : this.failedAt,
    );
  }
}
