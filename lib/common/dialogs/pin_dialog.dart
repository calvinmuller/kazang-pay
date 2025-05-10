import 'package:flutter/material.dart'
    show
        FormState,
        BuildContext,
        Widget,
        VoidCallback,
        GlobalKey,
        TextEditingController,
        Text,
        TextInputType,
        Column,
        Form,
        Navigator,
        MaterialPageRoute,
        showModalBottomSheet,
        Colors,
        IconData,
        Color,
        AnimationStyle;
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerState, ConsumerStatefulWidget, WidgetRef;
import 'package:go_router/go_router.dart';

import '../../core/core.dart';
import '../../l10n/app_localizations.dart';
import '../../models/pin.dart' show PinDialogConfig;
import '../providers/app.provider.dart';
import '../providers/pin.provider.dart';
import '../widgets/button.dart' show Button;
import '../widgets/form_field.dart';
import '../widgets/keyboard_padding.dart' show KeyboardPadding;
import 'dialog.dart';

class PinDialog extends ConsumerStatefulWidget {
  const PinDialog({super.key});

  @override
  ConsumerState<PinDialog> createState() => _PinDialogState();
}

class _PinDialogState extends ConsumerState<PinDialog> {
  final _formKey = GlobalKey<FormState>();
  final pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final pinConfig = ref.watch(pinDialogNotifierProvider);
    final l10n = AppLocalizations.of(context)!;
    final pin = ref.watch(appNotifierProvider.select((state) => state.pin));
    final hasPin = pin != null && pinConfig.reset == false;

    final title = hasPin
        ? pinConfig.title ?? l10n.enterPinAccessSettings
        : !pinConfig.reset
            ? l10n.noPinSet
            : l10n.resetPin;
    final message = hasPin
        ? pinConfig.message ?? l10n.pleaseProvideSupervisorPin
        : !pinConfig.reset
            ? l10n.setPinToProceed
            : l10n.setPinToProceed;

    final buttonSize = context.dynamicSize(60, 50);

    return Dialog(
      title: title,
      message: message,
      iconData: pinConfig.iconData ?? CustomIcons.close,
      actions: [
        Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              FormField(
                autofocus: true,
                obscureText: true,
                textInputType: TextInputType.number,
                controller: pinController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return l10n.enterPin;
                  }
                  if (value.length < 4) {
                    return l10n.pinTooShort;
                  }
                  if (pin != pinController.value.text && hasPin) {
                    return l10n.incorrectPin;
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
        Button.main(
          height: buttonSize,
          colour: pinConfig.actionButtonColour,
          borderColour: pinConfig.actionButtonColour,
          textColour:
              (pinConfig.actionButtonColour != null) ? Colors.white : null,
          onPressed:
              (hasPin) ? onContinuePressed : () => onSetPinPressed(pinConfig),
          elevation: 0,
          child: Text(l10n.continueButton),
        ),
        Button.main(
          height: buttonSize,
          onPressed: () => Navigator.of(context).pop(false),
          elevation: 0,
          borderColour: Colors.black,
          inverse: true,
          child: Text(l10n.back),
        ),
        const KeyboardPadding(),
      ],
    );
    // show the dialog
  }

  onContinuePressed() {
    if (_formKey.currentState!.validate()) {
      try {
        final state = GoRouterState.of(context);
        final to = state.pathParameters['to']!;
        context.goNamed(to, extra: true);
      } catch (e) {
        context.pop(true);
      }
    }
  }

  onSetPinPressed(PinDialogConfig config) {
    if (_formKey.currentState!.validate()) {
      ref.read(appNotifierProvider.notifier).setPin(pinController.value.text);
      pinController.clear();
      if (config.reset) {
        Navigator.of(context).pop(true);
      }
    }
  }

  @override
  void dispose() {
    pinController.dispose();
    super.dispose();
  }
}

showPinDialog({
  Widget? child,
  String? title,
  Color? actionButtonColour,
  required WidgetRef ref,
  VoidCallback? callback,
  bool reset = false,
  IconData iconData = CustomIcons.attention,
}) async {
  ref.read(pinDialogNotifierProvider.notifier).setState(
        title: title,
        actionButtonColour: actionButtonColour,
        reset: reset,
        iconData: iconData,
      );
  final result = await showModalBottomSheet(
    isScrollControlled: true,
    showDragHandle: true,
    context: ref.context,
    builder: (context) => const PinDialog(),
    sheetAnimationStyle: AnimationStyle.noAnimation,
  );
  final context = ref.context;
  if (result != null && result && context.mounted) {
    if (callback != null) {
      callback();
    } else {
      return await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => child!,
        ),
      );
    }
  }
}
