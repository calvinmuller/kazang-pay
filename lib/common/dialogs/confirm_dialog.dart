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
import 'dialog.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Dialog(
      iconData: CustomIcons.attention,
      title: l10n.cancelTitle,
      message: l10n.cancelMessage,
      actions: [
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
    );
    // show the dialog
  }
}
