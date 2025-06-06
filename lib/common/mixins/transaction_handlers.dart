import 'package:flutter/material.dart' show showDialog;
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerStatefulWidget, ConsumerState;
import 'package:go_router/go_router.dart';

import '../../helpers/dialog_helpers.dart'
    show showErrorDialog, showListDialog, showSuccessDialog;
import '../../helpers/transaction_helper.dart' show TransactionHelper;
import '../../l10n/app_localizations.dart' show AppLocalizations;
import '../../models/payment.dart' show Payment;
import '../interfaces/factory.events.dart';
import '../providers/status.provider.dart' show statusMessageProvider;
import '../providers/transaction.provider.dart';
import '../widgets/loader.dart';

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
    // We dont want to popup an error if keys need to be injected
    if (!value!.contains("KSN keys are not injected")) {
      error = true;
      showErrorDialog(context, value).then((_) => context.pop(true));
    }
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

  @override
  void onKmsUpdateRequired() {
    final l10n = AppLocalizations.of(context)!;
    if (context.mounted) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Loader(
            message: l10n.updateKeys,
          );
        },
      );
      Future.delayed(const Duration(seconds: 1)).then((_) {
        TransactionHelper.performRemoteKmsUpdate();
      });
    }
  }

  @override
  void onKmsUpdateResult(String status, String message) {
    if (context.mounted) {
      ref.read(transactionStepProvider.notifier).state = 4;
      if (status == "0") {
        context.pop();
        showSuccessDialog(context, message).then((_) async {
          await TransactionHelper.doTransaction(payment);
        });
      } else {
        context.pop();
        showErrorDialog(context, message).then((_) {
          context.pop(true);
        });
      }
    }
  }

  @override
  void onFactoryInitialized() {
    // TODO: implement onFactoryInitialized
  }

  @override
  void onOsUpdateRequired(String build, String seNumber) {
    // TODO: implement onOsUpdateRequired
  }
}
