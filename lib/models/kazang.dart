import 'package:freezed_annotation/freezed_annotation.dart';

part 'kazang.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class TransactionSummaryResponse {
  TransactionSummaryResponse({
    required this.responseCode,
    required this.responseMessage,
    required this.transactionSummary,
  });

  final int responseCode;
  final String responseMessage;
  final List<Settlement> transactionSummary;

  factory TransactionSummaryResponse.fromJson(Map<String, dynamic> json) => _$TransactionSummaryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionSummaryResponseToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Settlement {
  Settlement({
    required this.date,
    required this.merchantNumber,
    required this.totalPurchaseAmount,
    required this.totalCashbackAmount,
    required this.totalAmount,
    required this.purchaseServiceFee,
    required this.cashbackServiceFee,
    required this.settlementAmount,
    required this.noOfTransactions,
    required this.noOfSettlements,
    required this.lastSettlementDatetime,
  });

  final DateTime date;
  final String merchantNumber;
  @JsonKey(fromJson: toInt)
  final int totalPurchaseAmount;
  @JsonKey(fromJson: toInt)
  final int totalCashbackAmount;
  @JsonKey(fromJson: toInt)
  final int totalAmount;
  @JsonKey(fromJson: toInt)
  final int purchaseServiceFee;
  @JsonKey(fromJson: toInt)
  final int cashbackServiceFee;
  @JsonKey(fromJson: toInt)
  final int settlementAmount;
  final String noOfTransactions;
  final String noOfSettlements;
  final String lastSettlementDatetime;

  factory Settlement.fromJson(Map<String, dynamic> json) => _$SettlementFromJson(json);

  Map<String, dynamic> toJson() => _$SettlementToJson(this);
}

toInt(value) {
  return (double.parse(value) * 100).toInt();
}

class TransactionHistoryDetails {
  TransactionHistoryDetails({
    required this.responseCode,
    required this.responseMessage,
    required this.transactionDetails,
  });

  final int responseCode;
  final String responseMessage;
  final List<TransactionDetail> transactionDetails;

  factory TransactionHistoryDetails.fromJson(Map<String, dynamic> json) =>
      TransactionHistoryDetails(
        responseCode: json["response_code"],
        responseMessage: json["response_message"],
        transactionDetails: List<TransactionDetail>.from(
          json["transaction_details"].map((x) => TransactionDetail.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
        "response_code": responseCode,
        "response_message": responseMessage,
        "transaction_details": List<TransactionDetail>.from(
          transactionDetails.map((x) => x.toJson()),
        ),
      };

  @override
  String toString() {
    return 'TransactionHistoryDetails(responseCode: $responseCode, responseMessage: $responseMessage, transactionDetails: $transactionDetails)';
  }
}

class TransactionDetail {
  TransactionDetail({
    required this.date,
    required this.merchantNumber,
    required this.transactionAmount,
    required this.settlementStatus,
    required this.cardProductType,
    required this.serviceFee,
    required this.settlementAmount,
    required this.settlementDatetime,
  });

  final DateTime date;
  final String merchantNumber;
  final String transactionAmount;
  final String settlementStatus;
  final String cardProductType;
  final String serviceFee;
  final String settlementAmount;
  final DateTime? settlementDatetime;

  factory TransactionDetail.fromJson(Map<String, dynamic> json) =>
      TransactionDetail(
        date: DateTime.parse(json["date"]),
        merchantNumber: json["merchant_number"],
        transactionAmount: json["transaction_amount"],
        settlementStatus: json["settlement_status"],
        cardProductType: json["card_product_type"],
        serviceFee: json["service_fee"],
        settlementAmount: json["settlement_amount"],
        settlementDatetime: json["settlement_datetime"] != "" ? DateTime.parse(json["settlement_datetime"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "merchant_number": merchantNumber,
        "transaction_amount": transactionAmount,
        "settlement_status": settlementStatus,
        "card_product_type": cardProductType,
        "service_fee": serviceFee,
        "settlement_amount": settlementAmount,
        "settlement_datetime": settlementDatetime,
      };

  @override
  String toString() {
    return 'TransactionDetail(date: $date, merchantNumber: $merchantNumber, transactionAmount: $transactionAmount, settlementStatus: $settlementStatus, cardProductType: $cardProductType, serviceFee: $serviceFee, settlementAmount: $settlementAmount, settlementDatetime: $settlementDatetime)';
  }
}

@JsonSerializable(explicitToJson: true)
class LoginRequest {
  LoginRequest({
    this.accountNumber,
    this.password,
    this.serialNumber,
  });

  String? accountNumber;
  String? password;
  String? serialNumber;

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);

}

class LoginResponse {
  LoginResponse({
    required this.accountNumber,
    required this.companyName,
    required this.responseCode,
    this.responseMessage
  });

  final String accountNumber;
  final String companyName;
  final int responseCode;
  final String? responseMessage;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        accountNumber: json["account_number"],
        companyName: json["company_name"],
        responseCode: json["response_code"],
        responseMessage: json["response_message"] ?? "",
      );
}
