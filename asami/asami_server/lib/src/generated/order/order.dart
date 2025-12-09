/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: unnecessary_null_comparison

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../order/order_status.dart' as _i2;
import '../order/payment_status.dart' as _i3;
import '../user/user.dart' as _i4;
import '../user/vendor_profile.dart' as _i5;
import '../user/address.dart' as _i6;
import '../order/payment_method.dart' as _i7;

abstract class Order
    implements _i1.TableRow<_i1.UuidValue>, _i1.ProtocolSerialization {
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

  static final t = OrderTable();

  static const db = OrderRepository._();

  @override
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

  @override
  _i1.Table<_i1.UuidValue> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'id': id.toJson(),
      'customerId': customerId.toJson(),
      if (customer != null) 'customer': customer?.toJsonForProtocol(),
      'vendorId': vendorId.toJson(),
      if (vendor != null) 'vendor': vendor?.toJsonForProtocol(),
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
      if (shippingAddress != null)
        'shippingAddress': shippingAddress?.toJsonForProtocol(),
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

  static OrderInclude include({
    _i4.UserInclude? customer,
    _i5.VendorProfileInclude? vendor,
    _i6.AddressInclude? shippingAddress,
  }) {
    return OrderInclude._(
      customer: customer,
      vendor: vendor,
      shippingAddress: shippingAddress,
    );
  }

  static OrderIncludeList includeList({
    _i1.WhereExpressionBuilder<OrderTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<OrderTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<OrderTable>? orderByList,
    OrderInclude? include,
  }) {
    return OrderIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Order.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Order.t),
      include: include,
    );
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

