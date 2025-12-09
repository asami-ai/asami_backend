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

abstract class PlatformAnalytics implements _i1.SerializableModel {
  PlatformAnalytics._({
    _i1.UuidValue? id,
    required this.date,
    required this.period,
    int? totalUsers,
    int? activeUsers,
    int? newUsers,
    int? totalCustomers,
    int? totalVendors,
    int? totalOrders,
    double? totalRevenue,
    double? averageOrderValue,
    double? platformFeesCollected,
    int? totalProducts,
    int? activeProducts,
    int? newProducts,
    int? totalAiInteractions,
    int? successfulAiResponses,
    double? aiResponseTime,
    double? aiCostsIncurred,
    int? whatsappMessages,
    int? telegramMessages,
    int? totalConversations,
    int? activeConversations,
    int? fiatTransactions,
    int? cryptoTransactions,
    double? fiatVolume,
    double? cryptoVolume,
    int? freemiumVendors,
    int? proVendors,
    int? proMaxVendors,
    double? subscriptionRevenue,
    double? churnRate,
    DateTime? createdAt,
  })  : id = id ?? _i1.Uuid().v4obj(),
        totalUsers = totalUsers ?? 0,
        activeUsers = activeUsers ?? 0,
        newUsers = newUsers ?? 0,
        totalCustomers = totalCustomers ?? 0,
        totalVendors = totalVendors ?? 0,
        totalOrders = totalOrders ?? 0,
        totalRevenue = totalRevenue ?? 0.0,
        averageOrderValue = averageOrderValue ?? 0.0,
        platformFeesCollected = platformFeesCollected ?? 0.0,
        totalProducts = totalProducts ?? 0,
        activeProducts = activeProducts ?? 0,
        newProducts = newProducts ?? 0,
        totalAiInteractions = totalAiInteractions ?? 0,
        successfulAiResponses = successfulAiResponses ?? 0,
        aiResponseTime = aiResponseTime ?? 0.0,
        aiCostsIncurred = aiCostsIncurred ?? 0.0,
        whatsappMessages = whatsappMessages ?? 0,
        telegramMessages = telegramMessages ?? 0,
        totalConversations = totalConversations ?? 0,
        activeConversations = activeConversations ?? 0,
        fiatTransactions = fiatTransactions ?? 0,
        cryptoTransactions = cryptoTransactions ?? 0,
        fiatVolume = fiatVolume ?? 0.0,
        cryptoVolume = cryptoVolume ?? 0.0,
        freemiumVendors = freemiumVendors ?? 0,
        proVendors = proVendors ?? 0,
        proMaxVendors = proMaxVendors ?? 0,
        subscriptionRevenue = subscriptionRevenue ?? 0.0,
        churnRate = churnRate ?? 0.0,
        createdAt = createdAt ?? DateTime.now();

  factory PlatformAnalytics({
    _i1.UuidValue? id,
    required DateTime date,
    required String period,
    int? totalUsers,
    int? activeUsers,
    int? newUsers,
    int? totalCustomers,
    int? totalVendors,
    int? totalOrders,
    double? totalRevenue,
    double? averageOrderValue,
    double? platformFeesCollected,
    int? totalProducts,
    int? activeProducts,
    int? newProducts,
    int? totalAiInteractions,
    int? successfulAiResponses,
    double? aiResponseTime,
    double? aiCostsIncurred,
    int? whatsappMessages,
    int? telegramMessages,
    int? totalConversations,
    int? activeConversations,
    int? fiatTransactions,
    int? cryptoTransactions,
    double? fiatVolume,
    double? cryptoVolume,
    int? freemiumVendors,
    int? proVendors,
    int? proMaxVendors,
    double? subscriptionRevenue,
    double? churnRate,
    DateTime? createdAt,
  }) = _PlatformAnalyticsImpl;

