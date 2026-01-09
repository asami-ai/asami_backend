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
import '../user/user_type.dart' as _i2;
import '../messaging/platfom_type.dart' as _i3;

abstract class QuickReply implements _i1.SerializableModel {
  QuickReply._({
    _i1.UuidValue? id,
    required this.intent,
    required this.userType,
    required this.platform,
    required this.title,
    required this.payload,
    this.description,
    this.iconUrl,
    int? displayOrder,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : id = id ?? _i1.Uuid().v4obj(),
       displayOrder = displayOrder ?? 0,
       isActive = isActive ?? true,
       createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory QuickReply({
    _i1.UuidValue? id,
    required String intent,
    required _i2.UserType userType,
    required _i3.PlatformType platform,
    required String title,
    required String payload,
    String? description,
    String? iconUrl,
    int? displayOrder,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _QuickReplyImpl;

  factory QuickReply.fromJson(Map<String, dynamic> jsonSerialization) {
    return QuickReply(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      intent: jsonSerialization['intent'] as String,
      userType: _i2.UserType.fromJson(
        (jsonSerialization['userType'] as String),
      ),
      platform: _i3.PlatformType.fromJson(
        (jsonSerialization['platform'] as String),
      ),
      title: jsonSerialization['title'] as String,
      payload: jsonSerialization['payload'] as String,
      description: jsonSerialization['description'] as String?,
      iconUrl: jsonSerialization['iconUrl'] as String?,
      displayOrder: jsonSerialization['displayOrder'] as int?,
      isActive: jsonSerialization['isActive'] as bool?,
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

  String intent;

  _i2.UserType userType;

  _i3.PlatformType platform;

  String title;

  String payload;

  String? description;

  String? iconUrl;

  int displayOrder;

  bool isActive;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [QuickReply]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  QuickReply copyWith({
    _i1.UuidValue? id,
    String? intent,
    _i2.UserType? userType,
    _i3.PlatformType? platform,
    String? title,
    String? payload,
    String? description,
    String? iconUrl,
    int? displayOrder,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'QuickReply',
      'id': id.toJson(),
      'intent': intent,
      'userType': userType.toJson(),
      'platform': platform.toJson(),
      'title': title,
      'payload': payload,
      if (description != null) 'description': description,
      if (iconUrl != null) 'iconUrl': iconUrl,
      'displayOrder': displayOrder,
      'isActive': isActive,
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

class _QuickReplyImpl extends QuickReply {
  _QuickReplyImpl({
    _i1.UuidValue? id,
    required String intent,
    required _i2.UserType userType,
    required _i3.PlatformType platform,
    required String title,
    required String payload,
    String? description,
    String? iconUrl,
    int? displayOrder,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         intent: intent,
         userType: userType,
         platform: platform,
         title: title,
         payload: payload,
         description: description,
         iconUrl: iconUrl,
         displayOrder: displayOrder,
         isActive: isActive,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [QuickReply]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  QuickReply copyWith({
    _i1.UuidValue? id,
    String? intent,
    _i2.UserType? userType,
    _i3.PlatformType? platform,
    String? title,
    String? payload,
    Object? description = _Undefined,
    Object? iconUrl = _Undefined,
    int? displayOrder,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return QuickReply(
      id: id ?? this.id,
      intent: intent ?? this.intent,
      userType: userType ?? this.userType,
      platform: platform ?? this.platform,
      title: title ?? this.title,
      payload: payload ?? this.payload,
      description: description is String? ? description : this.description,
      iconUrl: iconUrl is String? ? iconUrl : this.iconUrl,
      displayOrder: displayOrder ?? this.displayOrder,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
