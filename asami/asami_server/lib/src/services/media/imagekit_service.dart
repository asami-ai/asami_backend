// File: server/lib/src/services/cdn/imagekit_service.dart

import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:serverpod/serverpod.dart';
import '../api/base_api_client.dart';

/// ImageKit CDN service for uploading images and videos
class ImageKitService {
  final String publicKey;
  final String privateKey;
  final String urlEndpoint;
  final BaseApiClient _apiClient;

  ImageKitService({
    required this.publicKey,
    required this.privateKey,
    required this.urlEndpoint,
  }) : _apiClient = BaseApiClient(
          baseUrl: 'https://upload.imagekit.io/api/v1',
          headers: {
            'Authorization': 'Basic ${_encodeCredentials(privateKey)}',
          },
        );

  /// Encode private key for Basic Auth
  static String _encodeCredentials(String privateKey) {
    final credentials = '$privateKey:';
    return base64Encode(utf8.encode(credentials));
  }

  /// Upload image to ImageKit
  Future<ImageKitUploadResult> uploadImage({
    required File imageFile,
    required String fileName,
    required Session session,
    String? folder,
    List<String>? tags,
    bool useUniqueFileName = true,
    Map<String, dynamic>? customMetadata,
    ProgressCallback? onProgress,
  }) async {
    try {
      session.log('📤 Uploading image to ImageKit: $fileName');

      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          imageFile.path,
          filename: fileName,
        ),
        'fileName': fileName,
        'publicKey': publicKey,
        'useUniqueFileName': useUniqueFileName,
        if (folder != null) 'folder': folder,
        if (tags != null) 'tags': tags.join(','),
        if (customMetadata != null) 'customMetadata': jsonEncode(customMetadata),
      });

      final response = await _apiClient.post<Map<String, dynamic>>(
        '/files/upload',
        data: formData,
        onSendProgress: onProgress,
      );

      if (response.statusCode == 200 && response.data != null) {
        final result = ImageKitUploadResult.fromJson(response.data!);
        session.log('✅ Image uploaded successfully: ${result.url}');
        return result;
      }

      throw Exception('Upload failed: ${response.statusMessage}');
    } on ApiException catch (e) {
      session.log('❌ ImageKit upload error: ${e.message}');
      throw ImageKitException(
        message: 'Failed to upload image: ${e.message}',
        statusCode: e.statusCode,
      );
    } catch (e, stackTrace) {
      session.log('❌ Unexpected upload error: $e', stackTrace: stackTrace);
      throw ImageKitException(
        message: 'Unexpected error during upload: $e',
        statusCode: 500,
      );
    }
  }

  /// Upload video to ImageKit
  Future<ImageKitUploadResult> uploadVideo({
    required File videoFile,
    required String fileName,
    required Session session,
    String? folder,
    List<String>? tags,
    bool useUniqueFileName = true,
    Map<String, dynamic>? customMetadata,
    ProgressCallback? onProgress,
  }) async {
    try {
      session.log('📤 Uploading video to ImageKit: $fileName');

      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          videoFile.path,
          filename: fileName,
        ),
        'fileName': fileName,
        'publicKey': publicKey,
        'useUniqueFileName': useUniqueFileName,
        if (folder != null) 'folder': folder,
        if (tags != null) 'tags': tags.join(','),
        if (customMetadata != null) 'customMetadata': jsonEncode(customMetadata),
      });

      final response = await _apiClient.post<Map<String, dynamic>>(
        '/files/upload',
        data: formData,
        onSendProgress: onProgress,
      );

      if (response.statusCode == 200 && response.data != null) {
        final result = ImageKitUploadResult.fromJson(response.data!);
        session.log('✅ Video uploaded successfully: ${result.url}');
        return result;
      }

      throw Exception('Upload failed: ${response.statusMessage}');
    } on ApiException catch (e) {
      session.log('❌ ImageKit upload error: ${e.message}');
      throw ImageKitException(
        message: 'Failed to upload video: ${e.message}',
        statusCode: e.statusCode,
      );
    } catch (e, stackTrace) {
      session.log('❌ Unexpected upload error: $e', stackTrace: stackTrace);
      throw ImageKitException(
        message: 'Unexpected error during upload: $e',
        statusCode: 500,
      );
    }
  }

  /// Batch upload multiple images
  Future<List<ImageKitUploadResult>> uploadImages({
    required List<File> imageFiles,
    required List<String> fileNames,
    required Session session,
    String? folder,
    List<String>? tags,
    ProgressCallback? onProgress,
  }) async {
    final results = <ImageKitUploadResult>[];
    
    for (var i = 0; i < imageFiles.length; i++) {
      try {
        final result = await uploadImage(
          imageFile: imageFiles[i],
          fileName: fileNames[i],
          session: session,
          folder: folder,
          tags: tags,
          onProgress: onProgress,
        );
        results.add(result);
      } catch (e) {
        session.log('⚠️ Failed to upload ${fileNames[i]}: $e');
        // Continue with other uploads
      }
    }

    return results;
  }

  /// Generate authenticated URL for private files
  String generateAuthenticatedUrl({
    required String filePath,
    Duration expiry = const Duration(hours: 1),
    Map<String, String>? transformations,
  }) {
    final expiryTimestamp = DateTime.now().add(expiry).millisecondsSinceEpoch ~/ 1000;
    
    // Build URL with transformations
    var url = '$urlEndpoint/$filePath';
    if (transformations != null && transformations.isNotEmpty) {
      final params = transformations.entries
          .map((e) => '${e.key}=${e.value}')
          .join(',');
      url = '$urlEndpoint/tr:$params/$filePath';
    }

    // Generate signature
    final stringToSign = '$url$expiryTimestamp$privateKey';
    final signature = sha1.convert(utf8.encode(stringToSign)).toString();

    return '$url?ik-t=$expiryTimestamp&ik-s=$signature';
  }

  /// Get optimized image URL with transformations
  String getOptimizedUrl({
    required String fileUrl,
    required Session session,
    int? width,
    int? height,
    String? quality,
    String? format,
    bool progressive = true,
  }) {
    final transformations = <String>[];
    
    if (width != null) transformations.add('w-$width');
    if (height != null) transformations.add('h-$height');
    if (quality != null) transformations.add('q-$quality');
    if (format != null) transformations.add('f-$format');
    if (progressive) transformations.add('pr-true');

    if (transformations.isEmpty) return fileUrl;

    // Extract file path from URL
    final filePath = fileUrl.replaceFirst(urlEndpoint, '').replaceFirst('/', '');
    
    return '$urlEndpoint/tr:${transformations.join(',')}/$filePath';
  }

  /// Delete file from ImageKit
  Future<bool> deleteFile(String fileId, Session session) async {
    try {
      session.log('🗑️ Deleting file from ImageKit: $fileId');

      final response = await _apiClient.delete(
        '/files/$fileId',
      );

      if (response.statusCode == 204) {
        session.log('✅ File deleted successfully');
        return true;
      }

      return false;
    } on ApiException catch (e) {
      session.log('❌ Delete error: ${e.message}');
      return false;
    } catch (e) {
      session.log('❌ Unexpected delete error: $e');
      return false;
    }
  }

  /// Get file details
  Future<Map<String, dynamic>?> getFileDetails(String fileId, Session session) async {
    try {
      final response = await _apiClient.get<Map<String, dynamic>>(
        '/files/$fileId/details',
      );

      return response.data;
    } on ApiException catch (e) {
      session.log('❌ Get file details error: ${e.message}');
      return null;
    }
  }

  /// Dispose resources
  void dispose() {
    _apiClient.dispose();
  }
}

