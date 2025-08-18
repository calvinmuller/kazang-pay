import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/core.dart';
import '../providers/payment.controller.dart' show paymentControllerProvider;
import '../providers/payment.provider.dart';
import '../../core/constants.dart';
import '../../helpers/currency_helpers.dart';
import '../../l10n/app_localizations.dart';
import 'widgets.dart' show Button, KeyValueWidget;

class TransactionDetailsWidget extends ConsumerWidget {
  const TransactionDetailsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final payment = ref.watch(paymentNotifierProvider);
    final l10n = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: CustomColours.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
        border: Border.all(
          color: CustomColours.primaryNeutral,
          width: 1,
        ),
        boxShadow: shadow,
      ),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            l10n.transactionDetails,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          KeyValueWidget(
            title: l10n.saleAmount,
            value: CurrencyHelper.formatCurrency(context, payment.amount),
            bold: true,
          ),
          KeyValueWidget(
            title: l10n.cashback,
            value:
                CurrencyHelper.formatCurrency(context, payment.cashbackAmount),
            bold: true,
          ),
          KeyValueWidget(
            title: l10n.totalAmount,
            value: CurrencyHelper.formatCurrency(context, payment.totalAmount),
            bold: true,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Consumer(
              builder: (context, ref, child) {
                final payment = ref.watch(paymentNotifierProvider);

                return Button(
                  height: 68,
                  width: double.infinity,
                  colour: CustomColours.prismBlue,
                  onPressed: (payment.hasAmount)
                      ? () {
                          ref
                              .read(paymentControllerProvider.notifier)
                              .setPayment(payment);

                          context.goNamed('payment');
                        }
                      : null,
                  child: Text(l10n.pay),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
