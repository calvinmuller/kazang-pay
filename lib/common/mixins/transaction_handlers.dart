
import 'package:flutter_riverpod/flutter_riverpod.dart' show ConsumerStatefulWidget, ConsumerState;
import 'package:go_router/go_router.dart';

import '../../helpers/dialog_helpers.dart' show showErrorDialog, showListDialog;
import '../../helpers/transaction_helper.dart' show TransactionHelper;
import '../../l10n/app_localizations.dart' show AppLocalizations;
import '../../models/payment.dart' show Payment;
import '../interfaces/factory.events.dart';
import '../providers/status.provider.dart' show statusMessageProvider;

mixin TransactionHandlersMixin<T extends ConsumerStatefulWidget>
    on ConsumerState<T> implements FactoryEventHandler {
  late final Payment payment;
  bool error = false;

  initialize() async {
    TransactionHelper.initialize(this);
    await TransactionHelper.doTransaction(payment);
  }

  @override
  void onUserApplicationSelectionRequired(UserApplicationSelectionRequired event) async {
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
    final result = await showListDialog(context, event.value);

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
    context.pop();
  }

  @override
  void onStatusMessageEvent(String? value) {
    ref.read(statusMessageProvider.notifier).state = value ?? '';
  }

  @override
  void onWaitingForCardEvent(bool value) {
    final l10n = AppLocalizations.of(context)!;
    if (value) {
      ref.read(statusMessageProvider.notifier).state = l10n.insertOrTap;
    }
  }

  @override
  void onReturnPrinterResultEvent(PrinterResultEvent event) {

  }

  @override
  void onDisConnectEvent(bool value) {
    TransactionHelper.reconnect();
  }

  @override
  void onBatteryStatusLowEvent(int percentage) {
    final l10n = AppLocalizations.of(context)!;
    showErrorDialog(context, l10n.batteryLow(percentage)).then((_) => context.pop(true));
  }

  @override
  void onPrintDataCancelledEvent(bool value) {
    final l10n = AppLocalizations.of(context)!;
    showErrorDialog(context, l10n.printerError).then((_) => _);
  }
}
