import 'tcp_receiver_platform_interface.dart';
import 'transaction.dart';

class TcpReceiver {
  Future<void> startServer() async {
    await TcpReceiverPlatform.instance.startServer();
  }

  Future<void> stopServer() async {
    await TcpReceiverPlatform.instance.stopServer();
  }

  void onMessageReceived(Function(String message) callback) {
    TcpReceiverPlatform.instance.setMethodCallHandler((call) async {
      if (call.method == 'onTransactionReceived') {
        callback(call.arguments as String);
      }
    });
  }

  Future<void> sendTransactionCompleted(TcpTransactionResponse txn) async {
    await TcpReceiverPlatform.instance.transactionCompleted(txn.toString());
  }

  Future<void> saveConfig({required int port, required bool enabled}) async {
    await TcpReceiverPlatform.instance.saveConfig(port: port, enabled: enabled);
  }

  Future<({int port, bool enabled})> loadConfig() async {
    return await TcpReceiverPlatform.instance.loadConfig();
  }
}
