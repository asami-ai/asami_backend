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
import '../messaging/conversation.dart' as _i2;
import '../messaging/platfom_type.dart' as _i3;
import '../messaging/message_type.dart' as _i4;
import '../messaging/message.dart' as _i5;
import 'package:asami_server/src/generated/protocol.dart' as _i6;

abstract class Message
    implements _i1.TableRow<_i1.UuidValue>, _i1.ProtocolSerialization {
  Message._({
    _i1.UuidValue? id,
    required this.conversationId,
    this.conversation,
    required this.platform,
    this.platformMessageId,
    required this.messageType,
    required this.content,
    this.mediaUrl,
    this.mediaType,
    this.thumbnailUrl,
    bool? isFromBot,
    bool? isFromUser,
    this.senderId,
    bool? isProcessedByAi,
    this.aiIntent,
    this.aiEntities,
    this.aiConfidence,
    this.aiResponse,
    this.processingTime,
    this.functionCalled,
    this.functionParams,
    this.functionResult,
    bool? isDelivered,
    bool? isRead,
    bool? isFailed,
    this.errorMessage,
    this.replyToMessageId,
    this.replyToMessage,
    this.metadata,
    DateTime? createdAt,
    this.deliveredAt,
    this.readAt,
  }) : id = id ?? _i1.Uuid().v4obj(),
       isFromBot = isFromBot ?? false,
       isFromUser = isFromUser ?? true,
       isProcessedByAi = isProcessedByAi ?? false,
       isDelivered = isDelivered ?? false,
       isRead = isRead ?? false,
       isFailed = isFailed ?? false,
       createdAt = createdAt ?? DateTime.now();

  factory Message({
    _i1.UuidValue? id,
    required _i1.UuidValue conversationId,
    _i2.Conversation? conversation,
    required _i3.PlatformType platform,
    String? platformMessageId,
    required _i4.MessageType messageType,
    required String content,
    String? mediaUrl,
    String? mediaType,
    String? thumbnailUrl,
    bool? isFromBot,
    bool? isFromUser,
    _i1.UuidValue? senderId,
    bool? isProcessedByAi,
    String? aiIntent,
    String? aiEntities,
    double? aiConfidence,
    String? aiResponse,
    int? processingTime,
    String? functionCalled,
    String? functionParams,
    String? functionResult,
    bool? isDelivered,
    bool? isRead,
    bool? isFailed,
    String? errorMessage,
    _i1.UuidValue? replyToMessageId,
    _i5.Message? replyToMessage,
    String? metadata,
    DateTime? createdAt,
    DateTime? deliveredAt,
    DateTime? readAt,
  }) = _MessageImpl;

  factory Message.fromJson(Map<String, dynamic> jsonSerialization) {
    return Message(
      id: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      conversationId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['conversationId'],
      ),
      conversation: jsonSerialization['conversation'] == null
          ? null
          : _i6.Protocol().deserialize<_i2.Conversation>(
              jsonSerialization['conversation'],
            ),
      platform: _i3.PlatformType.fromJson(
        (jsonSerialization['platform'] as String),
      ),
      platformMessageId: jsonSerialization['platformMessageId'] as String?,
      messageType: _i4.MessageType.fromJson(
        (jsonSerialization['messageType'] as String),
      ),
      content: jsonSerialization['content'] as String,
      mediaUrl: jsonSerialization['mediaUrl'] as String?,
      mediaType: jsonSerialization['mediaType'] as String?,
      thumbnailUrl: jsonSerialization['thumbnailUrl'] as String?,
      isFromBot: jsonSerialization['isFromBot'] as bool,
      isFromUser: jsonSerialization['isFromUser'] as bool,
      senderId: jsonSerialization['senderId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['senderId']),
      isProcessedByAi: jsonSerialization['isProcessedByAi'] as bool,
      aiIntent: jsonSerialization['aiIntent'] as String?,
      aiEntities: jsonSerialization['aiEntities'] as String?,
      aiConfidence: (jsonSerialization['aiConfidence'] as num?)?.toDouble(),
      aiResponse: jsonSerialization['aiResponse'] as String?,
      processingTime: jsonSerialization['processingTime'] as int?,
      functionCalled: jsonSerialization['functionCalled'] as String?,
      functionParams: jsonSerialization['functionParams'] as String?,
      functionResult: jsonSerialization['functionResult'] as String?,
      isDelivered: jsonSerialization['isDelivered'] as bool,
      isRead: jsonSerialization['isRead'] as bool,
      isFailed: jsonSerialization['isFailed'] as bool,
      errorMessage: jsonSerialization['errorMessage'] as String?,
      replyToMessageId: jsonSerialization['replyToMessageId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(
              jsonSerialization['replyToMessageId'],
            ),
      replyToMessage: jsonSerialization['replyToMessage'] == null
          ? null
          : _i6.Protocol().deserialize<_i5.Message>(
              jsonSerialization['replyToMessage'],
            ),
      metadata: jsonSerialization['metadata'] as String?,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      deliveredAt: jsonSerialization['deliveredAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['deliveredAt'],
            ),
      readAt: jsonSerialization['readAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['readAt']),
    );
  }

  static final t = MessageTable();

  static const db = MessageRepository._();

  @override
  _i1.UuidValue id;

  _i1.UuidValue conversationId;

  _i2.Conversation? conversation;

  _i3.PlatformType platform;

  String? platformMessageId;

  _i4.MessageType messageType;

  String content;

  String? mediaUrl;

  String? mediaType;

  String? thumbnailUrl;

  bool isFromBot;

  bool isFromUser;

  _i1.UuidValue? senderId;

  bool isProcessedByAi;

  String? aiIntent;

  String? aiEntities;

  double? aiConfidence;

  String? aiResponse;

  int? processingTime;

  String? functionCalled;

  String? functionParams;

  String? functionResult;

  bool isDelivered;

  bool isRead;

  bool isFailed;

  String? errorMessage;

  _i1.UuidValue? replyToMessageId;

  _i5.Message? replyToMessage;

  String? metadata;

  DateTime createdAt;

  DateTime? deliveredAt;

  DateTime? readAt;

  @override
  _i1.Table<_i1.UuidValue> get table => t;

  /// Returns a shallow copy of this [Message]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Message copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? conversationId,
    _i2.Conversation? conversation,
    _i3.PlatformType? platform,
    String? platformMessageId,
    _i4.MessageType? messageType,
    String? content,
    String? mediaUrl,
    String? mediaType,
    String? thumbnailUrl,
    bool? isFromBot,
    bool? isFromUser,
    _i1.UuidValue? senderId,
    bool? isProcessedByAi,
    String? aiIntent,
    String? aiEntities,
    double? aiConfidence,
    String? aiResponse,
    int? processingTime,
    String? functionCalled,
    String? functionParams,
    String? functionResult,
    bool? isDelivered,
    bool? isRead,
    bool? isFailed,
    String? errorMessage,
    _i1.UuidValue? replyToMessageId,
    _i5.Message? replyToMessage,
    String? metadata,
    DateTime? createdAt,
    DateTime? deliveredAt,
    DateTime? readAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Message',
      'id': id.toJson(),
      'conversationId': conversationId.toJson(),
      if (conversation != null) 'conversation': conversation?.toJson(),
      'platform': platform.toJson(),
      if (platformMessageId != null) 'platformMessageId': platformMessageId,
      'messageType': messageType.toJson(),
      'content': content,
      if (mediaUrl != null) 'mediaUrl': mediaUrl,
      if (mediaType != null) 'mediaType': mediaType,
      if (thumbnailUrl != null) 'thumbnailUrl': thumbnailUrl,
      'isFromBot': isFromBot,
      'isFromUser': isFromUser,
      if (senderId != null) 'senderId': senderId?.toJson(),
      'isProcessedByAi': isProcessedByAi,
      if (aiIntent != null) 'aiIntent': aiIntent,
      if (aiEntities != null) 'aiEntities': aiEntities,
      if (aiConfidence != null) 'aiConfidence': aiConfidence,
      if (aiResponse != null) 'aiResponse': aiResponse,
      if (processingTime != null) 'processingTime': processingTime,
      if (functionCalled != null) 'functionCalled': functionCalled,
      if (functionParams != null) 'functionParams': functionParams,
      if (functionResult != null) 'functionResult': functionResult,
      'isDelivered': isDelivered,
      'isRead': isRead,
      'isFailed': isFailed,
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (replyToMessageId != null)
        'replyToMessageId': replyToMessageId?.toJson(),
      if (replyToMessage != null) 'replyToMessage': replyToMessage?.toJson(),
      if (metadata != null) 'metadata': metadata,
      'createdAt': createdAt.toJson(),
      if (deliveredAt != null) 'deliveredAt': deliveredAt?.toJson(),
      if (readAt != null) 'readAt': readAt?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Message',
      'id': id.toJson(),
      'conversationId': conversationId.toJson(),
      if (conversation != null)
        'conversation': conversation?.toJsonForProtocol(),
      'platform': platform.toJson(),
      if (platformMessageId != null) 'platformMessageId': platformMessageId,
      'messageType': messageType.toJson(),
      'content': content,
      if (mediaUrl != null) 'mediaUrl': mediaUrl,
      if (mediaType != null) 'mediaType': mediaType,
      if (thumbnailUrl != null) 'thumbnailUrl': thumbnailUrl,
      'isFromBot': isFromBot,
      'isFromUser': isFromUser,
      if (senderId != null) 'senderId': senderId?.toJson(),
      'isProcessedByAi': isProcessedByAi,
      if (aiIntent != null) 'aiIntent': aiIntent,
      if (aiEntities != null) 'aiEntities': aiEntities,
      if (aiConfidence != null) 'aiConfidence': aiConfidence,
      if (aiResponse != null) 'aiResponse': aiResponse,
      if (processingTime != null) 'processingTime': processingTime,
      if (functionCalled != null) 'functionCalled': functionCalled,
      if (functionParams != null) 'functionParams': functionParams,
      if (functionResult != null) 'functionResult': functionResult,
      'isDelivered': isDelivered,
      'isRead': isRead,
      'isFailed': isFailed,
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (replyToMessageId != null)
        'replyToMessageId': replyToMessageId?.toJson(),
      if (replyToMessage != null)
        'replyToMessage': replyToMessage?.toJsonForProtocol(),
      if (metadata != null) 'metadata': metadata,
      'createdAt': createdAt.toJson(),
      if (deliveredAt != null) 'deliveredAt': deliveredAt?.toJson(),
      if (readAt != null) 'readAt': readAt?.toJson(),
    };
  }

  static MessageInclude include({
    _i2.ConversationInclude? conversation,
    _i5.MessageInclude? replyToMessage,
  }) {
    return MessageInclude._(
      conversation: conversation,
      replyToMessage: replyToMessage,
    );
  }

  static MessageIncludeList includeList({
    _i1.WhereExpressionBuilder<MessageTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MessageTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MessageTable>? orderByList,
    MessageInclude? include,
  }) {
    return MessageIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Message.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Message.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MessageImpl extends Message {
  _MessageImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue conversationId,
    _i2.Conversation? conversation,
    required _i3.PlatformType platform,
    String? platformMessageId,
    required _i4.MessageType messageType,
    required String content,
    String? mediaUrl,
    String? mediaType,
    String? thumbnailUrl,
    bool? isFromBot,
    bool? isFromUser,
    _i1.UuidValue? senderId,
    bool? isProcessedByAi,
    String? aiIntent,
    String? aiEntities,
    double? aiConfidence,
    String? aiResponse,
    int? processingTime,
    String? functionCalled,
    String? functionParams,
    String? functionResult,
    bool? isDelivered,
    bool? isRead,
    bool? isFailed,
    String? errorMessage,
    _i1.UuidValue? replyToMessageId,
    _i5.Message? replyToMessage,
    String? metadata,
    DateTime? createdAt,
    DateTime? deliveredAt,
    DateTime? readAt,
  }) : super._(
         id: id,
         conversationId: conversationId,
         conversation: conversation,
         platform: platform,
         platformMessageId: platformMessageId,
         messageType: messageType,
         content: content,
         mediaUrl: mediaUrl,
         mediaType: mediaType,
         thumbnailUrl: thumbnailUrl,
         isFromBot: isFromBot,
         isFromUser: isFromUser,
         senderId: senderId,
         isProcessedByAi: isProcessedByAi,
         aiIntent: aiIntent,
         aiEntities: aiEntities,
         aiConfidence: aiConfidence,
         aiResponse: aiResponse,
         processingTime: processingTime,
         functionCalled: functionCalled,
         functionParams: functionParams,
         functionResult: functionResult,
         isDelivered: isDelivered,
         isRead: isRead,
         isFailed: isFailed,
         errorMessage: errorMessage,
         replyToMessageId: replyToMessageId,
         replyToMessage: replyToMessage,
         metadata: metadata,
         createdAt: createdAt,
         deliveredAt: deliveredAt,
         readAt: readAt,
       );

  /// Returns a shallow copy of this [Message]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Message copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? conversationId,
    Object? conversation = _Undefined,
    _i3.PlatformType? platform,
    Object? platformMessageId = _Undefined,
    _i4.MessageType? messageType,
    String? content,
    Object? mediaUrl = _Undefined,
    Object? mediaType = _Undefined,
    Object? thumbnailUrl = _Undefined,
    bool? isFromBot,
    bool? isFromUser,
    Object? senderId = _Undefined,
    bool? isProcessedByAi,
    Object? aiIntent = _Undefined,
    Object? aiEntities = _Undefined,
    Object? aiConfidence = _Undefined,
    Object? aiResponse = _Undefined,
    Object? processingTime = _Undefined,
    Object? functionCalled = _Undefined,
    Object? functionParams = _Undefined,
    Object? functionResult = _Undefined,
    bool? isDelivered,
    bool? isRead,
    bool? isFailed,
    Object? errorMessage = _Undefined,
    Object? replyToMessageId = _Undefined,
    Object? replyToMessage = _Undefined,
    Object? metadata = _Undefined,
    DateTime? createdAt,
    Object? deliveredAt = _Undefined,
    Object? readAt = _Undefined,
  }) {
    return Message(
      id: id ?? this.id,
      conversationId: conversationId ?? this.conversationId,
      conversation: conversation is _i2.Conversation?
          ? conversation
          : this.conversation?.copyWith(),
      platform: platform ?? this.platform,
      platformMessageId: platformMessageId is String?
          ? platformMessageId
          : this.platformMessageId,
      messageType: messageType ?? this.messageType,
      content: content ?? this.content,
      mediaUrl: mediaUrl is String? ? mediaUrl : this.mediaUrl,
      mediaType: mediaType is String? ? mediaType : this.mediaType,
      thumbnailUrl: thumbnailUrl is String? ? thumbnailUrl : this.thumbnailUrl,
      isFromBot: isFromBot ?? this.isFromBot,
      isFromUser: isFromUser ?? this.isFromUser,
      senderId: senderId is _i1.UuidValue? ? senderId : this.senderId,
      isProcessedByAi: isProcessedByAi ?? this.isProcessedByAi,
      aiIntent: aiIntent is String? ? aiIntent : this.aiIntent,
      aiEntities: aiEntities is String? ? aiEntities : this.aiEntities,
      aiConfidence: aiConfidence is double? ? aiConfidence : this.aiConfidence,
      aiResponse: aiResponse is String? ? aiResponse : this.aiResponse,
      processingTime: processingTime is int?
          ? processingTime
          : this.processingTime,
      functionCalled: functionCalled is String?
          ? functionCalled
          : this.functionCalled,
      functionParams: functionParams is String?
          ? functionParams
          : this.functionParams,
      functionResult: functionResult is String?
          ? functionResult
          : this.functionResult,
      isDelivered: isDelivered ?? this.isDelivered,
      isRead: isRead ?? this.isRead,
      isFailed: isFailed ?? this.isFailed,
      errorMessage: errorMessage is String? ? errorMessage : this.errorMessage,
      replyToMessageId: replyToMessageId is _i1.UuidValue?
          ? replyToMessageId
          : this.replyToMessageId,
      replyToMessage: replyToMessage is _i5.Message?
          ? replyToMessage
          : this.replyToMessage?.copyWith(),
      metadata: metadata is String? ? metadata : this.metadata,
      createdAt: createdAt ?? this.createdAt,
      deliveredAt: deliveredAt is DateTime? ? deliveredAt : this.deliveredAt,
      readAt: readAt is DateTime? ? readAt : this.readAt,
    );
  }
}

