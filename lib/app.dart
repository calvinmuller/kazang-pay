import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'l10n/app_localizations.dart' show AppLocalizations;
import 'router.dart';
import 'theme.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routerConfig = ref.watch(routerProvider);

    return MaterialApp.router(
      routerConfig: routerConfig,
      title: 'Kazang Pay',
      theme: CustomTheme.lightThemeData(context),
      darkTheme: CustomTheme.darkThemeData(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
