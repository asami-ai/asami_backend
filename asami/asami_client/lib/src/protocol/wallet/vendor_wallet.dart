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
import '../user/vendor_profile.dart' as _i2;
import 'package:asami_client/src/protocol/protocol.dart' as _i3;

abstract class VendorWallet implements _i1.SerializableModel {
  VendorWallet._({
    _i1.UuidValue? id,
    required this.vendorId,
    this.vendor,
    double? totalEarnings,
    double? availableBalance,
    double? pendingBalance,
    double? processingBalance,
    double? totalWithdrawn,
    String? currency,
    this.bankName,
    this.bankCode,
    this.accountNumber,
    this.accountName,
    this.recipientCode,
    this.recipientId,
    bool? isRecipientActive,
    double? minimumWithdrawal,
    bool? autoWithdrawal,
    this.autoWithdrawalThreshold,
    int? totalTransactions,
    int? successfulWithdrawals,
    int? failedWithdrawals,
    bool? isActive,
    bool? isSuspended,
    this.suspensionReason,
    this.lastWithdrawalAt,
    this.lastEarningAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : id = id ?? _i1.Uuid().v4obj(),
       totalEarnings = totalEarnings ?? 0.0,
       availableBalance = availableBalance ?? 0.0,
       pendingBalance = pendingBalance ?? 0.0,
       processingBalance = processingBalance ?? 0.0,
       totalWithdrawn = totalWithdrawn ?? 0.0,
       currency = currency ?? 'NGN',
       isRecipientActive = isRecipientActive ?? false,
       minimumWithdrawal = minimumWithdrawal ?? 1000.0,
       autoWithdrawal = autoWithdrawal ?? false,
       totalTransactions = totalTransactions ?? 0,
       successfulWithdrawals = successfulWithdrawals ?? 0,
       failedWithdrawals = failedWithdrawals ?? 0,
       isActive = isActive ?? true,
       isSuspended = isSuspended ?? false,
       createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory VendorWallet({
    _i1.UuidValue? id,
    required _i1.UuidValue vendorId,
    _i2.VendorProfile? vendor,
    double? totalEarnings,
    double? availableBalance,
    double? pendingBalance,
    double? processingBalance,
    double? totalWithdrawn,
    String? currency,
    String? bankName,
    String? bankCode,
    String? accountNumber,
    String? accountName,
    String? recipientCode,
    String? recipientId,
    bool? isRecipientActive,
    double? minimumWithdrawal,
    bool? autoWithdrawal,
    double? autoWithdrawalThreshold,
    int? totalTransactions,
    int? successfulWithdrawals,
    int? failedWithdrawals,
    bool? isActive,
    bool? isSuspended,
    String? suspensionReason,
    DateTime? lastWithdrawalAt,
    DateTime? lastEarningAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _VendorWalletImpl;

  factory VendorWallet.fromJson(Map<String, dynamic> jsonSerialization) {
    return VendorWallet(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      vendorId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['vendorId'],
      ),
      vendor: jsonSerialization['vendor'] == null
          ? null
          : _i3.Protocol().deserialize<_i2.VendorProfile>(
              jsonSerialization['vendor'],
            ),
      totalEarnings: (jsonSerialization['totalEarnings'] as num?)?.toDouble(),
      availableBalance: (jsonSerialization['availableBalance'] as num?)
          ?.toDouble(),
      pendingBalance: (jsonSerialization['pendingBalance'] as num?)?.toDouble(),
      processingBalance: (jsonSerialization['processingBalance'] as num?)
          ?.toDouble(),
      totalWithdrawn: (jsonSerialization['totalWithdrawn'] as num?)?.toDouble(),
      currency: jsonSerialization['currency'] as String?,
      bankName: jsonSerialization['bankName'] as String?,
      bankCode: jsonSerialization['bankCode'] as String?,
      accountNumber: jsonSerialization['accountNumber'] as String?,
      accountName: jsonSerialization['accountName'] as String?,
      recipientCode: jsonSerialization['recipientCode'] as String?,
      recipientId: jsonSerialization['recipientId'] as String?,
      isRecipientActive: jsonSerialization['isRecipientActive'] as bool?,
      minimumWithdrawal: (jsonSerialization['minimumWithdrawal'] as num?)
          ?.toDouble(),
      autoWithdrawal: jsonSerialization['autoWithdrawal'] as bool?,
      autoWithdrawalThreshold:
          (jsonSerialization['autoWithdrawalThreshold'] as num?)?.toDouble(),
      totalTransactions: jsonSerialization['totalTransactions'] as int?,
      successfulWithdrawals: jsonSerialization['successfulWithdrawals'] as int?,
      failedWithdrawals: jsonSerialization['failedWithdrawals'] as int?,
      isActive: jsonSerialization['isActive'] as bool?,
      isSuspended: jsonSerialization['isSuspended'] as bool?,
      suspensionReason: jsonSerialization['suspensionReason'] as String?,
      lastWithdrawalAt: jsonSerialization['lastWithdrawalAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastWithdrawalAt'],
            ),
      lastEarningAt: jsonSerialization['lastEarningAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastEarningAt'],
            ),
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

  _i1.UuidValue vendorId;

  _i2.VendorProfile? vendor;

  double totalEarnings;

  double availableBalance;

  double pendingBalance;

  double processingBalance;

  double totalWithdrawn;

  String currency;

  String? bankName;

  String? bankCode;

  String? accountNumber;

  String? accountName;

  String? recipientCode;

  String? recipientId;

  bool isRecipientActive;

  double minimumWithdrawal;

  bool autoWithdrawal;

  double? autoWithdrawalThreshold;

  int totalTransactions;

  int successfulWithdrawals;

  int failedWithdrawals;

  bool isActive;

  bool isSuspended;

  String? suspensionReason;

  DateTime? lastWithdrawalAt;

  DateTime? lastEarningAt;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [VendorWallet]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  VendorWallet copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? vendorId,
    _i2.VendorProfile? vendor,
    double? totalEarnings,
    double? availableBalance,
    double? pendingBalance,
    double? processingBalance,
    double? totalWithdrawn,
    String? currency,
    String? bankName,
    String? bankCode,
    String? accountNumber,
    String? accountName,
    String? recipientCode,
    String? recipientId,
    bool? isRecipientActive,
    double? minimumWithdrawal,
    bool? autoWithdrawal,
    double? autoWithdrawalThreshold,
    int? totalTransactions,
    int? successfulWithdrawals,
    int? failedWithdrawals,
    bool? isActive,
    bool? isSuspended,
    String? suspensionReason,
    DateTime? lastWithdrawalAt,
    DateTime? lastEarningAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'VendorWallet',
      'id': id.toJson(),
      'vendorId': vendorId.toJson(),
      if (vendor != null) 'vendor': vendor?.toJson(),
      'totalEarnings': totalEarnings,
      'availableBalance': availableBalance,
      'pendingBalance': pendingBalance,
      'processingBalance': processingBalance,
      'totalWithdrawn': totalWithdrawn,
      'currency': currency,
      if (bankName != null) 'bankName': bankName,
      if (bankCode != null) 'bankCode': bankCode,
      if (accountNumber != null) 'accountNumber': accountNumber,
      if (accountName != null) 'accountName': accountName,
      if (recipientCode != null) 'recipientCode': recipientCode,
      if (recipientId != null) 'recipientId': recipientId,
      'isRecipientActive': isRecipientActive,
      'minimumWithdrawal': minimumWithdrawal,
      'autoWithdrawal': autoWithdrawal,
      if (autoWithdrawalThreshold != null)
        'autoWithdrawalThreshold': autoWithdrawalThreshold,
      'totalTransactions': totalTransactions,
      'successfulWithdrawals': successfulWithdrawals,
      'failedWithdrawals': failedWithdrawals,
      'isActive': isActive,
      'isSuspended': isSuspended,
      if (suspensionReason != null) 'suspensionReason': suspensionReason,
      if (lastWithdrawalAt != null)
        'lastWithdrawalAt': lastWithdrawalAt?.toJson(),
      if (lastEarningAt != null) 'lastEarningAt': lastEarningAt?.toJson(),
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

class _VendorWalletImpl extends VendorWallet {
  _VendorWalletImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue vendorId,
    _i2.VendorProfile? vendor,
    double? totalEarnings,
    double? availableBalance,
    double? pendingBalance,
    double? processingBalance,
    double? totalWithdrawn,
    String? currency,
    String? bankName,
    String? bankCode,
    String? accountNumber,
    String? accountName,
    String? recipientCode,
    String? recipientId,
    bool? isRecipientActive,
    double? minimumWithdrawal,
    bool? autoWithdrawal,
    double? autoWithdrawalThreshold,
    int? totalTransactions,
    int? successfulWithdrawals,
    int? failedWithdrawals,
    bool? isActive,
    bool? isSuspended,
    String? suspensionReason,
    DateTime? lastWithdrawalAt,
    DateTime? lastEarningAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         vendorId: vendorId,
         vendor: vendor,
         totalEarnings: totalEarnings,
         availableBalance: availableBalance,
         pendingBalance: pendingBalance,
         processingBalance: processingBalance,
         totalWithdrawn: totalWithdrawn,
         currency: currency,
         bankName: bankName,
         bankCode: bankCode,
         accountNumber: accountNumber,
         accountName: accountName,
         recipientCode: recipientCode,
         recipientId: recipientId,
         isRecipientActive: isRecipientActive,
         minimumWithdrawal: minimumWithdrawal,
         autoWithdrawal: autoWithdrawal,
         autoWithdrawalThreshold: autoWithdrawalThreshold,
         totalTransactions: totalTransactions,
         successfulWithdrawals: successfulWithdrawals,
         failedWithdrawals: failedWithdrawals,
         isActive: isActive,
         isSuspended: isSuspended,
         suspensionReason: suspensionReason,
         lastWithdrawalAt: lastWithdrawalAt,
         lastEarningAt: lastEarningAt,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [VendorWallet]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  VendorWallet copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? vendorId,
    Object? vendor = _Undefined,
    double? totalEarnings,
    double? availableBalance,
    double? pendingBalance,
    double? processingBalance,
    double? totalWithdrawn,
    String? currency,
    Object? bankName = _Undefined,
    Object? bankCode = _Undefined,
    Object? accountNumber = _Undefined,
    Object? accountName = _Undefined,
    Object? recipientCode = _Undefined,
    Object? recipientId = _Undefined,
    bool? isRecipientActive,
    double? minimumWithdrawal,
    bool? autoWithdrawal,
    Object? autoWithdrawalThreshold = _Undefined,
    int? totalTransactions,
    int? successfulWithdrawals,
    int? failedWithdrawals,
    bool? isActive,
    bool? isSuspended,
    Object? suspensionReason = _Undefined,
    Object? lastWithdrawalAt = _Undefined,
    Object? lastEarningAt = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return VendorWallet(
      id: id ?? this.id,
      vendorId: vendorId ?? this.vendorId,
      vendor: vendor is _i2.VendorProfile? ? vendor : this.vendor?.copyWith(),
      totalEarnings: totalEarnings ?? this.totalEarnings,
      availableBalance: availableBalance ?? this.availableBalance,
      pendingBalance: pendingBalance ?? this.pendingBalance,
      processingBalance: processingBalance ?? this.processingBalance,
      totalWithdrawn: totalWithdrawn ?? this.totalWithdrawn,
      currency: currency ?? this.currency,
      bankName: bankName is String? ? bankName : this.bankName,
      bankCode: bankCode is String? ? bankCode : this.bankCode,
      accountNumber: accountNumber is String?
          ? accountNumber
          : this.accountNumber,
      accountName: accountName is String? ? accountName : this.accountName,
      recipientCode: recipientCode is String?
          ? recipientCode
          : this.recipientCode,
      recipientId: recipientId is String? ? recipientId : this.recipientId,
      isRecipientActive: isRecipientActive ?? this.isRecipientActive,
      minimumWithdrawal: minimumWithdrawal ?? this.minimumWithdrawal,
      autoWithdrawal: autoWithdrawal ?? this.autoWithdrawal,
      autoWithdrawalThreshold: autoWithdrawalThreshold is double?
          ? autoWithdrawalThreshold
          : this.autoWithdrawalThreshold,
      totalTransactions: totalTransactions ?? this.totalTransactions,
      successfulWithdrawals:
          successfulWithdrawals ?? this.successfulWithdrawals,
      failedWithdrawals: failedWithdrawals ?? this.failedWithdrawals,
      isActive: isActive ?? this.isActive,
      isSuspended: isSuspended ?? this.isSuspended,
      suspensionReason: suspensionReason is String?
          ? suspensionReason
          : this.suspensionReason,
      lastWithdrawalAt: lastWithdrawalAt is DateTime?
          ? lastWithdrawalAt
          : this.lastWithdrawalAt,
      lastEarningAt: lastEarningAt is DateTime?
          ? lastEarningAt
          : this.lastEarningAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
