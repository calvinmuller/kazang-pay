import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';
import 'common/providers/app.provider.dart';
import 'helpers/transaction_helper.dart';
import 'common/providers/device_info.dart';

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
