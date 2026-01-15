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
import '../user/vendor_profile.dart' as _i2;
import 'package:asami_server/src/generated/protocol.dart' as _i3;

abstract class VendorWallet
    implements _i1.TableRow<_i1.UuidValue>, _i1.ProtocolSerialization {
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

  static final t = VendorWalletTable();

  static const db = VendorWalletRepository._();

  @override
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

  @override
  _i1.Table<_i1.UuidValue> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'VendorWallet',
      'id': id.toJson(),
      'vendorId': vendorId.toJson(),
      if (vendor != null) 'vendor': vendor?.toJsonForProtocol(),
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

  static VendorWalletInclude include({_i2.VendorProfileInclude? vendor}) {
    return VendorWalletInclude._(vendor: vendor);
  }

  static VendorWalletIncludeList includeList({
    _i1.WhereExpressionBuilder<VendorWalletTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<VendorWalletTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<VendorWalletTable>? orderByList,
    VendorWalletInclude? include,
  }) {
    return VendorWalletIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(VendorWallet.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(VendorWallet.t),
      include: include,
    );
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

class VendorWalletUpdateTable extends _i1.UpdateTable<VendorWalletTable> {
  VendorWalletUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> vendorId(_i1.UuidValue value) =>
      _i1.ColumnValue(
        table.vendorId,
        value,
      );

  _i1.ColumnValue<double, double> totalEarnings(double value) =>
      _i1.ColumnValue(
        table.totalEarnings,
        value,
      );

  _i1.ColumnValue<double, double> availableBalance(double value) =>
      _i1.ColumnValue(
        table.availableBalance,
        value,
      );

  _i1.ColumnValue<double, double> pendingBalance(double value) =>
      _i1.ColumnValue(
        table.pendingBalance,
        value,
      );

  _i1.ColumnValue<double, double> processingBalance(double value) =>
      _i1.ColumnValue(
        table.processingBalance,
        value,
      );

  _i1.ColumnValue<double, double> totalWithdrawn(double value) =>
      _i1.ColumnValue(
        table.totalWithdrawn,
        value,
      );

  _i1.ColumnValue<String, String> currency(String value) => _i1.ColumnValue(
    table.currency,
    value,
  );

  _i1.ColumnValue<String, String> bankName(String? value) => _i1.ColumnValue(
    table.bankName,
    value,
  );

  _i1.ColumnValue<String, String> bankCode(String? value) => _i1.ColumnValue(
    table.bankCode,
    value,
  );

  _i1.ColumnValue<String, String> accountNumber(String? value) =>
      _i1.ColumnValue(
        table.accountNumber,
        value,
      );

  _i1.ColumnValue<String, String> accountName(String? value) => _i1.ColumnValue(
    table.accountName,
    value,
  );

  _i1.ColumnValue<String, String> recipientCode(String? value) =>
      _i1.ColumnValue(
        table.recipientCode,
        value,
      );

  _i1.ColumnValue<String, String> recipientId(String? value) => _i1.ColumnValue(
    table.recipientId,
    value,
  );

  _i1.ColumnValue<bool, bool> isRecipientActive(bool value) => _i1.ColumnValue(
    table.isRecipientActive,
    value,
  );

  _i1.ColumnValue<double, double> minimumWithdrawal(double value) =>
      _i1.ColumnValue(
        table.minimumWithdrawal,
        value,
      );

  _i1.ColumnValue<bool, bool> autoWithdrawal(bool value) => _i1.ColumnValue(
    table.autoWithdrawal,
    value,
  );

  _i1.ColumnValue<double, double> autoWithdrawalThreshold(double? value) =>
      _i1.ColumnValue(
        table.autoWithdrawalThreshold,
        value,
      );

  _i1.ColumnValue<int, int> totalTransactions(int value) => _i1.ColumnValue(
    table.totalTransactions,
    value,
  );

  _i1.ColumnValue<int, int> successfulWithdrawals(int value) => _i1.ColumnValue(
    table.successfulWithdrawals,
    value,
  );

  _i1.ColumnValue<int, int> failedWithdrawals(int value) => _i1.ColumnValue(
    table.failedWithdrawals,
    value,
  );

  _i1.ColumnValue<bool, bool> isActive(bool value) => _i1.ColumnValue(
    table.isActive,
    value,
  );

  _i1.ColumnValue<bool, bool> isSuspended(bool value) => _i1.ColumnValue(
    table.isSuspended,
    value,
  );

  _i1.ColumnValue<String, String> suspensionReason(String? value) =>
      _i1.ColumnValue(
        table.suspensionReason,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> lastWithdrawalAt(DateTime? value) =>
      _i1.ColumnValue(
        table.lastWithdrawalAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> lastEarningAt(DateTime? value) =>
      _i1.ColumnValue(
        table.lastEarningAt,
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

class VendorWalletTable extends _i1.Table<_i1.UuidValue> {
  VendorWalletTable({super.tableRelation})
    : super(tableName: 'vendor_wallets') {
    updateTable = VendorWalletUpdateTable(this);
    vendorId = _i1.ColumnUuid(
      'vendorId',
      this,
    );
    totalEarnings = _i1.ColumnDouble(
      'totalEarnings',
      this,
      hasDefault: true,
    );
    availableBalance = _i1.ColumnDouble(
      'availableBalance',
      this,
      hasDefault: true,
    );
    pendingBalance = _i1.ColumnDouble(
      'pendingBalance',
      this,
      hasDefault: true,
    );
    processingBalance = _i1.ColumnDouble(
      'processingBalance',
      this,
      hasDefault: true,
    );
    totalWithdrawn = _i1.ColumnDouble(
      'totalWithdrawn',
      this,
      hasDefault: true,
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
    recipientCode = _i1.ColumnString(
      'recipientCode',
      this,
    );
    recipientId = _i1.ColumnString(
      'recipientId',
      this,
    );
    isRecipientActive = _i1.ColumnBool(
      'isRecipientActive',
      this,
      hasDefault: true,
    );
    minimumWithdrawal = _i1.ColumnDouble(
      'minimumWithdrawal',
      this,
      hasDefault: true,
    );
    autoWithdrawal = _i1.ColumnBool(
      'autoWithdrawal',
      this,
      hasDefault: true,
    );
    autoWithdrawalThreshold = _i1.ColumnDouble(
      'autoWithdrawalThreshold',
      this,
    );
    totalTransactions = _i1.ColumnInt(
      'totalTransactions',
      this,
      hasDefault: true,
    );
    successfulWithdrawals = _i1.ColumnInt(
      'successfulWithdrawals',
      this,
      hasDefault: true,
    );
    failedWithdrawals = _i1.ColumnInt(
      'failedWithdrawals',
      this,
      hasDefault: true,
    );
    isActive = _i1.ColumnBool(
      'isActive',
      this,
      hasDefault: true,
    );
    isSuspended = _i1.ColumnBool(
      'isSuspended',
      this,
      hasDefault: true,
    );
    suspensionReason = _i1.ColumnString(
      'suspensionReason',
      this,
    );
    lastWithdrawalAt = _i1.ColumnDateTime(
      'lastWithdrawalAt',
      this,
    );
    lastEarningAt = _i1.ColumnDateTime(
      'lastEarningAt',
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

  late final VendorWalletUpdateTable updateTable;

  late final _i1.ColumnUuid vendorId;

  _i2.VendorProfileTable? _vendor;

  late final _i1.ColumnDouble totalEarnings;

  late final _i1.ColumnDouble availableBalance;

  late final _i1.ColumnDouble pendingBalance;

  late final _i1.ColumnDouble processingBalance;

  late final _i1.ColumnDouble totalWithdrawn;

  late final _i1.ColumnString currency;

  late final _i1.ColumnString bankName;

  late final _i1.ColumnString bankCode;

  late final _i1.ColumnString accountNumber;

  late final _i1.ColumnString accountName;

  late final _i1.ColumnString recipientCode;

  late final _i1.ColumnString recipientId;

  late final _i1.ColumnBool isRecipientActive;

  late final _i1.ColumnDouble minimumWithdrawal;

  late final _i1.ColumnBool autoWithdrawal;

  late final _i1.ColumnDouble autoWithdrawalThreshold;

  late final _i1.ColumnInt totalTransactions;

  late final _i1.ColumnInt successfulWithdrawals;

  late final _i1.ColumnInt failedWithdrawals;

  late final _i1.ColumnBool isActive;

  late final _i1.ColumnBool isSuspended;

  late final _i1.ColumnString suspensionReason;

  late final _i1.ColumnDateTime lastWithdrawalAt;

  late final _i1.ColumnDateTime lastEarningAt;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  _i2.VendorProfileTable get vendor {
    if (_vendor != null) return _vendor!;
    _vendor = _i1.createRelationTable(
      relationFieldName: 'vendor',
      field: VendorWallet.t.vendorId,
      foreignField: _i2.VendorProfile.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.VendorProfileTable(tableRelation: foreignTableRelation),
    );
    return _vendor!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    vendorId,
    totalEarnings,
    availableBalance,
    pendingBalance,
    processingBalance,
    totalWithdrawn,
    currency,
    bankName,
    bankCode,
    accountNumber,
    accountName,
    recipientCode,
    recipientId,
    isRecipientActive,
    minimumWithdrawal,
    autoWithdrawal,
    autoWithdrawalThreshold,
    totalTransactions,
    successfulWithdrawals,
    failedWithdrawals,
    isActive,
    isSuspended,
    suspensionReason,
    lastWithdrawalAt,
    lastEarningAt,
    createdAt,
    updatedAt,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'vendor') {
      return vendor;
    }
    return null;
  }
}

class VendorWalletInclude extends _i1.IncludeObject {
  VendorWalletInclude._({_i2.VendorProfileInclude? vendor}) {
    _vendor = vendor;
  }

  _i2.VendorProfileInclude? _vendor;

  @override
  Map<String, _i1.Include?> get includes => {'vendor': _vendor};

  @override
  _i1.Table<_i1.UuidValue> get table => VendorWallet.t;
}

class VendorWalletIncludeList extends _i1.IncludeList {
  VendorWalletIncludeList._({
    _i1.WhereExpressionBuilder<VendorWalletTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(VendorWallet.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue> get table => VendorWallet.t;
}

class VendorWalletRepository {
  const VendorWalletRepository._();

  final attachRow = const VendorWalletAttachRowRepository._();

  /// Returns a list of [VendorWallet]s matching the given query parameters.
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
  Future<List<VendorWallet>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<VendorWalletTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<VendorWalletTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<VendorWalletTable>? orderByList,
    _i1.Transaction? transaction,
    VendorWalletInclude? include,
  }) async {
    return session.db.find<VendorWallet>(
      where: where?.call(VendorWallet.t),
      orderBy: orderBy?.call(VendorWallet.t),
      orderByList: orderByList?.call(VendorWallet.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [VendorWallet] matching the given query parameters.
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
  Future<VendorWallet?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<VendorWalletTable>? where,
    int? offset,
    _i1.OrderByBuilder<VendorWalletTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<VendorWalletTable>? orderByList,
    _i1.Transaction? transaction,
    VendorWalletInclude? include,
  }) async {
    return session.db.findFirstRow<VendorWallet>(
      where: where?.call(VendorWallet.t),
      orderBy: orderBy?.call(VendorWallet.t),
      orderByList: orderByList?.call(VendorWallet.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [VendorWallet] by its [id] or null if no such row exists.
  Future<VendorWallet?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
    VendorWalletInclude? include,
  }) async {
    return session.db.findById<VendorWallet>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [VendorWallet]s in the list and returns the inserted rows.
  ///
  /// The returned [VendorWallet]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<VendorWallet>> insert(
    _i1.Session session,
    List<VendorWallet> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<VendorWallet>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [VendorWallet] and returns the inserted row.
  ///
  /// The returned [VendorWallet] will have its `id` field set.
  Future<VendorWallet> insertRow(
    _i1.Session session,
    VendorWallet row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<VendorWallet>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [VendorWallet]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<VendorWallet>> update(
    _i1.Session session,
    List<VendorWallet> rows, {
    _i1.ColumnSelections<VendorWalletTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<VendorWallet>(
      rows,
      columns: columns?.call(VendorWallet.t),
      transaction: transaction,
    );
  }

  /// Updates a single [VendorWallet]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<VendorWallet> updateRow(
    _i1.Session session,
    VendorWallet row, {
    _i1.ColumnSelections<VendorWalletTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<VendorWallet>(
      row,
      columns: columns?.call(VendorWallet.t),
      transaction: transaction,
    );
  }

  /// Updates a single [VendorWallet] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<VendorWallet?> updateById(
    _i1.Session session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<VendorWalletUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<VendorWallet>(
      id,
      columnValues: columnValues(VendorWallet.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [VendorWallet]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<VendorWallet>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<VendorWalletUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<VendorWalletTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<VendorWalletTable>? orderBy,
    _i1.OrderByListBuilder<VendorWalletTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<VendorWallet>(
      columnValues: columnValues(VendorWallet.t.updateTable),
      where: where(VendorWallet.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(VendorWallet.t),
      orderByList: orderByList?.call(VendorWallet.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [VendorWallet]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<VendorWallet>> delete(
    _i1.Session session,
    List<VendorWallet> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<VendorWallet>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [VendorWallet].
  Future<VendorWallet> deleteRow(
    _i1.Session session,
    VendorWallet row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<VendorWallet>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<VendorWallet>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<VendorWalletTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<VendorWallet>(
      where: where(VendorWallet.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<VendorWalletTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<VendorWallet>(
      where: where?.call(VendorWallet.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class VendorWalletAttachRowRepository {
  const VendorWalletAttachRowRepository._();

  /// Creates a relation between the given [VendorWallet] and [VendorProfile]
  /// by setting the [VendorWallet]'s foreign key `vendorId` to refer to the [VendorProfile].
  Future<void> vendor(
    _i1.Session session,
    VendorWallet vendorWallet,
    _i2.VendorProfile vendor, {
    _i1.Transaction? transaction,
  }) async {
    if (vendorWallet.id == null) {
      throw ArgumentError.notNull('vendorWallet.id');
    }
    if (vendor.id == null) {
      throw ArgumentError.notNull('vendor.id');
    }

    var $vendorWallet = vendorWallet.copyWith(vendorId: vendor.id);
    await session.db.updateRow<VendorWallet>(
      $vendorWallet,
      columns: [VendorWallet.t.vendorId],
      transaction: transaction,
    );
  }
}
