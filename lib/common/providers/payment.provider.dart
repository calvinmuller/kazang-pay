// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:tcp_receiver/transaction.dart' show TcpTransaction;

import '../../core/core.dart';
import '../../models/app_state.dart';
import '../../models/payment.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'payment.controller.dart';

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
    state = state.copyWith(
      amount: 0,
      cashbackAmount: 0,
      type: PaymentType.payment,
      launchMode: LaunchMode.normal,
    );
  }

  void setFromIntentInfo(IntentInfo intentInfo) {
    // Hack this one
    final amount = (intentInfo.transactionType == PaymentType.Cash_withdrawal)
        ? int.parse("0")
        : int.parse(intentInfo.amount ?? "0");

    final cashbackAmount =
        (intentInfo.transactionType == PaymentType.Cash_withdrawal)
            ? int.parse(intentInfo.amount ?? "0")
            : int.parse(intentInfo.cashBackAmount ?? "0");

    state = state.copyWith(
      amount: amount,
      cashbackAmount: cashbackAmount,
      type:
          intentInfo.isVoid ? PaymentType.voidTransaction : PaymentType.payment,
      rrn: intentInfo.refNo,
      uniqueId: intentInfo.uniqueId,
      launchMode: LaunchMode.intent,
    );

    print(state.toString());

    ref.read(paymentControllerProvider.notifier).setPayment(state);
  }

  void setFromTcpTransaction(TcpTransaction tcpTransaction) {
    state = state.copyWith(
      amount: tcpTransaction.amount,
      cashbackAmount: tcpTransaction.cashbackAmount,
      type: tcpTransaction.isVoid
          ? PaymentType.voidTransaction
          : PaymentType.payment,
      rrn: tcpTransaction.refNo,
      uniqueId: tcpTransaction.uniqueId,
      launchMode: LaunchMode.wifi,
    );

    ref.read(paymentControllerProvider.notifier).setPayment(state);
  }
}
