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
import '../messaging/platfom_type.dart' as _i2;

abstract class TemplateMessage
    implements _i1.TableRow<_i1.UuidValue>, _i1.ProtocolSerialization {
  TemplateMessage._({
    _i1.UuidValue? id,
    required this.name,
    required this.category,
    String? language,
    this.header,
    required this.body,
    this.footer,
    this.variables,
    this.sampleValues,
    required this.platform,
    this.platformTemplateId,
    bool? isApproved,
    bool? isActive,
    int? usageCount,
    this.lastUsedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : id = id ?? _i1.Uuid().v4obj(),
        language = language ?? 'en',
        isApproved = isApproved ?? false,
        isActive = isActive ?? true,
        usageCount = usageCount ?? 0,
        createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  factory TemplateMessage({
    _i1.UuidValue? id,
    required String name,
    required String category,
    String? language,
    String? header,
    required String body,
    String? footer,
    List<String>? variables,
    String? sampleValues,
    required _i2.PlatformType platform,
    String? platformTemplateId,
    bool? isApproved,
    bool? isActive,
    int? usageCount,
    DateTime? lastUsedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _TemplateMessageImpl;

  factory TemplateMessage.fromJson(Map<String, dynamic> jsonSerialization) {
    return TemplateMessage(
      id: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      name: jsonSerialization['name'] as String,
      category: jsonSerialization['category'] as String,
      language: jsonSerialization['language'] as String,
      header: jsonSerialization['header'] as String?,
      body: jsonSerialization['body'] as String,
      footer: jsonSerialization['footer'] as String?,
      variables: (jsonSerialization['variables'] as List?)
          ?.map((e) => e as String)
          .toList(),
      sampleValues: jsonSerialization['sampleValues'] as String?,
      platform:
          _i2.PlatformType.fromJson((jsonSerialization['platform'] as int)),
      platformTemplateId: jsonSerialization['platformTemplateId'] as String?,
      isApproved: jsonSerialization['isApproved'] as bool,
      isActive: jsonSerialization['isActive'] as bool,
      usageCount: jsonSerialization['usageCount'] as int,
      lastUsedAt: jsonSerialization['lastUsedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['lastUsedAt']),
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  static final t = TemplateMessageTable();

  static const db = TemplateMessageRepository._();

  @override
  _i1.UuidValue id;

  String name;

  String category;

  String language;

  String? header;

  String body;

  String? footer;

  List<String>? variables;

  String? sampleValues;

  _i2.PlatformType platform;

  String? platformTemplateId;

  bool isApproved;

  bool isActive;

  int usageCount;

  DateTime? lastUsedAt;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _i1.Table<_i1.UuidValue> get table => t;

  /// Returns a shallow copy of this [TemplateMessage]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  TemplateMessage copyWith({
    _i1.UuidValue? id,
    String? name,
    String? category,
    String? language,
    String? header,
    String? body,
    String? footer,
    List<String>? variables,
    String? sampleValues,
    _i2.PlatformType? platform,
    String? platformTemplateId,
    bool? isApproved,
    bool? isActive,
    int? usageCount,
    DateTime? lastUsedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'name': name,
      'category': category,
      'language': language,
      if (header != null) 'header': header,
      'body': body,
      if (footer != null) 'footer': footer,
      if (variables != null) 'variables': variables?.toJson(),
      if (sampleValues != null) 'sampleValues': sampleValues,
      'platform': platform.toJson(),
      if (platformTemplateId != null) 'platformTemplateId': platformTemplateId,
      'isApproved': isApproved,
      'isActive': isActive,
      'usageCount': usageCount,
      if (lastUsedAt != null) 'lastUsedAt': lastUsedAt?.toJson(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'id': id.toJson(),
      'name': name,
      'category': category,
      'language': language,
      if (header != null) 'header': header,
      'body': body,
      if (footer != null) 'footer': footer,
      if (variables != null) 'variables': variables?.toJson(),
      if (sampleValues != null) 'sampleValues': sampleValues,
      'platform': platform.toJson(),
      if (platformTemplateId != null) 'platformTemplateId': platformTemplateId,
      'isApproved': isApproved,
      'isActive': isActive,
      'usageCount': usageCount,
      if (lastUsedAt != null) 'lastUsedAt': lastUsedAt?.toJson(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static TemplateMessageInclude include() {
    return TemplateMessageInclude._();
  }

  static TemplateMessageIncludeList includeList({
    _i1.WhereExpressionBuilder<TemplateMessageTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TemplateMessageTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TemplateMessageTable>? orderByList,
    TemplateMessageInclude? include,
  }) {
    return TemplateMessageIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(TemplateMessage.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(TemplateMessage.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TemplateMessageImpl extends TemplateMessage {
  _TemplateMessageImpl({
    _i1.UuidValue? id,
    required String name,
    required String category,
    String? language,
    String? header,
    required String body,
    String? footer,
    List<String>? variables,
    String? sampleValues,
    required _i2.PlatformType platform,
    String? platformTemplateId,
    bool? isApproved,
    bool? isActive,
    int? usageCount,
    DateTime? lastUsedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
          id: id,
          name: name,
          category: category,
          language: language,
          header: header,
          body: body,
          footer: footer,
          variables: variables,
          sampleValues: sampleValues,
          platform: platform,
          platformTemplateId: platformTemplateId,
          isApproved: isApproved,
          isActive: isActive,
          usageCount: usageCount,
          lastUsedAt: lastUsedAt,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  /// Returns a shallow copy of this [TemplateMessage]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  TemplateMessage copyWith({
    _i1.UuidValue? id,
    String? name,
    String? category,
    String? language,
    Object? header = _Undefined,
    String? body,
    Object? footer = _Undefined,
    Object? variables = _Undefined,
    Object? sampleValues = _Undefined,
    _i2.PlatformType? platform,
    Object? platformTemplateId = _Undefined,
    bool? isApproved,
    bool? isActive,
    int? usageCount,
    Object? lastUsedAt = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return TemplateMessage(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      language: language ?? this.language,
      header: header is String? ? header : this.header,
      body: body ?? this.body,
      footer: footer is String? ? footer : this.footer,
      variables: variables is List<String>?
          ? variables
          : this.variables?.map((e0) => e0).toList(),
      sampleValues: sampleValues is String? ? sampleValues : this.sampleValues,
      platform: platform ?? this.platform,
      platformTemplateId: platformTemplateId is String?
          ? platformTemplateId
          : this.platformTemplateId,
      isApproved: isApproved ?? this.isApproved,
      isActive: isActive ?? this.isActive,
      usageCount: usageCount ?? this.usageCount,
      lastUsedAt: lastUsedAt is DateTime? ? lastUsedAt : this.lastUsedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class TemplateMessageTable extends _i1.Table<_i1.UuidValue> {
  TemplateMessageTable({super.tableRelation})
      : super(tableName: 'template_messages') {
    name = _i1.ColumnString(
      'name',
      this,
    );
    category = _i1.ColumnString(
      'category',
      this,
    );
    language = _i1.ColumnString(
      'language',
      this,
      hasDefault: true,
    );
    header = _i1.ColumnString(
      'header',
      this,
    );
    body = _i1.ColumnString(
      'body',
      this,
    );
    footer = _i1.ColumnString(
      'footer',
      this,
    );
    variables = _i1.ColumnSerializable(
      'variables',
      this,
    );
    sampleValues = _i1.ColumnString(
      'sampleValues',
      this,
    );
    platform = _i1.ColumnEnum(
      'platform',
      this,
      _i1.EnumSerialization.byIndex,
    );
    platformTemplateId = _i1.ColumnString(
      'platformTemplateId',
      this,
    );
    isApproved = _i1.ColumnBool(
      'isApproved',
      this,
      hasDefault: true,
    );
    isActive = _i1.ColumnBool(
      'isActive',
      this,
      hasDefault: true,
    );
    usageCount = _i1.ColumnInt(
      'usageCount',
      this,
      hasDefault: true,
    );
    lastUsedAt = _i1.ColumnDateTime(
      'lastUsedAt',
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

  late final _i1.ColumnString name;

  late final _i1.ColumnString category;

  late final _i1.ColumnString language;

  late final _i1.ColumnString header;

  late final _i1.ColumnString body;

  late final _i1.ColumnString footer;

  late final _i1.ColumnSerializable variables;

  late final _i1.ColumnString sampleValues;

  late final _i1.ColumnEnum<_i2.PlatformType> platform;

  late final _i1.ColumnString platformTemplateId;

  late final _i1.ColumnBool isApproved;

  late final _i1.ColumnBool isActive;

  late final _i1.ColumnInt usageCount;

  late final _i1.ColumnDateTime lastUsedAt;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        category,
        language,
        header,
        body,
        footer,
        variables,
        sampleValues,
        platform,
        platformTemplateId,
        isApproved,
        isActive,
        usageCount,
        lastUsedAt,
        createdAt,
        updatedAt,
      ];
}

class TemplateMessageInclude extends _i1.IncludeObject {
  TemplateMessageInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<_i1.UuidValue> get table => TemplateMessage.t;
}

class TemplateMessageIncludeList extends _i1.IncludeList {
  TemplateMessageIncludeList._({
    _i1.WhereExpressionBuilder<TemplateMessageTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(TemplateMessage.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue> get table => TemplateMessage.t;
}

class TemplateMessageRepository {
  const TemplateMessageRepository._();

  /// Returns a list of [TemplateMessage]s matching the given query parameters.
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
  Future<List<TemplateMessage>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TemplateMessageTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TemplateMessageTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TemplateMessageTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<TemplateMessage>(
      where: where?.call(TemplateMessage.t),
      orderBy: orderBy?.call(TemplateMessage.t),
      orderByList: orderByList?.call(TemplateMessage.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [TemplateMessage] matching the given query parameters.
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
  Future<TemplateMessage?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TemplateMessageTable>? where,
    int? offset,
    _i1.OrderByBuilder<TemplateMessageTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TemplateMessageTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<TemplateMessage>(
      where: where?.call(TemplateMessage.t),
      orderBy: orderBy?.call(TemplateMessage.t),
      orderByList: orderByList?.call(TemplateMessage.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [TemplateMessage] by its [id] or null if no such row exists.
  Future<TemplateMessage?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<TemplateMessage>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [TemplateMessage]s in the list and returns the inserted rows.
  ///
  /// The returned [TemplateMessage]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<TemplateMessage>> insert(
    _i1.Session session,
    List<TemplateMessage> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<TemplateMessage>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [TemplateMessage] and returns the inserted row.
  ///
  /// The returned [TemplateMessage] will have its `id` field set.
  Future<TemplateMessage> insertRow(
    _i1.Session session,
    TemplateMessage row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<TemplateMessage>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [TemplateMessage]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<TemplateMessage>> update(
    _i1.Session session,
    List<TemplateMessage> rows, {
    _i1.ColumnSelections<TemplateMessageTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<TemplateMessage>(
      rows,
      columns: columns?.call(TemplateMessage.t),
      transaction: transaction,
    );
  }

  /// Updates a single [TemplateMessage]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<TemplateMessage> updateRow(
    _i1.Session session,
    TemplateMessage row, {
    _i1.ColumnSelections<TemplateMessageTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<TemplateMessage>(
      row,
      columns: columns?.call(TemplateMessage.t),
      transaction: transaction,
    );
  }

  /// Deletes all [TemplateMessage]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<TemplateMessage>> delete(
    _i1.Session session,
    List<TemplateMessage> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<TemplateMessage>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [TemplateMessage].
  Future<TemplateMessage> deleteRow(
    _i1.Session session,
    TemplateMessage row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<TemplateMessage>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<TemplateMessage>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<TemplateMessageTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<TemplateMessage>(
      where: where(TemplateMessage.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TemplateMessageTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<TemplateMessage>(
      where: where?.call(TemplateMessage.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
