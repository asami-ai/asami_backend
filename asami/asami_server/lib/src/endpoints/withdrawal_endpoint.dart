// File: server/lib/src/endpoints/withdrawal_endpoint.dart

import 'package:serverpod/serverpod.dart' hide Order;
import '../generated/protocol.dart';
import '../services/dependency_injection.dart';
import '../services/payment/paystack_service.dart';
import '../services/wallet/wallet_service.dart';
import '../services/wallet/withdrawal_service.dart';

class WithdrawalEndpoint extends Endpoint {
  /// Get available banks
  Future<Map<String, dynamic>> getBanks(Session session) async {
    try {
      final paystackService = getIt<PaystackService>();
      return await paystackService.listBanks();
    } catch (e, stackTrace) {
      session.log('Get banks error: $e', stackTrace: stackTrace);
      return {
        'success': false,
        'error': e.toString(),
      };
    }
  }

  /// Verify account details
  Future<Map<String, dynamic>> verifyAccount(
    Session session, {
    required String accountNumber,
    required String bankCode,
  }) async {
    try {
      final paystackService = getIt<PaystackService>();
      return await paystackService.resolveAccountNumber(
        accountNumber: accountNumber,
        bankCode: bankCode,
      );
    } catch (e, stackTrace) {
      session.log('Verify account error: $e', stackTrace: stackTrace);
      return {
        'success': false,
        'error': e.toString(),
      };
    }
  }

  /// Setup bank account for withdrawals
  Future<Map<String, dynamic>> setupBankAccount(
    Session session, {
    required String vendorId,
    required String bankCode,
    required String accountNumber,
    required String accountName,
  }) async {
    try {
      // Get wallet
      final wallet = await WalletService.getOrCreateWallet(
        session,
        UuidValue.fromString(vendorId),
      );

      final paystackService = getIt<PaystackService>();

      return await WithdrawalService.createRecipient(
        session,
        paystackService,
        wallet: wallet,
        bankCode: bankCode,
        accountNumber: accountNumber,
        accountName: accountName,
      );
    } catch (e, stackTrace) {
      session.log('Setup bank account error: $e', stackTrace: stackTrace);
      return {
        'success': false,
        'error': e.toString(),
      };
    }
  }

  /// Request withdrawal
  Future<Map<String, dynamic>> requestWithdrawal(
    Session session, {
    required String vendorId,
    required double amount,
    String? notes,
  }) async {
    try {
      return await WithdrawalService.requestWithdrawal(
        session,
        vendorId: UuidValue.fromString(vendorId),
        amount: amount,
        vendorNotes: notes,
      );
    } catch (e, stackTrace) {
      session.log('Request withdrawal error: $e', stackTrace: stackTrace);
      return {
        'success': false,
        'error': e.toString(),
      };
    }
  }

  /// Get withdrawal history
  Future<List<WithdrawalRequest>> getWithdrawalHistory(
    Session session, {
    required String vendorId,
    int limit = 20,
  }) async {
    try {
      return await WithdrawalRequest.db.find(
        session,
        where: (t) => t.vendorId.equals(UuidValue.fromString(vendorId)),
        orderBy: (t) => t.createdAt,
        orderDescending: true,
        limit: limit,
      );
    } catch (e, stackTrace) {
      session.log('Get withdrawal history error: $e', stackTrace: stackTrace);
      return [];
    }
  }

  /// Get pending withdrawals (admin)
  Future<List<WithdrawalRequest>> getPendingWithdrawals(
    Session session, {
    int limit = 50,
  }) async {
    try {
      return await WithdrawalRequest.db.find(
        session,
        where: (t) => t.status.equals(WithdrawalStatus.pending),
        orderBy: (t) => t.createdAt,
        limit: limit,
      );
    } catch (e, stackTrace) {
      session.log('Get pending withdrawals error: $e', stackTrace: stackTrace);
      return [];
    }
  }

  /// Process withdrawal (admin/automated)
  Future<Map<String, dynamic>> processWithdrawal(
    Session session, {
    required String requestNumber,
  }) async {
    try {
      final paystackService = getIt<PaystackService>();

      return await WithdrawalService.processWithdrawal(
        session,
        paystackService,
        requestNumber: requestNumber,
      );
    } catch (e, stackTrace) {
      session.log('Process withdrawal error: $e', stackTrace: stackTrace);
      return {
        'success': false,
        'error': e.toString(),
      };
    }
  }
}
