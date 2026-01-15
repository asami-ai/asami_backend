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
import '../order/wallet_enums/transaction_status.dart' as _i2;
import '../wallet/vendor_wallet.dart' as _i3;
import '../order/wallet_enums/wallet_transaction_type.dart' as _i4;
import '../order/order.dart' as _i5;
import 'package:asami_server/src/generated/protocol.dart' as _i6;

abstract class WalletTransaction
    implements _i1.TableRow<_i1.UuidValue>, _i1.ProtocolSerialization {
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

  static final t = WalletTransactionTable();

  static const db = WalletTransactionRepository._();

  @override
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

  @override
  _i1.Table<_i1.UuidValue> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'WalletTransaction',
      'id': id.toJson(),
      'walletId': walletId.toJson(),
      if (wallet != null) 'wallet': wallet?.toJsonForProtocol(),
      'vendorId': vendorId.toJson(),
      'type': type.toJson(),
      'amount': amount,
      'balanceBefore': balanceBefore,
      'balanceAfter': balanceAfter,
      'referenceType': referenceType,
      if (referenceId != null) 'referenceId': referenceId,
      if (orderId != null) 'orderId': orderId?.toJson(),
      if (order != null) 'order': order?.toJsonForProtocol(),
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

  static WalletTransactionInclude include({
    _i3.VendorWalletInclude? wallet,
    _i5.OrderInclude? order,
  }) {
    return WalletTransactionInclude._(
      wallet: wallet,
      order: order,
    );
  }

  static WalletTransactionIncludeList includeList({
    _i1.WhereExpressionBuilder<WalletTransactionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<WalletTransactionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<WalletTransactionTable>? orderByList,
    WalletTransactionInclude? include,
  }) {
    return WalletTransactionIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(WalletTransaction.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(WalletTransaction.t),
      include: include,
    );
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

class WalletTransactionUpdateTable
    extends _i1.UpdateTable<WalletTransactionTable> {
  WalletTransactionUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> walletId(_i1.UuidValue value) =>
      _i1.ColumnValue(
        table.walletId,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> vendorId(_i1.UuidValue value) =>
      _i1.ColumnValue(
        table.vendorId,
        value,
      );

  _i1.ColumnValue<_i4.WalletTransactionType, _i4.WalletTransactionType> type(
    _i4.WalletTransactionType value,
  ) => _i1.ColumnValue(
    table.type,
    value,
  );

  _i1.ColumnValue<double, double> amount(double value) => _i1.ColumnValue(
    table.amount,
    value,
  );

  _i1.ColumnValue<double, double> balanceBefore(double value) =>
      _i1.ColumnValue(
        table.balanceBefore,
        value,
      );

  _i1.ColumnValue<double, double> balanceAfter(double value) => _i1.ColumnValue(
    table.balanceAfter,
    value,
  );

  _i1.ColumnValue<String, String> referenceType(String value) =>
      _i1.ColumnValue(
        table.referenceType,
        value,
      );

  _i1.ColumnValue<String, String> referenceId(String? value) => _i1.ColumnValue(
    table.referenceId,
    value,
  );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> orderId(_i1.UuidValue? value) =>
      _i1.ColumnValue(
        table.orderId,
        value,
      );

  _i1.ColumnValue<String, String> description(String value) => _i1.ColumnValue(
    table.description,
    value,
  );

  _i1.ColumnValue<String, String> notes(String? value) => _i1.ColumnValue(
    table.notes,
    value,
  );

  _i1.ColumnValue<_i2.TransactionStatus, _i2.TransactionStatus> status(
    _i2.TransactionStatus value,
  ) => _i1.ColumnValue(
    table.status,
    value,
  );

  _i1.ColumnValue<bool, bool> isInEscrow(bool value) => _i1.ColumnValue(
    table.isInEscrow,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> escrowReleasedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.escrowReleasedAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> escrowReleaseScheduledAt(
    DateTime? value,
  ) => _i1.ColumnValue(
    table.escrowReleaseScheduledAt,
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

  _i1.ColumnValue<String, String> transferStatus(String? value) =>
      _i1.ColumnValue(
        table.transferStatus,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> transferredAt(DateTime? value) =>
      _i1.ColumnValue(
        table.transferredAt,
        value,
      );

  _i1.ColumnValue<String, String> failureReason(String? value) =>
      _i1.ColumnValue(
        table.failureReason,
        value,
      );

  _i1.ColumnValue<int, int> retryCount(int value) => _i1.ColumnValue(
    table.retryCount,
    value,
  );

  _i1.ColumnValue<String, String> metadata(String? value) => _i1.ColumnValue(
    table.metadata,
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

  _i1.ColumnValue<DateTime, DateTime> processedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.processedAt,
        value,
      );
}

class WalletTransactionTable extends _i1.Table<_i1.UuidValue> {
  WalletTransactionTable({super.tableRelation})
    : super(tableName: 'wallet_transactions') {
    updateTable = WalletTransactionUpdateTable(this);
    walletId = _i1.ColumnUuid(
      'walletId',
      this,
    );
    vendorId = _i1.ColumnUuid(
      'vendorId',
      this,
    );
    type = _i1.ColumnEnum(
      'type',
      this,
      _i1.EnumSerialization.byName,
    );
    amount = _i1.ColumnDouble(
      'amount',
      this,
    );
    balanceBefore = _i1.ColumnDouble(
      'balanceBefore',
      this,
    );
    balanceAfter = _i1.ColumnDouble(
      'balanceAfter',
      this,
    );
    referenceType = _i1.ColumnString(
      'referenceType',
      this,
    );
    referenceId = _i1.ColumnString(
      'referenceId',
      this,
    );
    orderId = _i1.ColumnUuid(
      'orderId',
      this,
    );
    description = _i1.ColumnString(
      'description',
      this,
    );
    notes = _i1.ColumnString(
      'notes',
      this,
    );
    status = _i1.ColumnEnum(
      'status',
      this,
      _i1.EnumSerialization.byName,
      hasDefault: true,
    );
    isInEscrow = _i1.ColumnBool(
      'isInEscrow',
      this,
      hasDefault: true,
    );
    escrowReleasedAt = _i1.ColumnDateTime(
      'escrowReleasedAt',
      this,
    );
    escrowReleaseScheduledAt = _i1.ColumnDateTime(
      'escrowReleaseScheduledAt',
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
    transferStatus = _i1.ColumnString(
      'transferStatus',
      this,
    );
    transferredAt = _i1.ColumnDateTime(
      'transferredAt',
      this,
    );
    failureReason = _i1.ColumnString(
      'failureReason',
      this,
    );
    retryCount = _i1.ColumnInt(
      'retryCount',
      this,
      hasDefault: true,
    );
    metadata = _i1.ColumnString(
      'metadata',
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
    processedAt = _i1.ColumnDateTime(
      'processedAt',
      this,
    );
  }

  late final WalletTransactionUpdateTable updateTable;

  late final _i1.ColumnUuid walletId;

  _i3.VendorWalletTable? _wallet;

  late final _i1.ColumnUuid vendorId;

  late final _i1.ColumnEnum<_i4.WalletTransactionType> type;

  late final _i1.ColumnDouble amount;

  late final _i1.ColumnDouble balanceBefore;

  late final _i1.ColumnDouble balanceAfter;

  late final _i1.ColumnString referenceType;

  late final _i1.ColumnString referenceId;

  late final _i1.ColumnUuid orderId;

  _i5.OrderTable? _order;

  late final _i1.ColumnString description;

  late final _i1.ColumnString notes;

  late final _i1.ColumnEnum<_i2.TransactionStatus> status;

  late final _i1.ColumnBool isInEscrow;

  late final _i1.ColumnDateTime escrowReleasedAt;

  late final _i1.ColumnDateTime escrowReleaseScheduledAt;

  late final _i1.ColumnString transferCode;

  late final _i1.ColumnString transferId;

  late final _i1.ColumnString transferStatus;

  late final _i1.ColumnDateTime transferredAt;

  late final _i1.ColumnString failureReason;

  late final _i1.ColumnInt retryCount;

  late final _i1.ColumnString metadata;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  late final _i1.ColumnDateTime processedAt;

  _i3.VendorWalletTable get wallet {
    if (_wallet != null) return _wallet!;
    _wallet = _i1.createRelationTable(
      relationFieldName: 'wallet',
      field: WalletTransaction.t.walletId,
      foreignField: _i3.VendorWallet.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.VendorWalletTable(tableRelation: foreignTableRelation),
    );
    return _wallet!;
  }

  _i5.OrderTable get order {
    if (_order != null) return _order!;
    _order = _i1.createRelationTable(
      relationFieldName: 'order',
      field: WalletTransaction.t.orderId,
      foreignField: _i5.Order.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.OrderTable(tableRelation: foreignTableRelation),
    );
    return _order!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    walletId,
    vendorId,
    type,
    amount,
    balanceBefore,
    balanceAfter,
    referenceType,
    referenceId,
    orderId,
    description,
    notes,
    status,
    isInEscrow,
    escrowReleasedAt,
    escrowReleaseScheduledAt,
    transferCode,
    transferId,
    transferStatus,
    transferredAt,
    failureReason,
    retryCount,
    metadata,
    createdAt,
    updatedAt,
    processedAt,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'wallet') {
      return wallet;
    }
    if (relationField == 'order') {
      return order;
    }
    return null;
  }
}

class WalletTransactionInclude extends _i1.IncludeObject {
  WalletTransactionInclude._({
    _i3.VendorWalletInclude? wallet,
    _i5.OrderInclude? order,
  }) {
    _wallet = wallet;
    _order = order;
  }

  _i3.VendorWalletInclude? _wallet;

  _i5.OrderInclude? _order;

  @override
  Map<String, _i1.Include?> get includes => {
    'wallet': _wallet,
    'order': _order,
  };

  @override
  _i1.Table<_i1.UuidValue> get table => WalletTransaction.t;
}

class WalletTransactionIncludeList extends _i1.IncludeList {
  WalletTransactionIncludeList._({
    _i1.WhereExpressionBuilder<WalletTransactionTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(WalletTransaction.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue> get table => WalletTransaction.t;
}

class WalletTransactionRepository {
  const WalletTransactionRepository._();

  final attachRow = const WalletTransactionAttachRowRepository._();

  final detachRow = const WalletTransactionDetachRowRepository._();

  /// Returns a list of [WalletTransaction]s matching the given query parameters.
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
  Future<List<WalletTransaction>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<WalletTransactionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<WalletTransactionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<WalletTransactionTable>? orderByList,
    _i1.Transaction? transaction,
    WalletTransactionInclude? include,
  }) async {
    return session.db.find<WalletTransaction>(
      where: where?.call(WalletTransaction.t),
      orderBy: orderBy?.call(WalletTransaction.t),
      orderByList: orderByList?.call(WalletTransaction.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [WalletTransaction] matching the given query parameters.
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
  Future<WalletTransaction?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<WalletTransactionTable>? where,
    int? offset,
    _i1.OrderByBuilder<WalletTransactionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<WalletTransactionTable>? orderByList,
    _i1.Transaction? transaction,
    WalletTransactionInclude? include,
  }) async {
    return session.db.findFirstRow<WalletTransaction>(
      where: where?.call(WalletTransaction.t),
      orderBy: orderBy?.call(WalletTransaction.t),
      orderByList: orderByList?.call(WalletTransaction.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [WalletTransaction] by its [id] or null if no such row exists.
  Future<WalletTransaction?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
    WalletTransactionInclude? include,
  }) async {
    return session.db.findById<WalletTransaction>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [WalletTransaction]s in the list and returns the inserted rows.
  ///
  /// The returned [WalletTransaction]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<WalletTransaction>> insert(
    _i1.Session session,
    List<WalletTransaction> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<WalletTransaction>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [WalletTransaction] and returns the inserted row.
  ///
  /// The returned [WalletTransaction] will have its `id` field set.
  Future<WalletTransaction> insertRow(
    _i1.Session session,
    WalletTransaction row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<WalletTransaction>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [WalletTransaction]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<WalletTransaction>> update(
    _i1.Session session,
    List<WalletTransaction> rows, {
    _i1.ColumnSelections<WalletTransactionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<WalletTransaction>(
      rows,
      columns: columns?.call(WalletTransaction.t),
      transaction: transaction,
    );
  }

  /// Updates a single [WalletTransaction]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<WalletTransaction> updateRow(
    _i1.Session session,
    WalletTransaction row, {
    _i1.ColumnSelections<WalletTransactionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<WalletTransaction>(
      row,
      columns: columns?.call(WalletTransaction.t),
      transaction: transaction,
    );
  }

  /// Updates a single [WalletTransaction] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<WalletTransaction?> updateById(
    _i1.Session session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<WalletTransactionUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<WalletTransaction>(
      id,
      columnValues: columnValues(WalletTransaction.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [WalletTransaction]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<WalletTransaction>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<WalletTransactionUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<WalletTransactionTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<WalletTransactionTable>? orderBy,
    _i1.OrderByListBuilder<WalletTransactionTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<WalletTransaction>(
      columnValues: columnValues(WalletTransaction.t.updateTable),
      where: where(WalletTransaction.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(WalletTransaction.t),
      orderByList: orderByList?.call(WalletTransaction.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [WalletTransaction]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<WalletTransaction>> delete(
    _i1.Session session,
    List<WalletTransaction> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<WalletTransaction>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [WalletTransaction].
  Future<WalletTransaction> deleteRow(
    _i1.Session session,
    WalletTransaction row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<WalletTransaction>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<WalletTransaction>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<WalletTransactionTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<WalletTransaction>(
      where: where(WalletTransaction.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<WalletTransactionTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<WalletTransaction>(
      where: where?.call(WalletTransaction.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class WalletTransactionAttachRowRepository {
  const WalletTransactionAttachRowRepository._();

  /// Creates a relation between the given [WalletTransaction] and [VendorWallet]
  /// by setting the [WalletTransaction]'s foreign key `walletId` to refer to the [VendorWallet].
  Future<void> wallet(
    _i1.Session session,
    WalletTransaction walletTransaction,
    _i3.VendorWallet wallet, {
    _i1.Transaction? transaction,
  }) async {
    if (walletTransaction.id == null) {
      throw ArgumentError.notNull('walletTransaction.id');
    }
    if (wallet.id == null) {
      throw ArgumentError.notNull('wallet.id');
    }

    var $walletTransaction = walletTransaction.copyWith(walletId: wallet.id);
    await session.db.updateRow<WalletTransaction>(
      $walletTransaction,
      columns: [WalletTransaction.t.walletId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [WalletTransaction] and [Order]
  /// by setting the [WalletTransaction]'s foreign key `orderId` to refer to the [Order].
  Future<void> order(
    _i1.Session session,
    WalletTransaction walletTransaction,
    _i5.Order order, {
    _i1.Transaction? transaction,
  }) async {
    if (walletTransaction.id == null) {
      throw ArgumentError.notNull('walletTransaction.id');
    }
    if (order.id == null) {
      throw ArgumentError.notNull('order.id');
    }

    var $walletTransaction = walletTransaction.copyWith(orderId: order.id);
    await session.db.updateRow<WalletTransaction>(
      $walletTransaction,
      columns: [WalletTransaction.t.orderId],
      transaction: transaction,
    );
  }
}

class WalletTransactionDetachRowRepository {
  const WalletTransactionDetachRowRepository._();

  /// Detaches the relation between this [WalletTransaction] and the [Order] set in `order`
  /// by setting the [WalletTransaction]'s foreign key `orderId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> order(
    _i1.Session session,
    WalletTransaction walletTransaction, {
    _i1.Transaction? transaction,
  }) async {
    if (walletTransaction.id == null) {
      throw ArgumentError.notNull('walletTransaction.id');
    }

    var $walletTransaction = walletTransaction.copyWith(orderId: null);
    await session.db.updateRow<WalletTransaction>(
      $walletTransaction,
      columns: [WalletTransaction.t.orderId],
      transaction: transaction,
    );
  }
}
