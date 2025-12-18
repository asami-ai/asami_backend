/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../user/user_type.dart' as _i2;
import '../user/subscription_tier.dart' as _i3;

abstract class DailyUsageTracker
    implements _i1.TableRow<_i1.UuidValue>, _i1.ProtocolSerialization {
  DailyUsageTracker._({
    _i1.UuidValue? id,
    required this.userId,
    required this.userType,
    required this.date,
    required this.resetAt,
    int? toolCallsCount,
    required this.toolCallsLimit,
    int? aiMessagesCount,
    required this.aiMessagesLimit,
    int? productsCreatedCount,
    required this.productsCreatedLimit,
    int? aiDescriptionsCount,
    required this.aiDescriptionsLimit,
    int? analyticsQueriesCount,
    required this.analyticsQueriesLimit,
    bool? isInGracePeriod,
    int? gracePeriodUsed,
    int? gracePeriodLimit,
    this.subscriptionTier,
    bool? softLimitWarned,
    bool? hardLimitReached,
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : id = id ?? _i1.Uuid().v4obj(),
        toolCallsCount = toolCallsCount ?? 0,
        aiMessagesCount = aiMessagesCount ?? 0,
        productsCreatedCount = productsCreatedCount ?? 0,
        aiDescriptionsCount = aiDescriptionsCount ?? 0,
        analyticsQueriesCount = analyticsQueriesCount ?? 0,
        isInGracePeriod = isInGracePeriod ?? false,
        gracePeriodUsed = gracePeriodUsed ?? 0,
        gracePeriodLimit = gracePeriodLimit ?? 5,
        softLimitWarned = softLimitWarned ?? false,
        hardLimitReached = hardLimitReached ?? false,
        createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  factory DailyUsageTracker({
    _i1.UuidValue? id,
    required _i1.UuidValue userId,
    required _i2.UserType userType,
    required DateTime date,
    required DateTime resetAt,
    int? toolCallsCount,
    required int toolCallsLimit,
    int? aiMessagesCount,
    required int aiMessagesLimit,
    int? productsCreatedCount,
    required int productsCreatedLimit,
    int? aiDescriptionsCount,
    required int aiDescriptionsLimit,
    int? analyticsQueriesCount,
    required int analyticsQueriesLimit,
    bool? isInGracePeriod,
    int? gracePeriodUsed,
    int? gracePeriodLimit,
    _i3.SubscriptionTier? subscriptionTier,
    bool? softLimitWarned,
    bool? hardLimitReached,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _DailyUsageTrackerImpl;

  factory DailyUsageTracker.fromJson(Map<String, dynamic> jsonSerialization) {
    return DailyUsageTracker(
      id: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      userId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      userType: _i2.UserType.fromJson((jsonSerialization['userType'] as int)),
      date: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['date']),
      resetAt: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['resetAt']),
      toolCallsCount: jsonSerialization['toolCallsCount'] as int,
      toolCallsLimit: jsonSerialization['toolCallsLimit'] as int,
      aiMessagesCount: jsonSerialization['aiMessagesCount'] as int,
      aiMessagesLimit: jsonSerialization['aiMessagesLimit'] as int,
      productsCreatedCount: jsonSerialization['productsCreatedCount'] as int,
      productsCreatedLimit: jsonSerialization['productsCreatedLimit'] as int,
      aiDescriptionsCount: jsonSerialization['aiDescriptionsCount'] as int,
      aiDescriptionsLimit: jsonSerialization['aiDescriptionsLimit'] as int,
      analyticsQueriesCount: jsonSerialization['analyticsQueriesCount'] as int,
      analyticsQueriesLimit: jsonSerialization['analyticsQueriesLimit'] as int,
      isInGracePeriod: jsonSerialization['isInGracePeriod'] as bool,
      gracePeriodUsed: jsonSerialization['gracePeriodUsed'] as int,
      gracePeriodLimit: jsonSerialization['gracePeriodLimit'] as int,
      subscriptionTier: jsonSerialization['subscriptionTier'] == null
          ? null
          : _i3.SubscriptionTier.fromJson(
              (jsonSerialization['subscriptionTier'] as int)),
      softLimitWarned: jsonSerialization['softLimitWarned'] as bool,
      hardLimitReached: jsonSerialization['hardLimitReached'] as bool,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  static final t = DailyUsageTrackerTable();

  static const db = DailyUsageTrackerRepository._();

  @override
  _i1.UuidValue id;

  _i1.UuidValue userId;

  _i2.UserType userType;

  DateTime date;

  DateTime resetAt;

  int toolCallsCount;

  int toolCallsLimit;

  int aiMessagesCount;

  int aiMessagesLimit;

  int productsCreatedCount;

  int productsCreatedLimit;

  int aiDescriptionsCount;

  int aiDescriptionsLimit;

  int analyticsQueriesCount;

  int analyticsQueriesLimit;

  bool isInGracePeriod;

  int gracePeriodUsed;

  int gracePeriodLimit;

  _i3.SubscriptionTier? subscriptionTier;

  bool softLimitWarned;

  bool hardLimitReached;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _i1.Table<_i1.UuidValue> get table => t;

  /// Returns a shallow copy of this [DailyUsageTracker]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DailyUsageTracker copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? userId,
    _i2.UserType? userType,
    DateTime? date,
    DateTime? resetAt,
    int? toolCallsCount,
    int? toolCallsLimit,
    int? aiMessagesCount,
    int? aiMessagesLimit,
    int? productsCreatedCount,
    int? productsCreatedLimit,
    int? aiDescriptionsCount,
    int? aiDescriptionsLimit,
    int? analyticsQueriesCount,
    int? analyticsQueriesLimit,
    bool? isInGracePeriod,
    int? gracePeriodUsed,
    int? gracePeriodLimit,
    _i3.SubscriptionTier? subscriptionTier,
    bool? softLimitWarned,
    bool? hardLimitReached,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'userId': userId.toJson(),
      'userType': userType.toJson(),
      'date': date.toJson(),
      'resetAt': resetAt.toJson(),
      'toolCallsCount': toolCallsCount,
      'toolCallsLimit': toolCallsLimit,
      'aiMessagesCount': aiMessagesCount,
      'aiMessagesLimit': aiMessagesLimit,
      'productsCreatedCount': productsCreatedCount,
      'productsCreatedLimit': productsCreatedLimit,
      'aiDescriptionsCount': aiDescriptionsCount,
      'aiDescriptionsLimit': aiDescriptionsLimit,
      'analyticsQueriesCount': analyticsQueriesCount,
      'analyticsQueriesLimit': analyticsQueriesLimit,
      'isInGracePeriod': isInGracePeriod,
      'gracePeriodUsed': gracePeriodUsed,
      'gracePeriodLimit': gracePeriodLimit,
      if (subscriptionTier != null)
        'subscriptionTier': subscriptionTier?.toJson(),
      'softLimitWarned': softLimitWarned,
      'hardLimitReached': hardLimitReached,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'id': id.toJson(),
      'userId': userId.toJson(),
      'userType': userType.toJson(),
      'date': date.toJson(),
      'resetAt': resetAt.toJson(),
      'toolCallsCount': toolCallsCount,
      'toolCallsLimit': toolCallsLimit,
      'aiMessagesCount': aiMessagesCount,
      'aiMessagesLimit': aiMessagesLimit,
      'productsCreatedCount': productsCreatedCount,
      'productsCreatedLimit': productsCreatedLimit,
      'aiDescriptionsCount': aiDescriptionsCount,
      'aiDescriptionsLimit': aiDescriptionsLimit,
      'analyticsQueriesCount': analyticsQueriesCount,
      'analyticsQueriesLimit': analyticsQueriesLimit,
      'isInGracePeriod': isInGracePeriod,
      'gracePeriodUsed': gracePeriodUsed,
      'gracePeriodLimit': gracePeriodLimit,
      if (subscriptionTier != null)
        'subscriptionTier': subscriptionTier?.toJson(),
      'softLimitWarned': softLimitWarned,
      'hardLimitReached': hardLimitReached,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static DailyUsageTrackerInclude include() {
    return DailyUsageTrackerInclude._();
  }

  static DailyUsageTrackerIncludeList includeList({
    _i1.WhereExpressionBuilder<DailyUsageTrackerTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DailyUsageTrackerTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DailyUsageTrackerTable>? orderByList,
    DailyUsageTrackerInclude? include,
  }) {
    return DailyUsageTrackerIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(DailyUsageTracker.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(DailyUsageTracker.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DailyUsageTrackerImpl extends DailyUsageTracker {
  _DailyUsageTrackerImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue userId,
    required _i2.UserType userType,
    required DateTime date,
    required DateTime resetAt,
    int? toolCallsCount,
    required int toolCallsLimit,
    int? aiMessagesCount,
    required int aiMessagesLimit,
    int? productsCreatedCount,
    required int productsCreatedLimit,
    int? aiDescriptionsCount,
    required int aiDescriptionsLimit,
    int? analyticsQueriesCount,
    required int analyticsQueriesLimit,
    bool? isInGracePeriod,
    int? gracePeriodUsed,
    int? gracePeriodLimit,
    _i3.SubscriptionTier? subscriptionTier,
    bool? softLimitWarned,
    bool? hardLimitReached,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
          id: id,
          userId: userId,
          userType: userType,
          date: date,
          resetAt: resetAt,
          toolCallsCount: toolCallsCount,
          toolCallsLimit: toolCallsLimit,
          aiMessagesCount: aiMessagesCount,
          aiMessagesLimit: aiMessagesLimit,
          productsCreatedCount: productsCreatedCount,
          productsCreatedLimit: productsCreatedLimit,
          aiDescriptionsCount: aiDescriptionsCount,
          aiDescriptionsLimit: aiDescriptionsLimit,
          analyticsQueriesCount: analyticsQueriesCount,
          analyticsQueriesLimit: analyticsQueriesLimit,
          isInGracePeriod: isInGracePeriod,
          gracePeriodUsed: gracePeriodUsed,
          gracePeriodLimit: gracePeriodLimit,
          subscriptionTier: subscriptionTier,
          softLimitWarned: softLimitWarned,
          hardLimitReached: hardLimitReached,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  /// Returns a shallow copy of this [DailyUsageTracker]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DailyUsageTracker copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? userId,
    _i2.UserType? userType,
    DateTime? date,
    DateTime? resetAt,
    int? toolCallsCount,
    int? toolCallsLimit,
    int? aiMessagesCount,
    int? aiMessagesLimit,
    int? productsCreatedCount,
    int? productsCreatedLimit,
    int? aiDescriptionsCount,
    int? aiDescriptionsLimit,
    int? analyticsQueriesCount,
    int? analyticsQueriesLimit,
    bool? isInGracePeriod,
    int? gracePeriodUsed,
    int? gracePeriodLimit,
    Object? subscriptionTier = _Undefined,
    bool? softLimitWarned,
    bool? hardLimitReached,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return DailyUsageTracker(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      userType: userType ?? this.userType,
      date: date ?? this.date,
      resetAt: resetAt ?? this.resetAt,
      toolCallsCount: toolCallsCount ?? this.toolCallsCount,
      toolCallsLimit: toolCallsLimit ?? this.toolCallsLimit,
      aiMessagesCount: aiMessagesCount ?? this.aiMessagesCount,
      aiMessagesLimit: aiMessagesLimit ?? this.aiMessagesLimit,
      productsCreatedCount: productsCreatedCount ?? this.productsCreatedCount,
      productsCreatedLimit: productsCreatedLimit ?? this.productsCreatedLimit,
      aiDescriptionsCount: aiDescriptionsCount ?? this.aiDescriptionsCount,
      aiDescriptionsLimit: aiDescriptionsLimit ?? this.aiDescriptionsLimit,
      analyticsQueriesCount:
          analyticsQueriesCount ?? this.analyticsQueriesCount,
      analyticsQueriesLimit:
          analyticsQueriesLimit ?? this.analyticsQueriesLimit,
      isInGracePeriod: isInGracePeriod ?? this.isInGracePeriod,
      gracePeriodUsed: gracePeriodUsed ?? this.gracePeriodUsed,
      gracePeriodLimit: gracePeriodLimit ?? this.gracePeriodLimit,
      subscriptionTier: subscriptionTier is _i3.SubscriptionTier?
          ? subscriptionTier
          : this.subscriptionTier,
      softLimitWarned: softLimitWarned ?? this.softLimitWarned,
      hardLimitReached: hardLimitReached ?? this.hardLimitReached,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class DailyUsageTrackerTable extends _i1.Table<_i1.UuidValue> {
  DailyUsageTrackerTable({super.tableRelation})
      : super(tableName: 'daily_usage_trackers') {
    userId = _i1.ColumnUuid(
      'userId',
      this,
    );
    userType = _i1.ColumnEnum(
      'userType',
      this,
      _i1.EnumSerialization.byIndex,
    );
    date = _i1.ColumnDateTime(
      'date',
      this,
    );
    resetAt = _i1.ColumnDateTime(
      'resetAt',
      this,
    );
    toolCallsCount = _i1.ColumnInt(
      'toolCallsCount',
      this,
      hasDefault: true,
    );
    toolCallsLimit = _i1.ColumnInt(
      'toolCallsLimit',
      this,
    );
    aiMessagesCount = _i1.ColumnInt(
      'aiMessagesCount',
      this,
      hasDefault: true,
    );
    aiMessagesLimit = _i1.ColumnInt(
      'aiMessagesLimit',
      this,
    );
    productsCreatedCount = _i1.ColumnInt(
      'productsCreatedCount',
      this,
      hasDefault: true,
    );
    productsCreatedLimit = _i1.ColumnInt(
      'productsCreatedLimit',
      this,
    );
    aiDescriptionsCount = _i1.ColumnInt(
      'aiDescriptionsCount',
      this,
      hasDefault: true,
    );
    aiDescriptionsLimit = _i1.ColumnInt(
      'aiDescriptionsLimit',
      this,
    );
    analyticsQueriesCount = _i1.ColumnInt(
      'analyticsQueriesCount',
      this,
      hasDefault: true,
    );
    analyticsQueriesLimit = _i1.ColumnInt(
      'analyticsQueriesLimit',
      this,
    );
    isInGracePeriod = _i1.ColumnBool(
      'isInGracePeriod',
      this,
      hasDefault: true,
    );
    gracePeriodUsed = _i1.ColumnInt(
      'gracePeriodUsed',
      this,
      hasDefault: true,
    );
    gracePeriodLimit = _i1.ColumnInt(
      'gracePeriodLimit',
      this,
      hasDefault: true,
    );
    subscriptionTier = _i1.ColumnEnum(
      'subscriptionTier',
      this,
      _i1.EnumSerialization.byIndex,
    );
    softLimitWarned = _i1.ColumnBool(
      'softLimitWarned',
      this,
      hasDefault: true,
    );
    hardLimitReached = _i1.ColumnBool(
      'hardLimitReached',
      this,
      hasDefault: true,
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

  late final _i1.ColumnUuid userId;

  late final _i1.ColumnEnum<_i2.UserType> userType;

  late final _i1.ColumnDateTime date;

  late final _i1.ColumnDateTime resetAt;

  late final _i1.ColumnInt toolCallsCount;

  late final _i1.ColumnInt toolCallsLimit;

  late final _i1.ColumnInt aiMessagesCount;

  late final _i1.ColumnInt aiMessagesLimit;

  late final _i1.ColumnInt productsCreatedCount;

  late final _i1.ColumnInt productsCreatedLimit;

  late final _i1.ColumnInt aiDescriptionsCount;

  late final _i1.ColumnInt aiDescriptionsLimit;

  late final _i1.ColumnInt analyticsQueriesCount;

  late final _i1.ColumnInt analyticsQueriesLimit;

  late final _i1.ColumnBool isInGracePeriod;

  late final _i1.ColumnInt gracePeriodUsed;

  late final _i1.ColumnInt gracePeriodLimit;

  late final _i1.ColumnEnum<_i3.SubscriptionTier> subscriptionTier;

  late final _i1.ColumnBool softLimitWarned;

  late final _i1.ColumnBool hardLimitReached;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  @override
  List<_i1.Column> get columns => [
        id,
        userId,
        userType,
        date,
        resetAt,
        toolCallsCount,
        toolCallsLimit,
        aiMessagesCount,
        aiMessagesLimit,
        productsCreatedCount,
        productsCreatedLimit,
        aiDescriptionsCount,
        aiDescriptionsLimit,
        analyticsQueriesCount,
        analyticsQueriesLimit,
        isInGracePeriod,
        gracePeriodUsed,
        gracePeriodLimit,
        subscriptionTier,
        softLimitWarned,
        hardLimitReached,
        createdAt,
        updatedAt,
      ];
}

class DailyUsageTrackerInclude extends _i1.IncludeObject {
  DailyUsageTrackerInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<_i1.UuidValue> get table => DailyUsageTracker.t;
}

class DailyUsageTrackerIncludeList extends _i1.IncludeList {
  DailyUsageTrackerIncludeList._({
    _i1.WhereExpressionBuilder<DailyUsageTrackerTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(DailyUsageTracker.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue> get table => DailyUsageTracker.t;
}

class DailyUsageTrackerRepository {
  const DailyUsageTrackerRepository._();

  /// Returns a list of [DailyUsageTracker]s matching the given query parameters.
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
  Future<List<DailyUsageTracker>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DailyUsageTrackerTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DailyUsageTrackerTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DailyUsageTrackerTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<DailyUsageTracker>(
      where: where?.call(DailyUsageTracker.t),
      orderBy: orderBy?.call(DailyUsageTracker.t),
      orderByList: orderByList?.call(DailyUsageTracker.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [DailyUsageTracker] matching the given query parameters.
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
  Future<DailyUsageTracker?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DailyUsageTrackerTable>? where,
    int? offset,
    _i1.OrderByBuilder<DailyUsageTrackerTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DailyUsageTrackerTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<DailyUsageTracker>(
      where: where?.call(DailyUsageTracker.t),
      orderBy: orderBy?.call(DailyUsageTracker.t),
      orderByList: orderByList?.call(DailyUsageTracker.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [DailyUsageTracker] by its [id] or null if no such row exists.
  Future<DailyUsageTracker?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<DailyUsageTracker>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [DailyUsageTracker]s in the list and returns the inserted rows.
  ///
  /// The returned [DailyUsageTracker]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<DailyUsageTracker>> insert(
    _i1.Session session,
    List<DailyUsageTracker> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<DailyUsageTracker>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [DailyUsageTracker] and returns the inserted row.
  ///
  /// The returned [DailyUsageTracker] will have its `id` field set.
  Future<DailyUsageTracker> insertRow(
    _i1.Session session,
    DailyUsageTracker row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<DailyUsageTracker>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [DailyUsageTracker]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<DailyUsageTracker>> update(
    _i1.Session session,
    List<DailyUsageTracker> rows, {
    _i1.ColumnSelections<DailyUsageTrackerTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<DailyUsageTracker>(
      rows,
      columns: columns?.call(DailyUsageTracker.t),
      transaction: transaction,
    );
  }

  /// Updates a single [DailyUsageTracker]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<DailyUsageTracker> updateRow(
    _i1.Session session,
    DailyUsageTracker row, {
    _i1.ColumnSelections<DailyUsageTrackerTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<DailyUsageTracker>(
      row,
      columns: columns?.call(DailyUsageTracker.t),
      transaction: transaction,
    );
  }

  /// Deletes all [DailyUsageTracker]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<DailyUsageTracker>> delete(
    _i1.Session session,
    List<DailyUsageTracker> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<DailyUsageTracker>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [DailyUsageTracker].
  Future<DailyUsageTracker> deleteRow(
    _i1.Session session,
    DailyUsageTracker row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<DailyUsageTracker>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<DailyUsageTracker>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<DailyUsageTrackerTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<DailyUsageTracker>(
      where: where(DailyUsageTracker.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DailyUsageTrackerTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<DailyUsageTracker>(
      where: where?.call(DailyUsageTracker.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
