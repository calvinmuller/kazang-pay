import 'package:flutter/material.dart' show BuildContext, showDialog;
import 'package:flutter/services.dart' show MethodChannel, PlatformException;
import 'package:intl/intl.dart' show DateFormat;

import '../common/dialogs/print_dialog.dart' show PrintDialog;
import '../models/app_state.dart';
import '../models/printer.dart';
import '../models/transaction.dart';
import '../models/transaction_result.dart';
import 'currency_helpers.dart';

class PrintHelper {
  static final PrintHelper _instance = PrintHelper._();

  PrintHelper._();

  final MethodChannel methodChannel = const MethodChannel('kazangpay_print');

  /// 0 - Merchant
  /// 1 - Customer
  static Future<String> setReceiptType(int type) async {
    try {
      final String result = await _instance.methodChannel
          .invokeMethod('setReceiptType', {'receiptType': type});
      return result;
    } on PlatformException {
      rethrow;
    }
  }

  static Future<String> addDoubleTextPrintCommand(
      {String? leftValue, String? rightValue}) async {
    try {
      final String result = await _instance.methodChannel.invokeMethod(
          'addDoubleTextPrintCommand',
          {'leftValue': leftValue, 'rightValue': rightValue});
      return result;
    } on PlatformException {
      rethrow;
    }
  }

  static Future<String> startPrint(PrintRequest data) async {
    try {
      final String result = await _instance.methodChannel
          .invokeMethod('print', {'data': data.toJson()});
      return result;
    } on PlatformException {
      rethrow;
    }
  }

  static printReceipt({
    Transaction? transaction,
    BuildContext? context,
    MerchantConfig? merchantConfig,
    ReceiptSectionEnum receiptType = ReceiptSectionEnum.CUSTOMER,
  }) async {
    final df = DateFormat('yyyy-MM-dd');
    final tf = DateFormat('HH:mm:ss');

    final printRequest = PrintRequest(
      receiptSection: receiptType,
      headingFontSize: 40,
      trailerFontSize: 28,
      normalFontSize: 24,
      imageXpos: 50,
      imageWidth: 200,
      heading: merchantConfig!.tradingName,
    );
    var singleText = SingleTextPrintCommand(fontSize: 25);
    singleText.value = (receiptType == ReceiptSectionEnum.MERCHANT)
        ? "MERCHANT COPY"
        : "CUSTOMER COPY";
    printRequest.printLineItems.add(singleText);

    printRequest.printLineItems.add(NewLinePrintCommand());

    var text = DoubleTextPrintCommand(fontSize: 32);
    text.leftAlignedValue = "MERCHANTNO";
    text.rightAlignedValue = merchantConfig.merchantNumber;
    printRequest.printLineItems.add(text);

    text = DoubleTextPrintCommand(fontSize: 25);
    text.leftAlignedValue = "TERMINALID";
    text.rightAlignedValue = transaction!.terminalId;
    printRequest.printLineItems.add(text);

    text = DoubleTextPrintCommand(fontSize: 25);
    text.leftAlignedValue = "DATE";
    text.rightAlignedValue = df.format(transaction.transactionDateTime);
    printRequest.printLineItems.add(text);

    text = DoubleTextPrintCommand(fontSize: 25);
    text.leftAlignedValue = "TIME";
    text.rightAlignedValue = tf.format(transaction.transactionDateTime);
    printRequest.printLineItems.add(text);

    text = DoubleTextPrintCommand(fontSize: 25);
    text.leftAlignedValue = "AID";
    text.rightAlignedValue = transaction.applicationIdentifier;
    printRequest.printLineItems.add(text);

    text = DoubleTextPrintCommand(fontSize: 25);
    text.leftAlignedValue = "PAN";
    text.rightAlignedValue = transaction.maskedPan;
    printRequest.printLineItems.add(text);

    text = DoubleTextPrintCommand(fontSize: 25);
    text.leftAlignedValue = "TRANTYPE";
    text.rightAlignedValue = transaction.isPayment
        ? "PURCHASE"
        : transaction.isCashback
            ? "CASHBACK"
            : "VOID";
    printRequest.printLineItems.add(text);

    text = DoubleTextPrintCommand(fontSize: 25);
    text.leftAlignedValue = "TRANSSEQNO";
    text.rightAlignedValue = transaction.sequenceNumber.toString();
    printRequest.printLineItems.add(text);

    text = DoubleTextPrintCommand(fontSize: 25);
    text.leftAlignedValue = "RRN";
    text.rightAlignedValue = transaction.retrievalReferenceNumber;
    printRequest.printLineItems.add(text);

    text = DoubleTextPrintCommand(fontSize: 25);
    text.leftAlignedValue = "APP";
    text.rightAlignedValue = transaction.applicationLabel;
    printRequest.printLineItems.add(text);

    text = DoubleTextPrintCommand(fontSize: 25);
    text.leftAlignedValue = "SWITCH";
    text.rightAlignedValue = merchantConfig.routingSwitch == "LESAKA"
        ? "PRISM"
        : merchantConfig.routingSwitch;
    printRequest.printLineItems.add(text);

    printRequest.printLineItems.add(NewLinePrintCommand());

    text = DoubleTextPrintCommand(fontSize: 25);
    text.bold = true;
    text.leftAlignedValue = "TOTAL";
    text.rightAlignedValue =
        CurrencyHelper.formatCurrency(context, transaction.amount);
    printRequest.printLineItems.add(text);

    text = DoubleTextPrintCommand(fontSize: 32);
    text.leftAlignedValue = "RESPONSE:";
    text.rightAlignedValue = transaction.responseMessage;
    printRequest.printLineItems.add(text);

    printRequest.printLineItems.add(NewLinePrintCommand());

    singleText = SingleTextPrintCommand();
    singleText.value = "DESCRIPTION:";
    singleText.bold = true;
    singleText.italic = false;
    singleText.isHeader = false;
    singleText.isTrailer = false;
    printRequest.printLineItems.add(singleText);

    printRequest.printLineItems
        .add(SingleTextPrintCommand(value: transaction.responseMessage));

    printRequest.printLineItems.add(NewLinePrintCommand());

    await startPrint(printRequest);
  }
}

printReceiptDialog(
    {BuildContext? context,
    Transaction? transactionResult,
    ReceiptSectionEnum? type}) async {
  return await showDialog(
    context: context!,
    builder: (context) => PrintDialog(
      transactionResult: transactionResult!,
      type: type!,
    ),
  );
}
