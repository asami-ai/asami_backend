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
import '../order/wallet_enums/withdrawal_status.dart' as _i2;
import '../user/vendor_profile.dart' as _i3;
import '../wallet/vendor_wallet.dart' as _i4;
import 'package:asami_server/src/generated/protocol.dart' as _i5;

abstract class WithdrawalRequest
    implements _i1.TableRow<_i1.UuidValue>, _i1.ProtocolSerialization {
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

  static final t = WithdrawalRequestTable();

  static const db = WithdrawalRequestRepository._();

  @override
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

  @override
  _i1.Table<_i1.UuidValue> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'WithdrawalRequest',
      'id': id.toJson(),
      'vendorId': vendorId.toJson(),
      if (vendor != null) 'vendor': vendor?.toJsonForProtocol(),
      'walletId': walletId.toJson(),
      if (wallet != null) 'wallet': wallet?.toJsonForProtocol(),
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

  static WithdrawalRequestInclude include({
    _i3.VendorProfileInclude? vendor,
    _i4.VendorWalletInclude? wallet,
  }) {
    return WithdrawalRequestInclude._(
      vendor: vendor,
      wallet: wallet,
    );
  }

  static WithdrawalRequestIncludeList includeList({
    _i1.WhereExpressionBuilder<WithdrawalRequestTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<WithdrawalRequestTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<WithdrawalRequestTable>? orderByList,
    WithdrawalRequestInclude? include,
  }) {
    return WithdrawalRequestIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(WithdrawalRequest.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(WithdrawalRequest.t),
      include: include,
    );
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

class WithdrawalRequestUpdateTable
    extends _i1.UpdateTable<WithdrawalRequestTable> {
  WithdrawalRequestUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> vendorId(_i1.UuidValue value) =>
      _i1.ColumnValue(
        table.vendorId,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> walletId(_i1.UuidValue value) =>
      _i1.ColumnValue(
        table.walletId,
        value,
      );

  _i1.ColumnValue<String, String> requestNumber(String value) =>
      _i1.ColumnValue(
        table.requestNumber,
        value,
      );

  _i1.ColumnValue<double, double> amount(double value) => _i1.ColumnValue(
    table.amount,
    value,
  );

  _i1.ColumnValue<String, String> currency(String value) => _i1.ColumnValue(
    table.currency,
    value,
  );

  _i1.ColumnValue<String, String> bankName(String value) => _i1.ColumnValue(
    table.bankName,
    value,
  );

  _i1.ColumnValue<String, String> bankCode(String value) => _i1.ColumnValue(
    table.bankCode,
    value,
  );

  _i1.ColumnValue<String, String> accountNumber(String value) =>
      _i1.ColumnValue(
        table.accountNumber,
        value,
      );

  _i1.ColumnValue<String, String> accountName(String value) => _i1.ColumnValue(
    table.accountName,
    value,
  );

  _i1.ColumnValue<_i2.WithdrawalStatus, _i2.WithdrawalStatus> status(
    _i2.WithdrawalStatus value,
  ) => _i1.ColumnValue(
    table.status,
    value,
  );

  _i1.ColumnValue<String, String> approvedBy(String? value) => _i1.ColumnValue(
    table.approvedBy,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> approvedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.approvedAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> processedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.processedAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> completedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.completedAt,
        value,
      );

  _i1.ColumnValue<String, String> recipientCode(String? value) =>
      _i1.ColumnValue(
        table.recipientCode,
        value,
      );

  _i1.ColumnValue<String, String> transferCode(String? value) =>
      _i1.ColumnValue(
        table.transferCode,
        value,
      );

  _i1.ColumnValue<String, String> transferId(String? value) => _i1.ColumnValue(
    table.transferId,
    value,
  );

  _i1.ColumnValue<String, String> transferReference(String? value) =>
      _i1.ColumnValue(
        table.transferReference,
        value,
      );

  _i1.ColumnValue<String, String> transferStatus(String? value) =>
      _i1.ColumnValue(
        table.transferStatus,
        value,
      );

  _i1.ColumnValue<double, double> transferFee(double value) => _i1.ColumnValue(
    table.transferFee,
    value,
  );

  _i1.ColumnValue<double, double> netAmount(double? value) => _i1.ColumnValue(
    table.netAmount,
    value,
  );

  _i1.ColumnValue<String, String> failureReason(String? value) =>
      _i1.ColumnValue(
        table.failureReason,
        value,
      );

  _i1.ColumnValue<String, String> failureCode(String? value) => _i1.ColumnValue(
    table.failureCode,
    value,
  );

  _i1.ColumnValue<int, int> retryCount(int value) => _i1.ColumnValue(
    table.retryCount,
    value,
  );

  _i1.ColumnValue<int, int> maxRetries(int value) => _i1.ColumnValue(
    table.maxRetries,
    value,
  );

  _i1.ColumnValue<String, String> vendorNotes(String? value) => _i1.ColumnValue(
    table.vendorNotes,
    value,
  );

  _i1.ColumnValue<String, String> adminNotes(String? value) => _i1.ColumnValue(
    table.adminNotes,
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

  _i1.ColumnValue<DateTime, DateTime> cancelledAt(DateTime? value) =>
      _i1.ColumnValue(
        table.cancelledAt,
        value,
      );
}

class WithdrawalRequestTable extends _i1.Table<_i1.UuidValue> {
  WithdrawalRequestTable({super.tableRelation})
    : super(tableName: 'withdrawal_requests') {
    updateTable = WithdrawalRequestUpdateTable(this);
    vendorId = _i1.ColumnUuid(
      'vendorId',
      this,
    );
    walletId = _i1.ColumnUuid(
      'walletId',
      this,
    );
    requestNumber = _i1.ColumnString(
      'requestNumber',
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
    bankName = _i1.ColumnString(
      'bankName',
      this,
    );
    bankCode = _i1.ColumnString(
      'bankCode',
      this,
    );
    accountNumber = _i1.ColumnString(
      'accountNumber',
      this,
    );
    accountName = _i1.ColumnString(
      'accountName',
      this,
    );
    status = _i1.ColumnEnum(
      'status',
      this,
      _i1.EnumSerialization.byName,
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
    processedAt = _i1.ColumnDateTime(
      'processedAt',
      this,
    );
    completedAt = _i1.ColumnDateTime(
      'completedAt',
      this,
    );
    recipientCode = _i1.ColumnString(
      'recipientCode',
      this,
    );
    transferCode = _i1.ColumnString(
      'transferCode',
      this,
    );
    transferId = _i1.ColumnString(
      'transferId',
      this,
    );
    transferReference = _i1.ColumnString(
      'transferReference',
      this,
    );
    transferStatus = _i1.ColumnString(
      'transferStatus',
      this,
    );
    transferFee = _i1.ColumnDouble(
      'transferFee',
      this,
      hasDefault: true,
    );
    netAmount = _i1.ColumnDouble(
      'netAmount',
      this,
    );
    failureReason = _i1.ColumnString(
      'failureReason',
      this,
    );
    failureCode = _i1.ColumnString(
      'failureCode',
      this,
    );
    retryCount = _i1.ColumnInt(
      'retryCount',
      this,
      hasDefault: true,
    );
    maxRetries = _i1.ColumnInt(
      'maxRetries',
      this,
      hasDefault: true,
    );
    vendorNotes = _i1.ColumnString(
      'vendorNotes',
      this,
    );
    adminNotes = _i1.ColumnString(
      'adminNotes',
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
    cancelledAt = _i1.ColumnDateTime(
      'cancelledAt',
      this,
    );
  }

  late final WithdrawalRequestUpdateTable updateTable;

  late final _i1.ColumnUuid vendorId;

  _i3.VendorProfileTable? _vendor;

  late final _i1.ColumnUuid walletId;

  _i4.VendorWalletTable? _wallet;

  late final _i1.ColumnString requestNumber;

  late final _i1.ColumnDouble amount;

  late final _i1.ColumnString currency;

  late final _i1.ColumnString bankName;

  late final _i1.ColumnString bankCode;

  late final _i1.ColumnString accountNumber;

  late final _i1.ColumnString accountName;

  late final _i1.ColumnEnum<_i2.WithdrawalStatus> status;

  late final _i1.ColumnString approvedBy;

  late final _i1.ColumnDateTime approvedAt;

  late final _i1.ColumnDateTime processedAt;

  late final _i1.ColumnDateTime completedAt;

  late final _i1.ColumnString recipientCode;

  late final _i1.ColumnString transferCode;

  late final _i1.ColumnString transferId;

  late final _i1.ColumnString transferReference;

  late final _i1.ColumnString transferStatus;

  late final _i1.ColumnDouble transferFee;

  late final _i1.ColumnDouble netAmount;

  late final _i1.ColumnString failureReason;

  late final _i1.ColumnString failureCode;

  late final _i1.ColumnInt retryCount;

  late final _i1.ColumnInt maxRetries;

  late final _i1.ColumnString vendorNotes;

  late final _i1.ColumnString adminNotes;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  late final _i1.ColumnDateTime cancelledAt;

  _i3.VendorProfileTable get vendor {
    if (_vendor != null) return _vendor!;
    _vendor = _i1.createRelationTable(
      relationFieldName: 'vendor',
      field: WithdrawalRequest.t.vendorId,
      foreignField: _i3.VendorProfile.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.VendorProfileTable(tableRelation: foreignTableRelation),
    );
    return _vendor!;
  }

  _i4.VendorWalletTable get wallet {
    if (_wallet != null) return _wallet!;
    _wallet = _i1.createRelationTable(
      relationFieldName: 'wallet',
      field: WithdrawalRequest.t.walletId,
      foreignField: _i4.VendorWallet.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.VendorWalletTable(tableRelation: foreignTableRelation),
    );
    return _wallet!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    vendorId,
    walletId,
    requestNumber,
    amount,
    currency,
    bankName,
    bankCode,
    accountNumber,
    accountName,
    status,
    approvedBy,
    approvedAt,
    processedAt,
    completedAt,
    recipientCode,
    transferCode,
    transferId,
    transferReference,
    transferStatus,
    transferFee,
    netAmount,
    failureReason,
    failureCode,
    retryCount,
    maxRetries,
    vendorNotes,
    adminNotes,
    createdAt,
    updatedAt,
    cancelledAt,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'vendor') {
      return vendor;
    }
    if (relationField == 'wallet') {
      return wallet;
    }
    return null;
  }
}

class WithdrawalRequestInclude extends _i1.IncludeObject {
  WithdrawalRequestInclude._({
    _i3.VendorProfileInclude? vendor,
    _i4.VendorWalletInclude? wallet,
  }) {
    _vendor = vendor;
    _wallet = wallet;
  }

  _i3.VendorProfileInclude? _vendor;

  _i4.VendorWalletInclude? _wallet;

  @override
  Map<String, _i1.Include?> get includes => {
    'vendor': _vendor,
    'wallet': _wallet,
  };

  @override
  _i1.Table<_i1.UuidValue> get table => WithdrawalRequest.t;
}

class WithdrawalRequestIncludeList extends _i1.IncludeList {
  WithdrawalRequestIncludeList._({
    _i1.WhereExpressionBuilder<WithdrawalRequestTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(WithdrawalRequest.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue> get table => WithdrawalRequest.t;
}

class WithdrawalRequestRepository {
  const WithdrawalRequestRepository._();

  final attachRow = const WithdrawalRequestAttachRowRepository._();

  /// Returns a list of [WithdrawalRequest]s matching the given query parameters.
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
  Future<List<WithdrawalRequest>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<WithdrawalRequestTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<WithdrawalRequestTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<WithdrawalRequestTable>? orderByList,
    _i1.Transaction? transaction,
    WithdrawalRequestInclude? include,
  }) async {
    return session.db.find<WithdrawalRequest>(
      where: where?.call(WithdrawalRequest.t),
      orderBy: orderBy?.call(WithdrawalRequest.t),
      orderByList: orderByList?.call(WithdrawalRequest.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [WithdrawalRequest] matching the given query parameters.
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
  Future<WithdrawalRequest?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<WithdrawalRequestTable>? where,
    int? offset,
    _i1.OrderByBuilder<WithdrawalRequestTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<WithdrawalRequestTable>? orderByList,
    _i1.Transaction? transaction,
    WithdrawalRequestInclude? include,
  }) async {
    return session.db.findFirstRow<WithdrawalRequest>(
      where: where?.call(WithdrawalRequest.t),
      orderBy: orderBy?.call(WithdrawalRequest.t),
      orderByList: orderByList?.call(WithdrawalRequest.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [WithdrawalRequest] by its [id] or null if no such row exists.
  Future<WithdrawalRequest?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
    WithdrawalRequestInclude? include,
  }) async {
    return session.db.findById<WithdrawalRequest>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [WithdrawalRequest]s in the list and returns the inserted rows.
  ///
  /// The returned [WithdrawalRequest]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<WithdrawalRequest>> insert(
    _i1.Session session,
    List<WithdrawalRequest> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<WithdrawalRequest>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [WithdrawalRequest] and returns the inserted row.
  ///
  /// The returned [WithdrawalRequest] will have its `id` field set.
  Future<WithdrawalRequest> insertRow(
    _i1.Session session,
    WithdrawalRequest row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<WithdrawalRequest>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [WithdrawalRequest]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<WithdrawalRequest>> update(
    _i1.Session session,
    List<WithdrawalRequest> rows, {
    _i1.ColumnSelections<WithdrawalRequestTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<WithdrawalRequest>(
      rows,
      columns: columns?.call(WithdrawalRequest.t),
      transaction: transaction,
    );
  }

  /// Updates a single [WithdrawalRequest]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<WithdrawalRequest> updateRow(
    _i1.Session session,
    WithdrawalRequest row, {
    _i1.ColumnSelections<WithdrawalRequestTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<WithdrawalRequest>(
      row,
      columns: columns?.call(WithdrawalRequest.t),
      transaction: transaction,
    );
  }

  /// Updates a single [WithdrawalRequest] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<WithdrawalRequest?> updateById(
    _i1.Session session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<WithdrawalRequestUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<WithdrawalRequest>(
      id,
      columnValues: columnValues(WithdrawalRequest.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [WithdrawalRequest]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<WithdrawalRequest>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<WithdrawalRequestUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<WithdrawalRequestTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<WithdrawalRequestTable>? orderBy,
    _i1.OrderByListBuilder<WithdrawalRequestTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<WithdrawalRequest>(
      columnValues: columnValues(WithdrawalRequest.t.updateTable),
      where: where(WithdrawalRequest.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(WithdrawalRequest.t),
      orderByList: orderByList?.call(WithdrawalRequest.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [WithdrawalRequest]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<WithdrawalRequest>> delete(
    _i1.Session session,
    List<WithdrawalRequest> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<WithdrawalRequest>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [WithdrawalRequest].
  Future<WithdrawalRequest> deleteRow(
    _i1.Session session,
    WithdrawalRequest row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<WithdrawalRequest>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<WithdrawalRequest>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<WithdrawalRequestTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<WithdrawalRequest>(
      where: where(WithdrawalRequest.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<WithdrawalRequestTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<WithdrawalRequest>(
      where: where?.call(WithdrawalRequest.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class WithdrawalRequestAttachRowRepository {
  const WithdrawalRequestAttachRowRepository._();

  /// Creates a relation between the given [WithdrawalRequest] and [VendorProfile]
  /// by setting the [WithdrawalRequest]'s foreign key `vendorId` to refer to the [VendorProfile].
  Future<void> vendor(
    _i1.Session session,
    WithdrawalRequest withdrawalRequest,
    _i3.VendorProfile vendor, {
    _i1.Transaction? transaction,
  }) async {
    if (withdrawalRequest.id == null) {
      throw ArgumentError.notNull('withdrawalRequest.id');
    }
    if (vendor.id == null) {
      throw ArgumentError.notNull('vendor.id');
    }

    var $withdrawalRequest = withdrawalRequest.copyWith(vendorId: vendor.id);
    await session.db.updateRow<WithdrawalRequest>(
      $withdrawalRequest,
      columns: [WithdrawalRequest.t.vendorId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [WithdrawalRequest] and [VendorWallet]
  /// by setting the [WithdrawalRequest]'s foreign key `walletId` to refer to the [VendorWallet].
  Future<void> wallet(
    _i1.Session session,
    WithdrawalRequest withdrawalRequest,
    _i4.VendorWallet wallet, {
    _i1.Transaction? transaction,
  }) async {
    if (withdrawalRequest.id == null) {
      throw ArgumentError.notNull('withdrawalRequest.id');
    }
    if (wallet.id == null) {
      throw ArgumentError.notNull('wallet.id');
    }

    var $withdrawalRequest = withdrawalRequest.copyWith(walletId: wallet.id);
    await session.db.updateRow<WithdrawalRequest>(
      $withdrawalRequest,
      columns: [WithdrawalRequest.t.walletId],
      transaction: transaction,
    );
  }
}
