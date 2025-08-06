import 'package:intl/intl.dart' show NumberFormat;

import '../common/providers/device_info.dart';

class CurrencyHelper {
  static String formatCurrency(context, int amount) {
    final currencySymbol = getCurrencySymbol(DeviceInfoProvider.of(context)!.appState.profile?.terminalConfig.currencyCode ?? '710');
    return NumberFormat.simpleCurrency(decimalDigits: 2, name: currencySymbol, locale: 'en_US').format(amount / 100);
  }

  static String formatForTransaction(int amount) {
    return (amount / 100).toStringAsFixed(2);
  }

  static getCurrencySymbol(String number) {
    switch (number) {
      case '710':
        return 'ZAR';
      case '894':
        return 'ZMW';
      case '072':
        return 'BWP';
      default:
        return 'ZAR';
    }
  }
}
