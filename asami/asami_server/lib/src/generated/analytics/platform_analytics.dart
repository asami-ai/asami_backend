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
import 'package:serverpod/serverpod.dart' as _i1;

abstract class PlatformAnalytics
    implements _i1.TableRow<_i1.UuidValue>, _i1.ProtocolSerialization {
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
  }) : id = id ?? _i1.Uuid().v4obj(),
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
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      date: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['date']),
      period: jsonSerialization['period'] as String,
      totalUsers: jsonSerialization['totalUsers'] as int?,
      activeUsers: jsonSerialization['activeUsers'] as int?,
      newUsers: jsonSerialization['newUsers'] as int?,
      totalCustomers: jsonSerialization['totalCustomers'] as int?,
      totalVendors: jsonSerialization['totalVendors'] as int?,
      totalOrders: jsonSerialization['totalOrders'] as int?,
      totalRevenue: (jsonSerialization['totalRevenue'] as num?)?.toDouble(),
      averageOrderValue: (jsonSerialization['averageOrderValue'] as num?)
          ?.toDouble(),
      platformFeesCollected:
          (jsonSerialization['platformFeesCollected'] as num?)?.toDouble(),
      totalProducts: jsonSerialization['totalProducts'] as int?,
      activeProducts: jsonSerialization['activeProducts'] as int?,
      newProducts: jsonSerialization['newProducts'] as int?,
      totalAiInteractions: jsonSerialization['totalAiInteractions'] as int?,
      successfulAiResponses: jsonSerialization['successfulAiResponses'] as int?,
      aiResponseTime: (jsonSerialization['aiResponseTime'] as num?)?.toDouble(),
      aiCostsIncurred: (jsonSerialization['aiCostsIncurred'] as num?)
          ?.toDouble(),
      whatsappMessages: jsonSerialization['whatsappMessages'] as int?,
      telegramMessages: jsonSerialization['telegramMessages'] as int?,
      totalConversations: jsonSerialization['totalConversations'] as int?,
      activeConversations: jsonSerialization['activeConversations'] as int?,
      fiatTransactions: jsonSerialization['fiatTransactions'] as int?,
      cryptoTransactions: jsonSerialization['cryptoTransactions'] as int?,
      fiatVolume: (jsonSerialization['fiatVolume'] as num?)?.toDouble(),
      cryptoVolume: (jsonSerialization['cryptoVolume'] as num?)?.toDouble(),
      freemiumVendors: jsonSerialization['freemiumVendors'] as int?,
      proVendors: jsonSerialization['proVendors'] as int?,
      proMaxVendors: jsonSerialization['proMaxVendors'] as int?,
      subscriptionRevenue: (jsonSerialization['subscriptionRevenue'] as num?)
          ?.toDouble(),
      churnRate: (jsonSerialization['churnRate'] as num?)?.toDouble(),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  static final t = PlatformAnalyticsTable();

  static const db = PlatformAnalyticsRepository._();

  @override
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

  @override
  _i1.Table<_i1.UuidValue> get table => t;

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
      '__className__': 'PlatformAnalytics',
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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'PlatformAnalytics',
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

  static PlatformAnalyticsInclude include() {
    return PlatformAnalyticsInclude._();
  }

  static PlatformAnalyticsIncludeList includeList({
    _i1.WhereExpressionBuilder<PlatformAnalyticsTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PlatformAnalyticsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PlatformAnalyticsTable>? orderByList,
    PlatformAnalyticsInclude? include,
  }) {
    return PlatformAnalyticsIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PlatformAnalytics.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(PlatformAnalytics.t),
      include: include,
    );
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

