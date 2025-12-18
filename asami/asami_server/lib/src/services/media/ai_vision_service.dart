
// File: server/lib/src/services/media/ai_vision_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:serverpod/serverpod.dart';

class AIVisionService {
  final Session session;
  final String apiKey;
  final String model;
  
  AIVisionService({
    required this.session,
    required this.apiKey,
    this.model = 'gpt-4-vision-preview', // or claude-3-sonnet, etc.
  });
  
  /// Analyze product image with AI
  Future<Map<String, dynamic>> analyzeProductImage({
    required String imageUrl,
    String? additionalContext,
  }) async {
    try {
      // OpenAI Vision API example
      final response = await http.post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
        },
        body: jsonEncode({
          'model': model,
          'messages': [
            {
              'role': 'user',
              'content': [
                {
                  'type': 'text',
                  'text': '''
Analyze this product image and extract detailed information.

${additionalContext != null ? 'Context: $additionalContext\n' : ''}

Provide a JSON response with:
- name: Product name (clear, marketable)
- description: Detailed description (2-3 paragraphs)
- short_description: One sentence summary
- category: Main category
- sub_category: Specific sub-category
- suggested_price_min: Minimum price in NGN
- suggested_price_max: Maximum price in NGN
- features: Array of 5 key features
- tags: Array of 5-7 relevant tags
- colors: Array of visible colors
- materials: Array of identifiable materials
- condition: "new", "refurbished", or "used"
- target_audience: Who would buy this

Be specific and accurate. Base everything on what you can see in the image.
'''
                },
                {
                  'type': 'image_url',
                  'image_url': {
                    'url': imageUrl,
                  }
                }
              ]
            }
          ],
          'max_tokens': 1000,
          'temperature': 0.7,
        }),
      );
      
      if (response.statusCode != 200) {
        session.log('AI Vision API error: ${response.statusCode} - ${response.body}');
        return {
          'success': false,
          'error': 'AI analysis failed',
        };
      }
      
      final data = jsonDecode(response.body);
      final content = data['choices'][0]['message']['content'];
      
      // Parse JSON from response
      // The AI should return JSON, but let's be safe
      final jsonMatch = RegExp(r'\{[\s\S]*\}').firstMatch(content);
      if (jsonMatch == null) {
        return {
          'success': false,
          'error': 'Could not parse AI response',
        };
      }
      
      final productData = jsonDecode(jsonMatch.group(0)!);
      
      return {
        'success': true,
        'data': productData,
        'tokens_used': data['usage']['total_tokens'],
      };
      
    } catch (e, stackTrace) {
      session.log('AI Vision analysis error: $e', stackTrace: stackTrace);
      return {
        'success': false,
        'error': 'Analysis failed: ${e.toString()}',
      };
    }
  }
}