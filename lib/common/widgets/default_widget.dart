import 'package:flutter/material.dart' show Theme, BuildContext, StatelessWidget, Widget, EdgeInsets, BorderRadius, Radius, Border, BoxDecoration, MainAxisAlignment, TextAlign, Text, Column, Center, Container;
import 'package:flutter_svg/svg.dart' show SvgPicture;

import '../../core/core.dart' show CustomColours, shadow;
import '../../l10n/app_localizations.dart' show AppLocalizations;

class DefaultWidget extends StatelessWidget {

  const DefaultWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: CustomColours.white,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        border: Border.all(
          color: CustomColours.primaryNeutral,
          width: 1,
        ),
        boxShadow: shadow,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 12,
          children: [
            SvgPicture.asset(
              'assets/transaction_details.svg',
              width: 300,
            ),
            Text(
              l10n.selectToView,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