class PlatformAnalyticsUpdateTable
    extends _i1.UpdateTable<PlatformAnalyticsTable> {
  PlatformAnalyticsUpdateTable(super.table);

  _i1.ColumnValue<DateTime, DateTime> date(DateTime value) => _i1.ColumnValue(
    table.date,
    value,
  );

  _i1.ColumnValue<String, String> period(String value) => _i1.ColumnValue(
    table.period,
    value,
  );

  _i1.ColumnValue<int, int> totalUsers(int value) => _i1.ColumnValue(
    table.totalUsers,
    value,
  );

  _i1.ColumnValue<int, int> activeUsers(int value) => _i1.ColumnValue(
    table.activeUsers,
    value,
  );

  _i1.ColumnValue<int, int> newUsers(int value) => _i1.ColumnValue(
    table.newUsers,
    value,
  );

  _i1.ColumnValue<int, int> totalCustomers(int value) => _i1.ColumnValue(
    table.totalCustomers,
    value,
  );

  _i1.ColumnValue<int, int> totalVendors(int value) => _i1.ColumnValue(
    table.totalVendors,
    value,
  );

  _i1.ColumnValue<int, int> totalOrders(int value) => _i1.ColumnValue(
    table.totalOrders,
    value,
  );

  _i1.ColumnValue<double, double> totalRevenue(double value) => _i1.ColumnValue(
    table.totalRevenue,
    value,
  );

  _i1.ColumnValue<double, double> averageOrderValue(double value) =>
      _i1.ColumnValue(
        table.averageOrderValue,
        value,
      );

  _i1.ColumnValue<double, double> platformFeesCollected(double value) =>
      _i1.ColumnValue(
        table.platformFeesCollected,
        value,
      );

  _i1.ColumnValue<int, int> totalProducts(int value) => _i1.ColumnValue(
    table.totalProducts,
    value,
  );

  _i1.ColumnValue<int, int> activeProducts(int value) => _i1.ColumnValue(
    table.activeProducts,
    value,
  );

  _i1.ColumnValue<int, int> newProducts(int value) => _i1.ColumnValue(
    table.newProducts,
    value,
  );

  _i1.ColumnValue<int, int> totalAiInteractions(int value) => _i1.ColumnValue(
    table.totalAiInteractions,
    value,
  );

  _i1.ColumnValue<int, int> successfulAiResponses(int value) => _i1.ColumnValue(
    table.successfulAiResponses,
    value,
  );

  _i1.ColumnValue<double, double> aiResponseTime(double value) =>
      _i1.ColumnValue(
        table.aiResponseTime,
        value,
      );

  _i1.ColumnValue<double, double> aiCostsIncurred(double value) =>
      _i1.ColumnValue(
        table.aiCostsIncurred,
        value,
      );

  _i1.ColumnValue<int, int> whatsappMessages(int value) => _i1.ColumnValue(
    table.whatsappMessages,
    value,
  );

  _i1.ColumnValue<int, int> telegramMessages(int value) => _i1.ColumnValue(
    table.telegramMessages,
    value,
  );

  _i1.ColumnValue<int, int> totalConversations(int value) => _i1.ColumnValue(
    table.totalConversations,
    value,
  );

  _i1.ColumnValue<int, int> activeConversations(int value) => _i1.ColumnValue(
    table.activeConversations,
    value,
  );

  _i1.ColumnValue<int, int> fiatTransactions(int value) => _i1.ColumnValue(
    table.fiatTransactions,
    value,
  );

  _i1.ColumnValue<int, int> cryptoTransactions(int value) => _i1.ColumnValue(
    table.cryptoTransactions,
    value,
  );

  _i1.ColumnValue<double, double> fiatVolume(double value) => _i1.ColumnValue(
    table.fiatVolume,
    value,
  );

  _i1.ColumnValue<double, double> cryptoVolume(double value) => _i1.ColumnValue(
    table.cryptoVolume,
    value,
  );

  _i1.ColumnValue<int, int> freemiumVendors(int value) => _i1.ColumnValue(
    table.freemiumVendors,
    value,
  );

  _i1.ColumnValue<int, int> proVendors(int value) => _i1.ColumnValue(
    table.proVendors,
    value,
  );

  _i1.ColumnValue<int, int> proMaxVendors(int value) => _i1.ColumnValue(
    table.proMaxVendors,
    value,
  );

  _i1.ColumnValue<double, double> subscriptionRevenue(double value) =>
      _i1.ColumnValue(
        table.subscriptionRevenue,
        value,
      );

  _i1.ColumnValue<double, double> churnRate(double value) => _i1.ColumnValue(
    table.churnRate,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );
}

