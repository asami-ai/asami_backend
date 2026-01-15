// File: server/lib/src/services/wallet/wallet_service.dart

import 'dart:convert';

import 'package:serverpod/serverpod.dart' hide Order;
import '../../generated/protocol.dart';

class WalletService {
  
  /// Get or create vendor wallet
  static Future<VendorWallet> getOrCreateWallet(
    Session session,
    UuidValue vendorId,
  ) async {
    var wallet = await VendorWallet.db.findFirstRow(
      session,
      where: (t) => t.vendorId.equals(vendorId),
    );
    
    if (wallet == null) {
      wallet = VendorWallet(
        vendorId: vendorId,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
      
      wallet = await VendorWallet.db.insertRow(session, wallet);
      session.log('💰 Wallet created for vendor: ${vendorId.uuid}');
    }
    
    return wallet;
  }
  
  /// Record earnings from order (goes into escrow)
  static Future<WalletTransaction> recordEarning(
    Session session, {
    required VendorWallet wallet,
    required Order order,
    required double amount,
    required double platformFee,
    required double paystackFee,
  }) async {
    final vendorEarnings = amount - platformFee - paystackFee;
    
    // Update wallet - earnings go to pending (escrow)
    wallet.totalEarnings += vendorEarnings;
    wallet.pendingBalance += vendorEarnings;
    wallet.totalTransactions++;
    wallet.lastEarningAt = DateTime.now();
    wallet.updatedAt = DateTime.now();
    
    await VendorWallet.db.updateRow(session, wallet);
    
    // Create transaction record
    final transaction = WalletTransaction(
      walletId: wallet.id,
      vendorId: wallet.vendorId,
      type: WalletTransactionType.earning,
      amount: vendorEarnings,
      balanceBefore: wallet.availableBalance + wallet.pendingBalance - vendorEarnings,
      balanceAfter: wallet.availableBalance + wallet.pendingBalance,
      referenceType: 'order',
      referenceId: order.id.uuid,
      orderId: order.id,
      description: 'Earnings from order ${order.orderNumber}',
      isInEscrow: true,
      metadata: jsonEncode({
        'order_number': order.orderNumber,
        'total_amount': amount,
        'platform_fee': platformFee,
        'paystack_fee': paystackFee,
        'vendor_earnings': vendorEarnings,
      }),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    
    final savedTransaction = await WalletTransaction.db.insertRow(session, transaction);
    
    session.log('💵 Earnings recorded: ₦${vendorEarnings.toStringAsFixed(2)} (Order ${order.orderNumber})');
    
    return savedTransaction;
  }
  
  /// Release funds from escrow to available balance
  static Future<bool> releaseEscrow(
    Session session, {
    required OrderEscrow escrow,
    required String reason,
  }) async {
    try {
      // Get wallet transaction
      final transaction = await WalletTransaction.db.findFirstRow(
        session,
        where: (t) => t.orderId.equals(escrow.orderId) & 
                     t.type.equals(WalletTransactionType.earning),
      );
      
      if (transaction == null) {
        session.log('⚠️ Transaction not found for escrow: ${escrow.orderId.uuid}');
        return false;
      }
      
      // Get wallet
      final wallet = await VendorWallet.db.findById(session, transaction.walletId);
      if (wallet == null) {
        session.log('⚠️ Wallet not found: ${transaction.walletId.uuid}');
        return false;
      }
      
      // Move from pending to available
      wallet.pendingBalance -= transaction.amount;
      wallet.availableBalance += transaction.amount;
      wallet.updatedAt = DateTime.now();
      
      await VendorWallet.db.updateRow(session, wallet);
      
      // Update transaction
      transaction.isInEscrow = false;
      transaction.escrowReleasedAt = DateTime.now();
      transaction.status = TransactionStatus.completed;
      transaction.updatedAt = DateTime.now();
      
      await WalletTransaction.db.updateRow(session, transaction);
      
      // Update escrow
      escrow.status = EscrowStatus.released;
      escrow.releasedAt = DateTime.now();
      escrow.releaseReason = reason;
      escrow.updatedAt = DateTime.now();
      
      await OrderEscrow.db.updateRow(session, escrow);
      
      session.log('✅ Escrow released: ₦${transaction.amount.toStringAsFixed(2)} for order ${escrow.orderId.uuid}');
      
      return true;
    } catch (e, stackTrace) {
      session.log('❌ Release escrow error: $e', stackTrace: stackTrace);
      return false;
    }
  }
  
  /// Process refund (return money to customer, remove from pending)
  static Future<bool> processRefund(
    Session session, {
    required OrderEscrow escrow,
    required double refundAmount,
    required String reason,
  }) async {
    try {
      // Get wallet transaction
      final transaction = await WalletTransaction.db.findFirstRow(
        session,
        where: (t) => t.orderId.equals(escrow.orderId) & 
                     t.type.equals(WalletTransactionType.earning),
      );
      
      if (transaction == null) return false;
      
      // Get wallet
      final wallet = await VendorWallet.db.findById(session, transaction.walletId);
      if (wallet == null) return false;
      
      // Remove from pending balance
      wallet.pendingBalance -= transaction.amount;
      wallet.updatedAt = DateTime.now();
      
      await VendorWallet.db.updateRow(session, wallet);
      
      // Create refund transaction
      final refundTransaction = WalletTransaction(
        walletId: wallet.id,
        vendorId: wallet.vendorId,
        type: WalletTransactionType.refund,
        amount: -transaction.amount, // Negative amount
        balanceBefore: wallet.availableBalance + wallet.pendingBalance + transaction.amount,
        balanceAfter: wallet.availableBalance + wallet.pendingBalance,
        referenceType: 'refund',
        referenceId: escrow.orderId.uuid,
        orderId: escrow.orderId,
        description: 'Refund for order - $reason',
        status: TransactionStatus.completed,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
      
      await WalletTransaction.db.insertRow(session, refundTransaction);
      
      // Update original transaction
      transaction.isInEscrow = false;
      transaction.status = TransactionStatus.reversed;
      transaction.updatedAt = DateTime.now();
      
      await WalletTransaction.db.updateRow(session, transaction);
      
      // Update escrow
      escrow.status = EscrowStatus.refunded;
      escrow.isRefunded = true;
      escrow.refundProcessedAt = DateTime.now();
      escrow.updatedAt = DateTime.now();
      
      await OrderEscrow.db.updateRow(session, escrow);
      
      session.log('💸 Refund processed: ₦${transaction.amount.toStringAsFixed(2)}');
      
      return true;
    } catch (e, stackTrace) {
      session.log('❌ Refund error: $e', stackTrace: stackTrace);
      return false;
    }
  }
  
  /// Deduct platform fee
  static Future<WalletTransaction?> deductPlatformFee(
    Session session, {
    required VendorWallet wallet,
    required Order order,
    required double feeAmount,
  }) async {
    try {
      // Create fee transaction
      final transaction = WalletTransaction(
        walletId: wallet.id,
        vendorId: wallet.vendorId,
        type: WalletTransactionType.platform_fee,
        amount: -feeAmount, // Negative
        balanceBefore: wallet.availableBalance,
        balanceAfter: wallet.availableBalance - feeAmount,
        referenceType: 'order',
        referenceId: order.id.uuid,
        orderId: order.id,
        description: 'Platform fee for order ${order.orderNumber}',
        status: TransactionStatus.completed,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
      
      return await WalletTransaction.db.insertRow(session, transaction);
    } catch (e) {
      session.log('Fee deduction error: $e');
      return null;
    }
  }
  
  /// Get wallet summary
  static Future<Map<String, dynamic>> getWalletSummary(
    Session session,
    UuidValue vendorId,
  ) async {
    final wallet = await getOrCreateWallet(session, vendorId);
    
    // Get recent transactions
    final recentTransactions = await WalletTransaction.db.find(
      session,
      where: (t) => t.vendorId.equals(vendorId),
      orderBy: (t) => t.createdAt,
      orderDescending: true,
      limit: 10,
    );
    
    // Get pending escrows
    final pendingEscrows = await OrderEscrow.db.find(
      session,
      where: (t) => t.vendorId.equals(vendorId) & 
                   t.status.equals(EscrowStatus.held),
    );
    
    return {
      'wallet': wallet,
      'summary': {
        'total_earnings': wallet.totalEarnings,
        'available_balance': wallet.availableBalance,
        'pending_balance': wallet.pendingBalance,
        'processing_balance': wallet.processingBalance,
        'total_withdrawn': wallet.totalWithdrawn,
      },
      'recent_transactions': recentTransactions,
      'pending_escrows': pendingEscrows,
      'pending_count': pendingEscrows.length,
    };
  }
}