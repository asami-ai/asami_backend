import 'package:asami_server/src/generated/protocol.dart';
import 'package:asami_server/src/services/wallet/escrow_automation_service.dart';
import 'package:serverpod/serverpod.dart';

/// Automated task to process escrow releases and delivery deadlines
class EscrowAutomationTask extends FutureCall<EmptyModel> {
  /// Run escrow automation (call this every hour via cron)
  @override
  Future<void> invoke(Session session, EmptyModel? object) async {
    session.log('🤖 Running escrow automation...');
    
    try {
      // 1. Process scheduled escrow releases
      final releasedCount = await EscrowAutomationService.processScheduledReleases(session);
      
      if (releasedCount > 0) {
        session.log('💰 Released $releasedCount escrows');
      }
      
      // 2. Check delivery deadlines and process expired orders
      final expiredCount = await EscrowAutomationService.processExpiredDeliveries(session);
      
      if (expiredCount > 0) {
        session.log('⚠️ Processed $expiredCount expired deliveries');
      }
      
      session.log('✅ Escrow automation completed');
    } catch (e, stackTrace) {
      session.log('❌ Escrow automation error: $e', stackTrace: stackTrace);
    }
  }
}
