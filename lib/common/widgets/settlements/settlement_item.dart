import 'package:flutter/material.dart' show BuildContext, EdgeInsets, Widget, CrossAxisAlignment, Theme, Text, MainAxisAlignment, Column, Expanded, Row, Container;
import 'package:flutter_riverpod/flutter_riverpod.dart' show ConsumerWidget, WidgetRef;
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/constants.dart';
import '../../../l10n/app_localizations.dart';
import '../../providers/transaction.provider.dart';
import '../widgets.dart' show Button;
import 'settlement_total.dart';

class SettlementItem extends ConsumerWidget {
  const SettlementItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final format = DateFormat('d MMMM yyyy');
    final settlement = ref.read(currentSettlement);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: panelDecoration,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(format.format(settlement.date),
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontSize: 14)),
          SettlementTotal(settlement: settlement),
          Row(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l10n.noOfTransaction),
                  Text(settlement.noOfTransactions, style: Theme.of(context).textTheme.titleSmall),
                ],
              ),
              Expanded(
                child: Button.secondary(
                  onPressed: () => context.pushNamed('summary-details', extra: settlement),
                  radius: 10,
                  textColour: CustomColours.black,
                  borderColour: CustomColours.black,
                  child: Text(l10n.viewMore),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
