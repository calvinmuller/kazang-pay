// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Transaction _$TransactionFromJson(Map json) => _Transaction(
      account: json['Account'] as String,
      amount: intSafeToString(json['Amount']),
      amountFees: json['AmountFees'] as String?,
      applicationCryptogram: json['ApplicationCryptogram'] as String?,
      applicationIdentifier: json['ApplicationIdentifier'] as String?,
      applicationInterchangeProfile:
          json['ApplicationInterchangeProfile'] as String?,
      applicationLabel: json['ApplicationLabel'] as String?,
      applicationTransactionCounter:
          json['ApplicationTransactionCounter'] as String?,
      authorised: boolSafe(json['Authorised']),
      batchNo: json['BatchNo'] as String?,
      budgetPeriod: json['BudgetPeriod'] as String?,
      cardDataInputMode: $enumDecodeNullable(
          _$CardDataInputModeEnumMap, json['CardDataInputMode'],
          unknownValue: CardDataInputMode.ContactlessIntegratedCircuitCard),
      cardSequenceNumber: json['CardSequenceNumber'] as String?,
      cashBackAmount: intSafeToString(json['CashBackAmount']),
      cryptogramInformationData: json['CryptogramInformationData'] as String?,
      currencyCode: json['CurrencyCode'] as String?,
      description: json['Description'] as String?,
      deviceType: json['DeviceType'] as String?,
      id: intSafeToString(json['Id']),
      isUserVoidable: boolSafe(json['IsUserVoidable']),
      issuerApplicationData: json['IssuerApplicationData'] as String?,
      maskedPan: json['MaskedPan'] as String?,
      merchantId: json['MerchantId'] as String?,
      posCodeData: json['PosCodeData'] as String?,
      previousTransaction: intSafeToString(json['PreviousTransaction']),
      proccessedOnline: boolSafe(json['ProccessedOnline']),
      processingCode: json['ProcessingCode'] as String?,
      responseCode: json['ResponseCode'] as String?,
      responseMessage: json['ResponseMessage'] as String?,
      additionalData: json['AdditionalData'] as String?,
      retrievalReferenceNumber: json['RetrievalReferenceNumber'] as String,
      retryAttempts: intSafeToString(json['RetryAttempts']),
      sequenceNumber: intSafeToString(json['SequenceNumber']),
      settled: boolSafe(json['Settled']),
      sredData: json['SredData'] as String?,
      sredKsn: json['SredKsn'] as String?,
      terminalCapabilities: json['TerminalCapabilities'] as String?,
      terminalCountryCode: json['TerminalCountryCode'] as String?,
      terminalId: json['TerminalId'] as String,
      terminalVerificationResult: json['TerminalVerificationResult'] as String?,
      tipAmount: intSafeToString(json['TipAmount']),
      transactionDateTime:
          DateTime.parse(json['TransactionDateTime'] as String),
      transactionType: $enumDecodeNullable(
          _$TransactionTypeEnumMap, json['TransactionType'],
          unknownValue: TransactionType.P),
      unpredictableNumber: json['UnpredictableNumber'] as String?,
    );

Map<String, dynamic> _$TransactionToJson(_Transaction instance) =>
    <String, dynamic>{
      'Account': instance.account,
      'Amount': instance.amount,
      'AmountFees': instance.amountFees,
      'ApplicationCryptogram': instance.applicationCryptogram,
      'ApplicationIdentifier': instance.applicationIdentifier,
      'ApplicationInterchangeProfile': instance.applicationInterchangeProfile,
      'ApplicationLabel': instance.applicationLabel,
      'ApplicationTransactionCounter': instance.applicationTransactionCounter,
      'Authorised': instance.authorised,
      'BatchNo': instance.batchNo,
      'BudgetPeriod': instance.budgetPeriod,
      'CardDataInputMode':
          _$CardDataInputModeEnumMap[instance.cardDataInputMode],
      'CardSequenceNumber': instance.cardSequenceNumber,
      'CashBackAmount': instance.cashBackAmount,
      'CryptogramInformationData': instance.cryptogramInformationData,
      'CurrencyCode': instance.currencyCode,
      'Description': instance.description,
      'DeviceType': instance.deviceType,
      'Id': instance.id,
      'IsUserVoidable': instance.isUserVoidable,
      'IssuerApplicationData': instance.issuerApplicationData,
      'MaskedPan': instance.maskedPan,
      'MerchantId': instance.merchantId,
      'PosCodeData': instance.posCodeData,
      'PreviousTransaction': instance.previousTransaction,
      'ProccessedOnline': instance.proccessedOnline,
      'ProcessingCode': instance.processingCode,
      'ResponseCode': instance.responseCode,
      'ResponseMessage': instance.responseMessage,
      'AdditionalData': instance.additionalData,
      'RetrievalReferenceNumber': instance.retrievalReferenceNumber,
      'RetryAttempts': instance.retryAttempts,
      'SequenceNumber': instance.sequenceNumber,
      'Settled': instance.settled,
      'SredData': instance.sredData,
      'SredKsn': instance.sredKsn,
      'TerminalCapabilities': instance.terminalCapabilities,
      'TerminalCountryCode': instance.terminalCountryCode,
      'TerminalId': instance.terminalId,
      'TerminalVerificationResult': instance.terminalVerificationResult,
      'TipAmount': instance.tipAmount,
      'TransactionDateTime': instance.transactionDateTime.toIso8601String(),
      'TransactionType': _$TransactionTypeEnumMap[instance.transactionType],
      'UnpredictableNumber': instance.unpredictableNumber,
    };

const _$CardDataInputModeEnumMap = {
  CardDataInputMode.CONTACTLESS_INTEGRATED_CIRCUIT_CARD:
      'CONTACTLESS_INTEGRATED_CIRCUIT_CARD',
  CardDataInputMode.INTEGRATED_CIRCUIT_CARD: 'INTEGRATED_CIRCUIT_CARD',
  CardDataInputMode.IntegratedCircuitCard: 'IntegratedCircuitCard',
  CardDataInputMode.ContactlessIntegratedCircuitCard:
      'ContactlessIntegratedCircuitCard',
};

const _$TransactionTypeEnumMap = {
  TransactionType.payment: 'payment',
  TransactionType.cashback: 'cashback',
  TransactionType.refund: 'refund',
  TransactionType.paymentCashback: 'paymentCashback',
  TransactionType.P: 'P',
  TransactionType.V: 'V',
  TransactionType.VOID_TRANSACTION: 'VOID_TRANSACTION',
};
