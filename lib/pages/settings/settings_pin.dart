import 'package:flutter/material.dart'
    show
        BuildContext,
        Widget,
        EdgeInsets,
        Text,
        MainAxisSize,
        CrossAxisAlignment,
        Column,
        Container,
        TextInputType,
        TextInputAction,
        Form,
        Colors,
        Padding,
        GlobalKey,
        FormState,
        TextEditingController,
        ScaffoldMessenger,
        SnackBar;
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerStatefulWidget, ConsumerState;
import 'package:go_router/go_router.dart';

import '../../common/common.dart';
import '../../common/providers/api.provider.dart' show crRepositoryProvider;
import '../../common/providers/app.provider.dart';
import '../../common/widgets/responsive_page_wrapper.dart';
import '../../common/widgets/form_field.dart';
import '../../common/widgets/widgets.dart' show Label, Button;
import '../../core/core.dart';
import '../../l10n/app_localizations.dart';
import '../../models/kazang.dart';

class SettingsPin extends ConsumerStatefulWidget {
  const SettingsPin({super.key});

  @override
  ConsumerState<SettingsPin> createState() => _SettingsPinState();
}

class _SettingsPinState extends ConsumerState<SettingsPin> {
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final deviceInfo =
        ref.watch(appNotifierProvider.select((state) => state.deviceInfo))!;
    final crApi = ref.watch(crRepositoryProvider);
    return ResponsivePageWrapper(
      title: l10n.supervisorPinTitle,
      resizeToAvoidBottomInset: true,
      builder: (context) => Container(
        margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.all(12),
        decoration: panelDecoration,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Label(
                    l10n.username,
                  ),
                  FormField(
                    controller: usernameController,
                    autofocus: true,
                    textInputType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    maxLength: 10,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return l10n.usernameError;
                      }
                      return null;
                    },
                  ),
                  Label(
                    l10n.password,
                  ),
                  FormField(
                    controller: passwordController,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return l10n.passwordError;
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: Button.main(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          final loginRequest = LoginRequest(
                            accountNumber: usernameController.text,
                            password: passwordController.text,
                            serialNumber: deviceInfo.serial,
                          );
                          try {
                            final response =
                                await crApi.authDevice(loginRequest);
                            if (response.responseCode == 0 && context.mounted) {
                              await showPinDialog(
                                ref: ref,
                                iconData: CustomIcons.lock,
                                callback: () {
                                  context.pop();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: CustomColours.green,
                                      content: Text(l10n.pinResetSuccess),
                                    ),
                                  );
                                },
                                reset: true,
                              );
                            } else {
                              throw Exception(response.responseMessage);
                            }
                          } catch (e) {
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: CustomColours.red,
                                  content: Text(e.toString()),
                                ),
                              );
                            }
                          }
                        }
                      },
                      borderColour: Colors.black,
                      inverse: true,
                      child: Text(l10n.submit),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }
}
