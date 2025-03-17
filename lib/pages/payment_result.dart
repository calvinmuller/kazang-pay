import 'package:flutter/cupertino.dart';
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
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerStatefulWidget, ConsumerState, AsyncData, AsyncError;
import '../common/interfaces/factory.events.dart';
import '../common/mixins/transaction_handlers.dart';
import '../common/providers/transaction.provider.dart';
import '../common/widgets/animated_borders.dart';
import '../common/widgets/button.dart';
import '../common/widgets/panel.dart';
import '../common/widgets/receipt_tabs.dart';
import '../common/widgets/widgets.dart' show Loader;
import '../core/constants.dart' show borderGradient;
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
    _animationController = AnimationController(
        vsync: this, duration: const Duration(seconds: 1, milliseconds: 500))
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
    print(widget.result.ourReferenceNumber);
    final l10n = AppLocalizations.of(context)!;
    final transaction = ref.watch(getByReferenceDataProvider(
      widget.result.ourReferenceNumber!,
    ));

    return AnimatedGradientBorder(
      controller: _borderAnimationController,
      gradientColors: widget.result.isSuccessful
          ? borderGradient['success']!
          : borderGradient['error']!,
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
                widget.result.responseMessage!,
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              if (!widget.result.isSuccessful)
                Text(
                  widget.result.responseMessage ?? "",
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
                ...switch (transaction) {
                  AsyncError(:final error) => [const SizedBox()],
                  AsyncData(:final value) => [
                      const Divider(),
                      ReceiptTabs(transactionResult: value),
                    ],
                  _ => [
                      const Loader(
                        transparent: true,
                        message: "",
                      )
                    ],
                },
            ],
          ),
        ),
      ),
    );
  }

  @override
  void onTransactionCompletedEvent(TransactionCompletedEvent value) {
    // TODO: implement onTransactionCompletedEvent
  }
}
