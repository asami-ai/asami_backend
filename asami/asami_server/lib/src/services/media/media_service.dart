// File: server/lib/src/services/media/media_service.dart

import 'dart:io';
import 'package:asami_server/src/services/messaging/whatsapp/whatsapp_response_types.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
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
      final tempDir = await getTemporaryDirectory();
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
      
      // Get file info
      final fileInfo = await telegramService!.api.getFile(fileId);
      
      // Download using Televerse's built-in download method
      final tempDir = await getTemporaryDirectory();
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
  
  /// Upload file to cloud storage (S3, Firebase, etc.)
  Future<String?> uploadToCloudStorage(File file) async {
    try {
      // TODO: Implement actual cloud storage upload
      // For now, return a placeholder URL
      
      // Example with AWS S3:
      // final s3 = S3Client(...);
      // final result = await s3.putObject(...);
      // return result.location;
      
      // Placeholder implementation
      final fileName = file.path.split('/').last;
      final placeholderUrl = 'https://storage.asami.com/media/$fileName';
      
      session.log('📤 Uploaded to storage: $placeholderUrl');
      return placeholderUrl;
      
    } catch (e, stackTrace) {
      session.log('Cloud upload error: $e', stackTrace: stackTrace);
      return null;
    }
  }
  
  /// Process product image with AI
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
      
      // Step 2: Send to AI for analysis
      // TODO: Integrate with actual AI service (OpenAI Vision, Claude, etc.)
      
      final aiPrompt = '''
Analyze this product image and generate comprehensive product information.

${additionalContext != null ? 'Additional context: $additionalContext\n' : ''}

Provide the following in JSON format:
{
  "name": "Product name (concise, descriptive)",
  "description": "Full product description (3-5 sentences)",
  "short_description": "Brief 1-sentence description",
  "category": "Primary category",
  "sub_category": "Sub-category if applicable",
  "suggested_price_min": "Minimum suggested price in NGN",
  "suggested_price_max": "Maximum suggested price in NGN",
  "features": ["Feature 1", "Feature 2", "Feature 3", "Feature 4", "Feature 5"],
  "tags": ["tag1", "tag2", "tag3", "tag4", "tag5"],
  "colors": ["color1", "color2"] if visible,
  "materials": ["material"] if identifiable,
  "target_audience": "Who this product is for"
}
''';
      
      // Placeholder AI response (replace with actual AI call)
      final aiResponse = {
        'name': 'Sample Product',
        'description': 'A high-quality product with excellent features and durable construction.',
        'short_description': 'Premium quality product',
        'category': 'General',
        'sub_category': null,
        'suggested_price_min': 5000,
        'suggested_price_max': 15000,
        'features': [
          'High quality materials',
          'Durable construction',
          'Modern design',
          'Easy to use',
          'Great value'
        ],
        'tags': ['quality', 'durable', 'modern', 'premium', 'value'],
        'colors': [],
        'materials': [],
        'target_audience': 'General consumers',
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
        
        // Create usage record for pay-as-you-go vendors
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
  
  /// Delete temporary file
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
