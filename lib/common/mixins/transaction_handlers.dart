import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerStatefulWidget, ConsumerState;
import 'package:go_router/go_router.dart';

import '../../helpers/dialog_helpers.dart' show showErrorDialog, showListDialog;
import '../../helpers/transaction_helper.dart' show TransactionHelper;
import '../../l10n/app_localizations.dart' show AppLocalizations;
import '../../models/payment.dart' show Payment;
import '../interfaces/factory.events.dart';
import '../providers/status.provider.dart' show statusMessageProvider;
import '../providers/transaction.provider.dart';

mixin TransactionHandlersMixin<T extends ConsumerStatefulWidget>
    on ConsumerState<T> implements FactoryEventHandler {
  late final Payment payment;
  bool error = false;

  initialize() async {
    TransactionHelper.initialize(this);
    await TransactionHelper.doTransaction(payment);
  }

  @override
  void onUserApplicationSelectionRequired(
      UserApplicationSelectionRequired event) async {
    ref.read(transactionStepProvider.notifier).state = 3;
    final result = await context.pushNamed<Map>('accounts', extra: event.value);
    if (result != null) {
      TransactionHelper.continueTransaction(result['index'], result['account']);
    } else {
      TransactionHelper.abortTransaction();
    }
  }

  @override
  void onUserBudgetSelectionRequiredEvent(
      UserBudgetSelectionRequiredEvent event) async {
    final l10n = AppLocalizations.of(context)!;
    ref.read(transactionStepProvider.notifier).state = 2;
    final result =
        await showListDialog(context, event.value, title: l10n.budgetTerm);

    if (result != null) {
      await TransactionHelper.continueTransactionBudget(result['index']);
    } else {
      TransactionHelper.abortTransaction();
    }
  }

  @override
  void onErrorEvent(String? value) {
    error = true;
    showErrorDialog(context, value).then((_) => context.pop(true));
  }

  @override
  void onStatusMessageEvent(String? value) {
    if (mounted) {
      ref.read(statusMessageProvider.notifier).state = value ?? '';
      if (value == "Sending request online.") {
        ref.read(transactionStepProvider.notifier).state = 4;
      }
    }
  }

  @override
  void onWaitingForCardEvent(bool value) {
    ref.read(transactionStepProvider.notifier).state = 1;
    final l10n = AppLocalizations.of(context)!;
    if (value) {
      ref.read(statusMessageProvider.notifier).state = l10n.insertOrTap;
    }
  }

  @override
  void onReturnPrinterResultEvent(PrinterResultEvent event) {}

  @override
  void onDisConnectEvent(bool value) {}

  @override
  void onBatteryStatusLowEvent(int percentage) {
    final l10n = AppLocalizations.of(context)!;
    showErrorDialog(context, l10n.batteryLow(percentage))
        .then((_) => context.pop(true));
  }

  @override
  void onPrintDataCancelledEvent(bool value) {
    final l10n = AppLocalizations.of(context)!;
    showErrorDialog(context, l10n.printerError).then((_) {});
  }

  @override
  void onPrinterOperationEndEvent(bool value) {}
}
