import 'package:flutter/material.dart' show InheritedWidget, BuildContext;

import '../../models/app_state.dart' show DeviceInfo, AppState;

class DeviceInfoProvider extends InheritedWidget {
  const DeviceInfoProvider({
    super.key,
    required this.deviceInfo,
    required this.appState,
    required super.child,
  });

  final DeviceInfo deviceInfo;
  final AppState appState;

  bool get isi5300 => deviceInfo.model?.toLowerCase() == "i5300";

  static DeviceInfoProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<DeviceInfoProvider>();
  }

  @override
  bool updateShouldNotify(DeviceInfoProvider oldWidget) {
    return deviceInfo != oldWidget.deviceInfo || appState != oldWidget.appState;
  }
}
