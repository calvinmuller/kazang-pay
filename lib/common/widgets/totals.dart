import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../l10n/app_localizations.dart';
import '../../models/payment.dart';
import 'amount.dart';

class TotalsWidget extends ConsumerWidget {
  const TotalsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.all(24),
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
        children: [
          Text(
            "${l10n.purchaseAmount}:",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const FittedBox(fit: BoxFit.fitWidth, child: AmountWidget(
            type: PaymentType.payment,
          )),
          const SizedBox(height: 20),
          Text(
            "${l10n.cashbackAmount}:",
            style: Theme.of(context).textTheme.titleMedium,
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
