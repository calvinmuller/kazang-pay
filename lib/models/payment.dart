import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment.freezed.dart';

part 'payment.g.dart';

enum PaymentType { payment, cashback, voidTransaction }

@freezed
abstract class Payment with _$Payment {
  const Payment._();

  factory Payment({
    @Default(0) int amount,
    @Default(0) cashbackAmount,
    @Default(PaymentType.payment) PaymentType? type,
    @Default(false) bool? cashbackOnly,
    @Default(null) String? rrn,
  }) = _Payment;

  factory Payment.fromJson(Map<String, dynamic> json) =>
      _$PaymentFromJson(json);

  int get totalAmount {
    return (amount + cashbackAmount).toInt();
  }

  bool get isPayment {
    return amount > 0 && cashbackAmount == 0;
  }

  bool get cashWithdrawal {
    return amount == 0 && cashbackAmount > 0;
  }

  bool get hasAmount {
    return amount != 0 || cashbackAmount != 0;
  }
}
