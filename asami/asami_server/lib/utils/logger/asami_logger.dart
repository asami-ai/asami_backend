// File: server/lib/src/utils/logger_helper.dart

import 'package:serverpod/serverpod.dart';

class PLoggerHelper {
  // Store session for logging (will be set during request handling)
  static Session? _currentSession;

  // Set the current session (call this at the start of each request)
  static void setSession(Session session) {
    _currentSession = session;
  }

  // Helper to log with session or fallback to print
  static void _log(String message, {LogLevel level = LogLevel.info}) {
    if (_currentSession != null) {
      _currentSession!.log(message, level: level);
    } else {
      // Fallback to print if no session available (startup logs)
      print(message);
    }
  }

  // 🐛 Debug - Detailed info for debugging
  static void debug(String message, {dynamic data, Session? session}) {
    final msg = data != null ? '$message\nData: $data' : message;
    if (session != null) {
      session.log('🐛 $msg', level: LogLevel.debug);
    } else {
      _log('🐛 $msg', level: LogLevel.debug);
    }
  }

  // ℹ️ Info - General informational messages
  static void info(String message, {dynamic data, Session? session}) {
    final msg = data != null ? '$message\nData: $data' : message;
    if (session != null) {
      session.log('ℹ️ $msg', level: LogLevel.info);
    } else {
      _log('ℹ️ $msg', level: LogLevel.info);
    }
  }

  // ⚠️ Warning - Something unexpected but not critical
  static void warning(String message, {dynamic data, Session? session}) {
    final msg = data != null ? '$message\nData: $data' : message;
    if (session != null) {
      session.log('⚠️ $msg', level: LogLevel.warning);
    } else {
      _log('⚠️ $msg', level: LogLevel.warning);
    }
  }

  // ❌ Error - Error occurred, with optional error object and stacktrace
  static void error(
    String message, {
    dynamic error,
    StackTrace? stackTrace,
    Session? session,
  }) {
    final errorMsg = error != null ? '$message: $error' : message;
    if (session != null) {
      session.log('❌ $errorMsg', level: LogLevel.error, stackTrace: stackTrace);
    } else if (_currentSession != null) {
      _currentSession!.log('❌ $errorMsg', level: LogLevel.error, stackTrace: stackTrace);
    } else {
      print('❌ $errorMsg');
      if (stackTrace != null) print(stackTrace);
    }
  }

  // ✅ Success - Operation completed successfully
  static void success(String message, {dynamic data, Session? session}) {
    final msg = data != null ? '✅ $message\nData: $data' : '✅ $message';
    if (session != null) {
      session.log(msg, level: LogLevel.info);
    } else {
      _log(msg, level: LogLevel.info);
    }
  }

  // 📡 Webhook - Specific for webhook events
  static void webhook(String service, String method, String path, {Session? session}) {
    final msg = '📡 $service webhook - Method: $method, Path: $path';
    if (session != null) {
      session.log(msg, level: LogLevel.info);
    } else {
      _log(msg, level: LogLevel.info);
    }
  }

  // 📨 Request - Incoming request
  static void request(String message, {dynamic payload, Session? session}) {
    final msg = payload != null ? '📨 $message\n${_formatPayload(payload)}' : '📨 $message';
    if (session != null) {
      session.log(msg, level: LogLevel.info);
    } else {
      _log(msg, level: LogLevel.info);
    }
  }

  // 📦 Payload - Data payload
  static void payload(String message, dynamic data, {Session? session}) {
    final msg = '📦 $message\n${_formatPayload(data)}';
    if (session != null) {
      session.log(msg, level: LogLevel.debug);
    } else {
      _log(msg, level: LogLevel.debug);
    }
  }

  // 🔍 Verification - Webhook verification
  static void verification(String service, {Map<String, dynamic>? params, Session? session}) {
    final msg = params != null
        ? '🔍 $service webhook verification\n${_formatPayload(params)}'
        : '🔍 $service webhook verification';
    if (session != null) {
      session.log(msg, level: LogLevel.info);
    } else {
      _log(msg, level: LogLevel.info);
    }
  }

  // Helper method to format payload data
  static String _formatPayload(dynamic data) {
    if (data is Map) {
      return data.entries
          .map((e) => '   ${e.key}: ${_truncate(e.value.toString())}')
          .join('\n');
    }
    if (data is List) {
      return data.map((e) => '   - ${_truncate(e.toString())}').join('\n');
    }
    return '   ${_truncate(data.toString())}';
  }

  // Helper to truncate long strings
  static String _truncate(String text, {int maxLength = 100}) {
    if (text.length <= maxLength) return text;
    return '${text.substring(0, maxLength)}...';
  }

  // Startup logs (use print since no session available yet)
  static void startup(String message) {
    print('🚀 $message');
  }

  static void startupInfo(String message) {
    print('   $message');
  }

  static void startupSuccess(String message) {
    print('✅ $message');
  }

  static void startupWarning(String message) {
    print('⚠️ $message');
  }

  static void startupError(String message, {dynamic error}) {
    print('❌ $message');
    if (error != null) print('   Error: $error');
  }
}

// Convenience aliases for shorter code
typedef Log = PLoggerHelper;