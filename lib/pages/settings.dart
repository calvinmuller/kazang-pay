import 'package:flutter/material.dart'
    show BuildContext, StatelessWidget, Widget, Text, Column, AppBar, EdgeInsets, Icon, Icons, ListTile, Divider, Container, MainAxisSize, Scaffold, BackButton;
import 'package:go_router/go_router.dart';
import '../common/utils/utils.dart' show Responsive;
import '../core/constants.dart';
import '../core/core.dart';
import '../l10n/app_localizations.dart' show AppLocalizations;

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var l10n = AppLocalizations.of(context)!;
    final isLargeDevice = Responsive.isLgUp(context);

    final content = Container(
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
    );

    if (isLargeDevice) {
      return content;
    } else {
      return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () => context.pop(),
          ),
          title: Text(l10n.settings),
        ),
        body: content,
      );
    }
  }
}
