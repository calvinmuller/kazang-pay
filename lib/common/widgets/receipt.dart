import 'package:flutter/material.dart'
    show
        AutomaticKeepAliveClientMixin,
        BuildContext,
        Widget,
        EdgeInsets,
        Icon,
        TextStyle,
        MainAxisSize,
        Text,
        showDialog,
        Padding,
        BorderRadius,
        BoxDecoration,
        Theme,
        FontWeight,
        BoxFit,
        Column,
        DefaultTextStyle,
        Container,
        TickerProviderStateMixin,
        AnimationController,
        Transform,
        Offset,
        AnimatedBuilder,
        Animation,
        Tween,
        Colors,
        AnimationStatus,
        SingleChildScrollView,
        Curves,
        CurvedAnimation,
        Interval,
        SlideTransition;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart' show DateFormat;

import '../../core/core.dart';
import '../../helpers/currency_helpers.dart';
import '../../l10n/app_localizations.dart';
import '../../models/printer.dart';
import '../dialogs/print_dialog.dart';
import '../providers/app.provider.dart';
import '../providers/receipt.provider.dart' show receiptParametersProvider;
import 'button.dart';
import 'key_value.dart';

class Receipt extends ConsumerStatefulWidget {
  const Receipt({super.key});

  @override
  ReceiptState createState() => ReceiptState();
}

class ReceiptState extends ConsumerState<Receipt>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<Offset> slideAnimation;
  late final Animation<double> scaleAnimation;
  late final Animation<double> rotationAnimation;
  late final bool autoClose;

  @override
  void initState() {
    super.initState();
    autoClose =
        ref.read(receiptParametersProvider.select((state) => state.autoClose));

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    // Multi-phase animation that simulates printer paper coming out
    // Using offset (0, -1.5) means slide up by 1.5x screen height
    slideAnimation =
        Tween(begin: const Offset(0, 0), end: const Offset(0, -1.5)).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.0, 1.0, curve: Curves.easeInOut),
      ),
    );

    // Scale animation for 3D effect
    scaleAnimation = Tween(begin: 1.0, end: 0.85).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.0, 0.4, curve: Curves.easeOut),
      ),
    );

    // Slight rotation for realistic paper movement
    rotationAnimation = Tween(begin: 0.0, end: 0.02).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.1, 0.6, curve: Curves.elasticOut),
      ),
    );

    animationController.addListener(() {
      if (animationController.status == AnimationStatus.completed) {
        if (!autoClose) {
          // Add a small delay before resetting to show the effect
          Future.delayed(const Duration(milliseconds: 500), () {
            if (mounted) animationController.reset();
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final receiptViewModel = ref.watch(receiptParametersProvider);
    final transactionResult = receiptViewModel.transaction!;

    final dateFormatter = DateFormat('yyyy-MM-dd');
    final timeFormatter = DateFormat('h:mm:ss a');
    final l10n = AppLocalizations.of(context)!;
    final transactionDate = transactionResult.transactionDateTime;
    final appState = ref.watch(appNotifierProvider);

    final amount = transactionResult.isVoid
        ? -transactionResult.amount
        : transactionResult.amount;

    return SingleChildScrollView(
      child: Column(
        children: [
          if (receiptViewModel.showPrint)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Button.main(
                height: 54,
                icon: const Icon(CustomIcons.receiptText),
                onPressed: () async {
                  animationController.forward();
                  await showDialog(
                    barrierColor: Colors.transparent,
                    context: context,
                    builder: (context) => PrintDialog(
                      transactionResult: transactionResult,
                      type: receiptViewModel.type,
                    ),
                  );
                  if (context.mounted && receiptViewModel.autoClose) {
                    context.pop();
                  }
                },
                child: Text(l10n.printReceipt),
              ),
            ),
          AnimatedBuilder(
            animation: animationController,
            builder: (context, child) {
              return SlideTransition(
                position: slideAnimation,
                child: Transform.scale(
                  scale: scaleAnimation.value,
                  child: Transform.rotate(
                    angle: rotationAnimation.value,
                    child: Container(
                      margin: const EdgeInsets.all(12),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: CustomColours.grayscale,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: DefaultTextStyle(
                        // titleSmall
                        style: Theme.of(context).textTheme.titleSmall!,
                        child: Column(
                          spacing: 18,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              (ReceiptSectionEnum.MERCHANT ==
                                      receiptViewModel.type)
                                  ? l10n.merchantReceipt
                                  : l10n.customerReceipt,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SvgPicture.asset(
                              'assets/receipt.svg',
                              fit: BoxFit.contain,
                              height: 75,
                            ),
                            KeyValueWidget(
                              title: l10n.merchantId,
                              value: transactionResult.merchantId,
                            ),
                            KeyValueWidget(
                              title: l10n.terminalId,
                              value: transactionResult.terminalId,
                            ),
                            KeyValueWidget(
                              title: l10n.date,
                              value: dateFormatter.format(transactionDate),
                            ),
                            KeyValueWidget(
                              title: l10n.time,
                              value: timeFormatter.format(transactionDate),
                            ),
                            KeyValueWidget(
                              title: l10n.aid,
                              value: transactionResult.applicationIdentifier,
                            ),
                            KeyValueWidget(
                              title: l10n.pan,
                              value: transactionResult.maskedPan,
                            ),
                            KeyValueWidget(
                              title: l10n.transType,
                              value: transactionResult.type,
                            ),
                            KeyValueWidget(
                              title: l10n.transseqNo,
                              value:
                                  transactionResult.sequenceNumber.toString(),
                            ),
                            KeyValueWidget(
                              title: l10n.rrn,
                              value: transactionResult.retrievalReferenceNumber,
                            ),
                            KeyValueWidget(
                              title: l10n.appType,
                              value: transactionResult.applicationLabel,
                            ),
                            if (appState
                                    .profile?.merchantConfig.routingSwitch !=
                                null)
                              KeyValueWidget(
                                title: l10n.switchType,
                                value:
                                    appState.profile?.merchantConfig.switchName,
                              ),
                            KeyValueWidget(
                              title: l10n.purchase,
                              value: transactionResult.responseMessage,
                            ),
                            if (!transactionResult.isSuccessful)
                              KeyValueWidget(
                                title: l10n.reason,
                                value: transactionResult.responseMessage,
                              ),
                            KeyValueWidget(
                              bold: true,
                              title: l10n.total,
                              value: CurrencyHelper.formatCurrency(
                                context,
                                amount,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }
}
