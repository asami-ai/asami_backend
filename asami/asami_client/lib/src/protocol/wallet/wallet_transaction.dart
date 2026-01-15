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
import '../order/wallet_enums/transaction_status.dart' as _i2;
import '../wallet/vendor_wallet.dart' as _i3;
import '../order/wallet_enums/wallet_transaction_type.dart' as _i4;
import '../order/order.dart' as _i5;
import 'package:asami_client/src/protocol/protocol.dart' as _i6;

abstract class WalletTransaction implements _i1.SerializableModel {
  WalletTransaction._({
    _i1.UuidValue? id,
    required this.walletId,
    this.wallet,
    required this.vendorId,
    required this.type,
    required this.amount,
    required this.balanceBefore,
    required this.balanceAfter,
    required this.referenceType,
    this.referenceId,
    this.orderId,
    this.order,
    required this.description,
    this.notes,
    _i2.TransactionStatus? status,
    bool? isInEscrow,
    this.escrowReleasedAt,
    this.escrowReleaseScheduledAt,
    this.transferCode,
    this.transferId,
    this.transferStatus,
    this.transferredAt,
    this.failureReason,
    int? retryCount,
    this.metadata,
    DateTime? createdAt,
    DateTime? updatedAt,
    this.processedAt,
  }) : id = id ?? _i1.Uuid().v4obj(),
       status = status ?? _i2.TransactionStatus.pending,
       isInEscrow = isInEscrow ?? false,
       retryCount = retryCount ?? 0,
       createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory WalletTransaction({
    _i1.UuidValue? id,
    required _i1.UuidValue walletId,
    _i3.VendorWallet? wallet,
    required _i1.UuidValue vendorId,
    required _i4.WalletTransactionType type,
    required double amount,
    required double balanceBefore,
    required double balanceAfter,
    required String referenceType,
    String? referenceId,
    _i1.UuidValue? orderId,
    _i5.Order? order,
    required String description,
    String? notes,
    _i2.TransactionStatus? status,
    bool? isInEscrow,
    DateTime? escrowReleasedAt,
    DateTime? escrowReleaseScheduledAt,
    String? transferCode,
    String? transferId,
    String? transferStatus,
    DateTime? transferredAt,
    String? failureReason,
    int? retryCount,
    String? metadata,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? processedAt,
  }) = _WalletTransactionImpl;

