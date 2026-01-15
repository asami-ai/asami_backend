// File: server/lib/src/services/payment/paystack_service.dart

import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;

class PaystackService {
  final String secretKey;
  final String publicKey;
  final String baseUrl = 'https://api.paystack.co';
  
  PaystackService({
    required this.secretKey,
    required this.publicKey,
  });
  
  /// Initialize a payment transaction
  Future<Map<String, dynamic>> initializeTransaction({
    required String email,
    required double amount,
    required String reference,
    String? callbackUrl,
    Map<String, dynamic>? metadata,
    List<String>? channels,
  }) async {
    try {
      final url = Uri.parse('$baseUrl/transaction/initialize');
      
      // Paystack expects amount in kobo (smallest currency unit)
      final amountInKobo = (amount * 100).toInt();
      
      final body = {
        'email': email,
        'amount': amountInKobo.toString(),
        'reference': reference,
        'currency': 'NGN',
        if (callbackUrl != null) 'callback_url': callbackUrl,
        if (metadata != null) 'metadata': metadata,
        if (channels != null && channels.isNotEmpty) 'channels': channels,
      };
      
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $secretKey',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      );
      
      final data = jsonDecode(response.body);
      
      if (response.statusCode == 200 && data['status'] == true) {
        return {
          'success': true,
          'authorization_url': data['data']['authorization_url'],
          'access_code': data['data']['access_code'],
          'reference': data['data']['reference'],
        };
      }
      
      return {
        'success': false,
        'error': data['message'] ?? 'Failed to initialize transaction',
      };
    } catch (e) {
      return {
        'success': false,
        'error': 'Exception: ${e.toString()}',
      };
    }
  }
  
  /// Verify a transaction
  Future<Map<String, dynamic>> verifyTransaction(String reference) async {
    try {
      final url = Uri.parse('$baseUrl/transaction/verify/$reference');
      
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $secretKey',
        },
      );
      
      final data = jsonDecode(response.body);
      
      if (response.statusCode == 200 && data['status'] == true) {
        final transactionData = data['data'];
        
        return {
          'success': true,
          'status': transactionData['status'], // success, failed, abandoned
          'reference': transactionData['reference'],
          'amount': transactionData['amount'] / 100, // Convert from kobo
          'paid_at': transactionData['paid_at'],
          'channel': transactionData['channel'],
          'currency': transactionData['currency'],
          'customer': transactionData['customer'],
          'metadata': transactionData['metadata'],
          'fees': transactionData['fees'] / 100,
          'authorization': transactionData['authorization'],
        };
      }
      
