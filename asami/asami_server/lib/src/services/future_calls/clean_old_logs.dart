import 'package:asami_server/src/generated/protocol.dart';
import 'package:asami_server/src/services/future_calls/usage_enums.dart';
import 'package:serverpod/serverpod.dart';

/// Cleanup old logs future call - Runs weekly
class CleanupOldLogsCall extends FutureCall<EmptyModel> {
  @override
  Future<void> invoke(Session session, SerializableModel? object) async {
    try {
      session.log('🧹 Starting cleanup of old usage logs');
      
      final cutoffDate = DateTime.now().subtract(Duration(days: 90));

      // Delete old tool usage logs (keep 90 days)
      final deletedLogs = await ToolUsageLog.db.deleteWhere(
        session,
        where: (t) => t.createdAt.between(
          DateTime(2000, 1, 1),
          cutoffDate,
        ),
      );

      // Delete old limit breach logs (keep 90 days)
      final deletedBreaches = await LimitBreachLog.db.deleteWhere(
        session,
        where: (t) => t.breachedAt.between(
          DateTime(2000, 1, 1),
          cutoffDate,
        ),
      );

      // Delete old usage alerts (keep 30 days)
      final thirtyDaysAgo = DateTime.now().subtract(Duration(days: 30));
      final deletedAlerts = await UsageAlert.db.deleteWhere(
        session,
        where: (t) => t.createdAt.between(
          DateTime(2000, 1, 1),
          thirtyDaysAgo,
        ) & t.isRead.equals(true),
      );

      session.log('✅ Cleanup completed');
      session.log('   Tool logs deleted: $deletedLogs');
      session.log('   Breaches deleted: $deletedBreaches');
      session.log('   Alerts deleted: $deletedAlerts');

      // Schedule next cleanup in 7 days
      await session.serverpod.futureCallWithDelay(
        UsageFutureCallNames.cleanupOldLogs.name,
        EmptyModel(),
        Duration(days: 7),
      );
    } catch (e, stackTrace) {
      session.log('❌ Cleanup task failed: $e', stackTrace: stackTrace);
      // Retry in 1 day on failure
      await session.serverpod.futureCallWithDelay(
        UsageFutureCallNames.cleanupOldLogs.name,
        EmptyModel(),
        Duration(days: 1),
      );
    }
  }
}