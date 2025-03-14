import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../common/providers/transaction.provider.dart'
    show settlementDetailsProvider;
import '../common/widgets/settlements/settlements.dart'
    show SettlementsTable, SettlementTotals, SettlementTotal;
import '../core/constants.dart' show panelDecoration;
import '../helpers/currency_helpers.dart';
import '../l10n/app_localizations.dart' show AppLocalizations;
import '../models/kazang.dart' show Settlement;

class SettlementDetails extends ConsumerWidget {
  const SettlementDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final df = DateFormat('dd/MM/yyyy');
    final l10n = AppLocalizations.of(context)!;
    Settlement settlement = GoRouterState.of(context).extra as Settlement;
    final settlementDetails =
        ref.watch(settlementDetailsProvider(settlement.date));

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.settlementDetails),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerScrolled) {
          return [];
        },
        body: RefreshIndicator(
          onRefresh: () =>
              ref.refresh(settlementDetailsProvider(settlement.date).future),
          child: ListView(
            padding: const EdgeInsets.all(18),
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: panelDecoration,
                child: Column(
                  spacing: 20,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          l10n.settlementSummaryFor(df.format(settlement.date)),
                          style: Theme.of(context).textTheme.titleMedium!,
                        ),
                        SettlementTotal(settlement: settlement),
                        Text(l10n.totalSettlementAmountCalc,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(
                                    fontSize: 10, fontWeight: FontWeight.w400)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              l10n.totalPurchaseFees,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                            ),
                            Text(
                              CurrencyHelper.formatCurrency(
                                  context, settlement.purchaseServiceFee),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              l10n.totalCashbackFees,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                            ),
                            Text(
                              CurrencyHelper.formatCurrency(
                                  context, settlement.cashbackServiceFee),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SettlementTotals(settlement: settlement),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              Container(
                decoration: panelDecoration,
                child: settlementDetails.when(
                  data: (data) {
                    return SettlementsTable(settlement: settlement, data: data);
                  },
                  loading: () => const Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: SizedBox.square(dimension: 20, child: CircularProgressIndicator(strokeWidth: 2)),
                    ),
                  ),
                  error: (error, _) => Center(child: Text('Error: $error')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
