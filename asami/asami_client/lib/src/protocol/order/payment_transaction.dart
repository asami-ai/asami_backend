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
import '../order/payment_status.dart' as _i2;
import '../user/user.dart' as _i3;
import '../order/order.dart' as _i4;
import '../order/payment_method.dart' as _i5;
import '../messaging/platfom_type.dart' as _i6;
import 'package:asami_client/src/protocol/protocol.dart' as _i7;

abstract class PaymentTransaction implements _i1.SerializableModel {
  PaymentTransaction._({
    _i1.UuidValue? id,
    required this.reference,
    this.transactionId,
    required this.userId,
    this.user,
    this.orderId,
    this.order,
    required this.amount,
    String? currency,
    this.paymentMethod,
    this.channel,
    this.cryptoType,
    this.cryptoAmount,
    this.walletAddress,
    this.transactionHash,
    this.blockchainNetwork,
    this.conversionRate,
    String? gateway,
    this.gatewayReference,
    this.authorizationCode,
    _i2.PaymentStatus? status,
    this.paidAt,
    required this.customerEmail,
    this.customerPhone,
    this.customerName,
    this.authorizationUrl,
    this.accessCode,
    this.metadata,
    required this.platformType,
    this.conversationId,
    required this.expiresAt,
    bool? isExpired,
    this.webhookEvents,
    this.lastWebhookAt,
    double? paystackFee,
    double? platformFee,
    this.netAmount,
    bool? isRefunded,
    this.refundedAt,
    this.refundAmount,
    this.refundReason,
    this.verifiedAt,
    int? verificationAttempts,
    this.ipAddress,
    this.userAgent,
    this.failureReason,
    this.gatewayResponse,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : id = id ?? _i1.Uuid().v4obj(),
       currency = currency ?? 'NGN',
       gateway = gateway ?? 'paystack',
       status = status ?? _i2.PaymentStatus.pending,
       isExpired = isExpired ?? false,
       paystackFee = paystackFee ?? 0.0,
       platformFee = platformFee ?? 0.0,
       isRefunded = isRefunded ?? false,
       verificationAttempts = verificationAttempts ?? 0,
       createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory PaymentTransaction({
    _i1.UuidValue? id,
    required String reference,
    String? transactionId,
    required _i1.UuidValue userId,
    _i3.User? user,
    _i1.UuidValue? orderId,
    _i4.Order? order,
    required double amount,
    String? currency,
    _i5.PaymentMethod? paymentMethod,
    String? channel,
    String? cryptoType,
    double? cryptoAmount,
    String? walletAddress,
    String? transactionHash,
    String? blockchainNetwork,
    double? conversionRate,
    String? gateway,
    String? gatewayReference,
    String? authorizationCode,
    _i2.PaymentStatus? status,
    DateTime? paidAt,
    required String customerEmail,
    String? customerPhone,
    String? customerName,
    String? authorizationUrl,
    String? accessCode,
    String? metadata,
    required _i6.PlatformType platformType,
    _i1.UuidValue? conversationId,
    required DateTime expiresAt,
    bool? isExpired,
    String? webhookEvents,
    DateTime? lastWebhookAt,
    double? paystackFee,
    double? platformFee,
    double? netAmount,
    bool? isRefunded,
    DateTime? refundedAt,
    double? refundAmount,
    String? refundReason,
    DateTime? verifiedAt,
    int? verificationAttempts,
    String? ipAddress,
    String? userAgent,
    String? failureReason,
    String? gatewayResponse,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _PaymentTransactionImpl;

  factory PaymentTransaction.fromJson(Map<String, dynamic> jsonSerialization) {
    return PaymentTransaction(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      reference: jsonSerialization['reference'] as String,
      transactionId: jsonSerialization['transactionId'] as String?,
      userId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      user: jsonSerialization['user'] == null
          ? null
          : _i7.Protocol().deserialize<_i3.User>(jsonSerialization['user']),
      orderId: jsonSerialization['orderId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['orderId']),
      order: jsonSerialization['order'] == null
          ? null
          : _i7.Protocol().deserialize<_i4.Order>(jsonSerialization['order']),
      amount: (jsonSerialization['amount'] as num).toDouble(),
      currency: jsonSerialization['currency'] as String?,
      paymentMethod: jsonSerialization['paymentMethod'] == null
          ? null
          : _i5.PaymentMethod.fromJson(
              (jsonSerialization['paymentMethod'] as String),
            ),
      channel: jsonSerialization['channel'] as String?,
      cryptoType: jsonSerialization['cryptoType'] as String?,
      cryptoAmount: (jsonSerialization['cryptoAmount'] as num?)?.toDouble(),
      walletAddress: jsonSerialization['walletAddress'] as String?,
      transactionHash: jsonSerialization['transactionHash'] as String?,
      blockchainNetwork: jsonSerialization['blockchainNetwork'] as String?,
      conversionRate: (jsonSerialization['conversionRate'] as num?)?.toDouble(),
      gateway: jsonSerialization['gateway'] as String?,
      gatewayReference: jsonSerialization['gatewayReference'] as String?,
      authorizationCode: jsonSerialization['authorizationCode'] as String?,
      status: jsonSerialization['status'] == null
          ? null
          : _i2.PaymentStatus.fromJson((jsonSerialization['status'] as String)),
      paidAt: jsonSerialization['paidAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['paidAt']),
      customerEmail: jsonSerialization['customerEmail'] as String,
      customerPhone: jsonSerialization['customerPhone'] as String?,
      customerName: jsonSerialization['customerName'] as String?,
      authorizationUrl: jsonSerialization['authorizationUrl'] as String?,
      accessCode: jsonSerialization['accessCode'] as String?,
      metadata: jsonSerialization['metadata'] as String?,
      platformType: _i6.PlatformType.fromJson(
        (jsonSerialization['platformType'] as String),
      ),
      conversationId: jsonSerialization['conversationId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(
              jsonSerialization['conversationId'],
            ),
      expiresAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['expiresAt'],
      ),
      isExpired: jsonSerialization['isExpired'] as bool?,
      webhookEvents: jsonSerialization['webhookEvents'] as String?,
      lastWebhookAt: jsonSerialization['lastWebhookAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastWebhookAt'],
            ),
      paystackFee: (jsonSerialization['paystackFee'] as num?)?.toDouble(),
      platformFee: (jsonSerialization['platformFee'] as num?)?.toDouble(),
      netAmount: (jsonSerialization['netAmount'] as num?)?.toDouble(),
      isRefunded: jsonSerialization['isRefunded'] as bool?,
      refundedAt: jsonSerialization['refundedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['refundedAt']),
      refundAmount: (jsonSerialization['refundAmount'] as num?)?.toDouble(),
      refundReason: jsonSerialization['refundReason'] as String?,
      verifiedAt: jsonSerialization['verifiedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['verifiedAt']),
      verificationAttempts: jsonSerialization['verificationAttempts'] as int?,
      ipAddress: jsonSerialization['ipAddress'] as String?,
      userAgent: jsonSerialization['userAgent'] as String?,
      failureReason: jsonSerialization['failureReason'] as String?,
      gatewayResponse: jsonSerialization['gatewayResponse'] as String?,
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

  String reference;

  String? transactionId;

  _i1.UuidValue userId;

  _i3.User? user;

  _i1.UuidValue? orderId;

  _i4.Order? order;

  double amount;

  String currency;

  _i5.PaymentMethod? paymentMethod;

  String? channel;

  String? cryptoType;

  double? cryptoAmount;

  String? walletAddress;

  String? transactionHash;

  String? blockchainNetwork;

  double? conversionRate;

  String gateway;

  String? gatewayReference;

  String? authorizationCode;

  _i2.PaymentStatus status;

  DateTime? paidAt;

  String customerEmail;

  String? customerPhone;

  String? customerName;

  String? authorizationUrl;

  String? accessCode;

  String? metadata;

  _i6.PlatformType platformType;

  _i1.UuidValue? conversationId;

  DateTime expiresAt;

  bool isExpired;

  String? webhookEvents;

  DateTime? lastWebhookAt;

  double paystackFee;

  double platformFee;

  double? netAmount;

  bool isRefunded;

  DateTime? refundedAt;

  double? refundAmount;

  String? refundReason;

  DateTime? verifiedAt;

  int verificationAttempts;

  String? ipAddress;

  String? userAgent;

  String? failureReason;

  String? gatewayResponse;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [PaymentTransaction]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PaymentTransaction copyWith({
    _i1.UuidValue? id,
    String? reference,
    String? transactionId,
    _i1.UuidValue? userId,
    _i3.User? user,
    _i1.UuidValue? orderId,
    _i4.Order? order,
    double? amount,
    String? currency,
    _i5.PaymentMethod? paymentMethod,
    String? channel,
    String? cryptoType,
    double? cryptoAmount,
    String? walletAddress,
    String? transactionHash,
    String? blockchainNetwork,
    double? conversionRate,
    String? gateway,
    String? gatewayReference,
    String? authorizationCode,
    _i2.PaymentStatus? status,
    DateTime? paidAt,
    String? customerEmail,
    String? customerPhone,
    String? customerName,
    String? authorizationUrl,
    String? accessCode,
    String? metadata,
    _i6.PlatformType? platformType,
    _i1.UuidValue? conversationId,
    DateTime? expiresAt,
    bool? isExpired,
    String? webhookEvents,
    DateTime? lastWebhookAt,
    double? paystackFee,
    double? platformFee,
    double? netAmount,
    bool? isRefunded,
    DateTime? refundedAt,
    double? refundAmount,
    String? refundReason,
    DateTime? verifiedAt,
    int? verificationAttempts,
    String? ipAddress,
    String? userAgent,
    String? failureReason,
    String? gatewayResponse,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'PaymentTransaction',
      'id': id.toJson(),
      'reference': reference,
      if (transactionId != null) 'transactionId': transactionId,
      'userId': userId.toJson(),
      if (user != null) 'user': user?.toJson(),
      if (orderId != null) 'orderId': orderId?.toJson(),
      if (order != null) 'order': order?.toJson(),
      'amount': amount,
      'currency': currency,
      if (paymentMethod != null) 'paymentMethod': paymentMethod?.toJson(),
      if (channel != null) 'channel': channel,
      if (cryptoType != null) 'cryptoType': cryptoType,
      if (cryptoAmount != null) 'cryptoAmount': cryptoAmount,
      if (walletAddress != null) 'walletAddress': walletAddress,
      if (transactionHash != null) 'transactionHash': transactionHash,
      if (blockchainNetwork != null) 'blockchainNetwork': blockchainNetwork,
      if (conversionRate != null) 'conversionRate': conversionRate,
      'gateway': gateway,
      if (gatewayReference != null) 'gatewayReference': gatewayReference,
      if (authorizationCode != null) 'authorizationCode': authorizationCode,
      'status': status.toJson(),
      if (paidAt != null) 'paidAt': paidAt?.toJson(),
      'customerEmail': customerEmail,
      if (customerPhone != null) 'customerPhone': customerPhone,
      if (customerName != null) 'customerName': customerName,
      if (authorizationUrl != null) 'authorizationUrl': authorizationUrl,
      if (accessCode != null) 'accessCode': accessCode,
      if (metadata != null) 'metadata': metadata,
      'platformType': platformType.toJson(),
      if (conversationId != null) 'conversationId': conversationId?.toJson(),
      'expiresAt': expiresAt.toJson(),
      'isExpired': isExpired,
      if (webhookEvents != null) 'webhookEvents': webhookEvents,
      if (lastWebhookAt != null) 'lastWebhookAt': lastWebhookAt?.toJson(),
      'paystackFee': paystackFee,
      'platformFee': platformFee,
      if (netAmount != null) 'netAmount': netAmount,
      'isRefunded': isRefunded,
      if (refundedAt != null) 'refundedAt': refundedAt?.toJson(),
      if (refundAmount != null) 'refundAmount': refundAmount,
      if (refundReason != null) 'refundReason': refundReason,
      if (verifiedAt != null) 'verifiedAt': verifiedAt?.toJson(),
      'verificationAttempts': verificationAttempts,
      if (ipAddress != null) 'ipAddress': ipAddress,
      if (userAgent != null) 'userAgent': userAgent,
      if (failureReason != null) 'failureReason': failureReason,
      if (gatewayResponse != null) 'gatewayResponse': gatewayResponse,
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

class _PaymentTransactionImpl extends PaymentTransaction {
  _PaymentTransactionImpl({
    _i1.UuidValue? id,
    required String reference,
    String? transactionId,
    required _i1.UuidValue userId,
    _i3.User? user,
    _i1.UuidValue? orderId,
    _i4.Order? order,
    required double amount,
    String? currency,
    _i5.PaymentMethod? paymentMethod,
    String? channel,
    String? cryptoType,
    double? cryptoAmount,
    String? walletAddress,
    String? transactionHash,
    String? blockchainNetwork,
    double? conversionRate,
    String? gateway,
    String? gatewayReference,
    String? authorizationCode,
    _i2.PaymentStatus? status,
    DateTime? paidAt,
    required String customerEmail,
    String? customerPhone,
    String? customerName,
    String? authorizationUrl,
    String? accessCode,
    String? metadata,
    required _i6.PlatformType platformType,
    _i1.UuidValue? conversationId,
    required DateTime expiresAt,
    bool? isExpired,
    String? webhookEvents,
    DateTime? lastWebhookAt,
    double? paystackFee,
    double? platformFee,
    double? netAmount,
    bool? isRefunded,
    DateTime? refundedAt,
    double? refundAmount,
    String? refundReason,
    DateTime? verifiedAt,
    int? verificationAttempts,
    String? ipAddress,
    String? userAgent,
    String? failureReason,
    String? gatewayResponse,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         reference: reference,
         transactionId: transactionId,
         userId: userId,
         user: user,
         orderId: orderId,
         order: order,
         amount: amount,
         currency: currency,
         paymentMethod: paymentMethod,
         channel: channel,
         cryptoType: cryptoType,
         cryptoAmount: cryptoAmount,
         walletAddress: walletAddress,
         transactionHash: transactionHash,
         blockchainNetwork: blockchainNetwork,
         conversionRate: conversionRate,
         gateway: gateway,
         gatewayReference: gatewayReference,
         authorizationCode: authorizationCode,
         status: status,
         paidAt: paidAt,
         customerEmail: customerEmail,
         customerPhone: customerPhone,
         customerName: customerName,
         authorizationUrl: authorizationUrl,
         accessCode: accessCode,
         metadata: metadata,
         platformType: platformType,
         conversationId: conversationId,
         expiresAt: expiresAt,
         isExpired: isExpired,
         webhookEvents: webhookEvents,
         lastWebhookAt: lastWebhookAt,
         paystackFee: paystackFee,
         platformFee: platformFee,
         netAmount: netAmount,
         isRefunded: isRefunded,
         refundedAt: refundedAt,
         refundAmount: refundAmount,
         refundReason: refundReason,
         verifiedAt: verifiedAt,
         verificationAttempts: verificationAttempts,
         ipAddress: ipAddress,
         userAgent: userAgent,
         failureReason: failureReason,
         gatewayResponse: gatewayResponse,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [PaymentTransaction]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PaymentTransaction copyWith({
    _i1.UuidValue? id,
    String? reference,
    Object? transactionId = _Undefined,
    _i1.UuidValue? userId,
    Object? user = _Undefined,
    Object? orderId = _Undefined,
    Object? order = _Undefined,
    double? amount,
    String? currency,
    Object? paymentMethod = _Undefined,
    Object? channel = _Undefined,
    Object? cryptoType = _Undefined,
    Object? cryptoAmount = _Undefined,
    Object? walletAddress = _Undefined,
    Object? transactionHash = _Undefined,
    Object? blockchainNetwork = _Undefined,
    Object? conversionRate = _Undefined,
    String? gateway,
    Object? gatewayReference = _Undefined,
    Object? authorizationCode = _Undefined,
    _i2.PaymentStatus? status,
    Object? paidAt = _Undefined,
    String? customerEmail,
    Object? customerPhone = _Undefined,
    Object? customerName = _Undefined,
    Object? authorizationUrl = _Undefined,
    Object? accessCode = _Undefined,
    Object? metadata = _Undefined,
    _i6.PlatformType? platformType,
    Object? conversationId = _Undefined,
    DateTime? expiresAt,
    bool? isExpired,
    Object? webhookEvents = _Undefined,
    Object? lastWebhookAt = _Undefined,
    double? paystackFee,
    double? platformFee,
    Object? netAmount = _Undefined,
    bool? isRefunded,
    Object? refundedAt = _Undefined,
    Object? refundAmount = _Undefined,
    Object? refundReason = _Undefined,
    Object? verifiedAt = _Undefined,
    int? verificationAttempts,
    Object? ipAddress = _Undefined,
    Object? userAgent = _Undefined,
    Object? failureReason = _Undefined,
    Object? gatewayResponse = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return PaymentTransaction(
      id: id ?? this.id,
      reference: reference ?? this.reference,
      transactionId: transactionId is String?
          ? transactionId
          : this.transactionId,
      userId: userId ?? this.userId,
      user: user is _i3.User? ? user : this.user?.copyWith(),
      orderId: orderId is _i1.UuidValue? ? orderId : this.orderId,
      order: order is _i4.Order? ? order : this.order?.copyWith(),
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      paymentMethod: paymentMethod is _i5.PaymentMethod?
          ? paymentMethod
          : this.paymentMethod,
      channel: channel is String? ? channel : this.channel,
      cryptoType: cryptoType is String? ? cryptoType : this.cryptoType,
      cryptoAmount: cryptoAmount is double? ? cryptoAmount : this.cryptoAmount,
      walletAddress: walletAddress is String?
          ? walletAddress
          : this.walletAddress,
      transactionHash: transactionHash is String?
          ? transactionHash
          : this.transactionHash,
      blockchainNetwork: blockchainNetwork is String?
          ? blockchainNetwork
          : this.blockchainNetwork,
      conversionRate: conversionRate is double?
          ? conversionRate
          : this.conversionRate,
      gateway: gateway ?? this.gateway,
      gatewayReference: gatewayReference is String?
          ? gatewayReference
          : this.gatewayReference,
      authorizationCode: authorizationCode is String?
          ? authorizationCode
          : this.authorizationCode,
      status: status ?? this.status,
      paidAt: paidAt is DateTime? ? paidAt : this.paidAt,
      customerEmail: customerEmail ?? this.customerEmail,
      customerPhone: customerPhone is String?
          ? customerPhone
          : this.customerPhone,
      customerName: customerName is String? ? customerName : this.customerName,
      authorizationUrl: authorizationUrl is String?
          ? authorizationUrl
          : this.authorizationUrl,
      accessCode: accessCode is String? ? accessCode : this.accessCode,
      metadata: metadata is String? ? metadata : this.metadata,
      platformType: platformType ?? this.platformType,
      conversationId: conversationId is _i1.UuidValue?
          ? conversationId
          : this.conversationId,
      expiresAt: expiresAt ?? this.expiresAt,
      isExpired: isExpired ?? this.isExpired,
      webhookEvents: webhookEvents is String?
          ? webhookEvents
          : this.webhookEvents,
      lastWebhookAt: lastWebhookAt is DateTime?
          ? lastWebhookAt
          : this.lastWebhookAt,
      paystackFee: paystackFee ?? this.paystackFee,
      platformFee: platformFee ?? this.platformFee,
      netAmount: netAmount is double? ? netAmount : this.netAmount,
      isRefunded: isRefunded ?? this.isRefunded,
      refundedAt: refundedAt is DateTime? ? refundedAt : this.refundedAt,
      refundAmount: refundAmount is double? ? refundAmount : this.refundAmount,
      refundReason: refundReason is String? ? refundReason : this.refundReason,
      verifiedAt: verifiedAt is DateTime? ? verifiedAt : this.verifiedAt,
      verificationAttempts: verificationAttempts ?? this.verificationAttempts,
      ipAddress: ipAddress is String? ? ipAddress : this.ipAddress,
      userAgent: userAgent is String? ? userAgent : this.userAgent,
      failureReason: failureReason is String?
          ? failureReason
          : this.failureReason,
      gatewayResponse: gatewayResponse is String?
          ? gatewayResponse
          : this.gatewayResponse,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
