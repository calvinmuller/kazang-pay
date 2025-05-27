import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'tcp_receiver_platform_interface.dart';

/// An implementation of [TcpReceiverPlatform] that uses method channels.
class MethodChannelTcpReceiver extends TcpReceiverPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('tcp_listener_plugin');

  @override
  Future<void> startServer() async {
    try {
      await methodChannel.invokeMethod('startServer');
    } on PlatformException catch (e) {
      throw Exception('Failed to start server: ${e.message}');
    }
  }

  @override
  Future<void> stopServer() async {
    try {
      await methodChannel.invokeMethod('stopServer');
    } on PlatformException catch (e) {
      throw Exception('Failed to stop server: ${e.message}');
    }
  }

  @override
  Future<void> transactionCompleted(String string) async {
    try {
      await methodChannel.invokeMethod('transactionCompleted', {
        'transaction': string,
      });
    } on PlatformException catch (e) {
      throw Exception('Failed to complete transaction: ${e.message}');
    }
  }

  @override
  void setMethodCallHandler(Future<Null> Function(dynamic call) handler) {
    methodChannel.setMethodCallHandler(handler);
  }

  @override
  Future<void> saveConfig({required int port, required bool enabled}) async {
    try {
      await methodChannel.invokeMethod('setServerConfig', {
        'port': port,
        'enabled': enabled,
      });
    } on PlatformException catch (e) {
      throw Exception('Failed to save config: ${e.message}');
    }
  }

  @override
  Future<({int port, bool enabled})> loadConfig() async {
    try {
      final result = await methodChannel.invokeMethod<Map<Object?, Object?>>(
        'getServerConfig',
      );
      return (
        port: result?['port'] as int,
        enabled: result?['enabled'] as bool,
      );
    } on PlatformException catch (e) {
      throw Exception('Failed to load config: ${e.message}');
    }
  }
}