/// Upload result from ImageKit
class ImageKitUploadResult {
  final String fileId;
  final String name;
  final String url;
  final String thumbnailUrl;
  final int height;
  final int width;
  final int size;
  final String filePath;
  final List<String> tags;
  final bool isPrivateFile;
  final Map<String, dynamic>? customMetadata;

  ImageKitUploadResult({
    required this.fileId,
    required this.name,
    required this.url,
    required this.thumbnailUrl,
    required this.height,
    required this.width,
    required this.size,
    required this.filePath,
    required this.tags,
    required this.isPrivateFile,
    this.customMetadata,
  });

  factory ImageKitUploadResult.fromJson(Map<String, dynamic> json) {
    return ImageKitUploadResult(
      fileId: json['fileId'] as String,
      name: json['name'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
      height: json['height'] as int,
      width: json['width'] as int,
      size: json['size'] as int,
      filePath: json['filePath'] as String,
      tags: (json['tags'] as List?)?.cast<String>() ?? [],
      isPrivateFile: json['isPrivateFile'] as bool? ?? false,
      customMetadata: json['customMetadata'] as Map<String, dynamic>?,
    );
  }

  Map<String, dynamic> toJson() => {
    'fileId': fileId,
    'name': name,
    'url': url,
    'thumbnailUrl': thumbnailUrl,
    'height': height,
    'width': width,
    'size': size,
    'filePath': filePath,
    'tags': tags,
    'isPrivateFile': isPrivateFile,
    'customMetadata': customMetadata,
  };
}

/// ImageKit exception
class ImageKitException implements Exception {
  final String message;
  final int statusCode;

  ImageKitException({
    required this.message,
    required this.statusCode,
  });

  @override
  String toString() => 'ImageKitException($statusCode): $message';
}