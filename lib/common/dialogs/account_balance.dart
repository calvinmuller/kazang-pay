import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants.dart';
import '../../l10n/app_localizations.dart';
import '../../pages/accounts.dart' show selectedAccountProvider;
import '../widgets/button.dart' show Button;

class AccountBalance extends ConsumerWidget {
  const AccountBalance({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final account = ref.watch(selectedAccountProvider);
    final l10n = AppLocalizations.of(context)!;

    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        spacing: 10,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: CustomColours.theOtherYellow,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Text(
                  l10n.accountBalance,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  "R 34 560.00",
                  style: Theme.of(context).textTheme.displayMedium,
                )
              ],
            ),
          ),
          Text(l10n.accountName(account!),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium),
          Button.flat(
            colour: Colors.white,
            margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Text(l10n.checkAnother),
            onPressed: () {
              context.pop();
            },
          ),
          Button(
            margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
            child: Text(l10n.done),
            onPressed: () {
              context.goNamed('home');
            },
          ),
        ],
      ),
    );
  }
}
