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
import '../user/user.dart' as _i2;
import '../messaging/platfom_type.dart' as _i3;

abstract class Notification implements _i1.SerializableModel {
  Notification._({
    _i1.UuidValue? id,
    required this.userId,
    this.user,
    required this.title,
    required this.message,
    required this.type,
    this.platform,
    this.actionUrl,
    this.actionData,
    bool? isSent,
    bool? isDelivered,
    bool? isRead,
    bool? isFailed,
    this.errorMessage,
    int? priority,
    this.scheduledFor,
    DateTime? createdAt,
    this.sentAt,
    this.deliveredAt,
    this.readAt,
  })  : id = id ?? _i1.Uuid().v4obj(),
        isSent = isSent ?? false,
        isDelivered = isDelivered ?? false,
        isRead = isRead ?? false,
        isFailed = isFailed ?? false,
        priority = priority ?? 0,
        createdAt = createdAt ?? DateTime.now();

  factory Notification({
    _i1.UuidValue? id,
    required _i1.UuidValue userId,
    _i2.User? user,
    required String title,
    required String message,
    required String type,
    _i3.PlatformType? platform,
    String? actionUrl,
    String? actionData,
    bool? isSent,
    bool? isDelivered,
    bool? isRead,
    bool? isFailed,
    String? errorMessage,
    int? priority,
    DateTime? scheduledFor,
    DateTime? createdAt,
    DateTime? sentAt,
    DateTime? deliveredAt,
    DateTime? readAt,
  }) = _NotificationImpl;

  factory Notification.fromJson(Map<String, dynamic> jsonSerialization) {
    return Notification(
      id: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      userId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      user: jsonSerialization['user'] == null
          ? null
          : _i2.User.fromJson(
              (jsonSerialization['user'] as Map<String, dynamic>)),
      title: jsonSerialization['title'] as String,
      message: jsonSerialization['message'] as String,
      type: jsonSerialization['type'] as String,
      platform: jsonSerialization['platform'] == null
          ? null
          : _i3.PlatformType.fromJson((jsonSerialization['platform'] as int)),
      actionUrl: jsonSerialization['actionUrl'] as String?,
      actionData: jsonSerialization['actionData'] as String?,
      isSent: jsonSerialization['isSent'] as bool,
      isDelivered: jsonSerialization['isDelivered'] as bool,
      isRead: jsonSerialization['isRead'] as bool,
      isFailed: jsonSerialization['isFailed'] as bool,
      errorMessage: jsonSerialization['errorMessage'] as String?,
      priority: jsonSerialization['priority'] as int,
      scheduledFor: jsonSerialization['scheduledFor'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['scheduledFor']),
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      sentAt: jsonSerialization['sentAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['sentAt']),
      deliveredAt: jsonSerialization['deliveredAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['deliveredAt']),
      readAt: jsonSerialization['readAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['readAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _i1.UuidValue id;

  _i1.UuidValue userId;

  _i2.User? user;

  String title;

  String message;

  String type;

  _i3.PlatformType? platform;

  String? actionUrl;

  String? actionData;

  bool isSent;

  bool isDelivered;

  bool isRead;

  bool isFailed;

  String? errorMessage;

  int priority;

  DateTime? scheduledFor;

  DateTime createdAt;

  DateTime? sentAt;

  DateTime? deliveredAt;

  DateTime? readAt;

  /// Returns a shallow copy of this [Notification]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Notification copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? userId,
    _i2.User? user,
    String? title,
    String? message,
    String? type,
    _i3.PlatformType? platform,
    String? actionUrl,
    String? actionData,
    bool? isSent,
    bool? isDelivered,
    bool? isRead,
    bool? isFailed,
    String? errorMessage,
    int? priority,
    DateTime? scheduledFor,
    DateTime? createdAt,
    DateTime? sentAt,
    DateTime? deliveredAt,
    DateTime? readAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'userId': userId.toJson(),
      if (user != null) 'user': user?.toJson(),
      'title': title,
      'message': message,
      'type': type,
      if (platform != null) 'platform': platform?.toJson(),
      if (actionUrl != null) 'actionUrl': actionUrl,
      if (actionData != null) 'actionData': actionData,
      'isSent': isSent,
      'isDelivered': isDelivered,
      'isRead': isRead,
      'isFailed': isFailed,
      if (errorMessage != null) 'errorMessage': errorMessage,
      'priority': priority,
      if (scheduledFor != null) 'scheduledFor': scheduledFor?.toJson(),
      'createdAt': createdAt.toJson(),
      if (sentAt != null) 'sentAt': sentAt?.toJson(),
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

class _NotificationImpl extends Notification {
  _NotificationImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue userId,
    _i2.User? user,
    required String title,
    required String message,
    required String type,
    _i3.PlatformType? platform,
    String? actionUrl,
    String? actionData,
    bool? isSent,
    bool? isDelivered,
    bool? isRead,
    bool? isFailed,
    String? errorMessage,
    int? priority,
    DateTime? scheduledFor,
    DateTime? createdAt,
    DateTime? sentAt,
    DateTime? deliveredAt,
    DateTime? readAt,
  }) : super._(
          id: id,
          userId: userId,
          user: user,
          title: title,
          message: message,
          type: type,
          platform: platform,
          actionUrl: actionUrl,
          actionData: actionData,
          isSent: isSent,
          isDelivered: isDelivered,
          isRead: isRead,
          isFailed: isFailed,
          errorMessage: errorMessage,
          priority: priority,
          scheduledFor: scheduledFor,
          createdAt: createdAt,
          sentAt: sentAt,
          deliveredAt: deliveredAt,
          readAt: readAt,
        );

  /// Returns a shallow copy of this [Notification]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Notification copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? userId,
    Object? user = _Undefined,
    String? title,
    String? message,
    String? type,
    Object? platform = _Undefined,
    Object? actionUrl = _Undefined,
    Object? actionData = _Undefined,
    bool? isSent,
    bool? isDelivered,
    bool? isRead,
    bool? isFailed,
    Object? errorMessage = _Undefined,
    int? priority,
    Object? scheduledFor = _Undefined,
    DateTime? createdAt,
    Object? sentAt = _Undefined,
    Object? deliveredAt = _Undefined,
    Object? readAt = _Undefined,
  }) {
    return Notification(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      user: user is _i2.User? ? user : this.user?.copyWith(),
      title: title ?? this.title,
      message: message ?? this.message,
      type: type ?? this.type,
      platform: platform is _i3.PlatformType? ? platform : this.platform,
      actionUrl: actionUrl is String? ? actionUrl : this.actionUrl,
      actionData: actionData is String? ? actionData : this.actionData,
      isSent: isSent ?? this.isSent,
      isDelivered: isDelivered ?? this.isDelivered,
      isRead: isRead ?? this.isRead,
      isFailed: isFailed ?? this.isFailed,
      errorMessage: errorMessage is String? ? errorMessage : this.errorMessage,
      priority: priority ?? this.priority,
      scheduledFor:
          scheduledFor is DateTime? ? scheduledFor : this.scheduledFor,
      createdAt: createdAt ?? this.createdAt,
      sentAt: sentAt is DateTime? ? sentAt : this.sentAt,
      deliveredAt: deliveredAt is DateTime? ? deliveredAt : this.deliveredAt,
      readAt: readAt is DateTime? ? readAt : this.readAt,
    );
  }
}
