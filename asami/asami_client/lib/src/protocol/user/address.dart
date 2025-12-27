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
import 'package:asami_client/src/protocol/protocol.dart' as _i3;

abstract class Address implements _i1.SerializableModel {
  Address._({
    _i1.UuidValue? id,
    required this.userId,
    this.user,
    required this.label,
    required this.recipientName,
    required this.phoneNumber,
    required this.addressLine1,
    this.addressLine2,
    required this.city,
    required this.state,
    required this.country,
    required this.postalCode,
    this.landmark,
    bool? isDefault,
    bool? isActive,
    this.latitude,
    this.longitude,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : id = id ?? _i1.Uuid().v4obj(),
       isDefault = isDefault ?? false,
       isActive = isActive ?? true,
       createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory Address({
    _i1.UuidValue? id,
    required _i1.UuidValue userId,
    _i2.User? user,
    required String label,
    required String recipientName,
    required String phoneNumber,
    required String addressLine1,
    String? addressLine2,
    required String city,
    required String state,
    required String country,
    required String postalCode,
    String? landmark,
    bool? isDefault,
    bool? isActive,
    double? latitude,
    double? longitude,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _AddressImpl;

  factory Address.fromJson(Map<String, dynamic> jsonSerialization) {
    return Address(
      id: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      userId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      user: jsonSerialization['user'] == null
          ? null
          : _i3.Protocol().deserialize<_i2.User>(jsonSerialization['user']),
      label: jsonSerialization['label'] as String,
      recipientName: jsonSerialization['recipientName'] as String,
      phoneNumber: jsonSerialization['phoneNumber'] as String,
      addressLine1: jsonSerialization['addressLine1'] as String,
      addressLine2: jsonSerialization['addressLine2'] as String?,
      city: jsonSerialization['city'] as String,
      state: jsonSerialization['state'] as String,
      country: jsonSerialization['country'] as String,
      postalCode: jsonSerialization['postalCode'] as String,
      landmark: jsonSerialization['landmark'] as String?,
      isDefault: jsonSerialization['isDefault'] as bool,
      isActive: jsonSerialization['isActive'] as bool,
      latitude: (jsonSerialization['latitude'] as num?)?.toDouble(),
      longitude: (jsonSerialization['longitude'] as num?)?.toDouble(),
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
    );
  }

  /// The id of the object.
  _i1.UuidValue id;

  _i1.UuidValue userId;

  _i2.User? user;

  String label;

  String recipientName;

  String phoneNumber;

  String addressLine1;

  String? addressLine2;

  String city;

  String state;

  String country;

  String postalCode;

  String? landmark;

  bool isDefault;

  bool isActive;

  double? latitude;

  double? longitude;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [Address]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Address copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? userId,
    _i2.User? user,
    String? label,
    String? recipientName,
    String? phoneNumber,
    String? addressLine1,
    String? addressLine2,
    String? city,
    String? state,
    String? country,
    String? postalCode,
    String? landmark,
    bool? isDefault,
    bool? isActive,
    double? latitude,
    double? longitude,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Address',
      'id': id.toJson(),
      'userId': userId.toJson(),
      if (user != null) 'user': user?.toJson(),
      'label': label,
      'recipientName': recipientName,
      'phoneNumber': phoneNumber,
      'addressLine1': addressLine1,
      if (addressLine2 != null) 'addressLine2': addressLine2,
      'city': city,
      'state': state,
      'country': country,
      'postalCode': postalCode,
      if (landmark != null) 'landmark': landmark,
      'isDefault': isDefault,
      'isActive': isActive,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
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

class _AddressImpl extends Address {
  _AddressImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue userId,
    _i2.User? user,
    required String label,
    required String recipientName,
    required String phoneNumber,
    required String addressLine1,
    String? addressLine2,
    required String city,
    required String state,
    required String country,
    required String postalCode,
    String? landmark,
    bool? isDefault,
    bool? isActive,
    double? latitude,
    double? longitude,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         userId: userId,
         user: user,
         label: label,
         recipientName: recipientName,
         phoneNumber: phoneNumber,
         addressLine1: addressLine1,
         addressLine2: addressLine2,
         city: city,
         state: state,
         country: country,
         postalCode: postalCode,
         landmark: landmark,
         isDefault: isDefault,
         isActive: isActive,
         latitude: latitude,
         longitude: longitude,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [Address]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Address copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? userId,
    Object? user = _Undefined,
    String? label,
    String? recipientName,
    String? phoneNumber,
    String? addressLine1,
    Object? addressLine2 = _Undefined,
    String? city,
    String? state,
    String? country,
    String? postalCode,
    Object? landmark = _Undefined,
    bool? isDefault,
    bool? isActive,
    Object? latitude = _Undefined,
    Object? longitude = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Address(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      user: user is _i2.User? ? user : this.user?.copyWith(),
      label: label ?? this.label,
      recipientName: recipientName ?? this.recipientName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      addressLine1: addressLine1 ?? this.addressLine1,
      addressLine2: addressLine2 is String? ? addressLine2 : this.addressLine2,
      city: city ?? this.city,
      state: state ?? this.state,
      country: country ?? this.country,
      postalCode: postalCode ?? this.postalCode,
      landmark: landmark is String? ? landmark : this.landmark,
      isDefault: isDefault ?? this.isDefault,
      isActive: isActive ?? this.isActive,
      latitude: latitude is double? ? latitude : this.latitude,
      longitude: longitude is double? ? longitude : this.longitude,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
