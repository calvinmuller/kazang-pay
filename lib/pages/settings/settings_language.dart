import 'package:flutter/cupertino.dart';
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
        TextAlign,
        Column,
        Container,
        DropdownMenu,
        DropdownMenuItem,
        DropdownMenuEntry,
        Locale;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/providers/app.provider.dart';
import '../../common/providers/device_info.dart';
import '../../common/widgets/key_value.dart';
import '../../core/constants.dart';
import '../../l10n/app_localizations.dart';

class SettingsLanguage extends ConsumerWidget {
  const SettingsLanguage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final appState = ref.watch(appNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.profile),
      ),
      body: Container(
        margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.all(12),
        decoration: panelDecoration,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 10,
          children: [
            Text(l10n.language, style: Theme.of(context).textTheme.titleMedium, textAlign: TextAlign.left),
            DropdownMenu(
              label: Text(l10n.language),
              initialSelection: appState.language!,
              onSelected: (locale) =>
                  ref.read(appNotifierProvider.notifier).setLocale(locale),
              dropdownMenuEntries: AppLocalizations.supportedLocales.map(
                    (locale) => DropdownMenuEntry(
                      value: locale.toString(),
                      label: label(locale.toString()),
                    ),
                  ).toList(),
            ),
          ],
        ),
      ),
    );
  }

  String label(String locale) {
    switch (locale) {
      case 'af':
        return 'Afrikaans';
      case 'en_ZA':
        return 'English (South Africa)';
      case 'en':
        return 'English';
      default:
        return '';
    }
  }
}
