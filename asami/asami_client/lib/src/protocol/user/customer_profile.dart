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

abstract class CustomerProfile implements _i1.SerializableModel {
  CustomerProfile._({
    _i1.UuidValue? id,
    required this.userId,
    this.user,
    this.preferredPaymentMethod,
    this.savedAddresses,
    this.favoriteVendors,
    int? totalOrders,
    double? totalSpent,
    double? averageOrderValue,
    this.lastOrderAt,
    int? wishlistCount,
    int? reviewsGiven,
    double? averageRating,
    this.searchHistory,
    this.viewedProducts,
    this.preferredCategories,
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : id = id ?? _i1.Uuid().v4obj(),
        totalOrders = totalOrders ?? 0,
        totalSpent = totalSpent ?? 0.0,
        averageOrderValue = averageOrderValue ?? 0.0,
        wishlistCount = wishlistCount ?? 0,
        reviewsGiven = reviewsGiven ?? 0,
        averageRating = averageRating ?? 0.0,
        createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  factory CustomerProfile({
    _i1.UuidValue? id,
    required _i1.UuidValue userId,
    _i2.User? user,
    String? preferredPaymentMethod,
    List<String>? savedAddresses,
    List<String>? favoriteVendors,
    int? totalOrders,
    double? totalSpent,
    double? averageOrderValue,
    DateTime? lastOrderAt,
    int? wishlistCount,
    int? reviewsGiven,
    double? averageRating,
    List<String>? searchHistory,
    List<String>? viewedProducts,
    List<String>? preferredCategories,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _CustomerProfileImpl;

  factory CustomerProfile.fromJson(Map<String, dynamic> jsonSerialization) {
    return CustomerProfile(
      id: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      userId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      user: jsonSerialization['user'] == null
          ? null
          : _i2.User.fromJson(
              (jsonSerialization['user'] as Map<String, dynamic>)),
      preferredPaymentMethod:
          jsonSerialization['preferredPaymentMethod'] as String?,
      savedAddresses: (jsonSerialization['savedAddresses'] as List?)
          ?.map((e) => e as String)
          .toList(),
      favoriteVendors: (jsonSerialization['favoriteVendors'] as List?)
          ?.map((e) => e as String)
          .toList(),
      totalOrders: jsonSerialization['totalOrders'] as int,
      totalSpent: (jsonSerialization['totalSpent'] as num).toDouble(),
      averageOrderValue:
          (jsonSerialization['averageOrderValue'] as num).toDouble(),
      lastOrderAt: jsonSerialization['lastOrderAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastOrderAt']),
      wishlistCount: jsonSerialization['wishlistCount'] as int,
      reviewsGiven: jsonSerialization['reviewsGiven'] as int,
      averageRating: (jsonSerialization['averageRating'] as num?)?.toDouble(),
      searchHistory: (jsonSerialization['searchHistory'] as List?)
          ?.map((e) => e as String)
          .toList(),
      viewedProducts: (jsonSerialization['viewedProducts'] as List?)
          ?.map((e) => e as String)
          .toList(),
      preferredCategories: (jsonSerialization['preferredCategories'] as List?)
          ?.map((e) => e as String)
          .toList(),
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _i1.UuidValue id;

  _i1.UuidValue userId;

  _i2.User? user;

  String? preferredPaymentMethod;

  List<String>? savedAddresses;

  List<String>? favoriteVendors;

  int totalOrders;

  double totalSpent;

  double averageOrderValue;

  DateTime? lastOrderAt;

  int wishlistCount;

  int reviewsGiven;

  double? averageRating;

  List<String>? searchHistory;

  List<String>? viewedProducts;

  List<String>? preferredCategories;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [CustomerProfile]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CustomerProfile copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? userId,
    _i2.User? user,
    String? preferredPaymentMethod,
    List<String>? savedAddresses,
    List<String>? favoriteVendors,
    int? totalOrders,
    double? totalSpent,
    double? averageOrderValue,
    DateTime? lastOrderAt,
    int? wishlistCount,
    int? reviewsGiven,
    double? averageRating,
    List<String>? searchHistory,
    List<String>? viewedProducts,
    List<String>? preferredCategories,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'userId': userId.toJson(),
      if (user != null) 'user': user?.toJson(),
      if (preferredPaymentMethod != null)
        'preferredPaymentMethod': preferredPaymentMethod,
      if (savedAddresses != null) 'savedAddresses': savedAddresses?.toJson(),
      if (favoriteVendors != null) 'favoriteVendors': favoriteVendors?.toJson(),
      'totalOrders': totalOrders,
      'totalSpent': totalSpent,
      'averageOrderValue': averageOrderValue,
      if (lastOrderAt != null) 'lastOrderAt': lastOrderAt?.toJson(),
      'wishlistCount': wishlistCount,
      'reviewsGiven': reviewsGiven,
      if (averageRating != null) 'averageRating': averageRating,
      if (searchHistory != null) 'searchHistory': searchHistory?.toJson(),
      if (viewedProducts != null) 'viewedProducts': viewedProducts?.toJson(),
      if (preferredCategories != null)
        'preferredCategories': preferredCategories?.toJson(),
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

class _CustomerProfileImpl extends CustomerProfile {
  _CustomerProfileImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue userId,
    _i2.User? user,
    String? preferredPaymentMethod,
    List<String>? savedAddresses,
    List<String>? favoriteVendors,
    int? totalOrders,
    double? totalSpent,
    double? averageOrderValue,
    DateTime? lastOrderAt,
    int? wishlistCount,
    int? reviewsGiven,
    double? averageRating,
    List<String>? searchHistory,
    List<String>? viewedProducts,
    List<String>? preferredCategories,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
          id: id,
          userId: userId,
          user: user,
          preferredPaymentMethod: preferredPaymentMethod,
          savedAddresses: savedAddresses,
          favoriteVendors: favoriteVendors,
          totalOrders: totalOrders,
          totalSpent: totalSpent,
          averageOrderValue: averageOrderValue,
          lastOrderAt: lastOrderAt,
          wishlistCount: wishlistCount,
          reviewsGiven: reviewsGiven,
          averageRating: averageRating,
          searchHistory: searchHistory,
          viewedProducts: viewedProducts,
          preferredCategories: preferredCategories,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  /// Returns a shallow copy of this [CustomerProfile]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CustomerProfile copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? userId,
    Object? user = _Undefined,
    Object? preferredPaymentMethod = _Undefined,
    Object? savedAddresses = _Undefined,
    Object? favoriteVendors = _Undefined,
    int? totalOrders,
    double? totalSpent,
    double? averageOrderValue,
    Object? lastOrderAt = _Undefined,
    int? wishlistCount,
    int? reviewsGiven,
    Object? averageRating = _Undefined,
    Object? searchHistory = _Undefined,
    Object? viewedProducts = _Undefined,
    Object? preferredCategories = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return CustomerProfile(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      user: user is _i2.User? ? user : this.user?.copyWith(),
      preferredPaymentMethod: preferredPaymentMethod is String?
          ? preferredPaymentMethod
          : this.preferredPaymentMethod,
      savedAddresses: savedAddresses is List<String>?
          ? savedAddresses
          : this.savedAddresses?.map((e0) => e0).toList(),
      favoriteVendors: favoriteVendors is List<String>?
          ? favoriteVendors
          : this.favoriteVendors?.map((e0) => e0).toList(),
      totalOrders: totalOrders ?? this.totalOrders,
      totalSpent: totalSpent ?? this.totalSpent,
      averageOrderValue: averageOrderValue ?? this.averageOrderValue,
      lastOrderAt: lastOrderAt is DateTime? ? lastOrderAt : this.lastOrderAt,
      wishlistCount: wishlistCount ?? this.wishlistCount,
      reviewsGiven: reviewsGiven ?? this.reviewsGiven,
      averageRating:
          averageRating is double? ? averageRating : this.averageRating,
      searchHistory: searchHistory is List<String>?
          ? searchHistory
          : this.searchHistory?.map((e0) => e0).toList(),
      viewedProducts: viewedProducts is List<String>?
          ? viewedProducts
          : this.viewedProducts?.map((e0) => e0).toList(),
      preferredCategories: preferredCategories is List<String>?
          ? preferredCategories
          : this.preferredCategories?.map((e0) => e0).toList(),
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
