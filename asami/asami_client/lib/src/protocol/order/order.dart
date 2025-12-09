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
import '../order/order_status.dart' as _i2;
import '../order/payment_status.dart' as _i3;
import '../user/user.dart' as _i4;
import '../user/vendor_profile.dart' as _i5;
import '../user/address.dart' as _i6;
import '../order/payment_method.dart' as _i7;

abstract class Order implements _i1.SerializableModel {
  Order._({
    _i1.UuidValue? id,
    required this.customerId,
    this.customer,
    required this.vendorId,
    this.vendor,
    required this.orderNumber,
    _i2.OrderStatus? status,
    required this.subtotal,
    double? taxAmount,
    double? shippingCost,
    double? discountAmount,
    double? platformFee,
    required this.totalAmount,
    String? currency,
    required this.shippingAddressId,
    this.shippingAddress,
    this.deliveryInstructions,
    this.estimatedDeliveryDate,
    this.actualDeliveryDate,
    this.trackingNumber,
    this.shippingProvider,
    required this.customerName,
    required this.customerPhone,
    this.customerEmail,
    required this.paymentMethod,
    _i3.PaymentStatus? paymentStatus,
    this.paidAt,
    this.customerNotes,
    this.vendorNotes,
    this.cancellationReason,
    String? orderSource,
    this.conversationId,
    bool? isGift,
    bool? requiresSignature,
    bool? isPriority,
    DateTime? createdAt,
    DateTime? updatedAt,
    this.confirmedAt,
    this.shippedAt,
    this.deliveredAt,
    this.cancelledAt,
  })  : id = id ?? _i1.Uuid().v4obj(),
        status = status ?? _i2.OrderStatus.pending,
        taxAmount = taxAmount ?? 0.0,
        shippingCost = shippingCost ?? 0.0,
        discountAmount = discountAmount ?? 0.0,
        platformFee = platformFee ?? 0.0,
        currency = currency ?? 'USD',
        paymentStatus = paymentStatus ?? _i3.PaymentStatus.pending,
        orderSource = orderSource ?? 'whatsapp',
        isGift = isGift ?? false,
        requiresSignature = requiresSignature ?? false,
        isPriority = isPriority ?? false,
        createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  factory Order({
    _i1.UuidValue? id,
    required _i1.UuidValue customerId,
    _i4.User? customer,
    required _i1.UuidValue vendorId,
    _i5.VendorProfile? vendor,
    required String orderNumber,
    _i2.OrderStatus? status,
    required double subtotal,
    double? taxAmount,
    double? shippingCost,
    double? discountAmount,
    double? platformFee,
    required double totalAmount,
    String? currency,
    required _i1.UuidValue shippingAddressId,
    _i6.Address? shippingAddress,
    String? deliveryInstructions,
    DateTime? estimatedDeliveryDate,
    DateTime? actualDeliveryDate,
    String? trackingNumber,
    String? shippingProvider,
    required String customerName,
    required String customerPhone,
    String? customerEmail,
    required _i7.PaymentMethod paymentMethod,
    _i3.PaymentStatus? paymentStatus,
    DateTime? paidAt,
    String? customerNotes,
    String? vendorNotes,
    String? cancellationReason,
    String? orderSource,
    _i1.UuidValue? conversationId,
    bool? isGift,
    bool? requiresSignature,
    bool? isPriority,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? confirmedAt,
    DateTime? shippedAt,
    DateTime? deliveredAt,
    DateTime? cancelledAt,
  }) = _OrderImpl;

