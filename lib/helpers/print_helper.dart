import 'package:flutter/material.dart' show BuildContext, showDialog;
import 'package:flutter/services.dart' show MethodChannel, PlatformException;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart' show DateFormat;

import '../common/dialogs/print_dialog.dart' show PrintDialog;
import '../common/providers/app.provider.dart' show appNotifierProvider;
import '../common/providers/transaction.provider.dart'
    show getByReferenceDataProvider;
import '../models/app_state.dart';
import '../models/printer.dart';
import '../models/transaction.dart';
import 'currency_helpers.dart';

class PrintHelper {
  static final PrintHelper _instance = PrintHelper._();

  PrintHelper._();

  final MethodChannel methodChannel = const MethodChannel('kazangpay_print');

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

  static Future<String> sendPrinterData(
      PrintRequest clientReceipt, PrintRequest merchantReceipt) async {
    try {
      final String result = await _instance.methodChannel.invokeMethod(
        'sendPrinterData',
        {
          'merchantReceipt': merchantReceipt.toJson(),
          'clientReceipt': clientReceipt.toJson(),
        },
      );
      return result;
    } on PlatformException {
      rethrow;
    }
  }

  static Future<PrintRequest?> printReceipt({
    Transaction? transaction,
    BuildContext? context,
    MerchantConfig? merchantConfig,
    TerminalConfig? terminalConfig,
    ReceiptSectionEnum receiptType = ReceiptSectionEnum.CUSTOMER,
    bool returnResult = false,
  }) async {
    final df = DateFormat('yyyy-MM-dd');
    final tf = DateFormat('HH:mm:ss');

    const itemFontSize = 20;

    final printRequest = PrintRequest(
        receiptSection: receiptType,
        headingFontSize: 28,
        trailerFontSize: 28,
        normalFontSize: itemFontSize,
        imageXpos: 0,
        imageWidth: 348,
        pageWidth: 352,
        heading: terminalConfig?.slipHeader,
        customerTrailer: terminalConfig?.slipTrailer,
        fontName: 'arial');
    var singleText =
        SingleTextPrintCommand(fontSize: 25, alignment: AlignmentEnum.CENTER);
    singleText.value = (receiptType == ReceiptSectionEnum.MERCHANT)
        ? "MERCHANT COPY"
        : "CUSTOMER COPY";
    printRequest.printLineItems.add(singleText);

    printRequest.printLineItems.add(NewLinePrintCommand());

    final amount =
        transaction!.isVoid ? -transaction.amount : transaction.amount;

    var text = DoubleTextPrintCommand(fontSize: itemFontSize);
    text.leftAlignedValue = "MERCHANTNO";
    // only show last 4 digits of merchant number only if receiptType === ReceiptSectionEnum.Customer
    text.rightAlignedValue = merchantConfig?.merchantNumber.substring(
      (receiptType == ReceiptSectionEnum.CUSTOMER)
          ? merchantConfig.merchantNumber.length - 4
          : 0,
    );
    printRequest.printLineItems.add(text);

    text = DoubleTextPrintCommand(fontSize: itemFontSize);
    text.leftAlignedValue = "TERMINALID";
    text.rightAlignedValue = transaction.terminalId.substring(
      (receiptType == ReceiptSectionEnum.CUSTOMER)
          ? transaction.terminalId.length - 4
          : 0,
    );
    printRequest.printLineItems.add(text);

    text = DoubleTextPrintCommand(fontSize: itemFontSize);
    text.leftAlignedValue = "DATE";
    text.rightAlignedValue = df.format(transaction.transactionDateTime);
    printRequest.printLineItems.add(text);

    text = DoubleTextPrintCommand(fontSize: itemFontSize);
    text.leftAlignedValue = "TIME";
    text.rightAlignedValue = tf.format(transaction.transactionDateTime);
    printRequest.printLineItems.add(text);

    text = DoubleTextPrintCommand(fontSize: itemFontSize);
    text.leftAlignedValue = "AID";
    text.rightAlignedValue = transaction.applicationIdentifier?.substring(
          (receiptType == ReceiptSectionEnum.CUSTOMER)
              ? transaction.applicationIdentifier!.length - 4
              : 0,
        ) ??
        "";
    printRequest.printLineItems.add(text);

    text = DoubleTextPrintCommand(fontSize: itemFontSize);
    text.leftAlignedValue = "PAN";
    text.rightAlignedValue = transaction.maskedPan;
    printRequest.printLineItems.add(text);

    text = DoubleTextPrintCommand(fontSize: itemFontSize);
    text.leftAlignedValue = "TRANTYPE";
    text.rightAlignedValue = transaction.type;
    printRequest.printLineItems.add(text);

    text = DoubleTextPrintCommand(fontSize: itemFontSize);
    text.leftAlignedValue = "TRANSSEQNO";
    text.rightAlignedValue = transaction.sequenceNumber.toString();
    printRequest.printLineItems.add(text);

    text = DoubleTextPrintCommand(fontSize: itemFontSize);
    text.leftAlignedValue = "RRN";
    text.rightAlignedValue = transaction.retrievalReferenceNumber;
    printRequest.printLineItems.add(text);

    text = DoubleTextPrintCommand(fontSize: itemFontSize);
    text.leftAlignedValue = "APP";
    text.rightAlignedValue = transaction.applicationLabel;
    printRequest.printLineItems.add(text);

    text = DoubleTextPrintCommand(fontSize: itemFontSize);
    text.leftAlignedValue = "SWITCH";
    text.rightAlignedValue = merchantConfig?.switchName;
    printRequest.printLineItems.add(text);

    text = DoubleTextPrintCommand(fontSize: itemFontSize);
    text.leftAlignedValue = "RESPONSE:";
    text.rightAlignedValue = transaction.responseMessage;
    printRequest.printLineItems.add(text);

    text = DoubleTextPrintCommand(fontSize: itemFontSize);
    text.bold = true;
    text.leftAlignedValue = "TOTAL";
    text.rightAlignedValue = CurrencyHelper.formatCurrency(context, amount);
    printRequest.printLineItems.add(text);

    printRequest.printLineItems.add(NewLinePrintCommand());

    singleText = SingleTextPrintCommand(
        fontSize: itemFontSize, alignment: AlignmentEnum.CENTER);
    singleText.value = "DESCRIPTION:";
    singleText.bold = true;
    singleText.italic = false;
    singleText.isHeader = false;
    singleText.isTrailer = false;
    printRequest.printLineItems.add(singleText);

    printRequest.printLineItems.add(SingleTextPrintCommand(
      value: transaction.responseMessage,
      bold: true,
      fontSize: itemFontSize,
      alignment: AlignmentEnum.CENTER,
    ));

    printRequest.printLineItems.add(NewLinePrintCommand());
    printRequest.printLineItems.add(NewLinePrintCommand());

    if (returnResult) {
      return printRequest;
    } else {
      await startPrint(printRequest);
    }
    return null;
  }

