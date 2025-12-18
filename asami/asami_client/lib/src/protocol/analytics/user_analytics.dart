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
import '../product/product.dart' as _i3;
import '../user/vendor_profile.dart' as _i4;
import '../messaging/platfom_type.dart' as _i5;
import '../messaging/conversation.dart' as _i6;

abstract class UserActivity implements _i1.SerializableModel {
  UserActivity._({
    _i1.UuidValue? id,
    required this.userId,
    this.user,
    required this.activityType,
    this.productId,
    this.product,
    this.vendorId,
    this.vendor,
    this.categoryName,
    this.searchQuery,
    required this.platform,
    this.conversationId,
    this.conversation,
    this.latitude,
    this.longitude,
    this.city,
    this.state,
    this.country,
    this.sessionId,
    this.metadata,
    this.durationSeconds,
    DateTime? createdAt,
  })  : id = id ?? _i1.Uuid().v4obj(),
        createdAt = createdAt ?? DateTime.now();

  factory UserActivity({
    _i1.UuidValue? id,
    required _i1.UuidValue userId,
    _i2.User? user,
    required String activityType,
    _i1.UuidValue? productId,
    _i3.Product? product,
    _i1.UuidValue? vendorId,
    _i4.VendorProfile? vendor,
    String? categoryName,
    String? searchQuery,
    required _i5.PlatformType platform,
    _i1.UuidValue? conversationId,
    _i6.Conversation? conversation,
    double? latitude,
    double? longitude,
    String? city,
    String? state,
    String? country,
    String? sessionId,
    String? metadata,
    int? durationSeconds,
    DateTime? createdAt,
  }) = _UserActivityImpl;

