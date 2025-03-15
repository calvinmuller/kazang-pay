import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'
    show StatelessWidget, BuildContext, Widget, EdgeInsets, SizedBox, Expanded, Text, AppBar, MainAxisSize, Padding, Column, Scaffold;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../common/providers/payment.provider.dart';
import '../common/widgets/widgets.dart';
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
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(
              width: double.infinity,
              child: TotalsWidget(),
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: KeyPad(),
              ),
            ),
            Consumer(
              builder: (context, ref, child) {
                final payment = ref.watch(paymentNotifierProvider);
                return Button(
                  height: 90,
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