class MessageUpdateTable extends _i1.UpdateTable<MessageTable> {
  MessageUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> conversationId(
    _i1.UuidValue value,
  ) => _i1.ColumnValue(
    table.conversationId,
    value,
  );

  _i1.ColumnValue<_i3.PlatformType, _i3.PlatformType> platform(
    _i3.PlatformType value,
  ) => _i1.ColumnValue(
    table.platform,
    value,
  );

  _i1.ColumnValue<String, String> platformMessageId(String? value) =>
      _i1.ColumnValue(
        table.platformMessageId,
        value,
      );

  _i1.ColumnValue<_i4.MessageType, _i4.MessageType> messageType(
    _i4.MessageType value,
  ) => _i1.ColumnValue(
    table.messageType,
    value,
  );

  _i1.ColumnValue<String, String> content(String value) => _i1.ColumnValue(
    table.content,
    value,
  );

  _i1.ColumnValue<String, String> mediaUrl(String? value) => _i1.ColumnValue(
    table.mediaUrl,
    value,
  );

  _i1.ColumnValue<String, String> mediaType(String? value) => _i1.ColumnValue(
    table.mediaType,
    value,
  );

  _i1.ColumnValue<String, String> thumbnailUrl(String? value) =>
      _i1.ColumnValue(
        table.thumbnailUrl,
        value,
      );

