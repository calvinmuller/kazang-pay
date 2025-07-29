import 'package:flutter/material.dart'
    show StatelessWidget, BuildContext, Widget, EdgeInsets, Expanded, Text, AppBar, MainAxisSize, Padding, Column, CrossAxisAlignment, MainAxisAlignment;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../common/providers/payment.controller.dart';
import '../common/providers/payment.provider.dart';
import '../common/utils/utils.dart' show Responsive;
import '../common/widgets/widgets.dart';
import '../core/core.dart';
import '../l10n/app_localizations.dart' show AppLocalizations;

class NewSalePage extends StatelessWidget {
  const NewSalePage({super.key});

  @override
  Widget build(BuildContext context) {
    final hasPinPad = context.hasPinPad();
    final l10n = AppLocalizations.of(context)!;
    return ResponsiveScaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(l10n.newSale),
        centerTitle: Responsive.responsive(context, xs: true, lg: false),
      ),
      sideWidget: const TransactionDetailsWidget(),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 8),
        child: Column(
          spacing: 12,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TotalsWidget(),
            Expanded(
              flex: hasPinPad ? 0 : 1,
              child: const KeyPad(),
            ),
            Consumer(
              builder: (context, ref, child) {
                final payment = ref.watch(paymentNotifierProvider);

                return Button(
                  height: context.dynamicSize(90, 72),
                  width: double.infinity,
                  colour: CustomColours.greenish,
                  onPressed: (payment.hasAmount)
                      ? () {
                          ref
                              .read(paymentControllerProvider.notifier)
                              .setPayment(payment);

                          context.goNamed('payment');
                        }
                      : null,
                  child: Text(l10n.pay),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
