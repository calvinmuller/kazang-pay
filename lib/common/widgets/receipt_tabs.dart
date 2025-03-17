import 'package:flutter/material.dart' show TextStyle, BuildContext, Widget, EdgeInsets, FontWeight, MainAxisAlignment, Text, Expanded, Row, Column, Padding;
import 'package:flutter_riverpod/flutter_riverpod.dart' show ConsumerStatefulWidget, ConsumerState;
import 'package:go_router/go_router.dart';

import '../../core/constants.dart';
import '../../helpers/print_helper.dart';
import '../../l10n/app_localizations.dart' show AppLocalizations;
import '../../models/printer.dart';
import '../../models/transaction.dart';
import '../../models/transaction_result.dart';
import 'button.dart' show Button;

class ReceiptTabs extends ConsumerStatefulWidget {
  const ReceiptTabs({super.key, required this.transactionResult});

  final Transaction transactionResult;

  @override
  ConsumerState<ReceiptTabs> createState() => _ReceiptTabsState();
}

class _ReceiptTabsState extends ConsumerState<ReceiptTabs> {

  static const double spacing = 16;
  static const double buttonHeight = 40;
  static const TextStyle style = TextStyle(fontSize: 14, fontWeight: FontWeight.w500);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.all(spacing),
      child: Column(
        spacing: spacing,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: spacing,
            children: [
              Text(l10n.merchantReceipt, style: style.copyWith(fontWeight: FontWeight.bold)),
              Expanded(
                child: Button.secondary(
                  borderColour: CustomColours.black,
                  height: buttonHeight,
                  child: Text(l10n.view, style: style),
                  onPressed: () => context.pushNamed('receipt'),
                ),
              ),
              Expanded(
                child: Button.secondary(
                  colour: CustomColours.black,
                  textColour: CustomColours.white,
                  height: buttonHeight,
                  child: Text(l10n.print, style: style),
                  onPressed: () {
                    printReceiptDialog(
                      context: context,
                      transactionResult: widget.transactionResult,
                      type: ReceiptSectionEnum.MERCHANT,
                    );
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: spacing,
            children: [
              Text(l10n.customerReceipt, style: style),
              Expanded(
                child: Button.secondary(
                  borderColour: CustomColours.black,
                  height: buttonHeight,
                  child: Text(l10n.view, style: style),
                  onPressed: () {
                    context.pushNamed('receipt');
                  },
                ),
              ),
              Expanded(
                child: Button.secondary(
                  colour: CustomColours.black,
                  textColour: CustomColours.white,
                  height: buttonHeight,
                  child: Text(l10n.print, style: style),
                  onPressed: () {
                    printReceiptDialog(
                      context: context,
                      transactionResult: widget.transactionResult,
                      type: ReceiptSectionEnum.CUSTOMER,
                    );
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
