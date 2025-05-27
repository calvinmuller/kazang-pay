import 'payment.dart';
import 'transaction_result.dart';

class PaymentRequest {
  final String source; // "intent", "tcp", "keypad"
  final double amount;
  final String currency;
  final TransactionHandler handler;
  final Map<String, dynamic>? meta;

  PaymentRequest({
    required this.source,
    required this.amount,
    required this.currency,
    required this.handler,
    this.meta,
  });
}

abstract class TransactionHandler {
  Future<void> postTransaction(Payment context, TransactionResult result);
}