  factory UserActivity.fromJson(Map<String, dynamic> jsonSerialization) {
    return UserActivity(
      id: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      userId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      user: jsonSerialization['user'] == null
          ? null
          : _i2.User.fromJson(
              (jsonSerialization['user'] as Map<String, dynamic>)),
      activityType: jsonSerialization['activityType'] as String,
      productId: jsonSerialization['productId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['productId']),
      product: jsonSerialization['product'] == null
          ? null
          : _i3.Product.fromJson(
              (jsonSerialization['product'] as Map<String, dynamic>)),
      vendorId: jsonSerialization['vendorId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['vendorId']),
      vendor: jsonSerialization['vendor'] == null
          ? null
          : _i4.VendorProfile.fromJson(
              (jsonSerialization['vendor'] as Map<String, dynamic>)),
      categoryName: jsonSerialization['categoryName'] as String?,
      searchQuery: jsonSerialization['searchQuery'] as String?,
      platform:
          _i5.PlatformType.fromJson((jsonSerialization['platform'] as int)),
      conversationId: jsonSerialization['conversationId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(
              jsonSerialization['conversationId']),
      conversation: jsonSerialization['conversation'] == null
          ? null
          : _i6.Conversation.fromJson(
              (jsonSerialization['conversation'] as Map<String, dynamic>)),
      latitude: (jsonSerialization['latitude'] as num?)?.toDouble(),
      longitude: (jsonSerialization['longitude'] as num?)?.toDouble(),
      city: jsonSerialization['city'] as String?,
      state: jsonSerialization['state'] as String?,
      country: jsonSerialization['country'] as String?,
      sessionId: jsonSerialization['sessionId'] as String?,
      metadata: jsonSerialization['metadata'] as String?,
      durationSeconds: jsonSerialization['durationSeconds'] as int?,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _i1.UuidValue id;

  _i1.UuidValue userId;

  _i2.User? user;

  String activityType;

  _i1.UuidValue? productId;

  _i3.Product? product;

  _i1.UuidValue? vendorId;

  _i4.VendorProfile? vendor;

  String? categoryName;

  String? searchQuery;

  _i5.PlatformType platform;

  _i1.UuidValue? conversationId;

  _i6.Conversation? conversation;

  double? latitude;

  double? longitude;

  String? city;

  String? state;

  String? country;

  String? sessionId;

  String? metadata;

  int? durationSeconds;

  DateTime createdAt;

  /// Returns a shallow copy of this [UserActivity]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UserActivity copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? userId,
    _i2.User? user,
    String? activityType,
    _i1.UuidValue? productId,
    _i3.Product? product,
    _i1.UuidValue? vendorId,
    _i4.VendorProfile? vendor,
    String? categoryName,
    String? searchQuery,
    _i5.PlatformType? platform,
    _i1.UuidValue? conversationId,
    _i6.Conversation? conversation,
    double? latitude,
    double? longitude,
    String? city,
    String? state,
    String? country,
    String? sessionId,
    String? metadata,
    int? durationSeconds,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'userId': userId.toJson(),
      if (user != null) 'user': user?.toJson(),
      'activityType': activityType,
      if (productId != null) 'productId': productId?.toJson(),
      if (product != null) 'product': product?.toJson(),
      if (vendorId != null) 'vendorId': vendorId?.toJson(),
      if (vendor != null) 'vendor': vendor?.toJson(),
      if (categoryName != null) 'categoryName': categoryName,
      if (searchQuery != null) 'searchQuery': searchQuery,
      'platform': platform.toJson(),
      if (conversationId != null) 'conversationId': conversationId?.toJson(),
      if (conversation != null) 'conversation': conversation?.toJson(),
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (city != null) 'city': city,
      if (state != null) 'state': state,
      if (country != null) 'country': country,
      if (sessionId != null) 'sessionId': sessionId,
      if (metadata != null) 'metadata': metadata,
      if (durationSeconds != null) 'durationSeconds': durationSeconds,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserActivityImpl extends UserActivity {
  _UserActivityImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue userId,
    _i2.User? user,
    required String activityType,
    _i1.UuidValue? productId,
    _i3.Product? product,
    _i1.UuidValue? vendorId,
    _i4.VendorProfile? vendor,
    String? categoryName,
    String? searchQuery,
    required _i5.PlatformType platform,
    _i1.UuidValue? conversationId,
    _i6.Conversation? conversation,
    double? latitude,
    double? longitude,
    String? city,
    String? state,
    String? country,
    String? sessionId,
    String? metadata,
    int? durationSeconds,
    DateTime? createdAt,
  }) : super._(
          id: id,
          userId: userId,
          user: user,
          activityType: activityType,
          productId: productId,
          product: product,
          vendorId: vendorId,
          vendor: vendor,
          categoryName: categoryName,
          searchQuery: searchQuery,
          platform: platform,
          conversationId: conversationId,
          conversation: conversation,
          latitude: latitude,
          longitude: longitude,
          city: city,
          state: state,
          country: country,
          sessionId: sessionId,
          metadata: metadata,
          durationSeconds: durationSeconds,
          createdAt: createdAt,
        );

  /// Returns a shallow copy of this [UserActivity]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UserActivity copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? userId,
    Object? user = _Undefined,
    String? activityType,
    Object? productId = _Undefined,
    Object? product = _Undefined,
    Object? vendorId = _Undefined,
    Object? vendor = _Undefined,
    Object? categoryName = _Undefined,
    Object? searchQuery = _Undefined,
    _i5.PlatformType? platform,
    Object? conversationId = _Undefined,
    Object? conversation = _Undefined,
    Object? latitude = _Undefined,
    Object? longitude = _Undefined,
    Object? city = _Undefined,
    Object? state = _Undefined,
    Object? country = _Undefined,
    Object? sessionId = _Undefined,
    Object? metadata = _Undefined,
    Object? durationSeconds = _Undefined,
    DateTime? createdAt,
  }) {
    return UserActivity(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      user: user is _i2.User? ? user : this.user?.copyWith(),
      activityType: activityType ?? this.activityType,
      productId: productId is _i1.UuidValue? ? productId : this.productId,
      product: product is _i3.Product? ? product : this.product?.copyWith(),
      vendorId: vendorId is _i1.UuidValue? ? vendorId : this.vendorId,
      vendor: vendor is _i4.VendorProfile? ? vendor : this.vendor?.copyWith(),
      categoryName: categoryName is String? ? categoryName : this.categoryName,
      searchQuery: searchQuery is String? ? searchQuery : this.searchQuery,
      platform: platform ?? this.platform,
      conversationId: conversationId is _i1.UuidValue?
          ? conversationId
          : this.conversationId,
      conversation: conversation is _i6.Conversation?
          ? conversation
          : this.conversation?.copyWith(),
      latitude: latitude is double? ? latitude : this.latitude,
      longitude: longitude is double? ? longitude : this.longitude,
      city: city is String? ? city : this.city,
      state: state is String? ? state : this.state,
      country: country is String? ? country : this.country,
      sessionId: sessionId is String? ? sessionId : this.sessionId,
      metadata: metadata is String? ? metadata : this.metadata,
      durationSeconds:
          durationSeconds is int? ? durationSeconds : this.durationSeconds,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
