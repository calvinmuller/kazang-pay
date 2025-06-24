import 'package:flutter/material.dart'
    show BuildContext, Widget, EdgeInsets, BoxDecoration, Spacer, Text, AppBar, TabBarView, Colors, BorderRadius, CrossAxisAlignment, Column, Theme, Row, Padding, Card, TabBarIndicatorSize, Tab, TabBar, SliverToBoxAdapter, NestedScrollView, Scaffold, DefaultTabController, SingleChildScrollView;
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerWidget, ProviderScope, WidgetRef;
import 'package:go_router/go_router.dart';

import '../common/common.dart';
import '../common/providers/receipt.provider.dart';
import '../common/widgets/receipt.dart';
import '../common/widgets/widgets.dart' show Button;
import '../core/core.dart';
import '../helpers/currency_helpers.dart';
import '../l10n/app_localizations.dart';
import '../models/payment.dart' show Payment, PaymentType;
import '../models/printer.dart';
import '../models/transaction.dart';
import '../theme.dart';
import '../ui/widgets.dart';
import 'pages.dart';

class TransactionDetails extends ConsumerWidget {
  const TransactionDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final transaction = GoRouterState.of(context).extra as Transaction;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(l10n.saleTransaction),
          centerTitle: false,
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerScrolled) {
            return [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Card(
                      elevation: 0,
                      borderOnForeground: false,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          spacing: 15,
                          children: [
                            Row(
                              spacing: 12,
                              children: [
                                transaction.icon,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      transaction.maskedPan ?? '',
                                      style: CustomTheme.graphikSemiBold,
                                    ),
                                    Text(
                                      CurrencyHelper.formatCurrency(
                                        context,
                                        transaction.amount,
                                      ),
                                      style: CustomTheme.graphikSemiBold,
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Text(
                                  transaction.authorised
                                      ? l10n.approved
                                      : l10n.declined,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .merge(CustomTheme.graphikSemiBold)
                                      .copyWith(
                                        color: (transaction.authorised)
                                            ? CustomColours.green
                                            : CustomColours.red,
                                      ),
                                ),
                              ],
                            ),
                            if (transaction.isUserVoidable)
                              Button.secondary(
                                radius: 5,
                                child: Text(l10n.voidTransaction),
                                onPressed: () async {
                                  showPinDialog(
                                    title: l10n.voidConfirm,
                                    actionButtonColour: CustomColours.red,
                                    ref: ref,
                                    child: PaymentPage(
                                      payment: Payment(
                                        amount: transaction.amount,
                                        type: PaymentType.voidTransaction,
                                        rrn: transaction
                                            .retrievalReferenceNumber,
                                      ),
                                    ),
                                  );
                                },
                              ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 0,
                      borderOnForeground: false,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: TabBar(
                          labelStyle:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: Colors.black,
                                  ),
                          dividerHeight: 0,
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: CustomColours.orange,
                          ),
                          tabs: [
                            Tab(text: l10n.merchantReceipt),
                            Tab(text: l10n.customerReceipt),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ];
          },
          body: TabBarView(
            children: [
              SingleChildScrollView(
                child: ProviderScope(
                  overrides: [
                    // ignore: scoped_providers_should_specify_dependencies
                    receiptParametersProvider.overrideWithValue(
                      ReceiptParameters(
                        autoClose: false,
                        transaction: transaction,
                        type: ReceiptSectionEnum.MERCHANT,
                      ),
                    ),
                  ],
                  child: const Receipt(),
                ),
              ),
              SingleChildScrollView(
                child: ProviderScope(
                  overrides: [
                    // ignore: scoped_providers_should_specify_dependencies
                    receiptParametersProvider.overrideWithValue(
                      ReceiptParameters(
                        autoClose: false,
                        type: ReceiptSectionEnum.CUSTOMER,
                        transaction: transaction,
                      ),
                    ),
                  ],
                  child: const Receipt(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
