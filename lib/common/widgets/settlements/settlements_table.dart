
import 'package:flutter/material.dart' show StatelessWidget, BuildContext, Widget, EdgeInsets, TextStyle, DataColumn, CrossAxisAlignment, Theme, Text, Padding, FontWeight, Expanded, DataCell, DataRow, DataTable, Column;
import 'package:intl/intl.dart';

import '../../../core/constants.dart';
import '../../../l10n/app_localizations.dart' show AppLocalizations;
import '../../../models/kazang.dart';
import '../custom_badge.dart';

class SettlementsTable extends StatelessWidget {
  const SettlementsTable(
      {super.key, required this.settlement, required this.data});

  final Settlement settlement;
  final TransactionHistoryDetails data;

  @override
  Widget build(BuildContext context) {
    final df = DateFormat('dd/MM/yyyy');
    final tf = DateFormat('HH:mm:ss');
    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            l10n.settlementSummaryFor(df.format(settlement.date)),
            style: Theme.of(context).textTheme.titleMedium!,
          ),
        ),
        DataTable(
          headingTextStyle: const TextStyle(fontWeight: FontWeight.w400),
          dataTextStyle: const TextStyle(fontWeight: FontWeight.w500),
          columns: <DataColumn>[
            DataColumn(
              label: Expanded(
                  child: Text(l10n.timeColumn)),
            ),
            DataColumn(
              label: Expanded(
                  child: Text(l10n.amount)),
            ),
            DataColumn(
              label: Expanded(
                  child: Text(l10n.settlementStatus)),
            ),
          ],
          rows: data.transactionDetails
              .map((e) => DataRow(
                    cells: [
                      DataCell(Text(tf.format(e.date))),
                      DataCell(Text(e.transactionAmount)),
                      DataCell(
                        CustomBadge(
                          dense: true,
                          colour: e.settlementStatus == 'Successful'
                              ? CustomColours.green
                              : CustomColours.orange,
                          child: Text(e.settlementStatus),
                        ),
                      ),
                    ],
                  ))
              .toList(),
        ),
      ],
    );
  }
}
