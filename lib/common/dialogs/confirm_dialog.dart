import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'
    show
        StatelessWidget,
        Widget,
        BuildContext,
        EdgeInsets,
        CrossAxisAlignment,
        Theme,
        TextAlign,
        Text,
        Column,
        Container,
        Icon;
import 'package:go_router/go_router.dart';

import '../../core/core.dart';
import '../../l10n/app_localizations.dart';
import '../widgets/widgets.dart' show Button;

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      child: Column(
        spacing: 15,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            CustomIcons.attention,
            size: 72,
            color: CustomColours.gold,
          ),
          Text(
            l10n.cancelTitle,
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          Text(l10n.cancelMessage),
          Button(
            height: 60,
            width: double.infinity,
            textColour: CustomColours.white,
            colour: CustomColours.black,
            onPressed: () => context.pop(false),
            child: Text(l10n.returnTo),
          ),
          Button(
            height: 60,
            width: double.infinity,
            colour: CustomColours.red,
            textColour: CustomColours.white,
            onPressed: () => context.pop(true),
            child: Text(l10n.cancel),
          ),
        ],
      ),
    );
    // show the dialog
  }
}
