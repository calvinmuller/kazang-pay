import 'package:flutter/material.dart'
    show
        GlobalKey,
        FormState,
        BuildContext,
        Widget,
        EdgeInsets,
        BoxDecoration,
        TextSpan,
        TextStyle,
        Padding,
        Hero,
        Theme,
        Text,
        Column,
        Container,
        MainAxisSize,
        BorderSide,
        Border,
        FontWeight,
        RichText,
        CrossAxisAlignment,
        Form,
        Card,
        primaryFocus,
        UnfocusDisposition,
        ScaffoldMessenger,
        SnackBar,
        ListView,
        Scaffold;
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerState, ConsumerStatefulWidget;
import 'package:flutter_svg/svg.dart' show SvgPicture;
import 'package:go_router/go_router.dart';
import '../../common/providers/api.provider.dart';
import '../../common/providers/app.provider.dart';
import '../../common/providers/device_info.dart';
import '../../common/widgets/widgets.dart' show Button, Label, FormField;
import '../../core/constants.dart';
import '../../l10n/app_localizations.dart';
import '../../models/crm.dart';
import '../../models/kazang.dart';

class RegistrationPage extends ConsumerStatefulWidget {
  const RegistrationPage({super.key});

  @override
  RegistrationPageState createState() => RegistrationPageState();
}

// Username 1000630635
// Password 1234

class RegistrationPageState extends ConsumerState<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final loginRequest = LoginRequest();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final api = ref.read(crmRepositoryProvider);
    final deviceInfo = DeviceInfoProvider.of(context)!.deviceInfo;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: ListView(children: [
        Hero(
          tag: 'logo',
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 53),
            child: SvgPicture.asset("assets/kazang.svg"),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          margin: const EdgeInsets.only(bottom: 20),
          child: Column(
            spacing: 20,
            children: [
              Text(
                l10n.onboardingRegister,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                l10n.onboardRegisterHelp,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
        ),
        Card(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                  decoration: const BoxDecoration(
                    borderRadius: borderRadiusSmall,
                    color: CustomColours.lightGray,
                    border: Border(
                      bottom: BorderSide(
                        color: CustomColours.lightGray,
                        width: 1,
                      ),
                    ),
                  ),
                  margin: const EdgeInsets.all(12),
                  padding: const EdgeInsets.all(12),
                  child: RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.bodySmall,
                      children: <TextSpan>[
                        TextSpan(
                          text: l10n.standalone,
                          style: const TextStyle(
                            color: CustomColours.orange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: l10n.signIn),
                      ],
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Label(
                        l10n.accountNumber,
                      ),
                      FormField(
                        maxLength: 10,
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return l10n.usernameError;
                          }
                          if (value.length < 10) {
                            return l10n.usernameMin;
                          }
                          if (value.length > 10) {
                            return l10n.usernameMax;
                          }
                          return null;
                        },
                        onSaved: (value) {
                          loginRequest.accountNumber = value;
                        },
                      ),
                      Label(
                        l10n.password,
                      ),
                      FormField(
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return l10n.passwordError;
                          }
                          return null;
                        },
                        onSaved: (value) {
                          loginRequest.password = value;
                        },
                      ),
                      Label(
                        l10n.enterSerialNumber,
                      ),
                      FormField(
                        initialValue: deviceInfo.serial,
                        maxLength: 14,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return l10n.required;
                          }
                          if (value.length > 14) {
                            return l10n.serialNumberLengthMax;
                          }
                          if (value.length < 13) {
                            return l10n.serialNumberLengthMin;
                          }
                          return null;
                        },
                        onSaved: (value) {
                          loginRequest.serialNumber = value;
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Button(
            elevation: 0,
            height: 60,
            width: double.infinity,
            colour: CustomColours.greenish,
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                context.pushNamed('loader');
                if (primaryFocus != null) {
                  primaryFocus!.unfocus(disposition: UnfocusDisposition.scope);
                }
                try {
                  final loginResponse = await api.addDevice(loginRequest);

                  final response = await api.getRequestStatus(
                    loginRequest.accountNumber!,
                    loginResponse.requestType,
                  );

                  if ((response.status == StatusResult.Failed &&
                          response.isLinked) ||
                      response.status == StatusResult.Success) {
                    ref.read(appNotifierProvider.notifier).setConfigured(loginRequest);
                  } else if (response.status == StatusResult.Failed) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: CustomColours.red,
                          content: Text(response.statusDescription),
                          duration: const Duration(seconds: 5),
                        ),
                      );
                    }
                  }
                } catch (e) {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: CustomColours.red,
                        content: Text(l10n.connectionError),
                        duration: const Duration(seconds: 5),
                      ),
                    );
                  }
                }
              }
            },
            child: Text(l10n.submit),
          ),
        )
      ]),
    );
  }
}
