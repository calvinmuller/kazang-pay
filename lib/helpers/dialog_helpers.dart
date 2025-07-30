import 'package:flutter/material.dart'
    show
        AlertDialog,
        Navigator,
        Text,
        TextButton,
        Widget,
        showDialog,
        showModalBottomSheet,
        BuildContext,
        EdgeInsets,
        SizedBox,
        BorderSide,
        Colors,
        BorderRadius,
        MainAxisSize,
        FontWeight,
        TextStyle,
        TextAlign,
        ElevatedButton,
        RoundedRectangleBorder,
        OutlinedButton,
        Column,
        Padding,
        MediaQuery,
        WidgetBuilder,
        Dialog,
        FractionallySizedBox,
        AnimationStyle;
import '../common/dialogs/confirm_dialog.dart';
import '../common/utils/utils.dart' show Responsive;
import '../common/widgets/list_dialog.dart';
import '../core/core.dart';
import '../l10n/app_localizations.dart' show AppLocalizations;
import '../ui/widgets.dart';

Future<T?> showBottomSheet<T>({
  required bool isScrollControlled,
  required bool showDragHandle,
  required BuildContext context,
  required WidgetBuilder builder,
  AnimationStyle? sheetAnimationStyle,
}) async {
  // show a dialog instead of modal bottom sheet is screen is larger than 900px
  if (Responsive.isLgUp(context)) {
    return showDialog<T?>(
      context: context,
      barrierDismissible: false,
      builder: (context) => FractionallySizedBox(
        widthFactor: 0.5,
        child: Dialog(child: builder(context)),
      ),
    );
  } else {
    return showModalBottomSheet<T?>(
      context: context,
      isScrollControlled: isScrollControlled,
      showDragHandle: showDragHandle,
      builder: (context) => builder(context),
      sheetAnimationStyle: sheetAnimationStyle,
    );
  }
}

showListDialog(mainContext, List<dynamic> items,
    {String? title, bool inverted = false}) {
  return showDialog(
    context: mainContext,
    barrierDismissible: false,
    useRootNavigator: true,
    builder: (context) => ListDialog(
      items: items,
      mainContext: context,
      title: title,
      inverted: inverted,
    ),
  );
}

showSuccessDialog(context, message) {
  return showErrorDialog(context, message,
      icon: const LottieWidget(
        assetName: 'assets/animations/result-success.lottie',
        size: 48,
      ));
}

bool _isDialogShowing = false;

showErrorDialog(context, String? message,
    {Widget icon = const LottieWidget(
      assetName: 'assets/animations/result-failure.lottie',
      size: 48,
    )}) {
  if (_isDialogShowing) return;

  _isDialogShowing = true;
  final l10n = AppLocalizations.of(context)!;
  return showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      icon: icon,
      content: Text(message ?? l10n.unexpectedError),
      actions: [
        TextButton(
          onPressed: () {
            _isDialogShowing = false;
            Navigator.of(context).pop(true);
          },
          child: Text(l10n.ok),
        ),
      ],
    ),
  );
}

Future<bool?> showConfirmationDialog(BuildContext context) {
  return showBottomSheet<bool>(
    context: context,
    isScrollControlled: context.hasPinPad(),
    showDragHandle: true,
    builder: (context) => const ConfirmDialog(),
  );
}

Future<bool?> showTransactionCompletedSheet(BuildContext context) {
  final l10n = AppLocalizations.of(context)!;
  return showBottomSheet<bool?>(
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
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
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
    isScrollControlled: false,
  );
}
