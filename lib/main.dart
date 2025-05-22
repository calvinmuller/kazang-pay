import 'package:flutter/material.dart' show WidgetsFlutterBinding, runApp;
import 'package:flutter_riverpod/flutter_riverpod.dart' show ProviderScope;

import 'app.dart' show MyApp;
import 'common/providers/app.provider.dart'
    show appNotifierProvider, AppNotifier;
import 'common/providers/device_info.dart' show DeviceInfoProvider;
import 'common/providers/intent.provider.dart';
import 'common/widgets/widgets.dart';
import 'helpers/transaction_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final deviceInfo = await TransactionHelper.getDeviceInfo();
  final appState = await TransactionHelper.getAppState();
  final intentInfo = await TransactionHelper.getIntentInfo();

  final newAppState = appState
      .copyWith(deviceInfo: deviceInfo)
      .setIntentInfo(intentInfo: intentInfo);

  // ignore: missing_provider_scope
  runApp(
    Phoenix(
      child: ProviderScope(
        overrides: [
          // ignore: scoped_providers_should_specify_dependencies
          appNotifierProvider
              .overrideWith(() => AppNotifier(appState: newAppState)),
          launchModeProvider.overrideWith((ref) =>
              intentInfo.isIntentTransaction
                  ? LaunchMode.intent
                  : LaunchMode.normal),
        ],
        child: DeviceInfoProvider(
          appState: appState,
          deviceInfo: deviceInfo,
          child: const MyApp(),
        ),
      ),
    ),
  );

  // final config = await TcpServerConfig.loadConfig();
  // print("Port: ${config.port}, Enabled: ${config.enabled}");
  //
  // // To update:
  // await TcpServerConfig.saveConfig(port: 8551, enabled: true);
  //
  // TcpListenerPlugin.onMessageReceived((msg) {
  //   final transaction = TcpTransaction.fromJson(json.decode(msg));
  //   print('Received Transaction: $transaction');
  //
  //   Future.delayed(const Duration(seconds: 5), () {
  //     TcpListenerPlugin.sendTransactionCompleted(transaction);
  //     print('Transaction Completed: $transaction');
  //   });
  // });
  //
  // TcpListenerPlugin.startServer();
}
