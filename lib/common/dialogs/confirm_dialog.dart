import 'package:flutter/material.dart'
    show
        StatelessWidget,
        Widget,
        BuildContext,
        Text;
import 'package:go_router/go_router.dart';

import '../../core/core.dart';
import '../../l10n/app_localizations.dart';
import '../../ui/widgets.dart';
import '../widgets/widgets.dart' show Button;
import 'dialog.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return PopOnEnter(
      onEnterPressed: () => context.pop(true),
      onBackPressed: () => context.pop(false),
      child: Dialog(
        iconData: CustomIcons.attention,
        title: l10n.cancelTitle,
        message: l10n.cancelMessage,
        actions: [
          Button(
            height: 50,
            width: double.infinity,
            textColour: CustomColours.white,
            colour: CustomColours.black,
            onPressed: () => context.pop(false),
            child: Text(l10n.returnTo),
          ),
          Button(
            height: 50,
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
