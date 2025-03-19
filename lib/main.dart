import 'package:flutter/material.dart' show WidgetsFlutterBinding;
import 'package:flutter/widgets.dart' show runApp;
import 'package:flutter_riverpod/flutter_riverpod.dart' show ProviderScope;

import 'app.dart' show MyApp;
import 'common/providers/app.provider.dart'
    show appNotifierProvider, AppNotifier;
import 'common/providers/device_info.dart' show DeviceInfoProvider;
import 'helpers/transaction_helper.dart';
import 'models/app_state.dart' show TerminalProfile;
final profile = TerminalProfile.fromJson({
  "terminal_config": {
    "is_key_exchange_required": true,
    "contactless": true,
    "currency_symbol": "R",
    "custom_parameters": {
      "disabled_bins": [
        3400,
        3700,
        3770,
        3771,
        3798,
        3528,
        3529,
        3530,
        3600,
        3613,
        3615,
        3642
      ],
      "cashbacks": {"allowed": true, "limit": "1000"},
      "refunds": {"allowed": false, "limit": "0"}
    },
    "is_key_exchange_allowed": true,
    "currency_code": "710",
    "last_sequence_number": "000021",
    "terminal_serial_number": "P30224BCJ0696",
    "terminal_active": true,
    "terminal_id": "99166668",
    "slip_header": "Sun Groceries",
    "manual_pan_entry": false,
    "slip_trailer": "Thank You!"
  },
  "termapp_config": {
    "secondary_ip": "termapp-uat.kazang.net",
    "primary_ip": "termapp-uat.kazang.net",
    "data_ksn": "181401",
    "secondary_port": "443",
    "primary_port": "443",
    "type": ["primary", "secondary"],
    "pin_ksn": "181401"
  },
  "merchant_config": {
    "velocity_rules": [],
    "transaction_types": [
      "purchase",
      "void",
      "cash_withdrawal",
      "purchase_with_cashback",
      "balance_inquiry"
    ],
    "card_set": ["MV", "MVA", "MVAD", "MVADR"],
    "trading_name": "Sun Groceries",
    "merchant_active": true,
    "routing_switch": "LESAKA",
    "merchant_number": "000000006066668"
  },
  "user_config": {
    "user_active": true,
    "device_log_request": true,
    "user": "1000630635"
  }
});

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final deviceInfo = await TransactionHelper.getDeviceInfo();
  final appState = await TransactionHelper.getAppState();
  final intentInfo = await TransactionHelper.getIntentInfo();

  final newState = appState.copyWith(
    profile: profile
  );

  final newAppState = appState.copyWith(deviceInfo: deviceInfo).setIntentInfo(intentInfo: intentInfo);

  // ignore: missing_provider_scope
  runApp(
    Phoenix(
      child: ProviderScope(
        overrides: [
          // ignore: scoped_providers_should_specify_dependencies
          appNotifierProvider.overrideWith(() => AppNotifier(appState: newAppState))
        ],
        child: DeviceInfoProvider(
          appState: appState,
          deviceInfo: deviceInfo,
          child: const MyApp(),
        ),
      ),
    ),
  );
}
