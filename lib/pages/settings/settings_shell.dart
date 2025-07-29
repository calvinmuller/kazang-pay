import 'package:flutter/material.dart';
import '../../common/utils/responsive.dart';
import '../../common/widgets/responsive_scaffold.dart';
import '../../l10n/app_localizations.dart';
import '../settings.dart';

class SettingsShell extends StatelessWidget {
  final Widget child;

  const SettingsShell({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isLargeDevice = Responsive.isLgUp(context);

    if (isLargeDevice) {
      return ResponsiveScaffold(
        appBar: AppBar(
          title: Text(l10n.settings),
        ),
        sideWidget: child,
        body: const SettingsPage(),
        sideWidgetFlex: 3,
        mainWidgetFlex: 2,
      );
    } else {
      // On small screens, just show the child directly
      return child;
    }
  }
}
