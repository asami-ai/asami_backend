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
import '../order/wallet_enums/withdrawal_status.dart' as _i2;
import '../user/vendor_profile.dart' as _i3;
import '../wallet/vendor_wallet.dart' as _i4;
import 'package:asami_client/src/protocol/protocol.dart' as _i5;

abstract class WithdrawalRequest implements _i1.SerializableModel {
  WithdrawalRequest._({
    _i1.UuidValue? id,
    required this.vendorId,
    this.vendor,
    required this.walletId,
    this.wallet,
    required this.requestNumber,
    required this.amount,
    String? currency,
    required this.bankName,
    required this.bankCode,
    required this.accountNumber,
    required this.accountName,
    _i2.WithdrawalStatus? status,
    this.approvedBy,
    this.approvedAt,
    this.processedAt,
    this.completedAt,
    this.recipientCode,
    this.transferCode,
    this.transferId,
    this.transferReference,
    this.transferStatus,
    double? transferFee,
    this.netAmount,
    this.failureReason,
    this.failureCode,
    int? retryCount,
    int? maxRetries,
    this.vendorNotes,
    this.adminNotes,
    DateTime? createdAt,
    DateTime? updatedAt,
    this.cancelledAt,
  }) : id = id ?? _i1.Uuid().v4obj(),
       currency = currency ?? 'NGN',
       status = status ?? _i2.WithdrawalStatus.pending,
       transferFee = transferFee ?? 0.0,
       retryCount = retryCount ?? 0,
       maxRetries = maxRetries ?? 3,
       createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory WithdrawalRequest({
    _i1.UuidValue? id,
    required _i1.UuidValue vendorId,
    _i3.VendorProfile? vendor,
    required _i1.UuidValue walletId,
    _i4.VendorWallet? wallet,
    required String requestNumber,
    required double amount,
    String? currency,
    required String bankName,
    required String bankCode,
    required String accountNumber,
    required String accountName,
    _i2.WithdrawalStatus? status,
    String? approvedBy,
    DateTime? approvedAt,
    DateTime? processedAt,
    DateTime? completedAt,
    String? recipientCode,
    String? transferCode,
    String? transferId,
    String? transferReference,
    String? transferStatus,
    double? transferFee,
    double? netAmount,
    String? failureReason,
    String? failureCode,
    int? retryCount,
    int? maxRetries,
    String? vendorNotes,
    String? adminNotes,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? cancelledAt,
  }) = _WithdrawalRequestImpl;

