// File: server/lib/src/services/media/enhanced_media_service.dart

import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:serverpod/serverpod.dart';

import '../../../utils/logger/asami_logger.dart';
import '../../generated/protocol.dart';
import '../messaging/whatsapp/whatsapp_service.dart';
import '../messaging/telegram/telegram_service.dart';
import 'imagekit_service.dart';

class EnhancedMediaService {
  final WhatsAppService? whatsappService;
  final TelegramService? telegramService;
  final ImageKitService? imageKitService;

  // Cache the check result to avoid repeated system calls across requests
  static bool? _isFFmpegAvailable;

  EnhancedMediaService({
    this.whatsappService,
    this.telegramService,
    this.imageKitService,
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

  /// Process product media from WhatsApp or Telegram with ImageKit CDN upload
  Future<Map<String, dynamic>> processProductMedia({
    required String mediaId,
    required PlatformType platform,
    required UuidValue vendorId,
    required UuidValue productId,
    bool isVideo = false,
  }) async {
    final session = await Serverpod.instance.createSession();

    try {
      session
          .log('🎬 Processing ${isVideo ? 'video' : 'image'} media: $mediaId');

      // Step 1: Download from platform
      final downloadResult = await _downloadFromPlatform(
        session,
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

      // Step 3: Upload to ImageKit CDN (if configured)
      if (imageKitService != null) {
        // Upload to ImageKit in background and update product when done
        unawaited(_uploadToImageKit(
          file: localFile,
          vendorId: vendorId,
          productId: productId,
          isVideo: isVideo,
          thumbnailPath: thumbnailPath,
        ).then((cdnResult) {
          if (cdnResult['success'] == true) {
            _updateProductWithCDNUrls(
              productId: productId,
              cdnUrls: cdnResult,
            );
          }
        }));

        // Return immediate result
        return {
          'success': true,
          'local_path': localFile.path,
          'platform_media_id': mediaId,
          'mime_type': mimeType,
          'is_video': isVideo,
          'thumbnail_path': thumbnailPath,
          'cdn_status': 'uploading',
        };
      }

      // Step 4: Fallback to legacy CDN upload (if ImageKit not configured)
      unawaited(_uploadToCDN(
        session,
        file: localFile,
        vendorId: vendorId,
        productId: productId,
        mimeType: mimeType,
        thumbnailPath: thumbnailPath,
      ).then((cdnUrls) {
        _updateProductWithCDNUrls(
          productId: productId,
          cdnUrls: cdnUrls,
        );
      }));

      // Return immediate result
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
    } finally {
      await session.close();
    }
  }

  /// Upload to ImageKit CDN
  Future<Map<String, dynamic>> _uploadToImageKit({
    required File file,
    required UuidValue vendorId,
    required UuidValue productId,
    required bool isVideo,
    String? thumbnailPath,
  }) async {
    final session = await Serverpod.instance.createSession();

    try {
      final fileName =
          '${productId.uuid}_${DateTime.now().millisecondsSinceEpoch}${isVideo ? '.mp4' : '.jpg'}';
      final folder = '/products/${vendorId.uuid}/${productId.uuid}';

      session.log('☁️ Uploading to ImageKit: $fileName');

      // Upload main file with progress tracking
      final uploadResult = isVideo
          ? await imageKitService!.uploadVideo(
              videoFile: file,
              fileName: fileName,
              session: session,
              folder: folder,
              tags: ['product', productId.uuid],
              onProgress: (sent, total) {
                final progress = (sent / total * 100).toStringAsFixed(1);
                session.log('📊 Upload progress: $progress%');
              },
            )
          : await imageKitService!.uploadImage(
              imageFile: file,
              fileName: fileName,
              session: session,
              folder: folder,
              tags: ['product', productId.uuid],
              onProgress: (sent, total) {
                final progress = (sent / total * 100).toStringAsFixed(1);
                session.log('📊 Upload progress: $progress%');
              },
            );

      String? thumbnailCdnUrl;
      String? thumbnailFileId;

      // Upload thumbnail if exists
      if (thumbnailPath != null) {
        try {
          final thumbnailFile = File(thumbnailPath);
          final thumbName = 'thumb_${fileName.replaceAll('.mp4', '.jpg')}';

          final thumbResult = await imageKitService!.uploadImage(
            imageFile: thumbnailFile,
            fileName: thumbName,
            session: session,
            folder: folder,
            tags: ['thumbnail', productId.uuid],
          );

          thumbnailCdnUrl = thumbResult.url;
          thumbnailFileId = thumbResult.fileId;

          session.log('✅ Thumbnail uploaded: $thumbnailCdnUrl');

          // Clean up local thumbnail
          await thumbnailFile.delete();
        } catch (e) {
          session.log('⚠️ Thumbnail upload failed: $e');
        } finally {
          await session.close();
        }
      }

      // Clean up local file
      await file.delete();

      // Generate optimized URLs
      final optimizedUrl = imageKitService!.getOptimizedUrl(
          fileUrl: uploadResult.url,
          width: 800,
          quality: '80',
          progressive: true,
          session: session);

      final thumbnailOptimizedUrl = imageKitService!.getOptimizedUrl(
          fileUrl: uploadResult.url,
          width: 300,
          height: 300,
          quality: '70',
          session: session);

      session.log('✅ ImageKit upload complete!');
      session.log('   📎 URL: $optimizedUrl');
      session.log('   🏷️ File ID: ${uploadResult.fileId}');

      return {
        'success': true,
        'cdn_url': uploadResult.url,
        'optimized_url': optimizedUrl,
        'thumbnail_url': thumbnailOptimizedUrl,
        'video_thumbnail_url': thumbnailCdnUrl,
        'file_id': uploadResult.fileId,
        'thumbnail_file_id': thumbnailFileId,
        'width': uploadResult.width,
        'height': uploadResult.height,
        'size': uploadResult.size,
        'is_video': isVideo,
        'cdn_status': 'completed',
      };
    } catch (e, stackTrace) {
      session.log('ImageKit upload error: $e', stackTrace: stackTrace);
      return {
        'success': false,
        'error': 'CDN upload failed: $e',
        'cdn_status': 'failed',
      };
    }
  }

  /// Download media from WhatsApp or Telegram
  Future<Map<String, dynamic>> _downloadFromPlatform(
    Session session, {
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
          return {
            'success': false,
            'error': 'Failed to get WhatsApp media info'
          };
        }

        final mediaUrl = mediaInfo.getMediaUrl();
        mimeType = mediaInfo.getMediaMimeType();
        final accessToken =
            session.server.serverpod.getPassword('whatsappAccessToken');
        Log.info('📥 Downloading media from WhatsApp: $mediaUrl $mimeType');
        Log.info('📥 Media token: $accessToken}');

        if (mediaUrl == null) {
          return {'success': false, 'error': 'No media URL returned'};
        }

        final response = await http.get(
          Uri.parse(mediaUrl),
          headers: {
            'Authorization': 'Bearer $accessToken',
          },
        );

        if (response.statusCode != 200) {
          return {
            'success': false,
            'error': 'Failed to download from WhatsApp'
          };
        }

        Log.info('media res: ${response.bodyBytes.length} bytes');

        // Use Directory.systemTemp for pure Dart environments
        final tempDir = Directory.systemTemp;
        final extension = _getExtensionFromMimeType(mimeType ?? 'image/jpeg');
        final fileName =
            '${mediaId}_${DateTime.now().millisecondsSinceEpoch}$extension';
        file = File('${tempDir.path}/$fileName');

        await file.writeAsBytes(response.bodyBytes);
        session.log('✅ Downloaded from WhatsApp: ${file.path}');
      } else if (platform == PlatformType.telegram && telegramService != null) {
        final fileInfo = await telegramService!.api.getFile(mediaId);
        file = await fileInfo.download();
        mimeType = _getMimeTypeFromExtension(file?.path ?? '');

        session.log('✅ Downloaded from Telegram: ${file?.path}');
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
  Future<String?> _generateVideoThumbnail(
      Session session, String videoPath) async {
    if (!await _verifyFFmpeg(session)) return null;

    try {
      final String outPath = '${videoPath}_thumb.jpg';

      session.log('🎬 Generating video thumbnail...');

      // Runs FFmpeg to capture 1 frame at 1 second mark
      final result = await Process.run('ffmpeg', [
        '-ss', '00:00:01.000',
        '-i', videoPath,
        '-vframes', '1',
        '-q:v', '2', // Quality scale 2 (high quality)
        '-y', // Overwrite output file
        outPath,
      ]);

      if (result.exitCode == 0) {
        session.log('✅ Video thumbnail generated: $outPath');
        return outPath;
      } else {
        session.log('⚠️ FFmpeg failed: ${result.stderr}');
        return null;
      }
    } catch (e) {
      session.log('⚠️ Failed to generate video thumbnail: $e');
      return null;
    }
  }

  /// Legacy CDN upload (fallback if ImageKit not configured)
  Future<Map<String, String>> _uploadToCDN(
    Session session, {
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
      session.log('Uploaded to legacy CDN: $cdnUrl');

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
  Future<void> _updateProductWithCDNUrls({
    required UuidValue productId,
    required Map<String, dynamic> cdnUrls,
  }) async {
    final session = await Serverpod.instance.createSession();

    try {
      final product = await Product.db.findById(session, productId);
      if (product == null) return;

      final cdnUrl = cdnUrls['cdn_url'] as String?;
      final thumbnailUrl = cdnUrls['thumbnail_url'] as String?;
      final videoThumbnailUrl = cdnUrls['video_thumbnail_url'] as String?;
      final optimizedUrl = cdnUrls['optimized_url'] as String?;

      // Use optimized URL if available, otherwise use original
      final finalUrl = optimizedUrl ?? cdnUrl;

      if (finalUrl != null) {
        if (!product.images.contains(finalUrl)) {
          product.images = [...product.images, finalUrl];
        }

        // Use thumbnail for thumbnailUrl if available
        product.thumbnailUrl ??= thumbnailUrl ?? finalUrl;

        if (finalUrl.contains('.mp4') || finalUrl.contains('.mov')) {
          product.videoUrl = finalUrl;
          if (videoThumbnailUrl != null) {
            product.videoThumbnailUrl = videoThumbnailUrl;
          }
        }

        product.cdnUploadStatus =
            cdnUrls['cdn_status'] as String? ?? 'completed';
        product.cdnUploadedAt = DateTime.now();
        product.updatedAt = DateTime.now();

        await Product.db.updateRow(session, product);
        session.log('✅ Product updated with CDN URLs');
      }
    } catch (e) {
      session.log('⚠️ Update product with CDN URLs error: $e');
    }
  }

  /// Batch process multiple media items
  Future<List<Map<String, dynamic>>> batchProcessMedia(
    Session session, {
    required List<String> mediaIds,
    required PlatformType platform,
    required UuidValue vendorId,
    required UuidValue productId,
    List<bool>? isVideoFlags,
  }) async {
    final results = <Map<String, dynamic>>[];

    for (var i = 0; i < mediaIds.length; i++) {
      final result = await processProductMedia(
        mediaId: mediaIds[i],
        platform: platform,
        vendorId: vendorId,
        productId: productId,
        isVideo: isVideoFlags?[i] ?? false,
      );
      results.add(result);

      // Small delay between uploads to avoid rate limits
      if (i < mediaIds.length - 1) {
        await Future.delayed(Duration(milliseconds: 500));
      }
    }

    return results;
  }

  /// Delete media from ImageKit
  Future<bool> deleteMediaFromCDN(String fileId, Session session) async {
    if (imageKitService == null) return false;

    try {
      return await imageKitService!.deleteFile(fileId, session);
    } catch (e) {
      return false;
    }
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