  _i1.ColumnValue<bool, bool> isFromBot(bool value) => _i1.ColumnValue(
    table.isFromBot,
    value,
  );

  _i1.ColumnValue<bool, bool> isFromUser(bool value) => _i1.ColumnValue(
    table.isFromUser,
    value,
  );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> senderId(
    _i1.UuidValue? value,
  ) => _i1.ColumnValue(
    table.senderId,
    value,
  );

  _i1.ColumnValue<bool, bool> isProcessedByAi(bool value) => _i1.ColumnValue(
    table.isProcessedByAi,
    value,
  );

  _i1.ColumnValue<String, String> aiIntent(String? value) => _i1.ColumnValue(
    table.aiIntent,
    value,
  );

  _i1.ColumnValue<String, String> aiEntities(String? value) => _i1.ColumnValue(
    table.aiEntities,
    value,
  );

  _i1.ColumnValue<double, double> aiConfidence(double? value) =>
      _i1.ColumnValue(
        table.aiConfidence,
        value,
      );

  _i1.ColumnValue<String, String> aiResponse(String? value) => _i1.ColumnValue(
    table.aiResponse,
    value,
  );

  _i1.ColumnValue<int, int> processingTime(int? value) => _i1.ColumnValue(
    table.processingTime,
    value,
  );

