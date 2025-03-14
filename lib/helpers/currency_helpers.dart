import 'package:flutter/material.dart' show Localizations;
import 'package:intl/intl.dart';

class CurrencyHelper {
  static String formatCurrency(context, int amount) {
    final locale = Localizations.localeOf(context);
    return NumberFormat.simpleCurrency(
      locale: locale.toString(),
      decimalDigits: 2
    ).format(amount / 100);
  }

  static String formatForTransaction(int amount) {
    return (amount / 100).toStringAsFixed(2);
  }
}
