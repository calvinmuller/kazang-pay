import 'package:flutter/material.dart'
    show
        BuildContext,
        Container,
        Widget,
        EdgeInsets,
        BorderRadius,
        FittedBox,
        Colors,
        Radius,
        BoxDecoration,
        MainAxisSize,
        Theme,
        Text,
        BoxFit,
        Column,
        MainAxisAlignment,
        TextAlign;
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerWidget, WidgetRef;

import '../../core/constants.dart' show shadow;
import '../../l10n/app_localizations.dart';
import '../../models/payment.dart';
import '../utils/responsive.dart' show Responsive;
import 'amount.dart';

class TotalsWidget extends ConsumerWidget {
  const TotalsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;

    final padding = Responsive.responsive<double>(context, xs: 12, lg: 32);

    return Container(
      padding: EdgeInsets.symmetric(vertical: padding, horizontal: padding),
      decoration: const BoxDecoration(
        boxShadow: shadow,
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
          topRight: Radius.circular(25),
          bottomLeft: Radius.circular(25),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        spacing: 2,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${l10n.purchaseAmount}:",
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          const FittedBox(
              fit: BoxFit.fitWidth,
              child: AmountWidget(
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
