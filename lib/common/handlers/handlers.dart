import 'package:flutter/material.dart' show debugPrint, BuildContext, Navigator;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tcp_receiver/transaction.dart' show TcpTransactionResponse;

import '../../helpers/print_helper.dart' show PrintHelper;
import '../../helpers/transaction_helper.dart';
import '../../models/payment.dart';
import '../../models/transaction_result.dart' show TransactionResult;
import '../providers/tcp.provider.dart' show tcpServerProvider;

class IntentTransactionHandler extends TransactionHandler {
  @override
  Future<void> postTransaction(
      Payment payment, TransactionResult result, WidgetRef ref) async {
    TransactionHelper.completeTransaction(payment, result);
  }

  @override
  void onSuccessfulPayment(BuildContext context, TransactionResult result,
      Payment payment, WidgetRef ref) {
    PrintHelper.printReceipts(context, ref, result.ourReferenceNumber!);
  }

  @override
  void onFailedPayment(BuildContext context, TransactionResult result,
      Payment payment, WidgetRef ref) {
    TransactionHelper.completeTransaction(payment, result);
  }
}

class TcpTransactionHandler extends TransactionHandler {
  @override
  Future<void> postTransaction(
      Payment payment, TransactionResult result, WidgetRef ref) async {
    debugPrint("Cleaning up after TCP transaction...");
    final tcpTransaction = TcpTransactionResponse(
      status: result.isSuccessful ? 'True' : 'False',
      responseCode: result.responseCode ?? '',
      message: result.responseMessage ?? '',
      rrn: result.ourReferenceNumber ?? '',
      panBin: result.pan ?? '000000',
      uniqueId: payment.uniqueId ?? '',
    );

    await ref.read(tcpServerProvider).complete(tcpTransaction.toString());
  }

  @override
  void onSuccessfulPayment(BuildContext context, TransactionResult result,
      Payment payment, WidgetRef ref) {
    PrintHelper.printReceipts(context, ref, result.ourReferenceNumber!);
  }

  @override
  void onFailedPayment(BuildContext context, TransactionResult result,
      Payment payment, WidgetRef ref) {
    postTransaction(payment, result, ref);
    Navigator.pop(context);
  }
}

class KeypadTransactionHandler extends TransactionHandler {
  @override
  Future<void> postTransaction(
      Payment context, TransactionResult result, WidgetRef ref) async {
    debugPrint("Cleaning up after Keypad transaction...");
  }

  @override
  void onSuccessfulPayment(BuildContext context, TransactionResult result,
      Payment payment, WidgetRef ref) {
    PrintHelper.printMerchantReceipt(context, ref, result.ourReferenceNumber!);
  }

  @override
  void onFailedPayment(BuildContext context, TransactionResult result,
      Payment payment, WidgetRef ref) {
    // TODO: implement onFailedPayment
  }
}

abstract class TransactionHandler {
  Future<void> postTransaction(
      Payment context, TransactionResult result, WidgetRef ref);

  void onSuccessfulPayment(BuildContext context, TransactionResult result,
      Payment payment, WidgetRef ref);

  void onFailedPayment(BuildContext context, TransactionResult result,
      Payment payment, WidgetRef ref);
}
