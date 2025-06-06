import 'package:flutter/material.dart' show BuildContext, StatelessWidget, Widget, Text, Column, Scaffold, AppBar, EdgeInsets, Icon, Icons, ListTile, Divider, Container, MainAxisSize;
import 'package:go_router/go_router.dart';

import '../core/constants.dart';
import '../core/core.dart';
import '../l10n/app_localizations.dart' show AppLocalizations;

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.settings),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: panelDecoration,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              onTap: () => context.pushNamed('proxy'),
              title: Text(l10n.proxySettings),
              trailing: const Icon(Icons.chevron_right),
            ),
            const Divider(),
            // ListTile(
            //   onTap: () => {},
            //   title: Text(l10n.sendDeviceLogs),
            //   trailing: const Icon(Icons.chevron_right),
            // ),
            // const Divider(),
            // ListTile(
            //   onTap: () => {},
            //   title: Text(l10n.connectPos),
            //   trailing: const Icon(Icons.chevron_right),
            // ),
            // const Divider(),
            ListTile(
              onTap: () => context.pushNamed('pin'),
              title: Text(l10n.supervisorPinTitle),
              trailing: const Icon(Icons.chevron_right),
            ),
            const Divider(),
            ListTile(
              onTap: () => context.pushNamed('profile'),
              title: Text(l10n.profile),
              trailing: const Icon(Icons.chevron_right),
            ),
            const Divider(),
            ListTile(
              onTap: () => context.pushNamed('language'),
              title: Text(l10n.language),
              trailing: const Icon(Icons.chevron_right),
            ),
          ],
        ),
      )
    );
  }
}
