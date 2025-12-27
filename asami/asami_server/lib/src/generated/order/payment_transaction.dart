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
import '../order/payment_method.dart' as _i3;
import '../order/payment_status.dart' as _i4;
import 'package:asami_server/src/generated/protocol.dart' as _i5;

abstract class PaymentTransaction
    implements _i1.TableRow<_i1.UuidValue>, _i1.ProtocolSerialization {
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

  static final t = PaymentTransactionTable();

  static const db = PaymentTransactionRepository._();

  @override
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

  @override
  _i1.Table<_i1.UuidValue> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'PaymentTransaction',
      'id': id.toJson(),
      'orderId': orderId.toJson(),
      if (order != null) 'order': order?.toJsonForProtocol(),
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

  static PaymentTransactionInclude include({_i2.OrderInclude? order}) {
    return PaymentTransactionInclude._(order: order);
  }

  static PaymentTransactionIncludeList includeList({
    _i1.WhereExpressionBuilder<PaymentTransactionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PaymentTransactionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PaymentTransactionTable>? orderByList,
    PaymentTransactionInclude? include,
  }) {
    return PaymentTransactionIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PaymentTransaction.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(PaymentTransaction.t),
      include: include,
    );
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

class PaymentTransactionUpdateTable
    extends _i1.UpdateTable<PaymentTransactionTable> {
  PaymentTransactionUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> orderId(_i1.UuidValue value) =>
      _i1.ColumnValue(
        table.orderId,
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

  _i1.ColumnValue<_i3.PaymentMethod, _i3.PaymentMethod> paymentMethod(
    _i3.PaymentMethod value,
  ) => _i1.ColumnValue(
    table.paymentMethod,
    value,
  );

  _i1.ColumnValue<_i4.PaymentStatus, _i4.PaymentStatus> paymentStatus(
    _i4.PaymentStatus value,
  ) => _i1.ColumnValue(
    table.paymentStatus,
    value,
  );

  _i1.ColumnValue<String, String> gatewayName(String value) => _i1.ColumnValue(
    table.gatewayName,
    value,
  );

  _i1.ColumnValue<String, String> gatewayTransactionId(String? value) =>
      _i1.ColumnValue(
        table.gatewayTransactionId,
        value,
      );

  _i1.ColumnValue<String, String> gatewayResponse(String? value) =>
      _i1.ColumnValue(
        table.gatewayResponse,
        value,
      );

  _i1.ColumnValue<String, String> cryptoType(String? value) => _i1.ColumnValue(
    table.cryptoType,
    value,
  );

  _i1.ColumnValue<double, double> cryptoAmount(double? value) =>
      _i1.ColumnValue(
        table.cryptoAmount,
        value,
      );

  _i1.ColumnValue<String, String> walletAddress(String? value) =>
      _i1.ColumnValue(
        table.walletAddress,
        value,
      );

  _i1.ColumnValue<String, String> transactionHash(String? value) =>
      _i1.ColumnValue(
        table.transactionHash,
        value,
      );

  _i1.ColumnValue<String, String> blockchainNetwork(String? value) =>
      _i1.ColumnValue(
        table.blockchainNetwork,
        value,
      );

  _i1.ColumnValue<double, double> conversionRate(double? value) =>
      _i1.ColumnValue(
        table.conversionRate,
        value,
      );

  _i1.ColumnValue<double, double> platformFee(double value) => _i1.ColumnValue(
    table.platformFee,
    value,
  );

  _i1.ColumnValue<double, double> gatewayFee(double value) => _i1.ColumnValue(
    table.gatewayFee,
    value,
  );

  _i1.ColumnValue<bool, bool> isPending(bool value) => _i1.ColumnValue(
    table.isPending,
    value,
  );

  _i1.ColumnValue<bool, bool> isCompleted(bool value) => _i1.ColumnValue(
    table.isCompleted,
    value,
  );

  _i1.ColumnValue<bool, bool> isFailed(bool value) => _i1.ColumnValue(
    table.isFailed,
    value,
  );

  _i1.ColumnValue<String, String> metadata(String? value) => _i1.ColumnValue(
    table.metadata,
    value,
  );

  _i1.ColumnValue<String, String> failureReason(String? value) =>
      _i1.ColumnValue(
        table.failureReason,
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

  _i1.ColumnValue<DateTime, DateTime> completedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.completedAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> failedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.failedAt,
        value,
      );
}

class PaymentTransactionTable extends _i1.Table<_i1.UuidValue> {
  PaymentTransactionTable({super.tableRelation})
    : super(tableName: 'payment_transactions') {
    updateTable = PaymentTransactionUpdateTable(this);
    orderId = _i1.ColumnUuid(
      'orderId',
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
    paymentMethod = _i1.ColumnEnum(
      'paymentMethod',
      this,
      _i1.EnumSerialization.byName,
    );
    paymentStatus = _i1.ColumnEnum(
      'paymentStatus',
      this,
      _i1.EnumSerialization.byName,
    );
    gatewayName = _i1.ColumnString(
      'gatewayName',
      this,
    );
    gatewayTransactionId = _i1.ColumnString(
      'gatewayTransactionId',
      this,
    );
    gatewayResponse = _i1.ColumnString(
      'gatewayResponse',
      this,
    );
    cryptoType = _i1.ColumnString(
      'cryptoType',
      this,
    );
    cryptoAmount = _i1.ColumnDouble(
      'cryptoAmount',
      this,
    );
    walletAddress = _i1.ColumnString(
      'walletAddress',
      this,
    );
    transactionHash = _i1.ColumnString(
      'transactionHash',
      this,
    );
    blockchainNetwork = _i1.ColumnString(
      'blockchainNetwork',
      this,
    );
    conversionRate = _i1.ColumnDouble(
      'conversionRate',
      this,
    );
    platformFee = _i1.ColumnDouble(
      'platformFee',
      this,
      hasDefault: true,
    );
    gatewayFee = _i1.ColumnDouble(
      'gatewayFee',
      this,
      hasDefault: true,
    );
    isPending = _i1.ColumnBool(
      'isPending',
      this,
      hasDefault: true,
    );
    isCompleted = _i1.ColumnBool(
      'isCompleted',
      this,
      hasDefault: true,
    );
    isFailed = _i1.ColumnBool(
      'isFailed',
      this,
      hasDefault: true,
    );
    metadata = _i1.ColumnString(
      'metadata',
      this,
    );
    failureReason = _i1.ColumnString(
      'failureReason',
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
    completedAt = _i1.ColumnDateTime(
      'completedAt',
      this,
    );
    failedAt = _i1.ColumnDateTime(
      'failedAt',
      this,
    );
  }

  late final PaymentTransactionUpdateTable updateTable;

  late final _i1.ColumnUuid orderId;

  _i2.OrderTable? _order;

  late final _i1.ColumnDouble amount;

  late final _i1.ColumnString currency;

  late final _i1.ColumnEnum<_i3.PaymentMethod> paymentMethod;

  late final _i1.ColumnEnum<_i4.PaymentStatus> paymentStatus;

  late final _i1.ColumnString gatewayName;

  late final _i1.ColumnString gatewayTransactionId;

  late final _i1.ColumnString gatewayResponse;

  late final _i1.ColumnString cryptoType;

  late final _i1.ColumnDouble cryptoAmount;

  late final _i1.ColumnString walletAddress;

  late final _i1.ColumnString transactionHash;

  late final _i1.ColumnString blockchainNetwork;

  late final _i1.ColumnDouble conversionRate;

  late final _i1.ColumnDouble platformFee;

  late final _i1.ColumnDouble gatewayFee;

  late final _i1.ColumnBool isPending;

  late final _i1.ColumnBool isCompleted;

  late final _i1.ColumnBool isFailed;

  late final _i1.ColumnString metadata;

  late final _i1.ColumnString failureReason;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  late final _i1.ColumnDateTime completedAt;

  late final _i1.ColumnDateTime failedAt;

  _i2.OrderTable get order {
    if (_order != null) return _order!;
    _order = _i1.createRelationTable(
      relationFieldName: 'order',
      field: PaymentTransaction.t.orderId,
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
    amount,
    currency,
    paymentMethod,
    paymentStatus,
    gatewayName,
    gatewayTransactionId,
    gatewayResponse,
    cryptoType,
    cryptoAmount,
    walletAddress,
    transactionHash,
    blockchainNetwork,
    conversionRate,
    platformFee,
    gatewayFee,
    isPending,
    isCompleted,
    isFailed,
    metadata,
    failureReason,
    createdAt,
    updatedAt,
    completedAt,
    failedAt,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'order') {
      return order;
    }
    return null;
  }
}

class PaymentTransactionInclude extends _i1.IncludeObject {
  PaymentTransactionInclude._({_i2.OrderInclude? order}) {
    _order = order;
  }

  _i2.OrderInclude? _order;

  @override
  Map<String, _i1.Include?> get includes => {'order': _order};

  @override
  _i1.Table<_i1.UuidValue> get table => PaymentTransaction.t;
}

class PaymentTransactionIncludeList extends _i1.IncludeList {
  PaymentTransactionIncludeList._({
    _i1.WhereExpressionBuilder<PaymentTransactionTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(PaymentTransaction.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue> get table => PaymentTransaction.t;
}

class PaymentTransactionRepository {
  const PaymentTransactionRepository._();

  final attachRow = const PaymentTransactionAttachRowRepository._();

  /// Returns a list of [PaymentTransaction]s matching the given query parameters.
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
  Future<List<PaymentTransaction>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PaymentTransactionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PaymentTransactionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PaymentTransactionTable>? orderByList,
    _i1.Transaction? transaction,
    PaymentTransactionInclude? include,
  }) async {
    return session.db.find<PaymentTransaction>(
      where: where?.call(PaymentTransaction.t),
      orderBy: orderBy?.call(PaymentTransaction.t),
      orderByList: orderByList?.call(PaymentTransaction.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [PaymentTransaction] matching the given query parameters.
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
  Future<PaymentTransaction?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PaymentTransactionTable>? where,
    int? offset,
    _i1.OrderByBuilder<PaymentTransactionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PaymentTransactionTable>? orderByList,
    _i1.Transaction? transaction,
    PaymentTransactionInclude? include,
  }) async {
    return session.db.findFirstRow<PaymentTransaction>(
      where: where?.call(PaymentTransaction.t),
      orderBy: orderBy?.call(PaymentTransaction.t),
      orderByList: orderByList?.call(PaymentTransaction.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [PaymentTransaction] by its [id] or null if no such row exists.
  Future<PaymentTransaction?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
    PaymentTransactionInclude? include,
  }) async {
    return session.db.findById<PaymentTransaction>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [PaymentTransaction]s in the list and returns the inserted rows.
  ///
  /// The returned [PaymentTransaction]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<PaymentTransaction>> insert(
    _i1.Session session,
    List<PaymentTransaction> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<PaymentTransaction>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [PaymentTransaction] and returns the inserted row.
  ///
  /// The returned [PaymentTransaction] will have its `id` field set.
  Future<PaymentTransaction> insertRow(
    _i1.Session session,
    PaymentTransaction row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<PaymentTransaction>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [PaymentTransaction]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<PaymentTransaction>> update(
    _i1.Session session,
    List<PaymentTransaction> rows, {
    _i1.ColumnSelections<PaymentTransactionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<PaymentTransaction>(
      rows,
      columns: columns?.call(PaymentTransaction.t),
      transaction: transaction,
    );
  }

  /// Updates a single [PaymentTransaction]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<PaymentTransaction> updateRow(
    _i1.Session session,
    PaymentTransaction row, {
    _i1.ColumnSelections<PaymentTransactionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<PaymentTransaction>(
      row,
      columns: columns?.call(PaymentTransaction.t),
      transaction: transaction,
    );
  }

  /// Updates a single [PaymentTransaction] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<PaymentTransaction?> updateById(
    _i1.Session session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<PaymentTransactionUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<PaymentTransaction>(
      id,
      columnValues: columnValues(PaymentTransaction.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [PaymentTransaction]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<PaymentTransaction>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<PaymentTransactionUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<PaymentTransactionTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PaymentTransactionTable>? orderBy,
    _i1.OrderByListBuilder<PaymentTransactionTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<PaymentTransaction>(
      columnValues: columnValues(PaymentTransaction.t.updateTable),
      where: where(PaymentTransaction.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PaymentTransaction.t),
      orderByList: orderByList?.call(PaymentTransaction.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [PaymentTransaction]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<PaymentTransaction>> delete(
    _i1.Session session,
    List<PaymentTransaction> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<PaymentTransaction>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [PaymentTransaction].
  Future<PaymentTransaction> deleteRow(
    _i1.Session session,
    PaymentTransaction row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<PaymentTransaction>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<PaymentTransaction>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PaymentTransactionTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<PaymentTransaction>(
      where: where(PaymentTransaction.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PaymentTransactionTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<PaymentTransaction>(
      where: where?.call(PaymentTransaction.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class PaymentTransactionAttachRowRepository {
  const PaymentTransactionAttachRowRepository._();

  /// Creates a relation between the given [PaymentTransaction] and [Order]
  /// by setting the [PaymentTransaction]'s foreign key `orderId` to refer to the [Order].
  Future<void> order(
    _i1.Session session,
    PaymentTransaction paymentTransaction,
    _i2.Order order, {
    _i1.Transaction? transaction,
  }) async {
    if (paymentTransaction.id == null) {
      throw ArgumentError.notNull('paymentTransaction.id');
    }
    if (order.id == null) {
      throw ArgumentError.notNull('order.id');
    }

    var $paymentTransaction = paymentTransaction.copyWith(orderId: order.id);
    await session.db.updateRow<PaymentTransaction>(
      $paymentTransaction,
      columns: [PaymentTransaction.t.orderId],
      transaction: transaction,
    );
  }
}
