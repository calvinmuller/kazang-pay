import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../l10n/app_localizations.dart';
import '../../providers/transaction.provider.dart';
import '../loader.dart';
import 'settlement_item.dart';

class SettlementsList extends ConsumerStatefulWidget {
  const SettlementsList({super.key});

  @override
  SettlementsListState createState() => SettlementsListState();
}

class SettlementsListState extends ConsumerState<SettlementsList> with AutomaticKeepAliveClientMixin {

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    super.build(context);
    final settlements = ref.watch(settlementsProvider);
    return switch (settlements) {
      AsyncError(:final error) => Text('Error: $error'),
      AsyncData(:final value) =>
      (value.transactionSummary.isNotEmpty)
          ? RefreshIndicator.adaptive(
        onRefresh: () async =>
        await ref.refresh(settlementsProvider.future),
        child: ListView.separated(
          itemCount: value.transactionSummary.length,
          itemBuilder: (context, index) {
            return ProviderScope(
              overrides: [
                currentSettlement.overrideWithValue(
                    value.transactionSummary[index]),
              ],
              child: const SettlementItem(),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: 10,
            );
          },
        ),
      )
          : const Center(child: Text('No settlements found')),
      _ => Center(child: Loader(message: l10n.loadingSettlements)),
    };
  }

  @override
  bool get wantKeepAlive => true;
}