  factory WithdrawalRequest.fromJson(Map<String, dynamic> jsonSerialization) {
    return WithdrawalRequest(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      vendorId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['vendorId'],
      ),
      vendor: jsonSerialization['vendor'] == null
          ? null
          : _i5.Protocol().deserialize<_i3.VendorProfile>(
              jsonSerialization['vendor'],
            ),
      walletId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['walletId'],
      ),
      wallet: jsonSerialization['wallet'] == null
          ? null
          : _i5.Protocol().deserialize<_i4.VendorWallet>(
              jsonSerialization['wallet'],
            ),
      requestNumber: jsonSerialization['requestNumber'] as String,
      amount: (jsonSerialization['amount'] as num).toDouble(),
      currency: jsonSerialization['currency'] as String?,
      bankName: jsonSerialization['bankName'] as String,
      bankCode: jsonSerialization['bankCode'] as String,
      accountNumber: jsonSerialization['accountNumber'] as String,
      accountName: jsonSerialization['accountName'] as String,
      status: jsonSerialization['status'] == null
          ? null
          : _i2.WithdrawalStatus.fromJson(
              (jsonSerialization['status'] as String),
            ),
      approvedBy: jsonSerialization['approvedBy'] as String?,
      approvedAt: jsonSerialization['approvedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['approvedAt']),
      processedAt: jsonSerialization['processedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['processedAt'],
            ),
      completedAt: jsonSerialization['completedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['completedAt'],
            ),
      recipientCode: jsonSerialization['recipientCode'] as String?,
      transferCode: jsonSerialization['transferCode'] as String?,
      transferId: jsonSerialization['transferId'] as String?,
      transferReference: jsonSerialization['transferReference'] as String?,
      transferStatus: jsonSerialization['transferStatus'] as String?,
      transferFee: (jsonSerialization['transferFee'] as num?)?.toDouble(),
      netAmount: (jsonSerialization['netAmount'] as num?)?.toDouble(),
      failureReason: jsonSerialization['failureReason'] as String?,
      failureCode: jsonSerialization['failureCode'] as String?,
      retryCount: jsonSerialization['retryCount'] as int?,
      maxRetries: jsonSerialization['maxRetries'] as int?,
      vendorNotes: jsonSerialization['vendorNotes'] as String?,
      adminNotes: jsonSerialization['adminNotes'] as String?,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
      cancelledAt: jsonSerialization['cancelledAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['cancelledAt'],
            ),
    );
  }

  /// The id of the object.
  _i1.UuidValue id;

  _i1.UuidValue vendorId;

  _i3.VendorProfile? vendor;

  _i1.UuidValue walletId;

  _i4.VendorWallet? wallet;

  String requestNumber;

  double amount;

  String currency;

  String bankName;

  String bankCode;

  String accountNumber;

  String accountName;

  _i2.WithdrawalStatus status;

  String? approvedBy;

  DateTime? approvedAt;

  DateTime? processedAt;

  DateTime? completedAt;

  String? recipientCode;

  String? transferCode;

  String? transferId;

  String? transferReference;

  String? transferStatus;

  double transferFee;

  double? netAmount;

  String? failureReason;

  String? failureCode;

  int retryCount;

  int maxRetries;

  String? vendorNotes;

  String? adminNotes;

  DateTime createdAt;

  DateTime updatedAt;

  DateTime? cancelledAt;

  /// Returns a shallow copy of this [WithdrawalRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  WithdrawalRequest copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? vendorId,
    _i3.VendorProfile? vendor,
    _i1.UuidValue? walletId,
    _i4.VendorWallet? wallet,
    String? requestNumber,
    double? amount,
    String? currency,
    String? bankName,
    String? bankCode,
    String? accountNumber,
    String? accountName,
    _i2.WithdrawalStatus? status,
    String? approvedBy,
    DateTime? approvedAt,
    DateTime? processedAt,
    DateTime? completedAt,
    String? recipientCode,
    String? transferCode,
    String? transferId,
    String? transferReference,
    String? transferStatus,
    double? transferFee,
    double? netAmount,
    String? failureReason,
    String? failureCode,
    int? retryCount,
    int? maxRetries,
    String? vendorNotes,
    String? adminNotes,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? cancelledAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'WithdrawalRequest',
      'id': id.toJson(),
      'vendorId': vendorId.toJson(),
      if (vendor != null) 'vendor': vendor?.toJson(),
      'walletId': walletId.toJson(),
      if (wallet != null) 'wallet': wallet?.toJson(),
      'requestNumber': requestNumber,
      'amount': amount,
      'currency': currency,
      'bankName': bankName,
      'bankCode': bankCode,
      'accountNumber': accountNumber,
      'accountName': accountName,
      'status': status.toJson(),
      if (approvedBy != null) 'approvedBy': approvedBy,
      if (approvedAt != null) 'approvedAt': approvedAt?.toJson(),
      if (processedAt != null) 'processedAt': processedAt?.toJson(),
      if (completedAt != null) 'completedAt': completedAt?.toJson(),
      if (recipientCode != null) 'recipientCode': recipientCode,
      if (transferCode != null) 'transferCode': transferCode,
      if (transferId != null) 'transferId': transferId,
      if (transferReference != null) 'transferReference': transferReference,
      if (transferStatus != null) 'transferStatus': transferStatus,
      'transferFee': transferFee,
      if (netAmount != null) 'netAmount': netAmount,
      if (failureReason != null) 'failureReason': failureReason,
      if (failureCode != null) 'failureCode': failureCode,
      'retryCount': retryCount,
      'maxRetries': maxRetries,
      if (vendorNotes != null) 'vendorNotes': vendorNotes,
      if (adminNotes != null) 'adminNotes': adminNotes,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      if (cancelledAt != null) 'cancelledAt': cancelledAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _WithdrawalRequestImpl extends WithdrawalRequest {
  _WithdrawalRequestImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue vendorId,
    _i3.VendorProfile? vendor,
    required _i1.UuidValue walletId,
    _i4.VendorWallet? wallet,
    required String requestNumber,
    required double amount,
    String? currency,
    required String bankName,
    required String bankCode,
    required String accountNumber,
    required String accountName,
    _i2.WithdrawalStatus? status,
    String? approvedBy,
    DateTime? approvedAt,
    DateTime? processedAt,
    DateTime? completedAt,
    String? recipientCode,
    String? transferCode,
    String? transferId,
    String? transferReference,
    String? transferStatus,
    double? transferFee,
    double? netAmount,
    String? failureReason,
    String? failureCode,
    int? retryCount,
    int? maxRetries,
    String? vendorNotes,
    String? adminNotes,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? cancelledAt,
  }) : super._(
         id: id,
         vendorId: vendorId,
         vendor: vendor,
         walletId: walletId,
         wallet: wallet,
         requestNumber: requestNumber,
         amount: amount,
         currency: currency,
         bankName: bankName,
         bankCode: bankCode,
         accountNumber: accountNumber,
         accountName: accountName,
         status: status,
         approvedBy: approvedBy,
         approvedAt: approvedAt,
         processedAt: processedAt,
         completedAt: completedAt,
         recipientCode: recipientCode,
         transferCode: transferCode,
         transferId: transferId,
         transferReference: transferReference,
         transferStatus: transferStatus,
         transferFee: transferFee,
         netAmount: netAmount,
         failureReason: failureReason,
         failureCode: failureCode,
         retryCount: retryCount,
         maxRetries: maxRetries,
         vendorNotes: vendorNotes,
         adminNotes: adminNotes,
         createdAt: createdAt,
         updatedAt: updatedAt,
         cancelledAt: cancelledAt,
       );

  /// Returns a shallow copy of this [WithdrawalRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  WithdrawalRequest copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? vendorId,
    Object? vendor = _Undefined,
    _i1.UuidValue? walletId,
    Object? wallet = _Undefined,
    String? requestNumber,
    double? amount,
    String? currency,
    String? bankName,
    String? bankCode,
    String? accountNumber,
    String? accountName,
    _i2.WithdrawalStatus? status,
    Object? approvedBy = _Undefined,
    Object? approvedAt = _Undefined,
    Object? processedAt = _Undefined,
    Object? completedAt = _Undefined,
    Object? recipientCode = _Undefined,
    Object? transferCode = _Undefined,
    Object? transferId = _Undefined,
    Object? transferReference = _Undefined,
    Object? transferStatus = _Undefined,
    double? transferFee,
    Object? netAmount = _Undefined,
    Object? failureReason = _Undefined,
    Object? failureCode = _Undefined,
    int? retryCount,
    int? maxRetries,
    Object? vendorNotes = _Undefined,
    Object? adminNotes = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
    Object? cancelledAt = _Undefined,
  }) {
    return WithdrawalRequest(
      id: id ?? this.id,
      vendorId: vendorId ?? this.vendorId,
      vendor: vendor is _i3.VendorProfile? ? vendor : this.vendor?.copyWith(),
      walletId: walletId ?? this.walletId,
      wallet: wallet is _i4.VendorWallet? ? wallet : this.wallet?.copyWith(),
      requestNumber: requestNumber ?? this.requestNumber,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      bankName: bankName ?? this.bankName,
      bankCode: bankCode ?? this.bankCode,
      accountNumber: accountNumber ?? this.accountNumber,
      accountName: accountName ?? this.accountName,
      status: status ?? this.status,
      approvedBy: approvedBy is String? ? approvedBy : this.approvedBy,
      approvedAt: approvedAt is DateTime? ? approvedAt : this.approvedAt,
      processedAt: processedAt is DateTime? ? processedAt : this.processedAt,
      completedAt: completedAt is DateTime? ? completedAt : this.completedAt,
      recipientCode: recipientCode is String?
          ? recipientCode
          : this.recipientCode,
      transferCode: transferCode is String? ? transferCode : this.transferCode,
      transferId: transferId is String? ? transferId : this.transferId,
      transferReference: transferReference is String?
          ? transferReference
          : this.transferReference,
      transferStatus: transferStatus is String?
          ? transferStatus
          : this.transferStatus,
      transferFee: transferFee ?? this.transferFee,
      netAmount: netAmount is double? ? netAmount : this.netAmount,
      failureReason: failureReason is String?
          ? failureReason
          : this.failureReason,
      failureCode: failureCode is String? ? failureCode : this.failureCode,
      retryCount: retryCount ?? this.retryCount,
      maxRetries: maxRetries ?? this.maxRetries,
      vendorNotes: vendorNotes is String? ? vendorNotes : this.vendorNotes,
      adminNotes: adminNotes is String? ? adminNotes : this.adminNotes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      cancelledAt: cancelledAt is DateTime? ? cancelledAt : this.cancelledAt,
    );
  }
}
