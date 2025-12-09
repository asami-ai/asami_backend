
import 'package:serverpod/serverpod.dart';
import 'dart:convert';

/// Manages AI response caching using Serverpod's Redis
class AICacheManager {
  /// Get cached response
  Future<Map<String, dynamic>?> get(Session session, String key) async {
    try {
      final cached = await session.serverpod.redisController?.get(key);
      if (cached == null) return null;
      
      return jsonDecode(cached) as Map<String, dynamic>;
    } catch (e) {
      print('⚠️ Cache get error: $e');
      return null;
    }
  }

  /// Set cached response
  Future<void> set(
    Session session,
    String key,
    Map<String, dynamic> value, {
    int ttl = 600, // Default 10 minutes
  }) async {
    try {
      await session.serverpod.redisController?.set(
        key,
        jsonEncode(value),
        lifetime: Duration(minutes: 600)
      );
    } catch (e) {
      print('⚠️ Cache set error: $e');
    }
  }

  /// Delete cached response
  Future<void> delete(Session session, String key) async {
    try {
      await session.serverpod.redisController?.del(key);
    } catch (e) {
      print('⚠️ Cache delete error: $e');
    }
  }

  /// Clear all AI caches
  Future<void> clearAll(Session session) async {
    try {
      final keys = await session.serverpod.redisController?.clear();
    } catch (e) {
      print('⚠️ Cache clear error: $e');
    }
  }
}