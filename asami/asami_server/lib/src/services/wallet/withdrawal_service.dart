// File: server/lib/src/services/wallet/withdrawal_service.dart

import 'package:serverpod/serverpod.dart' hide Order;
import '../../generated/protocol.dart';
import '../payment/paystack_service.dart';

class WithdrawalService {
  
  /// Create transfer recipient in Paystack
  static Future<Map<String, dynamic>> createRecipient(
    Session session,
    PaystackService paystackService, {
    required VendorWallet wallet,
    required String bankCode,
    required String accountNumber,
    required String accountName,
  }) async {
    try {
      // Call Paystack Create Transfer Recipient API
      final response = await paystackService.createTransferRecipient(
        type: 'nuban',
        name: accountName,
        accountNumber: accountNumber,
        bankCode: bankCode,
        currency: 'NGN',
      );
      
      if (!response['success']) {
        return response;
      }
      
      // Update wallet with recipient details
      wallet.recipientCode = response['recipient_code'];
      wallet.recipientId = response['recipient_id'];
      wallet.isRecipientActive = true;
      wallet.bankName = response['bank_name'];
      wallet.bankCode = bankCode;
      wallet.accountNumber = accountNumber;
      wallet.accountName = accountName;
      wallet.updatedAt = DateTime.now();
      
      await VendorWallet.db.updateRow(session, wallet);
      
      return {
        'success': true,
        'recipient_code': response['recipient_code'],
      };
    } catch (e, stackTrace) {
      session.log('Create recipient error: $e', stackTrace: stackTrace);
      return {
        'success': false,
        'error': e.toString(),
      };
    }
  }
  
