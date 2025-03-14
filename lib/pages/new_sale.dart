import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
            Button(
              height: 90,
              width: double.infinity,
              colour: CustomColours.greenish,
              onPressed: () {
                context.goNamed('payment');
              },
              child: Text(l10n.pay),
            ),
          ],
        ),
      ),
    );
  }
}
