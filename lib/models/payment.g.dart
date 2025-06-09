// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Payment _$PaymentFromJson(Map json) => _Payment(
      amount: (json['amount'] as num?)?.toInt() ?? 0,
      cashbackAmount: (json['cashbackAmount'] as num?)?.toInt() ?? 0,
      type: $enumDecodeNullable(_$PaymentTypeEnumMap, json['type']) ??
          PaymentType.payment,
      cashbackOnly: json['cashbackOnly'] as bool? ?? false,
      rrn: json['rrn'] as String? ?? null,
      uniqueId: json['uniqueId'] as String? ?? null,
      launchMode:
          $enumDecodeNullable(_$LaunchModeEnumMap, json['launchMode']) ??
              LaunchMode.normal,
      userVoidable: json['userVoidable'] as bool? ?? true,
    );

Map<String, dynamic> _$PaymentToJson(_Payment instance) => <String, dynamic>{
      'amount': instance.amount,
      'cashbackAmount': instance.cashbackAmount,
      'type': _$PaymentTypeEnumMap[instance.type],
      'cashbackOnly': instance.cashbackOnly,
      'rrn': instance.rrn,
      'uniqueId': instance.uniqueId,
      'launchMode': _$LaunchModeEnumMap[instance.launchMode]!,
      'userVoidable': instance.userVoidable,
    };

const _$PaymentTypeEnumMap = {
  PaymentType.payment: 'payment',
  PaymentType.cashback: 'cashback',
  PaymentType.voidTransaction: 'voidTransaction',
  PaymentType.Purchase: 'Purchase',
  PaymentType.Purchase_with_cash_back: 'Purchase_with_cash_back',
  PaymentType.Cash_withdrawal: 'Cash_withdrawal',
  PaymentType.Refund: 'Refund',
  PaymentType.Cancel: 'Cancel',
};

const _$LaunchModeEnumMap = {
  LaunchMode.normal: 'normal',
  LaunchMode.intent: 'intent',
  LaunchMode.wifi: 'wifi',
};
