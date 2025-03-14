import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' show ConsumerWidget;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart' show DateFormat, NumberFormat;

import '../../core/core.dart';
import '../../l10n/app_localizations.dart';
import '../../models/transaction.dart';
import '../../theme.dart';
import '../providers/transaction.provider.dart' show currentTransactionItem;
import 'widgets.dart';

class TransactionItem extends ConsumerWidget {
  const TransactionItem({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final locale = Localizations.localeOf(context);
    final l10n = AppLocalizations.of(context)!;
    final item = ref.watch(currentTransactionItem);
    final format = NumberFormat.simpleCurrency(locale: locale.toString());
    final df = DateFormat('yyyy-MM-dd HH:mm:ss');

    print(item);
    return Container(
      decoration: panelDecoration,
      child: InkWell(
        onTap: () => context.pushNamed('details', extra: item),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Row(
                spacing: 12,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      color: CustomColours.lime,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: (item.isPayment)
                        ? const Icon(CustomIcons.card)
                        : (item.isCashback) ? SvgPicture.asset('assets/cashback.svg', width: 24,) : const Icon(CustomIcons.lock),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.maskedPan ?? '',
                        style: CustomTheme.graphikSemiBold,
                      ),
                      Text(
                        format.format(item.amount! / 100),
                        style: CustomTheme.graphikSemiBold,
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    decoration: const BoxDecoration(
                      color:CustomColours.greenish,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: const Icon(Icons.chevron_right, size: 32),
                  )
                ],
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(df.format(item.transactionDateTime)),
                    Text(
                      item.authorised ? l10n.approved : l10n.declined,
                      style: CustomTheme.graphikSemiBold.copyWith(
                          color: item.authorised
                              ? CustomColours.green
                              : CustomColours.red),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
