import 'package:serverpod/server.dart';

import '../../endpoints/payment_endpoint.dart';
import '../../generated/protocol.dart';

class CheckExpiredPaymentsJob extends FutureCall<EmptyModel> {
  @override
  Future<void> invoke(Session session, EmptyModel? object) async {
    final paymentEndpoint = PaymentEndpoint();
    final count = await paymentEndpoint.markExpiredTransactions(session);
    
    if (count > 0) {
      session.log('⏰ Marked $count transactions as expired');
    }
  }
}