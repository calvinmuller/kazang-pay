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
        Navigator,
        Column,
        Scaffold,
        ListView;
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerStatefulWidget, ConsumerState;

import '../common/providers/intent.provider.dart';
import '../common/providers/payment.provider.dart';
import '../common/providers/transaction.provider.dart';
import '../common/widgets/animated_borders.dart';
import '../common/widgets/button.dart';
import '../common/widgets/panel.dart';
import '../common/widgets/receipt_tabs.dart';
import '../core/constants.dart' show borderGradient;
import '../helpers/currency_helpers.dart';
import '../helpers/print_helper.dart' show PrintHelper;
import '../helpers/transaction_helper.dart';
import '../l10n/app_localizations.dart';
import '../models/transaction_result.dart' show TransactionResult;
import '../ui/widgets.dart';

class PaymentResultPage extends ConsumerStatefulWidget {
  const PaymentResultPage({super.key});

  @override
  ConsumerState<PaymentResultPage> createState() => _PaymentResultPageState();
}

class _PaymentResultPageState extends ConsumerState<PaymentResultPage>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;
  late final AnimationController _borderAnimationController;
  late final TransactionResult result =
      ref.read(transactionResultNotifierProvider)!;

  @override
  void initState() {
    super.initState();

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
          // Automatically print the merchant receipt.
          PrintHelper.printMerchantReceipt(context, ref, result.ourReferenceNumber!);
        }
      }
    });
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

  getBody(l10n) {
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
          result.declinedReason,
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
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
          child: LottieWidget(
            width: double.infinity,
            assetName: 'assets/animations/remove-card.lottie',
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
          onPressed: () {
            final launchMode = ref.read(launchModeProvider);
            if (launchMode == LaunchMode.intent) {
              final payment = ref.read(paymentIntentNotifierProvider.notifier);
              payment.complete(transactionResult: result);
            } else {
              Navigator.pop(context);
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
}
