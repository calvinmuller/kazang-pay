import 'package:flutter/material.dart'
    show
    AlertDialog,
    Navigator,
    Text,
    TextButton,
    Widget,
    showDialog,
    showModalBottomSheet,
    Clip,
    BuildContext;

import '../common/dialogs/confirm_dialog.dart';
import '../common/widgets/list_dialog.dart';
import '../l10n/app_localizations.dart' show AppLocalizations;
import '../ui/widgets.dart';

showBottomSheet(context, Widget dialog) async {
  return await showModalBottomSheet(
    clipBehavior: Clip.none,
    context: context,
    showDragHandle: true,
    builder: (context) => dialog,
  );
}

showListDialog(mainContext, List<dynamic> items, { String? title}) {
  return showDialog(
    context: mainContext,
    barrierDismissible: false,
    useRootNavigator: true,
    builder: (context) =>
        ListDialog(items: items, mainContext: context, title: title),
  );
}

showSuccessDialog(context, message) {
  return showErrorDialog(context, message, icon: const LottieWidget(
    assetName: 'assets/animations/result-success.lottie',
    size: 48,
  ));
}

showErrorDialog
    (context, String? message, {Widget icon = const LottieWidget(
  assetName: 'assets/animations/result-failure.lottie',
  size: 48,
) }) {
  final l10n = AppLocalizations.of(context)!;
  return showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (context) =>
        AlertDialog(
          icon: icon,
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
  return showModalBottomSheet(
    context: context,
    showDragHandle: true,
    builder: (context) => const ConfirmDialog(),
  );
}
