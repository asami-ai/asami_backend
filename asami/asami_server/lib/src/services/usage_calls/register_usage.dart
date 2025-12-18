
import 'package:asami_server/src/generated/protocol.dart';
import 'package:asami_server/src/services/usage_calls/check_subscription_renewal.dart';
import 'package:asami_server/src/services/usage_calls/clean_old_logs.dart';
import 'package:asami_server/src/services/usage_calls/daily_usage_calls.dart';
import 'package:asami_server/src/services/usage_calls/monthly_usage.dart';
import 'package:asami_server/src/services/usage_calls/usage_enums.dart';
import 'package:asami_server/src/services/usage_calls/usage_pattern_analysis_call.dart';
import 'package:asami_server/src/services/usage_calls/weekly_reports_call.dart';
import 'package:serverpod/serverpod.dart';

/// Register all usage tracking future calls
/// Add this to your lib/server.dart after starting the server
Future<void> registerUsageFutureCalls(Serverpod pod) async {
  // Register future call handlers
  pod.registerFutureCall(
    DailyUsageResetCall(),
    UsageFutureCallNames.dailyUsageReset.name,
  );

  pod.registerFutureCall(
    MonthlyBillingCall(),
    UsageFutureCallNames.monthlyBilling.name,
  );

  pod.registerFutureCall(
    UsagePatternAnalysisCall(),
    UsageFutureCallNames.usagePatternAnalysis.name,
  );

  pod.registerFutureCall(
    CleanupOldLogsCall(),
    UsageFutureCallNames.cleanupOldLogs.name,
  );

  pod.registerFutureCall(
    WeeklyUsageReportsCall(),
    UsageFutureCallNames.weeklyUsageReports.name,
  );

  pod.registerFutureCall(
    CheckSubscriptionRenewalsCall(),
    UsageFutureCallNames.checkSubscriptionRenewals.name,
  );

  // Schedule initial future calls
  await _scheduleInitialCalls(pod);
}

/// Schedule initial future calls on server startup
Future<void> _scheduleInitialCalls(Serverpod pod) async {
  final now = DateTime.now();

  // Schedule daily reset for tomorrow midnight
  final tomorrow = DateTime(now.year, now.month, now.day + 1);
  await pod.futureCallAtTime(
    UsageFutureCallNames.dailyUsageReset.name,
    EmptyModel(),
    tomorrow,
  );

  // Schedule monthly billing for next 1st of month at 1 AM
  final nextMonth = DateTime(now.year, now.month + 1, 1, 1);
  await pod.futureCallAtTime(
    UsageFutureCallNames.monthlyBilling.name,
    EmptyModel(),
    nextMonth,
  );

  // Schedule usage pattern analysis to start immediately and repeat every 6 hours
  await pod.futureCallWithDelay(
    UsageFutureCallNames.usagePatternAnalysis.name,
    EmptyModel(),
    Duration(seconds: 10),
  );

  // Schedule cleanup for next Sunday at 2 AM
  final daysUntilSunday = (DateTime.sunday - now.weekday + 7) % 7;
  final nextSunday = DateTime(
    now.year,
    now.month,
    now.day + (daysUntilSunday == 0 ? 7 : daysUntilSunday),
    2, // 2 AM
  );
  await pod.futureCallAtTime(
    UsageFutureCallNames.cleanupOldLogs.name,
    EmptyModel(),
    nextSunday,
  );

  // Schedule weekly reports for next Monday at 9 AM
  final daysUntilMonday = (DateTime.monday - now.weekday + 7) % 7;
  final nextMonday = DateTime(
    now.year,
    now.month,
    now.day + (daysUntilMonday == 0 ? 7 : daysUntilMonday),
    9, // 9 AM
  );
  await pod.futureCallAtTime(
    UsageFutureCallNames.weeklyUsageReports.name,
    EmptyModel(),
    nextMonday,
  );

  // Schedule subscription renewals check to run daily at 10 AM
  final tenAMToday = DateTime(now.year, now.month, now.day, 10);
  final firstRenewalCheck = now.hour < 10 ? tenAMToday : tenAMToday.add(Duration(days: 1));
  await pod.futureCallAtTime(
    UsageFutureCallNames.checkSubscriptionRenewals.name,
    EmptyModel(),
    firstRenewalCheck,
  );
}
