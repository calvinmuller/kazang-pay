

import 'package:flutter/material.dart' show StatelessWidget, BuildContext, Widget, BoxDecoration, EdgeInsets, TextStyle, Border, BorderSide, BorderRadius, Radius, CrossAxisAlignment, Colors, Theme, FontWeight, MainAxisAlignment, Text, Column, Row, DefaultTextStyle, Container, Padding;

import '../../../core/core.dart' show CustomColours;
import '../../../helpers/currency_helpers.dart';
import '../../../l10n/app_localizations.dart';
import '../../../models/kazang.dart' show Settlement;

class SettlementTotals extends StatelessWidget {
  const SettlementTotals({super.key, required this.settlement});

  final Settlement settlement;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      decoration: const BoxDecoration(
        border: Border.fromBorderSide(
          BorderSide(color: CustomColours.purple, width: 2),
        ),
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: CustomColours.purple,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              color: Colors.white,
            ),
            child: DefaultTextStyle(
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(l10n.totalPurchaseAmount),
                      Text(
                        CurrencyHelper.formatCurrency(context, settlement.totalPurchaseAmount),
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(l10n.totalCashbackAmount),
                      Text(
                        CurrencyHelper.formatCurrency(context, settlement.totalCashbackAmount),
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: DefaultTextStyle(
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l10n.totalAmountProcessed),
                  Text(
                    CurrencyHelper.formatCurrency(
                        context,
                        settlement.totalPurchaseAmount +
                            settlement.totalCashbackAmount),
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
