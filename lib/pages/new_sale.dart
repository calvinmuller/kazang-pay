import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'
    show StatelessWidget, BuildContext, Widget, EdgeInsets, SizedBox, Expanded, Text, AppBar, MainAxisSize, Padding, Column, Scaffold;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../common/providers/payment.provider.dart';
import '../common/widgets/widgets.dart';
import '../core/core.dart';
import '../l10n/app_localizations.dart' show AppLocalizations;
import '../core/constants.dart';

class NewSalePage extends StatelessWidget {
  const NewSalePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(l10n.newSale),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 8),
        child: Column(
          spacing: 12,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const TotalsWidget(),
            const Expanded(
              child: KeyPad(),
            ),
            Consumer(
              builder: (context, ref, child) {
                final payment = ref.watch(paymentNotifierProvider);
                return Button(
                  height: context.dynamicSize(90, 72),
                  width: double.infinity,
                  colour: CustomColours.greenish,
                  onPressed: (payment.hasAmount) ? () {
                    context.goNamed('payment');
                  }: null,
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
