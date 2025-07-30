import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart' show SvgPicture;

import '../../core/constants.dart';
import '../../l10n/app_localizations.dart';
import '../../core/core.dart';
import '../../pages/pages.dart';
import 'widgets.dart' show DefaultWidget;

// Provider to track the currently selected detail view
final selectedDetailProvider =
    StateProvider.autoDispose<DetailView?>((ref) => null);

sealed class DetailView {
  const DetailView();
}

class TransactionDetailView extends DetailView {
  final dynamic transaction;

  const TransactionDetailView(this.transaction);
}

class SettlementDetailView extends DetailView {
  final dynamic settlement;

  const SettlementDetailView(this.settlement);
}

class NestedTransactionDetails extends ConsumerWidget {
  const NestedTransactionDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDetail = ref.watch(selectedDetailProvider);
    final l10n = AppLocalizations.of(context)!;

    if (selectedDetail == null) {
      return const DefaultWidget();
    }

    return switch (selectedDetail) {
      TransactionDetailView(:final transaction) =>
        TransactionDetails(transaction: transaction),
      SettlementDetailView(:final settlement) =>
        SettlementDetails(settlement: settlement),
    };
  }
}
