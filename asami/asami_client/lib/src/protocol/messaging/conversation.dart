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
import '../messaging/conversation_status.dart' as _i2;
import '../user/user.dart' as _i3;
import '../messaging/platfom_type.dart' as _i4;
import '../user/user_type.dart' as _i5;
import 'package:asami_client/src/protocol/protocol.dart' as _i6;

abstract class Conversation implements _i1.SerializableModel {
  Conversation._({
    _i1.UuidValue? id,
    this.userId,
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
  }) : id = id ?? _i1.Uuid().v4obj(),
       status = status ?? _i2.ConversationStatus.active,
       isEscalated = isEscalated ?? false,
       messageCount = messageCount ?? 0,
       botResponseCount = botResponseCount ?? 0,
       createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory Conversation({
    _i1.UuidValue? id,
    _i1.UuidValue? userId,
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
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      userId: jsonSerialization['userId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      user: jsonSerialization['user'] == null
          ? null
          : _i6.Protocol().deserialize<_i3.User>(jsonSerialization['user']),
      platform: _i4.PlatformType.fromJson(
        (jsonSerialization['platform'] as String),
      ),
      platformUserId: jsonSerialization['platformUserId'] as String,
      platformUsername: jsonSerialization['platformUsername'] as String?,
      userType: _i5.UserType.fromJson(
        (jsonSerialization['userType'] as String),
      ),
      status: jsonSerialization['status'] == null
          ? null
          : _i2.ConversationStatus.fromJson(
              (jsonSerialization['status'] as String),
            ),
      sessionData: jsonSerialization['sessionData'] as String?,
      contextData: jsonSerialization['contextData'] as String?,
      activeCartId: jsonSerialization['activeCartId'] as String?,
      currentProductId: jsonSerialization['currentProductId'] as String?,
      currentVendorId: jsonSerialization['currentVendorId'] as String?,
      lastIntent: jsonSerialization['lastIntent'] as String?,
      lastEntities: jsonSerialization['lastEntities'] as String?,
      agentState: jsonSerialization['agentState'] as String?,
      conversationSummary: jsonSerialization['conversationSummary'] as String?,
      isEscalated: jsonSerialization['isEscalated'] as bool?,
      escalatedTo: jsonSerialization['escalatedTo'] as String?,
      escalatedAt: jsonSerialization['escalatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['escalatedAt'],
            ),
      escalationReason: jsonSerialization['escalationReason'] as String?,
      messageCount: jsonSerialization['messageCount'] as int?,
      botResponseCount: jsonSerialization['botResponseCount'] as int?,
      averageResponseTime: (jsonSerialization['averageResponseTime'] as num?)
          ?.toDouble(),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
      lastMessageAt: jsonSerialization['lastMessageAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastMessageAt'],
            ),
      resolvedAt: jsonSerialization['resolvedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['resolvedAt']),
      archivedAt: jsonSerialization['archivedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['archivedAt']),
    );
  }

  /// The id of the object.
  _i1.UuidValue id;

  _i1.UuidValue? userId;

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
      '__className__': 'Conversation',
      'id': id.toJson(),
      if (userId != null) 'userId': userId?.toJson(),
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
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ConversationImpl extends Conversation {
  _ConversationImpl({
    _i1.UuidValue? id,
    _i1.UuidValue? userId,
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
    Object? userId = _Undefined,
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
      userId: userId is _i1.UuidValue? ? userId : this.userId,
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
      currentVendorId: currentVendorId is String?
          ? currentVendorId
          : this.currentVendorId,
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
      lastMessageAt: lastMessageAt is DateTime?
          ? lastMessageAt
          : this.lastMessageAt,
      resolvedAt: resolvedAt is DateTime? ? resolvedAt : this.resolvedAt,
      archivedAt: archivedAt is DateTime? ? archivedAt : this.archivedAt,
    );
  }
}