  factory Order.fromJson(Map<String, dynamic> jsonSerialization) {
    return Order(
      id: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      customerId:
          _i1.UuidValueJsonExtension.fromJson(jsonSerialization['customerId']),
      customer: jsonSerialization['customer'] == null
          ? null
          : _i4.User.fromJson(
              (jsonSerialization['customer'] as Map<String, dynamic>)),
      vendorId:
          _i1.UuidValueJsonExtension.fromJson(jsonSerialization['vendorId']),
      vendor: jsonSerialization['vendor'] == null
          ? null
          : _i5.VendorProfile.fromJson(
              (jsonSerialization['vendor'] as Map<String, dynamic>)),
      orderNumber: jsonSerialization['orderNumber'] as String,
      status: _i2.OrderStatus.fromJson((jsonSerialization['status'] as int)),
      subtotal: (jsonSerialization['subtotal'] as num).toDouble(),
      taxAmount: (jsonSerialization['taxAmount'] as num).toDouble(),
      shippingCost: (jsonSerialization['shippingCost'] as num).toDouble(),
      discountAmount: (jsonSerialization['discountAmount'] as num).toDouble(),
      platformFee: (jsonSerialization['platformFee'] as num).toDouble(),
      totalAmount: (jsonSerialization['totalAmount'] as num).toDouble(),
      currency: jsonSerialization['currency'] as String,
      shippingAddressId: _i1.UuidValueJsonExtension.fromJson(
          jsonSerialization['shippingAddressId']),
      shippingAddress: jsonSerialization['shippingAddress'] == null
          ? null
          : _i6.Address.fromJson(
              (jsonSerialization['shippingAddress'] as Map<String, dynamic>)),
      deliveryInstructions:
          jsonSerialization['deliveryInstructions'] as String?,
      estimatedDeliveryDate: jsonSerialization['estimatedDeliveryDate'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['estimatedDeliveryDate']),
      actualDeliveryDate: jsonSerialization['actualDeliveryDate'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['actualDeliveryDate']),
      trackingNumber: jsonSerialization['trackingNumber'] as String?,
      shippingProvider: jsonSerialization['shippingProvider'] as String?,
      customerName: jsonSerialization['customerName'] as String,
      customerPhone: jsonSerialization['customerPhone'] as String,
      customerEmail: jsonSerialization['customerEmail'] as String?,
      paymentMethod: _i7.PaymentMethod.fromJson(
          (jsonSerialization['paymentMethod'] as int)),
      paymentStatus: _i3.PaymentStatus.fromJson(
          (jsonSerialization['paymentStatus'] as int)),
      paidAt: jsonSerialization['paidAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['paidAt']),
      customerNotes: jsonSerialization['customerNotes'] as String?,
      vendorNotes: jsonSerialization['vendorNotes'] as String?,
      cancellationReason: jsonSerialization['cancellationReason'] as String?,
      orderSource: jsonSerialization['orderSource'] as String,
      conversationId: jsonSerialization['conversationId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(
              jsonSerialization['conversationId']),
      isGift: jsonSerialization['isGift'] as bool,
      requiresSignature: jsonSerialization['requiresSignature'] as bool,
      isPriority: jsonSerialization['isPriority'] as bool,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
      confirmedAt: jsonSerialization['confirmedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['confirmedAt']),
      shippedAt: jsonSerialization['shippedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['shippedAt']),
      deliveredAt: jsonSerialization['deliveredAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['deliveredAt']),
      cancelledAt: jsonSerialization['cancelledAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['cancelledAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _i1.UuidValue id;

  _i1.UuidValue customerId;

  _i4.User? customer;

  _i1.UuidValue vendorId;

  _i5.VendorProfile? vendor;

  String orderNumber;

  _i2.OrderStatus status;

  double subtotal;

  double taxAmount;

  double shippingCost;

  double discountAmount;

  double platformFee;

  double totalAmount;

  String currency;

  _i1.UuidValue shippingAddressId;

  _i6.Address? shippingAddress;

  String? deliveryInstructions;

  DateTime? estimatedDeliveryDate;

  DateTime? actualDeliveryDate;

  String? trackingNumber;

  String? shippingProvider;

  String customerName;

  String customerPhone;

  String? customerEmail;

  _i7.PaymentMethod paymentMethod;

  _i3.PaymentStatus paymentStatus;

  DateTime? paidAt;

  String? customerNotes;

  String? vendorNotes;

  String? cancellationReason;

  String orderSource;

  _i1.UuidValue? conversationId;

  bool isGift;

  bool requiresSignature;

  bool isPriority;

  DateTime createdAt;

  DateTime updatedAt;

  DateTime? confirmedAt;

  DateTime? shippedAt;

  DateTime? deliveredAt;

  DateTime? cancelledAt;

  /// Returns a shallow copy of this [Order]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Order copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? customerId,
    _i4.User? customer,
    _i1.UuidValue? vendorId,
    _i5.VendorProfile? vendor,
    String? orderNumber,
    _i2.OrderStatus? status,
    double? subtotal,
    double? taxAmount,
    double? shippingCost,
    double? discountAmount,
    double? platformFee,
    double? totalAmount,
    String? currency,
    _i1.UuidValue? shippingAddressId,
    _i6.Address? shippingAddress,
    String? deliveryInstructions,
    DateTime? estimatedDeliveryDate,
    DateTime? actualDeliveryDate,
    String? trackingNumber,
    String? shippingProvider,
    String? customerName,
    String? customerPhone,
    String? customerEmail,
    _i7.PaymentMethod? paymentMethod,
    _i3.PaymentStatus? paymentStatus,
    DateTime? paidAt,
    String? customerNotes,
    String? vendorNotes,
    String? cancellationReason,
    String? orderSource,
    _i1.UuidValue? conversationId,
    bool? isGift,
    bool? requiresSignature,
    bool? isPriority,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? confirmedAt,
    DateTime? shippedAt,
    DateTime? deliveredAt,
    DateTime? cancelledAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'customerId': customerId.toJson(),
      if (customer != null) 'customer': customer?.toJson(),
      'vendorId': vendorId.toJson(),
      if (vendor != null) 'vendor': vendor?.toJson(),
      'orderNumber': orderNumber,
      'status': status.toJson(),
      'subtotal': subtotal,
      'taxAmount': taxAmount,
      'shippingCost': shippingCost,
      'discountAmount': discountAmount,
      'platformFee': platformFee,
      'totalAmount': totalAmount,
      'currency': currency,
      'shippingAddressId': shippingAddressId.toJson(),
      if (shippingAddress != null) 'shippingAddress': shippingAddress?.toJson(),
      if (deliveryInstructions != null)
        'deliveryInstructions': deliveryInstructions,
      if (estimatedDeliveryDate != null)
        'estimatedDeliveryDate': estimatedDeliveryDate?.toJson(),
      if (actualDeliveryDate != null)
        'actualDeliveryDate': actualDeliveryDate?.toJson(),
      if (trackingNumber != null) 'trackingNumber': trackingNumber,
      if (shippingProvider != null) 'shippingProvider': shippingProvider,
      'customerName': customerName,
      'customerPhone': customerPhone,
      if (customerEmail != null) 'customerEmail': customerEmail,
      'paymentMethod': paymentMethod.toJson(),
      'paymentStatus': paymentStatus.toJson(),
      if (paidAt != null) 'paidAt': paidAt?.toJson(),
      if (customerNotes != null) 'customerNotes': customerNotes,
      if (vendorNotes != null) 'vendorNotes': vendorNotes,
      if (cancellationReason != null) 'cancellationReason': cancellationReason,
      'orderSource': orderSource,
      if (conversationId != null) 'conversationId': conversationId?.toJson(),
      'isGift': isGift,
      'requiresSignature': requiresSignature,
      'isPriority': isPriority,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      if (confirmedAt != null) 'confirmedAt': confirmedAt?.toJson(),
      if (shippedAt != null) 'shippedAt': shippedAt?.toJson(),
      if (deliveredAt != null) 'deliveredAt': deliveredAt?.toJson(),
      if (cancelledAt != null) 'cancelledAt': cancelledAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _OrderImpl extends Order {
  _OrderImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue customerId,
    _i4.User? customer,
    required _i1.UuidValue vendorId,
    _i5.VendorProfile? vendor,
    required String orderNumber,
    _i2.OrderStatus? status,
    required double subtotal,
    double? taxAmount,
    double? shippingCost,
    double? discountAmount,
    double? platformFee,
    required double totalAmount,
    String? currency,
    required _i1.UuidValue shippingAddressId,
    _i6.Address? shippingAddress,
    String? deliveryInstructions,
    DateTime? estimatedDeliveryDate,
    DateTime? actualDeliveryDate,
    String? trackingNumber,
    String? shippingProvider,
    required String customerName,
    required String customerPhone,
    String? customerEmail,
    required _i7.PaymentMethod paymentMethod,
    _i3.PaymentStatus? paymentStatus,
    DateTime? paidAt,
    String? customerNotes,
    String? vendorNotes,
    String? cancellationReason,
    String? orderSource,
    _i1.UuidValue? conversationId,
    bool? isGift,
    bool? requiresSignature,
    bool? isPriority,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? confirmedAt,
    DateTime? shippedAt,
    DateTime? deliveredAt,
    DateTime? cancelledAt,
  }) : super._(
          id: id,
          customerId: customerId,
          customer: customer,
          vendorId: vendorId,
          vendor: vendor,
          orderNumber: orderNumber,
          status: status,
          subtotal: subtotal,
          taxAmount: taxAmount,
          shippingCost: shippingCost,
          discountAmount: discountAmount,
          platformFee: platformFee,
          totalAmount: totalAmount,
          currency: currency,
          shippingAddressId: shippingAddressId,
          shippingAddress: shippingAddress,
          deliveryInstructions: deliveryInstructions,
          estimatedDeliveryDate: estimatedDeliveryDate,
          actualDeliveryDate: actualDeliveryDate,
          trackingNumber: trackingNumber,
          shippingProvider: shippingProvider,
          customerName: customerName,
          customerPhone: customerPhone,
          customerEmail: customerEmail,
          paymentMethod: paymentMethod,
          paymentStatus: paymentStatus,
          paidAt: paidAt,
          customerNotes: customerNotes,
          vendorNotes: vendorNotes,
          cancellationReason: cancellationReason,
          orderSource: orderSource,
          conversationId: conversationId,
          isGift: isGift,
          requiresSignature: requiresSignature,
          isPriority: isPriority,
          createdAt: createdAt,
          updatedAt: updatedAt,
          confirmedAt: confirmedAt,
          shippedAt: shippedAt,
          deliveredAt: deliveredAt,
          cancelledAt: cancelledAt,
        );

  /// Returns a shallow copy of this [Order]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Order copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? customerId,
    Object? customer = _Undefined,
    _i1.UuidValue? vendorId,
    Object? vendor = _Undefined,
    String? orderNumber,
    _i2.OrderStatus? status,
    double? subtotal,
    double? taxAmount,
    double? shippingCost,
    double? discountAmount,
    double? platformFee,
    double? totalAmount,
    String? currency,
    _i1.UuidValue? shippingAddressId,
    Object? shippingAddress = _Undefined,
    Object? deliveryInstructions = _Undefined,
    Object? estimatedDeliveryDate = _Undefined,
    Object? actualDeliveryDate = _Undefined,
    Object? trackingNumber = _Undefined,
    Object? shippingProvider = _Undefined,
    String? customerName,
    String? customerPhone,
    Object? customerEmail = _Undefined,
    _i7.PaymentMethod? paymentMethod,
    _i3.PaymentStatus? paymentStatus,
    Object? paidAt = _Undefined,
    Object? customerNotes = _Undefined,
    Object? vendorNotes = _Undefined,
    Object? cancellationReason = _Undefined,
    String? orderSource,
    Object? conversationId = _Undefined,
    bool? isGift,
    bool? requiresSignature,
    bool? isPriority,
    DateTime? createdAt,
    DateTime? updatedAt,
    Object? confirmedAt = _Undefined,
    Object? shippedAt = _Undefined,
    Object? deliveredAt = _Undefined,
    Object? cancelledAt = _Undefined,
  }) {
    return Order(
      id: id ?? this.id,
      customerId: customerId ?? this.customerId,
      customer: customer is _i4.User? ? customer : this.customer?.copyWith(),
      vendorId: vendorId ?? this.vendorId,
      vendor: vendor is _i5.VendorProfile? ? vendor : this.vendor?.copyWith(),
      orderNumber: orderNumber ?? this.orderNumber,
      status: status ?? this.status,
      subtotal: subtotal ?? this.subtotal,
      taxAmount: taxAmount ?? this.taxAmount,
      shippingCost: shippingCost ?? this.shippingCost,
      discountAmount: discountAmount ?? this.discountAmount,
      platformFee: platformFee ?? this.platformFee,
      totalAmount: totalAmount ?? this.totalAmount,
      currency: currency ?? this.currency,
      shippingAddressId: shippingAddressId ?? this.shippingAddressId,
      shippingAddress: shippingAddress is _i6.Address?
          ? shippingAddress
          : this.shippingAddress?.copyWith(),
      deliveryInstructions: deliveryInstructions is String?
          ? deliveryInstructions
          : this.deliveryInstructions,
      estimatedDeliveryDate: estimatedDeliveryDate is DateTime?
          ? estimatedDeliveryDate
          : this.estimatedDeliveryDate,
      actualDeliveryDate: actualDeliveryDate is DateTime?
          ? actualDeliveryDate
          : this.actualDeliveryDate,
      trackingNumber:
          trackingNumber is String? ? trackingNumber : this.trackingNumber,
      shippingProvider: shippingProvider is String?
          ? shippingProvider
          : this.shippingProvider,
      customerName: customerName ?? this.customerName,
      customerPhone: customerPhone ?? this.customerPhone,
      customerEmail:
          customerEmail is String? ? customerEmail : this.customerEmail,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      paidAt: paidAt is DateTime? ? paidAt : this.paidAt,
      customerNotes:
          customerNotes is String? ? customerNotes : this.customerNotes,
      vendorNotes: vendorNotes is String? ? vendorNotes : this.vendorNotes,
      cancellationReason: cancellationReason is String?
          ? cancellationReason
          : this.cancellationReason,
      orderSource: orderSource ?? this.orderSource,
      conversationId: conversationId is _i1.UuidValue?
          ? conversationId
          : this.conversationId,
      isGift: isGift ?? this.isGift,
      requiresSignature: requiresSignature ?? this.requiresSignature,
      isPriority: isPriority ?? this.isPriority,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      confirmedAt: confirmedAt is DateTime? ? confirmedAt : this.confirmedAt,
      shippedAt: shippedAt is DateTime? ? shippedAt : this.shippedAt,
      deliveredAt: deliveredAt is DateTime? ? deliveredAt : this.deliveredAt,
      cancelledAt: cancelledAt is DateTime? ? cancelledAt : this.cancelledAt,
    );
  }
}