  /// Initiate withdrawal request
  static Future<Map<String, dynamic>> requestWithdrawal(
    Session session, {
    required UuidValue vendorId,
    required double amount,
    String? vendorNotes,
  }) async {
    try {
      // Get wallet
      final wallet = await VendorWallet.db.findFirstRow(
        session,
        where: (t) => t.vendorId.equals(vendorId),
      );
      
      if (wallet == null) {
        return {'success': false, 'error': 'Wallet not found'};
      }
      
      // Validate amount
      if (amount < wallet.minimumWithdrawal) {
        return {
          'success': false,
          'error': 'Minimum withdrawal is ₦${wallet.minimumWithdrawal.toStringAsFixed(2)}',
        };
      }
      
      if (amount > wallet.availableBalance) {
        return {
          'success': false,
          'error': 'Insufficient balance. Available: ₦${wallet.availableBalance.toStringAsFixed(2)}',
        };
      }
      
      // Check if recipient is set up
      if (wallet.recipientCode == null || !wallet.isRecipientActive) {
        return {
          'success': false,
          'error': 'Bank account not set up. Please add your bank details first.',
        };
      }
      
      // Generate request number
      final requestNumber = 'WD-${DateTime.now().millisecondsSinceEpoch}';
      
      // Calculate fee (Paystack: ₦10 + 0.5% capped at ₦25)
      final transferFee = (amount * 0.005) + 10;
      final cappedFee = transferFee > 25 ? 25.0 : transferFee;
      final netAmount = amount - cappedFee;
      
      // Create withdrawal request
      final request = WithdrawalRequest(
        id: Uuid().v4obj(),
        vendorId: vendorId,
        walletId: wallet.id,
        requestNumber: requestNumber,
        amount: amount,
        currency: wallet.currency,
        bankName: wallet.bankName!,
        bankCode: wallet.bankCode!,
        accountNumber: wallet.accountNumber!,
        accountName: wallet.accountName!,
        status: WithdrawalStatus.pending,
        recipientCode: wallet.recipientCode,
        transferFee: cappedFee,
        netAmount: netAmount,
        vendorNotes: vendorNotes,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
      
      final savedRequest = await WithdrawalRequest.db.insertRow(session, request);
      
      // Move amount from available to processing
      wallet.availableBalance -= amount;
      wallet.processingBalance += amount;
      wallet.updatedAt = DateTime.now();
      await VendorWallet.db.updateRow(session, wallet);
      
      session.log('💸 Withdrawal requested: $requestNumber - ₦${amount.toStringAsFixed(2)}');
      
      return {
        'success': true,
        'request_number': requestNumber,
        'amount': amount,
        'fee': cappedFee,
        'net_amount': netAmount,
        'status': 'pending',
      };
    } catch (e, stackTrace) {
      session.log('Withdrawal request error: $e', stackTrace: stackTrace);
      return {
        'success': false,
        'error': e.toString(),
      };
    }
  }
  
  /// Process withdrawal (initiate Paystack transfer)
  static Future<Map<String, dynamic>> processWithdrawal(
    Session session,
    PaystackService paystackService, {
    required String requestNumber,
  }) async {
    try {
      final request = await WithdrawalRequest.db.findFirstRow(
        session,
        where: (t) => t.requestNumber.equals(requestNumber),
      );
      
      if (request == null) {
        return {'success': false, 'error': 'Request not found'};
      }
      
      if (request.status != WithdrawalStatus.pending) {
        return {'success': false, 'error': 'Request already processed'};
      }
      
      // Initiate Paystack transfer
      final transferResult = await paystackService.initiateTransfer(
        amount: request.netAmount!,
        recipient: request.recipientCode!,
        reason: 'Withdrawal: ${request.requestNumber}',
        reference: request.requestNumber,
      );
      
      if (!transferResult['success']) {
        // Mark as failed
        request.status = WithdrawalStatus.failed;
        request.failureReason = transferResult['error'];
        request.failureCode = transferResult['error_code'];
        request.retryCount++;
        request.updatedAt = DateTime.now();
        
        await WithdrawalRequest.db.updateRow(session, request);
        
        // Return amount to available balance
        final wallet = await VendorWallet.db.findById(session, request.walletId);
        if (wallet != null) {
          wallet.processingBalance -= request.amount;
          wallet.availableBalance += request.amount;
          wallet.failedWithdrawals++;
          wallet.updatedAt = DateTime.now();
          await VendorWallet.db.updateRow(session, wallet);
        }
        
        return transferResult;
      }
      
      // Update request with Paystack details
      request.transferCode = transferResult['transfer_code'];
      request.transferId = transferResult['id'];
      request.transferReference = transferResult['reference'];
      request.transferStatus = transferResult['status'];
      request.status = WithdrawalStatus.processing;
      request.processedAt = DateTime.now();
      request.updatedAt = DateTime.now();
      
      await WithdrawalRequest.db.updateRow(session, request);
      
      session.log('✅ Transfer initiated: ${request.transferCode}');
      
      return {
        'success': true,
        'transfer_code': request.transferCode,
        'status': request.transferStatus,
      };
    } catch (e, stackTrace) {
      session.log('Process withdrawal error: $e', stackTrace: stackTrace);
      return {
        'success': false,
        'error': e.toString(),
      };
    }
  }
  
  /// Complete withdrawal (called by webhook)
  static Future<bool> completeWithdrawal(
    Session session, {
    required String reference,
    required String status,
  }) async {
    try {
      final request = await WithdrawalRequest.db.findFirstRow(
        session,
        where: (t) => t.requestNumber.equals(reference),
      );
      
      if (request == null) return false;
      
      final wallet = await VendorWallet.db.findById(session, request.walletId);
      if (wallet == null) return false;
      
      if (status == 'success') {
        // Mark as completed
        request.status = WithdrawalStatus.completed;
        request.completedAt = DateTime.now();
        request.updatedAt = DateTime.now();
        
        await WithdrawalRequest.db.updateRow(session, request);
        
        // Update wallet
        wallet.processingBalance -= request.amount;
        wallet.totalWithdrawn += request.netAmount!;
        wallet.successfulWithdrawals++;
        wallet.lastWithdrawalAt = DateTime.now();
        wallet.updatedAt = DateTime.now();
        
        await VendorWallet.db.updateRow(session, wallet);
        
        // Create transaction record
        final transaction = WalletTransaction(
          id: Uuid().v4obj(),
          walletId: wallet.id,
          vendorId: wallet.vendorId,
          type: WalletTransactionType.withdrawal,
          amount: -request.amount,
          balanceBefore: wallet.availableBalance + wallet.processingBalance + request.amount,
          balanceAfter: wallet.availableBalance + wallet.processingBalance,
          referenceType: 'withdrawal',
          referenceId: request.id.uuid,
          description: 'Withdrawal: ${request.requestNumber}',
          status: TransactionStatus.completed,
          transferCode: request.transferCode,
          transferId: request.transferId,
          transferredAt: DateTime.now(),
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          processedAt: DateTime.now(),
        );
        
        await WalletTransaction.db.insertRow(session, transaction);
        
        session.log('✅ Withdrawal completed: ${request.requestNumber}');
        return true;
      } else {
        // Transfer failed
        request.status = WithdrawalStatus.failed;
        request.failureReason = 'Transfer failed';
        request.updatedAt = DateTime.now();
        
        await WithdrawalRequest.db.updateRow(session, request);
        
        // Return to available balance
        wallet.processingBalance -= request.amount;
        wallet.availableBalance += request.amount;
        wallet.failedWithdrawals++;
        wallet.updatedAt = DateTime.now();
        
        await VendorWallet.db.updateRow(session, wallet);
        
        session.log('❌ Withdrawal failed: ${request.requestNumber}');
        return false;
      }
    } catch (e, stackTrace) {
      session.log('Complete withdrawal error: $e', stackTrace: stackTrace);
      return false;
    }
  }
}