import 'package:freezed_annotation/freezed_annotation.dart';

import 'kazang.dart';

part 'app_state.freezed.dart';

part 'app_state.g.dart';

@freezed
class AppState with _$AppState {
  const AppState._();

  factory AppState({
    @Default(true) bool pinVerified,
    @Default(false) bool isConfigured,
    @Default(null) DeviceInfo? deviceInfo,
    @Default(null) LoginRequest? accountInfo,
    @Default(null) TerminalProfile? profile,
    @Default(null) String? pin,
    @Default('en_ZA') String? language,
    @JsonKey(includeToJson: false, includeFromJson: false)
    @Default(null) IntentInfo? intentInfo,
  }) = _AppState;

  factory AppState.fromJson(Map<String, dynamic> json) =>
      _$AppStateFromJson(json);

  get isSetup =>
      accountInfo?.accountNumber != null || intentInfo?.username != null;

  bool get hasPin => pin != null;

  // If it's configured we don't want to override it
  AppState setIntentInfo({required IntentInfo intentInfo}) {
    if (!isSetup && intentInfo.username != null) {
      return copyWith(
        intentInfo: intentInfo,
        accountInfo: LoginRequest.fromJson({
          'accountNumber': intentInfo.username,
          'password': accountInfo?.password,
          'serialNumber': deviceInfo!.serial,
        }),
      );
    }
    return this;
  }
}

@JsonSerializable()
class DeviceInfo {
  final String serial;
  final bool? hasOnboardPrinter;
  final String? apiVersion;
  final dynamic build;
  final String? model;
  final String? manufacturer;
  final Version? version;

  DeviceInfo({
    required this.serial,
    required this.hasOnboardPrinter,
    required this.apiVersion,
    this.build,
    this.model,
    this.manufacturer,
    this.version,
  });

  factory DeviceInfo.fromJson(Map<String, dynamic> json) =>
      _$DeviceInfoFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceInfoToJson(this);

  @override
  String toString() {
    return 'DeviceInfo(serial: $serial, hasOnboardPrinter: $hasOnboardPrinter, apiVersion: $apiVersion, build: $build, model: $model, manufacturer: $manufacturer, version: $version)';
  }
}

@JsonSerializable()
class Version {
  String? name;
  int? code;

  Version({
    this.name,
    this.code,
  });

  factory Version.fromJson(Map<String, dynamic> json) =>
      _$VersionFromJson(json);

  Map<String, dynamic> toJson() => _$VersionToJson(this);
}

@JsonSerializable()
class TerminalProfile {
  TerminalProfile({
    required this.terminalConfig,
    required this.termappConfig,
    required this.merchantConfig,
    required this.userConfig,
  });

  @JsonKey(name: 'terminal_config')
  final TerminalConfig terminalConfig;
  @JsonKey(name: 'termapp_config')
  final TermappConfig termappConfig;
  @JsonKey(name: 'merchant_config')
  final MerchantConfig merchantConfig;
  @JsonKey(name: 'user_config')
  final UserConfig userConfig;

  factory TerminalProfile.fromJson(Map<String, dynamic> json) {
    return _$TerminalProfileFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TerminalProfileToJson(this);
}

@JsonSerializable()
class TerminalConfig {
  @JsonKey(name: 'is_key_exchange_required')
  final bool isKeyExchangeRequired;
  final bool contactless;
  @JsonKey(name: 'currency_symbol')
  final String currencySymbol;
  @JsonKey(name: 'custom_parameters')
  final CustomParameters customParameters;
  @JsonKey(name: 'is_key_exchange_allowed')
  final bool isKeyExchangeAllowed;
  @JsonKey(name: 'currency_code')
  final String currencyCode;
  @JsonKey(name: 'last_sequence_number')
  final String lastSequenceNumber;
  @JsonKey(name: 'terminal_serial_number')
  final String terminalSerialNumber;
  @JsonKey(name: 'terminal_active')
  final bool terminalActive;
  @JsonKey(name: 'terminal_id')
  final String terminalId;
  @JsonKey(name: 'slip_header')
  final String slipHeader;
  @JsonKey(name: 'manual_pan_entry')
  final bool manualPanEntry;
  @JsonKey(name: 'slip_trailer')
  final String slipTrailer;

  TerminalConfig({
    required this.isKeyExchangeRequired,
    required this.contactless,
    required this.currencySymbol,
    required this.customParameters,
    required this.isKeyExchangeAllowed,
    required this.currencyCode,
    required this.lastSequenceNumber,
    required this.terminalSerialNumber,
    required this.terminalActive,
    required this.terminalId,
    required this.slipHeader,
    required this.manualPanEntry,
    required this.slipTrailer,
  });

