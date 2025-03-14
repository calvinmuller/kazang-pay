import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../common/common.dart';
import '../common/providers/app.provider.dart';
import '../common/providers/payment.provider.dart' show paymentNotifierProvider;
import '../common/widgets/receipt.dart';
import '../common/widgets/widgets.dart' show Button;
import '../core/core.dart';
import '../helpers/currency_helpers.dart';
import '../helpers/print_helper.dart';
import '../l10n/app_localizations.dart';
import '../models/payment.dart' show Payment, PaymentType;
import '../models/printer.dart';
import '../models/transaction.dart';
import '../theme.dart';
import 'pages.dart';

class TransactionDetails extends ConsumerWidget {
  const TransactionDetails({super.key, required this.transaction});

  final Transaction transaction;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
                          children: [
                            Row(
                              spacing: 12,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: const BoxDecoration(
                                    color: CustomColours.lime,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                  ),
                                  child: (transaction.isPayment)
                                      ? const Icon(CustomIcons.card)
                                      : (transaction.isCashback)
                                          ? SvgPicture.asset(
                                              'assets/cashback.svg',
                                              width: 24,
                                            )
                                          : const Icon(CustomIcons.lock),
                                ),
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
                            const Divider(
                              thickness: 0.5,
                              height: 30,
                            ),
                            Row(
                              children: [
                                Text(l10n.settlementStatus,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600)),
                                const Spacer(),
                                transaction.badge(l10n, context)
                              ],
                            ),
                            if (transaction.isPayment &&
                                transaction.isUserVoidable)
                              Padding(
                                padding: const EdgeInsets.only(top: 24),
                                child: Button.secondary(
                                  radius: 5,
                                  child: Text(l10n.voidTransaction),
                                  onPressed: () async {
                                    showPinDialog(
                                      context: context,
                                      child: PaymentPage(
                                          payment: Payment(
                                              amount: transaction.amount,
                                              type: PaymentType.voidTransaction,
                                              rrn: transaction
                                                  .retrievalReferenceNumber)),
                                    );
                                  },
                                ),
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
              Hero(
                tag: ReceiptSectionEnum.MERCHANT.name,
                child: Receipt(
                  autoClose: false,
                    type: ReceiptSectionEnum.MERCHANT,
                    transactionResult: transaction.toTransactionResult(
                      merchantConfig: ref
                          .watch(appNotifierProvider)
                          .profile!
                          .merchantConfig,
                    )),
              ),
              Hero(
                tag: ReceiptSectionEnum.CUSTOMER.name,
                child: Receipt(
                    autoClose: false,
                    type: ReceiptSectionEnum.CUSTOMER,
                    transactionResult: transaction.toTransactionResult(
                      merchantConfig: ref
                          .watch(appNotifierProvider)
                          .profile!
                          .merchantConfig,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

extension on Transaction {
  String toLocalizedString(AppLocalizations l10n) {
    return settled ? l10n.settled : l10n.pending;
  }

  Widget badge(l10n, context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      color: settled ? CustomColours.green : CustomColours.orange,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
        child: Row(
          spacing: 10,
          children: [
            Text(
              toLocalizedString(l10n),
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: CustomColours.white,
                  ),
            ),
            const Icon(CustomIcons.done, color: CustomColours.white),
          ],
        ),
      ),
    );
  }
}

extension on TransactionStatus {
  String toLocalizedString(AppLocalizations l10n) {
    switch (this) {
      case TransactionStatus.approved:
        return l10n.approved;
      case TransactionStatus.declined:
        return l10n.declined;
      case TransactionStatus.refunded:
        return l10n.refunded;
    }
  }
}