class PlatformAnalyticsTable extends _i1.Table<_i1.UuidValue> {
  PlatformAnalyticsTable({super.tableRelation})
    : super(tableName: 'platform_analytics') {
    updateTable = PlatformAnalyticsUpdateTable(this);
    date = _i1.ColumnDateTime(
      'date',
      this,
    );
    period = _i1.ColumnString(
      'period',
      this,
    );
    totalUsers = _i1.ColumnInt(
      'totalUsers',
      this,
      hasDefault: true,
    );
    activeUsers = _i1.ColumnInt(
      'activeUsers',
      this,
      hasDefault: true,
    );
    newUsers = _i1.ColumnInt(
      'newUsers',
      this,
      hasDefault: true,
    );
    totalCustomers = _i1.ColumnInt(
      'totalCustomers',
      this,
      hasDefault: true,
    );
    totalVendors = _i1.ColumnInt(
      'totalVendors',
      this,
      hasDefault: true,
    );
    totalOrders = _i1.ColumnInt(
      'totalOrders',
      this,
      hasDefault: true,
    );
    totalRevenue = _i1.ColumnDouble(
      'totalRevenue',
      this,
      hasDefault: true,
    );
    averageOrderValue = _i1.ColumnDouble(
      'averageOrderValue',
      this,
      hasDefault: true,
    );
    platformFeesCollected = _i1.ColumnDouble(
      'platformFeesCollected',
      this,
      hasDefault: true,
    );
    totalProducts = _i1.ColumnInt(
      'totalProducts',
      this,
      hasDefault: true,
    );
    activeProducts = _i1.ColumnInt(
      'activeProducts',
      this,
      hasDefault: true,
    );
    newProducts = _i1.ColumnInt(
      'newProducts',
      this,
      hasDefault: true,
    );
    totalAiInteractions = _i1.ColumnInt(
      'totalAiInteractions',
      this,
      hasDefault: true,
    );
    successfulAiResponses = _i1.ColumnInt(
      'successfulAiResponses',
      this,
      hasDefault: true,
    );
    aiResponseTime = _i1.ColumnDouble(
      'aiResponseTime',
      this,
      hasDefault: true,
    );
    aiCostsIncurred = _i1.ColumnDouble(
      'aiCostsIncurred',
      this,
      hasDefault: true,
    );
    whatsappMessages = _i1.ColumnInt(
      'whatsappMessages',
      this,
      hasDefault: true,
    );
    telegramMessages = _i1.ColumnInt(
      'telegramMessages',
      this,
      hasDefault: true,
    );
    totalConversations = _i1.ColumnInt(
      'totalConversations',
      this,
      hasDefault: true,
    );
    activeConversations = _i1.ColumnInt(
      'activeConversations',
      this,
      hasDefault: true,
    );
    fiatTransactions = _i1.ColumnInt(
      'fiatTransactions',
      this,
      hasDefault: true,
    );
    cryptoTransactions = _i1.ColumnInt(
      'cryptoTransactions',
      this,
      hasDefault: true,
    );
    fiatVolume = _i1.ColumnDouble(
      'fiatVolume',
      this,
      hasDefault: true,
    );
    cryptoVolume = _i1.ColumnDouble(
      'cryptoVolume',
      this,
      hasDefault: true,
    );
    freemiumVendors = _i1.ColumnInt(
      'freemiumVendors',
      this,
      hasDefault: true,
    );
    proVendors = _i1.ColumnInt(
      'proVendors',
      this,
      hasDefault: true,
    );
    proMaxVendors = _i1.ColumnInt(
      'proMaxVendors',
      this,
      hasDefault: true,
    );
    subscriptionRevenue = _i1.ColumnDouble(
      'subscriptionRevenue',
      this,
      hasDefault: true,
    );
    churnRate = _i1.ColumnDouble(
      'churnRate',
      this,
      hasDefault: true,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
  }

  late final PlatformAnalyticsUpdateTable updateTable;

  late final _i1.ColumnDateTime date;

  late final _i1.ColumnString period;

  late final _i1.ColumnInt totalUsers;

  late final _i1.ColumnInt activeUsers;

  late final _i1.ColumnInt newUsers;

  late final _i1.ColumnInt totalCustomers;

  late final _i1.ColumnInt totalVendors;

  late final _i1.ColumnInt totalOrders;

  late final _i1.ColumnDouble totalRevenue;

  late final _i1.ColumnDouble averageOrderValue;

  late final _i1.ColumnDouble platformFeesCollected;

  late final _i1.ColumnInt totalProducts;

  late final _i1.ColumnInt activeProducts;

  late final _i1.ColumnInt newProducts;

  late final _i1.ColumnInt totalAiInteractions;

  late final _i1.ColumnInt successfulAiResponses;

  late final _i1.ColumnDouble aiResponseTime;

  late final _i1.ColumnDouble aiCostsIncurred;

  late final _i1.ColumnInt whatsappMessages;

  late final _i1.ColumnInt telegramMessages;

  late final _i1.ColumnInt totalConversations;

  late final _i1.ColumnInt activeConversations;

  late final _i1.ColumnInt fiatTransactions;

  late final _i1.ColumnInt cryptoTransactions;

  late final _i1.ColumnDouble fiatVolume;

  late final _i1.ColumnDouble cryptoVolume;

  late final _i1.ColumnInt freemiumVendors;

  late final _i1.ColumnInt proVendors;

  late final _i1.ColumnInt proMaxVendors;

  late final _i1.ColumnDouble subscriptionRevenue;

  late final _i1.ColumnDouble churnRate;

  late final _i1.ColumnDateTime createdAt;

  @override
  List<_i1.Column> get columns => [
    id,
    date,
    period,
    totalUsers,
    activeUsers,
    newUsers,
    totalCustomers,
    totalVendors,
    totalOrders,
    totalRevenue,
    averageOrderValue,
    platformFeesCollected,
    totalProducts,
    activeProducts,
    newProducts,
    totalAiInteractions,
    successfulAiResponses,
    aiResponseTime,
    aiCostsIncurred,
    whatsappMessages,
    telegramMessages,
    totalConversations,
    activeConversations,
    fiatTransactions,
    cryptoTransactions,
    fiatVolume,
    cryptoVolume,
    freemiumVendors,
    proVendors,
    proMaxVendors,
    subscriptionRevenue,
    churnRate,
    createdAt,
  ];
}

class PlatformAnalyticsInclude extends _i1.IncludeObject {
  PlatformAnalyticsInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<_i1.UuidValue> get table => PlatformAnalytics.t;
}

class PlatformAnalyticsIncludeList extends _i1.IncludeList {
  PlatformAnalyticsIncludeList._({
    _i1.WhereExpressionBuilder<PlatformAnalyticsTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(PlatformAnalytics.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue> get table => PlatformAnalytics.t;
}

class PlatformAnalyticsRepository {
  const PlatformAnalyticsRepository._();

  /// Returns a list of [PlatformAnalytics]s matching the given query parameters.
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
  Future<List<PlatformAnalytics>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PlatformAnalyticsTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PlatformAnalyticsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PlatformAnalyticsTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<PlatformAnalytics>(
      where: where?.call(PlatformAnalytics.t),
      orderBy: orderBy?.call(PlatformAnalytics.t),
      orderByList: orderByList?.call(PlatformAnalytics.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [PlatformAnalytics] matching the given query parameters.
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
  Future<PlatformAnalytics?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PlatformAnalyticsTable>? where,
    int? offset,
    _i1.OrderByBuilder<PlatformAnalyticsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PlatformAnalyticsTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<PlatformAnalytics>(
      where: where?.call(PlatformAnalytics.t),
      orderBy: orderBy?.call(PlatformAnalytics.t),
      orderByList: orderByList?.call(PlatformAnalytics.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [PlatformAnalytics] by its [id] or null if no such row exists.
  Future<PlatformAnalytics?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<PlatformAnalytics>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [PlatformAnalytics]s in the list and returns the inserted rows.
  ///
  /// The returned [PlatformAnalytics]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<PlatformAnalytics>> insert(
    _i1.Session session,
    List<PlatformAnalytics> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<PlatformAnalytics>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [PlatformAnalytics] and returns the inserted row.
  ///
  /// The returned [PlatformAnalytics] will have its `id` field set.
  Future<PlatformAnalytics> insertRow(
    _i1.Session session,
    PlatformAnalytics row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<PlatformAnalytics>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [PlatformAnalytics]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<PlatformAnalytics>> update(
    _i1.Session session,
    List<PlatformAnalytics> rows, {
    _i1.ColumnSelections<PlatformAnalyticsTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<PlatformAnalytics>(
      rows,
      columns: columns?.call(PlatformAnalytics.t),
      transaction: transaction,
    );
  }

  /// Updates a single [PlatformAnalytics]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<PlatformAnalytics> updateRow(
    _i1.Session session,
    PlatformAnalytics row, {
    _i1.ColumnSelections<PlatformAnalyticsTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<PlatformAnalytics>(
      row,
      columns: columns?.call(PlatformAnalytics.t),
      transaction: transaction,
    );
  }

  /// Updates a single [PlatformAnalytics] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<PlatformAnalytics?> updateById(
    _i1.Session session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<PlatformAnalyticsUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<PlatformAnalytics>(
      id,
      columnValues: columnValues(PlatformAnalytics.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [PlatformAnalytics]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<PlatformAnalytics>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<PlatformAnalyticsUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<PlatformAnalyticsTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PlatformAnalyticsTable>? orderBy,
    _i1.OrderByListBuilder<PlatformAnalyticsTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<PlatformAnalytics>(
      columnValues: columnValues(PlatformAnalytics.t.updateTable),
      where: where(PlatformAnalytics.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PlatformAnalytics.t),
      orderByList: orderByList?.call(PlatformAnalytics.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [PlatformAnalytics]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<PlatformAnalytics>> delete(
    _i1.Session session,
    List<PlatformAnalytics> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<PlatformAnalytics>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [PlatformAnalytics].
  Future<PlatformAnalytics> deleteRow(
    _i1.Session session,
    PlatformAnalytics row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<PlatformAnalytics>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<PlatformAnalytics>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PlatformAnalyticsTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<PlatformAnalytics>(
      where: where(PlatformAnalytics.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PlatformAnalyticsTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<PlatformAnalytics>(
      where: where?.call(PlatformAnalytics.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
