import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../helpers/currency_helpers.dart';
import '../../models/payment.dart' show PaymentType;

import '../../theme.dart';
import '../providers/payment.provider.dart';

class AmountWidget extends ConsumerWidget {
  const AmountWidget({super.key, this.type = PaymentType.payment});

  final PaymentType? type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final amountProvider = ref.watch(paymentNotifierProvider);

    final amount = type == PaymentType.cashback
        ? amountProvider.cashbackAmount
        : amountProvider.amount;

    return InkWell(
      onTap: () {
        final notifier = ref.read(paymentNotifierProvider.notifier);
        notifier.set(type!);
      },
      child: Text(
        CurrencyHelper.formatCurrency(context, amount!),
        style: CustomTheme.graphikSemiBold.copyWith(
          fontSize: (type == amountProvider.type) ? 48: 46,
        ),
      ),
    );
  }
}
