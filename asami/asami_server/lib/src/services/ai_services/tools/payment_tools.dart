// File: server/lib/src/services/ai_services/tools/payment_tools.dart

import 'package:serverpod/serverpod.dart' hide Order;

import '../../../endpoints/order_endpoint.dart';
import '../../../endpoints/withdrawal_endpoint.dart';
import '../../../generated/protocol.dart';
import '../../wallet/wallet_service.dart';
import 'tool_definition.dart';
import 'tool_registry.dart';

class PaymentTools {
  static void registerAll(ToolRegistry registry) {
    
    // Check wallet balance
    registry.register(
      definition: ToolDefinition(
        name: 'check_wallet_balance',
        description: 'Check vendor wallet balance and earnings',
        parameters: {},
      ),
      handler: _handleCheckWallet,
      allowedRoles: ['vendor'],
    );
    
    // Request withdrawal
    registry.register(
      definition: ToolDefinition(
        name: 'request_withdrawal',
        description: 'Request to withdraw available funds to bank account',
        parameters: {
          'amount': ToolParameter(
            type: 'number',
            description: 'Amount to withdraw in NGN',
          ),
        },
        requiredParameters: ['amount'],
      ),
      handler: _handleRequestWithdrawal,
      allowedRoles: ['vendor'],
    );
    
    // Get escrow status
    registry.register(
      definition: ToolDefinition(
        name: 'check_order_escrow',
        description: 'Check escrow status and return window for an order',
        parameters: {
          'order_number': ToolParameter(
            type: 'string',
            description: 'Order number to check',
          ),
        },
        requiredParameters: ['order_number'],
      ),  
      handler: _handleCheckEscrow,
      allowedRoles: ['customer'],
    );
    
    // Acknowledge delivery (customer)
    registry.register(
      definition: ToolDefinition(
        name: 'confirm_delivery',
        description: 'Customer confirms they received their order',
        parameters: {
          'order_number': ToolParameter(
            type: 'string',
            description: 'Order number',
          ),
        },
        requiredParameters: ['order_number'],
      ),
      handler: _handleConfirmDelivery,
      allowedRoles: ['customer'],
    );
    
    // Mark as delivered (vendor)
    registry.register(
      definition: ToolDefinition(
        name: 'mark_delivered',
        description: 'Vendor marks order as delivered to start return window',
        parameters: {
          'order_number': ToolParameter(
            type: 'string',
            description: 'Order number',
          ),
        },
        requiredParameters: ['order_number'],
      ),
      handler: _handleMarkDelivered,
      allowedRoles: ['vendor'],
    );
  }
  
  static Future<Map<String, dynamic>> _handleCheckWallet(
    Map<String, dynamic> arguments,
    ToolExecutionContext context,
  ) async {
    final session = context.session!;
    
    final summary = await WalletService.getWalletSummary(
      session,
      UuidValue.fromString(context.userId),
    );
    
    if (!summary['found']) {
      return {
        'success': false,
        'error': 'Wallet not found',
      };
    }
    
    return {
      'success': true,
      'wallet': summary['summary'],
      'pending_escrows': summary['pending_escrows'],
      'recent_transactions': summary['recent_transactions'],
    };
  }
  
  static Future<Map<String, dynamic>> _handleRequestWithdrawal(
    Map<String, dynamic> arguments,
    ToolExecutionContext context,
  ) async {
    final session = context.session!;
    final amount = (arguments['amount'] as num).toDouble();
    
    return await WithdrawalEndpoint().requestWithdrawal(
      session,
      vendorId: context.userId,
      amount: amount,
    );
  }
  
  static Future<Map<String, dynamic>> _handleCheckEscrow(
    Map<String, dynamic> arguments,
    ToolExecutionContext context,
  ) async {
    final session = context.session!;
    final orderNumber = arguments['order_number'] as String;
    
    final order = await Order.db.findFirstRow(
      session,
      where: (t) => t.orderNumber.equals(orderNumber),
    );
    
    if (order == null) {
      return {'success': false, 'error': 'Order not found'};
    }
    
    final escrow = await OrderEscrow.db.findFirstRow(
      session,
      where: (t) => t.orderId.equals(order.id),
    );
    
    if (escrow == null) {
      return {'success': false, 'error': 'Escrow not found'};
    }
    
    return {
      'success': true,
      'escrow': {
        'status': escrow.status.name,
        'vendor_earnings': escrow.vendorEarnings,
        'return_window_active': escrow.isReturnWindowActive,
        'return_window_end': escrow.returnWindowEnd?.toIso8601String(),
        'delivery_deadline': escrow.deliveryDeadline.toIso8601String(),
        'is_auto_released': escrow.isAutoReleased,
        'customer_acknowledged': escrow.customerAcknowledgedAt != null,
      },
    };
  }
  
  static Future<Map<String, dynamic>> _handleConfirmDelivery(
    Map<String, dynamic> arguments,
    ToolExecutionContext context,
  ) async {
    final session = context.session!;
    final orderNumber = arguments['order_number'] as String;
    
    return await OrderEndpoint().acknowledgeDelivery(
      session,
      orderNumber: orderNumber,
      customerId: context.userId,
    );
  }
  
  static Future<Map<String, dynamic>> _handleMarkDelivered(
    Map<String, dynamic> arguments,
    ToolExecutionContext context,
  ) async {
    final session = context.session!;
    final orderNumber = arguments['order_number'] as String;
    
    return await OrderEndpoint().markOrderAsDelivered(
      session,
      orderNumber: orderNumber,
      vendorId: context.userId,
    );
  }
}