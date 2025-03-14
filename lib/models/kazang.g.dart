// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kazang.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionSummaryResponse _$TransactionSummaryResponseFromJson(Map json) =>
    TransactionSummaryResponse(
      responseCode: (json['response_code'] as num).toInt(),
      responseMessage: json['response_message'] as String,
      transactionSummary: (json['transaction_summary'] as List<dynamic>)
          .map((e) => Settlement.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$TransactionSummaryResponseToJson(
        TransactionSummaryResponse instance) =>
    <String, dynamic>{
      'response_code': instance.responseCode,
      'response_message': instance.responseMessage,
      'transaction_summary':
          instance.transactionSummary.map((e) => e.toJson()).toList(),
    };

Settlement _$SettlementFromJson(Map json) => Settlement(
      date: DateTime.parse(json['date'] as String),
      merchantNumber: json['merchant_number'] as String,
      totalPurchaseAmount: toInt(json['total_purchase_amount']),
      totalCashbackAmount: toInt(json['total_cashback_amount']),
      totalAmount: toInt(json['total_amount']),
      purchaseServiceFee: toInt(json['purchase_service_fee']),
      cashbackServiceFee: toInt(json['cashback_service_fee']),
      settlementAmount: toInt(json['settlement_amount']),
      noOfTransactions: json['no_of_transactions'] as String,
      noOfSettlements: json['no_of_settlements'] as String,
      lastSettlementDatetime: json['last_settlement_datetime'] as String,
    );

Map<String, dynamic> _$SettlementToJson(Settlement instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'merchant_number': instance.merchantNumber,
      'total_purchase_amount': instance.totalPurchaseAmount,
      'total_cashback_amount': instance.totalCashbackAmount,
      'total_amount': instance.totalAmount,
      'purchase_service_fee': instance.purchaseServiceFee,
      'cashback_service_fee': instance.cashbackServiceFee,
      'settlement_amount': instance.settlementAmount,
      'no_of_transactions': instance.noOfTransactions,
      'no_of_settlements': instance.noOfSettlements,
      'last_settlement_datetime': instance.lastSettlementDatetime,
    };

LoginRequest _$LoginRequestFromJson(Map json) => LoginRequest(
      accountNumber: json['accountNumber'] as String?,
      password: json['password'] as String?,
      serialNumber: json['serialNumber'] as String?,
    );

Map<String, dynamic> _$LoginRequestToJson(LoginRequest instance) =>
    <String, dynamic>{
      'accountNumber': instance.accountNumber,
      'password': instance.password,
      'serialNumber': instance.serialNumber,
    };
