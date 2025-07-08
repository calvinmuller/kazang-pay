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
        Scaffold;
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerStatefulWidget, ConsumerState;

import '../common/providers/app.provider.dart';
import '../common/providers/transaction.provider.dart';
import '../common/widgets/animated_borders.dart';
import '../common/widgets/button.dart';
import '../common/widgets/panel.dart';
import '../common/widgets/receipt_tabs.dart';
import '../core/constants.dart' show borderGradient;
import '../helpers/currency_helpers.dart';
import '../helpers/dialog_helpers.dart';
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
          child: Column(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LottieWidget(
                animate: false,
                size: 150,
                width: 150,
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
                  result.responseMessage ?? "",
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
              ),
              if (!result.isTap)
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                  child: LottieWidget(
                    width: double.infinity,
                    assetName: 'assets/animations/remove-card.lottie',
                  ),
                ),
              if (!result.isTap)
                Text(
                  l10n.removeCard,
                  style: Theme.of(context).textTheme.titleLarge,
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
                      final result =
                          await showTransactionCompletedSheet(context);
                      if (result == true) {
                        SystemNavigator.pop();
                      } else {
                        if (context.mounted) {
                          Navigator.pop(context);
                        }
                      }
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
            ],
          ),
        ),
      ),
    );
  }
}
