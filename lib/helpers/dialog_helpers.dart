import 'package:flutter/material.dart'
    show AlertDialog, Navigator, Text, TextButton, Widget, showDialog, showModalBottomSheet, Clip, BuildContext;

import '../common/dialogs/confirm_dialog.dart';
import '../common/widgets/button.dart' show Button;
import '../common/widgets/list_dialog.dart';
import '../core/constants.dart' show CustomColours;
import '../l10n/app_localizations.dart' show AppLocalizations;
import '../ui/widgets.dart';
import 'package:go_router/go_router.dart';

showBottomSheet(context, Widget dialog) async {
  return await showModalBottomSheet(
    clipBehavior: Clip.none,
    context: context,
    showDragHandle: true,
    builder: (context) => dialog,
  );
}

showListDialog(mainContext, List<dynamic> items) {
  return showDialog(
    context: mainContext,
    barrierDismissible: false,
    useRootNavigator: true,
    builder: (context) => ListDialog(items: items, mainContext: context),
  );
}

showErrorDialog(context, String? message) {
  final l10n = AppLocalizations.of(context)!;
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      icon: const LottieWidget(
          assetName: 'assets/animations/result-failure.lottie', size: 48),
      content: Text(message ?? l10n.unexpectedError),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(l10n.ok),
        ),
      ],
    ),
  );
}

showConfirmationDialog(BuildContext context) {
  final l10n = AppLocalizations.of(context)!;

  return showModalBottomSheet(
    context: context,
    showDragHandle: true,
    builder: (context) => ConfirmDialog(
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
          onPressed: () => context.pop(true),
          child: Text(l10n.cancel),
        ),
      ],
    ),
  );
}
