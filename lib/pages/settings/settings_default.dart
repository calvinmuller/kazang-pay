import 'package:flutter/material.dart';

import '../../core/constants.dart';
import '../../l10n/app_localizations.dart';

class SettingsDefault extends StatelessWidget {
  const SettingsDefault({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: CustomColours.white,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        border: Border.all(
          color: CustomColours.primaryNeutral,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.09),
            blurRadius: 3,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.settings,
              size: 64,
              color: CustomColours.grey,
            ),
            const SizedBox(height: 16),
            Text(
              l10n.selectSettingToConfig,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: CustomColours.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}