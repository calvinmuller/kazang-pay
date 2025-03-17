// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceInfo _$DeviceInfoFromJson(Map json) => DeviceInfo(
      serial: json['serial'] as String,
      hasOnboardPrinter: json['hasOnboardPrinter'] as bool?,
      apiVersion: json['apiVersion'] as String?,
      build: json['build'],
      model: json['model'] as String?,
      manufacturer: json['manufacturer'] as String?,
      version: json['version'] == null
          ? null
          : Version.fromJson(Map<String, dynamic>.from(json['version'] as Map)),
    );

Map<String, dynamic> _$DeviceInfoToJson(DeviceInfo instance) =>
    <String, dynamic>{
      'serial': instance.serial,
      'hasOnboardPrinter': instance.hasOnboardPrinter,
      'apiVersion': instance.apiVersion,
      'build': instance.build,
      'model': instance.model,
      'manufacturer': instance.manufacturer,
      'version': instance.version?.toJson(),
    };

Version _$VersionFromJson(Map json) => Version(
      name: json['name'] as String?,
      code: (json['code'] as num?)?.toInt(),
    );

Map<String, dynamic> _$VersionToJson(Version instance) => <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
    };

TerminalProfile _$TerminalProfileFromJson(Map json) => TerminalProfile(
      terminalConfig: TerminalConfig.fromJson(
          Map<String, dynamic>.from(json['terminal_config'] as Map)),
      termappConfig: TermappConfig.fromJson(
          Map<String, dynamic>.from(json['termapp_config'] as Map)),
      merchantConfig: MerchantConfig.fromJson(
          Map<String, dynamic>.from(json['merchant_config'] as Map)),
      userConfig: UserConfig.fromJson(
          Map<String, dynamic>.from(json['user_config'] as Map)),
    );

Map<String, dynamic> _$TerminalProfileToJson(TerminalProfile instance) =>
    <String, dynamic>{
      'terminal_config': instance.terminalConfig.toJson(),
      'termapp_config': instance.termappConfig.toJson(),
      'merchant_config': instance.merchantConfig.toJson(),
      'user_config': instance.userConfig.toJson(),
    };

TerminalConfig _$TerminalConfigFromJson(Map json) => TerminalConfig(
      isKeyExchangeRequired: json['is_key_exchange_required'] as bool,
      contactless: json['contactless'] as bool,
      currencySymbol: json['currency_symbol'] as String,
      customParameters: CustomParameters.fromJson(
          Map<String, dynamic>.from(json['custom_parameters'] as Map)),
      isKeyExchangeAllowed: json['is_key_exchange_allowed'] as bool,
      currencyCode: json['currency_code'] as String,
      lastSequenceNumber: json['last_sequence_number'] as String,
      terminalSerialNumber: json['terminal_serial_number'] as String,
      terminalActive: json['terminal_active'] as bool,
      terminalId: json['terminal_id'] as String,
      slipHeader: json['slip_header'] as String,
      manualPanEntry: json['manual_pan_entry'] as bool,
      slipTrailer: json['slip_trailer'] as String,
    );

Map<String, dynamic> _$TerminalConfigToJson(TerminalConfig instance) =>
    <String, dynamic>{
      'is_key_exchange_required': instance.isKeyExchangeRequired,
      'contactless': instance.contactless,
      'currency_symbol': instance.currencySymbol,
      'custom_parameters': instance.customParameters.toJson(),
      'is_key_exchange_allowed': instance.isKeyExchangeAllowed,
      'currency_code': instance.currencyCode,
      'last_sequence_number': instance.lastSequenceNumber,
      'terminal_serial_number': instance.terminalSerialNumber,
      'terminal_active': instance.terminalActive,
      'terminal_id': instance.terminalId,
      'slip_header': instance.slipHeader,
      'manual_pan_entry': instance.manualPanEntry,
      'slip_trailer': instance.slipTrailer,
    };

