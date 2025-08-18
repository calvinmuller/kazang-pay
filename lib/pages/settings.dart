import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../common/utils/utils.dart'; // Responsive
import '../core/constants.dart';
import '../core/core.dart';
import '../l10n/app_localizations.dart';
import '../routes/settings_routes.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late GoRouter _router;
  String? _currentRoute;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _router = GoRouter.of(settingsNavigatorKey.currentState!.context);
      _router.routerDelegate.addListener(_routeListener);
      setState(() {});
    });
  }

  void _routeListener() {
    setState(() {
      _currentRoute =
          _router.routerDelegate.currentConfiguration.last.matchedLocation;
    });
  }

  bool _isRouteActive(String route) {
    return _currentRoute!.endsWith(route);
  }

  @override
  void dispose() {
    _router.routerDelegate.removeListener(_routeListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isLargeDevice = Responsive.isLgUp(context);

    final content = Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: panelDecoration,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // ListTile(
          //   onTap: _currentRoute == null || !_isRouteActive('proxy')
          //       ? () => context.pushNamed('proxy')
          //       : null,
          //   title: Text(l10n.proxySettings),
          //   trailing: const Icon(Icons.chevron_right),
          //   enabled: _currentRoute == null || !_isRouteActive('proxy'),
          // ),
          // const Divider(),
          ListTile(
            onTap: _currentRoute == null || !_isRouteActive('pin')
                ? () => context.pushNamed('pin')
                : null,
            title: Text(l10n.supervisorPinTitle),
            trailing: const Icon(Icons.chevron_right),
            enabled: _currentRoute == null || !_isRouteActive('pin'),
          ),
          const Divider(),
          ListTile(
            onTap: _currentRoute == null || !_isRouteActive('profile')
                ? () => context.pushNamed('profile')
                : null,
            title: Text(l10n.profile),
            trailing: const Icon(Icons.chevron_right),
            enabled: _currentRoute == null || !_isRouteActive('profile'),
          ),
          const Divider(),
          ListTile(
            onTap: _currentRoute == null || !_isRouteActive('language')
                ? () => context.pushNamed('language')
                : null,
            title: Text(l10n.language),
            trailing: const Icon(Icons.chevron_right),
            enabled: _currentRoute == null || !_isRouteActive('language'),
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
