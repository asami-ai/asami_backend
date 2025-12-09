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
import '../messaging/conversation_status.dart' as _i2;
import '../user/user.dart' as _i3;
import '../messaging/platfom_type.dart' as _i4;
import '../user/user_type.dart' as _i5;

abstract class Conversation
    implements _i1.TableRow<_i1.UuidValue>, _i1.ProtocolSerialization {
  Conversation._({
    _i1.UuidValue? id,
    required this.userId,
    this.user,
    required this.platform,
    required this.platformUserId,
    this.platformUsername,
    required this.userType,
    _i2.ConversationStatus? status,
    this.sessionData,
    this.contextData,
    this.activeCartId,
    this.currentProductId,
    this.currentVendorId,
    this.lastIntent,
    this.lastEntities,
    this.agentState,
    this.conversationSummary,
    bool? isEscalated,
    this.escalatedTo,
    this.escalatedAt,
    this.escalationReason,
    int? messageCount,
    int? botResponseCount,
    this.averageResponseTime,
    DateTime? createdAt,
    DateTime? updatedAt,
    this.lastMessageAt,
    this.resolvedAt,
    this.archivedAt,
  })  : id = id ?? _i1.Uuid().v4obj(),
        status = status ?? _i2.ConversationStatus.active,
        isEscalated = isEscalated ?? false,
        messageCount = messageCount ?? 0,
        botResponseCount = botResponseCount ?? 0,
        createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  factory Conversation({
    _i1.UuidValue? id,
    required _i1.UuidValue userId,
    _i3.User? user,
    required _i4.PlatformType platform,
    required String platformUserId,
    String? platformUsername,
    required _i5.UserType userType,
    _i2.ConversationStatus? status,
    String? sessionData,
    String? contextData,
    String? activeCartId,
    String? currentProductId,
    String? currentVendorId,
    String? lastIntent,
    String? lastEntities,
    String? agentState,
    String? conversationSummary,
    bool? isEscalated,
    String? escalatedTo,
    DateTime? escalatedAt,
    String? escalationReason,
    int? messageCount,
    int? botResponseCount,
    double? averageResponseTime,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? lastMessageAt,
    DateTime? resolvedAt,
    DateTime? archivedAt,
  }) = _ConversationImpl;

  factory Conversation.fromJson(Map<String, dynamic> jsonSerialization) {
    return Conversation(
      id: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      userId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      user: jsonSerialization['user'] == null
          ? null
          : _i3.User.fromJson(
              (jsonSerialization['user'] as Map<String, dynamic>)),
      platform:
          _i4.PlatformType.fromJson((jsonSerialization['platform'] as int)),
      platformUserId: jsonSerialization['platformUserId'] as String,
      platformUsername: jsonSerialization['platformUsername'] as String?,
      userType: _i5.UserType.fromJson((jsonSerialization['userType'] as int)),
      status:
          _i2.ConversationStatus.fromJson((jsonSerialization['status'] as int)),
      sessionData: jsonSerialization['sessionData'] as String?,
      contextData: jsonSerialization['contextData'] as String?,
      activeCartId: jsonSerialization['activeCartId'] as String?,
      currentProductId: jsonSerialization['currentProductId'] as String?,
      currentVendorId: jsonSerialization['currentVendorId'] as String?,
      lastIntent: jsonSerialization['lastIntent'] as String?,
      lastEntities: jsonSerialization['lastEntities'] as String?,
      agentState: jsonSerialization['agentState'] as String?,
      conversationSummary: jsonSerialization['conversationSummary'] as String?,
      isEscalated: jsonSerialization['isEscalated'] as bool,
      escalatedTo: jsonSerialization['escalatedTo'] as String?,
      escalatedAt: jsonSerialization['escalatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['escalatedAt']),
      escalationReason: jsonSerialization['escalationReason'] as String?,
      messageCount: jsonSerialization['messageCount'] as int,
      botResponseCount: jsonSerialization['botResponseCount'] as int,
      averageResponseTime:
          (jsonSerialization['averageResponseTime'] as num?)?.toDouble(),
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
      lastMessageAt: jsonSerialization['lastMessageAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastMessageAt']),
      resolvedAt: jsonSerialization['resolvedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['resolvedAt']),
      archivedAt: jsonSerialization['archivedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['archivedAt']),
    );
  }

  static final t = ConversationTable();

  static const db = ConversationRepository._();

  @override
  _i1.UuidValue id;

  _i1.UuidValue userId;

  _i3.User? user;

  _i4.PlatformType platform;

  String platformUserId;

  String? platformUsername;

  _i5.UserType userType;

  _i2.ConversationStatus status;

  String? sessionData;

  String? contextData;

  String? activeCartId;

  String? currentProductId;

  String? currentVendorId;

  String? lastIntent;

  String? lastEntities;

  String? agentState;

  String? conversationSummary;

  bool isEscalated;

  String? escalatedTo;

  DateTime? escalatedAt;

  String? escalationReason;

  int messageCount;

  int botResponseCount;

  double? averageResponseTime;

  DateTime createdAt;

  DateTime updatedAt;

  DateTime? lastMessageAt;

  DateTime? resolvedAt;

  DateTime? archivedAt;

  @override
  _i1.Table<_i1.UuidValue> get table => t;

  /// Returns a shallow copy of this [Conversation]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Conversation copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? userId,
    _i3.User? user,
    _i4.PlatformType? platform,
    String? platformUserId,
    String? platformUsername,
    _i5.UserType? userType,
    _i2.ConversationStatus? status,
    String? sessionData,
    String? contextData,
    String? activeCartId,
    String? currentProductId,
    String? currentVendorId,
    String? lastIntent,
    String? lastEntities,
    String? agentState,
    String? conversationSummary,
    bool? isEscalated,
    String? escalatedTo,
    DateTime? escalatedAt,
    String? escalationReason,
    int? messageCount,
    int? botResponseCount,
    double? averageResponseTime,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? lastMessageAt,
    DateTime? resolvedAt,
    DateTime? archivedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'userId': userId.toJson(),
      if (user != null) 'user': user?.toJson(),
      'platform': platform.toJson(),
      'platformUserId': platformUserId,
      if (platformUsername != null) 'platformUsername': platformUsername,
      'userType': userType.toJson(),
      'status': status.toJson(),
      if (sessionData != null) 'sessionData': sessionData,
      if (contextData != null) 'contextData': contextData,
      if (activeCartId != null) 'activeCartId': activeCartId,
      if (currentProductId != null) 'currentProductId': currentProductId,
      if (currentVendorId != null) 'currentVendorId': currentVendorId,
      if (lastIntent != null) 'lastIntent': lastIntent,
      if (lastEntities != null) 'lastEntities': lastEntities,
      if (agentState != null) 'agentState': agentState,
      if (conversationSummary != null)
        'conversationSummary': conversationSummary,
      'isEscalated': isEscalated,
      if (escalatedTo != null) 'escalatedTo': escalatedTo,
      if (escalatedAt != null) 'escalatedAt': escalatedAt?.toJson(),
      if (escalationReason != null) 'escalationReason': escalationReason,
      'messageCount': messageCount,
      'botResponseCount': botResponseCount,
      if (averageResponseTime != null)
        'averageResponseTime': averageResponseTime,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      if (lastMessageAt != null) 'lastMessageAt': lastMessageAt?.toJson(),
      if (resolvedAt != null) 'resolvedAt': resolvedAt?.toJson(),
      if (archivedAt != null) 'archivedAt': archivedAt?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'id': id.toJson(),
      'userId': userId.toJson(),
      if (user != null) 'user': user?.toJsonForProtocol(),
      'platform': platform.toJson(),
      'platformUserId': platformUserId,
      if (platformUsername != null) 'platformUsername': platformUsername,
      'userType': userType.toJson(),
      'status': status.toJson(),
      if (sessionData != null) 'sessionData': sessionData,
      if (contextData != null) 'contextData': contextData,
      if (activeCartId != null) 'activeCartId': activeCartId,
      if (currentProductId != null) 'currentProductId': currentProductId,
      if (currentVendorId != null) 'currentVendorId': currentVendorId,
      if (lastIntent != null) 'lastIntent': lastIntent,
      if (lastEntities != null) 'lastEntities': lastEntities,
      if (agentState != null) 'agentState': agentState,
      if (conversationSummary != null)
        'conversationSummary': conversationSummary,
      'isEscalated': isEscalated,
      if (escalatedTo != null) 'escalatedTo': escalatedTo,
      if (escalatedAt != null) 'escalatedAt': escalatedAt?.toJson(),
      if (escalationReason != null) 'escalationReason': escalationReason,
      'messageCount': messageCount,
      'botResponseCount': botResponseCount,
      if (averageResponseTime != null)
        'averageResponseTime': averageResponseTime,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      if (lastMessageAt != null) 'lastMessageAt': lastMessageAt?.toJson(),
      if (resolvedAt != null) 'resolvedAt': resolvedAt?.toJson(),
      if (archivedAt != null) 'archivedAt': archivedAt?.toJson(),
    };
  }

  static ConversationInclude include({_i3.UserInclude? user}) {
    return ConversationInclude._(user: user);
  }

  static ConversationIncludeList includeList({
    _i1.WhereExpressionBuilder<ConversationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ConversationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ConversationTable>? orderByList,
    ConversationInclude? include,
  }) {
    return ConversationIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Conversation.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Conversation.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ConversationImpl extends Conversation {
  _ConversationImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue userId,
    _i3.User? user,
    required _i4.PlatformType platform,
    required String platformUserId,
    String? platformUsername,
    required _i5.UserType userType,
    _i2.ConversationStatus? status,
    String? sessionData,
    String? contextData,
    String? activeCartId,
    String? currentProductId,
    String? currentVendorId,
    String? lastIntent,
    String? lastEntities,
    String? agentState,
    String? conversationSummary,
    bool? isEscalated,
    String? escalatedTo,
    DateTime? escalatedAt,
    String? escalationReason,
    int? messageCount,
    int? botResponseCount,
    double? averageResponseTime,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? lastMessageAt,
    DateTime? resolvedAt,
    DateTime? archivedAt,
  }) : super._(
          id: id,
          userId: userId,
          user: user,
          platform: platform,
          platformUserId: platformUserId,
          platformUsername: platformUsername,
          userType: userType,
          status: status,
          sessionData: sessionData,
          contextData: contextData,
          activeCartId: activeCartId,
          currentProductId: currentProductId,
          currentVendorId: currentVendorId,
          lastIntent: lastIntent,
          lastEntities: lastEntities,
          agentState: agentState,
          conversationSummary: conversationSummary,
          isEscalated: isEscalated,
          escalatedTo: escalatedTo,
          escalatedAt: escalatedAt,
          escalationReason: escalationReason,
          messageCount: messageCount,
          botResponseCount: botResponseCount,
          averageResponseTime: averageResponseTime,
          createdAt: createdAt,
          updatedAt: updatedAt,
          lastMessageAt: lastMessageAt,
          resolvedAt: resolvedAt,
          archivedAt: archivedAt,
        );

  /// Returns a shallow copy of this [Conversation]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Conversation copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? userId,
    Object? user = _Undefined,
    _i4.PlatformType? platform,
    String? platformUserId,
    Object? platformUsername = _Undefined,
    _i5.UserType? userType,
    _i2.ConversationStatus? status,
    Object? sessionData = _Undefined,
    Object? contextData = _Undefined,
    Object? activeCartId = _Undefined,
    Object? currentProductId = _Undefined,
    Object? currentVendorId = _Undefined,
    Object? lastIntent = _Undefined,
    Object? lastEntities = _Undefined,
    Object? agentState = _Undefined,
    Object? conversationSummary = _Undefined,
    bool? isEscalated,
    Object? escalatedTo = _Undefined,
    Object? escalatedAt = _Undefined,
    Object? escalationReason = _Undefined,
    int? messageCount,
    int? botResponseCount,
    Object? averageResponseTime = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
    Object? lastMessageAt = _Undefined,
    Object? resolvedAt = _Undefined,
    Object? archivedAt = _Undefined,
  }) {
    return Conversation(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      user: user is _i3.User? ? user : this.user?.copyWith(),
      platform: platform ?? this.platform,
      platformUserId: platformUserId ?? this.platformUserId,
      platformUsername: platformUsername is String?
          ? platformUsername
          : this.platformUsername,
      userType: userType ?? this.userType,
      status: status ?? this.status,
      sessionData: sessionData is String? ? sessionData : this.sessionData,
      contextData: contextData is String? ? contextData : this.contextData,
      activeCartId: activeCartId is String? ? activeCartId : this.activeCartId,
      currentProductId: currentProductId is String?
          ? currentProductId
          : this.currentProductId,
      currentVendorId:
          currentVendorId is String? ? currentVendorId : this.currentVendorId,
      lastIntent: lastIntent is String? ? lastIntent : this.lastIntent,
      lastEntities: lastEntities is String? ? lastEntities : this.lastEntities,
      agentState: agentState is String? ? agentState : this.agentState,
      conversationSummary: conversationSummary is String?
          ? conversationSummary
          : this.conversationSummary,
      isEscalated: isEscalated ?? this.isEscalated,
      escalatedTo: escalatedTo is String? ? escalatedTo : this.escalatedTo,
      escalatedAt: escalatedAt is DateTime? ? escalatedAt : this.escalatedAt,
      escalationReason: escalationReason is String?
          ? escalationReason
          : this.escalationReason,
      messageCount: messageCount ?? this.messageCount,
      botResponseCount: botResponseCount ?? this.botResponseCount,
      averageResponseTime: averageResponseTime is double?
          ? averageResponseTime
          : this.averageResponseTime,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      lastMessageAt:
          lastMessageAt is DateTime? ? lastMessageAt : this.lastMessageAt,
      resolvedAt: resolvedAt is DateTime? ? resolvedAt : this.resolvedAt,
      archivedAt: archivedAt is DateTime? ? archivedAt : this.archivedAt,
    );
  }
}

