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
import '../user/subscription_tier.dart' as _i3;
import 'package:asami_server/src/generated/protocol.dart' as _i4;

abstract class Subscription
    implements _i1.TableRow<_i1.UuidValue>, _i1.ProtocolSerialization {
  Subscription._({
    _i1.UuidValue? id,
    required this.vendorId,
    this.vendor,
    required this.tier,
    String? status,
    String? billingCycle,
    required this.amount,
    String? currency,
    required this.currentPeriodStart,
    required this.currentPeriodEnd,
    required this.productLimit,
    required this.aiDescriptionsLimit,
    required this.platformTransactionFee,
    bool? autoRenew,
    bool? cancelAtPeriodEnd,
    bool? isTrialing,
    this.trialStart,
    this.trialEnd,
    this.cancelledAt,
    this.cancellationReason,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : id = id ?? _i1.Uuid().v4obj(),
       status = status ?? 'active',
       billingCycle = billingCycle ?? 'monthly',
       currency = currency ?? 'USD',
       autoRenew = autoRenew ?? true,
       cancelAtPeriodEnd = cancelAtPeriodEnd ?? false,
       isTrialing = isTrialing ?? false,
       createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory Subscription({
    _i1.UuidValue? id,
    required _i1.UuidValue vendorId,
    _i2.VendorProfile? vendor,
    required _i3.SubscriptionTier tier,
    String? status,
    String? billingCycle,
    required double amount,
    String? currency,
    required DateTime currentPeriodStart,
    required DateTime currentPeriodEnd,
    required int productLimit,
    required int aiDescriptionsLimit,
    required double platformTransactionFee,
    bool? autoRenew,
    bool? cancelAtPeriodEnd,
    bool? isTrialing,
    DateTime? trialStart,
    DateTime? trialEnd,
    DateTime? cancelledAt,
    String? cancellationReason,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _SubscriptionImpl;

  factory Subscription.fromJson(Map<String, dynamic> jsonSerialization) {
    return Subscription(
      id: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      vendorId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['vendorId'],
      ),
      vendor: jsonSerialization['vendor'] == null
          ? null
          : _i4.Protocol().deserialize<_i2.VendorProfile>(
              jsonSerialization['vendor'],
            ),
      tier: _i3.SubscriptionTier.fromJson(
        (jsonSerialization['tier'] as String),
      ),
      status: jsonSerialization['status'] as String,
      billingCycle: jsonSerialization['billingCycle'] as String,
      amount: (jsonSerialization['amount'] as num).toDouble(),
      currency: jsonSerialization['currency'] as String,
      currentPeriodStart: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['currentPeriodStart'],
      ),
      currentPeriodEnd: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['currentPeriodEnd'],
      ),
      productLimit: jsonSerialization['productLimit'] as int,
      aiDescriptionsLimit: jsonSerialization['aiDescriptionsLimit'] as int,
      platformTransactionFee:
          (jsonSerialization['platformTransactionFee'] as num).toDouble(),
      autoRenew: jsonSerialization['autoRenew'] as bool,
      cancelAtPeriodEnd: jsonSerialization['cancelAtPeriodEnd'] as bool,
      isTrialing: jsonSerialization['isTrialing'] as bool,
      trialStart: jsonSerialization['trialStart'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['trialStart']),
      trialEnd: jsonSerialization['trialEnd'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['trialEnd']),
      cancelledAt: jsonSerialization['cancelledAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['cancelledAt'],
            ),
      cancellationReason: jsonSerialization['cancellationReason'] as String?,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
    );
  }

  static final t = SubscriptionTable();

  static const db = SubscriptionRepository._();

  @override
  _i1.UuidValue id;

  _i1.UuidValue vendorId;

  _i2.VendorProfile? vendor;

  _i3.SubscriptionTier tier;

  String status;

  String billingCycle;

  double amount;

  String currency;

  DateTime currentPeriodStart;

  DateTime currentPeriodEnd;

  int productLimit;

  int aiDescriptionsLimit;

  double platformTransactionFee;

  bool autoRenew;

  bool cancelAtPeriodEnd;

  bool isTrialing;

  DateTime? trialStart;

  DateTime? trialEnd;

  DateTime? cancelledAt;

  String? cancellationReason;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _i1.Table<_i1.UuidValue> get table => t;

  /// Returns a shallow copy of this [Subscription]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Subscription copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? vendorId,
    _i2.VendorProfile? vendor,
    _i3.SubscriptionTier? tier,
    String? status,
    String? billingCycle,
    double? amount,
    String? currency,
    DateTime? currentPeriodStart,
    DateTime? currentPeriodEnd,
    int? productLimit,
    int? aiDescriptionsLimit,
    double? platformTransactionFee,
    bool? autoRenew,
    bool? cancelAtPeriodEnd,
    bool? isTrialing,
    DateTime? trialStart,
    DateTime? trialEnd,
    DateTime? cancelledAt,
    String? cancellationReason,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Subscription',
      'id': id.toJson(),
      'vendorId': vendorId.toJson(),
      if (vendor != null) 'vendor': vendor?.toJson(),
      'tier': tier.toJson(),
      'status': status,
      'billingCycle': billingCycle,
      'amount': amount,
      'currency': currency,
      'currentPeriodStart': currentPeriodStart.toJson(),
      'currentPeriodEnd': currentPeriodEnd.toJson(),
      'productLimit': productLimit,
      'aiDescriptionsLimit': aiDescriptionsLimit,
      'platformTransactionFee': platformTransactionFee,
      'autoRenew': autoRenew,
      'cancelAtPeriodEnd': cancelAtPeriodEnd,
      'isTrialing': isTrialing,
      if (trialStart != null) 'trialStart': trialStart?.toJson(),
      if (trialEnd != null) 'trialEnd': trialEnd?.toJson(),
      if (cancelledAt != null) 'cancelledAt': cancelledAt?.toJson(),
      if (cancellationReason != null) 'cancellationReason': cancellationReason,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Subscription',
      'id': id.toJson(),
      'vendorId': vendorId.toJson(),
      if (vendor != null) 'vendor': vendor?.toJsonForProtocol(),
      'tier': tier.toJson(),
      'status': status,
      'billingCycle': billingCycle,
      'amount': amount,
      'currency': currency,
      'currentPeriodStart': currentPeriodStart.toJson(),
      'currentPeriodEnd': currentPeriodEnd.toJson(),
      'productLimit': productLimit,
      'aiDescriptionsLimit': aiDescriptionsLimit,
      'platformTransactionFee': platformTransactionFee,
      'autoRenew': autoRenew,
      'cancelAtPeriodEnd': cancelAtPeriodEnd,
      'isTrialing': isTrialing,
      if (trialStart != null) 'trialStart': trialStart?.toJson(),
      if (trialEnd != null) 'trialEnd': trialEnd?.toJson(),
      if (cancelledAt != null) 'cancelledAt': cancelledAt?.toJson(),
      if (cancellationReason != null) 'cancellationReason': cancellationReason,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static SubscriptionInclude include({_i2.VendorProfileInclude? vendor}) {
    return SubscriptionInclude._(vendor: vendor);
  }

  static SubscriptionIncludeList includeList({
    _i1.WhereExpressionBuilder<SubscriptionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SubscriptionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SubscriptionTable>? orderByList,
    SubscriptionInclude? include,
  }) {
    return SubscriptionIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Subscription.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Subscription.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SubscriptionImpl extends Subscription {
  _SubscriptionImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue vendorId,
    _i2.VendorProfile? vendor,
    required _i3.SubscriptionTier tier,
    String? status,
    String? billingCycle,
    required double amount,
    String? currency,
    required DateTime currentPeriodStart,
    required DateTime currentPeriodEnd,
    required int productLimit,
    required int aiDescriptionsLimit,
    required double platformTransactionFee,
    bool? autoRenew,
    bool? cancelAtPeriodEnd,
    bool? isTrialing,
    DateTime? trialStart,
    DateTime? trialEnd,
    DateTime? cancelledAt,
    String? cancellationReason,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         vendorId: vendorId,
         vendor: vendor,
         tier: tier,
         status: status,
         billingCycle: billingCycle,
         amount: amount,
         currency: currency,
         currentPeriodStart: currentPeriodStart,
         currentPeriodEnd: currentPeriodEnd,
         productLimit: productLimit,
         aiDescriptionsLimit: aiDescriptionsLimit,
         platformTransactionFee: platformTransactionFee,
         autoRenew: autoRenew,
         cancelAtPeriodEnd: cancelAtPeriodEnd,
         isTrialing: isTrialing,
         trialStart: trialStart,
         trialEnd: trialEnd,
         cancelledAt: cancelledAt,
         cancellationReason: cancellationReason,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [Subscription]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Subscription copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? vendorId,
    Object? vendor = _Undefined,
    _i3.SubscriptionTier? tier,
    String? status,
    String? billingCycle,
    double? amount,
    String? currency,
    DateTime? currentPeriodStart,
    DateTime? currentPeriodEnd,
    int? productLimit,
    int? aiDescriptionsLimit,
    double? platformTransactionFee,
    bool? autoRenew,
    bool? cancelAtPeriodEnd,
    bool? isTrialing,
    Object? trialStart = _Undefined,
    Object? trialEnd = _Undefined,
    Object? cancelledAt = _Undefined,
    Object? cancellationReason = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Subscription(
      id: id ?? this.id,
      vendorId: vendorId ?? this.vendorId,
      vendor: vendor is _i2.VendorProfile? ? vendor : this.vendor?.copyWith(),
      tier: tier ?? this.tier,
      status: status ?? this.status,
      billingCycle: billingCycle ?? this.billingCycle,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      currentPeriodStart: currentPeriodStart ?? this.currentPeriodStart,
      currentPeriodEnd: currentPeriodEnd ?? this.currentPeriodEnd,
      productLimit: productLimit ?? this.productLimit,
      aiDescriptionsLimit: aiDescriptionsLimit ?? this.aiDescriptionsLimit,
      platformTransactionFee:
          platformTransactionFee ?? this.platformTransactionFee,
      autoRenew: autoRenew ?? this.autoRenew,
      cancelAtPeriodEnd: cancelAtPeriodEnd ?? this.cancelAtPeriodEnd,
      isTrialing: isTrialing ?? this.isTrialing,
      trialStart: trialStart is DateTime? ? trialStart : this.trialStart,
      trialEnd: trialEnd is DateTime? ? trialEnd : this.trialEnd,
      cancelledAt: cancelledAt is DateTime? ? cancelledAt : this.cancelledAt,
      cancellationReason: cancellationReason is String?
          ? cancellationReason
          : this.cancellationReason,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class SubscriptionUpdateTable extends _i1.UpdateTable<SubscriptionTable> {
  SubscriptionUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> vendorId(_i1.UuidValue value) =>
      _i1.ColumnValue(
        table.vendorId,
        value,
      );

  _i1.ColumnValue<_i3.SubscriptionTier, _i3.SubscriptionTier> tier(
    _i3.SubscriptionTier value,
  ) => _i1.ColumnValue(
    table.tier,
    value,
  );

  _i1.ColumnValue<String, String> status(String value) => _i1.ColumnValue(
    table.status,
    value,
  );

  _i1.ColumnValue<String, String> billingCycle(String value) => _i1.ColumnValue(
    table.billingCycle,
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

  _i1.ColumnValue<DateTime, DateTime> currentPeriodStart(DateTime value) =>
      _i1.ColumnValue(
        table.currentPeriodStart,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> currentPeriodEnd(DateTime value) =>
      _i1.ColumnValue(
        table.currentPeriodEnd,
        value,
      );

  _i1.ColumnValue<int, int> productLimit(int value) => _i1.ColumnValue(
    table.productLimit,
    value,
  );

  _i1.ColumnValue<int, int> aiDescriptionsLimit(int value) => _i1.ColumnValue(
    table.aiDescriptionsLimit,
    value,
  );

  _i1.ColumnValue<double, double> platformTransactionFee(double value) =>
      _i1.ColumnValue(
        table.platformTransactionFee,
        value,
      );

  _i1.ColumnValue<bool, bool> autoRenew(bool value) => _i1.ColumnValue(
    table.autoRenew,
    value,
  );

  _i1.ColumnValue<bool, bool> cancelAtPeriodEnd(bool value) => _i1.ColumnValue(
    table.cancelAtPeriodEnd,
    value,
  );

  _i1.ColumnValue<bool, bool> isTrialing(bool value) => _i1.ColumnValue(
    table.isTrialing,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> trialStart(DateTime? value) =>
      _i1.ColumnValue(
        table.trialStart,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> trialEnd(DateTime? value) =>
      _i1.ColumnValue(
        table.trialEnd,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> cancelledAt(DateTime? value) =>
      _i1.ColumnValue(
        table.cancelledAt,
        value,
      );

  _i1.ColumnValue<String, String> cancellationReason(String? value) =>
      _i1.ColumnValue(
        table.cancellationReason,
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

class SubscriptionTable extends _i1.Table<_i1.UuidValue> {
  SubscriptionTable({super.tableRelation}) : super(tableName: 'subscriptions') {
    updateTable = SubscriptionUpdateTable(this);
    vendorId = _i1.ColumnUuid(
      'vendorId',
      this,
    );
    tier = _i1.ColumnEnum(
      'tier',
      this,
      _i1.EnumSerialization.byName,
    );
    status = _i1.ColumnString(
      'status',
      this,
      hasDefault: true,
    );
    billingCycle = _i1.ColumnString(
      'billingCycle',
      this,
      hasDefault: true,
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
    currentPeriodStart = _i1.ColumnDateTime(
      'currentPeriodStart',
      this,
    );
    currentPeriodEnd = _i1.ColumnDateTime(
      'currentPeriodEnd',
      this,
    );
    productLimit = _i1.ColumnInt(
      'productLimit',
      this,
    );
    aiDescriptionsLimit = _i1.ColumnInt(
      'aiDescriptionsLimit',
      this,
    );
    platformTransactionFee = _i1.ColumnDouble(
      'platformTransactionFee',
      this,
    );
    autoRenew = _i1.ColumnBool(
      'autoRenew',
      this,
      hasDefault: true,
    );
    cancelAtPeriodEnd = _i1.ColumnBool(
      'cancelAtPeriodEnd',
      this,
      hasDefault: true,
    );
    isTrialing = _i1.ColumnBool(
      'isTrialing',
      this,
      hasDefault: true,
    );
    trialStart = _i1.ColumnDateTime(
      'trialStart',
      this,
    );
    trialEnd = _i1.ColumnDateTime(
      'trialEnd',
      this,
    );
    cancelledAt = _i1.ColumnDateTime(
      'cancelledAt',
      this,
    );
    cancellationReason = _i1.ColumnString(
      'cancellationReason',
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

  late final SubscriptionUpdateTable updateTable;

  late final _i1.ColumnUuid vendorId;

  _i2.VendorProfileTable? _vendor;

  late final _i1.ColumnEnum<_i3.SubscriptionTier> tier;

  late final _i1.ColumnString status;

  late final _i1.ColumnString billingCycle;

  late final _i1.ColumnDouble amount;

  late final _i1.ColumnString currency;

  late final _i1.ColumnDateTime currentPeriodStart;

  late final _i1.ColumnDateTime currentPeriodEnd;

  late final _i1.ColumnInt productLimit;

  late final _i1.ColumnInt aiDescriptionsLimit;

  late final _i1.ColumnDouble platformTransactionFee;

  late final _i1.ColumnBool autoRenew;

  late final _i1.ColumnBool cancelAtPeriodEnd;

  late final _i1.ColumnBool isTrialing;

  late final _i1.ColumnDateTime trialStart;

  late final _i1.ColumnDateTime trialEnd;

  late final _i1.ColumnDateTime cancelledAt;

  late final _i1.ColumnString cancellationReason;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  _i2.VendorProfileTable get vendor {
    if (_vendor != null) return _vendor!;
    _vendor = _i1.createRelationTable(
      relationFieldName: 'vendor',
      field: Subscription.t.vendorId,
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
    tier,
    status,
    billingCycle,
    amount,
    currency,
    currentPeriodStart,
    currentPeriodEnd,
    productLimit,
    aiDescriptionsLimit,
    platformTransactionFee,
    autoRenew,
    cancelAtPeriodEnd,
    isTrialing,
    trialStart,
    trialEnd,
    cancelledAt,
    cancellationReason,
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

class SubscriptionInclude extends _i1.IncludeObject {
  SubscriptionInclude._({_i2.VendorProfileInclude? vendor}) {
    _vendor = vendor;
  }

  _i2.VendorProfileInclude? _vendor;

  @override
  Map<String, _i1.Include?> get includes => {'vendor': _vendor};

  @override
  _i1.Table<_i1.UuidValue> get table => Subscription.t;
}

class SubscriptionIncludeList extends _i1.IncludeList {
  SubscriptionIncludeList._({
    _i1.WhereExpressionBuilder<SubscriptionTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Subscription.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue> get table => Subscription.t;
}

class SubscriptionRepository {
  const SubscriptionRepository._();

  final attachRow = const SubscriptionAttachRowRepository._();

  /// Returns a list of [Subscription]s matching the given query parameters.
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
  Future<List<Subscription>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SubscriptionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SubscriptionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SubscriptionTable>? orderByList,
    _i1.Transaction? transaction,
    SubscriptionInclude? include,
  }) async {
    return session.db.find<Subscription>(
      where: where?.call(Subscription.t),
      orderBy: orderBy?.call(Subscription.t),
      orderByList: orderByList?.call(Subscription.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Subscription] matching the given query parameters.
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
  Future<Subscription?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SubscriptionTable>? where,
    int? offset,
    _i1.OrderByBuilder<SubscriptionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SubscriptionTable>? orderByList,
    _i1.Transaction? transaction,
    SubscriptionInclude? include,
  }) async {
    return session.db.findFirstRow<Subscription>(
      where: where?.call(Subscription.t),
      orderBy: orderBy?.call(Subscription.t),
      orderByList: orderByList?.call(Subscription.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Subscription] by its [id] or null if no such row exists.
  Future<Subscription?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
    SubscriptionInclude? include,
  }) async {
    return session.db.findById<Subscription>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Subscription]s in the list and returns the inserted rows.
  ///
  /// The returned [Subscription]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Subscription>> insert(
    _i1.Session session,
    List<Subscription> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Subscription>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Subscription] and returns the inserted row.
  ///
  /// The returned [Subscription] will have its `id` field set.
  Future<Subscription> insertRow(
    _i1.Session session,
    Subscription row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Subscription>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Subscription]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Subscription>> update(
    _i1.Session session,
    List<Subscription> rows, {
    _i1.ColumnSelections<SubscriptionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Subscription>(
      rows,
      columns: columns?.call(Subscription.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Subscription]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Subscription> updateRow(
    _i1.Session session,
    Subscription row, {
    _i1.ColumnSelections<SubscriptionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Subscription>(
      row,
      columns: columns?.call(Subscription.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Subscription] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Subscription?> updateById(
    _i1.Session session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<SubscriptionUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Subscription>(
      id,
      columnValues: columnValues(Subscription.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Subscription]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Subscription>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<SubscriptionUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<SubscriptionTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SubscriptionTable>? orderBy,
    _i1.OrderByListBuilder<SubscriptionTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Subscription>(
      columnValues: columnValues(Subscription.t.updateTable),
      where: where(Subscription.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Subscription.t),
      orderByList: orderByList?.call(Subscription.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Subscription]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Subscription>> delete(
    _i1.Session session,
    List<Subscription> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Subscription>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Subscription].
  Future<Subscription> deleteRow(
    _i1.Session session,
    Subscription row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Subscription>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Subscription>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<SubscriptionTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Subscription>(
      where: where(Subscription.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SubscriptionTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Subscription>(
      where: where?.call(Subscription.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class SubscriptionAttachRowRepository {
  const SubscriptionAttachRowRepository._();

  /// Creates a relation between the given [Subscription] and [VendorProfile]
  /// by setting the [Subscription]'s foreign key `vendorId` to refer to the [VendorProfile].
  Future<void> vendor(
    _i1.Session session,
    Subscription subscription,
    _i2.VendorProfile vendor, {
    _i1.Transaction? transaction,
  }) async {
    if (subscription.id == null) {
      throw ArgumentError.notNull('subscription.id');
    }
    if (vendor.id == null) {
      throw ArgumentError.notNull('vendor.id');
    }

    var $subscription = subscription.copyWith(vendorId: vendor.id);
    await session.db.updateRow<Subscription>(
      $subscription,
      columns: [Subscription.t.vendorId],
      transaction: transaction,
    );
  }
}
