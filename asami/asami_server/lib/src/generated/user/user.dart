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
import '../user/user_status.dart' as _i2;
import '../user/user_type.dart' as _i3;

abstract class User
    implements _i1.TableRow<_i1.UuidValue>, _i1.ProtocolSerialization {
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
  })  : id = id ?? _i1.Uuid().v4obj(),
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
      userType: _i3.UserType.fromJson((jsonSerialization['userType'] as int)),
      status: _i2.UserStatus.fromJson((jsonSerialization['status'] as int)),
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
              jsonSerialization['emailVerifiedAt']),
      whatsappAuthenticated: jsonSerialization['whatsappAuthenticated'] as bool,
      telegramAuthenticated: jsonSerialization['telegramAuthenticated'] as bool,
      webAuthenticated: jsonSerialization['webAuthenticated'] as bool,
      lastWhatsappLogin: jsonSerialization['lastWhatsappLogin'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastWhatsappLogin']),
      lastTelegramLogin: jsonSerialization['lastTelegramLogin'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastTelegramLogin']),
      lastWebLogin: jsonSerialization['lastWebLogin'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastWebLogin']),
      verificationCode: jsonSerialization['verificationCode'] as String?,
      verificationCodeExpiry:
          jsonSerialization['verificationCodeExpiry'] == null
              ? null
              : _i1.DateTimeJsonExtension.fromJson(
                  jsonSerialization['verificationCodeExpiry']),
      verificationAttempts: jsonSerialization['verificationAttempts'] as int,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
      lastActiveAt: jsonSerialization['lastActiveAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastActiveAt']),
      deletedAt: jsonSerialization['deletedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['deletedAt']),
    );
  }

  static final t = UserTable();

  static const db = UserRepository._();

  @override
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

  @override
  _i1.Table<_i1.UuidValue> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
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

  static UserInclude include() {
    return UserInclude._();
  }

  static UserIncludeList includeList({
    _i1.WhereExpressionBuilder<UserTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserTable>? orderByList,
    UserInclude? include,
  }) {
    return UserIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(User.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(User.t),
      include: include,
    );
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
      profileImageUrl:
          profileImageUrl is String? ? profileImageUrl : this.profileImageUrl,
      language: language ?? this.language,
      timezone: timezone ?? this.timezone,
      city: city is String? ? city : this.city,
      state: state is String? ? state : this.state,
      country: country is String? ? country : this.country,
      emailVerified: emailVerified ?? this.emailVerified,
      emailVerifiedAt:
          emailVerifiedAt is DateTime? ? emailVerifiedAt : this.emailVerifiedAt,
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
      lastWebLogin:
          lastWebLogin is DateTime? ? lastWebLogin : this.lastWebLogin,
      verificationCode: verificationCode is String?
          ? verificationCode
          : this.verificationCode,
      verificationCodeExpiry: verificationCodeExpiry is DateTime?
          ? verificationCodeExpiry
          : this.verificationCodeExpiry,
      verificationAttempts: verificationAttempts ?? this.verificationAttempts,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      lastActiveAt:
          lastActiveAt is DateTime? ? lastActiveAt : this.lastActiveAt,
      deletedAt: deletedAt is DateTime? ? deletedAt : this.deletedAt,
    );
  }
}

