import 'package:flutter/material.dart';

import '../../../core/constants.dart' show CustomColours, borderRadiusSmall;
import '../../../helpers/currency_helpers.dart' show CurrencyHelper;
import '../../../l10n/app_localizations.dart';
import '../../../models/kazang.dart';

class SettlementTotal extends StatelessWidget {
  const SettlementTotal({super.key, required this.settlement});

  final Settlement settlement;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final amount = CurrencyHelper.formatCurrency(context, settlement.totalAmount.toInt());

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      decoration: const BoxDecoration(
        borderRadius: borderRadiusSmall,
        color: CustomColours.softButter,
      ),
      padding: const EdgeInsets.all(16),
      child: RichText(
        text: TextSpan(
          text: "${l10n.totalSettlementAmount}\n",
          style: DefaultTextStyle.of(context)
              .style
              .copyWith(height: 1.5),
          children: <TextSpan>[
            TextSpan(
              text: amount,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
