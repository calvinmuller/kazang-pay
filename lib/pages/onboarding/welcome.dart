import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'
    show
        StatelessWidget,
        BuildContext,
        Widget,
        EdgeInsets,
        Spacer,
        Padding,
        Hero,
        Theme,
        Text,
        Container,
        Flexible,
        Row,
        Card,
        Column,
        Scaffold;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../common/widgets/widgets.dart' show Button;
import '../../core/constants.dart';
import '../../l10n/app_localizations.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Hero(
            tag: 'logo',
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 53),
              child: SvgPicture.asset("assets/kazang.svg"),
            ),
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              // spacing: 0,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: Text(
                    l10n.onboardingWelcome,
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
                Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                  color: CustomColours.lightGray,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      spacing: 10,
                      children: [
                        SvgPicture.asset(
                          "assets/onboarding/card-bulleted-outline.svg",
                          width: 72,
                        ),
                        Flexible(child: Text(l10n.onboard1)),
                      ],
                    ),
                  ),
                ),
                Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  color: CustomColours.lightGray,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      spacing: 10,
                      children: [
                        SvgPicture.asset(
                          "assets/onboarding/wallet-plus-outline.svg",
                          width: 72,
                        ),
                        Flexible(child: Text(l10n.onboard2)),
                      ],
                    ),
                  ),
                ),
                Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  color: CustomColours.lightGray,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      spacing: 10,
                      children: [
                        SvgPicture.asset(
                          "assets/onboarding/icon.svg",
                          width: 72,
                        ),
                        Flexible(child: Text(l10n.onboard3)),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
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
              onPressed: () {
                context.pushNamed('register');
              },
              child: Text(l10n.registerDevice),
            ),
          ),
        ],
      ),
    );
  }
}
