import 'package:flutter/material.dart'
    show
        BuildContext,
        Widget,
        EdgeInsets,
        Spacer,
        Icon,
        TabBarView,
        Text,
        AppBar,
        Theme,
        Colors,
        TabBarIndicatorSize,
        BorderRadius,
        BoxDecoration,
        Tab,
        TabBar,
        Padding,
        Card,
        SliverToBoxAdapter,
        MainAxisAlignment,
        showDateRangePicker,
        Row,
        NestedScrollView,
        DefaultTabController;
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerStatefulWidget, ConsumerState;

import '../common/providers/transaction.provider.dart'
    show dateTimeFilterProvider;
import '../common/widgets/widgets.dart';
import '../core/constants.dart';
import '../core/icons.dart';
import '../l10n/app_localizations.dart';

class TransactionHistory extends ConsumerStatefulWidget {
  const TransactionHistory({super.key});

  @override
  ConsumerState<TransactionHistory> createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends ConsumerState<TransactionHistory> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return DefaultTabController(
      length: 2,
      child: ResponsiveScaffold(
        appBar: AppBar(
          title: Text(l10n.transactionHistoryTitle),
          centerTitle: false,
        ),
        mainWidgetFlex: 2,
        sideWidgetFlex: 3,
        sideWidget: const NestedTransactionDetails(),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerScrolled) {
            return [
              SliverToBoxAdapter(
                child: Card(
                  elevation: 0,
                  borderOnForeground: false,
                  color: CustomColours.greenish,
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
                        color: CustomColours.white,
                      ),
                      tabs: [
                        Tab(text: l10n.transactionHistory),
                        Tab(text: l10n.settlements),
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0, bottom: 14),
                  child: Row(
                    spacing: 10,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Spacer(),
                      Button(
                        elevation: 0,
                        icon: const Icon(CustomIcons.card, size: 20),
                        height: 40,
                        onPressed: () async {
                          final date = await showDateRangePicker(
                            useRootNavigator: false,
                            initialDateRange: ref.read(dateTimeFilterProvider),
                            context: context,
                            firstDate: DateTime.now().subtract(
                              const Duration(days: 90),
                            ),
                            lastDate: DateTime.now(),
                          );
                          if (date != null) {
                            ref.read(dateTimeFilterProvider.notifier).state =
                                date;
                          }
                        },
                        colour: CustomColours.purple,
                        textColour: Colors.white,
                        child: Text(l10n.dateFilter,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: Colors.white)),
                      )
                    ],
                  ),
                ),
              )
            ];
          },
          body: const TabBarView(
            children: [TransactionsList(), SettlementsList()],
          ),
        ),
      ),
    );
  }
}
