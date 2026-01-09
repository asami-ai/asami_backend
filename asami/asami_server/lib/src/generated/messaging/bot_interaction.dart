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
import '../messaging/message.dart' as _i3;
import 'package:asami_server/src/generated/protocol.dart' as _i4;

abstract class BotInteraction
    implements _i1.TableRow<_i1.UuidValue>, _i1.ProtocolSerialization {
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

  static final t = BotInteractionTable();

  static const db = BotInteractionRepository._();

  @override
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

  @override
  _i1.Table<_i1.UuidValue> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'BotInteraction',
      'id': id.toJson(),
      'conversationId': conversationId.toJson(),
      if (conversation != null)
        'conversation': conversation?.toJsonForProtocol(),
      'userId': userId.toJson(),
      if (messageId != null) 'messageId': messageId?.toJson(),
      if (message != null) 'message': message?.toJsonForProtocol(),
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

  static BotInteractionInclude include({
    _i2.ConversationInclude? conversation,
    _i3.MessageInclude? message,
  }) {
    return BotInteractionInclude._(
      conversation: conversation,
      message: message,
    );
  }

  static BotInteractionIncludeList includeList({
    _i1.WhereExpressionBuilder<BotInteractionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BotInteractionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BotInteractionTable>? orderByList,
    BotInteractionInclude? include,
  }) {
    return BotInteractionIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(BotInteraction.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(BotInteraction.t),
      include: include,
    );
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

class BotInteractionUpdateTable extends _i1.UpdateTable<BotInteractionTable> {
  BotInteractionUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> conversationId(
    _i1.UuidValue value,
  ) => _i1.ColumnValue(
    table.conversationId,
    value,
  );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> userId(_i1.UuidValue value) =>
      _i1.ColumnValue(
        table.userId,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> messageId(
    _i1.UuidValue? value,
  ) => _i1.ColumnValue(
    table.messageId,
    value,
  );

  _i1.ColumnValue<String, String> intent(String value) => _i1.ColumnValue(
    table.intent,
    value,
  );

  _i1.ColumnValue<double, double> confidence(double value) => _i1.ColumnValue(
    table.confidence,
    value,
  );

  _i1.ColumnValue<String, String> entities(String? value) => _i1.ColumnValue(
    table.entities,
    value,
  );

  _i1.ColumnValue<String, String> userQuery(String? value) => _i1.ColumnValue(
    table.userQuery,
    value,
  );

  _i1.ColumnValue<String, String> botResponse(String? value) => _i1.ColumnValue(
    table.botResponse,
    value,
  );

  _i1.ColumnValue<String, String> functionName(String? value) =>
      _i1.ColumnValue(
        table.functionName,
        value,
      );

  _i1.ColumnValue<String, String> functionInput(String? value) =>
      _i1.ColumnValue(
        table.functionInput,
        value,
      );

  _i1.ColumnValue<String, String> functionOutput(String? value) =>
      _i1.ColumnValue(
        table.functionOutput,
        value,
      );

  _i1.ColumnValue<int, int> executionTime(int? value) => _i1.ColumnValue(
    table.executionTime,
    value,
  );

  _i1.ColumnValue<bool, bool> isSuccess(bool value) => _i1.ColumnValue(
    table.isSuccess,
    value,
  );

  _i1.ColumnValue<String, String> errorMessage(String? value) =>
      _i1.ColumnValue(
        table.errorMessage,
        value,
      );

  _i1.ColumnValue<bool, bool> wasHelpful(bool? value) => _i1.ColumnValue(
    table.wasHelpful,
    value,
  );

  _i1.ColumnValue<String, String> userFeedback(String? value) =>
      _i1.ColumnValue(
        table.userFeedback,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> feedbackAt(DateTime? value) =>
      _i1.ColumnValue(
        table.feedbackAt,
        value,
      );

  _i1.ColumnValue<String, String> modelUsed(String? value) => _i1.ColumnValue(
    table.modelUsed,
    value,
  );

  _i1.ColumnValue<int, int> promptTokens(int? value) => _i1.ColumnValue(
    table.promptTokens,
    value,
  );

  _i1.ColumnValue<int, int> completionTokens(int? value) => _i1.ColumnValue(
    table.completionTokens,
    value,
  );

  _i1.ColumnValue<int, int> totalTokens(int? value) => _i1.ColumnValue(
    table.totalTokens,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );
}

class BotInteractionTable extends _i1.Table<_i1.UuidValue> {
  BotInteractionTable({super.tableRelation})
    : super(tableName: 'bot_interactions') {
    updateTable = BotInteractionUpdateTable(this);
    conversationId = _i1.ColumnUuid(
      'conversationId',
      this,
    );
    userId = _i1.ColumnUuid(
      'userId',
      this,
    );
    messageId = _i1.ColumnUuid(
      'messageId',
      this,
    );
    intent = _i1.ColumnString(
      'intent',
      this,
    );
    confidence = _i1.ColumnDouble(
      'confidence',
      this,
    );
    entities = _i1.ColumnString(
      'entities',
      this,
    );
    userQuery = _i1.ColumnString(
      'userQuery',
      this,
    );
    botResponse = _i1.ColumnString(
      'botResponse',
      this,
    );
    functionName = _i1.ColumnString(
      'functionName',
      this,
    );
    functionInput = _i1.ColumnString(
      'functionInput',
      this,
    );
    functionOutput = _i1.ColumnString(
      'functionOutput',
      this,
    );
    executionTime = _i1.ColumnInt(
      'executionTime',
      this,
    );
    isSuccess = _i1.ColumnBool(
      'isSuccess',
      this,
      hasDefault: true,
    );
    errorMessage = _i1.ColumnString(
      'errorMessage',
      this,
    );
    wasHelpful = _i1.ColumnBool(
      'wasHelpful',
      this,
    );
    userFeedback = _i1.ColumnString(
      'userFeedback',
      this,
    );
    feedbackAt = _i1.ColumnDateTime(
      'feedbackAt',
      this,
    );
    modelUsed = _i1.ColumnString(
      'modelUsed',
      this,
    );
    promptTokens = _i1.ColumnInt(
      'promptTokens',
      this,
    );
    completionTokens = _i1.ColumnInt(
      'completionTokens',
      this,
    );
    totalTokens = _i1.ColumnInt(
      'totalTokens',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
  }

  late final BotInteractionUpdateTable updateTable;

  late final _i1.ColumnUuid conversationId;

  _i2.ConversationTable? _conversation;

  late final _i1.ColumnUuid userId;

  late final _i1.ColumnUuid messageId;

  _i3.MessageTable? _message;

  late final _i1.ColumnString intent;

  late final _i1.ColumnDouble confidence;

  late final _i1.ColumnString entities;

  late final _i1.ColumnString userQuery;

  late final _i1.ColumnString botResponse;

  late final _i1.ColumnString functionName;

  late final _i1.ColumnString functionInput;

  late final _i1.ColumnString functionOutput;

  late final _i1.ColumnInt executionTime;

  late final _i1.ColumnBool isSuccess;

  late final _i1.ColumnString errorMessage;

  late final _i1.ColumnBool wasHelpful;

  late final _i1.ColumnString userFeedback;

  late final _i1.ColumnDateTime feedbackAt;

  late final _i1.ColumnString modelUsed;

  late final _i1.ColumnInt promptTokens;

  late final _i1.ColumnInt completionTokens;

  late final _i1.ColumnInt totalTokens;

  late final _i1.ColumnDateTime createdAt;

  _i2.ConversationTable get conversation {
    if (_conversation != null) return _conversation!;
    _conversation = _i1.createRelationTable(
      relationFieldName: 'conversation',
      field: BotInteraction.t.conversationId,
      foreignField: _i2.Conversation.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.ConversationTable(tableRelation: foreignTableRelation),
    );
    return _conversation!;
  }

  _i3.MessageTable get message {
    if (_message != null) return _message!;
    _message = _i1.createRelationTable(
      relationFieldName: 'message',
      field: BotInteraction.t.messageId,
      foreignField: _i3.Message.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.MessageTable(tableRelation: foreignTableRelation),
    );
    return _message!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    conversationId,
    userId,
    messageId,
    intent,
    confidence,
    entities,
    userQuery,
    botResponse,
    functionName,
    functionInput,
    functionOutput,
    executionTime,
    isSuccess,
    errorMessage,
    wasHelpful,
    userFeedback,
    feedbackAt,
    modelUsed,
    promptTokens,
    completionTokens,
    totalTokens,
    createdAt,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'conversation') {
      return conversation;
    }
    if (relationField == 'message') {
      return message;
    }
    return null;
  }
}

class BotInteractionInclude extends _i1.IncludeObject {
  BotInteractionInclude._({
    _i2.ConversationInclude? conversation,
    _i3.MessageInclude? message,
  }) {
    _conversation = conversation;
    _message = message;
  }

  _i2.ConversationInclude? _conversation;

  _i3.MessageInclude? _message;

  @override
  Map<String, _i1.Include?> get includes => {
    'conversation': _conversation,
    'message': _message,
  };

  @override
  _i1.Table<_i1.UuidValue> get table => BotInteraction.t;
}

class BotInteractionIncludeList extends _i1.IncludeList {
  BotInteractionIncludeList._({
    _i1.WhereExpressionBuilder<BotInteractionTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(BotInteraction.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue> get table => BotInteraction.t;
}

class BotInteractionRepository {
  const BotInteractionRepository._();

  final attachRow = const BotInteractionAttachRowRepository._();

  final detachRow = const BotInteractionDetachRowRepository._();

  /// Returns a list of [BotInteraction]s matching the given query parameters.
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
  Future<List<BotInteraction>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BotInteractionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BotInteractionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BotInteractionTable>? orderByList,
    _i1.Transaction? transaction,
    BotInteractionInclude? include,
  }) async {
    return session.db.find<BotInteraction>(
      where: where?.call(BotInteraction.t),
      orderBy: orderBy?.call(BotInteraction.t),
      orderByList: orderByList?.call(BotInteraction.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [BotInteraction] matching the given query parameters.
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
  Future<BotInteraction?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BotInteractionTable>? where,
    int? offset,
    _i1.OrderByBuilder<BotInteractionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BotInteractionTable>? orderByList,
    _i1.Transaction? transaction,
    BotInteractionInclude? include,
  }) async {
    return session.db.findFirstRow<BotInteraction>(
      where: where?.call(BotInteraction.t),
      orderBy: orderBy?.call(BotInteraction.t),
      orderByList: orderByList?.call(BotInteraction.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [BotInteraction] by its [id] or null if no such row exists.
  Future<BotInteraction?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
    BotInteractionInclude? include,
  }) async {
    return session.db.findById<BotInteraction>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [BotInteraction]s in the list and returns the inserted rows.
  ///
  /// The returned [BotInteraction]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<BotInteraction>> insert(
    _i1.Session session,
    List<BotInteraction> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<BotInteraction>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [BotInteraction] and returns the inserted row.
  ///
  /// The returned [BotInteraction] will have its `id` field set.
  Future<BotInteraction> insertRow(
    _i1.Session session,
    BotInteraction row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<BotInteraction>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [BotInteraction]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<BotInteraction>> update(
    _i1.Session session,
    List<BotInteraction> rows, {
    _i1.ColumnSelections<BotInteractionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<BotInteraction>(
      rows,
      columns: columns?.call(BotInteraction.t),
      transaction: transaction,
    );
  }

  /// Updates a single [BotInteraction]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<BotInteraction> updateRow(
    _i1.Session session,
    BotInteraction row, {
    _i1.ColumnSelections<BotInteractionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<BotInteraction>(
      row,
      columns: columns?.call(BotInteraction.t),
      transaction: transaction,
    );
  }

  /// Updates a single [BotInteraction] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<BotInteraction?> updateById(
    _i1.Session session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<BotInteractionUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<BotInteraction>(
      id,
      columnValues: columnValues(BotInteraction.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [BotInteraction]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<BotInteraction>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<BotInteractionUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<BotInteractionTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BotInteractionTable>? orderBy,
    _i1.OrderByListBuilder<BotInteractionTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<BotInteraction>(
      columnValues: columnValues(BotInteraction.t.updateTable),
      where: where(BotInteraction.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(BotInteraction.t),
      orderByList: orderByList?.call(BotInteraction.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [BotInteraction]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<BotInteraction>> delete(
    _i1.Session session,
    List<BotInteraction> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<BotInteraction>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [BotInteraction].
  Future<BotInteraction> deleteRow(
    _i1.Session session,
    BotInteraction row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<BotInteraction>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<BotInteraction>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<BotInteractionTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<BotInteraction>(
      where: where(BotInteraction.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BotInteractionTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<BotInteraction>(
      where: where?.call(BotInteraction.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class BotInteractionAttachRowRepository {
  const BotInteractionAttachRowRepository._();

  /// Creates a relation between the given [BotInteraction] and [Conversation]
  /// by setting the [BotInteraction]'s foreign key `conversationId` to refer to the [Conversation].
  Future<void> conversation(
    _i1.Session session,
    BotInteraction botInteraction,
    _i2.Conversation conversation, {
    _i1.Transaction? transaction,
  }) async {
    if (botInteraction.id == null) {
      throw ArgumentError.notNull('botInteraction.id');
    }
    if (conversation.id == null) {
      throw ArgumentError.notNull('conversation.id');
    }

    var $botInteraction = botInteraction.copyWith(
      conversationId: conversation.id,
    );
    await session.db.updateRow<BotInteraction>(
      $botInteraction,
      columns: [BotInteraction.t.conversationId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [BotInteraction] and [Message]
  /// by setting the [BotInteraction]'s foreign key `messageId` to refer to the [Message].
  Future<void> message(
    _i1.Session session,
    BotInteraction botInteraction,
    _i3.Message message, {
    _i1.Transaction? transaction,
  }) async {
    if (botInteraction.id == null) {
      throw ArgumentError.notNull('botInteraction.id');
    }
    if (message.id == null) {
      throw ArgumentError.notNull('message.id');
    }

    var $botInteraction = botInteraction.copyWith(messageId: message.id);
    await session.db.updateRow<BotInteraction>(
      $botInteraction,
      columns: [BotInteraction.t.messageId],
      transaction: transaction,
    );
  }
}

class BotInteractionDetachRowRepository {
  const BotInteractionDetachRowRepository._();

  /// Detaches the relation between this [BotInteraction] and the [Message] set in `message`
  /// by setting the [BotInteraction]'s foreign key `messageId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> message(
    _i1.Session session,
    BotInteraction botInteraction, {
    _i1.Transaction? transaction,
  }) async {
    if (botInteraction.id == null) {
      throw ArgumentError.notNull('botInteraction.id');
    }

    var $botInteraction = botInteraction.copyWith(messageId: null);
    await session.db.updateRow<BotInteraction>(
      $botInteraction,
      columns: [BotInteraction.t.messageId],
      transaction: transaction,
    );
  }
}
