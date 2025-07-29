import 'package:flutter/material.dart'
    show BuildContext, Theme, Widget, EdgeInsets, TextAlign, Text, Padding, Column, Expanded, ListView, FractionallySizedBox;
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show WidgetRef, ConsumerWidget, StateProvider;

import 'package:go_router/go_router.dart';

import '../common/utils/utils.dart' show Responsive;
import '../common/widgets/account_item.dart';
import '../common/widgets/button.dart' show Button;
import '../common/widgets/panel.dart';
import '../core/core.dart';
import '../l10n/app_localizations.dart' show AppLocalizations;

final selectedAccountProvider = StateProvider.autoDispose<Map?>((ref) => {});

class AccountsPage extends ConsumerWidget {
  const AccountsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final accounts = GoRouterState.of(context).extra as List<dynamic>;
    final selectedAccount = ref.watch(selectedAccountProvider);

    return FractionallySizedBox(
      widthFactor: Responsive.isLgUp(context) ? 0.5: null,
      child: Panel(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 28,
                      horizontal: 33.5,
                    ),
                    child: Text(
                      textAlign: TextAlign.center,
                      l10n.selectAccount,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: accounts.mapIndexed((account, index) {
                        return AccountItem(
                          dense: context.hasPinPad(),
                          index: index,
                          padding: const EdgeInsets.only(bottom: 16),
                          groupValue: selectedAccount!,
                          account: account,
                          onChanged: (value) {
                            ref.read(selectedAccountProvider.notifier).state = {
                              'index': index,
                              'account': account,
                            };
                          },
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            Button.main(
              height: 64,
              margin: const EdgeInsets.all(16),
              onPressed: selectedAccount!['index'] != null
                  ? () {
                      context.pop(selectedAccount);
                    }
                  : null,
              child: Text(l10n.continueButton),
            ),
          ],
        ),
      ),
    );
  }
}