  _i1.ColumnValue<String, String> functionCalled(String? value) =>
      _i1.ColumnValue(
        table.functionCalled,
        value,
      );

  _i1.ColumnValue<String, String> functionParams(String? value) =>
      _i1.ColumnValue(
        table.functionParams,
        value,
      );

  _i1.ColumnValue<String, String> functionResult(String? value) =>
      _i1.ColumnValue(
        table.functionResult,
        value,
      );

  _i1.ColumnValue<bool, bool> isDelivered(bool value) => _i1.ColumnValue(
    table.isDelivered,
    value,
  );

  _i1.ColumnValue<bool, bool> isRead(bool value) => _i1.ColumnValue(
    table.isRead,
    value,
  );

  _i1.ColumnValue<bool, bool> isFailed(bool value) => _i1.ColumnValue(
    table.isFailed,
    value,
  );

  _i1.ColumnValue<String, String> errorMessage(String? value) =>
      _i1.ColumnValue(
        table.errorMessage,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> replyToMessageId(
    _i1.UuidValue? value,
  ) => _i1.ColumnValue(
    table.replyToMessageId,
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

  _i1.ColumnValue<DateTime, DateTime> deliveredAt(DateTime? value) =>
      _i1.ColumnValue(
        table.deliveredAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> readAt(DateTime? value) =>
      _i1.ColumnValue(
        table.readAt,
        value,
      );
}

class MessageTable extends _i1.Table<_i1.UuidValue> {
  MessageTable({super.tableRelation}) : super(tableName: 'messages') {
    updateTable = MessageUpdateTable(this);
    conversationId = _i1.ColumnUuid(
      'conversationId',
      this,
    );
    platform = _i1.ColumnEnum(
      'platform',
      this,
      _i1.EnumSerialization.byName,
    );
    platformMessageId = _i1.ColumnString(
      'platformMessageId',
      this,
    );
    messageType = _i1.ColumnEnum(
      'messageType',
      this,
      _i1.EnumSerialization.byName,
    );
    content = _i1.ColumnString(
      'content',
      this,
    );
    mediaUrl = _i1.ColumnString(
      'mediaUrl',
      this,
    );
    mediaType = _i1.ColumnString(
      'mediaType',
      this,
    );
    thumbnailUrl = _i1.ColumnString(
      'thumbnailUrl',
      this,
    );
    isFromBot = _i1.ColumnBool(
      'isFromBot',
      this,
      hasDefault: true,
    );
    isFromUser = _i1.ColumnBool(
      'isFromUser',
      this,
      hasDefault: true,
    );
    senderId = _i1.ColumnUuid(
      'senderId',
      this,
    );
    isProcessedByAi = _i1.ColumnBool(
      'isProcessedByAi',
      this,
      hasDefault: true,
    );
    aiIntent = _i1.ColumnString(
      'aiIntent',
      this,
    );
    aiEntities = _i1.ColumnString(
      'aiEntities',
      this,
    );
    aiConfidence = _i1.ColumnDouble(
      'aiConfidence',
      this,
    );
    aiResponse = _i1.ColumnString(
      'aiResponse',
      this,
    );
    processingTime = _i1.ColumnInt(
      'processingTime',
      this,
    );
    functionCalled = _i1.ColumnString(
      'functionCalled',
      this,
    );
    functionParams = _i1.ColumnString(
      'functionParams',
      this,
    );
    functionResult = _i1.ColumnString(
      'functionResult',
      this,
    );
    isDelivered = _i1.ColumnBool(
      'isDelivered',
      this,
      hasDefault: true,
    );
    isRead = _i1.ColumnBool(
      'isRead',
      this,
      hasDefault: true,
    );
    isFailed = _i1.ColumnBool(
      'isFailed',
      this,
      hasDefault: true,
    );
    errorMessage = _i1.ColumnString(
      'errorMessage',
      this,
    );
    replyToMessageId = _i1.ColumnUuid(
      'replyToMessageId',
      this,
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
    deliveredAt = _i1.ColumnDateTime(
      'deliveredAt',
      this,
    );
    readAt = _i1.ColumnDateTime(
      'readAt',
      this,
    );
  }

  late final MessageUpdateTable updateTable;

  late final _i1.ColumnUuid conversationId;

  _i2.ConversationTable? _conversation;

  late final _i1.ColumnEnum<_i3.PlatformType> platform;

  late final _i1.ColumnString platformMessageId;

  late final _i1.ColumnEnum<_i4.MessageType> messageType;

  late final _i1.ColumnString content;

  late final _i1.ColumnString mediaUrl;

  late final _i1.ColumnString mediaType;

  late final _i1.ColumnString thumbnailUrl;

  late final _i1.ColumnBool isFromBot;

  late final _i1.ColumnBool isFromUser;

  late final _i1.ColumnUuid senderId;

  late final _i1.ColumnBool isProcessedByAi;

  late final _i1.ColumnString aiIntent;

  late final _i1.ColumnString aiEntities;

  late final _i1.ColumnDouble aiConfidence;

  late final _i1.ColumnString aiResponse;

  late final _i1.ColumnInt processingTime;

  late final _i1.ColumnString functionCalled;

  late final _i1.ColumnString functionParams;

  late final _i1.ColumnString functionResult;

  late final _i1.ColumnBool isDelivered;

  late final _i1.ColumnBool isRead;

  late final _i1.ColumnBool isFailed;

  late final _i1.ColumnString errorMessage;

  late final _i1.ColumnUuid replyToMessageId;

  _i5.MessageTable? _replyToMessage;

  late final _i1.ColumnString metadata;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime deliveredAt;

  late final _i1.ColumnDateTime readAt;

  _i2.ConversationTable get conversation {
    if (_conversation != null) return _conversation!;
    _conversation = _i1.createRelationTable(
      relationFieldName: 'conversation',
      field: Message.t.conversationId,
      foreignField: _i2.Conversation.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.ConversationTable(tableRelation: foreignTableRelation),
    );
    return _conversation!;
  }

  _i5.MessageTable get replyToMessage {
    if (_replyToMessage != null) return _replyToMessage!;
    _replyToMessage = _i1.createRelationTable(
      relationFieldName: 'replyToMessage',
      field: Message.t.replyToMessageId,
      foreignField: _i5.Message.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.MessageTable(tableRelation: foreignTableRelation),
    );
    return _replyToMessage!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    conversationId,
    platform,
    platformMessageId,
    messageType,
    content,
    mediaUrl,
    mediaType,
    thumbnailUrl,
    isFromBot,
    isFromUser,
    senderId,
    isProcessedByAi,
    aiIntent,
    aiEntities,
    aiConfidence,
    aiResponse,
    processingTime,
    functionCalled,
    functionParams,
    functionResult,
    isDelivered,
    isRead,
    isFailed,
    errorMessage,
    replyToMessageId,
    metadata,
    createdAt,
    deliveredAt,
    readAt,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'conversation') {
      return conversation;
    }
    if (relationField == 'replyToMessage') {
      return replyToMessage;
    }
    return null;
  }
}

class MessageInclude extends _i1.IncludeObject {
  MessageInclude._({
    _i2.ConversationInclude? conversation,
    _i5.MessageInclude? replyToMessage,
  }) {
    _conversation = conversation;
    _replyToMessage = replyToMessage;
  }

  _i2.ConversationInclude? _conversation;

  _i5.MessageInclude? _replyToMessage;

  @override
  Map<String, _i1.Include?> get includes => {
    'conversation': _conversation,
    'replyToMessage': _replyToMessage,
  };

  @override
  _i1.Table<_i1.UuidValue> get table => Message.t;
}

class MessageIncludeList extends _i1.IncludeList {
  MessageIncludeList._({
    _i1.WhereExpressionBuilder<MessageTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Message.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue> get table => Message.t;
}

class MessageRepository {
  const MessageRepository._();

  final attachRow = const MessageAttachRowRepository._();

  final detachRow = const MessageDetachRowRepository._();

  /// Returns a list of [Message]s matching the given query parameters.
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
  Future<List<Message>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MessageTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MessageTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MessageTable>? orderByList,
    _i1.Transaction? transaction,
    MessageInclude? include,
  }) async {
    return session.db.find<Message>(
      where: where?.call(Message.t),
      orderBy: orderBy?.call(Message.t),
      orderByList: orderByList?.call(Message.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Message] matching the given query parameters.
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
  Future<Message?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MessageTable>? where,
    int? offset,
    _i1.OrderByBuilder<MessageTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MessageTable>? orderByList,
    _i1.Transaction? transaction,
    MessageInclude? include,
  }) async {
    return session.db.findFirstRow<Message>(
      where: where?.call(Message.t),
      orderBy: orderBy?.call(Message.t),
      orderByList: orderByList?.call(Message.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Message] by its [id] or null if no such row exists.
  Future<Message?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
    MessageInclude? include,
  }) async {
    return session.db.findById<Message>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Message]s in the list and returns the inserted rows.
  ///
  /// The returned [Message]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Message>> insert(
    _i1.Session session,
    List<Message> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Message>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Message] and returns the inserted row.
  ///
  /// The returned [Message] will have its `id` field set.
  Future<Message> insertRow(
    _i1.Session session,
    Message row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Message>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Message]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Message>> update(
    _i1.Session session,
    List<Message> rows, {
    _i1.ColumnSelections<MessageTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Message>(
      rows,
      columns: columns?.call(Message.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Message]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Message> updateRow(
    _i1.Session session,
    Message row, {
    _i1.ColumnSelections<MessageTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Message>(
      row,
      columns: columns?.call(Message.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Message] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Message?> updateById(
    _i1.Session session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<MessageUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Message>(
      id,
      columnValues: columnValues(Message.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Message]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Message>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<MessageUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<MessageTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MessageTable>? orderBy,
    _i1.OrderByListBuilder<MessageTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Message>(
      columnValues: columnValues(Message.t.updateTable),
      where: where(Message.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Message.t),
      orderByList: orderByList?.call(Message.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Message]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Message>> delete(
    _i1.Session session,
    List<Message> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Message>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Message].
  Future<Message> deleteRow(
    _i1.Session session,
    Message row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Message>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Message>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<MessageTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Message>(
      where: where(Message.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MessageTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Message>(
      where: where?.call(Message.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class MessageAttachRowRepository {
  const MessageAttachRowRepository._();

  /// Creates a relation between the given [Message] and [Conversation]
  /// by setting the [Message]'s foreign key `conversationId` to refer to the [Conversation].
  Future<void> conversation(
    _i1.Session session,
    Message message,
    _i2.Conversation conversation, {
    _i1.Transaction? transaction,
  }) async {
    if (message.id == null) {
      throw ArgumentError.notNull('message.id');
    }
    if (conversation.id == null) {
      throw ArgumentError.notNull('conversation.id');
    }

    var $message = message.copyWith(conversationId: conversation.id);
    await session.db.updateRow<Message>(
      $message,
      columns: [Message.t.conversationId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [Message] and [Message]
  /// by setting the [Message]'s foreign key `replyToMessageId` to refer to the [Message].
  Future<void> replyToMessage(
    _i1.Session session,
    Message message,
    _i5.Message replyToMessage, {
    _i1.Transaction? transaction,
  }) async {
    if (message.id == null) {
      throw ArgumentError.notNull('message.id');
    }
    if (replyToMessage.id == null) {
      throw ArgumentError.notNull('replyToMessage.id');
    }

    var $message = message.copyWith(replyToMessageId: replyToMessage.id);
    await session.db.updateRow<Message>(
      $message,
      columns: [Message.t.replyToMessageId],
      transaction: transaction,
    );
  }
}

class MessageDetachRowRepository {
  const MessageDetachRowRepository._();

  /// Detaches the relation between this [Message] and the [Message] set in `replyToMessage`
  /// by setting the [Message]'s foreign key `replyToMessageId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> replyToMessage(
    _i1.Session session,
    Message message, {
    _i1.Transaction? transaction,
  }) async {
    if (message.id == null) {
      throw ArgumentError.notNull('message.id');
    }

    var $message = message.copyWith(replyToMessageId: null);
    await session.db.updateRow<Message>(
      $message,
      columns: [Message.t.replyToMessageId],
      transaction: transaction,
    );
  }
}