CustomParameters _$CustomParametersFromJson(Map json) => CustomParameters(
      disabledBins: (json['disabled_bins'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      cashbacks: Cashbacks.fromJson(
          Map<String, dynamic>.from(json['cashbacks'] as Map)),
      refunds:
          Refunds.fromJson(Map<String, dynamic>.from(json['refunds'] as Map)),
    );

Map<String, dynamic> _$CustomParametersToJson(CustomParameters instance) =>
    <String, dynamic>{
      'disabled_bins': instance.disabledBins,
      'cashbacks': instance.cashbacks.toJson(),
      'refunds': instance.refunds.toJson(),
    };

Cashbacks _$CashbacksFromJson(Map json) => Cashbacks(
      allowed: json['allowed'] as bool,
      limit: json['limit'] as String,
    );

Map<String, dynamic> _$CashbacksToJson(Cashbacks instance) => <String, dynamic>{
      'allowed': instance.allowed,
      'limit': instance.limit,
    };

Refunds _$RefundsFromJson(Map json) => Refunds(
      allowed: json['allowed'] as bool,
      limit: json['limit'] as String,
    );

Map<String, dynamic> _$RefundsToJson(Refunds instance) => <String, dynamic>{
      'allowed': instance.allowed,
      'limit': instance.limit,
    };

TermappConfig _$TermappConfigFromJson(Map json) => TermappConfig(
      secondaryIp: json['secondary_ip'] as String,
      primaryIp: json['primary_ip'] as String,
      dataKsn: json['data_ksn'] as String,
      secondaryPort: json['secondary_port'] as String,
      primaryPort: json['primary_port'] as String,
      type: (json['type'] as List<dynamic>).map((e) => e as String).toList(),
      pinKsn: json['pin_ksn'] as String,
    );

Map<String, dynamic> _$TermappConfigToJson(TermappConfig instance) =>
    <String, dynamic>{
      'secondary_ip': instance.secondaryIp,
      'primary_ip': instance.primaryIp,
      'data_ksn': instance.dataKsn,
      'secondary_port': instance.secondaryPort,
      'primary_port': instance.primaryPort,
      'type': instance.type,
      'pin_ksn': instance.pinKsn,
    };

MerchantConfig _$MerchantConfigFromJson(Map json) => MerchantConfig(
      velocityRules: (json['velocity_rules'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      transactionTypes: (json['transaction_types'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      cardSet:
          (json['card_set'] as List<dynamic>).map((e) => e as String).toList(),
      tradingName: json['trading_name'] as String,
      merchantActive: json['merchant_active'] as bool,
      routingSwitch: json['routing_switch'] as String,
      merchantNumber: json['merchant_number'] as String,
    );

Map<String, dynamic> _$MerchantConfigToJson(MerchantConfig instance) =>
    <String, dynamic>{
      'velocity_rules': instance.velocityRules,
      'transaction_types': instance.transactionTypes,
      'card_set': instance.cardSet,
      'trading_name': instance.tradingName,
      'merchant_active': instance.merchantActive,
      'routing_switch': instance.routingSwitch,
      'merchant_number': instance.merchantNumber,
    };

UserConfig _$UserConfigFromJson(Map json) => UserConfig(
      userActive: json['user_active'] as bool,
      deviceLogRequest: json['device_log_request'] as bool,
      user: json['user'] as String,
    );

Map<String, dynamic> _$UserConfigToJson(UserConfig instance) =>
    <String, dynamic>{
      'user_active': instance.userActive,
      'device_log_request': instance.deviceLogRequest,
      'user': instance.user,
    };

_$AppStateImpl _$$AppStateImplFromJson(Map json) => _$AppStateImpl(
      pinVerified: json['pinVerified'] as bool? ?? true,
      isConfigured: json['isConfigured'] as bool? ?? false,
      deviceInfo: json['deviceInfo'] == null
          ? null
          : DeviceInfo.fromJson(
              Map<String, dynamic>.from(json['deviceInfo'] as Map)),
      accountInfo: json['accountInfo'] == null
          ? null
          : LoginRequest.fromJson(
              Map<String, dynamic>.from(json['accountInfo'] as Map)),
      profile: json['profile'] == null
          ? null
          : TerminalProfile.fromJson(
              Map<String, dynamic>.from(json['profile'] as Map)),
      pin: json['pin'] as String?,
    );

Map<String, dynamic> _$$AppStateImplToJson(_$AppStateImpl instance) =>
    <String, dynamic>{
      'pinVerified': instance.pinVerified,
      'isConfigured': instance.isConfigured,
      'deviceInfo': instance.deviceInfo?.toJson(),
      'accountInfo': instance.accountInfo?.toJson(),
      'profile': instance.profile?.toJson(),
      'pin': instance.pin,
    };
