// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionResultImpl _$$TransactionResultImplFromJson(Map json) =>
    _$TransactionResultImpl(
      applicationIdentifier: arrayToString(json['applicationIdentifier']),
      authorizationCode: (json['authorizationCode'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      canPrintReceipt: json['canPrintReceipt'] as bool,
      cardDataInputMode: $enumDecodeNullable(
          _$CardDataInputModeEnumMap, json['cardDataInputMode']),
      cardSequenceNumber: json['cardSequenceNumber'] as String?,
      cardVerificationMethod: (json['cardVerificationMethod'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      declinedReason: json['declinedReason'] as String,
      isCancelled: json['isCancelled'] as bool,
      isSuccessful: json['isSuccessful'] as bool,
      isSupervisor: json['isSupervisor'] as bool,
      merchantId: json['merchantId'] as String?,
      merchantName: json['merchantName'] as String?,
      message: json['message'] as String,
      ourReferenceNumber: json['ourReferenceNumber'] as String?,
      pan: json['pan'] as String?,
      responseCode: json['responseCode'] as String,
      responseMessage: json['responseMessage'] as String?,
      terminalId: json['terminalId'] as String?,
      transactionAmount: (json['transactionAmount'] as num).toInt(),
      transactionClientAction: $enumDecodeNullable(
          _$TransactionClientActionEnumMap, json['transactionClientAction']),
      transactionDate: json['transactionDate'] as String?,
    );

Map<String, dynamic> _$$TransactionResultImplToJson(
        _$TransactionResultImpl instance) =>
    <String, dynamic>{
      'applicationIdentifier': instance.applicationIdentifier,
      'authorizationCode': instance.authorizationCode,
      'canPrintReceipt': instance.canPrintReceipt,
      'cardDataInputMode':
          _$CardDataInputModeEnumMap[instance.cardDataInputMode],
      'cardSequenceNumber': instance.cardSequenceNumber,
      'cardVerificationMethod': instance.cardVerificationMethod,
      'declinedReason': instance.declinedReason,
      'isCancelled': instance.isCancelled,
      'isSuccessful': instance.isSuccessful,
      'isSupervisor': instance.isSupervisor,
      'merchantId': instance.merchantId,
      'merchantName': instance.merchantName,
      'message': instance.message,
      'ourReferenceNumber': instance.ourReferenceNumber,
      'pan': instance.pan,
      'responseCode': instance.responseCode,
      'responseMessage': instance.responseMessage,
      'terminalId': instance.terminalId,
      'transactionAmount': instance.transactionAmount,
      'transactionClientAction':
          _$TransactionClientActionEnumMap[instance.transactionClientAction],
      'transactionDate': instance.transactionDate,
    };

const _$CardDataInputModeEnumMap = {
  CardDataInputMode.CONTACTLESS_INTEGRATED_CIRCUIT_CARD:
      'CONTACTLESS_INTEGRATED_CIRCUIT_CARD',
  CardDataInputMode.INTEGRATED_CIRCUIT_CARD: 'INTEGRATED_CIRCUIT_CARD',
  CardDataInputMode.IntegratedCircuitCard: 'IntegratedCircuitCard',
  CardDataInputMode.ContactlessIntegratedCircuitCard:
      'ContactlessIntegratedCircuitCard',
};

const _$TransactionClientActionEnumMap = {
  TransactionClientAction.TRANSACTION_DECLINED: 'TRANSACTION_DECLINED',
  TransactionClientAction.TRANSACTION_SUCCESSFULL: 'TRANSACTION_SUCCESSFULL',
};
