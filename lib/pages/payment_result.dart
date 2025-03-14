import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerStatefulWidget, ConsumerState;
import 'package:go_router/go_router.dart';
import '../common/interfaces/factory.events.dart';
import '../common/mixins/transaction_handlers.dart';
import '../common/widgets/animated_borders.dart';
import '../common/widgets/button.dart';
import '../common/widgets/panel.dart';
import '../common/widgets/receipt_tabs.dart';
import '../helpers/currency_helpers.dart';
import '../helpers/transaction_helper.dart';
import '../l10n/app_localizations.dart';
import '../models/transaction_result.dart';
import '../ui/widgets.dart';

class PaymentResultPage extends ConsumerStatefulWidget {
  const PaymentResultPage({super.key, required this.result});

  final TransactionResult result;

  @override
  ConsumerState<PaymentResultPage> createState() => _PaymentResultPageState();
}

class _PaymentResultPageState extends ConsumerState<PaymentResultPage>
    with TransactionHandlersMixin, TickerProviderStateMixin {
  late final AnimationController _animationController;
  late final AnimationController _borderAnimationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..forward();

    _borderAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _borderAnimationController.repeat();
        if (widget.result.isSuccessful) {
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
      gradientColors: widget.result.isSuccessful
          ? borderGradient['success']
          : borderGradient['error'],
      borderRadius: BorderRadius.zero,
      child: Scaffold(
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
                assetName: (widget.result.isSuccessful)
                    ? 'assets/animations/result-success.lottie'
                    : 'assets/animations/result-failure.lottie',
              ),
              // titleMedium
              Text(
                widget.result.message,
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              if (!widget.result.isSuccessful)
                Text(
                  widget.result.responseMessage,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              // Amount
              Text(
                CurrencyHelper.formatCurrency(
                  context,
                  widget.result.transactionAmount,
                ),
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              if (!widget.result.isTap)
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                  child: LottieWidget(
                    width: double.infinity,
                    assetName: 'assets/animations/remove-card.lottie',
                  ),
                ),
              if (!widget.result.isTap)
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
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_forward),
                  child: Text(l10n.continueButton),
                ),
              ),
              if (widget.result.canPrintReceipt)
                const Divider(),
              if (widget.result.canPrintReceipt)
                ReceiptTabs(transactionResult: widget.result),
            ],
          ),
        ),
      ),
    );
  }

  get borderGradient => {
        'error': [
          const Color(0XFFE12727),
          const Color(0XFFFF9A14),
          const Color(0XFFE12727),
          const Color(0XFFFF9A14),
        ],
        'success': [
          const Color(0XFF24AA4A),
          const Color(0XFFBEC430),
          const Color(0XFF24AA4A),
          const Color(0XFFBEC430),
        ]
      };

  @override
  void onTransactionCompletedEvent(TransactionCompletedEvent value) {
    // TODO: implement onTransactionCompletedEvent
  }
}