  factory TerminalConfig.fromJson(Map<String, dynamic> json) =>
      _$TerminalConfigFromJson(json);

  Map<String, dynamic> toJson() => _$TerminalConfigToJson(this);
}

@JsonSerializable()
class CustomParameters {
  @JsonKey(name: 'disabled_bins')
  final List<int> disabledBins;
  final Cashbacks cashbacks;
  final Refunds refunds;

  CustomParameters({
    required this.disabledBins,
    required this.cashbacks,
    required this.refunds,
  });

  factory CustomParameters.fromJson(Map<String, dynamic> json) =>
      _$CustomParametersFromJson(json);

  Map<String, dynamic> toJson() => _$CustomParametersToJson(this);
}

@JsonSerializable()
class Cashbacks {
  final bool allowed;
  final String limit;

  Cashbacks({
    required this.allowed,
    required this.limit,
  });

  factory Cashbacks.fromJson(Map<String, dynamic> json) =>
      _$CashbacksFromJson(json);

  Map<String, dynamic> toJson() => _$CashbacksToJson(this);
}

@JsonSerializable()
class Refunds {
  final bool allowed;
  final String limit;

  Refunds({
    required this.allowed,
    required this.limit,
  });

  factory Refunds.fromJson(Map<String, dynamic> json) =>
      _$RefundsFromJson(json);

  Map<String, dynamic> toJson() => _$RefundsToJson(this);
}

@JsonSerializable()
class TermappConfig {
  @JsonKey(name: 'secondary_ip')
  final String secondaryIp;
  @JsonKey(name: 'primary_ip')
  final String primaryIp;
  @JsonKey(name: 'data_ksn')
  final String dataKsn;
  @JsonKey(name: 'secondary_port')
  final String secondaryPort;
  @JsonKey(name: 'primary_port')
  final String primaryPort;
  final List<String> type;
  @JsonKey(name: 'pin_ksn')
  final String pinKsn;

  TermappConfig({
    required this.secondaryIp,
    required this.primaryIp,
    required this.dataKsn,
    required this.secondaryPort,
    required this.primaryPort,
    required this.type,
    required this.pinKsn,
  });

  factory TermappConfig.fromJson(Map<String, dynamic> json) =>
      _$TermappConfigFromJson(json);

  Map<String, dynamic> toJson() => _$TermappConfigToJson(this);
}

@JsonSerializable()
class MerchantConfig {
  @JsonKey(name: 'velocity_rules')
  final List<String> velocityRules;
  @JsonKey(name: 'transaction_types')
  final List<String> transactionTypes;
  @JsonKey(name: 'card_set')
  final List<String> cardSet;
  @JsonKey(name: 'trading_name')
  final String tradingName;
  @JsonKey(name: 'merchant_active')
  final bool merchantActive;
  @JsonKey(name: 'routing_switch')
  final String routingSwitch;
  @JsonKey(name: 'merchant_number')
  final String merchantNumber;

  MerchantConfig({
    required this.velocityRules,
    required this.transactionTypes,
    required this.cardSet,
    required this.tradingName,
    required this.merchantActive,
    required this.routingSwitch,
    required this.merchantNumber,
  });

  factory MerchantConfig.fromJson(Map<String, dynamic> json) =>
      _$MerchantConfigFromJson(json);

  Map<String, dynamic> toJson() => _$MerchantConfigToJson(this);
}

@JsonSerializable()
class UserConfig {
  @JsonKey(name: 'user_active')
  final bool userActive;
  @JsonKey(name: 'device_log_request')
  final bool deviceLogRequest;
  final String user;

  UserConfig({
    required this.userActive,
    required this.deviceLogRequest,
    required this.user,
  });

  factory UserConfig.fromJson(Map<String, dynamic> json) =>
      _$UserConfigFromJson(json);

  Map<String, dynamic> toJson() => _$UserConfigToJson(this);
}

@JsonSerializable()
class IntentInfo {
  final String? username;

  IntentInfo({
    this.username,
  });

  factory IntentInfo.fromJson(Map<String, dynamic> json) =>
      _$IntentInfoFromJson(json);

  Map<String, dynamic> toJson() => _$IntentInfoToJson(this);

  @override
  String toString() {
    return 'IntentInfo(username: $username)';
  }
}
