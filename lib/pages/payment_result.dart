import 'package:flutter/material.dart'
    show
        TickerProviderStateMixin,
        AnimationController,
        BuildContext,
        Widget,
        Padding,
        EdgeInsets,
        Icon,
        Divider,
        AnimationStatus,
        BorderRadius,
        MainAxisAlignment,
        CrossAxisAlignment,
        Theme,
        TextAlign,
        Text,
        IconAlignment,
        Icons,
        Column,
        Scaffold,
        ListView,
        Navigator;

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerStatefulWidget, ConsumerState;
import '../common/providers/app.provider.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerStatefulWidget, ConsumerState;
import 'package:flutter_svg/svg.dart';
import '../common/interfaces/factory.events.dart';
import '../common/mixins/transaction_handlers.dart';
import '../common/providers/payment.controller.dart'
    show paymentControllerProvider, PaymentController;
import '../common/providers/transaction.provider.dart';
import '../common/widgets/animated_borders.dart';
import '../common/widgets/button.dart';
import '../common/widgets/panel.dart';
import '../common/widgets/receipt_tabs.dart';
import '../core/core.dart';
import '../helpers/currency_helpers.dart';
import '../helpers/dialog_helpers.dart';
import '../helpers/throttle.dart' show DebounceAggregator;
import '../helpers/transaction_helper.dart';
import '../l10n/app_localizations.dart';
import '../models/payment.dart';
import '../models/transaction_result.dart' show TransactionResult;
import '../ui/widgets.dart';

class PaymentResultPage extends ConsumerStatefulWidget {
  const PaymentResultPage({super.key, this.autoPrint = true});

  final bool autoPrint;

  @override
  ConsumerState<PaymentResultPage> createState() => _PaymentResultPageState();
}

class _PaymentResultPageState extends ConsumerState<PaymentResultPage>
    with TickerProviderStateMixin, TransactionHandlersMixin {
  late final AnimationController _animationController;
  late final AnimationController _borderAnimationController;
  late final TransactionResult result = ref.read(transactionResultNotifierProvider)!;
  late final DebounceAggregator _aggregator;

  @override
  Payment get payment => ref.read(paymentControllerProvider)!;

  late final PaymentController paymentController = ref.read(paymentControllerProvider.notifier)!;

  @override
  void initState() {
    super.initState();
    TransactionHelper.initialize(this);

    _animationController = AnimationController(
        vsync: this, duration: const Duration(seconds: 1, milliseconds: 500))
      ..forward();

    _borderAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _borderAnimationController.repeat();
        if (result.isSuccessful) {
          TransactionHelper.paymentSuccess();

          paymentController.onSuccessfulPayment(
            context,
            result,
            payment,
            ref,
          );
        } else {
          paymentController.onFailedPayment(
            context,
            result,
            payment,
            ref,
          );
        }
      }
    });

    _aggregator = DebounceAggregator(
      delay: const Duration(seconds: 1),
      onFirstCall: () {
        onReturnPrinterResultEvent(PrinterResultEvent("SUCCESS"));
      },
      onDebounced: (aggregatedMessage) async {
        await showErrorDialog(navigatorKey.currentContext, aggregatedMessage);
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return AnimatedGradientBorder(
      controller: _borderAnimationController,
      gradientColors: result.isSuccessful
          ? borderGradient['success']!
          : borderGradient['error']!,
      borderRadius: BorderRadius.zero,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        extendBody: true,
        body: Panel(
          child: (result.isTap || !result.isSuccessful)
              ? Column(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: getBody(l10n),
                )
              : ListView(
                  children: getBody(l10n),
                ),
        ),
      ),
    );
  }

  getBody(AppLocalizations l10n) {
    return [
      LottieWidget(
        animate: false,
        size: 140,
        width: 140,
        controller: _animationController,
        assetName: (result.isSuccessful)
            ? 'assets/animations/result-success.lottie'
            : 'assets/animations/result-failure.lottie',
      ),
      // titleMedium
      Text(
        result.responseMessage!,
        style: Theme.of(context).textTheme.titleLarge,
        textAlign: TextAlign.center,
      ),
      if (!result.isSuccessful)
        Text(
          result.declinedReason ?? l10n.declined,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      // Amount
      Text(
        CurrencyHelper.formatCurrency(
          context,
          result.transactionAmount,
        ),
        style: Theme.of(context).textTheme.headlineLarge,
        textAlign: TextAlign.center,
      ),
      if (!result.isTap && result.isSuccessful)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
          child: (!context.isUrovo)
              ? const LottieWidget(
                  width: double.infinity,
                  assetName: 'assets/animations/remove-card.lottie',
                )
              : SvgPicture.asset(
                  'assets/remove-card-urovo.svg',
                  height: 150,
                ),
        ),
      if (!result.isTap && result.isSuccessful)
        Text(
          l10n.removeCard,
          style: Theme.of(context).textTheme.titleMedium,
          textAlign: TextAlign.center,
        ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Button(
          iconAlignment: IconAlignment.end,
          elevation: 0,
          height: 60,
          width: double.infinity,
          onPressed: () async {
            final appState = ref.read(appNotifierProvider);
            if (appState.externallyLaunched!) {
              final result = await showTransactionCompletedSheet(context);
              if (result == true) {
                SystemNavigator.pop();
              } else {
                if (context.mounted) {
                  Navigator.popUntil(context, (route) => route.isFirst);
                }
              }
            } else {
              Navigator.popUntil(context, (route) => route.isFirst);
            }
          },
          icon: const Icon(Icons.arrow_forward),
          child: Text(l10n.continueButton),
        ),
      ),
      if (result.canPrintReceipt) ...[
        const Divider(),
        ReceiptTabs(transactionResult: result),
      ]
    ];
  }

  @override
  void onTransactionCompletedEvent(TransactionCompletedEvent value) {
    // TODO: implement onTransactionCompletedEvent
  }

  @override
  void onReturnPrinterResultEvent(PrinterResultEvent event) async {
    TransactionHelper.log("onReturnPrinterResultEvent", event.value);
    await ref
        .read(paymentControllerProvider.notifier)
        .postTransaction(context, result, ref);
  }

  @override
  void onPrinterOperationEndEvent(bool value) {
    TransactionHelper.log("onPrinterOperationEndEvent", value.toString());
  }

  @override
  void onErrorEvent(String? value) {
    _aggregator(value);
  }
}
