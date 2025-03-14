import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/core.dart';
import '../../l10n/app_localizations.dart';
import '../providers/app.provider.dart';
import '../widgets/button.dart';

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
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          spacing: 10,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(
              CustomIcons.lock,
              size: 72,
              color: CustomColours.gold,
            ),
            Text(l10n.enterPinAccessSettings,
                style: Theme.of(context).textTheme.titleLarge),
            Text(l10n.pleaseProvideSupervisorPin,
                style: Theme.of(context).textTheme.bodyMedium),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    autofocus: true,
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
                      final pin = ref.read(
                          appNotifierProvider.select((state) => state.pin));
                      if (pin != pinController.value.text) {
                        return l10n.incorrectPin;
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            Button.main(
              onLongPress: () =>
                  ref.read(appNotifierProvider.notifier).setPin(null),
              onPressed: onContinuePressed,
              elevation: 0,
              child: Text(l10n.continueButton),
            ),
            Button.main(
              onPressed: onContinuePressed,
              elevation: 0,
              inverse: true,
              child: Text(l10n.back),
            ),
          ],
        ),
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

  @override
  void dispose() {
    pinController.dispose();
    super.dispose();
  }
}

class SetPinDialog extends ConsumerStatefulWidget {
  const SetPinDialog({super.key});

  @override
  ConsumerState<SetPinDialog> createState() => _SetPinDialogState();
}

class _SetPinDialogState extends ConsumerState<SetPinDialog> {
  final _formKey = GlobalKey<FormState>();
  final pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24)
        ..add(
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom)),
      child: Column(
        spacing: 10,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Icon(
            CustomIcons.lock,
            size: 72,
            color: CustomColours.gold,
          ),
          Text(l10n.noPinSet, style: Theme.of(context).textTheme.titleLarge),
          Text(l10n.setPinToProceed,
              style: Theme.of(context).textTheme.bodyMedium),
          Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                  autofocus: true,
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
                      return l10n.pinLengthError;
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          Button.main(
            onPressed: onContinuePressed,
            elevation: 0,
            child: Text(l10n.continueButton),
          ),
          Button.main(
            onPressed: () => context.pop(),
            elevation: 0,
            inverse: true,
            child: Text(l10n.back),
          ),
        ],
      ),
    );
    // show the dialog
  }

  onContinuePressed() {
    if (_formKey.currentState!.validate()) {
      final state = GoRouterState.of(context);
      ref.read(appNotifierProvider.notifier).setPin(pinController.value.text);
      context
          .goNamed('pin', pathParameters: {'to': state.pathParameters['to']!});
    }
  }
}

showPinDialog(
    {Widget? child,
    required BuildContext context,
    VoidCallback? callback}) async {
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
