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
import '../messaging/message.dart' as _i3;
import 'package:asami_client/src/protocol/protocol.dart' as _i4;

abstract class BotInteraction implements _i1.SerializableModel {
  BotInteraction._({
    _i1.UuidValue? id,
    required this.conversationId,
    this.conversation,
    required this.userId,
    this.messageId,
    this.message,
    required this.intent,
    required this.confidence,
    this.entities,
    this.userQuery,
    this.botResponse,
    this.functionName,
    this.functionInput,
    this.functionOutput,
    this.executionTime,
    bool? isSuccess,
    this.errorMessage,
    this.wasHelpful,
    this.userFeedback,
    this.feedbackAt,
    this.modelUsed,
    this.promptTokens,
    this.completionTokens,
    this.totalTokens,
    DateTime? createdAt,
  }) : id = id ?? _i1.Uuid().v4obj(),
       isSuccess = isSuccess ?? true,
       createdAt = createdAt ?? DateTime.now();

  factory BotInteraction({
    _i1.UuidValue? id,
    required _i1.UuidValue conversationId,
    _i2.Conversation? conversation,
    required _i1.UuidValue userId,
    _i1.UuidValue? messageId,
    _i3.Message? message,
    required String intent,
    required double confidence,
    String? entities,
    String? userQuery,
    String? botResponse,
    String? functionName,
    String? functionInput,
    String? functionOutput,
    int? executionTime,
    bool? isSuccess,
    String? errorMessage,
    bool? wasHelpful,
    String? userFeedback,
    DateTime? feedbackAt,
    String? modelUsed,
    int? promptTokens,
    int? completionTokens,
    int? totalTokens,
    DateTime? createdAt,
  }) = _BotInteractionImpl;

