// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppState {
  bool get pinVerified;
  bool get isConfigured;
  DeviceInfo? get deviceInfo;
  LoginRequest? get accountInfo;
  TerminalProfile? get profile;
  String? get pin;
  String? get language;
  @JsonKey(includeToJson: false, includeFromJson: false)
  IntentInfo? get intentInfo;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AppStateCopyWith<AppState> get copyWith =>
      _$AppStateCopyWithImpl<AppState>(this as AppState, _$identity);

  /// Serializes this AppState to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppState &&
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

  @override
  String toString() {
    return 'AppState(pinVerified: $pinVerified, isConfigured: $isConfigured, deviceInfo: $deviceInfo, accountInfo: $accountInfo, profile: $profile, pin: $pin, language: $language, intentInfo: $intentInfo)';
  }
}

/// @nodoc
abstract mixin class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) _then) =
      _$AppStateCopyWithImpl;
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
class _$AppStateCopyWithImpl<$Res> implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._self, this._then);

  final AppState _self;
  final $Res Function(AppState) _then;

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
    return _then(_self.copyWith(
      pinVerified: null == pinVerified
          ? _self.pinVerified
          : pinVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      isConfigured: null == isConfigured
          ? _self.isConfigured
          : isConfigured // ignore: cast_nullable_to_non_nullable
              as bool,
      deviceInfo: freezed == deviceInfo
          ? _self.deviceInfo
          : deviceInfo // ignore: cast_nullable_to_non_nullable
              as DeviceInfo?,
      accountInfo: freezed == accountInfo
          ? _self.accountInfo
          : accountInfo // ignore: cast_nullable_to_non_nullable
              as LoginRequest?,
      profile: freezed == profile
          ? _self.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as TerminalProfile?,
      pin: freezed == pin
          ? _self.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _self.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      intentInfo: freezed == intentInfo
          ? _self.intentInfo
          : intentInfo // ignore: cast_nullable_to_non_nullable
              as IntentInfo?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _AppState extends AppState {
  _AppState(
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
  factory _AppState.fromJson(Map<String, dynamic> json) =>
      _$AppStateFromJson(json);

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

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AppStateCopyWith<_AppState> get copyWith =>
      __$AppStateCopyWithImpl<_AppState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AppStateToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AppState &&
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

  @override
  String toString() {
    return 'AppState(pinVerified: $pinVerified, isConfigured: $isConfigured, deviceInfo: $deviceInfo, accountInfo: $accountInfo, profile: $profile, pin: $pin, language: $language, intentInfo: $intentInfo)';
  }
}

/// @nodoc
abstract mixin class _$AppStateCopyWith<$Res>
    implements $AppStateCopyWith<$Res> {
  factory _$AppStateCopyWith(_AppState value, $Res Function(_AppState) _then) =
      __$AppStateCopyWithImpl;
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
class __$AppStateCopyWithImpl<$Res> implements _$AppStateCopyWith<$Res> {
  __$AppStateCopyWithImpl(this._self, this._then);

  final _AppState _self;
  final $Res Function(_AppState) _then;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_AppState(
      pinVerified: null == pinVerified
          ? _self.pinVerified
          : pinVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      isConfigured: null == isConfigured
          ? _self.isConfigured
          : isConfigured // ignore: cast_nullable_to_non_nullable
              as bool,
      deviceInfo: freezed == deviceInfo
          ? _self.deviceInfo
          : deviceInfo // ignore: cast_nullable_to_non_nullable
              as DeviceInfo?,
      accountInfo: freezed == accountInfo
          ? _self.accountInfo
          : accountInfo // ignore: cast_nullable_to_non_nullable
              as LoginRequest?,
      profile: freezed == profile
          ? _self.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as TerminalProfile?,
      pin: freezed == pin
          ? _self.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _self.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      intentInfo: freezed == intentInfo
          ? _self.intentInfo
          : intentInfo // ignore: cast_nullable_to_non_nullable
              as IntentInfo?,
    ));
  }
}

// dart format on
