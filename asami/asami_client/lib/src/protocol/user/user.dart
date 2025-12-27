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
import '../user/user_status.dart' as _i2;
import '../user/user_type.dart' as _i3;

abstract class User implements _i1.SerializableModel {
  User._({
    _i1.UuidValue? id,
    required this.userType,
    _i2.UserStatus? status,
    this.email,
    required this.phoneNumber,
    required this.countryCode,
    bool? isPhoneVerified,
    this.whatsappId,
    this.telegramId,
    this.firstName,
    this.lastName,
    this.profileImageUrl,
    String? language,
    String? timezone,
    this.city,
    this.state,
    this.country,
    bool? emailVerified,
    this.emailVerifiedAt,
    bool? whatsappAuthenticated,
    bool? telegramAuthenticated,
    bool? webAuthenticated,
    this.lastWhatsappLogin,
    this.lastTelegramLogin,
    this.lastWebLogin,
    this.verificationCode,
    this.verificationCodeExpiry,
    int? verificationAttempts,
    DateTime? createdAt,
    DateTime? updatedAt,
    this.lastActiveAt,
    this.deletedAt,
  }) : id = id ?? _i1.Uuid().v4obj(),
       status = status ?? _i2.UserStatus.active,
       isPhoneVerified = isPhoneVerified ?? false,
       language = language ?? 'en',
       timezone = timezone ?? 'UTC',
       emailVerified = emailVerified ?? false,
       whatsappAuthenticated = whatsappAuthenticated ?? false,
       telegramAuthenticated = telegramAuthenticated ?? false,
       webAuthenticated = webAuthenticated ?? false,
       verificationAttempts = verificationAttempts ?? 0,
       createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory User({
    _i1.UuidValue? id,
    required _i3.UserType userType,
    _i2.UserStatus? status,
    String? email,
    required String phoneNumber,
    required String countryCode,
    bool? isPhoneVerified,
    String? whatsappId,
    String? telegramId,
    String? firstName,
    String? lastName,
    String? profileImageUrl,
    String? language,
    String? timezone,
    String? city,
    String? state,
    String? country,
    bool? emailVerified,
    DateTime? emailVerifiedAt,
    bool? whatsappAuthenticated,
    bool? telegramAuthenticated,
    bool? webAuthenticated,
    DateTime? lastWhatsappLogin,
    DateTime? lastTelegramLogin,
    DateTime? lastWebLogin,
    String? verificationCode,
    DateTime? verificationCodeExpiry,
    int? verificationAttempts,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? lastActiveAt,
    DateTime? deletedAt,
  }) = _UserImpl;

  factory User.fromJson(Map<String, dynamic> jsonSerialization) {
    return User(
      id: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      userType: _i3.UserType.fromJson(
        (jsonSerialization['userType'] as String),
      ),
      status: _i2.UserStatus.fromJson((jsonSerialization['status'] as String)),
      email: jsonSerialization['email'] as String?,
      phoneNumber: jsonSerialization['phoneNumber'] as String,
      countryCode: jsonSerialization['countryCode'] as String,
      isPhoneVerified: jsonSerialization['isPhoneVerified'] as bool,
      whatsappId: jsonSerialization['whatsappId'] as String?,
      telegramId: jsonSerialization['telegramId'] as String?,
      firstName: jsonSerialization['firstName'] as String?,
      lastName: jsonSerialization['lastName'] as String?,
      profileImageUrl: jsonSerialization['profileImageUrl'] as String?,
      language: jsonSerialization['language'] as String,
      timezone: jsonSerialization['timezone'] as String,
      city: jsonSerialization['city'] as String?,
      state: jsonSerialization['state'] as String?,
      country: jsonSerialization['country'] as String?,
      emailVerified: jsonSerialization['emailVerified'] as bool,
      emailVerifiedAt: jsonSerialization['emailVerifiedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['emailVerifiedAt'],
            ),
      whatsappAuthenticated: jsonSerialization['whatsappAuthenticated'] as bool,
      telegramAuthenticated: jsonSerialization['telegramAuthenticated'] as bool,
      webAuthenticated: jsonSerialization['webAuthenticated'] as bool,
      lastWhatsappLogin: jsonSerialization['lastWhatsappLogin'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastWhatsappLogin'],
            ),
      lastTelegramLogin: jsonSerialization['lastTelegramLogin'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastTelegramLogin'],
            ),
      lastWebLogin: jsonSerialization['lastWebLogin'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastWebLogin'],
            ),
      verificationCode: jsonSerialization['verificationCode'] as String?,
      verificationCodeExpiry:
          jsonSerialization['verificationCodeExpiry'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['verificationCodeExpiry'],
            ),
      verificationAttempts: jsonSerialization['verificationAttempts'] as int,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
      lastActiveAt: jsonSerialization['lastActiveAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastActiveAt'],
            ),
      deletedAt: jsonSerialization['deletedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['deletedAt']),
    );
  }

