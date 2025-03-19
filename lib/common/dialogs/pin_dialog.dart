import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'
    show
        EdgeInsets,
        Container,
        FormState,
        BuildContext,
        Widget,
        Icon,
        InputDecoration,
        VoidCallback,
        GlobalKey,
        TextEditingController,
        MediaQuery,
        MainAxisSize,
        CrossAxisAlignment,
        MainAxisAlignment,
        Theme,
        Text,
        BorderSide,
        OutlineInputBorder,
        TextInputType,
        TextFormField,
        Column,
        Form,
        Padding,
        Navigator,
        MaterialPageRoute,
        showModalBottomSheet,
        Colors;
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerState, ConsumerStatefulWidget;
import 'package:go_router/go_router.dart';

import '../../core/core.dart';
import '../../l10n/app_localizations.dart';
import '../providers/app.provider.dart';
import '../widgets/button.dart';

class PinDialog extends ConsumerStatefulWidget {
  const PinDialog({
    super.key,
    this.title,
    this.message,
    this.action,
    this.iconData = CustomIcons.lock,
    this.actionButtonColour,
    this.reset = false,
  });

  final String? title;
  final String? message;
  final VoidCallback? action;
  final IconData iconData;
  final Color? actionButtonColour;
  final bool reset;

  @override
  ConsumerState<PinDialog> createState() => _PinDialogState();
}

class _PinDialogState extends ConsumerState<PinDialog> {
  final _formKey = GlobalKey<FormState>();
  final pinController = TextEditingController();
  final focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      focusNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final pin = ref.watch(appNotifierProvider.select((state) => state.pin));
    final hasPin = pin != null && widget.reset == false;

    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        spacing: 10,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            (hasPin) ? widget.iconData : CustomIcons.close,
            size: 72,
            color: CustomColours.gold,
          ),
          if (hasPin) ...{
            Text(
              widget.title ?? l10n.enterPinAccessSettings,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            Text(
              widget.message ?? l10n.pleaseProvideSupervisorPin,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          },
          if (!hasPin && !widget.reset) ...{
            Text(
              l10n.noPinSet,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            Text(
              l10n.setPinToProceed,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          },
          if (widget.reset) ...{
            Text(
              l10n.resetPin,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            Text(
              l10n.setPinToProceed,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          },
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  focusNode: focusNode,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: CustomColours.black,
                      ),
                      borderRadius: borderRadiusSmall,
                    ),
                  ),
                  keyboardType: TextInputType.number,
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
            colour: widget.actionButtonColour,
            textColour:
                (widget.actionButtonColour != null) ? Colors.white : null,
            onLongPress: () =>
                ref.read(appNotifierProvider.notifier).setPin(null),
            onPressed: (hasPin) ? onContinuePressed : onSetPinPressed,
            elevation: 0,
            child: Text(l10n.continueButton),
          ),
          Button.main(
            onPressed: () => Navigator.of(context).pop(false),
            elevation: 0,
            borderColour: Colors.transparent,
            inverse: true,
            child: Text(l10n.back),
          ),
          Builder(
            builder: (context) => Container(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
            ),
          ),
        ],
      ),
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

  onSetPinPressed() {
    if (_formKey.currentState!.validate()) {
      ref.read(appNotifierProvider.notifier).setPin(pinController.value.text);
      pinController.clear();
      if (widget.reset) {
        Navigator.of(context).pop(true);
      }
    }
  }

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }
}

showPinDialog({
  Widget? child,
  String? title,
  Color? actionButtonColour,
  required BuildContext context,
  VoidCallback? callback,
  bool reset = false,
}) async {
  final result = await showModalBottomSheet(
    isScrollControlled: true,
    showDragHandle: true,
    context: context,
    builder: (context) {
      print('buolding');
      return PinDialog(
        reset: reset,
        title: title,
        actionButtonColour: actionButtonColour,
      );
    },
  );
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
