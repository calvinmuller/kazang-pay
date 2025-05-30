import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'tcp_receiver_method_channel.dart';

abstract class TcpReceiverPlatform extends PlatformInterface {
  /// Constructs a TcpReceiverPlatform.
  TcpReceiverPlatform() : super(token: _token);

  static final Object _token = Object();

  static TcpReceiverPlatform _instance = MethodChannelTcpReceiver();

  /// The default instance of [TcpReceiverPlatform] to use.
  ///
  /// Defaults to [MethodChannelTcpReceiver].
  static TcpReceiverPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [TcpReceiverPlatform] when
  /// they register themselves.
  static set instance(TcpReceiverPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> transactionCompleted(String string) async {
    throw UnimplementedError('transactionCompleted() has not been implemented.');
  }

  void setMethodCallHandler(Future<Null> Function(dynamic call) param0) {
    throw UnimplementedError('setMethodCallHandler() has not been implemented.');
  }

  Future<void> stopServer() async {
    throw UnimplementedError('stopServer() has not been implemented.');
  }

  Future<void> startServer() async {
    throw UnimplementedError('startServer() has not been implemented.');
  }

  Future<void> saveConfig({
    required int port,
    required bool enabled,
  }) async {
    throw UnimplementedError('saveConfig() has not been implemented.');
  }

  Future<({int port, bool enabled})> loadConfig() async {
    throw UnimplementedError('loadConfig() has not been implemented.');
  }
}
