import 'package:flutter/material.dart' show BuildContext, debugPrint;
import 'package:tcp_receiver/tcp_receiver.dart';
import 'package:tcp_receiver/transaction.dart' show TcpTransactionResponse;

import '../../helpers/transaction_helper.dart';
import '../../models/payment.dart';
import '../../models/payment_request.dart' show TransactionHandler;
import '../../models/transaction_result.dart' show TransactionResult;

class IntentTransactionHandler extends TransactionHandler {
  @override
  Future<void> postTransaction(
      Payment payment, TransactionResult result) async {
    TransactionHelper.completeTransaction(payment, result);
  }
}

class TcpTransactionHandler extends TransactionHandler {
  @override
  Future<void> postTransaction(
      Payment payment, TransactionResult result) async {
    debugPrint("Cleaning up after TCP transaction...");
    final receiver = TcpReceiver();
    final tcpTransaction = TcpTransactionResponse(
      status: result.isSuccessful ? 'True' : 'False',
      responseCode: result.responseCode ?? '',
      message: result.responseMessage ?? '',
      rrn: result.ourReferenceNumber ?? '',
      panBin: result.pan ?? '000000',
      uniqueId: payment.uniqueId ?? '',
    );
    await receiver.sendTransactionCompleted(tcpTransaction);
  }
}

class KeypadTransactionHandler extends TransactionHandler {
  @override
  Future<void> postTransaction(
      Payment context, TransactionResult result) async {
    debugPrint("Cleaning up after Keypad transaction...");
    // Maybe reset input fields or log locally
  }
}
