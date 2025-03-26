import 'package:flutter/material.dart' show BuildContext, Widget;
import 'package:flutter_riverpod/flutter_riverpod.dart' show ConsumerWidget, ProviderScope;
import 'package:go_router/go_router.dart';

import '../common/providers/receipt.provider.dart';
import '../common/widgets/receipt.dart';
import '../models/printer.dart';
import '../models/transaction.dart';

class ReceiptPage extends ConsumerWidget {
  const ReceiptPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final transaction = GoRouterState.of(context).extra as Transaction;
    final type = GoRouterState.of(context).uri.queryParameters['type'] ==
            'ReceiptSectionEnum.CUSTOMER'
        ? ReceiptSectionEnum.CUSTOMER
        : ReceiptSectionEnum.MERCHANT;
    return ProviderScope(
      overrides: [
        // ignore: scoped_providers_should_specify_dependencies
        receiptParametersProvider.overrideWithValue(
          ReceiptParameters(
            transaction: transaction,
            type: type,
          ),
        ),
      ],
      child: const Receipt(),
    );
  }
}