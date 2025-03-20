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
        Container;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart' show DateFormat;

import '../../core/core.dart';
import '../../helpers/currency_helpers.dart';
import '../../l10n/app_localizations.dart';
import '../../models/printer.dart';
import '../../models/transaction.dart';
import '../dialogs/print_dialog.dart';
import '../providers/app.provider.dart';
import 'button.dart';
import 'key_value.dart';

class Receipt extends ConsumerStatefulWidget {
  const Receipt({
    super.key,
    required this.transaction,
    this.type = ReceiptSectionEnum.CUSTOMER,
    this.autoClose = true,
    this.showPrint = true,
  });

  final Transaction transaction;
  final ReceiptSectionEnum type;
  final bool showPrint;
  final bool autoClose;

  @override
  ReceiptState createState() => ReceiptState();
}

class ReceiptState extends ConsumerState<Receipt>
    with AutomaticKeepAliveClientMixin {

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final transactionResult = widget.transaction;

    final dateFormatter = DateFormat('yyyy-MM-dd');
    final timeFormatter = DateFormat('h:mm:ss a');
    final l10n = AppLocalizations.of(context)!;
    final transactionDate = transactionResult.transactionDateTime;
    final appState = ref.watch(appNotifierProvider);

    final amount = transactionResult.isVoid ? -transactionResult.amount : transactionResult.amount;

    return Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          if (widget.showPrint)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Button.main(
                height: 54,
                icon: const Icon(CustomIcons.receiptText),
                onPressed: () async {
                  await showDialog(
                    context: context,
                    builder: (context) => PrintDialog(
                      transactionResult: transactionResult,
                      type: widget.type,
                    ),
                  );
                  if (context.mounted && widget.autoClose) {
                    context.pop();
                  }
                },
                child: Text(l10n.printReceipt),
              ),
            ),
          Container(
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
                    (ReceiptSectionEnum.MERCHANT == widget.type)
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
                    value: transactionResult.merchantId!,
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
                    value: transactionResult.applicationIdentifier ?? "",
                  ),
                  KeyValueWidget(
                    title: l10n.pan,
                    value: transactionResult.maskedPan ?? "",
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
                    value: transactionResult.applicationLabel!,
                  ),
                  if (appState.profile?.merchantConfig.routingSwitch != null)
                    KeyValueWidget(
                      title: l10n.switchType,
                      value: appState.profile?.merchantConfig.switchName,
                    ),
                  KeyValueWidget(
                    title: l10n.purchase,
                    value: transactionResult.responseMessage!,
                  ),
                  if (!transactionResult.isSuccessful)
                    KeyValueWidget(
                      title: l10n.reason,
                      value: transactionResult.responseMessage ?? "",
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
        ],
      );
  }

  @override
  bool get wantKeepAlive => true;
}
