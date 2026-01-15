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
import '../order/payment_transaction.dart' as _i2;
import 'package:asami_client/src/protocol/protocol.dart' as _i3;

abstract class WebhookEvent implements _i1.SerializableModel {
  WebhookEvent._({
    _i1.UuidValue? id,
    required this.eventType,
    this.eventId,
    this.paymentTransactionId,
    this.paymentTransaction,
    this.transactionReference,
    required this.rawPayload,
    this.processedPayload,
    String? status,
    this.processedAt,
    int? retryCount,
    this.lastRetryAt,
    this.errorMessage,
    bool? isVerified,
    this.verifiedAt,
    String? source,
    this.ipAddress,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : id = id ?? _i1.Uuid().v4obj(),
       status = status ?? 'received',
       retryCount = retryCount ?? 0,
       isVerified = isVerified ?? false,
       source = source ?? 'paystack',
       createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory WebhookEvent({
    _i1.UuidValue? id,
    required String eventType,
    String? eventId,
    _i1.UuidValue? paymentTransactionId,
    _i2.PaymentTransaction? paymentTransaction,
    String? transactionReference,
    required String rawPayload,
    String? processedPayload,
    String? status,
    DateTime? processedAt,
    int? retryCount,
    DateTime? lastRetryAt,
    String? errorMessage,
    bool? isVerified,
    DateTime? verifiedAt,
    String? source,
    String? ipAddress,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _WebhookEventImpl;

  factory WebhookEvent.fromJson(Map<String, dynamic> jsonSerialization) {
    return WebhookEvent(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      eventType: jsonSerialization['eventType'] as String,
      eventId: jsonSerialization['eventId'] as String?,
      paymentTransactionId: jsonSerialization['paymentTransactionId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(
              jsonSerialization['paymentTransactionId'],
            ),
      paymentTransaction: jsonSerialization['paymentTransaction'] == null
          ? null
          : _i3.Protocol().deserialize<_i2.PaymentTransaction>(
              jsonSerialization['paymentTransaction'],
            ),
      transactionReference:
          jsonSerialization['transactionReference'] as String?,
      rawPayload: jsonSerialization['rawPayload'] as String,
      processedPayload: jsonSerialization['processedPayload'] as String?,
      status: jsonSerialization['status'] as String?,
      processedAt: jsonSerialization['processedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['processedAt'],
            ),
      retryCount: jsonSerialization['retryCount'] as int?,
      lastRetryAt: jsonSerialization['lastRetryAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastRetryAt'],
            ),
      errorMessage: jsonSerialization['errorMessage'] as String?,
      isVerified: jsonSerialization['isVerified'] as bool?,
      verifiedAt: jsonSerialization['verifiedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['verifiedAt']),
      source: jsonSerialization['source'] as String?,
      ipAddress: jsonSerialization['ipAddress'] as String?,
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

  String eventType;

  String? eventId;

  _i1.UuidValue? paymentTransactionId;

  _i2.PaymentTransaction? paymentTransaction;

  String? transactionReference;

  String rawPayload;

  String? processedPayload;

  String status;

  DateTime? processedAt;

  int retryCount;

  DateTime? lastRetryAt;

  String? errorMessage;

  bool isVerified;

  DateTime? verifiedAt;

  String source;

  String? ipAddress;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [WebhookEvent]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  WebhookEvent copyWith({
    _i1.UuidValue? id,
    String? eventType,
    String? eventId,
    _i1.UuidValue? paymentTransactionId,
    _i2.PaymentTransaction? paymentTransaction,
    String? transactionReference,
    String? rawPayload,
    String? processedPayload,
    String? status,
    DateTime? processedAt,
    int? retryCount,
    DateTime? lastRetryAt,
    String? errorMessage,
    bool? isVerified,
    DateTime? verifiedAt,
    String? source,
    String? ipAddress,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'WebhookEvent',
      'id': id.toJson(),
      'eventType': eventType,
      if (eventId != null) 'eventId': eventId,
      if (paymentTransactionId != null)
        'paymentTransactionId': paymentTransactionId?.toJson(),
      if (paymentTransaction != null)
        'paymentTransaction': paymentTransaction?.toJson(),
      if (transactionReference != null)
        'transactionReference': transactionReference,
      'rawPayload': rawPayload,
      if (processedPayload != null) 'processedPayload': processedPayload,
      'status': status,
      if (processedAt != null) 'processedAt': processedAt?.toJson(),
      'retryCount': retryCount,
      if (lastRetryAt != null) 'lastRetryAt': lastRetryAt?.toJson(),
      if (errorMessage != null) 'errorMessage': errorMessage,
      'isVerified': isVerified,
      if (verifiedAt != null) 'verifiedAt': verifiedAt?.toJson(),
      'source': source,
      if (ipAddress != null) 'ipAddress': ipAddress,
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

class _WebhookEventImpl extends WebhookEvent {
  _WebhookEventImpl({
    _i1.UuidValue? id,
    required String eventType,
    String? eventId,
    _i1.UuidValue? paymentTransactionId,
    _i2.PaymentTransaction? paymentTransaction,
    String? transactionReference,
    required String rawPayload,
    String? processedPayload,
    String? status,
    DateTime? processedAt,
    int? retryCount,
    DateTime? lastRetryAt,
    String? errorMessage,
    bool? isVerified,
    DateTime? verifiedAt,
    String? source,
    String? ipAddress,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         eventType: eventType,
         eventId: eventId,
         paymentTransactionId: paymentTransactionId,
         paymentTransaction: paymentTransaction,
         transactionReference: transactionReference,
         rawPayload: rawPayload,
         processedPayload: processedPayload,
         status: status,
         processedAt: processedAt,
         retryCount: retryCount,
         lastRetryAt: lastRetryAt,
         errorMessage: errorMessage,
         isVerified: isVerified,
         verifiedAt: verifiedAt,
         source: source,
         ipAddress: ipAddress,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [WebhookEvent]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  WebhookEvent copyWith({
    _i1.UuidValue? id,
    String? eventType,
    Object? eventId = _Undefined,
    Object? paymentTransactionId = _Undefined,
    Object? paymentTransaction = _Undefined,
    Object? transactionReference = _Undefined,
    String? rawPayload,
    Object? processedPayload = _Undefined,
    String? status,
    Object? processedAt = _Undefined,
    int? retryCount,
    Object? lastRetryAt = _Undefined,
    Object? errorMessage = _Undefined,
    bool? isVerified,
    Object? verifiedAt = _Undefined,
    String? source,
    Object? ipAddress = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return WebhookEvent(
      id: id ?? this.id,
      eventType: eventType ?? this.eventType,
      eventId: eventId is String? ? eventId : this.eventId,
      paymentTransactionId: paymentTransactionId is _i1.UuidValue?
          ? paymentTransactionId
          : this.paymentTransactionId,
      paymentTransaction: paymentTransaction is _i2.PaymentTransaction?
          ? paymentTransaction
          : this.paymentTransaction?.copyWith(),
      transactionReference: transactionReference is String?
          ? transactionReference
          : this.transactionReference,
      rawPayload: rawPayload ?? this.rawPayload,
      processedPayload: processedPayload is String?
          ? processedPayload
          : this.processedPayload,
      status: status ?? this.status,
      processedAt: processedAt is DateTime? ? processedAt : this.processedAt,
      retryCount: retryCount ?? this.retryCount,
      lastRetryAt: lastRetryAt is DateTime? ? lastRetryAt : this.lastRetryAt,
      errorMessage: errorMessage is String? ? errorMessage : this.errorMessage,
      isVerified: isVerified ?? this.isVerified,
      verifiedAt: verifiedAt is DateTime? ? verifiedAt : this.verifiedAt,
      source: source ?? this.source,
      ipAddress: ipAddress is String? ? ipAddress : this.ipAddress,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
