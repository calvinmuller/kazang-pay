import 'package:flutter/material.dart' show BuildContext;
import 'package:go_router/go_router.dart' show GoRoute, GoRouterState, ShellRoute;

import '../common/utils/responsive.dart';
import '../pages/pages.dart';

final settingsRoutes = ShellRoute(
  builder: (context, state, child) {
    return SettingsShell(child: child);
  },
  routes: [
    GoRoute(
      name: 'settings',
      path: 'settings',
      builder: (BuildContext context, GoRouterState state) {
        final isLargeDevice = Responsive.isLgUp(context);
        
        if (isLargeDevice) {
          return const SettingsDefault();
        } else {
          return const SettingsPage();
        }
      },
      routes: [
        GoRoute(
          name: 'profile',
          path: 'profile',
          builder: (BuildContext context, GoRouterState state) =>
              const SettingsProfile(),
        ),
        GoRoute(
          name: 'language',
          path: 'language',
          builder: (BuildContext context, GoRouterState state) =>
              const SettingsLanguage(),
        ),
        GoRoute(
          name: 'pin',
          path: 'pin',
          builder: (BuildContext context, GoRouterState state) =>
              const SettingsPin(),
        ),
        GoRoute(
          name: 'proxy',
          path: 'proxy',
          builder: (BuildContext context, GoRouterState state) =>
              const SettingsProxy(),
        )
      ],
    ),
  ],
);
