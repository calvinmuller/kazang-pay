import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show StateNotifierProvider, WidgetRef;
import 'package:riverpod/riverpod.dart' show StateNotifier;

import '../../core/core.dart';
import '../../models/payment.dart' show Payment;
import '../../models/transaction_result.dart';
import '../handlers/handlers.dart';

final paymentControllerProvider =
    StateNotifierProvider<PaymentController, Payment>(
  (ref) => PaymentController(),
);

class PaymentController extends StateNotifier<Payment> {
  PaymentController() : super(Payment());

  void setPayment(Payment request) {
    state = request;
  }

  Future<void> postTransaction(BuildContext context, TransactionResult result, WidgetRef ref) async {
    handler.postTransaction(state, result, ref);
    Navigator.pop(context);
  }

  void onSuccessfulPayment(BuildContext context, TransactionResult result, Payment payment, WidgetRef ref) {
    handler.onSuccessfulPayment(context, result, payment, ref);
  }

  TransactionHandler get handler {
    TransactionHandler handler = KeypadTransactionHandler();
    if (state.launchMode == LaunchMode.wifi) {
      handler = TcpTransactionHandler();
    } else if (state.launchMode == LaunchMode.intent) {
      handler = IntentTransactionHandler();
    }
    return handler;
  }

  void onFailedPayment(BuildContext context, TransactionResult result, Payment payment, WidgetRef ref) {
     handler.onFailedPayment(context, result, payment, ref);
  }
}
