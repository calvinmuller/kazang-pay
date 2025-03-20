import 'package:flutter/material.dart' show Color, IconData;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pin.freezed.dart';

@freezed
abstract class PinDialogConfig with _$PinDialogConfig {
  const PinDialogConfig._();

  factory PinDialogConfig({
    String? title,
    String? message,
    Color? actionButtonColour,
    IconData? iconData,
    @Default(false) bool reset,
  }) = _PinDialogConfig;
}
