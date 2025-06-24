import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show BuildContext;

import '../common/providers/device_info.dart' show DeviceInfoProvider;

extension IndexedIterable<E> on Iterable<E> {
  Iterable<T> mapIndexed<T>(T Function(E e, int i) f) {
    var i = 0;
    return map((e) => f(e, i++));
  }
}

extension UrovoSizeExtension on BuildContext {
  bool hasPinPad() {
    final deviceInfo = DeviceInfoProvider.of(this);
    try {
      return deviceInfo!.deviceInfo.model!.toLowerCase() == "i5300";
    } catch (e) {
      return false;
    }
  }

  double dynamicSize(double baseSize, double urovoSize) {
    final mediaQuery = MediaQuery.of(this);
    try {
      if (mediaQuery.size.height < 800) {
        return urovoSize;
      } else {
        return baseSize;
      }
    } catch (e) {
      return baseSize;
    }
  }

  void deviceCallback({required Function urovo, required Function sunmi}) {
    final deviceInfo = DeviceInfoProvider.of(this);
    if (["urovo", "ubx"]
        .contains(deviceInfo!.deviceInfo.manufacturer!.toLowerCase())) {
      urovo();
    } else {
      sunmi();
    }
  }
}
