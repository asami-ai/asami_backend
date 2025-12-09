/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import '../messaging/platfom_type.dart' as _i2;

abstract class TemplateMessage implements _i1.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
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
