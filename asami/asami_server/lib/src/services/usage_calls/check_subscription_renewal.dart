
import 'package:asami_server/src/generated/protocol.dart';
import 'package:asami_server/src/services/usage_calls/usage_enums.dart';
import 'package:serverpod/serverpod.dart';

/// Check subscription renewals future call - Runs daily
class CheckSubscriptionRenewalsCall extends FutureCall<EmptyModel> {
  @override
  Future<void> invoke(Session session, SerializableModel? object) async {
    try {
      session.log('🔔 Checking subscription renewals');
      
      final now = DateTime.now();
      final threeDaysFromNow = now.add(Duration(days: 3));

      // Find subscriptions expiring in 3 days
      final expiringSubscriptions = await Subscription.db.find(
        session,
        where: (t) => t.currentPeriodEnd.between(now, threeDaysFromNow) &
                     t.status.equals('active'),
      );

      session.log('Found ${expiringSubscriptions.length} subscriptions expiring soon');

      for (var subscription in expiringSubscriptions) {
        if (subscription.autoRenew) {
          // TODO: Process renewal
          session.log('Auto-renewing subscription: ${subscription.id.uuid}');
        } else {
          // Send expiration warning
          session.log('Sending expiration warning: ${subscription.id.uuid}');
        }
      }

      session.log('✅ Subscription renewals checked');

      // Schedule next check in 24 hours
      await session.serverpod.futureCallWithDelay(
        UsageFutureCallNames.checkSubscriptionRenewals.name,
        EmptyModel(),
        Duration(hours: 24),
      );
    } catch (e, stackTrace) {
      session.log('❌ Subscription renewals check failed: $e', stackTrace: stackTrace);
      // Retry in 1 hour on failure
      await session.serverpod.futureCallWithDelay(
        UsageFutureCallNames.checkSubscriptionRenewals.name,
        EmptyModel(),
        Duration(hours: 1),
      );
    }
  }
}
