import 'package:asami_server/src/endpoints/usage_endpoint.dart';
import 'package:asami_server/src/generated/protocol.dart';
import 'package:asami_server/src/services/usage_calls/usage_enums.dart';
import 'package:serverpod/serverpod.dart';

/// Monthly billing future call - Runs on 1st of each month
class MonthlyBillingCall extends FutureCall<EmptyModel> {
  @override
  Future<void> invoke(Session session, SerializableModel? object) async {
    try {
      session.log('💰 Starting monthly billing task');
      final startTime = DateTime.now();

      // Get all active vendors
      final vendors = await VendorProfile.db.find(
        session,
        where: (t) => t.subscriptionTier.notEquals(SubscriptionTier.freemium),
      );

      session.log('Found ${vendors.length} vendors to bill');

      int successCount = 0;
      int failureCount = 0;

      for (var vendor in vendors) {
        try {
          await UsageEndpoint().generateMonthlyBilling(
            session: session,
            vendorId: vendor.userId.uuid,
          );
          successCount++;
        } catch (e) {
          session.log('Failed to bill vendor ${vendor.userId.uuid}: $e');
          failureCount++;
        }
      }

      final duration = DateTime.now().difference(startTime);
      session.log('✅ Monthly billing completed in ${duration.inSeconds}s');
      session.log('   Success: $successCount, Failures: $failureCount');

      // Schedule next month's billing
      await _scheduleNextMonthlyBilling(session);
    } catch (e, stackTrace) {
      session.log('❌ Monthly billing task failed: $e', stackTrace: stackTrace);
      // Retry in 1 day on failure
      await session.serverpod.futureCallWithDelay(
        UsageFutureCallNames.monthlyBilling.name,
        EmptyModel(),
        Duration(days: 1),
      );
    }
  }

  static Future<void> _scheduleNextMonthlyBilling(Session session) async {
    final now = DateTime.now();
    final nextMonth = DateTime(now.year, now.month + 1, 1, 1); // 1st day at 1 AM
    final delay = nextMonth.difference(now);

    await session.serverpod.futureCallWithDelay(
      UsageFutureCallNames.monthlyBilling.name,
      EmptyModel(),
      delay,
    );
  }
}