class ConversationTable extends _i1.Table<_i1.UuidValue> {
  ConversationTable({super.tableRelation}) : super(tableName: 'conversations') {
    userId = _i1.ColumnUuid(
      'userId',
      this,
    );
    platform = _i1.ColumnEnum(
      'platform',
      this,
      _i1.EnumSerialization.byIndex,
    );
    platformUserId = _i1.ColumnString(
      'platformUserId',
      this,
    );
    platformUsername = _i1.ColumnString(
      'platformUsername',
      this,
    );
    userType = _i1.ColumnEnum(
      'userType',
      this,
      _i1.EnumSerialization.byIndex,
    );
    status = _i1.ColumnEnum(
      'status',
      this,
      _i1.EnumSerialization.byIndex,
      hasDefault: true,
    );
    sessionData = _i1.ColumnString(
      'sessionData',
      this,
    );
    contextData = _i1.ColumnString(
      'contextData',
      this,
    );
    activeCartId = _i1.ColumnString(
      'activeCartId',
      this,
    );
    currentProductId = _i1.ColumnString(
      'currentProductId',
      this,
    );
    currentVendorId = _i1.ColumnString(
      'currentVendorId',
      this,
    );
    lastIntent = _i1.ColumnString(
      'lastIntent',
      this,
    );
    lastEntities = _i1.ColumnString(
      'lastEntities',
      this,
    );
    agentState = _i1.ColumnString(
      'agentState',
      this,
    );
    conversationSummary = _i1.ColumnString(
      'conversationSummary',
      this,
    );
    isEscalated = _i1.ColumnBool(
      'isEscalated',
      this,
      hasDefault: true,
    );
    escalatedTo = _i1.ColumnString(
      'escalatedTo',
      this,
    );
    escalatedAt = _i1.ColumnDateTime(
      'escalatedAt',
      this,
    );
    escalationReason = _i1.ColumnString(
      'escalationReason',
      this,
    );
    messageCount = _i1.ColumnInt(
      'messageCount',
      this,
      hasDefault: true,
    );
    botResponseCount = _i1.ColumnInt(
      'botResponseCount',
      this,
      hasDefault: true,
    );
    averageResponseTime = _i1.ColumnDouble(
      'averageResponseTime',
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
    lastMessageAt = _i1.ColumnDateTime(
      'lastMessageAt',
      this,
    );
    resolvedAt = _i1.ColumnDateTime(
      'resolvedAt',
      this,
    );
    archivedAt = _i1.ColumnDateTime(
      'archivedAt',
      this,
    );
  }

  late final _i1.ColumnUuid userId;

  _i3.UserTable? _user;

  late final _i1.ColumnEnum<_i4.PlatformType> platform;

  late final _i1.ColumnString platformUserId;

  late final _i1.ColumnString platformUsername;

  late final _i1.ColumnEnum<_i5.UserType> userType;

  late final _i1.ColumnEnum<_i2.ConversationStatus> status;

  late final _i1.ColumnString sessionData;

  late final _i1.ColumnString contextData;

  late final _i1.ColumnString activeCartId;

  late final _i1.ColumnString currentProductId;

  late final _i1.ColumnString currentVendorId;

  late final _i1.ColumnString lastIntent;

  late final _i1.ColumnString lastEntities;

  late final _i1.ColumnString agentState;

  late final _i1.ColumnString conversationSummary;

  late final _i1.ColumnBool isEscalated;

  late final _i1.ColumnString escalatedTo;

  late final _i1.ColumnDateTime escalatedAt;

  late final _i1.ColumnString escalationReason;

  late final _i1.ColumnInt messageCount;

  late final _i1.ColumnInt botResponseCount;

  late final _i1.ColumnDouble averageResponseTime;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  late final _i1.ColumnDateTime lastMessageAt;

  late final _i1.ColumnDateTime resolvedAt;

  late final _i1.ColumnDateTime archivedAt;

  _i3.UserTable get user {
    if (_user != null) return _user!;
    _user = _i1.createRelationTable(
      relationFieldName: 'user',
      field: Conversation.t.userId,
      foreignField: _i3.User.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.UserTable(tableRelation: foreignTableRelation),
    );
    return _user!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        userId,
        platform,
        platformUserId,
        platformUsername,
        userType,
        status,
        sessionData,
        contextData,
        activeCartId,
        currentProductId,
        currentVendorId,
        lastIntent,
        lastEntities,
        agentState,
        conversationSummary,
        isEscalated,
        escalatedTo,
        escalatedAt,
        escalationReason,
        messageCount,
        botResponseCount,
        averageResponseTime,
        createdAt,
        updatedAt,
        lastMessageAt,
        resolvedAt,
        archivedAt,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'user') {
      return user;
    }
    return null;
  }
}

