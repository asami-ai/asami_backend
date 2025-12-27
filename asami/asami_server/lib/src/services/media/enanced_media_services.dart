// File: server/lib/src/services/media/enhanced_media_service.dart

import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:serverpod/serverpod.dart';

import '../../generated/protocol.dart';
import '../messaging/whatsapp/whatsapp_service.dart';
import '../messaging/telegram/telegram_service.dart';

class EnhancedMediaService {
  final WhatsAppService? whatsappService;
  final TelegramService? telegramService;

  // Cache the check result to avoid repeated system calls across requests
  static bool? _isFFmpegAvailable;

  EnhancedMediaService({
    this.whatsappService,
    this.telegramService,
  });

  /// Checks if FFmpeg is installed on the host OS
  Future<bool> _verifyFFmpeg(Session session) async {
    if (_isFFmpegAvailable != null) return _isFFmpegAvailable!;

    try {
      // Run 'ffmpeg -version' to see if the command exists in the system PATH
      final result = await Process.run('ffmpeg', ['-version']);
      _isFFmpegAvailable = result.exitCode == 0;
    } catch (_) {
      _isFFmpegAvailable = false;
    }

    if (!_isFFmpegAvailable!) {
      session.log(
        'CRITICAL: FFmpeg is not installed on this server. Video thumbnails will be skipped.',
        level: LogLevel.error,
      );
    }
    
    return _isFFmpegAvailable!;
  }

  /// Process product media from WhatsApp or Telegram
  Future<Map<String, dynamic>> processProductMedia(
    Session session,
    {
    required String mediaId,
    required PlatformType platform,
    required UuidValue vendorId,
    required UuidValue productId,
    bool isVideo = false,
  }) async {
    try {
      // Step 1: Download from platform
      final downloadResult = await _downloadFromPlatform(
        mediaId: mediaId,
        platform: platform,
        isVideo: isVideo,
      );

      if (!downloadResult['success']) {
        return downloadResult;
      }

      final localFile = downloadResult['file'] as File;
      final mimeType = downloadResult['mime_type'] as String;

      // Step 2: Generate thumbnail if video
      String? thumbnailPath;
      if (isVideo) {
        thumbnailPath = await _generateVideoThumbnail(session, localFile.path);
      }

      // Step 3: Upload to CDN (background job)
      unawaited(_uploadToCDN(
        session,
        file: localFile,
        vendorId: vendorId,
        productId: productId,
        mimeType: mimeType,
        thumbnailPath: thumbnailPath,
      ).then((cdnUrls) {
        _updateProductWithCDNUrls(
          session,
          productId: productId,
          cdnUrls: cdnUrls,
        );
      }));

      // Step 4: Return immediate result
      return {
        'success': true,
        'local_path': localFile.path,
        'platform_media_id': mediaId,
        'mime_type': mimeType,
        'is_video': isVideo,
        'thumbnail_path': thumbnailPath,
        'cdn_status': 'uploading',
      };
    } catch (e, stackTrace) {
      session.log('Process product media error: $e', stackTrace: stackTrace);
      return {
        'success': false,
        'error': e.toString(),
      };
    }
  }

  /// Download media from WhatsApp or Telegram
  Future<Map<String, dynamic>> _downloadFromPlatform({
    required String mediaId,
    required PlatformType platform,
    bool isVideo = false,
  }) async {
    try {
      File? file;
      String? mimeType;

      if (platform == PlatformType.whatsapp && whatsappService != null) {
        final mediaInfo = await whatsappService!.getMedia(mediaId: mediaId);

        if (!mediaInfo.isSuccess()) {
          return {'success': false, 'error': 'Failed to get WhatsApp media info'};
        }

        final mediaUrl = mediaInfo.getMediaUrl();
        mimeType = mediaInfo.getMediaMimeType();

        if (mediaUrl == null) {
          return {'success': false, 'error': 'No media URL returned'};
        }

        final response = await http.get(
          Uri.parse(mediaUrl),
          headers: {
            'Authorization': 'Bearer ${whatsappService!.webhookVerifyToken}',
          },
        );

        if (response.statusCode != 200) {
          return {'success': false, 'error': 'Failed to download from WhatsApp'};
        }

        // Use Directory.systemTemp for pure Dart environments
        final tempDir = Directory.systemTemp;
        final extension = _getExtensionFromMimeType(mimeType ?? 'image/jpeg');
        final fileName = '${mediaId}_${DateTime.now().millisecondsSinceEpoch}$extension';
        file = File('${tempDir.path}/$fileName');

        await file.writeAsBytes(response.bodyBytes);
      } else if (platform == PlatformType.telegram && telegramService != null) {
        final fileInfo = await telegramService!.api.getFile(mediaId);
        file = await fileInfo.download();
        mimeType = _getMimeTypeFromExtension(file?.path ?? '');
      }

      if (file == null) {
        return {'success': false, 'error': 'Platform service not available'};
      }

      return {
        'success': true,
        'file': file,
        'mime_type': mimeType ?? 'application/octet-stream',
      };
    } catch (e) {
      return {'success': false, 'error': 'Download failed: $e'};
    }
  }

