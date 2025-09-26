import 'package:flutter/services.dart' show MethodChannel, PlatformException;
import 'package:flutter/material.dart' show debugPrint;

class DeviceHelper {
  static final DeviceHelper _instance = DeviceHelper._();

  DeviceHelper._();

  factory DeviceHelper() => _instance;

  static const MethodChannel _deviceChannel = MethodChannel('kazangpay_device');

  static Future<void> setKeyboardToNumeric() async {
    try {
      await _deviceChannel.invokeMethod('setKeyboardToNumeric');
    } on PlatformException catch (e) {
      debugPrint('Failed to set keyboard state: ${e.message}');
    }
  }

  static Future<void> setKeyboardToNumericQuiet() async {
    await _deviceChannel.invokeMethod('setKeyboardToNumeric');
  }
}