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
  static const platform = MethodChannel('net.kazang.pegasus/bridge');

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

  static Future<void> showToast(String message) async {
    await _instance.methodChannel.invokeMethod('showToast', {'message': message});
  }

  static dispose() {
    platform.setMethodCallHandler(null);
  }

  static initialize(FactoryEventHandler handler) async {
    platform.setMethodCallHandler((call) async {
      switch (call.method) {
        case 'onUserApplicationSelectionRequired':
          handler.onUserApplicationSelectionRequired(
            UserApplicationSelectionRequired(call.arguments),
          );
          break;
        case 'onUserBudgetSelectionRequiredEvent':
          handler.onUserBudgetSelectionRequiredEvent(
            UserBudgetSelectionRequiredEvent(call.arguments),
          );
          break;
        case 'onErrorEvent':
          handler.onErrorEvent(call.arguments);
          break;
        case 'onStatusMessageEvent':
          handler.onStatusMessageEvent(call.arguments);
          break;
        case 'onWaitingForCardEvent':
          handler.onWaitingForCardEvent(call.arguments);
          break;
        case 'onTransactionCompletedEvent':
          final event = TransactionCompletedEvent(jsonDecode(call.arguments));
          handler.onTransactionCompletedEvent(event);
          break;
        case 'onUserApplicationSelectionRequiredEvent':
          handler.onUserApplicationSelectionRequired(
            UserApplicationSelectionRequired(call.arguments),
          );
          break;
        case 'onReturnPrinterResultEvent':
          handler.onReturnPrinterResultEvent(
            PrinterResultEvent(call.arguments),
          );
          break;
        case 'onDisConnectEvent':
          handler.onDisConnectEvent(call.arguments as bool);
          break;
        case 'onPrintDataCancelledEvent':
          handler.onPrintDataCancelledEvent(
            call.arguments as bool,
          );
          break;
        case 'onBatteryStatusLowEvent':
          handler.onBatteryStatusLowEvent(
            call.arguments as int,
          );
          break;
        case 'onPrinterOperationEndEvent':
          handler.onPrinterOperationEndEvent(
            call.arguments as bool,
          );
          break;
        default:
          throw UnimplementedError(call.method);
      }
    });
  }

  static void connect({TerminalProfile? config}) async {
    return await _instance.methodChannel.invokeMethod('connect', {
      "config": config!.toJson(),
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
}
