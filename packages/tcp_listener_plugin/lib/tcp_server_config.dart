import 'package:flutter/services.dart';

class TcpServerConfig {
  static const _channel = MethodChannel('tcp_listener_plugin');

  static Future<void> saveConfig({
    required int port,
    required bool enabled,
  }) async {
    await _channel.invokeMethod('setServerConfig', {
      'port': port,
      'enabled': enabled,
    });
  }

  static Future<({int port, bool enabled})> loadConfig() async {
    final result = await _channel.invokeMethod('getServerConfig');
    return (
      port: result['port'] as int,
      enabled: result['enabled'] as bool,
    );
  }
}