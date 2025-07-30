import 'package:flutter/material.dart'
    show
        BuildContext,
        Widget,
        EdgeInsets,
        Text,
        MainAxisSize,
        CrossAxisAlignment,
        Theme,
        TextAlign,
        Column,
        Container,
        DropdownMenu,
        DropdownMenuEntry;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/providers/app.provider.dart';
import '../../common/widgets/responsive_page_wrapper.dart';
import '../../core/constants.dart';
import '../../l10n/app_localizations.dart';

class SettingsLanguage extends ConsumerWidget {
  const SettingsLanguage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final appState = ref.watch(appNotifierProvider);
    return ResponsivePageWrapper(
      title: l10n.language,
      builder: (context) => Container(
        margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.all(12),
        decoration: panelDecoration,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 10,
          children: [
            Text(l10n.language,
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.left),
            DropdownMenu(
              label: Text(l10n.language),
              initialSelection: appState.language!,
              onSelected: (locale) =>
                  ref.read(appNotifierProvider.notifier).setLocale(locale),
              dropdownMenuEntries: AppLocalizations.supportedLocales
                  .map(
                    (locale) => DropdownMenuEntry(
                      value: locale.toString(),
                      label: label(locale.toString()),
                    ),
                  )
                  .toList(),
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
      case 'am':
        return 'Amharic';
      case 'so':
        return 'Somali';
      default:
        return '';
    }
  }
}
