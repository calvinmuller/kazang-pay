import 'package:flutter/material.dart' show BuildContext, InkWell, Widget, Text;
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerWidget, WidgetRef;

import '../../helpers/currency_helpers.dart';
import '../../models/payment.dart' show PaymentType;

import '../../theme.dart';
import '../providers/device_info.dart';
import '../providers/payment.provider.dart';

class AmountWidget extends ConsumerWidget {
  const AmountWidget({super.key, this.type = PaymentType.payment});

  final PaymentType? type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final amountProvider = ref.watch(paymentNotifierProvider);

    final deviceInfo = DeviceInfoProvider.of(context);
    double fontSize = (type == amountProvider.type) ? 48 : 46;

    if (deviceInfo!.deviceInfo.manufacturer!.toLowerCase() == "urovo") {
      fontSize = (type == amountProvider.type) ? 42 : 38;
    }

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
          fontSize: fontSize,
        ),
      ),
    );
  }
}
