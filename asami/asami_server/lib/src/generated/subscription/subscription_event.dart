/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: unnecessary_null_comparison

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../subscription/subscription.dart' as _i2;
import '../user/subscription_tier.dart' as _i3;

abstract class SubscriptionEvent
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  SubscriptionEvent._({
    this.id,
    required this.eventId,
    required this.subscriptionId,
    this.subscription,
    required this.vendorId,
    required this.eventType,
    this.eventData,
    required this.createdAt,
    this.tier,
    this.previousTier,
  });

  factory SubscriptionEvent({
    int? id,
    required _i1.UuidValue eventId,
    required _i1.UuidValue subscriptionId,
    _i2.Subscription? subscription,
    required _i1.UuidValue vendorId,
    required String eventType,
    String? eventData,
    required DateTime createdAt,
    _i3.SubscriptionTier? tier,
    _i3.SubscriptionTier? previousTier,
  }) = _SubscriptionEventImpl;

  factory SubscriptionEvent.fromJson(Map<String, dynamic> jsonSerialization) {
    return SubscriptionEvent(
      id: jsonSerialization['id'] as int?,
      eventId:
          _i1.UuidValueJsonExtension.fromJson(jsonSerialization['eventId']),
      subscriptionId: _i1.UuidValueJsonExtension.fromJson(
          jsonSerialization['subscriptionId']),
      subscription: jsonSerialization['subscription'] == null
          ? null
          : _i2.Subscription.fromJson(
              (jsonSerialization['subscription'] as Map<String, dynamic>)),
      vendorId:
          _i1.UuidValueJsonExtension.fromJson(jsonSerialization['vendorId']),
      eventType: jsonSerialization['eventType'] as String,
      eventData: jsonSerialization['eventData'] as String?,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      tier: jsonSerialization['tier'] == null
          ? null
          : _i3.SubscriptionTier.fromJson((jsonSerialization['tier'] as int)),
      previousTier: jsonSerialization['previousTier'] == null
          ? null
          : _i3.SubscriptionTier.fromJson(
              (jsonSerialization['previousTier'] as int)),
    );
  }

  static final t = SubscriptionEventTable();

  static const db = SubscriptionEventRepository._();

  @override
  int? id;

  _i1.UuidValue eventId;

  _i1.UuidValue subscriptionId;

  _i2.Subscription? subscription;

  _i1.UuidValue vendorId;

  String eventType;

  String? eventData;

  DateTime createdAt;

  _i3.SubscriptionTier? tier;

  _i3.SubscriptionTier? previousTier;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [SubscriptionEvent]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SubscriptionEvent copyWith({
    int? id,
    _i1.UuidValue? eventId,
    _i1.UuidValue? subscriptionId,
    _i2.Subscription? subscription,
    _i1.UuidValue? vendorId,
    String? eventType,
    String? eventData,
    DateTime? createdAt,
    _i3.SubscriptionTier? tier,
    _i3.SubscriptionTier? previousTier,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'eventId': eventId.toJson(),
      'subscriptionId': subscriptionId.toJson(),
      if (subscription != null) 'subscription': subscription?.toJson(),
      'vendorId': vendorId.toJson(),
      'eventType': eventType,
      if (eventData != null) 'eventData': eventData,
      'createdAt': createdAt.toJson(),
      if (tier != null) 'tier': tier?.toJson(),
      if (previousTier != null) 'previousTier': previousTier?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'eventId': eventId.toJson(),
      'subscriptionId': subscriptionId.toJson(),
      if (subscription != null)
        'subscription': subscription?.toJsonForProtocol(),
      'vendorId': vendorId.toJson(),
      'eventType': eventType,
      if (eventData != null) 'eventData': eventData,
      'createdAt': createdAt.toJson(),
      if (tier != null) 'tier': tier?.toJson(),
      if (previousTier != null) 'previousTier': previousTier?.toJson(),
    };
  }

  static SubscriptionEventInclude include(
      {_i2.SubscriptionInclude? subscription}) {
    return SubscriptionEventInclude._(subscription: subscription);
  }

  static SubscriptionEventIncludeList includeList({
    _i1.WhereExpressionBuilder<SubscriptionEventTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SubscriptionEventTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SubscriptionEventTable>? orderByList,
    SubscriptionEventInclude? include,
  }) {
    return SubscriptionEventIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(SubscriptionEvent.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(SubscriptionEvent.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SubscriptionEventImpl extends SubscriptionEvent {
  _SubscriptionEventImpl({
    int? id,
    required _i1.UuidValue eventId,
    required _i1.UuidValue subscriptionId,
    _i2.Subscription? subscription,
    required _i1.UuidValue vendorId,
    required String eventType,
    String? eventData,
    required DateTime createdAt,
    _i3.SubscriptionTier? tier,
    _i3.SubscriptionTier? previousTier,
  }) : super._(
          id: id,
          eventId: eventId,
          subscriptionId: subscriptionId,
          subscription: subscription,
          vendorId: vendorId,
          eventType: eventType,
          eventData: eventData,
          createdAt: createdAt,
          tier: tier,
          previousTier: previousTier,
        );

  /// Returns a shallow copy of this [SubscriptionEvent]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SubscriptionEvent copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? eventId,
    _i1.UuidValue? subscriptionId,
    Object? subscription = _Undefined,
    _i1.UuidValue? vendorId,
    String? eventType,
    Object? eventData = _Undefined,
    DateTime? createdAt,
    Object? tier = _Undefined,
    Object? previousTier = _Undefined,
  }) {
    return SubscriptionEvent(
      id: id is int? ? id : this.id,
      eventId: eventId ?? this.eventId,
      subscriptionId: subscriptionId ?? this.subscriptionId,
      subscription: subscription is _i2.Subscription?
          ? subscription
          : this.subscription?.copyWith(),
      vendorId: vendorId ?? this.vendorId,
      eventType: eventType ?? this.eventType,
      eventData: eventData is String? ? eventData : this.eventData,
      createdAt: createdAt ?? this.createdAt,
      tier: tier is _i3.SubscriptionTier? ? tier : this.tier,
      previousTier: previousTier is _i3.SubscriptionTier?
          ? previousTier
          : this.previousTier,
    );
  }
}

class SubscriptionEventTable extends _i1.Table<int?> {
  SubscriptionEventTable({super.tableRelation})
      : super(tableName: 'subscription_events') {
    eventId = _i1.ColumnUuid(
      'eventId',
      this,
    );
    subscriptionId = _i1.ColumnUuid(
      'subscriptionId',
      this,
    );
    vendorId = _i1.ColumnUuid(
      'vendorId',
      this,
    );
    eventType = _i1.ColumnString(
      'eventType',
      this,
    );
    eventData = _i1.ColumnString(
      'eventData',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
    tier = _i1.ColumnEnum(
      'tier',
      this,
      _i1.EnumSerialization.byIndex,
    );
    previousTier = _i1.ColumnEnum(
      'previousTier',
      this,
      _i1.EnumSerialization.byIndex,
    );
  }

  late final _i1.ColumnUuid eventId;

  late final _i1.ColumnUuid subscriptionId;

  _i2.SubscriptionTable? _subscription;

  late final _i1.ColumnUuid vendorId;

  late final _i1.ColumnString eventType;

  late final _i1.ColumnString eventData;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnEnum<_i3.SubscriptionTier> tier;

  late final _i1.ColumnEnum<_i3.SubscriptionTier> previousTier;

  _i2.SubscriptionTable get subscription {
    if (_subscription != null) return _subscription!;
    _subscription = _i1.createRelationTable(
      relationFieldName: 'subscription',
      field: SubscriptionEvent.t.subscriptionId,
      foreignField: _i2.Subscription.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.SubscriptionTable(tableRelation: foreignTableRelation),
    );
    return _subscription!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        eventId,
        subscriptionId,
        vendorId,
        eventType,
        eventData,
        createdAt,
        tier,
        previousTier,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'subscription') {
      return subscription;
    }
    return null;
  }
}

class SubscriptionEventInclude extends _i1.IncludeObject {
  SubscriptionEventInclude._({_i2.SubscriptionInclude? subscription}) {
    _subscription = subscription;
  }

  _i2.SubscriptionInclude? _subscription;

  @override
  Map<String, _i1.Include?> get includes => {'subscription': _subscription};

  @override
  _i1.Table<int?> get table => SubscriptionEvent.t;
}

class SubscriptionEventIncludeList extends _i1.IncludeList {
  SubscriptionEventIncludeList._({
    _i1.WhereExpressionBuilder<SubscriptionEventTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(SubscriptionEvent.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => SubscriptionEvent.t;
}

class SubscriptionEventRepository {
  const SubscriptionEventRepository._();

  final attachRow = const SubscriptionEventAttachRowRepository._();

  /// Returns a list of [SubscriptionEvent]s matching the given query parameters.
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
  Future<List<SubscriptionEvent>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SubscriptionEventTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SubscriptionEventTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SubscriptionEventTable>? orderByList,
    _i1.Transaction? transaction,
    SubscriptionEventInclude? include,
  }) async {
    return session.db.find<SubscriptionEvent>(
      where: where?.call(SubscriptionEvent.t),
      orderBy: orderBy?.call(SubscriptionEvent.t),
      orderByList: orderByList?.call(SubscriptionEvent.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [SubscriptionEvent] matching the given query parameters.
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
  Future<SubscriptionEvent?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SubscriptionEventTable>? where,
    int? offset,
    _i1.OrderByBuilder<SubscriptionEventTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SubscriptionEventTable>? orderByList,
    _i1.Transaction? transaction,
    SubscriptionEventInclude? include,
  }) async {
    return session.db.findFirstRow<SubscriptionEvent>(
      where: where?.call(SubscriptionEvent.t),
      orderBy: orderBy?.call(SubscriptionEvent.t),
      orderByList: orderByList?.call(SubscriptionEvent.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [SubscriptionEvent] by its [id] or null if no such row exists.
  Future<SubscriptionEvent?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    SubscriptionEventInclude? include,
  }) async {
    return session.db.findById<SubscriptionEvent>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [SubscriptionEvent]s in the list and returns the inserted rows.
  ///
  /// The returned [SubscriptionEvent]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<SubscriptionEvent>> insert(
    _i1.Session session,
    List<SubscriptionEvent> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<SubscriptionEvent>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [SubscriptionEvent] and returns the inserted row.
  ///
  /// The returned [SubscriptionEvent] will have its `id` field set.
  Future<SubscriptionEvent> insertRow(
    _i1.Session session,
    SubscriptionEvent row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<SubscriptionEvent>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [SubscriptionEvent]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<SubscriptionEvent>> update(
    _i1.Session session,
    List<SubscriptionEvent> rows, {
    _i1.ColumnSelections<SubscriptionEventTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<SubscriptionEvent>(
      rows,
      columns: columns?.call(SubscriptionEvent.t),
      transaction: transaction,
    );
  }

  /// Updates a single [SubscriptionEvent]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<SubscriptionEvent> updateRow(
    _i1.Session session,
    SubscriptionEvent row, {
    _i1.ColumnSelections<SubscriptionEventTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<SubscriptionEvent>(
      row,
      columns: columns?.call(SubscriptionEvent.t),
      transaction: transaction,
    );
  }

  /// Deletes all [SubscriptionEvent]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<SubscriptionEvent>> delete(
    _i1.Session session,
    List<SubscriptionEvent> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<SubscriptionEvent>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [SubscriptionEvent].
  Future<SubscriptionEvent> deleteRow(
    _i1.Session session,
    SubscriptionEvent row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<SubscriptionEvent>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<SubscriptionEvent>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<SubscriptionEventTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<SubscriptionEvent>(
      where: where(SubscriptionEvent.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SubscriptionEventTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<SubscriptionEvent>(
      where: where?.call(SubscriptionEvent.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class SubscriptionEventAttachRowRepository {
  const SubscriptionEventAttachRowRepository._();

  /// Creates a relation between the given [SubscriptionEvent] and [Subscription]
  /// by setting the [SubscriptionEvent]'s foreign key `subscriptionId` to refer to the [Subscription].
  Future<void> subscription(
    _i1.Session session,
    SubscriptionEvent subscriptionEvent,
    _i2.Subscription subscription, {
    _i1.Transaction? transaction,
  }) async {
    if (subscriptionEvent.id == null) {
      throw ArgumentError.notNull('subscriptionEvent.id');
    }
    if (subscription.id == null) {
      throw ArgumentError.notNull('subscription.id');
    }

    var $subscriptionEvent =
        subscriptionEvent.copyWith(subscriptionId: subscription.id);
    await session.db.updateRow<SubscriptionEvent>(
      $subscriptionEvent,
      columns: [SubscriptionEvent.t.subscriptionId],
      transaction: transaction,
    );
  }
}
