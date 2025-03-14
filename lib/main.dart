
import 'package:flutter/material.dart' show WidgetsFlutterBinding;
import 'package:flutter/widgets.dart' show runApp;
import 'package:flutter_riverpod/flutter_riverpod.dart' show ProviderScope;

import 'app.dart' show MyApp;
import 'common/providers/app.provider.dart' show appNotifierProvider, AppNotifier;
import 'common/providers/device_info.dart' show DeviceInfoProvider;
import 'helpers/transaction_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final deviceInfo = await TransactionHelper.getDeviceInfo();
  final appState = await TransactionHelper.getAppState();

  runApp(
    ProviderScope(
      overrides: [
        appNotifierProvider.overrideWith(() => AppNotifier(appState: appState)),
      ],
      child: DeviceInfoProvider(
        deviceInfo: deviceInfo,
        child: const MyApp(),
      ),
    ),
  );
}
