/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member
// ignore_for_file: unnecessary_null_comparison

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../order/payment_status.dart' as _i2;
import '../user/user.dart' as _i3;
import '../order/order.dart' as _i4;
import '../order/payment_method.dart' as _i5;
import '../messaging/platfom_type.dart' as _i6;
import 'package:asami_server/src/generated/protocol.dart' as _i7;

abstract class PaymentTransaction
    implements _i1.TableRow<_i1.UuidValue>, _i1.ProtocolSerialization {
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

  static final t = PaymentTransactionTable();

  static const db = PaymentTransactionRepository._();

  @override
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

  @override
  _i1.Table<_i1.UuidValue> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'PaymentTransaction',
      'id': id.toJson(),
      'reference': reference,
      if (transactionId != null) 'transactionId': transactionId,
      'userId': userId.toJson(),
      if (user != null) 'user': user?.toJsonForProtocol(),
      if (orderId != null) 'orderId': orderId?.toJson(),
      if (order != null) 'order': order?.toJsonForProtocol(),
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

  static PaymentTransactionInclude include({
    _i3.UserInclude? user,
    _i4.OrderInclude? order,
  }) {
    return PaymentTransactionInclude._(
      user: user,
      order: order,
    );
  }

  static PaymentTransactionIncludeList includeList({
    _i1.WhereExpressionBuilder<PaymentTransactionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PaymentTransactionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PaymentTransactionTable>? orderByList,
    PaymentTransactionInclude? include,
  }) {
    return PaymentTransactionIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PaymentTransaction.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(PaymentTransaction.t),
      include: include,
    );
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

class PaymentTransactionUpdateTable
    extends _i1.UpdateTable<PaymentTransactionTable> {
  PaymentTransactionUpdateTable(super.table);

  _i1.ColumnValue<String, String> reference(String value) => _i1.ColumnValue(
    table.reference,
    value,
  );

  _i1.ColumnValue<String, String> transactionId(String? value) =>
      _i1.ColumnValue(
        table.transactionId,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> userId(_i1.UuidValue value) =>
      _i1.ColumnValue(
        table.userId,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> orderId(_i1.UuidValue? value) =>
      _i1.ColumnValue(
        table.orderId,
        value,
      );

  _i1.ColumnValue<double, double> amount(double value) => _i1.ColumnValue(
    table.amount,
    value,
  );

  _i1.ColumnValue<String, String> currency(String value) => _i1.ColumnValue(
    table.currency,
    value,
  );

  _i1.ColumnValue<_i5.PaymentMethod, _i5.PaymentMethod> paymentMethod(
    _i5.PaymentMethod? value,
  ) => _i1.ColumnValue(
    table.paymentMethod,
    value,
  );

  _i1.ColumnValue<String, String> channel(String? value) => _i1.ColumnValue(
    table.channel,
    value,
  );

  _i1.ColumnValue<String, String> cryptoType(String? value) => _i1.ColumnValue(
    table.cryptoType,
    value,
  );

  _i1.ColumnValue<double, double> cryptoAmount(double? value) =>
      _i1.ColumnValue(
        table.cryptoAmount,
        value,
      );

  _i1.ColumnValue<String, String> walletAddress(String? value) =>
      _i1.ColumnValue(
        table.walletAddress,
        value,
      );

  _i1.ColumnValue<String, String> transactionHash(String? value) =>
      _i1.ColumnValue(
        table.transactionHash,
        value,
      );

  _i1.ColumnValue<String, String> blockchainNetwork(String? value) =>
      _i1.ColumnValue(
        table.blockchainNetwork,
        value,
      );

  _i1.ColumnValue<double, double> conversionRate(double? value) =>
      _i1.ColumnValue(
        table.conversionRate,
        value,
      );

  _i1.ColumnValue<String, String> gateway(String value) => _i1.ColumnValue(
    table.gateway,
    value,
  );

  _i1.ColumnValue<String, String> gatewayReference(String? value) =>
      _i1.ColumnValue(
        table.gatewayReference,
        value,
      );

  _i1.ColumnValue<String, String> authorizationCode(String? value) =>
      _i1.ColumnValue(
        table.authorizationCode,
        value,
      );

  _i1.ColumnValue<_i2.PaymentStatus, _i2.PaymentStatus> status(
    _i2.PaymentStatus value,
  ) => _i1.ColumnValue(
    table.status,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> paidAt(DateTime? value) =>
      _i1.ColumnValue(
        table.paidAt,
        value,
      );

  _i1.ColumnValue<String, String> customerEmail(String value) =>
      _i1.ColumnValue(
        table.customerEmail,
        value,
      );

  _i1.ColumnValue<String, String> customerPhone(String? value) =>
      _i1.ColumnValue(
        table.customerPhone,
        value,
      );

  _i1.ColumnValue<String, String> customerName(String? value) =>
      _i1.ColumnValue(
        table.customerName,
        value,
      );

  _i1.ColumnValue<String, String> authorizationUrl(String? value) =>
      _i1.ColumnValue(
        table.authorizationUrl,
        value,
      );

  _i1.ColumnValue<String, String> accessCode(String? value) => _i1.ColumnValue(
    table.accessCode,
    value,
  );

  _i1.ColumnValue<String, String> metadata(String? value) => _i1.ColumnValue(
    table.metadata,
    value,
  );

  _i1.ColumnValue<_i6.PlatformType, _i6.PlatformType> platformType(
    _i6.PlatformType value,
  ) => _i1.ColumnValue(
    table.platformType,
    value,
  );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> conversationId(
    _i1.UuidValue? value,
  ) => _i1.ColumnValue(
    table.conversationId,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> expiresAt(DateTime value) =>
      _i1.ColumnValue(
        table.expiresAt,
        value,
      );

  _i1.ColumnValue<bool, bool> isExpired(bool value) => _i1.ColumnValue(
    table.isExpired,
    value,
  );

  _i1.ColumnValue<String, String> webhookEvents(String? value) =>
      _i1.ColumnValue(
        table.webhookEvents,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> lastWebhookAt(DateTime? value) =>
      _i1.ColumnValue(
        table.lastWebhookAt,
        value,
      );

  _i1.ColumnValue<double, double> paystackFee(double value) => _i1.ColumnValue(
    table.paystackFee,
    value,
  );

  _i1.ColumnValue<double, double> platformFee(double value) => _i1.ColumnValue(
    table.platformFee,
    value,
  );

  _i1.ColumnValue<double, double> netAmount(double? value) => _i1.ColumnValue(
    table.netAmount,
    value,
  );

  _i1.ColumnValue<bool, bool> isRefunded(bool value) => _i1.ColumnValue(
    table.isRefunded,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> refundedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.refundedAt,
        value,
      );

  _i1.ColumnValue<double, double> refundAmount(double? value) =>
      _i1.ColumnValue(
        table.refundAmount,
        value,
      );

  _i1.ColumnValue<String, String> refundReason(String? value) =>
      _i1.ColumnValue(
        table.refundReason,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> verifiedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.verifiedAt,
        value,
      );

  _i1.ColumnValue<int, int> verificationAttempts(int value) => _i1.ColumnValue(
    table.verificationAttempts,
    value,
  );

  _i1.ColumnValue<String, String> ipAddress(String? value) => _i1.ColumnValue(
    table.ipAddress,
    value,
  );

  _i1.ColumnValue<String, String> userAgent(String? value) => _i1.ColumnValue(
    table.userAgent,
    value,
  );

  _i1.ColumnValue<String, String> failureReason(String? value) =>
      _i1.ColumnValue(
        table.failureReason,
        value,
      );

  _i1.ColumnValue<String, String> gatewayResponse(String? value) =>
      _i1.ColumnValue(
        table.gatewayResponse,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> updatedAt(DateTime value) =>
      _i1.ColumnValue(
        table.updatedAt,
        value,
      );
}

class PaymentTransactionTable extends _i1.Table<_i1.UuidValue> {
  PaymentTransactionTable({super.tableRelation})
    : super(tableName: 'payment_transactions') {
    updateTable = PaymentTransactionUpdateTable(this);
    reference = _i1.ColumnString(
      'reference',
      this,
    );
    transactionId = _i1.ColumnString(
      'transactionId',
      this,
    );
    userId = _i1.ColumnUuid(
      'userId',
      this,
    );
    orderId = _i1.ColumnUuid(
      'orderId',
      this,
    );
    amount = _i1.ColumnDouble(
      'amount',
      this,
    );
    currency = _i1.ColumnString(
      'currency',
      this,
      hasDefault: true,
    );
    paymentMethod = _i1.ColumnEnum(
      'paymentMethod',
      this,
      _i1.EnumSerialization.byName,
    );
    channel = _i1.ColumnString(
      'channel',
      this,
    );
    cryptoType = _i1.ColumnString(
      'cryptoType',
      this,
    );
    cryptoAmount = _i1.ColumnDouble(
      'cryptoAmount',
      this,
    );
    walletAddress = _i1.ColumnString(
      'walletAddress',
      this,
    );
    transactionHash = _i1.ColumnString(
      'transactionHash',
      this,
    );
    blockchainNetwork = _i1.ColumnString(
      'blockchainNetwork',
      this,
    );
    conversionRate = _i1.ColumnDouble(
      'conversionRate',
      this,
    );
    gateway = _i1.ColumnString(
      'gateway',
      this,
      hasDefault: true,
    );
    gatewayReference = _i1.ColumnString(
      'gatewayReference',
      this,
    );
    authorizationCode = _i1.ColumnString(
      'authorizationCode',
      this,
    );
    status = _i1.ColumnEnum(
      'status',
      this,
      _i1.EnumSerialization.byName,
      hasDefault: true,
    );
    paidAt = _i1.ColumnDateTime(
      'paidAt',
      this,
    );
    customerEmail = _i1.ColumnString(
      'customerEmail',
      this,
    );
    customerPhone = _i1.ColumnString(
      'customerPhone',
      this,
    );
    customerName = _i1.ColumnString(
      'customerName',
      this,
    );
    authorizationUrl = _i1.ColumnString(
      'authorizationUrl',
      this,
    );
    accessCode = _i1.ColumnString(
      'accessCode',
      this,
    );
    metadata = _i1.ColumnString(
      'metadata',
      this,
    );
    platformType = _i1.ColumnEnum(
      'platformType',
      this,
      _i1.EnumSerialization.byName,
    );
    conversationId = _i1.ColumnUuid(
      'conversationId',
      this,
    );
    expiresAt = _i1.ColumnDateTime(
      'expiresAt',
      this,
    );
    isExpired = _i1.ColumnBool(
      'isExpired',
      this,
      hasDefault: true,
    );
    webhookEvents = _i1.ColumnString(
      'webhookEvents',
      this,
    );
    lastWebhookAt = _i1.ColumnDateTime(
      'lastWebhookAt',
      this,
    );
    paystackFee = _i1.ColumnDouble(
      'paystackFee',
      this,
      hasDefault: true,
    );
    platformFee = _i1.ColumnDouble(
      'platformFee',
      this,
      hasDefault: true,
    );
    netAmount = _i1.ColumnDouble(
      'netAmount',
      this,
    );
    isRefunded = _i1.ColumnBool(
      'isRefunded',
      this,
      hasDefault: true,
    );
    refundedAt = _i1.ColumnDateTime(
      'refundedAt',
      this,
    );
    refundAmount = _i1.ColumnDouble(
      'refundAmount',
      this,
    );
    refundReason = _i1.ColumnString(
      'refundReason',
      this,
    );
    verifiedAt = _i1.ColumnDateTime(
      'verifiedAt',
      this,
    );
    verificationAttempts = _i1.ColumnInt(
      'verificationAttempts',
      this,
      hasDefault: true,
    );
    ipAddress = _i1.ColumnString(
      'ipAddress',
      this,
    );
    userAgent = _i1.ColumnString(
      'userAgent',
      this,
    );
    failureReason = _i1.ColumnString(
      'failureReason',
      this,
    );
    gatewayResponse = _i1.ColumnString(
      'gatewayResponse',
      this,
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
  }

  late final PaymentTransactionUpdateTable updateTable;

  late final _i1.ColumnString reference;

  late final _i1.ColumnString transactionId;

  late final _i1.ColumnUuid userId;

  _i3.UserTable? _user;

  late final _i1.ColumnUuid orderId;

  _i4.OrderTable? _order;

  late final _i1.ColumnDouble amount;

  late final _i1.ColumnString currency;

  late final _i1.ColumnEnum<_i5.PaymentMethod> paymentMethod;

  late final _i1.ColumnString channel;

  late final _i1.ColumnString cryptoType;

  late final _i1.ColumnDouble cryptoAmount;

  late final _i1.ColumnString walletAddress;

  late final _i1.ColumnString transactionHash;

  late final _i1.ColumnString blockchainNetwork;

  late final _i1.ColumnDouble conversionRate;

  late final _i1.ColumnString gateway;

  late final _i1.ColumnString gatewayReference;

  late final _i1.ColumnString authorizationCode;

  late final _i1.ColumnEnum<_i2.PaymentStatus> status;

  late final _i1.ColumnDateTime paidAt;

  late final _i1.ColumnString customerEmail;

  late final _i1.ColumnString customerPhone;

  late final _i1.ColumnString customerName;

  late final _i1.ColumnString authorizationUrl;

  late final _i1.ColumnString accessCode;

  late final _i1.ColumnString metadata;

  late final _i1.ColumnEnum<_i6.PlatformType> platformType;

  late final _i1.ColumnUuid conversationId;

  late final _i1.ColumnDateTime expiresAt;

  late final _i1.ColumnBool isExpired;

  late final _i1.ColumnString webhookEvents;

  late final _i1.ColumnDateTime lastWebhookAt;

  late final _i1.ColumnDouble paystackFee;

  late final _i1.ColumnDouble platformFee;

  late final _i1.ColumnDouble netAmount;

  late final _i1.ColumnBool isRefunded;

  late final _i1.ColumnDateTime refundedAt;

  late final _i1.ColumnDouble refundAmount;

  late final _i1.ColumnString refundReason;

  late final _i1.ColumnDateTime verifiedAt;

  late final _i1.ColumnInt verificationAttempts;

  late final _i1.ColumnString ipAddress;

  late final _i1.ColumnString userAgent;

  late final _i1.ColumnString failureReason;

  late final _i1.ColumnString gatewayResponse;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  _i3.UserTable get user {
    if (_user != null) return _user!;
    _user = _i1.createRelationTable(
      relationFieldName: 'user',
      field: PaymentTransaction.t.userId,
      foreignField: _i3.User.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.UserTable(tableRelation: foreignTableRelation),
    );
    return _user!;
  }

  _i4.OrderTable get order {
    if (_order != null) return _order!;
    _order = _i1.createRelationTable(
      relationFieldName: 'order',
      field: PaymentTransaction.t.orderId,
      foreignField: _i4.Order.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.OrderTable(tableRelation: foreignTableRelation),
    );
    return _order!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    reference,
    transactionId,
    userId,
    orderId,
    amount,
    currency,
    paymentMethod,
    channel,
    cryptoType,
    cryptoAmount,
    walletAddress,
    transactionHash,
    blockchainNetwork,
    conversionRate,
    gateway,
    gatewayReference,
    authorizationCode,
    status,
    paidAt,
    customerEmail,
    customerPhone,
    customerName,
    authorizationUrl,
    accessCode,
    metadata,
    platformType,
    conversationId,
    expiresAt,
    isExpired,
    webhookEvents,
    lastWebhookAt,
    paystackFee,
    platformFee,
    netAmount,
    isRefunded,
    refundedAt,
    refundAmount,
    refundReason,
    verifiedAt,
    verificationAttempts,
    ipAddress,
    userAgent,
    failureReason,
    gatewayResponse,
    createdAt,
    updatedAt,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'user') {
      return user;
    }
    if (relationField == 'order') {
      return order;
    }
    return null;
  }
}

class PaymentTransactionInclude extends _i1.IncludeObject {
  PaymentTransactionInclude._({
    _i3.UserInclude? user,
    _i4.OrderInclude? order,
  }) {
    _user = user;
    _order = order;
  }

  _i3.UserInclude? _user;

  _i4.OrderInclude? _order;

  @override
  Map<String, _i1.Include?> get includes => {
    'user': _user,
    'order': _order,
  };

  @override
  _i1.Table<_i1.UuidValue> get table => PaymentTransaction.t;
}

class PaymentTransactionIncludeList extends _i1.IncludeList {
  PaymentTransactionIncludeList._({
    _i1.WhereExpressionBuilder<PaymentTransactionTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(PaymentTransaction.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue> get table => PaymentTransaction.t;
}

class PaymentTransactionRepository {
  const PaymentTransactionRepository._();

  final attachRow = const PaymentTransactionAttachRowRepository._();

  final detachRow = const PaymentTransactionDetachRowRepository._();

  /// Returns a list of [PaymentTransaction]s matching the given query parameters.
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
  Future<List<PaymentTransaction>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PaymentTransactionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PaymentTransactionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PaymentTransactionTable>? orderByList,
    _i1.Transaction? transaction,
    PaymentTransactionInclude? include,
  }) async {
    return session.db.find<PaymentTransaction>(
      where: where?.call(PaymentTransaction.t),
      orderBy: orderBy?.call(PaymentTransaction.t),
      orderByList: orderByList?.call(PaymentTransaction.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [PaymentTransaction] matching the given query parameters.
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
  Future<PaymentTransaction?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PaymentTransactionTable>? where,
    int? offset,
    _i1.OrderByBuilder<PaymentTransactionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PaymentTransactionTable>? orderByList,
    _i1.Transaction? transaction,
    PaymentTransactionInclude? include,
  }) async {
    return session.db.findFirstRow<PaymentTransaction>(
      where: where?.call(PaymentTransaction.t),
      orderBy: orderBy?.call(PaymentTransaction.t),
      orderByList: orderByList?.call(PaymentTransaction.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [PaymentTransaction] by its [id] or null if no such row exists.
  Future<PaymentTransaction?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
    PaymentTransactionInclude? include,
  }) async {
    return session.db.findById<PaymentTransaction>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [PaymentTransaction]s in the list and returns the inserted rows.
  ///
  /// The returned [PaymentTransaction]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<PaymentTransaction>> insert(
    _i1.Session session,
    List<PaymentTransaction> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<PaymentTransaction>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [PaymentTransaction] and returns the inserted row.
  ///
  /// The returned [PaymentTransaction] will have its `id` field set.
  Future<PaymentTransaction> insertRow(
    _i1.Session session,
    PaymentTransaction row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<PaymentTransaction>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [PaymentTransaction]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<PaymentTransaction>> update(
    _i1.Session session,
    List<PaymentTransaction> rows, {
    _i1.ColumnSelections<PaymentTransactionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<PaymentTransaction>(
      rows,
      columns: columns?.call(PaymentTransaction.t),
      transaction: transaction,
    );
  }

  /// Updates a single [PaymentTransaction]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<PaymentTransaction> updateRow(
    _i1.Session session,
    PaymentTransaction row, {
    _i1.ColumnSelections<PaymentTransactionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<PaymentTransaction>(
      row,
      columns: columns?.call(PaymentTransaction.t),
      transaction: transaction,
    );
  }

  /// Updates a single [PaymentTransaction] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<PaymentTransaction?> updateById(
    _i1.Session session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<PaymentTransactionUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<PaymentTransaction>(
      id,
      columnValues: columnValues(PaymentTransaction.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [PaymentTransaction]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<PaymentTransaction>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<PaymentTransactionUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<PaymentTransactionTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PaymentTransactionTable>? orderBy,
    _i1.OrderByListBuilder<PaymentTransactionTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<PaymentTransaction>(
      columnValues: columnValues(PaymentTransaction.t.updateTable),
      where: where(PaymentTransaction.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PaymentTransaction.t),
      orderByList: orderByList?.call(PaymentTransaction.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [PaymentTransaction]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<PaymentTransaction>> delete(
    _i1.Session session,
    List<PaymentTransaction> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<PaymentTransaction>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [PaymentTransaction].
  Future<PaymentTransaction> deleteRow(
    _i1.Session session,
    PaymentTransaction row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<PaymentTransaction>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<PaymentTransaction>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PaymentTransactionTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<PaymentTransaction>(
      where: where(PaymentTransaction.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PaymentTransactionTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<PaymentTransaction>(
      where: where?.call(PaymentTransaction.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class PaymentTransactionAttachRowRepository {
  const PaymentTransactionAttachRowRepository._();

  /// Creates a relation between the given [PaymentTransaction] and [User]
  /// by setting the [PaymentTransaction]'s foreign key `userId` to refer to the [User].
  Future<void> user(
    _i1.Session session,
    PaymentTransaction paymentTransaction,
    _i3.User user, {
    _i1.Transaction? transaction,
  }) async {
    if (paymentTransaction.id == null) {
      throw ArgumentError.notNull('paymentTransaction.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $paymentTransaction = paymentTransaction.copyWith(userId: user.id);
    await session.db.updateRow<PaymentTransaction>(
      $paymentTransaction,
      columns: [PaymentTransaction.t.userId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [PaymentTransaction] and [Order]
  /// by setting the [PaymentTransaction]'s foreign key `orderId` to refer to the [Order].
  Future<void> order(
    _i1.Session session,
    PaymentTransaction paymentTransaction,
    _i4.Order order, {
    _i1.Transaction? transaction,
  }) async {
    if (paymentTransaction.id == null) {
      throw ArgumentError.notNull('paymentTransaction.id');
    }
    if (order.id == null) {
      throw ArgumentError.notNull('order.id');
    }

    var $paymentTransaction = paymentTransaction.copyWith(orderId: order.id);
    await session.db.updateRow<PaymentTransaction>(
      $paymentTransaction,
      columns: [PaymentTransaction.t.orderId],
      transaction: transaction,
    );
  }
}

class PaymentTransactionDetachRowRepository {
  const PaymentTransactionDetachRowRepository._();

  /// Detaches the relation between this [PaymentTransaction] and the [Order] set in `order`
  /// by setting the [PaymentTransaction]'s foreign key `orderId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> order(
    _i1.Session session,
    PaymentTransaction paymentTransaction, {
    _i1.Transaction? transaction,
  }) async {
    if (paymentTransaction.id == null) {
      throw ArgumentError.notNull('paymentTransaction.id');
    }

    var $paymentTransaction = paymentTransaction.copyWith(orderId: null);
    await session.db.updateRow<PaymentTransaction>(
      $paymentTransaction,
      columns: [PaymentTransaction.t.orderId],
      transaction: transaction,
    );
  }
}
