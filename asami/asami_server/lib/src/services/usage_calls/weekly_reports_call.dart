
import 'package:asami_server/src/generated/protocol.dart';
import 'package:asami_server/src/services/usage_calls/usage_enums.dart';
import 'package:serverpod/serverpod.dart';

/// Weekly usage reports future call - Runs weekly on Monday
class WeeklyUsageReportsCall extends FutureCall<EmptyModel> {
  @override
  Future<void> invoke(Session session, SerializableModel? object) async {
    try {
      session.log('📧 Starting weekly usage reports');
      
      // Get all vendors
      final vendors = await VendorProfile.db.find(session);

      for (var vendor in vendors) {
        await _generateWeeklyReport(session, vendor);
      }

      session.log('✅ Weekly reports sent');

      // Schedule next week's report
      await _scheduleNextWeeklyReport(session);
    } catch (e, stackTrace) {
      session.log('❌ Weekly reports failed: $e', stackTrace: stackTrace);
      // Retry in 1 day on failure
      await session.serverpod.futureCallWithDelay(
        UsageFutureCallNames.weeklyUsageReports.name,
        EmptyModel(),
        Duration(days: 1),
      );
    }
  }

  static Future<void> _generateWeeklyReport(
    Session session,
    VendorProfile vendor,
  ) async {
    try {
      final now = DateTime.now();
      final weekAgo = now.subtract(Duration(days: 7));

      final toolUsage = await ToolUsageLog.db.find(
        session,
        where: (t) => t.userId.equals(vendor.userId) &
                     t.createdAt.between(weekAgo, now),
      );

      session.log('Generated report for ${vendor.businessName}: ${toolUsage.length} tool calls');
    } catch (e) {
      session.log('Error generating report for vendor ${vendor.userId.uuid}: $e');
    }
  }

  static Future<void> _scheduleNextWeeklyReport(Session session) async {
    final now = DateTime.now();
    // Calculate next Monday at 9 AM
    final daysUntilMonday = (DateTime.monday - now.weekday + 7) % 7;
    final nextMonday = DateTime(
      now.year,
      now.month,
      now.day + (daysUntilMonday == 0 ? 7 : daysUntilMonday),
      9, // 9 AM
    );
    final delay = nextMonday.difference(now);

    await session.serverpod.futureCallWithDelay(
      UsageFutureCallNames.weeklyUsageReports.name,
      EmptyModel(),
      delay,
    );
  }
}
