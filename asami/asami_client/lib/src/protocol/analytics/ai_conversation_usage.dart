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

abstract class AIConversationUsage implements _i1.SerializableModel {
  AIConversationUsage._({
    _i1.UuidValue? id,
    required this.userId,
    required this.conversationId,
    int? messageCount,
    int? totalTokens,
    int? inputTokens,
    int? outputTokens,
    int? toolCallsInConversation,
    this.uniqueToolsUsed,
    double? estimatedCost,
    double? averageResponseTime,
    this.userSatisfactionRating,
    required this.date,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : id = id ?? _i1.Uuid().v4obj(),
       messageCount = messageCount ?? 0,
       totalTokens = totalTokens ?? 0,
       inputTokens = inputTokens ?? 0,
       outputTokens = outputTokens ?? 0,
       toolCallsInConversation = toolCallsInConversation ?? 0,
       estimatedCost = estimatedCost ?? 0.0,
       averageResponseTime = averageResponseTime ?? 0.0,
       createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory AIConversationUsage({
    _i1.UuidValue? id,
    required _i1.UuidValue userId,
    required _i1.UuidValue conversationId,
    int? messageCount,
    int? totalTokens,
    int? inputTokens,
    int? outputTokens,
    int? toolCallsInConversation,
    String? uniqueToolsUsed,
    double? estimatedCost,
    double? averageResponseTime,
    double? userSatisfactionRating,
    required DateTime date,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _AIConversationUsageImpl;

  factory AIConversationUsage.fromJson(Map<String, dynamic> jsonSerialization) {
    return AIConversationUsage(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      userId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      conversationId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['conversationId'],
      ),
      messageCount: jsonSerialization['messageCount'] as int?,
      totalTokens: jsonSerialization['totalTokens'] as int?,
      inputTokens: jsonSerialization['inputTokens'] as int?,
      outputTokens: jsonSerialization['outputTokens'] as int?,
      toolCallsInConversation:
          jsonSerialization['toolCallsInConversation'] as int?,
      uniqueToolsUsed: jsonSerialization['uniqueToolsUsed'] as String?,
      estimatedCost: (jsonSerialization['estimatedCost'] as num?)?.toDouble(),
      averageResponseTime: (jsonSerialization['averageResponseTime'] as num?)
          ?.toDouble(),
      userSatisfactionRating:
          (jsonSerialization['userSatisfactionRating'] as num?)?.toDouble(),
      date: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['date']),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  /// The id of the object.
  _i1.UuidValue id;

  _i1.UuidValue userId;

  _i1.UuidValue conversationId;

  int messageCount;

  int totalTokens;

  int inputTokens;

  int outputTokens;

  int toolCallsInConversation;

  String? uniqueToolsUsed;

  double estimatedCost;

  double averageResponseTime;

  double? userSatisfactionRating;

  DateTime date;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [AIConversationUsage]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  AIConversationUsage copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? userId,
    _i1.UuidValue? conversationId,
    int? messageCount,
    int? totalTokens,
    int? inputTokens,
    int? outputTokens,
    int? toolCallsInConversation,
    String? uniqueToolsUsed,
    double? estimatedCost,
    double? averageResponseTime,
    double? userSatisfactionRating,
    DateTime? date,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AIConversationUsage',
      'id': id.toJson(),
      'userId': userId.toJson(),
      'conversationId': conversationId.toJson(),
      'messageCount': messageCount,
      'totalTokens': totalTokens,
      'inputTokens': inputTokens,
      'outputTokens': outputTokens,
      'toolCallsInConversation': toolCallsInConversation,
      if (uniqueToolsUsed != null) 'uniqueToolsUsed': uniqueToolsUsed,
      'estimatedCost': estimatedCost,
      'averageResponseTime': averageResponseTime,
      if (userSatisfactionRating != null)
        'userSatisfactionRating': userSatisfactionRating,
      'date': date.toJson(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AIConversationUsageImpl extends AIConversationUsage {
  _AIConversationUsageImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue userId,
    required _i1.UuidValue conversationId,
    int? messageCount,
    int? totalTokens,
    int? inputTokens,
    int? outputTokens,
    int? toolCallsInConversation,
    String? uniqueToolsUsed,
    double? estimatedCost,
    double? averageResponseTime,
    double? userSatisfactionRating,
    required DateTime date,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         userId: userId,
         conversationId: conversationId,
         messageCount: messageCount,
         totalTokens: totalTokens,
         inputTokens: inputTokens,
         outputTokens: outputTokens,
         toolCallsInConversation: toolCallsInConversation,
         uniqueToolsUsed: uniqueToolsUsed,
         estimatedCost: estimatedCost,
         averageResponseTime: averageResponseTime,
         userSatisfactionRating: userSatisfactionRating,
         date: date,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [AIConversationUsage]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  AIConversationUsage copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? userId,
    _i1.UuidValue? conversationId,
    int? messageCount,
    int? totalTokens,
    int? inputTokens,
    int? outputTokens,
    int? toolCallsInConversation,
    Object? uniqueToolsUsed = _Undefined,
    double? estimatedCost,
    double? averageResponseTime,
    Object? userSatisfactionRating = _Undefined,
    DateTime? date,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return AIConversationUsage(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      conversationId: conversationId ?? this.conversationId,
      messageCount: messageCount ?? this.messageCount,
      totalTokens: totalTokens ?? this.totalTokens,
      inputTokens: inputTokens ?? this.inputTokens,
      outputTokens: outputTokens ?? this.outputTokens,
      toolCallsInConversation:
          toolCallsInConversation ?? this.toolCallsInConversation,
      uniqueToolsUsed: uniqueToolsUsed is String?
          ? uniqueToolsUsed
          : this.uniqueToolsUsed,
      estimatedCost: estimatedCost ?? this.estimatedCost,
      averageResponseTime: averageResponseTime ?? this.averageResponseTime,
      userSatisfactionRating: userSatisfactionRating is double?
          ? userSatisfactionRating
          : this.userSatisfactionRating,
      date: date ?? this.date,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
