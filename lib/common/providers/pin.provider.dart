import 'package:flutter/material.dart' show Color, IconData;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/pin.dart' show PinDialogConfig;

part 'pin.provider.g.dart';

@Riverpod(keepAlive: true)
class PinDialogNotifier extends _$PinDialogNotifier {
  @override
  PinDialogConfig build() {
    return PinDialogConfig();
  }

  setState({String? title, Color? actionButtonColour, bool? reset, String? message, IconData? iconData}) {
    state = state.copyWith(
      title: title,
      actionButtonColour: actionButtonColour,
      reset: reset ?? false,
      message: message,
      iconData: iconData,
    );
  }
}