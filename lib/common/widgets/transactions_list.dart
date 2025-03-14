import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    super.build(context);
    final transactions = ref.watch(transactionHistoryProvider);

    return switch (transactions) {
      AsyncError(:final stackTrace) => ErrorWidget(stackTrace),
      AsyncData(:final value) =>
          RefreshIndicator(
            onRefresh: () async =>
            await ref.refresh(transactionHistoryProvider.future),
            child: ListView.separated(
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
            ),
          ),
      _ => const Center(child: CircularProgressIndicator()),
    };
  }

  @override
  bool get wantKeepAlive => true;
}

