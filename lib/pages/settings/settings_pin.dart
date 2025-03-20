import 'package:flutter/material.dart'
    show
        BuildContext,
        Scaffold,
        Widget,
        EdgeInsets,
        Text,
        AppBar,
        MainAxisSize,
        CrossAxisAlignment,
        Theme,
        Column,
        Container,
        InputDecoration,
        TextInputType,
        TextInputAction,
        BorderSide,
        OutlineInputBorder,
        TextFormField,
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

import '../../common/common.dart';
import '../../common/providers/api.provider.dart';
import '../../common/providers/device_info.dart';
import '../../common/widgets/widgets.dart' show Label, Button;
import '../../core/constants.dart';
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
    final deviceInfo = DeviceInfoProvider.of(context)!.deviceInfo;
    final crApi = ref.watch(crRepositoryProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.supervisorPinTitle),
      ),
      body: Container(
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
                  TextFormField(
                      controller: usernameController,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      style: Theme.of(context).textTheme.bodySmall,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: CustomColours.black,
                          ),
                          borderRadius: borderRadiusSmall,
                        ),
                      ),
                      maxLength: 10,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return l10n.usernameError;
                        }
                        return null;
                      }),
                  Label(
                    l10n.password,
                  ),
                  TextFormField(
                    controller: passwordController,
                    style: Theme.of(context).textTheme.bodySmall,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return l10n.passwordError;
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: CustomColours.black,
                        ),
                        borderRadius: borderRadiusSmall,
                      ),
                    ),
                    onSaved: (value) {
                      // loginRequest.password = value;
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
}
