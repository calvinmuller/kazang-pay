import 'package:flutter/material.dart'
    show
        BuildContext,
        Widget,
        SizedBox,
        Padding,
        EdgeInsets,
        Icon,
        CrossAxisAlignment,
        MainAxisAlignment,
        Theme,
        Text,
        Column,
        Scaffold,
        TextAlign,
        debugPrint,
        PopScope;
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerStatefulWidget, ConsumerState, ConsumerWidget, WidgetRef;
import 'package:go_router/go_router.dart';

import '../common/interfaces/factory.events.dart';
import '../common/mixins/transaction_handlers.dart';
import '../common/providers/payment.provider.dart';
import '../common/providers/status.provider.dart';
import '../common/providers/transaction.provider.dart';
import '../common/widgets/widgets.dart';
import '../core/constants.dart';
import '../core/icons.dart';
import '../helpers/currency_helpers.dart';
import '../helpers/dialog_helpers.dart';
import '../helpers/transaction_helper.dart' show TransactionHelper;
import '../l10n/app_localizations.dart' show AppLocalizations;
import '../models/payment.dart';
import '../models/transaction_result.dart' show TransactionResult;
import '../ui/widgets.dart';

class PaymentPage extends ConsumerStatefulWidget {
  const PaymentPage({super.key, this.payment});

  final Payment? payment;

  @override
  PaymentPageState createState() => PaymentPageState();
}

class PaymentPageState extends ConsumerState<PaymentPage>
    with TransactionHandlersMixin {
  @override
  void initState() {
    if (widget.payment == null) {
      payment = ref.read(paymentNotifierProvider);
    } else {
      payment = widget.payment!;
    }
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return PopScope(
      canPop: false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBody: true,
        body: Panel(
          footer: const SizedBox(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Dots(),
              const SizedBox(),
              Column(
                children: [
                  Text(
                    "${l10n.amountDue}:",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    CurrencyHelper.formatCurrency(context, payment.totalAmount),
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ],
              ),
              const TransactionInformation(),
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: LottieWidget(
                  width: 400,
                  size: null,
                  assetName: 'assets/animations/insert-card.lottie',
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Button.secondary(
                  onPressed: () async {
                    if (error) {
                      context.pop(false);
                    } else {
                      final shouldPop = await showConfirmationDialog(context);
                      if (shouldPop != null && shouldPop) {
                        TransactionHelper.abortTransaction();
                      }
                    }
                  },
                  icon: const Icon(
                    CustomIcons.close,
                    color: CustomColours.red,
                    size: 24,
                  ),
                  child: Text(
                    l10n.cancel,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: CustomColours.red),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void onTransactionCompletedEvent(TransactionCompletedEvent value) {
    if (context.mounted) {
      final result = TransactionResult.fromJson(value.value);
      debugPrint(result.toString(), wrapWidth: 1024);
      ref.read(transactionResultNotifierProvider.notifier).set(result);
      if (!error) {
        context.goNamed('payment-result', extra: result);
      }
    }
  }

  @override
  void onErrorEvent(String? value) {
    error = true;
    showErrorDialog(context, value).then((_) {
      if (mounted && context.canPop()) {
        context.pop(true);
      }
    });
  }
}

class TransactionInformation extends ConsumerWidget {
  const TransactionInformation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactionStatus = ref.watch(statusMessageProvider);

    final widget = transactionStatus == "Sending request online."
        ? loadingWidget(transactionStatus)
        : Text(
            maxLines: 2,
            transactionStatus,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          );
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0), child: widget);
  }

  Widget loadingWidget(message) {
    return Loader(
      message: message,
    );
  }
}
