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
        Column,
        Container,
        Switch,
        Row;
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerStatefulWidget, ConsumerState;

import '../../common/providers/app.provider.dart';
import '../../common/widgets/widgets.dart' show Label;
import '../../core/core.dart';
import '../../l10n/app_localizations.dart';

class SettingsProxy extends ConsumerStatefulWidget {
  const SettingsProxy({super.key});

  @override
  ConsumerState<SettingsProxy> createState() => _SettingsProxyState();
}

class _SettingsProxyState extends ConsumerState<SettingsProxy> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final proxy = ref.watch(appNotifierProvider.select((state) => state.proxy));

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(l10n.supervisorPinTitle),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Label(
                  l10n.proxySettings,
                ),
                Switch(
                  // This bool value toggles the switch.
                  value: proxy,
                  // overlayColor: overlayColor,
                  // trackColor: trackColor,
                  onChanged: (bool value) {
                    ref.read(appNotifierProvider.notifier).setProxy(value);
                  },
                ),
              ],
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Host:proxy.kazang.net"),
                Text("Port:30720"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
