import 'package:asami_server/src/endpoints/usage_endpoint.dart';
import 'package:asami_server/src/generated/protocol.dart';
import 'package:asami_server/src/services/jobs/usage_enums.dart';
import 'package:serverpod/server.dart';
import 'package:serverpod/serverpod.dart';

/// Daily reset future call - Runs at midnight
class DailyUsageResetCall extends FutureCall<EmptyModel> {
  @override
  Future<void> invoke(Session session, SerializableModel? object) async {
    try {
      session.log('🔄 Starting daily usage reset task');
      final startTime = DateTime.now();

      await UsageEndpoint().resetDailyLimits(session);

      final duration = DateTime.now().difference(startTime);
      session.log('✅ Daily reset completed in ${duration.inSeconds}s');

      // Schedule next day's reset
      await _scheduleNextDailyReset(session);
    } catch (e, stackTrace) {
      session.log('❌ Daily reset task failed: $e', stackTrace: stackTrace);
      // Retry in 1 hour on failure
      await session.serverpod.futureCallWithDelay(
        UsageFutureCallNames.dailyUsageReset.name,
        EmptyModel(),
        Duration(hours: 1),
      );
    }
  }

  static Future<void> _scheduleNextDailyReset(Session session) async {
    final now = DateTime.now();
    final tomorrow = DateTime(now.year, now.month, now.day + 1);
    final delay = tomorrow.difference(now);

    await session.serverpod.futureCallWithDelay(
      UsageFutureCallNames.dailyUsageReset.name,
      EmptyModel(),
      delay,
    );
  }
}