  factory PlatformAnalytics.fromJson(Map<String, dynamic> jsonSerialization) {
    return PlatformAnalytics(
      id: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      date: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['date']),
      period: jsonSerialization['period'] as String,
      totalUsers: jsonSerialization['totalUsers'] as int,
      activeUsers: jsonSerialization['activeUsers'] as int,
      newUsers: jsonSerialization['newUsers'] as int,
      totalCustomers: jsonSerialization['totalCustomers'] as int,
      totalVendors: jsonSerialization['totalVendors'] as int,
      totalOrders: jsonSerialization['totalOrders'] as int,
      totalRevenue: (jsonSerialization['totalRevenue'] as num).toDouble(),
      averageOrderValue:
          (jsonSerialization['averageOrderValue'] as num).toDouble(),
      platformFeesCollected:
          (jsonSerialization['platformFeesCollected'] as num).toDouble(),
      totalProducts: jsonSerialization['totalProducts'] as int,
      activeProducts: jsonSerialization['activeProducts'] as int,
      newProducts: jsonSerialization['newProducts'] as int,
      totalAiInteractions: jsonSerialization['totalAiInteractions'] as int,
      successfulAiResponses: jsonSerialization['successfulAiResponses'] as int,
      aiResponseTime: (jsonSerialization['aiResponseTime'] as num).toDouble(),
      aiCostsIncurred: (jsonSerialization['aiCostsIncurred'] as num).toDouble(),
      whatsappMessages: jsonSerialization['whatsappMessages'] as int,
      telegramMessages: jsonSerialization['telegramMessages'] as int,
      totalConversations: jsonSerialization['totalConversations'] as int,
      activeConversations: jsonSerialization['activeConversations'] as int,
      fiatTransactions: jsonSerialization['fiatTransactions'] as int,
      cryptoTransactions: jsonSerialization['cryptoTransactions'] as int,
      fiatVolume: (jsonSerialization['fiatVolume'] as num).toDouble(),
      cryptoVolume: (jsonSerialization['cryptoVolume'] as num).toDouble(),
      freemiumVendors: jsonSerialization['freemiumVendors'] as int,
      proVendors: jsonSerialization['proVendors'] as int,
      proMaxVendors: jsonSerialization['proMaxVendors'] as int,
      subscriptionRevenue:
          (jsonSerialization['subscriptionRevenue'] as num).toDouble(),
      churnRate: (jsonSerialization['churnRate'] as num).toDouble(),
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _i1.UuidValue id;

  DateTime date;

  String period;

  int totalUsers;

  int activeUsers;

  int newUsers;

  int totalCustomers;

  int totalVendors;

  int totalOrders;

  double totalRevenue;

  double averageOrderValue;

  double platformFeesCollected;

  int totalProducts;

  int activeProducts;

  int newProducts;

  int totalAiInteractions;

  int successfulAiResponses;

  double aiResponseTime;

  double aiCostsIncurred;

  int whatsappMessages;

  int telegramMessages;

  int totalConversations;

  int activeConversations;

  int fiatTransactions;

  int cryptoTransactions;

  double fiatVolume;

  double cryptoVolume;

  int freemiumVendors;

  int proVendors;

  int proMaxVendors;

  double subscriptionRevenue;

  double churnRate;

  DateTime createdAt;

  /// Returns a shallow copy of this [PlatformAnalytics]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PlatformAnalytics copyWith({
    _i1.UuidValue? id,
    DateTime? date,
    String? period,
    int? totalUsers,
    int? activeUsers,
    int? newUsers,
    int? totalCustomers,
    int? totalVendors,
    int? totalOrders,
    double? totalRevenue,
    double? averageOrderValue,
    double? platformFeesCollected,
    int? totalProducts,
    int? activeProducts,
    int? newProducts,
    int? totalAiInteractions,
    int? successfulAiResponses,
    double? aiResponseTime,
    double? aiCostsIncurred,
    int? whatsappMessages,
    int? telegramMessages,
    int? totalConversations,
    int? activeConversations,
    int? fiatTransactions,
    int? cryptoTransactions,
    double? fiatVolume,
    double? cryptoVolume,
    int? freemiumVendors,
    int? proVendors,
    int? proMaxVendors,
    double? subscriptionRevenue,
    double? churnRate,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'date': date.toJson(),
      'period': period,
      'totalUsers': totalUsers,
      'activeUsers': activeUsers,
      'newUsers': newUsers,
      'totalCustomers': totalCustomers,
      'totalVendors': totalVendors,
      'totalOrders': totalOrders,
      'totalRevenue': totalRevenue,
      'averageOrderValue': averageOrderValue,
      'platformFeesCollected': platformFeesCollected,
      'totalProducts': totalProducts,
      'activeProducts': activeProducts,
      'newProducts': newProducts,
      'totalAiInteractions': totalAiInteractions,
      'successfulAiResponses': successfulAiResponses,
      'aiResponseTime': aiResponseTime,
      'aiCostsIncurred': aiCostsIncurred,
      'whatsappMessages': whatsappMessages,
      'telegramMessages': telegramMessages,
      'totalConversations': totalConversations,
      'activeConversations': activeConversations,
      'fiatTransactions': fiatTransactions,
      'cryptoTransactions': cryptoTransactions,
      'fiatVolume': fiatVolume,
      'cryptoVolume': cryptoVolume,
      'freemiumVendors': freemiumVendors,
      'proVendors': proVendors,
      'proMaxVendors': proMaxVendors,
      'subscriptionRevenue': subscriptionRevenue,
      'churnRate': churnRate,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _PlatformAnalyticsImpl extends PlatformAnalytics {
  _PlatformAnalyticsImpl({
    _i1.UuidValue? id,
    required DateTime date,
    required String period,
    int? totalUsers,
    int? activeUsers,
    int? newUsers,
    int? totalCustomers,
    int? totalVendors,
    int? totalOrders,
    double? totalRevenue,
    double? averageOrderValue,
    double? platformFeesCollected,
    int? totalProducts,
    int? activeProducts,
    int? newProducts,
    int? totalAiInteractions,
    int? successfulAiResponses,
    double? aiResponseTime,
    double? aiCostsIncurred,
    int? whatsappMessages,
    int? telegramMessages,
    int? totalConversations,
    int? activeConversations,
    int? fiatTransactions,
    int? cryptoTransactions,
    double? fiatVolume,
    double? cryptoVolume,
    int? freemiumVendors,
    int? proVendors,
    int? proMaxVendors,
    double? subscriptionRevenue,
    double? churnRate,
    DateTime? createdAt,
  }) : super._(
          id: id,
          date: date,
          period: period,
          totalUsers: totalUsers,
          activeUsers: activeUsers,
          newUsers: newUsers,
          totalCustomers: totalCustomers,
          totalVendors: totalVendors,
          totalOrders: totalOrders,
          totalRevenue: totalRevenue,
          averageOrderValue: averageOrderValue,
          platformFeesCollected: platformFeesCollected,
          totalProducts: totalProducts,
          activeProducts: activeProducts,
          newProducts: newProducts,
          totalAiInteractions: totalAiInteractions,
          successfulAiResponses: successfulAiResponses,
          aiResponseTime: aiResponseTime,
          aiCostsIncurred: aiCostsIncurred,
          whatsappMessages: whatsappMessages,
          telegramMessages: telegramMessages,
          totalConversations: totalConversations,
          activeConversations: activeConversations,
          fiatTransactions: fiatTransactions,
          cryptoTransactions: cryptoTransactions,
          fiatVolume: fiatVolume,
          cryptoVolume: cryptoVolume,
          freemiumVendors: freemiumVendors,
          proVendors: proVendors,
          proMaxVendors: proMaxVendors,
          subscriptionRevenue: subscriptionRevenue,
          churnRate: churnRate,
          createdAt: createdAt,
        );

  /// Returns a shallow copy of this [PlatformAnalytics]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PlatformAnalytics copyWith({
    _i1.UuidValue? id,
    DateTime? date,
    String? period,
    int? totalUsers,
    int? activeUsers,
    int? newUsers,
    int? totalCustomers,
    int? totalVendors,
    int? totalOrders,
    double? totalRevenue,
    double? averageOrderValue,
    double? platformFeesCollected,
    int? totalProducts,
    int? activeProducts,
    int? newProducts,
    int? totalAiInteractions,
    int? successfulAiResponses,
    double? aiResponseTime,
    double? aiCostsIncurred,
    int? whatsappMessages,
    int? telegramMessages,
    int? totalConversations,
    int? activeConversations,
    int? fiatTransactions,
    int? cryptoTransactions,
    double? fiatVolume,
    double? cryptoVolume,
    int? freemiumVendors,
    int? proVendors,
    int? proMaxVendors,
    double? subscriptionRevenue,
    double? churnRate,
    DateTime? createdAt,
  }) {
    return PlatformAnalytics(
      id: id ?? this.id,
      date: date ?? this.date,
      period: period ?? this.period,
      totalUsers: totalUsers ?? this.totalUsers,
      activeUsers: activeUsers ?? this.activeUsers,
      newUsers: newUsers ?? this.newUsers,
      totalCustomers: totalCustomers ?? this.totalCustomers,
      totalVendors: totalVendors ?? this.totalVendors,
      totalOrders: totalOrders ?? this.totalOrders,
      totalRevenue: totalRevenue ?? this.totalRevenue,
      averageOrderValue: averageOrderValue ?? this.averageOrderValue,
      platformFeesCollected:
          platformFeesCollected ?? this.platformFeesCollected,
      totalProducts: totalProducts ?? this.totalProducts,
      activeProducts: activeProducts ?? this.activeProducts,
      newProducts: newProducts ?? this.newProducts,
      totalAiInteractions: totalAiInteractions ?? this.totalAiInteractions,
      successfulAiResponses:
          successfulAiResponses ?? this.successfulAiResponses,
      aiResponseTime: aiResponseTime ?? this.aiResponseTime,
      aiCostsIncurred: aiCostsIncurred ?? this.aiCostsIncurred,
      whatsappMessages: whatsappMessages ?? this.whatsappMessages,
      telegramMessages: telegramMessages ?? this.telegramMessages,
      totalConversations: totalConversations ?? this.totalConversations,
      activeConversations: activeConversations ?? this.activeConversations,
      fiatTransactions: fiatTransactions ?? this.fiatTransactions,
      cryptoTransactions: cryptoTransactions ?? this.cryptoTransactions,
      fiatVolume: fiatVolume ?? this.fiatVolume,
      cryptoVolume: cryptoVolume ?? this.cryptoVolume,
      freemiumVendors: freemiumVendors ?? this.freemiumVendors,
      proVendors: proVendors ?? this.proVendors,
      proMaxVendors: proMaxVendors ?? this.proMaxVendors,
      subscriptionRevenue: subscriptionRevenue ?? this.subscriptionRevenue,
      churnRate: churnRate ?? this.churnRate,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
