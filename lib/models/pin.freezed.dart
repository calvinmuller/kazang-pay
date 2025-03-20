// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pin.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PinDialogConfig {
  String? get title;
  String? get message;
  Color? get actionButtonColour;
  IconData? get iconData;
  bool get reset;

  /// Create a copy of PinDialogConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PinDialogConfigCopyWith<PinDialogConfig> get copyWith =>
      _$PinDialogConfigCopyWithImpl<PinDialogConfig>(
          this as PinDialogConfig, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PinDialogConfig &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.actionButtonColour, actionButtonColour) ||
                other.actionButtonColour == actionButtonColour) &&
            (identical(other.iconData, iconData) ||
                other.iconData == iconData) &&
            (identical(other.reset, reset) || other.reset == reset));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, title, message, actionButtonColour, iconData, reset);

  @override
  String toString() {
    return 'PinDialogConfig(title: $title, message: $message, actionButtonColour: $actionButtonColour, iconData: $iconData, reset: $reset)';
  }
}

/// @nodoc
abstract mixin class $PinDialogConfigCopyWith<$Res> {
  factory $PinDialogConfigCopyWith(
          PinDialogConfig value, $Res Function(PinDialogConfig) _then) =
      _$PinDialogConfigCopyWithImpl;
  @useResult
  $Res call(
      {String? title,
      String? message,
      Color? actionButtonColour,
      IconData? iconData,
      bool reset});
}

/// @nodoc
class _$PinDialogConfigCopyWithImpl<$Res>
    implements $PinDialogConfigCopyWith<$Res> {
  _$PinDialogConfigCopyWithImpl(this._self, this._then);

  final PinDialogConfig _self;
  final $Res Function(PinDialogConfig) _then;

  /// Create a copy of PinDialogConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? message = freezed,
    Object? actionButtonColour = freezed,
    Object? iconData = freezed,
    Object? reset = null,
  }) {
    return _then(_self.copyWith(
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      actionButtonColour: freezed == actionButtonColour
          ? _self.actionButtonColour
          : actionButtonColour // ignore: cast_nullable_to_non_nullable
              as Color?,
      iconData: freezed == iconData
          ? _self.iconData
          : iconData // ignore: cast_nullable_to_non_nullable
              as IconData?,
      reset: null == reset
          ? _self.reset
          : reset // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _PinDialogConfig extends PinDialogConfig {
  _PinDialogConfig(
      {this.title,
      this.message,
      this.actionButtonColour,
      this.iconData,
      this.reset = false})
      : super._();

  @override
  final String? title;
  @override
  final String? message;
  @override
  final Color? actionButtonColour;
  @override
  final IconData? iconData;
  @override
  @JsonKey()
  final bool reset;

  /// Create a copy of PinDialogConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PinDialogConfigCopyWith<_PinDialogConfig> get copyWith =>
      __$PinDialogConfigCopyWithImpl<_PinDialogConfig>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PinDialogConfig &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.actionButtonColour, actionButtonColour) ||
                other.actionButtonColour == actionButtonColour) &&
            (identical(other.iconData, iconData) ||
                other.iconData == iconData) &&
            (identical(other.reset, reset) || other.reset == reset));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, title, message, actionButtonColour, iconData, reset);

  @override
  String toString() {
    return 'PinDialogConfig(title: $title, message: $message, actionButtonColour: $actionButtonColour, iconData: $iconData, reset: $reset)';
  }
}

/// @nodoc
abstract mixin class _$PinDialogConfigCopyWith<$Res>
    implements $PinDialogConfigCopyWith<$Res> {
  factory _$PinDialogConfigCopyWith(
          _PinDialogConfig value, $Res Function(_PinDialogConfig) _then) =
      __$PinDialogConfigCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? title,
      String? message,
      Color? actionButtonColour,
      IconData? iconData,
      bool reset});
}

/// @nodoc
class __$PinDialogConfigCopyWithImpl<$Res>
    implements _$PinDialogConfigCopyWith<$Res> {
  __$PinDialogConfigCopyWithImpl(this._self, this._then);

  final _PinDialogConfig _self;
  final $Res Function(_PinDialogConfig) _then;

  /// Create a copy of PinDialogConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = freezed,
    Object? message = freezed,
    Object? actionButtonColour = freezed,
    Object? iconData = freezed,
    Object? reset = null,
  }) {
    return _then(_PinDialogConfig(
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      actionButtonColour: freezed == actionButtonColour
          ? _self.actionButtonColour
          : actionButtonColour // ignore: cast_nullable_to_non_nullable
              as Color?,
      iconData: freezed == iconData
          ? _self.iconData
          : iconData // ignore: cast_nullable_to_non_nullable
              as IconData?,
      reset: null == reset
          ? _self.reset
          : reset // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
