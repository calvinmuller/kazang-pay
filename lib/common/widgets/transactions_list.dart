import 'package:flutter/material.dart' show BuildContext, AutomaticKeepAliveClientMixin, Widget, EdgeInsets, SizedBox, Center, ListView, RefreshIndicator, CircularProgressIndicator, Text;
import 'package:flutter_riverpod/flutter_riverpod.dart' show ConsumerStatefulWidget, ConsumerState, AsyncError, AsyncData, ProviderScope;

import '../../l10n/app_localizations.dart' show AppLocalizations;
import '../providers/transaction.provider.dart';
import 'widgets.dart' show TransactionItem;

class TransactionsList extends ConsumerStatefulWidget {
  const TransactionsList({super.key});

  @override
  TransactionsListState createState() => TransactionsListState();
}

class TransactionsListState extends ConsumerState<TransactionsList> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    super.build(context);
    final transactions = ref.watch(transactionHistoryProvider);

    return switch (transactions) {
      AsyncError() => Center(child: Text(l10n.unexpectedError),),
      AsyncData(:final value) =>
          RefreshIndicator(
            onRefresh: () async =>
            await ref.refresh(transactionHistoryProvider.future),
            child: (value.isNotEmpty) ? ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: value.length,
              itemBuilder: (context, index) {
                return ProviderScope(
                  overrides: [
                    currentTransactionItem.overrideWithValue(value[index]),
                  ],
                  child: const TransactionItem(),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 10,
                );
              },
            ): Center(child: Text(l10n.noTransactionsFound)),
          ),
      _ => const Center(child: CircularProgressIndicator()),
    };
  }

  @override
  bool get wantKeepAlive => true;
}