class ConversationInclude extends _i1.IncludeObject {
  ConversationInclude._({_i3.UserInclude? user}) {
    _user = user;
  }

  _i3.UserInclude? _user;

  @override
  Map<String, _i1.Include?> get includes => {'user': _user};

  @override
  _i1.Table<_i1.UuidValue> get table => Conversation.t;
}

class ConversationIncludeList extends _i1.IncludeList {
  ConversationIncludeList._({
    _i1.WhereExpressionBuilder<ConversationTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Conversation.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue> get table => Conversation.t;
}

class ConversationRepository {
  const ConversationRepository._();

  final attachRow = const ConversationAttachRowRepository._();

  /// Returns a list of [Conversation]s matching the given query parameters.
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
  Future<List<Conversation>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ConversationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ConversationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ConversationTable>? orderByList,
    _i1.Transaction? transaction,
    ConversationInclude? include,
  }) async {
    return session.db.find<Conversation>(
      where: where?.call(Conversation.t),
      orderBy: orderBy?.call(Conversation.t),
      orderByList: orderByList?.call(Conversation.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Conversation] matching the given query parameters.
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
  Future<Conversation?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ConversationTable>? where,
    int? offset,
    _i1.OrderByBuilder<ConversationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ConversationTable>? orderByList,
    _i1.Transaction? transaction,
    ConversationInclude? include,
  }) async {
    return session.db.findFirstRow<Conversation>(
      where: where?.call(Conversation.t),
      orderBy: orderBy?.call(Conversation.t),
      orderByList: orderByList?.call(Conversation.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Conversation] by its [id] or null if no such row exists.
  Future<Conversation?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
    ConversationInclude? include,
  }) async {
    return session.db.findById<Conversation>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Conversation]s in the list and returns the inserted rows.
  ///
  /// The returned [Conversation]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Conversation>> insert(
    _i1.Session session,
    List<Conversation> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Conversation>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Conversation] and returns the inserted row.
  ///
  /// The returned [Conversation] will have its `id` field set.
  Future<Conversation> insertRow(
    _i1.Session session,
    Conversation row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Conversation>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Conversation]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Conversation>> update(
    _i1.Session session,
    List<Conversation> rows, {
    _i1.ColumnSelections<ConversationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Conversation>(
      rows,
      columns: columns?.call(Conversation.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Conversation]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Conversation> updateRow(
    _i1.Session session,
    Conversation row, {
    _i1.ColumnSelections<ConversationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Conversation>(
      row,
      columns: columns?.call(Conversation.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Conversation]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Conversation>> delete(
    _i1.Session session,
    List<Conversation> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Conversation>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Conversation].
  Future<Conversation> deleteRow(
    _i1.Session session,
    Conversation row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Conversation>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Conversation>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ConversationTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Conversation>(
      where: where(Conversation.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ConversationTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Conversation>(
      where: where?.call(Conversation.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class ConversationAttachRowRepository {
  const ConversationAttachRowRepository._();

  /// Creates a relation between the given [Conversation] and [User]
  /// by setting the [Conversation]'s foreign key `userId` to refer to the [User].
  Future<void> user(
    _i1.Session session,
    Conversation conversation,
    _i3.User user, {
    _i1.Transaction? transaction,
  }) async {
    if (conversation.id == null) {
      throw ArgumentError.notNull('conversation.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $conversation = conversation.copyWith(userId: user.id);
    await session.db.updateRow<Conversation>(
      $conversation,
      columns: [Conversation.t.userId],
      transaction: transaction,
    );
  }
}