      return {
        'success': false,
        'error': data['message'] ?? 'Verification failed',
      };
    } catch (e) {
      return {
        'success': false,
        'error': 'Exception: ${e.toString()}',
      };
    }
  }
  
  /// Get transaction details
  Future<Map<String, dynamic>> getTransaction(String reference) async {
    return await verifyTransaction(reference);
  }
  
  /// List transactions
  Future<Map<String, dynamic>> listTransactions({
    int? perPage,
    int? page,
    String? status,
    String? customer,
    DateTime? from,
    DateTime? to,
  }) async {
    try {
      final queryParams = <String, String>{
        if (perPage != null) 'perPage': perPage.toString(),
        if (page != null) 'page': page.toString(),
        if (status != null) 'status': status,
        if (customer != null) 'customer': customer,
        if (from != null) 'from': from.toIso8601String(),
        if (to != null) 'to': to.toIso8601String(),
      };
      
      final url = Uri.parse('$baseUrl/transaction').replace(
        queryParameters: queryParams.isNotEmpty ? queryParams : null,
      );
      
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $secretKey',
        },
      );
      
      final data = jsonDecode(response.body);
      
      if (response.statusCode == 200 && data['status'] == true) {
        return {
          'success': true,
          'transactions': data['data'],
          'meta': data['meta'],
        };
      }
      
      return {
        'success': false,
        'error': data['message'] ?? 'Failed to list transactions',
      };
    } catch (e) {
      return {
        'success': false,
        'error': 'Exception: ${e.toString()}',
      };
    }
  }
  
  /// Charge authorization (for recurring payments)
  Future<Map<String, dynamic>> chargeAuthorization({
    required String authorizationCode,
    required String email,
    required double amount,
    required String reference,
    Map<String, dynamic>? metadata,
  }) async {
    try {
      final url = Uri.parse('$baseUrl/transaction/charge_authorization');
      
      final amountInKobo = (amount * 100).toInt();
      
      final body = {
        'authorization_code': authorizationCode,
        'email': email,
        'amount': amountInKobo.toString(),
        'reference': reference,
        if (metadata != null) 'metadata': metadata,
      };
      
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $secretKey',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      );
      
      final data = jsonDecode(response.body);
      
      if (response.statusCode == 200 && data['status'] == true) {
        return {
          'success': true,
          'status': data['data']['status'],
          'reference': data['data']['reference'],
          'amount': data['data']['amount'] / 100,
        };
      }
      
      return {
        'success': false,
        'error': data['message'] ?? 'Charge failed',
      };
    } catch (e) {
      return {
        'success': false,
        'error': 'Exception: ${e.toString()}',
      };
    }
  }
  
  /// Verify webhook signature
  bool verifyWebhookSignature(String payload, String signature) {
    try {
      final hash = Hmac(sha512, utf8.encode(secretKey));
      final digest = hash.convert(utf8.encode(payload));
      final computedSignature = digest.toString();
      
      return computedSignature == signature;
    } catch (e) {
      return false;
    }
  }
  
  /// Generate unique transaction reference
  static String generateReference({String? prefix}) {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final random = DateTime.now().microsecond;
    final ref = '${prefix ?? 'TXN'}_${timestamp}_$random';
    return ref.toUpperCase();
  }
  
  /// Calculate Paystack fees
  /// Paystack charges: 1.5% capped at ₦2,000
  static double calculatePaystackFee(double amount) {
    final fee = amount * 0.015; // 1.5%
    return fee > 2000 ? 2000 : fee; // Cap at ₦2,000
  }
  
  /// Calculate net amount after fees
  static double calculateNetAmount(double amount) {
    final fee = calculatePaystackFee(amount);
    return amount - fee;
  }
  
  /// Refund transaction
  Future<Map<String, dynamic>> refundTransaction({
    required String reference,
    double? amount,
    String? merchantNote,
  }) async {
    try {
      final url = Uri.parse('$baseUrl/refund');
      
      final body = {
        'transaction': reference,
        if (amount != null) 'amount': (amount * 100).toInt(),
        if (merchantNote != null) 'merchant_note': merchantNote,
      };
      
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $secretKey',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      );
      
      final data = jsonDecode(response.body);
      
      if (response.statusCode == 200 && data['status'] == true) {
        return {
          'success': true,
          'refund': data['data'],
        };
      }
      
      return {
        'success': false,
        'error': data['message'] ?? 'Refund failed',
      };
    } catch (e) {
      return {
        'success': false,
        'error': 'Exception: ${e.toString()}',
      };
    }
  }


// File: server/lib/src/services/payment/paystack_service.dart
// Add these methods to the existing PaystackService class

  /// Create transfer recipient
  Future<Map<String, dynamic>> createTransferRecipient({
    required String type,
    required String name,
    required String accountNumber,
    required String bankCode,
    String currency = 'NGN',
  }) async {
    try {
      final url = Uri.parse('$baseUrl/transferrecipient');
      
      final body = {
        'type': type, // nuban
        'name': name,
        'account_number': accountNumber,
        'bank_code': bankCode,
        'currency': currency,
      };
      
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $secretKey',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      );
      
      final data = jsonDecode(response.body);
      
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (data['status'] == true) {
          return {
            'success': true,
            'recipient_code': data['data']['recipient_code'],
            'recipient_id': data['data']['id'].toString(),
            'bank_name': data['data']['details']['bank_name'],
          };
        }
      }
      
      return {
        'success': false,
        'error': data['message'] ?? 'Failed to create recipient',
      };
    } catch (e) {
      return {
        'success': false,
        'error': 'Exception: ${e.toString()}',
      };
    }
  }
  
  /// Initiate transfer
  Future<Map<String, dynamic>> initiateTransfer({
    required double amount,
    required String recipient,
    String? reason,
    String? reference,
  }) async {
    try {
      final url = Uri.parse('$baseUrl/transfer');
      
      final amountInKobo = (amount * 100).toInt();
      
      final body = {
        'source': 'balance',
        'amount': amountInKobo.toString(),
        'recipient': recipient,
        if (reason != null) 'reason': reason,
        if (reference != null) 'reference': reference,
      };
      
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $secretKey',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      );
      
      final data = jsonDecode(response.body);
      
      if (response.statusCode == 200 && data['status'] == true) {
        return {
          'success': true,
          'transfer_code': data['data']['transfer_code'],
          'id': data['data']['id'].toString(),
          'reference': data['data']['reference'],
          'status': data['data']['status'],
          'amount': data['data']['amount'] / 100,
        };
      }
      
      return {
        'success': false,
        'error': data['message'] ?? 'Transfer failed',
        'error_code': data['code'],
      };
    } catch (e) {
      return {
        'success': false,
        'error': 'Exception: ${e.toString()}',
      };
    }
  }