class OrderTable extends _i1.Table<_i1.UuidValue> {
  OrderTable({super.tableRelation}) : super(tableName: 'orders') {
    customerId = _i1.ColumnUuid(
      'customerId',
      this,
    );
    vendorId = _i1.ColumnUuid(
      'vendorId',
      this,
    );
    orderNumber = _i1.ColumnString(
      'orderNumber',
      this,
    );
    status = _i1.ColumnEnum(
      'status',
      this,
      _i1.EnumSerialization.byIndex,
      hasDefault: true,
    );
    subtotal = _i1.ColumnDouble(
      'subtotal',
      this,
    );
    taxAmount = _i1.ColumnDouble(
      'taxAmount',
      this,
      hasDefault: true,
    );
    shippingCost = _i1.ColumnDouble(
      'shippingCost',
      this,
      hasDefault: true,
    );
    discountAmount = _i1.ColumnDouble(
      'discountAmount',
      this,
      hasDefault: true,
    );
    platformFee = _i1.ColumnDouble(
      'platformFee',
      this,
      hasDefault: true,
    );
    totalAmount = _i1.ColumnDouble(
      'totalAmount',
      this,
    );
    currency = _i1.ColumnString(
      'currency',
      this,
      hasDefault: true,
    );
    shippingAddressId = _i1.ColumnUuid(
      'shippingAddressId',
      this,
    );
    deliveryInstructions = _i1.ColumnString(
      'deliveryInstructions',
      this,
    );
    estimatedDeliveryDate = _i1.ColumnDateTime(
      'estimatedDeliveryDate',
      this,
    );
    actualDeliveryDate = _i1.ColumnDateTime(
      'actualDeliveryDate',
      this,
    );
    trackingNumber = _i1.ColumnString(
      'trackingNumber',
      this,
    );
    shippingProvider = _i1.ColumnString(
      'shippingProvider',
      this,
    );
    customerName = _i1.ColumnString(
      'customerName',
      this,
    );
    customerPhone = _i1.ColumnString(
      'customerPhone',
      this,
    );
    customerEmail = _i1.ColumnString(
      'customerEmail',
      this,
    );
    paymentMethod = _i1.ColumnEnum(
      'paymentMethod',
      this,
      _i1.EnumSerialization.byIndex,
    );
    paymentStatus = _i1.ColumnEnum(
      'paymentStatus',
      this,
      _i1.EnumSerialization.byIndex,
      hasDefault: true,
    );
    paidAt = _i1.ColumnDateTime(
      'paidAt',
      this,
    );
    customerNotes = _i1.ColumnString(
      'customerNotes',
      this,
    );
    vendorNotes = _i1.ColumnString(
      'vendorNotes',
      this,
    );
    cancellationReason = _i1.ColumnString(
      'cancellationReason',
      this,
    );
    orderSource = _i1.ColumnString(
      'orderSource',
      this,
      hasDefault: true,
    );
    conversationId = _i1.ColumnUuid(
      'conversationId',
      this,
    );
    isGift = _i1.ColumnBool(
      'isGift',
      this,
      hasDefault: true,
    );
    requiresSignature = _i1.ColumnBool(
      'requiresSignature',
      this,
      hasDefault: true,
    );
    isPriority = _i1.ColumnBool(
      'isPriority',
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
    confirmedAt = _i1.ColumnDateTime(
      'confirmedAt',
      this,
    );
    shippedAt = _i1.ColumnDateTime(
      'shippedAt',
      this,
    );
    deliveredAt = _i1.ColumnDateTime(
      'deliveredAt',
      this,
    );
    cancelledAt = _i1.ColumnDateTime(
      'cancelledAt',
      this,
    );
  }

  late final _i1.ColumnUuid customerId;

  _i4.UserTable? _customer;

  late final _i1.ColumnUuid vendorId;

  _i5.VendorProfileTable? _vendor;

  late final _i1.ColumnString orderNumber;

  late final _i1.ColumnEnum<_i2.OrderStatus> status;

  late final _i1.ColumnDouble subtotal;

  late final _i1.ColumnDouble taxAmount;

  late final _i1.ColumnDouble shippingCost;

  late final _i1.ColumnDouble discountAmount;

  late final _i1.ColumnDouble platformFee;

  late final _i1.ColumnDouble totalAmount;

  late final _i1.ColumnString currency;

  late final _i1.ColumnUuid shippingAddressId;

  _i6.AddressTable? _shippingAddress;

  late final _i1.ColumnString deliveryInstructions;

  late final _i1.ColumnDateTime estimatedDeliveryDate;

  late final _i1.ColumnDateTime actualDeliveryDate;

  late final _i1.ColumnString trackingNumber;

  late final _i1.ColumnString shippingProvider;

  late final _i1.ColumnString customerName;

  late final _i1.ColumnString customerPhone;

  late final _i1.ColumnString customerEmail;

  late final _i1.ColumnEnum<_i7.PaymentMethod> paymentMethod;

  late final _i1.ColumnEnum<_i3.PaymentStatus> paymentStatus;

  late final _i1.ColumnDateTime paidAt;

  late final _i1.ColumnString customerNotes;

  late final _i1.ColumnString vendorNotes;

  late final _i1.ColumnString cancellationReason;

  late final _i1.ColumnString orderSource;

  late final _i1.ColumnUuid conversationId;

  late final _i1.ColumnBool isGift;

  late final _i1.ColumnBool requiresSignature;

  late final _i1.ColumnBool isPriority;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  late final _i1.ColumnDateTime confirmedAt;

  late final _i1.ColumnDateTime shippedAt;

  late final _i1.ColumnDateTime deliveredAt;

  late final _i1.ColumnDateTime cancelledAt;

  _i4.UserTable get customer {
    if (_customer != null) return _customer!;
    _customer = _i1.createRelationTable(
      relationFieldName: 'customer',
      field: Order.t.customerId,
      foreignField: _i4.User.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.UserTable(tableRelation: foreignTableRelation),
    );
    return _customer!;
  }

  _i5.VendorProfileTable get vendor {
    if (_vendor != null) return _vendor!;
    _vendor = _i1.createRelationTable(
      relationFieldName: 'vendor',
      field: Order.t.vendorId,
      foreignField: _i5.VendorProfile.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.VendorProfileTable(tableRelation: foreignTableRelation),
    );
    return _vendor!;
  }

  _i6.AddressTable get shippingAddress {
    if (_shippingAddress != null) return _shippingAddress!;
    _shippingAddress = _i1.createRelationTable(
      relationFieldName: 'shippingAddress',
      field: Order.t.shippingAddressId,
      foreignField: _i6.Address.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i6.AddressTable(tableRelation: foreignTableRelation),
    );
    return _shippingAddress!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        customerId,
        vendorId,
        orderNumber,
        status,
        subtotal,
        taxAmount,
        shippingCost,
        discountAmount,
        platformFee,
        totalAmount,
        currency,
        shippingAddressId,
        deliveryInstructions,
        estimatedDeliveryDate,
        actualDeliveryDate,
        trackingNumber,
        shippingProvider,
        customerName,
        customerPhone,
        customerEmail,
        paymentMethod,
        paymentStatus,
        paidAt,
        customerNotes,
        vendorNotes,
        cancellationReason,
        orderSource,
        conversationId,
        isGift,
        requiresSignature,
        isPriority,
        createdAt,
        updatedAt,
        confirmedAt,
        shippedAt,
        deliveredAt,
        cancelledAt,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'customer') {
      return customer;
    }
    if (relationField == 'vendor') {
      return vendor;
    }
    if (relationField == 'shippingAddress') {
      return shippingAddress;
    }
    return null;
  }
}

class OrderInclude extends _i1.IncludeObject {
  OrderInclude._({
    _i4.UserInclude? customer,
    _i5.VendorProfileInclude? vendor,
    _i6.AddressInclude? shippingAddress,
  }) {
    _customer = customer;
    _vendor = vendor;
    _shippingAddress = shippingAddress;
  }

