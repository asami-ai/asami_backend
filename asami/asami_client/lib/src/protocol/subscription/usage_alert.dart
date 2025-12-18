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
import '../user/user_type.dart' as _i2;
import '../subscription/alert_type.dart' as _i3;
import '../subscription/limit_type.dart' as _i4;

abstract class UsageAlert implements _i1.SerializableModel {
  UsageAlert._({
    _i1.UuidValue? id,
    required this.userId,
    required this.userType,
    required this.alertType,
    required this.limitType,
    required this.thresholdPercentage,
    required this.currentUsage,
    required this.limitValue,
    required this.title,
    required this.message,
    bool? actionRequired,
    this.actionUrl,
    bool? isRead,
    bool? isDismissed,
    this.deliveryMethod,
    this.sentAt,
    DateTime? createdAt,
  })  : id = id ?? _i1.Uuid().v4obj(),
        actionRequired = actionRequired ?? false,
        isRead = isRead ?? false,
        isDismissed = isDismissed ?? false,
        createdAt = createdAt ?? DateTime.now();

  factory UsageAlert({
    _i1.UuidValue? id,
    required _i1.UuidValue userId,
    required _i2.UserType userType,
    required _i3.AlertType alertType,
    required _i4.LimitType limitType,
    required int thresholdPercentage,
    required int currentUsage,
    required int limitValue,
    required String title,
    required String message,
    bool? actionRequired,
    String? actionUrl,
    bool? isRead,
    bool? isDismissed,
    String? deliveryMethod,
    DateTime? sentAt,
    DateTime? createdAt,
  }) = _UsageAlertImpl;

  factory UsageAlert.fromJson(Map<String, dynamic> jsonSerialization) {
    return UsageAlert(
      id: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      userId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      userType: _i2.UserType.fromJson((jsonSerialization['userType'] as int)),
      alertType:
          _i3.AlertType.fromJson((jsonSerialization['alertType'] as int)),
      limitType:
          _i4.LimitType.fromJson((jsonSerialization['limitType'] as int)),
      thresholdPercentage: jsonSerialization['thresholdPercentage'] as int,
      currentUsage: jsonSerialization['currentUsage'] as int,
      limitValue: jsonSerialization['limitValue'] as int,
      title: jsonSerialization['title'] as String,
      message: jsonSerialization['message'] as String,
      actionRequired: jsonSerialization['actionRequired'] as bool,
      actionUrl: jsonSerialization['actionUrl'] as String?,
      isRead: jsonSerialization['isRead'] as bool,
      isDismissed: jsonSerialization['isDismissed'] as bool,
      deliveryMethod: jsonSerialization['deliveryMethod'] as String?,
      sentAt: jsonSerialization['sentAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['sentAt']),
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _i1.UuidValue id;

  _i1.UuidValue userId;

  _i2.UserType userType;

  _i3.AlertType alertType;

  _i4.LimitType limitType;

  int thresholdPercentage;

  int currentUsage;

  int limitValue;

  String title;

  String message;

  bool actionRequired;

  String? actionUrl;

  bool isRead;

  bool isDismissed;

  String? deliveryMethod;

  DateTime? sentAt;

  DateTime createdAt;

  /// Returns a shallow copy of this [UsageAlert]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UsageAlert copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? userId,
    _i2.UserType? userType,
    _i3.AlertType? alertType,
    _i4.LimitType? limitType,
    int? thresholdPercentage,
    int? currentUsage,
    int? limitValue,
    String? title,
    String? message,
    bool? actionRequired,
    String? actionUrl,
    bool? isRead,
    bool? isDismissed,
    String? deliveryMethod,
    DateTime? sentAt,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'userId': userId.toJson(),
      'userType': userType.toJson(),
      'alertType': alertType.toJson(),
      'limitType': limitType.toJson(),
      'thresholdPercentage': thresholdPercentage,
      'currentUsage': currentUsage,
      'limitValue': limitValue,
      'title': title,
      'message': message,
      'actionRequired': actionRequired,
      if (actionUrl != null) 'actionUrl': actionUrl,
      'isRead': isRead,
      'isDismissed': isDismissed,
      if (deliveryMethod != null) 'deliveryMethod': deliveryMethod,
      if (sentAt != null) 'sentAt': sentAt?.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UsageAlertImpl extends UsageAlert {
  _UsageAlertImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue userId,
    required _i2.UserType userType,
    required _i3.AlertType alertType,
    required _i4.LimitType limitType,
    required int thresholdPercentage,
    required int currentUsage,
    required int limitValue,
    required String title,
    required String message,
    bool? actionRequired,
    String? actionUrl,
    bool? isRead,
    bool? isDismissed,
    String? deliveryMethod,
    DateTime? sentAt,
    DateTime? createdAt,
  }) : super._(
          id: id,
          userId: userId,
          userType: userType,
          alertType: alertType,
          limitType: limitType,
          thresholdPercentage: thresholdPercentage,
          currentUsage: currentUsage,
          limitValue: limitValue,
          title: title,
          message: message,
          actionRequired: actionRequired,
          actionUrl: actionUrl,
          isRead: isRead,
          isDismissed: isDismissed,
          deliveryMethod: deliveryMethod,
          sentAt: sentAt,
          createdAt: createdAt,
        );

  /// Returns a shallow copy of this [UsageAlert]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UsageAlert copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? userId,
    _i2.UserType? userType,
    _i3.AlertType? alertType,
    _i4.LimitType? limitType,
    int? thresholdPercentage,
    int? currentUsage,
    int? limitValue,
    String? title,
    String? message,
    bool? actionRequired,
    Object? actionUrl = _Undefined,
    bool? isRead,
    bool? isDismissed,
    Object? deliveryMethod = _Undefined,
    Object? sentAt = _Undefined,
    DateTime? createdAt,
  }) {
    return UsageAlert(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      userType: userType ?? this.userType,
      alertType: alertType ?? this.alertType,
      limitType: limitType ?? this.limitType,
      thresholdPercentage: thresholdPercentage ?? this.thresholdPercentage,
      currentUsage: currentUsage ?? this.currentUsage,
      limitValue: limitValue ?? this.limitValue,
      title: title ?? this.title,
      message: message ?? this.message,
      actionRequired: actionRequired ?? this.actionRequired,
      actionUrl: actionUrl is String? ? actionUrl : this.actionUrl,
      isRead: isRead ?? this.isRead,
      isDismissed: isDismissed ?? this.isDismissed,
      deliveryMethod:
          deliveryMethod is String? ? deliveryMethod : this.deliveryMethod,
      sentAt: sentAt is DateTime? ? sentAt : this.sentAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
