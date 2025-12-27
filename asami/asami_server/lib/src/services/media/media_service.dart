// File: server/lib/src/services/media/media_service.dart

import 'dart:io';
import 'package:asami_server/src/services/messaging/whatsapp/whatsapp_response_types.dart';
import 'package:http/http.dart' as http;
import 'package:serverpod/serverpod.dart';

import '../../generated/protocol.dart';
import '../messaging/whatsapp/whatsapp_service.dart';
import '../messaging/telegram/telegram_service.dart';

class MediaService {
  final Session session;
  final WhatsAppService? whatsappService;
  final TelegramService? telegramService;
  
  MediaService({
    required this.session,
    this.whatsappService,
    this.telegramService,
  });
  
  /// Download media from WhatsApp
  Future<File?> downloadWhatsAppMedia({
    required String mediaId,
  }) async {
    try {
      if (whatsappService == null) {
        session.log('WhatsApp service not initialized');
        return null;
      }
      
      // Step 1: Get media info from WhatsApp API
      final mediaInfo = await whatsappService!.getMedia(mediaId: mediaId);
      
      if (!mediaInfo.isWhatsAppSuccess()) {
        session.log('Failed to get WhatsApp media info: ${mediaInfo.getWhatsAppErrorMessage()}');
        return null;
      }
      
      final mediaUrl = mediaInfo.getWhatsAppMediaUrl();
      if (mediaUrl == null) {
        session.log('No media URL returned');
        return null;
      }
      
      // Step 2: Download media from URL
      final response = await http.get(
        Uri.parse(mediaUrl),
        headers: {
          'Authorization': 'Bearer ${whatsappService!.webhookVerifyToken}',
        },
      );
      
      if (response.statusCode != 200) {
        session.log('Failed to download WhatsApp media: ${response.statusCode}');
        return null;
      }
      
      // Step 3: Save to temporary file
      // FIXED: Used Directory.systemTemp (Pure Dart) instead of getTemporaryDirectory (Flutter)
      final tempDir = Directory.systemTemp;
      final fileName = '${mediaId}_${DateTime.now().millisecondsSinceEpoch}';
      final file = File('${tempDir.path}/$fileName.jpg');
      
      await file.writeAsBytes(response.bodyBytes);
      
      session.log('✅ WhatsApp media downloaded: ${file.path}');
      return file;
      
    } catch (e, stackTrace) {
      session.log('WhatsApp media download error: $e', stackTrace: stackTrace);
      return null;
    }
  }
  
  /// Download media from Telegram
  Future<File?> downloadTelegramMedia({
    required String fileId,
  }) async {
    try {
      if (telegramService == null) {
        session.log('Telegram service not initialized');
        return null;
      }
      
      // Get file info from Telegram
      final fileInfo = await telegramService!.api.getFile(fileId);
      
      // FIXED: Used Directory.systemTemp (Pure Dart)
      final tempDir = Directory.systemTemp;
      final fileName = '${fileId}_${DateTime.now().millisecondsSinceEpoch}.jpg';
      final savePath = '${tempDir.path}/$fileName';
      
      final downloadedFile = await fileInfo.download(path: savePath);
      
      session.log('✅ Telegram media downloaded: ${downloadedFile?.path}');
      return downloadedFile;
      
    } catch (e, stackTrace) {
      session.log('Telegram media download error: $e', stackTrace: stackTrace);
      return null;
    }
  }
  
  /// Download media from any platform
  Future<File?> downloadMedia({
    required String mediaId,
    required PlatformType platform,
  }) async {
    switch (platform) {
      case PlatformType.whatsapp:
        return await downloadWhatsAppMedia(mediaId: mediaId);
        
      case PlatformType.telegram:
        return await downloadTelegramMedia(fileId: mediaId);
        
      default:
        session.log('Unsupported platform for media download: ${platform.name}');
        return null;
    }
  }
  
  /// Upload file to cloud storage (Placeholder for actual S3/GCS implementation)
  Future<String?> uploadToCloudStorage(File file) async {
    try {
      // TODO: Implement actual cloud storage upload (AWS S3, Google Cloud Storage, etc.)
      final fileName = file.path.split('/').last;
      final placeholderUrl = 'https://storage.asami.com/media/$fileName';
      
      session.log('📤 Uploaded to storage: $placeholderUrl');
      return placeholderUrl;
      
    } catch (e, stackTrace) {
      session.log('Cloud upload error: $e', stackTrace: stackTrace);
      return null;
    }
  }
  
  /// Process product image with AI analysis
  Future<Map<String, dynamic>> processProductImage({
    required File imageFile,
    required String vendorId,
    String? additionalContext,
  }) async {
    try {
      // Step 1: Upload to cloud storage
      final imageUrl = await uploadToCloudStorage(imageFile);
      
      if (imageUrl == null) {
        return {
          'success': false,
          'error': 'Failed to upload image',
        };
      }
      
      // Step 2: Placeholder AI response 
      final aiResponse = {
        'name': 'Sample Product',
        'description': 'A high-quality product identified via AI analysis.',
        'short_description': 'Premium quality product',
        'category': 'General',
        'suggested_price_min': 5000,
        'suggested_price_max': 15000,
        'features': ['High quality', 'Durable'],
        'tags': ['premium', 'new'],
      };
      
      session.log('🤖 AI product analysis complete');
      
      // Step 3: Track AI usage for billing
      final vendor = await VendorProfile.db.findFirstRow(
        session,
        where: (t) => t.userId.equals(UuidValue.fromString(vendorId)),
      );
      
      if (vendor != null) {
        vendor.aiDescriptionsUsed++;
        await VendorProfile.db.updateRow(session, vendor);
        
        // Handle logic for the restricted Three Tiers (Free, Pro, Enterprise)
        if (vendor.subscriptionTier == SubscriptionTier.pro) {
          final now = DateTime.now();
          final usageRecord = UsageRecord(
            id: Uuid().v4obj(),
            vendorId: vendor.userId,
            usageType: 'ai_product_description',
            quantity: 1,
            unitPrice: 0.10, // $0.10 per AI description
            totalAmount: 0.10,
            billingPeriodStart: DateTime(now.year, now.month, 1),
            billingPeriodEnd: DateTime(now.year, now.month + 1, 0),
            createdAt: now,
          );
          
          await UsageRecord.db.insertRow(session, usageRecord);
        }
      }
      
      return {
        'success': true,
        'image_url': imageUrl,
        'ai_data': aiResponse,
      };
      
    } catch (e, stackTrace) {
      session.log('Product image processing error: $e', stackTrace: stackTrace);
      return {
        'success': false,
        'error': 'Image processing failed',
      };
    }
  }
  
  /// Get mime type from file extension
  String getMimeType(String filePath) {
    final extension = filePath.split('.').last.toLowerCase();
    
    switch (extension) {
      case 'jpg':
      case 'jpeg':
        return 'image/jpeg';
      case 'png':
        return 'image/png';
      case 'gif':
        return 'image/gif';
      case 'webp':
        return 'image/webp';
      case 'mp4':
        return 'video/mp4';
      case 'pdf':
        return 'application/pdf';
      default:
        return 'application/octet-stream';
    }
  }
  
  /// Delete temporary file to prevent server disk bloat
  Future<void> cleanupTempFile(File file) async {
    try {
      if (await file.exists()) {
        await file.delete();
        session.log('🗑️ Cleaned up temp file: ${file.path}');
      }
    } catch (e) {
      session.log('Cleanup error: $e');
    }
  }
}