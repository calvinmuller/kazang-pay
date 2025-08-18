import 'dart:ui';

import 'package:flutter/material.dart' show BuildContext, Widget, MaterialApp, ThemeMode;
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerWidget, WidgetRef;
import 'package:intl/intl.dart';

import 'common/providers/app.provider.dart';
import 'l10n/app_localizations.dart' show AppLocalizations;
import 'l10n/intl_so.dart';
import 'router.dart';
import 'theme.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routerConfig = ref.watch(routerProvider);
    final appLocale =
        ref.watch(appNotifierProvider.select((state) => state.language)) ??
            'en';

    Intl.defaultLocale = appLocale;

    return MaterialApp.router(
      themeMode: ThemeMode.dark,
      locale: Locale(appLocale),
      routerConfig: routerConfig,
      theme: CustomTheme.lightThemeData(context),
      darkTheme: CustomTheme.darkThemeData(context),
      localizationsDelegates: [...AppLocalizations.localizationsDelegates, NnMaterialLocalizations.delegate],
      supportedLocales: AppLocalizations.supportedLocales
    );
  }
}
