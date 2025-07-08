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
        BuildContext,
        Container,
        EdgeInsets,
        BoxDecoration,
        SizedBox,
        Color,
        BorderSide,
        Colors,
        BorderRadius,
        Radius,
        MainAxisSize,
        FontWeight,
        TextStyle,
        Border,
        TextAlign,
        ElevatedButton,
        RoundedRectangleBorder,
        OutlinedButton,
        Column;
import 'package:flutter/src/widgets/basic.dart';

import '../common/dialogs/confirm_dialog.dart';
import '../common/widgets/list_dialog.dart';
import '../core/constants.dart';
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

showListDialog(mainContext, List<dynamic> items, {String? title}) {
  return showDialog(
    context: mainContext,
    barrierDismissible: false,
    useRootNavigator: true,
    builder: (context) =>
        ListDialog(items: items, mainContext: context, title: title),
  );
}

showErrorDialog(context, String? message) {
  final l10n = AppLocalizations.of(context)!;
  return showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      icon: const LottieWidget(
        assetName: 'assets/animations/result-failure.lottie',
        size: 48,
      ),
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

Future<bool?> showTransactionCompletedSheet(BuildContext context) {
  final l10n = AppLocalizations.of(context)!;
  return showModalBottomSheet<bool>(
    context: context,
    showDragHandle: true,
    builder: (_) {
      return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              l10n.transactionCompleted,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              l10n.transactionCompletedPrompt,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: CustomColours.greenish,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  // Return to Kazang app
                  Navigator.of(context).pop(true);
                },
                child: Text(
                  l10n.yes,
                  style:
                      const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.black,
                  side: const BorderSide(color: Colors.black, width: 1.5),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  // Exit app
                  Navigator.of(context).pop(false);
                },
                child: Text(
                  l10n.no,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      );
    },
  );
}
