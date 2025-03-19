// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Payment _$PaymentFromJson(Map json) => _Payment(
      amount: (json['amount'] as num?)?.toInt() ?? 0,
      cashbackAmount: json['cashbackAmount'] ?? 0,
      type: $enumDecodeNullable(_$PaymentTypeEnumMap, json['type']) ??
          PaymentType.payment,
      cashbackOnly: json['cashbackOnly'] as bool? ?? false,
      rrn: json['rrn'] as String? ?? null,
    );

Map<String, dynamic> _$PaymentToJson(_Payment instance) => <String, dynamic>{
      'amount': instance.amount,
      'cashbackAmount': instance.cashbackAmount,
      'type': _$PaymentTypeEnumMap[instance.type],
      'cashbackOnly': instance.cashbackOnly,
      'rrn': instance.rrn,
    };

const _$PaymentTypeEnumMap = {
  PaymentType.payment: 'payment',
  PaymentType.cashback: 'cashback',
  PaymentType.voidTransaction: 'voidTransaction',
};