  /// The id of the object.
  _i1.UuidValue id;

  _i3.UserType userType;

  _i2.UserStatus status;

  String? email;

  String phoneNumber;

  String countryCode;

  bool isPhoneVerified;

  String? whatsappId;

  String? telegramId;

  String? firstName;

  String? lastName;

  String? profileImageUrl;

  String language;

  String timezone;

  String? city;

  String? state;

  String? country;

  bool emailVerified;

  DateTime? emailVerifiedAt;

  bool whatsappAuthenticated;

  bool telegramAuthenticated;

  bool webAuthenticated;

  DateTime? lastWhatsappLogin;

  DateTime? lastTelegramLogin;

  DateTime? lastWebLogin;

  String? verificationCode;

  DateTime? verificationCodeExpiry;

  int verificationAttempts;

  DateTime createdAt;

  DateTime updatedAt;

  DateTime? lastActiveAt;

  DateTime? deletedAt;

  /// Returns a shallow copy of this [User]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  User copyWith({
    _i1.UuidValue? id,
    _i3.UserType? userType,
    _i2.UserStatus? status,
    String? email,
    String? phoneNumber,
    String? countryCode,
    bool? isPhoneVerified,
    String? whatsappId,
    String? telegramId,
    String? firstName,
    String? lastName,
    String? profileImageUrl,
    String? language,
    String? timezone,
    String? city,
    String? state,
    String? country,
    bool? emailVerified,
    DateTime? emailVerifiedAt,
    bool? whatsappAuthenticated,
    bool? telegramAuthenticated,
    bool? webAuthenticated,
    DateTime? lastWhatsappLogin,
    DateTime? lastTelegramLogin,
    DateTime? lastWebLogin,
    String? verificationCode,
    DateTime? verificationCodeExpiry,
    int? verificationAttempts,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? lastActiveAt,
    DateTime? deletedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'User',
      'id': id.toJson(),
      'userType': userType.toJson(),
      'status': status.toJson(),
      if (email != null) 'email': email,
      'phoneNumber': phoneNumber,
      'countryCode': countryCode,
      'isPhoneVerified': isPhoneVerified,
      if (whatsappId != null) 'whatsappId': whatsappId,
      if (telegramId != null) 'telegramId': telegramId,
      if (firstName != null) 'firstName': firstName,
      if (lastName != null) 'lastName': lastName,
      if (profileImageUrl != null) 'profileImageUrl': profileImageUrl,
      'language': language,
      'timezone': timezone,
      if (city != null) 'city': city,
      if (state != null) 'state': state,
      if (country != null) 'country': country,
      'emailVerified': emailVerified,
      if (emailVerifiedAt != null) 'emailVerifiedAt': emailVerifiedAt?.toJson(),
      'whatsappAuthenticated': whatsappAuthenticated,
      'telegramAuthenticated': telegramAuthenticated,
      'webAuthenticated': webAuthenticated,
      if (lastWhatsappLogin != null)
        'lastWhatsappLogin': lastWhatsappLogin?.toJson(),
      if (lastTelegramLogin != null)
        'lastTelegramLogin': lastTelegramLogin?.toJson(),
      if (lastWebLogin != null) 'lastWebLogin': lastWebLogin?.toJson(),
      if (verificationCode != null) 'verificationCode': verificationCode,
      if (verificationCodeExpiry != null)
        'verificationCodeExpiry': verificationCodeExpiry?.toJson(),
      'verificationAttempts': verificationAttempts,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      if (lastActiveAt != null) 'lastActiveAt': lastActiveAt?.toJson(),
      if (deletedAt != null) 'deletedAt': deletedAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserImpl extends User {
  _UserImpl({
    _i1.UuidValue? id,
    required _i3.UserType userType,
    _i2.UserStatus? status,
    String? email,
    required String phoneNumber,
    required String countryCode,
    bool? isPhoneVerified,
    String? whatsappId,
    String? telegramId,
    String? firstName,
    String? lastName,
    String? profileImageUrl,
    String? language,
    String? timezone,
    String? city,
    String? state,
    String? country,
    bool? emailVerified,
    DateTime? emailVerifiedAt,
    bool? whatsappAuthenticated,
    bool? telegramAuthenticated,
    bool? webAuthenticated,
    DateTime? lastWhatsappLogin,
    DateTime? lastTelegramLogin,
    DateTime? lastWebLogin,
    String? verificationCode,
    DateTime? verificationCodeExpiry,
    int? verificationAttempts,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? lastActiveAt,
    DateTime? deletedAt,
  }) : super._(
         id: id,
         userType: userType,
         status: status,
         email: email,
         phoneNumber: phoneNumber,
         countryCode: countryCode,
         isPhoneVerified: isPhoneVerified,
         whatsappId: whatsappId,
         telegramId: telegramId,
         firstName: firstName,
         lastName: lastName,
         profileImageUrl: profileImageUrl,
         language: language,
         timezone: timezone,
         city: city,
         state: state,
         country: country,
         emailVerified: emailVerified,
         emailVerifiedAt: emailVerifiedAt,
         whatsappAuthenticated: whatsappAuthenticated,
         telegramAuthenticated: telegramAuthenticated,
         webAuthenticated: webAuthenticated,
         lastWhatsappLogin: lastWhatsappLogin,
         lastTelegramLogin: lastTelegramLogin,
         lastWebLogin: lastWebLogin,
         verificationCode: verificationCode,
         verificationCodeExpiry: verificationCodeExpiry,
         verificationAttempts: verificationAttempts,
         createdAt: createdAt,
         updatedAt: updatedAt,
         lastActiveAt: lastActiveAt,
         deletedAt: deletedAt,
       );

  /// Returns a shallow copy of this [User]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  User copyWith({
    _i1.UuidValue? id,
    _i3.UserType? userType,
    _i2.UserStatus? status,
    Object? email = _Undefined,
    String? phoneNumber,
    String? countryCode,
    bool? isPhoneVerified,
    Object? whatsappId = _Undefined,
    Object? telegramId = _Undefined,
    Object? firstName = _Undefined,
    Object? lastName = _Undefined,
    Object? profileImageUrl = _Undefined,
    String? language,
    String? timezone,
    Object? city = _Undefined,
    Object? state = _Undefined,
    Object? country = _Undefined,
    bool? emailVerified,
    Object? emailVerifiedAt = _Undefined,
    bool? whatsappAuthenticated,
    bool? telegramAuthenticated,
    bool? webAuthenticated,
    Object? lastWhatsappLogin = _Undefined,
    Object? lastTelegramLogin = _Undefined,
    Object? lastWebLogin = _Undefined,
    Object? verificationCode = _Undefined,
    Object? verificationCodeExpiry = _Undefined,
    int? verificationAttempts,
    DateTime? createdAt,
    DateTime? updatedAt,
    Object? lastActiveAt = _Undefined,
    Object? deletedAt = _Undefined,
  }) {
    return User(
      id: id ?? this.id,
      userType: userType ?? this.userType,
      status: status ?? this.status,
      email: email is String? ? email : this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      countryCode: countryCode ?? this.countryCode,
      isPhoneVerified: isPhoneVerified ?? this.isPhoneVerified,
      whatsappId: whatsappId is String? ? whatsappId : this.whatsappId,
      telegramId: telegramId is String? ? telegramId : this.telegramId,
      firstName: firstName is String? ? firstName : this.firstName,
      lastName: lastName is String? ? lastName : this.lastName,
      profileImageUrl: profileImageUrl is String?
          ? profileImageUrl
          : this.profileImageUrl,
      language: language ?? this.language,
      timezone: timezone ?? this.timezone,
      city: city is String? ? city : this.city,
      state: state is String? ? state : this.state,
      country: country is String? ? country : this.country,
      emailVerified: emailVerified ?? this.emailVerified,
      emailVerifiedAt: emailVerifiedAt is DateTime?
          ? emailVerifiedAt
          : this.emailVerifiedAt,
      whatsappAuthenticated:
          whatsappAuthenticated ?? this.whatsappAuthenticated,
      telegramAuthenticated:
          telegramAuthenticated ?? this.telegramAuthenticated,
      webAuthenticated: webAuthenticated ?? this.webAuthenticated,
      lastWhatsappLogin: lastWhatsappLogin is DateTime?
          ? lastWhatsappLogin
          : this.lastWhatsappLogin,
      lastTelegramLogin: lastTelegramLogin is DateTime?
          ? lastTelegramLogin
          : this.lastTelegramLogin,
      lastWebLogin: lastWebLogin is DateTime?
          ? lastWebLogin
          : this.lastWebLogin,
      verificationCode: verificationCode is String?
          ? verificationCode
          : this.verificationCode,
      verificationCodeExpiry: verificationCodeExpiry is DateTime?
          ? verificationCodeExpiry
          : this.verificationCodeExpiry,
      verificationAttempts: verificationAttempts ?? this.verificationAttempts,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      lastActiveAt: lastActiveAt is DateTime?
          ? lastActiveAt
          : this.lastActiveAt,
      deletedAt: deletedAt is DateTime? ? deletedAt : this.deletedAt,
    );
  }
}
