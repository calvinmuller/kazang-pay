import 'package:flutter/material.dart' show InheritedWidget, BuildContext;

import '../../models/app_state.dart' show DeviceInfo;

class DeviceInfoProvider extends InheritedWidget {
  const DeviceInfoProvider({
    super.key,
    required this.deviceInfo,
    required super.child,
  });

  final DeviceInfo deviceInfo;

  static DeviceInfoProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<DeviceInfoProvider>();
  }

  @override
  bool updateShouldNotify(DeviceInfoProvider oldWidget) {
    return deviceInfo != oldWidget.deviceInfo;
  }
}