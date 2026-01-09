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
import '../user/user.dart' as _i2;
import '../messaging/platfom_type.dart' as _i3;
import 'package:asami_client/src/protocol/protocol.dart' as _i4;

abstract class AuthSession implements _i1.SerializableModel {
  AuthSession._({
    _i1.UuidValue? id,
    required this.userId,
    this.user,
    required this.platform,
    required this.platformUserId,
    bool? isActive,
    DateTime? loginAt,
    this.logoutAt,
    this.expiresAt,
    this.deviceInfo,
    this.ipAddress,
    this.userAgent,
    this.lastActivityAt,
    DateTime? createdAt,
  }) : id = id ?? _i1.Uuid().v4obj(),
       isActive = isActive ?? true,
       loginAt = loginAt ?? DateTime.now(),
       createdAt = createdAt ?? DateTime.now();

  factory AuthSession({
    _i1.UuidValue? id,
    required _i1.UuidValue userId,
    _i2.User? user,
    required _i3.PlatformType platform,
    required String platformUserId,
    bool? isActive,
    DateTime? loginAt,
    DateTime? logoutAt,
    DateTime? expiresAt,
    String? deviceInfo,
    String? ipAddress,
    String? userAgent,
    DateTime? lastActivityAt,
    DateTime? createdAt,
  }) = _AuthSessionImpl;

  factory AuthSession.fromJson(Map<String, dynamic> jsonSerialization) {
    return AuthSession(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      userId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      user: jsonSerialization['user'] == null
          ? null
          : _i4.Protocol().deserialize<_i2.User>(jsonSerialization['user']),
      platform: _i3.PlatformType.fromJson(
        (jsonSerialization['platform'] as String),
      ),
      platformUserId: jsonSerialization['platformUserId'] as String,
      isActive: jsonSerialization['isActive'] as bool?,
      loginAt: jsonSerialization['loginAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['loginAt']),
      logoutAt: jsonSerialization['logoutAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['logoutAt']),
      expiresAt: jsonSerialization['expiresAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['expiresAt']),
      deviceInfo: jsonSerialization['deviceInfo'] as String?,
      ipAddress: jsonSerialization['ipAddress'] as String?,
      userAgent: jsonSerialization['userAgent'] as String?,
      lastActivityAt: jsonSerialization['lastActivityAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastActivityAt'],
            ),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  /// The id of the object.
  _i1.UuidValue id;

  _i1.UuidValue userId;

  _i2.User? user;

  _i3.PlatformType platform;

  String platformUserId;

  bool isActive;

  DateTime loginAt;

  DateTime? logoutAt;

  DateTime? expiresAt;

  String? deviceInfo;

  String? ipAddress;

  String? userAgent;

  DateTime? lastActivityAt;

  DateTime createdAt;

  /// Returns a shallow copy of this [AuthSession]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  AuthSession copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? userId,
    _i2.User? user,
    _i3.PlatformType? platform,
    String? platformUserId,
    bool? isActive,
    DateTime? loginAt,
    DateTime? logoutAt,
    DateTime? expiresAt,
    String? deviceInfo,
    String? ipAddress,
    String? userAgent,
    DateTime? lastActivityAt,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AuthSession',
      'id': id.toJson(),
      'userId': userId.toJson(),
      if (user != null) 'user': user?.toJson(),
      'platform': platform.toJson(),
      'platformUserId': platformUserId,
      'isActive': isActive,
      'loginAt': loginAt.toJson(),
      if (logoutAt != null) 'logoutAt': logoutAt?.toJson(),
      if (expiresAt != null) 'expiresAt': expiresAt?.toJson(),
      if (deviceInfo != null) 'deviceInfo': deviceInfo,
      if (ipAddress != null) 'ipAddress': ipAddress,
      if (userAgent != null) 'userAgent': userAgent,
      if (lastActivityAt != null) 'lastActivityAt': lastActivityAt?.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AuthSessionImpl extends AuthSession {
  _AuthSessionImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue userId,
    _i2.User? user,
    required _i3.PlatformType platform,
    required String platformUserId,
    bool? isActive,
    DateTime? loginAt,
    DateTime? logoutAt,
    DateTime? expiresAt,
    String? deviceInfo,
    String? ipAddress,
    String? userAgent,
    DateTime? lastActivityAt,
    DateTime? createdAt,
  }) : super._(
         id: id,
         userId: userId,
         user: user,
         platform: platform,
         platformUserId: platformUserId,
         isActive: isActive,
         loginAt: loginAt,
         logoutAt: logoutAt,
         expiresAt: expiresAt,
         deviceInfo: deviceInfo,
         ipAddress: ipAddress,
         userAgent: userAgent,
         lastActivityAt: lastActivityAt,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [AuthSession]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  AuthSession copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? userId,
    Object? user = _Undefined,
    _i3.PlatformType? platform,
    String? platformUserId,
    bool? isActive,
    DateTime? loginAt,
    Object? logoutAt = _Undefined,
    Object? expiresAt = _Undefined,
    Object? deviceInfo = _Undefined,
    Object? ipAddress = _Undefined,
    Object? userAgent = _Undefined,
    Object? lastActivityAt = _Undefined,
    DateTime? createdAt,
  }) {
    return AuthSession(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      user: user is _i2.User? ? user : this.user?.copyWith(),
      platform: platform ?? this.platform,
      platformUserId: platformUserId ?? this.platformUserId,
      isActive: isActive ?? this.isActive,
      loginAt: loginAt ?? this.loginAt,
      logoutAt: logoutAt is DateTime? ? logoutAt : this.logoutAt,
      expiresAt: expiresAt is DateTime? ? expiresAt : this.expiresAt,
      deviceInfo: deviceInfo is String? ? deviceInfo : this.deviceInfo,
      ipAddress: ipAddress is String? ? ipAddress : this.ipAddress,
      userAgent: userAgent is String? ? userAgent : this.userAgent,
      lastActivityAt: lastActivityAt is DateTime?
          ? lastActivityAt
          : this.lastActivityAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
