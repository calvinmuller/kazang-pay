import 'package:flutter/services.dart' show EventChannel;

class Connectivity {
  static const EventChannel _channel = EventChannel(
    'connectivity/status',
  );

  static Stream<bool> get onConnectivityChanged {
    return _channel.receiveBroadcastStream().map((event) => event == true);
  }
}
