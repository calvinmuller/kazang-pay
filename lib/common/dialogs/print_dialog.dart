import 'package:flutter/material.dart' show BuildContext, Widget;
import 'package:flutter/scheduler.dart' show SchedulerBinding;
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerStatefulWidget, ConsumerState;
import 'package:go_router/go_router.dart';

import '../../helpers/print_helper.dart';
import '../../helpers/transaction_helper.dart';
import '../../l10n/app_localizations.dart';
import '../../models/printer.dart';
import '../../models/transaction.dart';
import '../interfaces/factory.events.dart';
import '../mixins/transaction_handlers.dart';
import '../providers/app.provider.dart';
import '../widgets/loader.dart';

class PrintDialog extends ConsumerStatefulWidget {
  const PrintDialog(
      {super.key, required this.transactionResult, required this.type});

  final Transaction transactionResult;
  final ReceiptSectionEnum type;

  @override
  PrintDialogState createState() => PrintDialogState();
}

class PrintDialogState extends ConsumerState<PrintDialog> with TransactionHandlersMixin {

  @override
  void initState() {
    TransactionHelper.initialize(this);
    final appState = ref.read(appNotifierProvider);
    SchedulerBinding.instance.addPostFrameCallback((_) {
      PrintHelper.printReceipt(
        transaction: widget.transactionResult,
        receiptType: widget.type,
        merchantConfig: appState.profile!.merchantConfig,
        terminalConfig: appState.profile!.terminalConfig,
        context: context,
      );
    });
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
    Future.delayed(const Duration(seconds: 1, milliseconds: 500)).then((value) {
      if (mounted) {
        context.pop(context);
      }
    });
  }

  @override
  void onTransactionCompletedEvent(TransactionCompletedEvent value) {
    // TODO: implement onTransactionCompletedEvent
  }
}
