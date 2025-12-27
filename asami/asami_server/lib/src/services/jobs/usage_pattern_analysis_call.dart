import 'package:asami_server/src/generated/protocol.dart';
import 'package:asami_server/src/services/jobs/usage_enums.dart';
import 'package:serverpod/serverpod.dart';

/// Usage pattern analysis future call - Runs every 6 hours
class UsagePatternAnalysisCall extends FutureCall<EmptyModel> {
  @override
  Future<void> invoke(Session session, SerializableModel? object) async {
    try {
      session.log('📊 Starting usage pattern analysis');
      
      // Get all customers with recent activity
      final now = DateTime.now();
      final sevenDaysAgo = now.subtract(Duration(days: 7));

      final recentUsage = await AIConversationUsage.db.find(
        session,
        where: (t) => t.date.between(sevenDaysAgo, now),
      );

      // Group by user
      final userUsageMap = <String, List<AIConversationUsage>>{};
      for (var usage in recentUsage) {
        final userId = usage.userId.uuid;
        userUsageMap.putIfAbsent(userId, () => []).add(usage);
      }

      session.log('Analyzing ${userUsageMap.length} users');

      for (var entry in userUsageMap.entries) {
        await _analyzeUserPattern(session, entry.key, entry.value);
      }

      session.log('✅ Usage pattern analysis completed');

      // Schedule next analysis in 6 hours
      await session.serverpod.futureCallWithDelay(
        UsageFutureCallNames.usagePatternAnalysis.name,
        EmptyModel(),
        Duration(hours: 6),
      );
    } catch (e, stackTrace) {
      session.log('❌ Usage pattern analysis failed: $e', stackTrace: stackTrace);
      // Retry in 1 hour on failure
      await session.serverpod.futureCallWithDelay(
        UsageFutureCallNames.usagePatternAnalysis.name,
        EmptyModel(),
        Duration(hours: 1),
      );
    }
  }

  static Future<void> _analyzeUserPattern(
    Session session,
    String userId,
    List<AIConversationUsage> usageHistory,
  ) async {
    try {
      // Calculate averages
      final totalMessages = usageHistory.fold<int>(
        0,
        (sum, usage) => sum + usage.messageCount,
      );
      final averageDaily = totalMessages / 7.0;

      final totalToolCalls = usageHistory.fold<int>(
        0,
        (sum, usage) => sum + usage.toolCallsInConversation,
      );
      final averageToolCalls = totalToolCalls / 7.0;

      // Determine usage class
      UsageClass usageClass;
      if (averageDaily < 20) {
        usageClass = UsageClass.light;
      } else if (averageDaily < 50) {
        usageClass = UsageClass.moderate;
      } else if (averageDaily < 100) {
        usageClass = UsageClass.heavy;
      } else if (averageDaily < 200) {
        usageClass = UsageClass.power_user;
      } else {
        usageClass = UsageClass.excessive;
      }

      // Calculate abuse score
      double abuseScore = 0.0;
      if (averageDaily > 200) abuseScore += 0.3;
      if (averageToolCalls > 50) abuseScore += 0.3;
      if (totalMessages > 1000) abuseScore += 0.4;

      final isAbuser = abuseScore >= 0.7;

      // Update or create pattern
      var pattern = await CustomerUsagePattern.db.findFirstRow(
        session,
        where: (t) => t.userId.equals(UuidValue.fromString(userId)),
      );

      if (pattern == null) {
        pattern = CustomerUsagePattern(
          id: Uuid().v4obj(),
          userId: UuidValue.fromString(userId),
          averageDailyMessages: averageDaily,
          averageDailyToolCalls: averageToolCalls,
          usageClass: usageClass,
          isAbuser: isAbuser,
          abuseScore: abuseScore,
          toolSuccessRate: 1.0,
          averageToolExecutionTime: 0.0,
          averageConversationLength: 0.0,
          repetitiveQueryScore: 0.0,
          shouldThrottle: isAbuser,
          currentThrottleDelay: isAbuser ? 5 : 0,
          lastAnalyzedAt: DateTime.now(),
          analysisCount: 1,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
        await CustomerUsagePattern.db.insertRow(session, pattern);
      } else {
        pattern.averageDailyMessages = averageDaily;
        pattern.averageDailyToolCalls = averageToolCalls;
        pattern.usageClass = usageClass;
        pattern.isAbuser = isAbuser;
        pattern.abuseScore = abuseScore;
        pattern.shouldThrottle = isAbuser;
        pattern.currentThrottleDelay = isAbuser ? 5 : 0;
        pattern.lastAnalyzedAt = DateTime.now();
        pattern.analysisCount++;
        pattern.updatedAt = DateTime.now();
        await CustomerUsagePattern.db.updateRow(session, pattern);
      }

      if (isAbuser) {
        session.log('⚠️ Abuse detected for user $userId (score: ${abuseScore.toStringAsFixed(2)})');
      }
    } catch (e) {
      session.log('Error analyzing pattern for user $userId: $e');
    }
  }
}
