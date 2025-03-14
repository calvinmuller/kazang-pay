import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/providers/app.provider.dart';
import '../../common/widgets/key_value.dart';
import '../../core/constants.dart';
import '../../l10n/app_localizations.dart';

class SettingsProfile extends ConsumerWidget {
  const SettingsProfile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final appState = ref.watch(appNotifierProvider);
    final deviceInfo = ref.watch(getDeviceInfoProvider);

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
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Text(l10n.profileInformation, style: Theme.of(context).textTheme.titleMedium, textAlign: TextAlign.left),
            KeyValueWidget(title: l10n.terminalIdTitle, value: appState.profile!.terminalConfig.terminalId),
            KeyValueWidget(title: l10n.merchantId, value: appState.profile!.merchantConfig.merchantNumber),
            KeyValueWidget(title: l10n.username, value: appState.profile!.userConfig.user),
            KeyValueWidget(title: l10n.deviceSerial, value: appState.profile!.terminalConfig.terminalSerialNumber),
            KeyValueWidget(title: l10n.version, value: deviceInfo.valueOrNull?.apiVersion ?? ""),
          ],
        ),
      ),
    );
  }
}
