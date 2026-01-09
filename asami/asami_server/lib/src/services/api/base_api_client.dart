// File: server/lib/src/services/api/base_api_client.dart

import 'package:dio/dio.dart';
import 'package:serverpod/serverpod.dart' hide Response;

import '../../../utils/logger/asami_logger.dart';

/// Base API client with common configuration and error handling
class BaseApiClient {
  final Dio _dio;

  BaseApiClient({
    required String baseUrl,
    Map<String, String>? headers,
    Duration? connectTimeout,
    Duration? receiveTimeout,
  }) : _dio = Dio(
          BaseOptions(
            baseUrl: baseUrl,
            connectTimeout: connectTimeout ?? const Duration(seconds: 30),
            receiveTimeout: receiveTimeout ?? const Duration(seconds: 30),
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              ...?headers,
            },
          ),
        ) {
    _setupInterceptors();
  }

  /// Setup request/response interceptors
  void _setupInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          _log('➡️ ${options.method} ${options.uri}');
          if (options.data != null) {
            _log('📦 Request Data: ${options.data}');
          }
          return handler.next(options);
        },
        onResponse: (response, handler) {
          _log('✅ ${response.statusCode} ${response.requestOptions.uri}');
          return handler.next(response);
        },
        onError: (error, handler) {
          _logError(error);
          return handler.next(error);
        },
      ),
    );
  }

  /// GET request
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      return await _dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// POST request
  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
  }) async {
    try {
      return await _dio.post<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
      );
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// PUT request
  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      return await _dio.put<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// DELETE request
  Future<Response<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      return await _dio.delete<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Upload file with progress tracking
  Future<Response<T>> uploadFile<T>(
    String path, {
    required String filePath,
    required String fileName,
    Map<String, dynamic>? data,
    ProgressCallback? onSendProgress,
    CancelToken? cancelToken,
  }) async {
    try {
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          filePath,
          filename: fileName,
        ),
        ...?data,
      });

      return await _dio.post<T>(
        path,
        data: formData,
        onSendProgress: onSendProgress,
        cancelToken: cancelToken,
      );
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Upload multiple files
  Future<Response<T>> uploadFiles<T>(
    String path, {
    required List<String> filePaths,
    required List<String> fileNames,
    Map<String, dynamic>? data,
    ProgressCallback? onSendProgress,
    CancelToken? cancelToken,
  }) async {
    try {
      final files = <MapEntry<String, MultipartFile>>[];

      for (var i = 0; i < filePaths.length; i++) {
        files.add(
          MapEntry(
            'files',
            await MultipartFile.fromFile(
              filePaths[i],
              filename: fileNames[i],
            ),
          ),
        );
      }

      final formData = FormData.fromMap({
        ...Map.fromEntries(files),
        ...?data,
      });

      return await _dio.post<T>(
        path,
        data: formData,
        onSendProgress: onSendProgress,
        cancelToken: cancelToken,
      );
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Handle Dio errors
  ApiException _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ApiException(
          message: 'Connection timeout. Please check your internet connection.',
          statusCode: 408,
          type: ApiErrorType.timeout,
        );

      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode ?? 500;
        final message = _extractErrorMessage(error.response?.data);

        return ApiException(
          message: message,
          statusCode: statusCode,
          type: _getErrorType(statusCode),
          response: error.response?.data,
        );

      case DioExceptionType.cancel:
        return ApiException(
          message: 'Request cancelled',
          statusCode: 499,
          type: ApiErrorType.cancelled,
        );

      case DioExceptionType.connectionError:
        return ApiException(
          message: 'No internet connection',
          statusCode: 503,
          type: ApiErrorType.network,
        );

      default:
        return ApiException(
          message: 'An unexpected error occurred: ${error.message}',
          statusCode: 500,
          type: ApiErrorType.unknown,
        );
    }
  }

  /// Extract error message from response
  String _extractErrorMessage(dynamic data) {
    if (data == null) return 'An error occurred';

    if (data is Map<String, dynamic>) {
      return data['error']?.toString() ??
          data['message']?.toString() ??
          data['detail']?.toString() ??
          'An error occurred';
    }

    return data.toString();
  }

  /// Get error type from status code
  ApiErrorType _getErrorType(int statusCode) {
    if (statusCode >= 400 && statusCode < 500) {
      return ApiErrorType.client;
    } else if (statusCode >= 500) {
      return ApiErrorType.server;
    }
    return ApiErrorType.unknown;
  }

  /// Log message
  void _log(String message, [Session? session]) {
    session?.log(message);
    Log.info('🌐 $message');
  }

  /// Log error
  void _logError(DioException error, [Session? session]) {
    final message =
        '❌ ${error.requestOptions.method} ${error.requestOptions.uri} - ${error.message}';
    session?.log(message);
    Log.info(message);
  }

  /// Dispose resources
  void dispose() {
    _dio.close();
  }
}

/// Custom API exception
class ApiException implements Exception {
  final String message;
  final int statusCode;
  final ApiErrorType type;
  final dynamic response;

  ApiException({
    required this.message,
    required this.statusCode,
    required this.type,
    this.response,
  });

  @override
  String toString() => 'ApiException($statusCode): $message';

  bool get isClientError => type == ApiErrorType.client;
  bool get isServerError => type == ApiErrorType.server;
  bool get isNetworkError => type == ApiErrorType.network;
  bool get isTimeout => type == ApiErrorType.timeout;
}

/// API error types
enum ApiErrorType {
  client, // 4xx errors
  server, // 5xx errors
  network, // No connection
  timeout, // Request timeout
  cancelled, // Request cancelled
  unknown, // Other errors
}
