import '../../helpers/transaction_helper.dart' show TransactionHelper;
import '../../models/app_state.dart';
import '../../models/payment.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/transaction_result.dart';
import 'intent.provider.dart';

part 'payment.provider.g.dart';

@riverpod
class PaymentNotifier extends _$PaymentNotifier {
  @override
  Payment build() =>
      Payment(amount: 0, cashbackAmount: 0, type: PaymentType.payment);

  void updatePayment(int amount) => state.copyWith(amount: amount);

  void set(PaymentType type) {
    state = state.copyWith(type: type);
  }

  void voidTransaction(String rrn) {
    state = state.copyWith(type: PaymentType.voidTransaction, rrn: rrn);
  }

  void updateCashbackAmount(int amount) =>
      state.copyWith(cashbackAmount: amount);

  void numberPressed(i) {
    if (state.type == PaymentType.cashback) {
      final number = state.cashbackAmount;
      final newAmount = "$number$i";
      if (newAmount.length < 9) {
        state = state.copyWith(cashbackAmount: int.parse(newAmount));
      }
    } else {
      final number = state.amount;
      final newAmount = "$number$i";
      if (newAmount.length < 9) {
        state = state.copyWith(amount: int.parse(newAmount));
      }
    }
  }

  clear() {
    if (state.type == PaymentType.cashback) {
      final amount = state.cashbackAmount
          .toString()
          .substring(0, state.cashbackAmount.toString().length - 1);

      state = state.copyWith(cashbackAmount: int.tryParse(amount) ?? 0);
    } else {
      final amount = state.amount
          .toString()
          .substring(0, state.amount.toString().length - 1);

      state = state.copyWith(amount: int.tryParse(amount) ?? 0);
    }
  }

  clearAll() {
    state =
        state.copyWith(amount: 0, cashbackAmount: 0, type: PaymentType.payment);
  }
}

@Riverpod(keepAlive: true)
class PaymentIntentNotifier extends _$PaymentIntentNotifier {
  @override
  Payment build() =>
      Payment(amount: 0, cashbackAmount: 0, type: PaymentType.payment);

  void setFromIntentInfo(IntentInfo intentInfo) {
    state = state.copyWith(
      amount: 1000,
      cashbackAmount: 0,
      // amount: int.parse(intentInfo.amount!),
      // cashbackAmount: int.parse(intentInfo.cashbackAmount ?? "0"),
      type: intentInfo.transactionType! == PaymentType.Purchase
          ? PaymentType.payment
          : PaymentType.voidTransaction,
      rrn: intentInfo.uniqueId,
    );
  }

  complete({TransactionResult? transactionResult}) async {
    ref.read(launchModeProvider.notifier).state = LaunchMode.normal;
    state = state.copyWith(
      amount: 0,
      cashbackAmount: 0,
      type: PaymentType.payment,
    );
    await TransactionHelper.completeTransaction(state, transactionResult);
  }
}
