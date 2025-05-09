import 'package:flutter/cupertino.dart';
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
        AnimationStatus;
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
  late final Animation<double> animation;
  late final bool autoClose;

  @override
  void initState() {
    super.initState();
    autoClose = ref.read(receiptParametersProvider.select((state) => state.autoClose));

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2, milliseconds: 500),
    );
    animation = Tween(begin: 0.0, end: -800.0).animate(animationController);

    animationController.addListener(() {
      if (animationController.status == AnimationStatus.completed) {
        if (!autoClose) animationController.reset();
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

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        if (receiptViewModel.showPrint)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
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
            return Transform.translate(
              offset: Offset(0.0, animation.value),
              child: Container(
                margin: const EdgeInsets.all(16),
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
                        (ReceiptSectionEnum.MERCHANT == receiptViewModel.type)
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
                        value: transactionResult.sequenceNumber.toString(),
                      ),
                      KeyValueWidget(
                        title: l10n.rrn,
                        value: transactionResult.retrievalReferenceNumber,
                      ),
                      KeyValueWidget(
                        title: l10n.appType,
                        value: transactionResult.applicationLabel,
                      ),
                      if (appState.profile?.merchantConfig.routingSwitch !=
                          null)
                        KeyValueWidget(
                          title: l10n.switchType,
                          value: appState.profile?.merchantConfig.switchName,
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
            );
          },
        ),
      ],
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
