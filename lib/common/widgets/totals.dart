import 'package:flutter/material.dart' show BuildContext, Container, Widget, EdgeInsets, Offset, BorderRadius, FittedBox, Colors, BoxShadow, Radius, BoxDecoration, MainAxisSize, Theme, Text, BoxFit, Column, MainAxisAlignment, TextAlign;
import 'package:flutter_riverpod/flutter_riverpod.dart' show ConsumerWidget, WidgetRef;

import '../../l10n/app_localizations.dart';
import '../../models/payment.dart';
import 'amount.dart';

class TotalsWidget extends ConsumerWidget {
  const TotalsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.09),
            blurRadius: 3,
            offset: const Offset(0, 0),
          ),
        ],
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${l10n.purchaseAmount}:",
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          const FittedBox(fit: BoxFit.fitWidth, child: AmountWidget(
            type: PaymentType.payment,
          )),
          Text(
            "${l10n.cashbackAmount}:",
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          const FittedBox(
            fit: BoxFit.fitWidth,
            child: AmountWidget(
              type: PaymentType.cashback,
            ),
          ),
        ],
      ),
    );
  }
}
