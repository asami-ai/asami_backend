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
import '../product/product.dart' as _i2;
import '../user/user.dart' as _i3;
import 'package:asami_client/src/protocol/protocol.dart' as _i4;

abstract class ProductReview implements _i1.SerializableModel {
  ProductReview._({
    _i1.UuidValue? id,
    required this.productId,
    this.product,
    required this.customerId,
    this.customer,
    this.orderId,
    required this.rating,
    this.title,
    required this.comment,
    this.images,
    bool? isVerifiedPurchase,
    bool? isApproved,
    bool? isFlagged,
    this.moderatedBy,
    this.moderatedAt,
    int? helpfulCount,
    int? reportCount,
    this.vendorResponse,
    this.vendorRespondedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : id = id ?? _i1.Uuid().v4obj(),
       isVerifiedPurchase = isVerifiedPurchase ?? false,
       isApproved = isApproved ?? false,
       isFlagged = isFlagged ?? false,
       helpfulCount = helpfulCount ?? 0,
       reportCount = reportCount ?? 0,
       createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory ProductReview({
    _i1.UuidValue? id,
    required _i1.UuidValue productId,
    _i2.Product? product,
    required _i1.UuidValue customerId,
    _i3.User? customer,
    _i1.UuidValue? orderId,
    required int rating,
    String? title,
    required String comment,
    List<String>? images,
    bool? isVerifiedPurchase,
    bool? isApproved,
    bool? isFlagged,
    String? moderatedBy,
    DateTime? moderatedAt,
    int? helpfulCount,
    int? reportCount,
    String? vendorResponse,
    DateTime? vendorRespondedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _ProductReviewImpl;

  factory ProductReview.fromJson(Map<String, dynamic> jsonSerialization) {
    return ProductReview(
      id: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      productId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['productId'],
      ),
      product: jsonSerialization['product'] == null
          ? null
          : _i4.Protocol().deserialize<_i2.Product>(
              jsonSerialization['product'],
            ),
      customerId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['customerId'],
      ),
      customer: jsonSerialization['customer'] == null
          ? null
          : _i4.Protocol().deserialize<_i3.User>(jsonSerialization['customer']),
      orderId: jsonSerialization['orderId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['orderId']),
      rating: jsonSerialization['rating'] as int,
      title: jsonSerialization['title'] as String?,
      comment: jsonSerialization['comment'] as String,
      images: jsonSerialization['images'] == null
          ? null
          : _i4.Protocol().deserialize<List<String>>(
              jsonSerialization['images'],
            ),
      isVerifiedPurchase: jsonSerialization['isVerifiedPurchase'] as bool,
      isApproved: jsonSerialization['isApproved'] as bool,
      isFlagged: jsonSerialization['isFlagged'] as bool,
      moderatedBy: jsonSerialization['moderatedBy'] as String?,
      moderatedAt: jsonSerialization['moderatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['moderatedAt'],
            ),
      helpfulCount: jsonSerialization['helpfulCount'] as int,
      reportCount: jsonSerialization['reportCount'] as int,
      vendorResponse: jsonSerialization['vendorResponse'] as String?,
      vendorRespondedAt: jsonSerialization['vendorRespondedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['vendorRespondedAt'],
            ),
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

  _i1.UuidValue productId;

  _i2.Product? product;

  _i1.UuidValue customerId;

  _i3.User? customer;

  _i1.UuidValue? orderId;

  int rating;

  String? title;

  String comment;

  List<String>? images;

  bool isVerifiedPurchase;

  bool isApproved;

  bool isFlagged;

  String? moderatedBy;

  DateTime? moderatedAt;

  int helpfulCount;

  int reportCount;

  String? vendorResponse;

  DateTime? vendorRespondedAt;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [ProductReview]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ProductReview copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? productId,
    _i2.Product? product,
    _i1.UuidValue? customerId,
    _i3.User? customer,
    _i1.UuidValue? orderId,
    int? rating,
    String? title,
    String? comment,
    List<String>? images,
    bool? isVerifiedPurchase,
    bool? isApproved,
    bool? isFlagged,
    String? moderatedBy,
    DateTime? moderatedAt,
    int? helpfulCount,
    int? reportCount,
    String? vendorResponse,
    DateTime? vendorRespondedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ProductReview',
      'id': id.toJson(),
      'productId': productId.toJson(),
      if (product != null) 'product': product?.toJson(),
      'customerId': customerId.toJson(),
      if (customer != null) 'customer': customer?.toJson(),
      if (orderId != null) 'orderId': orderId?.toJson(),
      'rating': rating,
      if (title != null) 'title': title,
      'comment': comment,
      if (images != null) 'images': images?.toJson(),
      'isVerifiedPurchase': isVerifiedPurchase,
      'isApproved': isApproved,
      'isFlagged': isFlagged,
      if (moderatedBy != null) 'moderatedBy': moderatedBy,
      if (moderatedAt != null) 'moderatedAt': moderatedAt?.toJson(),
      'helpfulCount': helpfulCount,
      'reportCount': reportCount,
      if (vendorResponse != null) 'vendorResponse': vendorResponse,
      if (vendorRespondedAt != null)
        'vendorRespondedAt': vendorRespondedAt?.toJson(),
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

class _ProductReviewImpl extends ProductReview {
  _ProductReviewImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue productId,
    _i2.Product? product,
    required _i1.UuidValue customerId,
    _i3.User? customer,
    _i1.UuidValue? orderId,
    required int rating,
    String? title,
    required String comment,
    List<String>? images,
    bool? isVerifiedPurchase,
    bool? isApproved,
    bool? isFlagged,
    String? moderatedBy,
    DateTime? moderatedAt,
    int? helpfulCount,
    int? reportCount,
    String? vendorResponse,
    DateTime? vendorRespondedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         productId: productId,
         product: product,
         customerId: customerId,
         customer: customer,
         orderId: orderId,
         rating: rating,
         title: title,
         comment: comment,
         images: images,
         isVerifiedPurchase: isVerifiedPurchase,
         isApproved: isApproved,
         isFlagged: isFlagged,
         moderatedBy: moderatedBy,
         moderatedAt: moderatedAt,
         helpfulCount: helpfulCount,
         reportCount: reportCount,
         vendorResponse: vendorResponse,
         vendorRespondedAt: vendorRespondedAt,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [ProductReview]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ProductReview copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? productId,
    Object? product = _Undefined,
    _i1.UuidValue? customerId,
    Object? customer = _Undefined,
    Object? orderId = _Undefined,
    int? rating,
    Object? title = _Undefined,
    String? comment,
    Object? images = _Undefined,
    bool? isVerifiedPurchase,
    bool? isApproved,
    bool? isFlagged,
    Object? moderatedBy = _Undefined,
    Object? moderatedAt = _Undefined,
    int? helpfulCount,
    int? reportCount,
    Object? vendorResponse = _Undefined,
    Object? vendorRespondedAt = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ProductReview(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      product: product is _i2.Product? ? product : this.product?.copyWith(),
      customerId: customerId ?? this.customerId,
      customer: customer is _i3.User? ? customer : this.customer?.copyWith(),
      orderId: orderId is _i1.UuidValue? ? orderId : this.orderId,
      rating: rating ?? this.rating,
      title: title is String? ? title : this.title,
      comment: comment ?? this.comment,
      images: images is List<String>?
          ? images
          : this.images?.map((e0) => e0).toList(),
      isVerifiedPurchase: isVerifiedPurchase ?? this.isVerifiedPurchase,
      isApproved: isApproved ?? this.isApproved,
      isFlagged: isFlagged ?? this.isFlagged,
      moderatedBy: moderatedBy is String? ? moderatedBy : this.moderatedBy,
      moderatedAt: moderatedAt is DateTime? ? moderatedAt : this.moderatedAt,
      helpfulCount: helpfulCount ?? this.helpfulCount,
      reportCount: reportCount ?? this.reportCount,
      vendorResponse: vendorResponse is String?
          ? vendorResponse
          : this.vendorResponse,
      vendorRespondedAt: vendorRespondedAt is DateTime?
          ? vendorRespondedAt
          : this.vendorRespondedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
