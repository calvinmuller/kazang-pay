import 'package:flutter/services.dart';
import 'package:tcp_listener_plugin/transaction.dart';
export 'transaction.dart';
export 'tcp_server_config.dart';

class TcpListenerPlugin {
  static const MethodChannel _channel = MethodChannel('tcp_listener_plugin');

  static Future<void> startServer() async {
    await _channel.invokeMethod('startServer');
  }

  static Future<void> stopServer() async {
    await _channel.invokeMethod('stopServer');
  }

  static void onMessageReceived(Function(String message) callback) {
    _channel.setMethodCallHandler((call) async {
      if (call.method == 'onTransactionReceived') {
        callback(call.arguments as String);
      }
    });
  }

   static Future<void> sendTransactionCompleted(TcpTransaction txn) async {
    await _channel.invokeMethod('transactionCompleted', {'transaction': txn.toJson()});
  }
}