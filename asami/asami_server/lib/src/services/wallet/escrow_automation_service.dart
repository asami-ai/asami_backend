// File: server/lib/src/services/wallet/escrow_automation_service.dart

import 'package:serverpod/serverpod.dart' hide Order;
import '../../generated/protocol.dart';
import 'wallet_service.dart';

class EscrowAutomationService {
  
  /// Create escrow when order is confirmed and paid
  static Future<OrderEscrow?> createEscrow(
    Session session, {
    required Order order,
    required double totalAmount,
    required double platformFee,
    required double paystackFee,
  }) async {
    try {
      final vendorEarnings = totalAmount - platformFee - paystackFee;
      
      // Calculate delivery deadline (5 days from now)
      final deliveryDeadline = DateTime.now().add(Duration(days: 5));
      
      // Create escrow
      final escrow = OrderEscrow(
        orderId: order.id,
        vendorId: order.vendorId,
        customerId: order.customerId,
        totalAmount: totalAmount,
        vendorEarnings: vendorEarnings,
        platformFee: platformFee,
        paystackFee: paystackFee,
        status: EscrowStatus.held,
        deliveryDeadline: deliveryDeadline,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
      
      final savedEscrow = await OrderEscrow.db.insertRow(session, escrow);
      
      // Record earning in wallet (pending)
      final wallet = await WalletService.getOrCreateWallet(session, order.vendorId);
      await WalletService.recordEarning(
        session,
        wallet: wallet,
        order: order,
        amount: totalAmount,
        platformFee: platformFee,
        paystackFee: paystackFee,
      );
      
      session.log('🔒 Escrow created for order ${order.orderNumber}: ₦${vendorEarnings.toStringAsFixed(2)}');
      
      return savedEscrow;
    } catch (e, stackTrace) {
      session.log('Escrow creation error: $e', stackTrace: stackTrace);
      return null;
    }
  }
  
  /// Mark order as delivered by vendor
  static Future<bool> markDelivered(
    Session session, {
    required String orderId,
    required DateTime deliveredAt,
  }) async {
    try {
      final escrow = await OrderEscrow.db.findFirstRow(
        session,
        where: (t) => t.orderId.equals(UuidValue.fromString(orderId)),
      );
      
      if (escrow == null) {
        session.log('⚠️ Escrow not found for order: $orderId');
        return false;
      }
      
      // Mark as delivered
      escrow.markedDeliveredAt = deliveredAt;
      
      // Start return window (2 days)
      escrow.returnWindowStart = deliveredAt;
      escrow.returnWindowEnd = deliveredAt.add(Duration(days: 2));
      escrow.isReturnWindowActive = true;
      
      // Schedule auto-release after 2 days + 48 hours for customer acknowledgment
      escrow.releaseScheduledAt = deliveredAt.add(Duration(days: 2, hours: 48));
      escrow.updatedAt = DateTime.now();
      
      await OrderEscrow.db.updateRow(session, escrow);
      
      session.log('📦 Delivery marked for order $orderId. Auto-release scheduled for ${escrow.releaseScheduledAt}');
      
      return true;
    } catch (e) {
      session.log('Mark delivered error: $e');
      return false;
    }
  }
  
  /// Customer acknowledges delivery
  static Future<bool> acknowledgeDelivery(
    Session session, {
    required String orderId,
  }) async {
    try {
      final escrow = await OrderEscrow.db.findFirstRow(
        session,
        where: (t) => t.orderId.equals(UuidValue.fromString(orderId)),
      );
      
      if (escrow == null) return false;
      
      escrow.customerAcknowledgedAt = DateTime.now();
      
      // If acknowledged, release immediately after return window expires
      if (escrow.returnWindowEnd != null) {
        escrow.releaseScheduledAt = escrow.returnWindowEnd;
      }
      
      escrow.updatedAt = DateTime.now();
      await OrderEscrow.db.updateRow(session, escrow);
      
      session.log('✅ Customer acknowledged delivery for order $orderId');
      
      return true;
    } catch (e) {
      session.log('Acknowledge delivery error: $e');
      return false;
    }
  }
  
  /// Check and release escrows that are ready
  static Future<int> processScheduledReleases(Session session) async {
    final now = DateTime.now();
    int releasedCount = 0;
    
    // Find escrows ready for release
    final readyEscrows = await OrderEscrow.db.find(
      session,
      where: (t) => 
          t.status.equals(EscrowStatus.held) &
          (t.releaseScheduledAt <now) &
          t.canRelease.equals(false), // Not yet released
    );
    
    for (var escrow in readyEscrows) {
      // Check if return window has expired
      if (escrow.returnWindowEnd != null && 
          now.isAfter(escrow.returnWindowEnd!) &&
          !escrow.hasActiveReturn) {
        
        escrow.isReturnWindowExpired = true;
        escrow.isReturnWindowActive = false;
        escrow.canRelease = true;
        
        // Release funds
        final released = await WalletService.releaseEscrow(
          session,
          escrow: escrow,
          reason: escrow.customerAcknowledgedAt != null 
              ? 'delivery_confirmed' 
              : 'auto_release',
        );
        
        if (released) {
          escrow.isAutoReleased = escrow.customerAcknowledgedAt == null;
          releasedCount++;
        }
        
        await OrderEscrow.db.updateRow(session, escrow);
      }
    }
    
    if (releasedCount > 0) {
      session.log('💰 Auto-released $releasedCount escrows');
    }
    
    return releasedCount;
  }
  
  /// Check delivery deadlines and handle expired orders
  static Future<int> processExpiredDeliveries(Session session) async {
    final now = DateTime.now();
    int expiredCount = 0;
    
    // Find orders past delivery deadline
    final expiredEscrows = await OrderEscrow.db.find(
      session,
      where: (t) =>
          t.status.equals(EscrowStatus.held) &
          (t.deliveryDeadline < now) &
          t.markedDeliveredAt.equals(null), // Not delivered
    );
    
    for (var escrow in expiredEscrows) {
      // Automatic refund if not delivered within 5 days
      final order = await Order.db.findById(session, escrow.orderId);
      
      if (order != null && 
          order.status != OrderStatus.delivered &&
          order.status != OrderStatus.cancelled) {
        
        session.log('⏰ Order ${order.orderNumber} exceeded delivery deadline');
        
        // Update order status
        order.status = OrderStatus.cancelled;
        order.cancelledAt = DateTime.now();
        order.cancellationReason = 'Delivery deadline exceeded (5 days)';
        await Order.db.updateRow(session, order);
        
        // Process refund
        await WalletService.processRefund(
          session,
          escrow: escrow,
          refundAmount: escrow.totalAmount,
          reason: 'Delivery deadline exceeded',
        );
        
        // Mark escrow as expired
        escrow.status = EscrowStatus.expired;
        escrow.updatedAt = DateTime.now();
        await OrderEscrow.db.updateRow(session, escrow);
        
        expiredCount++;
      }
    }
    
    if (expiredCount > 0) {
      session.log('⚠️ Processed $expiredCount expired deliveries');
    }
    
    return expiredCount;
  }
  
  /// Process return request
  static Future<bool> processReturnRequest(
    Session session, {
    required String orderId,
    required String reason,
  }) async {
    try {
      final escrow = await OrderEscrow.db.findFirstRow(
        session,
        where: (t) => t.orderId.equals(UuidValue.fromString(orderId)),
      );
      
      if (escrow == null) return false;
      
      // Check if within return window
      if (!escrow.isReturnWindowActive || escrow.isReturnWindowExpired) {
        session.log('❌ Return window expired for order $orderId');
        return false;
      }
      
      // Mark return as active
      escrow.hasActiveReturn = true;
      escrow.returnRequestedAt = DateTime.now();
      escrow.status = EscrowStatus.disputed;
      escrow.updatedAt = DateTime.now();
      
      await OrderEscrow.db.updateRow(session, escrow);
      
      session.log('🔄 Return request initiated for order $orderId');
      
      return true;
    } catch (e) {
      session.log('Return request error: $e');
      return false;
    }
  }
  
  /// Approve return and process refund
  static Future<bool> approveReturn(
    Session session, {
    required String orderId,
  }) async {
    try {
      final escrow = await OrderEscrow.db.findFirstRow(
        session,
        where: (t) => t.orderId.equals(UuidValue.fromString(orderId)),
      );
      
      if (escrow == null || !escrow.hasActiveReturn) {
        return false;
      }
      
      // Process refund
      final refunded = await WalletService.processRefund(
        session,
        escrow: escrow,
        refundAmount: escrow.totalAmount,
        reason: 'Return approved',
      );
      
      if (refunded) {
        session.log('✅ Return approved and refund processed for order $orderId');
      }
      
      return refunded;
    } catch (e) {
      session.log('Approve return error: $e');
      return false;
    }
  }
}