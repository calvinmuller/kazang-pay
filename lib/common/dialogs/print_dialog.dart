import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../helpers/print_helper.dart';
import '../../helpers/transaction_helper.dart';
import '../../l10n/app_localizations.dart';
import '../../models/printer.dart';
import '../../models/transaction_result.dart';
import '../interfaces/factory.events.dart';
import '../mixins/transaction_handlers.dart';
import '../providers/app.provider.dart';
import '../widgets/loader.dart';

class PrintDialog extends ConsumerStatefulWidget {
  const PrintDialog(
      {super.key, required this.transactionResult, required this.type});

  final TransactionResult transactionResult;
  final ReceiptSectionEnum type;

  @override
  PrintDialogState createState() => PrintDialogState();
}

class PrintDialogState extends ConsumerState<PrintDialog>
    with TransactionHandlersMixin {

  @override

  @override
  void initState() {
    TransactionHelper.initialize(this);
    final appState = ref.read(appNotifierProvider);
    PrintHelper.printReceipt(
      transaction: widget.transactionResult.toTransaction(),
      receiptType: widget.type,
       merchantConfig: appState.profile!.merchantConfig,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Loader(
      message: l10n.printing,
    );
  }

  @override
  void onReturnPrinterResultEvent(PrinterResultEvent event) {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      if (context.mounted) {
        Navigator.of(context).pop();
      }
    });
  }

  @override
  void onTransactionCompletedEvent(TransactionCompletedEvent value) {
    // TODO: implement onTransactionCompletedEvent
  }
}
