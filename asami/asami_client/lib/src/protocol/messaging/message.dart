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
import '../messaging/conversation.dart' as _i2;
import '../messaging/platfom_type.dart' as _i3;
import '../messaging/message_type.dart' as _i4;
import '../messaging/message.dart' as _i5;
import 'package:asami_client/src/protocol/protocol.dart' as _i6;

abstract class Message implements _i1.SerializableModel {
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
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
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
      isFromBot: jsonSerialization['isFromBot'] as bool?,
      isFromUser: jsonSerialization['isFromUser'] as bool?,
      senderId: jsonSerialization['senderId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['senderId']),
      isProcessedByAi: jsonSerialization['isProcessedByAi'] as bool?,
      aiIntent: jsonSerialization['aiIntent'] as String?,
      aiEntities: jsonSerialization['aiEntities'] as String?,
      aiConfidence: (jsonSerialization['aiConfidence'] as num?)?.toDouble(),
      aiResponse: jsonSerialization['aiResponse'] as String?,
      processingTime: jsonSerialization['processingTime'] as int?,
      functionCalled: jsonSerialization['functionCalled'] as String?,
      functionParams: jsonSerialization['functionParams'] as String?,
      functionResult: jsonSerialization['functionResult'] as String?,
      isDelivered: jsonSerialization['isDelivered'] as bool?,
      isRead: jsonSerialization['isRead'] as bool?,
      isFailed: jsonSerialization['isFailed'] as bool?,
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
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
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

  /// The id of the object.
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
