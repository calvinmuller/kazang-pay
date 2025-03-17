import 'package:intl/intl.dart' show NumberFormat;

class CurrencyHelper {
  static String formatCurrency(context, int amount) {
    return NumberFormat.simpleCurrency(
      decimalDigits: 2
    ).format(amount / 100);
  }

  static String formatForTransaction(int amount) {
    return (amount / 100).toStringAsFixed(2);
  }
}