  /// Generate thumbnail from video using FFmpeg
  Future<String?> _generateVideoThumbnail(Session session, String videoPath) async {
    if (!await _verifyFFmpeg(session)) return null;

    try {
      final String outPath = '${videoPath}_thumb.jpg';

      // Runs FFmpeg to capture 1 frame at 1 second mark
      final result = await Process.run('ffmpeg', [
        '-ss', '00:00:01.000',
        '-i', videoPath,
        '-vframes', '1',
        '-q:v', '2', // Quality scale 2 (high quality)
        outPath,
      ]);

      if (result.exitCode == 0) {
        return outPath;
      } else {
        session.log('FFmpeg failed: ${result.stderr}');
        return null;
      }
    } catch (e) {
      session.log('Failed to generate video thumbnail: $e');
      return null;
    }
  }

  /// Upload to CDN (background operation)
  Future<Map<String, String>> _uploadToCDN(
    Session session,
    {
    required File file,
    required UuidValue vendorId,
    required UuidValue productId,
    required String mimeType,
    String? thumbnailPath,
  }) async {
    try {
      final fileName = file.path.split('/').last;
      final cdnUrl =
          'https://cdn.asami.com/products/${vendorId.uuid}/${productId.uuid}/$fileName';

      String? thumbnailCdnUrl;
      if (thumbnailPath != null) {
        final thumbName = thumbnailPath.split('/').last;
        thumbnailCdnUrl =
            'https://cdn.asami.com/products/${vendorId.uuid}/${productId.uuid}/thumb_$thumbName';
      }

      // Simulate upload delay
      await Future.delayed(Duration(seconds: 2));
      session.log('Uploaded to CDN: $cdnUrl');

      return {
        'cdn_url': cdnUrl,
        if (thumbnailCdnUrl != null) 'thumbnail_cdn_url': thumbnailCdnUrl,
      };
    } catch (e) {
      session.log('CDN upload error: $e');
      return {};
    }
  }

  /// Update product with CDN URLs
  Future<void> _updateProductWithCDNUrls(
    Session session,
    {
    required UuidValue productId,
    required Map<String, String> cdnUrls,
  }) async {
    try {
      final product = await Product.db.findById(session, productId);
      if (product == null) return;

      final cdnUrl = cdnUrls['cdn_url'];
      final thumbnailUrl = cdnUrls['thumbnail_cdn_url'];

      if (cdnUrl != null) {
        if (!product.images.contains(cdnUrl)) {
          product.images = [...product.images, cdnUrl];
        }

        product.thumbnailUrl ??= cdnUrl;

        if (cdnUrl.contains('.mp4') || cdnUrl.contains('.mov')) {
          product.videoUrl = cdnUrl;
          if (thumbnailUrl != null) {
            product.videoThumbnailUrl = thumbnailUrl;
          }
        }

        product.cdnUploadStatus = 'completed';
        product.cdnUploadedAt = DateTime.now();
        product.updatedAt = DateTime.now();

        await Product.db.updateRow(session, product);
        session.log('Product updated with CDN URLs');
      }
    } catch (e) {
      session.log('Update product with CDN URLs error: $e');
    }
  }

  /// Batch process multiple media items
  Future<List<Map<String, dynamic>>> batchProcessMedia(
    Session session,
    {
    required List<String> mediaIds,
    required PlatformType platform,
    required UuidValue vendorId,
    required UuidValue productId,
    List<bool>? isVideoFlags,
  }) async {
    final results = <Map<String, dynamic>>[];

    for (var i = 0; i < mediaIds.length; i++) {
      final result = await processProductMedia(
        session,
        mediaId: mediaIds[i],
        platform: platform,
        vendorId: vendorId,
        productId: productId,
        isVideo: isVideoFlags?[i] ?? false,
      );
      results.add(result);
    }

    return results;
  }

  String _getExtensionFromMimeType(String mimeType) {
    final map = {
      'image/jpeg': '.jpg',
      'image/png': '.png',
      'image/gif': '.gif',
      'image/webp': '.webp',
      'video/mp4': '.mp4',
      'video/quicktime': '.mov',
      'video/x-msvideo': '.avi',
    };
    return map[mimeType] ?? '.bin';
  }

  String _getMimeTypeFromExtension(String path) {
    final extension = path.split('.').last.toLowerCase();
    final map = {
      'jpg': 'image/jpeg',
      'jpeg': 'image/jpeg',
      'png': 'image/png',
      'gif': 'image/gif',
      'webp': 'image/webp',
      'mp4': 'video/mp4',
      'mov': 'video/quicktime',
      'avi': 'video/x-msvideo',
    };
    return map[extension] ?? 'application/octet-stream';
  }
}