  _i4.UserInclude? _customer;

  _i5.VendorProfileInclude? _vendor;

  _i6.AddressInclude? _shippingAddress;

  @override
  Map<String, _i1.Include?> get includes => {
        'customer': _customer,
        'vendor': _vendor,
        'shippingAddress': _shippingAddress,
      };

  @override
  _i1.Table<_i1.UuidValue> get table => Order.t;
}

class OrderIncludeList extends _i1.IncludeList {
  OrderIncludeList._({
    _i1.WhereExpressionBuilder<OrderTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Order.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue> get table => Order.t;
}

class OrderRepository {
  const OrderRepository._();

  final attachRow = const OrderAttachRowRepository._();

  /// Returns a list of [Order]s matching the given query parameters.
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
  Future<List<Order>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<OrderTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<OrderTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<OrderTable>? orderByList,
    _i1.Transaction? transaction,
    OrderInclude? include,
  }) async {
    return session.db.find<Order>(
      where: where?.call(Order.t),
      orderBy: orderBy?.call(Order.t),
      orderByList: orderByList?.call(Order.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Order] matching the given query parameters.
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
  Future<Order?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<OrderTable>? where,
    int? offset,
    _i1.OrderByBuilder<OrderTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<OrderTable>? orderByList,
    _i1.Transaction? transaction,
    OrderInclude? include,
  }) async {
    return session.db.findFirstRow<Order>(
      where: where?.call(Order.t),
      orderBy: orderBy?.call(Order.t),
      orderByList: orderByList?.call(Order.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Order] by its [id] or null if no such row exists.
  Future<Order?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
    OrderInclude? include,
  }) async {
    return session.db.findById<Order>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Order]s in the list and returns the inserted rows.
  ///
  /// The returned [Order]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Order>> insert(
    _i1.Session session,
    List<Order> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Order>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Order] and returns the inserted row.
  ///
  /// The returned [Order] will have its `id` field set.
  Future<Order> insertRow(
    _i1.Session session,
    Order row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Order>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Order]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Order>> update(
    _i1.Session session,
    List<Order> rows, {
    _i1.ColumnSelections<OrderTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Order>(
      rows,
      columns: columns?.call(Order.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Order]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Order> updateRow(
    _i1.Session session,
    Order row, {
    _i1.ColumnSelections<OrderTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Order>(
      row,
      columns: columns?.call(Order.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Order]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Order>> delete(
    _i1.Session session,
    List<Order> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Order>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Order].
  Future<Order> deleteRow(
    _i1.Session session,
    Order row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Order>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Order>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<OrderTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Order>(
      where: where(Order.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<OrderTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Order>(
      where: where?.call(Order.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class OrderAttachRowRepository {
  const OrderAttachRowRepository._();

  /// Creates a relation between the given [Order] and [User]
  /// by setting the [Order]'s foreign key `customerId` to refer to the [User].
  Future<void> customer(
    _i1.Session session,
    Order order,
    _i4.User customer, {
    _i1.Transaction? transaction,
  }) async {
    if (order.id == null) {
      throw ArgumentError.notNull('order.id');
    }
    if (customer.id == null) {
      throw ArgumentError.notNull('customer.id');
    }

    var $order = order.copyWith(customerId: customer.id);
    await session.db.updateRow<Order>(
      $order,
      columns: [Order.t.customerId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [Order] and [VendorProfile]
  /// by setting the [Order]'s foreign key `vendorId` to refer to the [VendorProfile].
  Future<void> vendor(
    _i1.Session session,
    Order order,
    _i5.VendorProfile vendor, {
    _i1.Transaction? transaction,
  }) async {
    if (order.id == null) {
      throw ArgumentError.notNull('order.id');
    }
    if (vendor.id == null) {
      throw ArgumentError.notNull('vendor.id');
    }

    var $order = order.copyWith(vendorId: vendor.id);
    await session.db.updateRow<Order>(
      $order,
      columns: [Order.t.vendorId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [Order] and [Address]
  /// by setting the [Order]'s foreign key `shippingAddressId` to refer to the [Address].
  Future<void> shippingAddress(
    _i1.Session session,
    Order order,
    _i6.Address shippingAddress, {
    _i1.Transaction? transaction,
  }) async {
    if (order.id == null) {
      throw ArgumentError.notNull('order.id');
    }
    if (shippingAddress.id == null) {
      throw ArgumentError.notNull('shippingAddress.id');
    }

    var $order = order.copyWith(shippingAddressId: shippingAddress.id);
    await session.db.updateRow<Order>(
      $order,
      columns: [Order.t.shippingAddressId],
      transaction: transaction,
    );
  }
}