  factory WalletTransaction.fromJson(Map<String, dynamic> jsonSerialization) {
    return WalletTransaction(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      walletId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['walletId'],
      ),
      wallet: jsonSerialization['wallet'] == null
          ? null
          : _i6.Protocol().deserialize<_i3.VendorWallet>(
              jsonSerialization['wallet'],
            ),
      vendorId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['vendorId'],
      ),
      type: _i4.WalletTransactionType.fromJson(
        (jsonSerialization['type'] as String),
      ),
      amount: (jsonSerialization['amount'] as num).toDouble(),
      balanceBefore: (jsonSerialization['balanceBefore'] as num).toDouble(),
      balanceAfter: (jsonSerialization['balanceAfter'] as num).toDouble(),
      referenceType: jsonSerialization['referenceType'] as String,
      referenceId: jsonSerialization['referenceId'] as String?,
      orderId: jsonSerialization['orderId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['orderId']),
      order: jsonSerialization['order'] == null
          ? null
          : _i6.Protocol().deserialize<_i5.Order>(jsonSerialization['order']),
      description: jsonSerialization['description'] as String,
      notes: jsonSerialization['notes'] as String?,
      status: jsonSerialization['status'] == null
          ? null
          : _i2.TransactionStatus.fromJson(
              (jsonSerialization['status'] as String),
            ),
      isInEscrow: jsonSerialization['isInEscrow'] as bool?,
      escrowReleasedAt: jsonSerialization['escrowReleasedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['escrowReleasedAt'],
            ),
      escrowReleaseScheduledAt:
          jsonSerialization['escrowReleaseScheduledAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['escrowReleaseScheduledAt'],
            ),
      transferCode: jsonSerialization['transferCode'] as String?,
      transferId: jsonSerialization['transferId'] as String?,
      transferStatus: jsonSerialization['transferStatus'] as String?,
      transferredAt: jsonSerialization['transferredAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['transferredAt'],
            ),
      failureReason: jsonSerialization['failureReason'] as String?,
      retryCount: jsonSerialization['retryCount'] as int?,
      metadata: jsonSerialization['metadata'] as String?,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
      processedAt: jsonSerialization['processedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['processedAt'],
            ),
    );
  }

  /// The id of the object.
  _i1.UuidValue id;

  _i1.UuidValue walletId;

  _i3.VendorWallet? wallet;

  _i1.UuidValue vendorId;

  _i4.WalletTransactionType type;

  double amount;

  double balanceBefore;

  double balanceAfter;

  String referenceType;

  String? referenceId;

  _i1.UuidValue? orderId;

  _i5.Order? order;

  String description;

  String? notes;

  _i2.TransactionStatus status;

  bool isInEscrow;

  DateTime? escrowReleasedAt;

  DateTime? escrowReleaseScheduledAt;

  String? transferCode;

  String? transferId;

  String? transferStatus;

  DateTime? transferredAt;

  String? failureReason;

  int retryCount;

  String? metadata;

  DateTime createdAt;

  DateTime updatedAt;

  DateTime? processedAt;

  /// Returns a shallow copy of this [WalletTransaction]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  WalletTransaction copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? walletId,
    _i3.VendorWallet? wallet,
    _i1.UuidValue? vendorId,
    _i4.WalletTransactionType? type,
    double? amount,
    double? balanceBefore,
    double? balanceAfter,
    String? referenceType,
    String? referenceId,
    _i1.UuidValue? orderId,
    _i5.Order? order,
    String? description,
    String? notes,
    _i2.TransactionStatus? status,
    bool? isInEscrow,
    DateTime? escrowReleasedAt,
    DateTime? escrowReleaseScheduledAt,
    String? transferCode,
    String? transferId,
    String? transferStatus,
    DateTime? transferredAt,
    String? failureReason,
    int? retryCount,
    String? metadata,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? processedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'WalletTransaction',
      'id': id.toJson(),
      'walletId': walletId.toJson(),
      if (wallet != null) 'wallet': wallet?.toJson(),
      'vendorId': vendorId.toJson(),
      'type': type.toJson(),
      'amount': amount,
      'balanceBefore': balanceBefore,
      'balanceAfter': balanceAfter,
      'referenceType': referenceType,
      if (referenceId != null) 'referenceId': referenceId,
      if (orderId != null) 'orderId': orderId?.toJson(),
      if (order != null) 'order': order?.toJson(),
      'description': description,
      if (notes != null) 'notes': notes,
      'status': status.toJson(),
      'isInEscrow': isInEscrow,
      if (escrowReleasedAt != null)
        'escrowReleasedAt': escrowReleasedAt?.toJson(),
      if (escrowReleaseScheduledAt != null)
        'escrowReleaseScheduledAt': escrowReleaseScheduledAt?.toJson(),
      if (transferCode != null) 'transferCode': transferCode,
      if (transferId != null) 'transferId': transferId,
      if (transferStatus != null) 'transferStatus': transferStatus,
      if (transferredAt != null) 'transferredAt': transferredAt?.toJson(),
      if (failureReason != null) 'failureReason': failureReason,
      'retryCount': retryCount,
      if (metadata != null) 'metadata': metadata,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      if (processedAt != null) 'processedAt': processedAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _WalletTransactionImpl extends WalletTransaction {
  _WalletTransactionImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue walletId,
    _i3.VendorWallet? wallet,
    required _i1.UuidValue vendorId,
    required _i4.WalletTransactionType type,
    required double amount,
    required double balanceBefore,
    required double balanceAfter,
    required String referenceType,
    String? referenceId,
    _i1.UuidValue? orderId,
    _i5.Order? order,
    required String description,
    String? notes,
    _i2.TransactionStatus? status,
    bool? isInEscrow,
    DateTime? escrowReleasedAt,
    DateTime? escrowReleaseScheduledAt,
    String? transferCode,
    String? transferId,
    String? transferStatus,
    DateTime? transferredAt,
    String? failureReason,
    int? retryCount,
    String? metadata,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? processedAt,
  }) : super._(
         id: id,
         walletId: walletId,
         wallet: wallet,
         vendorId: vendorId,
         type: type,
         amount: amount,
         balanceBefore: balanceBefore,
         balanceAfter: balanceAfter,
         referenceType: referenceType,
         referenceId: referenceId,
         orderId: orderId,
         order: order,
         description: description,
         notes: notes,
         status: status,
         isInEscrow: isInEscrow,
         escrowReleasedAt: escrowReleasedAt,
         escrowReleaseScheduledAt: escrowReleaseScheduledAt,
         transferCode: transferCode,
         transferId: transferId,
         transferStatus: transferStatus,
         transferredAt: transferredAt,
         failureReason: failureReason,
         retryCount: retryCount,
         metadata: metadata,
         createdAt: createdAt,
         updatedAt: updatedAt,
         processedAt: processedAt,
       );

  /// Returns a shallow copy of this [WalletTransaction]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  WalletTransaction copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? walletId,
    Object? wallet = _Undefined,
    _i1.UuidValue? vendorId,
    _i4.WalletTransactionType? type,
    double? amount,
    double? balanceBefore,
    double? balanceAfter,
    String? referenceType,
    Object? referenceId = _Undefined,
    Object? orderId = _Undefined,
    Object? order = _Undefined,
    String? description,
    Object? notes = _Undefined,
    _i2.TransactionStatus? status,
    bool? isInEscrow,
    Object? escrowReleasedAt = _Undefined,
    Object? escrowReleaseScheduledAt = _Undefined,
    Object? transferCode = _Undefined,
    Object? transferId = _Undefined,
    Object? transferStatus = _Undefined,
    Object? transferredAt = _Undefined,
    Object? failureReason = _Undefined,
    int? retryCount,
    Object? metadata = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
    Object? processedAt = _Undefined,
  }) {
    return WalletTransaction(
      id: id ?? this.id,
      walletId: walletId ?? this.walletId,
      wallet: wallet is _i3.VendorWallet? ? wallet : this.wallet?.copyWith(),
      vendorId: vendorId ?? this.vendorId,
      type: type ?? this.type,
      amount: amount ?? this.amount,
      balanceBefore: balanceBefore ?? this.balanceBefore,
      balanceAfter: balanceAfter ?? this.balanceAfter,
      referenceType: referenceType ?? this.referenceType,
      referenceId: referenceId is String? ? referenceId : this.referenceId,
      orderId: orderId is _i1.UuidValue? ? orderId : this.orderId,
      order: order is _i5.Order? ? order : this.order?.copyWith(),
      description: description ?? this.description,
      notes: notes is String? ? notes : this.notes,
      status: status ?? this.status,
      isInEscrow: isInEscrow ?? this.isInEscrow,
      escrowReleasedAt: escrowReleasedAt is DateTime?
          ? escrowReleasedAt
          : this.escrowReleasedAt,
      escrowReleaseScheduledAt: escrowReleaseScheduledAt is DateTime?
          ? escrowReleaseScheduledAt
          : this.escrowReleaseScheduledAt,
      transferCode: transferCode is String? ? transferCode : this.transferCode,
      transferId: transferId is String? ? transferId : this.transferId,
      transferStatus: transferStatus is String?
          ? transferStatus
          : this.transferStatus,
      transferredAt: transferredAt is DateTime?
          ? transferredAt
          : this.transferredAt,
      failureReason: failureReason is String?
          ? failureReason
          : this.failureReason,
      retryCount: retryCount ?? this.retryCount,
      metadata: metadata is String? ? metadata : this.metadata,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      processedAt: processedAt is DateTime? ? processedAt : this.processedAt,
    );
  }
}
