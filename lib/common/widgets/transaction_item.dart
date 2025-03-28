import 'package:flutter/material.dart'
    show
        BuildContext,
        Widget,
        EdgeInsets,
        BoxDecoration,
        Icon,
        Spacer,
        Divider,
        BorderRadius,
        Radius,
        Container,
        CrossAxisAlignment,
        Text,
        Column,
        Icons,
        Row,
        MainAxisAlignment,
        Padding,
        InkWell;
import 'package:flutter_riverpod/flutter_riverpod.dart' show ConsumerWidget;
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart' show DateFormat;

import '../../core/core.dart';
import '../../helpers/currency_helpers.dart';
import '../../l10n/app_localizations.dart';
import '../../theme.dart';
import '../providers/transaction.provider.dart' show currentTransactionItem;

class TransactionItem extends ConsumerWidget {
  const TransactionItem({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final l10n = AppLocalizations.of(context)!;
    final item = ref.watch(currentTransactionItem);
    final df = DateFormat('yyyy-MM-dd HH:mm:ss');

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
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: CustomColours.lime,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: item.icon
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 5,
                    children: [
                      Text(
                        item.maskedPan ?? '',
                        style: CustomTheme.graphikSemiBold,
                      ),
                      Text(
                        CurrencyHelper.formatCurrency(context, item.amount),
                        style: CustomTheme.graphikSemiBold,
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    decoration: const BoxDecoration(
                      color: CustomColours.greenish,
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
