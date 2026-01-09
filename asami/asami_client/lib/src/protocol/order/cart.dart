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

abstract class Cart implements _i1.SerializableModel {
  Cart._({
    _i1.UuidValue? id,
    required this.customerId,
    this.customer,
    this.sessionId,
    bool? isActive,
    int? itemCount,
    double? subtotal,
    this.convertedToOrderId,
    DateTime? createdAt,
    DateTime? updatedAt,
    this.expiresAt,
  }) : id = id ?? _i1.Uuid().v4obj(),
       isActive = isActive ?? true,
       itemCount = itemCount ?? 0,
       subtotal = subtotal ?? 0.0,
       createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory Cart({
    _i1.UuidValue? id,
    required _i1.UuidValue customerId,
    _i2.User? customer,
    String? sessionId,
    bool? isActive,
    int? itemCount,
    double? subtotal,
    String? convertedToOrderId,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? expiresAt,
  }) = _CartImpl;

  factory Cart.fromJson(Map<String, dynamic> jsonSerialization) {
    return Cart(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      customerId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['customerId'],
      ),
      customer: jsonSerialization['customer'] == null
          ? null
          : _i3.Protocol().deserialize<_i2.User>(jsonSerialization['customer']),
      sessionId: jsonSerialization['sessionId'] as String?,
      isActive: jsonSerialization['isActive'] as bool?,
      itemCount: jsonSerialization['itemCount'] as int?,
      subtotal: (jsonSerialization['subtotal'] as num?)?.toDouble(),
      convertedToOrderId: jsonSerialization['convertedToOrderId'] as String?,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
      expiresAt: jsonSerialization['expiresAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['expiresAt']),
    );
  }

  /// The id of the object.
  _i1.UuidValue id;

  _i1.UuidValue customerId;

  _i2.User? customer;

  String? sessionId;

  bool isActive;

  int itemCount;

  double subtotal;

  String? convertedToOrderId;

  DateTime createdAt;

  DateTime updatedAt;

  DateTime? expiresAt;

  /// Returns a shallow copy of this [Cart]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Cart copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? customerId,
    _i2.User? customer,
    String? sessionId,
    bool? isActive,
    int? itemCount,
    double? subtotal,
    String? convertedToOrderId,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? expiresAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Cart',
      'id': id.toJson(),
      'customerId': customerId.toJson(),
      if (customer != null) 'customer': customer?.toJson(),
      if (sessionId != null) 'sessionId': sessionId,
      'isActive': isActive,
      'itemCount': itemCount,
      'subtotal': subtotal,
      if (convertedToOrderId != null) 'convertedToOrderId': convertedToOrderId,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      if (expiresAt != null) 'expiresAt': expiresAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CartImpl extends Cart {
  _CartImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue customerId,
    _i2.User? customer,
    String? sessionId,
    bool? isActive,
    int? itemCount,
    double? subtotal,
    String? convertedToOrderId,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? expiresAt,
  }) : super._(
         id: id,
         customerId: customerId,
         customer: customer,
         sessionId: sessionId,
         isActive: isActive,
         itemCount: itemCount,
         subtotal: subtotal,
         convertedToOrderId: convertedToOrderId,
         createdAt: createdAt,
         updatedAt: updatedAt,
         expiresAt: expiresAt,
       );

  /// Returns a shallow copy of this [Cart]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Cart copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? customerId,
    Object? customer = _Undefined,
    Object? sessionId = _Undefined,
    bool? isActive,
    int? itemCount,
    double? subtotal,
    Object? convertedToOrderId = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
    Object? expiresAt = _Undefined,
  }) {
    return Cart(
      id: id ?? this.id,
      customerId: customerId ?? this.customerId,
      customer: customer is _i2.User? ? customer : this.customer?.copyWith(),
      sessionId: sessionId is String? ? sessionId : this.sessionId,
      isActive: isActive ?? this.isActive,
      itemCount: itemCount ?? this.itemCount,
      subtotal: subtotal ?? this.subtotal,
      convertedToOrderId: convertedToOrderId is String?
          ? convertedToOrderId
          : this.convertedToOrderId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      expiresAt: expiresAt is DateTime? ? expiresAt : this.expiresAt,
    );
  }
}
