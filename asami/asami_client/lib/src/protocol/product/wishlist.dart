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

abstract class Wishlist implements _i1.SerializableModel {
  Wishlist._({
    _i1.UuidValue? id,
    required this.customerId,
    this.customer,
    String? name,
    this.description,
    bool? isPublic,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : id = id ?? _i1.Uuid().v4obj(),
       name = name ?? 'My Wishlist',
       isPublic = isPublic ?? false,
       createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory Wishlist({
    _i1.UuidValue? id,
    required _i1.UuidValue customerId,
    _i2.User? customer,
    String? name,
    String? description,
    bool? isPublic,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _WishlistImpl;

  factory Wishlist.fromJson(Map<String, dynamic> jsonSerialization) {
    return Wishlist(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      customerId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['customerId'],
      ),
      customer: jsonSerialization['customer'] == null
          ? null
          : _i3.Protocol().deserialize<_i2.User>(jsonSerialization['customer']),
      name: jsonSerialization['name'] as String?,
      description: jsonSerialization['description'] as String?,
      isPublic: jsonSerialization['isPublic'] as bool?,
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

  _i1.UuidValue customerId;

  _i2.User? customer;

  String name;

  String? description;

  bool isPublic;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [Wishlist]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Wishlist copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? customerId,
    _i2.User? customer,
    String? name,
    String? description,
    bool? isPublic,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Wishlist',
      'id': id.toJson(),
      'customerId': customerId.toJson(),
      if (customer != null) 'customer': customer?.toJson(),
      'name': name,
      if (description != null) 'description': description,
      'isPublic': isPublic,
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

class _WishlistImpl extends Wishlist {
  _WishlistImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue customerId,
    _i2.User? customer,
    String? name,
    String? description,
    bool? isPublic,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         customerId: customerId,
         customer: customer,
         name: name,
         description: description,
         isPublic: isPublic,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [Wishlist]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Wishlist copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? customerId,
    Object? customer = _Undefined,
    String? name,
    Object? description = _Undefined,
    bool? isPublic,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Wishlist(
      id: id ?? this.id,
      customerId: customerId ?? this.customerId,
      customer: customer is _i2.User? ? customer : this.customer?.copyWith(),
      name: name ?? this.name,
      description: description is String? ? description : this.description,
      isPublic: isPublic ?? this.isPublic,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
