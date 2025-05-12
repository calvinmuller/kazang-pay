import 'dart:convert' show jsonDecode;
import 'package:flutter/services.dart' show MethodChannel, EventChannel;
import '../common/interfaces/factory.events.dart'
    show
        FactoryEventHandler,
        PlatformEvent,
        PrinterResultEvent,
        TransactionCompletedEvent,
        UserApplicationSelectionRequired,
        UserBudgetSelectionRequiredEvent;
import '../models/app_state.dart';
import '../models/payment.dart';
import '../models/transaction.dart';
import 'currency_helpers.dart';

class TransactionHelper {
  static final TransactionHelper _instance = TransactionHelper._();

  TransactionHelper._();

  final MethodChannel methodChannel = const MethodChannel('kazangpay');

  final EventChannel messageChannel = const EventChannel('factoryEventHandler');

  static Stream<PlatformEvent> get messageStream async* {
    await for (PlatformEvent event in _instance.messageChannel
        .receiveBroadcastStream()
        .map((message) => PlatformEvent(message['event'], message['value']))) {
      yield event;
    }
  }

  static Future<void> doTransaction(Payment payment) async {
    final amount = CurrencyHelper.formatForTransaction(payment.amount);
    final cashbackAmount =
        CurrencyHelper.formatForTransaction(payment.cashbackAmount!);

    if (payment.type == PaymentType.voidTransaction) {
      await _instance.methodChannel
          .invokeMethod('voidTransaction', {'rrn': payment.rrn});
      return;
    }

    if (payment.cashWithdrawal) {
      await _instance.methodChannel.invokeMethod('createCashWithdrawal',
          {'amount': amount, 'cashbackAmount': cashbackAmount});
    } else if (payment.isPayment) {
      await _instance.methodChannel.invokeMethod('createPurchase', {
        'amount': amount,
        'description': '',
      });
    } else {
      await _instance.methodChannel.invokeMethod('createCashback', {
        'amount': amount,
        'cashbackAmount': cashbackAmount,
      });
    }
  }

  static Future<DeviceInfo> getDeviceInfo() async {
    final deviceInfo =
        (await _instance.methodChannel.invokeMethod('getDeviceInfo') as Map)
            .cast<String, dynamic>();
    return DeviceInfo.fromJson(deviceInfo);
  }

  static Future continueTransaction(int position, String value) async {
    return await _instance.methodChannel
        .invokeMethod('continueTransaction', {'pos': position, 'value': value});
  }

  static Future<bool> continueTransactionBudget(int value) async {
    return await _instance.methodChannel
        .invokeMethod('continueTransactionBudget', {'value': value});
  }

  static Future<List<Transaction>> getHistoryData() async {
    return (await _instance.methodChannel.invokeMethod('getHistoryData')
            as List)
        .map((item) => Transaction.fromJson(jsonDecode(item)))
        .toList();
  }

  static Future<Transaction> getByReferenceData(responseId) async {
    final result = await _instance.methodChannel
        .invokeMethod('getByReferenceData', {'responseId': responseId});
    return Transaction.fromJson(jsonDecode(result));
  }

  static initialize(FactoryEventHandler handler) async {
    var result = TransactionHelper.messageStream;

    await for (final message in result) {
      if (message.event == "onUserApplicationSelectionRequiredEvent") {
        handler.onUserApplicationSelectionRequired(
          UserApplicationSelectionRequired(message.value),
        );
      } else if (message.event == "onUserBudgetSelectionRequiredEvent") {
        handler.onUserBudgetSelectionRequiredEvent(
          UserBudgetSelectionRequiredEvent(message.value),
        );
      } else if (message.event == "onTransactionCompletedEvent") {
        handler.onTransactionCompletedEvent(
          TransactionCompletedEvent(jsonDecode(message.value)),
        );
      } else if (message.event == "onErrorEvent") {
        handler.onErrorEvent(
          message.value,
        );
      } else if (message.event == "onStatusMessageEvent") {
        handler.onStatusMessageEvent(
          message.value,
        );
      } else if (message.event == "onWaitingForCardEvent") {
        handler.onWaitingForCardEvent(
          message.value as bool,
        );
      } else if (message.event == "onReturnPrinterResultEvent") {
        handler.onReturnPrinterResultEvent(
          PrinterResultEvent(message.value),
        );
      } else if (message.event == "onDisConnectEvent") {
        handler.onDisConnectEvent(
          message.value as bool,
        );
      } else if (message.event == "onBatteryStatusLowEvent") {
        handler.onBatteryStatusLowEvent(
          message.value as int,
        );
      } else if (message.event == "onPrintDataCancelledEvent") {
        handler.onPrintDataCancelledEvent(
          message.value as bool,
        );
      } else if (message.event == "onKmsUpdateRequired") {
        handler.onKmsUpdateRequired();
      } else if (message.event == "onOsUpdateRequired") {
        final build = message.value['build'];
        final seNumber = message.value['seNumber'];
        handler.onOsUpdateRequired(build, seNumber);
      } else if (message.event == "onFactoryInitialized") {
        handler.onFactoryInitialized();
      } else if (message.event == "onKmsUpdateResult") {
        final status = message.value['status'];
        final msg = message.value['message'];
        handler.onKmsUpdateResult(status, msg);
      }
    }

    return;
  }

  static Future<void> connect(
      {TerminalProfile? config, bool proxy = false}) async {
    return await _instance.methodChannel.invokeMethod('connect', {
      "config": config!.toJson(),
      "proxy": proxy,
    });
  }

  static void reconnect() async {
    return await _instance.methodChannel.invokeMethod('reconnect');
  }

  static void printReceipt() async {
    var trx = await getHistoryData();
    final id = trx.last.retrievalReferenceNumber;
    return await _instance.methodChannel
        .invokeMethod('print', {"responseId": id});
  }

  static void abortTransaction() async {
    return await _instance.methodChannel.invokeMethod('abortTransaction');
  }

  static saveJson(String key, Object value) async {
    return await _instance.methodChannel
        .invokeMethod('save', {"key": key, "value": value});
  }

  static Future<Map> getJson(String key) async {
    return await _instance.methodChannel.invokeMethod('load', {"key": key}) ??
        {};
  }

  static paymentSuccess() async {
    await _instance.methodChannel.invokeMethod('paymentSuccess');
  }

  static Future<AppState> getAppState() async {
    final appState = (await getJson('appState')).cast<String, dynamic>();
    return appState.isNotEmpty ? AppState.fromJson(appState) : AppState();
  }

  static Future<IntentInfo> getIntentInfo() async {
    final result = (await _instance.methodChannel.invokeMethod('getIntentInfo'))
        .cast<String, dynamic>();
    return IntentInfo.fromJson(result);
  }

  static void performRemoteKmsUpdate() async {
    await _instance.methodChannel.invokeMethod('performRemoteKmsUpdate');
  }

  static void performOsUpdate() async {
    await _instance.methodChannel.invokeMethod('performOsUpdate');
  }
}