/// Finalize transfer (for OTP verification if required)
Future<Map<String, dynamic>> finalizeTransfer({
required String transferCode,
required String otp,
}) async {
try {
final url = Uri.parse('$baseUrl/transfer/finalize_transfer');
final body = {
    'transfer_code': transferCode,
    'otp': otp,
  };
  
  final response = await http.post(
    url,
    headers: {
      'Authorization': 'Bearer $secretKey',
      'Content-Type': 'application/json',
    },
    body: jsonEncode(body),
  );
  
  final data = jsonDecode(response.body);
  
  if (response.statusCode == 200 && data['status'] == true) {
    return {
      'success': true,
      'status': data['data']['status'],
    };
  }
  
  return {
    'success': false,
    'error': data['message'] ?? 'Finalization failed',
  };
} catch (e) {
  return {
    'success': false,
    'error': 'Exception: ${e.toString()}',
  };
}}


/// Verify transfer
  Future<Map<String, dynamic>> verifyTransfer(String reference) async {
    try {
      final url = Uri.parse('$baseUrl/transfer/verify/$reference');

  final response = await http.get(
    url,
    headers: {
      'Authorization': 'Bearer $secretKey',
    },
  );
  
  final data = jsonDecode(response.body);
  
  if (response.statusCode == 200 && data['status'] == true) {
    return {
      'success': true,
      'status': data['data']['status'],
      'reference': data['data']['reference'],
      'amount': data['data']['amount'] / 100,
    };
  }
  
  return {
    'success': false,
    'error': data['message'] ?? 'Verification failed',
  };
} catch (e) {
  return {
    'success': false,
    'error': 'Exception: ${e.toString()}',
  };
}
}
/// List banks
Future<Map<String, dynamic>> listBanks({String country = 'nigeria'}) async {
try {
final url = Uri.parse('$baseUrl/bank').replace(
queryParameters: {'country': country},
);
  final response = await http.get(
    url,
    headers: {
      'Authorization': 'Bearer $secretKey',
    },
  );
  
  final data = jsonDecode(response.body);
  
  if (response.statusCode == 200 && data['status'] == true) {
    return {
      'success': true,
      'banks': data['data'],
    };
  }
  
  return {
    'success': false,
    'error': data['message'] ?? 'Failed to fetch banks',
  };
} catch (e) {
  return {
    'success': false,
    'error': 'Exception: ${e.toString()}',
  };
}
}
/// Resolve account number
Future<Map<String, dynamic>> resolveAccountNumber({
required String accountNumber,
required String bankCode,
}) async {
try {
final url = Uri.parse('$baseUrl/bank/resolve').replace(
queryParameters: {
'account_number': accountNumber,
'bank_code': bankCode,
},
);
  final response = await http.get(
    url,
    headers: {
      'Authorization': 'Bearer $secretKey',
    },
  );
  
  final data = jsonDecode(response.body);
  
  if (response.statusCode == 200 && data['status'] == true) {
    return {
      'success': true,
      'account_number': data['data']['account_number'],
      'account_name': data['data']['account_name'],
    };
  }
  
  return {
    'success': false,
    'error': data['message'] ?? 'Account resolution failed',
  };
} catch (e) {
  return {
    'success': false,
    'error': 'Exception: ${e.toString()}',
  };
}
}
}