  static void printMerchantReceipt(context, WidgetRef ref, String rrn) {
    final transactionProvider = ref.read(
      getByReferenceDataProvider(rrn),
    );

    transactionProvider.whenData((result) {
      final appState = ref.read(appNotifierProvider);
      PrintHelper.printReceipt(
        transaction: result,
        receiptType: ReceiptSectionEnum.MERCHANT,
        merchantConfig: appState.profile!.merchantConfig,
        terminalConfig: appState.profile!.terminalConfig,
        context: context,
      );
    });
  }

  static void printReceipts(BuildContext context, WidgetRef ref, String rrn) {
    final transactionProvider = ref.read(
      getByReferenceDataProvider(rrn),
    );

    transactionProvider.whenData((result) async {
      final appState = ref.read(appNotifierProvider);
      final merchantReceipt = await PrintHelper.printReceipt(
        transaction: result,
        receiptType: ReceiptSectionEnum.MERCHANT,
        merchantConfig: appState.profile!.merchantConfig,
        terminalConfig: appState.profile!.terminalConfig,
        context: context,
        returnResult: true,
      );

      final customerReceipt = await PrintHelper.printReceipt(
        transaction: result,
        receiptType: ReceiptSectionEnum.CUSTOMER,
        merchantConfig: appState.profile!.merchantConfig,
        terminalConfig: appState.profile!.terminalConfig,
        context: context,
        returnResult: true,
      );

      await sendPrinterData(customerReceipt!, merchantReceipt!);
    });
  }
}

printReceiptDialog({
  BuildContext? context,
  Transaction? transactionResult,
  ReceiptSectionEnum? type,
}) async {
  return await showDialog(
    context: context!,
    builder: (context) => PrintDialog(
      transactionResult: transactionResult!,
      type: type!,
    ),
  );
}