class UserTable extends _i1.Table<_i1.UuidValue> {
  UserTable({super.tableRelation}) : super(tableName: 'users') {
    userType = _i1.ColumnEnum(
      'userType',
      this,
      _i1.EnumSerialization.byIndex,
    );
    status = _i1.ColumnEnum(
      'status',
      this,
      _i1.EnumSerialization.byIndex,
      hasDefault: true,
    );
    email = _i1.ColumnString(
      'email',
      this,
    );
    phoneNumber = _i1.ColumnString(
      'phoneNumber',
      this,
    );
    countryCode = _i1.ColumnString(
      'countryCode',
      this,
    );
    isPhoneVerified = _i1.ColumnBool(
      'isPhoneVerified',
      this,
      hasDefault: true,
    );
    whatsappId = _i1.ColumnString(
      'whatsappId',
      this,
    );
    telegramId = _i1.ColumnString(
      'telegramId',
      this,
    );
    firstName = _i1.ColumnString(
      'firstName',
      this,
    );
    lastName = _i1.ColumnString(
      'lastName',
      this,
    );
    profileImageUrl = _i1.ColumnString(
      'profileImageUrl',
      this,
    );
    language = _i1.ColumnString(
      'language',
      this,
      hasDefault: true,
    );
    timezone = _i1.ColumnString(
      'timezone',
      this,
      hasDefault: true,
    );
    city = _i1.ColumnString(
      'city',
      this,
    );
    state = _i1.ColumnString(
      'state',
      this,
    );
    country = _i1.ColumnString(
      'country',
      this,
    );
    emailVerified = _i1.ColumnBool(
      'emailVerified',
      this,
      hasDefault: true,
    );
    emailVerifiedAt = _i1.ColumnDateTime(
      'emailVerifiedAt',
      this,
    );
    whatsappAuthenticated = _i1.ColumnBool(
      'whatsappAuthenticated',
      this,
      hasDefault: true,
    );
    telegramAuthenticated = _i1.ColumnBool(
      'telegramAuthenticated',
      this,
      hasDefault: true,
    );
    webAuthenticated = _i1.ColumnBool(
      'webAuthenticated',
      this,
      hasDefault: true,
    );
    lastWhatsappLogin = _i1.ColumnDateTime(
      'lastWhatsappLogin',
      this,
    );
    lastTelegramLogin = _i1.ColumnDateTime(
      'lastTelegramLogin',
      this,
    );
    lastWebLogin = _i1.ColumnDateTime(
      'lastWebLogin',
      this,
    );
    verificationCode = _i1.ColumnString(
      'verificationCode',
      this,
    );
    verificationCodeExpiry = _i1.ColumnDateTime(
      'verificationCodeExpiry',
      this,
    );
    verificationAttempts = _i1.ColumnInt(
      'verificationAttempts',
      this,
      hasDefault: true,
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
    lastActiveAt = _i1.ColumnDateTime(
      'lastActiveAt',
      this,
    );
    deletedAt = _i1.ColumnDateTime(
      'deletedAt',
      this,
    );
  }

  late final _i1.ColumnEnum<_i3.UserType> userType;

  late final _i1.ColumnEnum<_i2.UserStatus> status;

  late final _i1.ColumnString email;

  late final _i1.ColumnString phoneNumber;

  late final _i1.ColumnString countryCode;

  late final _i1.ColumnBool isPhoneVerified;

  late final _i1.ColumnString whatsappId;

  late final _i1.ColumnString telegramId;

  late final _i1.ColumnString firstName;

  late final _i1.ColumnString lastName;

  late final _i1.ColumnString profileImageUrl;

  late final _i1.ColumnString language;

  late final _i1.ColumnString timezone;

  late final _i1.ColumnString city;

  late final _i1.ColumnString state;

  late final _i1.ColumnString country;

  late final _i1.ColumnBool emailVerified;

  late final _i1.ColumnDateTime emailVerifiedAt;

  late final _i1.ColumnBool whatsappAuthenticated;

  late final _i1.ColumnBool telegramAuthenticated;

  late final _i1.ColumnBool webAuthenticated;

  late final _i1.ColumnDateTime lastWhatsappLogin;

  late final _i1.ColumnDateTime lastTelegramLogin;

  late final _i1.ColumnDateTime lastWebLogin;

  late final _i1.ColumnString verificationCode;

  late final _i1.ColumnDateTime verificationCodeExpiry;

  late final _i1.ColumnInt verificationAttempts;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  late final _i1.ColumnDateTime lastActiveAt;

  late final _i1.ColumnDateTime deletedAt;

  @override
  List<_i1.Column> get columns => [
        id,
        userType,
        status,
        email,
        phoneNumber,
        countryCode,
        isPhoneVerified,
        whatsappId,
        telegramId,
        firstName,
        lastName,
        profileImageUrl,
        language,
        timezone,
        city,
        state,
        country,
        emailVerified,
        emailVerifiedAt,
        whatsappAuthenticated,
        telegramAuthenticated,
        webAuthenticated,
        lastWhatsappLogin,
        lastTelegramLogin,
        lastWebLogin,
        verificationCode,
        verificationCodeExpiry,
        verificationAttempts,
        createdAt,
        updatedAt,
        lastActiveAt,
        deletedAt,
      ];
}

class UserInclude extends _i1.IncludeObject {
  UserInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<_i1.UuidValue> get table => User.t;
}

class UserIncludeList extends _i1.IncludeList {
  UserIncludeList._({
    _i1.WhereExpressionBuilder<UserTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(User.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue> get table => User.t;
}

class UserRepository {
  const UserRepository._();

  /// Returns a list of [User]s matching the given query parameters.
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
  Future<List<User>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<User>(
      where: where?.call(User.t),
      orderBy: orderBy?.call(User.t),
      orderByList: orderByList?.call(User.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [User] matching the given query parameters.
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
  Future<User?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserTable>? where,
    int? offset,
    _i1.OrderByBuilder<UserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<User>(
      where: where?.call(User.t),
      orderBy: orderBy?.call(User.t),
      orderByList: orderByList?.call(User.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [User] by its [id] or null if no such row exists.
  Future<User?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<User>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [User]s in the list and returns the inserted rows.
  ///
  /// The returned [User]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<User>> insert(
    _i1.Session session,
    List<User> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<User>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [User] and returns the inserted row.
  ///
  /// The returned [User] will have its `id` field set.
  Future<User> insertRow(
    _i1.Session session,
    User row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<User>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [User]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<User>> update(
    _i1.Session session,
    List<User> rows, {
    _i1.ColumnSelections<UserTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<User>(
      rows,
      columns: columns?.call(User.t),
      transaction: transaction,
    );
  }

  /// Updates a single [User]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<User> updateRow(
    _i1.Session session,
    User row, {
    _i1.ColumnSelections<UserTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<User>(
      row,
      columns: columns?.call(User.t),
      transaction: transaction,
    );
  }

  /// Deletes all [User]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<User>> delete(
    _i1.Session session,
    List<User> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<User>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [User].
  Future<User> deleteRow(
    _i1.Session session,
    User row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<User>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<User>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<UserTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<User>(
      where: where(User.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<User>(
      where: where?.call(User.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
