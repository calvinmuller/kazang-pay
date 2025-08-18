import 'package:flutter/material.dart'
    show
        StatelessWidget,
        BuildContext,
        Widget,
        EdgeInsets,
        Padding,
        Hero,
        Theme,
        Text,
        Container,
        Flexible,
        Row,
        Card,
        Column,
        TextAlign,
        ListView,
        Expanded;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../common/widgets/widgets.dart' show Button, ResponsiveScaffold;
import '../../core/constants.dart';
import '../../l10n/app_localizations.dart';
import '../../ui/widgets.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return ResponsiveScaffold(
      maxWidthFactor: 0.5,
      body: Column(
        children: [
          const Hero(
            tag: 'logo',
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 53),
              child: LogoWidget(),
            ),
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
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
                      const EdgeInsets.only(left: 16, right: 16, bottom: 10),
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
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Button(
              elevation: 0,
              height: 60,
              width: double.infinity,
              colour: CustomColours.prismBlue,
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
