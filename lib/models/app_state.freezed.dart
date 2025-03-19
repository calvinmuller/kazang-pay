// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppState _$AppStateFromJson(Map<String, dynamic> json) {
  return _AppState.fromJson(json);
}

/// @nodoc
mixin _$AppState {
  bool get pinVerified => throw _privateConstructorUsedError;
  bool get isConfigured => throw _privateConstructorUsedError;
  DeviceInfo? get deviceInfo => throw _privateConstructorUsedError;
  LoginRequest? get accountInfo => throw _privateConstructorUsedError;
  TerminalProfile? get profile => throw _privateConstructorUsedError;
  String? get pin => throw _privateConstructorUsedError;
  String? get language => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeFromJson: false)
  IntentInfo? get intentInfo => throw _privateConstructorUsedError;

  /// Serializes this AppState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppStateCopyWith<AppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res, AppState>;
  @useResult
  $Res call(
      {bool pinVerified,
      bool isConfigured,
      DeviceInfo? deviceInfo,
      LoginRequest? accountInfo,
      TerminalProfile? profile,
      String? pin,
      String? language,
      @JsonKey(includeToJson: false, includeFromJson: false)
      IntentInfo? intentInfo});
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res, $Val extends AppState>
    implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pinVerified = null,
    Object? isConfigured = null,
    Object? deviceInfo = freezed,
    Object? accountInfo = freezed,
    Object? profile = freezed,
    Object? pin = freezed,
    Object? language = freezed,
    Object? intentInfo = freezed,
  }) {
    return _then(_value.copyWith(
      pinVerified: null == pinVerified
          ? _value.pinVerified
          : pinVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      isConfigured: null == isConfigured
          ? _value.isConfigured
          : isConfigured // ignore: cast_nullable_to_non_nullable
              as bool,
      deviceInfo: freezed == deviceInfo
          ? _value.deviceInfo
          : deviceInfo // ignore: cast_nullable_to_non_nullable
              as DeviceInfo?,
      accountInfo: freezed == accountInfo
          ? _value.accountInfo
          : accountInfo // ignore: cast_nullable_to_non_nullable
              as LoginRequest?,
      profile: freezed == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as TerminalProfile?,
      pin: freezed == pin
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      intentInfo: freezed == intentInfo
          ? _value.intentInfo
          : intentInfo // ignore: cast_nullable_to_non_nullable
              as IntentInfo?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppStateImplCopyWith<$Res>
    implements $AppStateCopyWith<$Res> {
  factory _$$AppStateImplCopyWith(
          _$AppStateImpl value, $Res Function(_$AppStateImpl) then) =
      __$$AppStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool pinVerified,
      bool isConfigured,
      DeviceInfo? deviceInfo,
      LoginRequest? accountInfo,
      TerminalProfile? profile,
      String? pin,
      String? language,
      @JsonKey(includeToJson: false, includeFromJson: false)
      IntentInfo? intentInfo});
}

/// @nodoc
class __$$AppStateImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$AppStateImpl>
    implements _$$AppStateImplCopyWith<$Res> {
  __$$AppStateImplCopyWithImpl(
      _$AppStateImpl _value, $Res Function(_$AppStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pinVerified = null,
    Object? isConfigured = null,
    Object? deviceInfo = freezed,
    Object? accountInfo = freezed,
    Object? profile = freezed,
    Object? pin = freezed,
    Object? language = freezed,
    Object? intentInfo = freezed,
  }) {
    return _then(_$AppStateImpl(
      pinVerified: null == pinVerified
          ? _value.pinVerified
          : pinVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      isConfigured: null == isConfigured
          ? _value.isConfigured
          : isConfigured // ignore: cast_nullable_to_non_nullable
              as bool,
      deviceInfo: freezed == deviceInfo
          ? _value.deviceInfo
          : deviceInfo // ignore: cast_nullable_to_non_nullable
              as DeviceInfo?,
      accountInfo: freezed == accountInfo
          ? _value.accountInfo
          : accountInfo // ignore: cast_nullable_to_non_nullable
              as LoginRequest?,
      profile: freezed == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as TerminalProfile?,
      pin: freezed == pin
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      intentInfo: freezed == intentInfo
          ? _value.intentInfo
          : intentInfo // ignore: cast_nullable_to_non_nullable
              as IntentInfo?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppStateImpl extends _AppState {
  _$AppStateImpl(
      {this.pinVerified = true,
      this.isConfigured = false,
      this.deviceInfo = null,
      this.accountInfo = null,
      this.profile = null,
      this.pin = null,
      this.language = 'en_ZA',
      @JsonKey(includeToJson: false, includeFromJson: false)
      this.intentInfo = null})
      : super._();

  factory _$AppStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppStateImplFromJson(json);

  @override
  @JsonKey()
  final bool pinVerified;
  @override
  @JsonKey()
  final bool isConfigured;
  @override
  @JsonKey()
  final DeviceInfo? deviceInfo;
  @override
  @JsonKey()
  final LoginRequest? accountInfo;
  @override
  @JsonKey()
  final TerminalProfile? profile;
  @override
  @JsonKey()
  final String? pin;
  @override
  @JsonKey()
  final String? language;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  final IntentInfo? intentInfo;

  @override
  String toString() {
    return 'AppState(pinVerified: $pinVerified, isConfigured: $isConfigured, deviceInfo: $deviceInfo, accountInfo: $accountInfo, profile: $profile, pin: $pin, language: $language, intentInfo: $intentInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppStateImpl &&
            (identical(other.pinVerified, pinVerified) ||
                other.pinVerified == pinVerified) &&
            (identical(other.isConfigured, isConfigured) ||
                other.isConfigured == isConfigured) &&
            (identical(other.deviceInfo, deviceInfo) ||
                other.deviceInfo == deviceInfo) &&
            (identical(other.accountInfo, accountInfo) ||
                other.accountInfo == accountInfo) &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.pin, pin) || other.pin == pin) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.intentInfo, intentInfo) ||
                other.intentInfo == intentInfo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, pinVerified, isConfigured,
      deviceInfo, accountInfo, profile, pin, language, intentInfo);

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppStateImplCopyWith<_$AppStateImpl> get copyWith =>
      __$$AppStateImplCopyWithImpl<_$AppStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppStateImplToJson(
      this,
    );
  }
}

abstract class _AppState extends AppState {
  factory _AppState(
      {final bool pinVerified,
      final bool isConfigured,
      final DeviceInfo? deviceInfo,
      final LoginRequest? accountInfo,
      final TerminalProfile? profile,
      final String? pin,
      final String? language,
      @JsonKey(includeToJson: false, includeFromJson: false)
      final IntentInfo? intentInfo}) = _$AppStateImpl;
  _AppState._() : super._();

  factory _AppState.fromJson(Map<String, dynamic> json) =
      _$AppStateImpl.fromJson;

  @override
  bool get pinVerified;
  @override
  bool get isConfigured;
  @override
  DeviceInfo? get deviceInfo;
  @override
  LoginRequest? get accountInfo;
  @override
  TerminalProfile? get profile;
  @override
  String? get pin;
  @override
  String? get language;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  IntentInfo? get intentInfo;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppStateImplCopyWith<_$AppStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