  factory BotInteraction.fromJson(Map<String, dynamic> jsonSerialization) {
    return BotInteraction(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      conversationId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['conversationId'],
      ),
      conversation: jsonSerialization['conversation'] == null
          ? null
          : _i4.Protocol().deserialize<_i2.Conversation>(
              jsonSerialization['conversation'],
            ),
      userId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      messageId: jsonSerialization['messageId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['messageId']),
      message: jsonSerialization['message'] == null
          ? null
          : _i4.Protocol().deserialize<_i3.Message>(
              jsonSerialization['message'],
            ),
      intent: jsonSerialization['intent'] as String,
      confidence: (jsonSerialization['confidence'] as num).toDouble(),
      entities: jsonSerialization['entities'] as String?,
      userQuery: jsonSerialization['userQuery'] as String?,
      botResponse: jsonSerialization['botResponse'] as String?,
      functionName: jsonSerialization['functionName'] as String?,
      functionInput: jsonSerialization['functionInput'] as String?,
      functionOutput: jsonSerialization['functionOutput'] as String?,
      executionTime: jsonSerialization['executionTime'] as int?,
      isSuccess: jsonSerialization['isSuccess'] as bool?,
      errorMessage: jsonSerialization['errorMessage'] as String?,
      wasHelpful: jsonSerialization['wasHelpful'] as bool?,
      userFeedback: jsonSerialization['userFeedback'] as String?,
      feedbackAt: jsonSerialization['feedbackAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['feedbackAt']),
      modelUsed: jsonSerialization['modelUsed'] as String?,
      promptTokens: jsonSerialization['promptTokens'] as int?,
      completionTokens: jsonSerialization['completionTokens'] as int?,
      totalTokens: jsonSerialization['totalTokens'] as int?,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  /// The id of the object.
  _i1.UuidValue id;

  _i1.UuidValue conversationId;

  _i2.Conversation? conversation;

  _i1.UuidValue userId;

  _i1.UuidValue? messageId;

  _i3.Message? message;

  String intent;

  double confidence;

  String? entities;

  String? userQuery;

  String? botResponse;

  String? functionName;

  String? functionInput;

  String? functionOutput;

  int? executionTime;

  bool isSuccess;

  String? errorMessage;

  bool? wasHelpful;

  String? userFeedback;

  DateTime? feedbackAt;

  String? modelUsed;

  int? promptTokens;

  int? completionTokens;

  int? totalTokens;

  DateTime createdAt;

  /// Returns a shallow copy of this [BotInteraction]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  BotInteraction copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? conversationId,
    _i2.Conversation? conversation,
    _i1.UuidValue? userId,
    _i1.UuidValue? messageId,
    _i3.Message? message,
    String? intent,
    double? confidence,
    String? entities,
    String? userQuery,
    String? botResponse,
    String? functionName,
    String? functionInput,
    String? functionOutput,
    int? executionTime,
    bool? isSuccess,
    String? errorMessage,
    bool? wasHelpful,
    String? userFeedback,
    DateTime? feedbackAt,
    String? modelUsed,
    int? promptTokens,
    int? completionTokens,
    int? totalTokens,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'BotInteraction',
      'id': id.toJson(),
      'conversationId': conversationId.toJson(),
      if (conversation != null) 'conversation': conversation?.toJson(),
      'userId': userId.toJson(),
      if (messageId != null) 'messageId': messageId?.toJson(),
      if (message != null) 'message': message?.toJson(),
      'intent': intent,
      'confidence': confidence,
      if (entities != null) 'entities': entities,
      if (userQuery != null) 'userQuery': userQuery,
      if (botResponse != null) 'botResponse': botResponse,
      if (functionName != null) 'functionName': functionName,
      if (functionInput != null) 'functionInput': functionInput,
      if (functionOutput != null) 'functionOutput': functionOutput,
      if (executionTime != null) 'executionTime': executionTime,
      'isSuccess': isSuccess,
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (wasHelpful != null) 'wasHelpful': wasHelpful,
      if (userFeedback != null) 'userFeedback': userFeedback,
      if (feedbackAt != null) 'feedbackAt': feedbackAt?.toJson(),
      if (modelUsed != null) 'modelUsed': modelUsed,
      if (promptTokens != null) 'promptTokens': promptTokens,
      if (completionTokens != null) 'completionTokens': completionTokens,
      if (totalTokens != null) 'totalTokens': totalTokens,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BotInteractionImpl extends BotInteraction {
  _BotInteractionImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue conversationId,
    _i2.Conversation? conversation,
    required _i1.UuidValue userId,
    _i1.UuidValue? messageId,
    _i3.Message? message,
    required String intent,
    required double confidence,
    String? entities,
    String? userQuery,
    String? botResponse,
    String? functionName,
    String? functionInput,
    String? functionOutput,
    int? executionTime,
    bool? isSuccess,
    String? errorMessage,
    bool? wasHelpful,
    String? userFeedback,
    DateTime? feedbackAt,
    String? modelUsed,
    int? promptTokens,
    int? completionTokens,
    int? totalTokens,
    DateTime? createdAt,
  }) : super._(
         id: id,
         conversationId: conversationId,
         conversation: conversation,
         userId: userId,
         messageId: messageId,
         message: message,
         intent: intent,
         confidence: confidence,
         entities: entities,
         userQuery: userQuery,
         botResponse: botResponse,
         functionName: functionName,
         functionInput: functionInput,
         functionOutput: functionOutput,
         executionTime: executionTime,
         isSuccess: isSuccess,
         errorMessage: errorMessage,
         wasHelpful: wasHelpful,
         userFeedback: userFeedback,
         feedbackAt: feedbackAt,
         modelUsed: modelUsed,
         promptTokens: promptTokens,
         completionTokens: completionTokens,
         totalTokens: totalTokens,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [BotInteraction]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  BotInteraction copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? conversationId,
    Object? conversation = _Undefined,
    _i1.UuidValue? userId,
    Object? messageId = _Undefined,
    Object? message = _Undefined,
    String? intent,
    double? confidence,
    Object? entities = _Undefined,
    Object? userQuery = _Undefined,
    Object? botResponse = _Undefined,
    Object? functionName = _Undefined,
    Object? functionInput = _Undefined,
    Object? functionOutput = _Undefined,
    Object? executionTime = _Undefined,
    bool? isSuccess,
    Object? errorMessage = _Undefined,
    Object? wasHelpful = _Undefined,
    Object? userFeedback = _Undefined,
    Object? feedbackAt = _Undefined,
    Object? modelUsed = _Undefined,
    Object? promptTokens = _Undefined,
    Object? completionTokens = _Undefined,
    Object? totalTokens = _Undefined,
    DateTime? createdAt,
  }) {
    return BotInteraction(
      id: id ?? this.id,
      conversationId: conversationId ?? this.conversationId,
      conversation: conversation is _i2.Conversation?
          ? conversation
          : this.conversation?.copyWith(),
      userId: userId ?? this.userId,
      messageId: messageId is _i1.UuidValue? ? messageId : this.messageId,
      message: message is _i3.Message? ? message : this.message?.copyWith(),
      intent: intent ?? this.intent,
      confidence: confidence ?? this.confidence,
      entities: entities is String? ? entities : this.entities,
      userQuery: userQuery is String? ? userQuery : this.userQuery,
      botResponse: botResponse is String? ? botResponse : this.botResponse,
      functionName: functionName is String? ? functionName : this.functionName,
      functionInput: functionInput is String?
          ? functionInput
          : this.functionInput,
      functionOutput: functionOutput is String?
          ? functionOutput
          : this.functionOutput,
      executionTime: executionTime is int? ? executionTime : this.executionTime,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage is String? ? errorMessage : this.errorMessage,
      wasHelpful: wasHelpful is bool? ? wasHelpful : this.wasHelpful,
      userFeedback: userFeedback is String? ? userFeedback : this.userFeedback,
      feedbackAt: feedbackAt is DateTime? ? feedbackAt : this.feedbackAt,
      modelUsed: modelUsed is String? ? modelUsed : this.modelUsed,
      promptTokens: promptTokens is int? ? promptTokens : this.promptTokens,
      completionTokens: completionTokens is int?
          ? completionTokens
          : this.completionTokens,
      totalTokens: totalTokens is int? ? totalTokens : this.totalTokens,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
