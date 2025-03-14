import 'package:freezed_annotation/freezed_annotation.dart';

import 'transaction.dart';

part 'transaction_result.freezed.dart';
part 'transaction_result.g.dart';

arrayToString(value) {
  return value?.join("") ?? "N/A";
}
@freezed
class TransactionResult with _$TransactionResult {

  const TransactionResult._();

  const factory TransactionResult({
    @JsonKey(fromJson: arrayToString)
    String? applicationIdentifier,
    List<int>? authorizationCode,
    required bool canPrintReceipt,
    CardDataInputMode? cardDataInputMode,
    String? cardSequenceNumber,
    List<int>? cardVerificationMethod,
    required String declinedReason,
    required bool isCancelled,
    required bool isSuccessful,
    required bool isSupervisor,
    String? merchantId,
    String? merchantName,
    required String message,
    String? ourReferenceNumber,
    String? pan,
    required String responseCode,
    required String responseMessage,
    String? terminalId,
    required int transactionAmount,
    required TransactionClientAction transactionClientAction,
    String? transactionDate,
  }) = _TransactionResult;

  factory TransactionResult.fromJson(Map<String, dynamic> json) =>
      _$TransactionResultFromJson(json);

  get isTap => [CardDataInputMode.CONTACTLESS_INTEGRATED_CIRCUIT_CARD, CardDataInputMode.ContactlessIntegratedCircuitCard].contains(cardDataInputMode);

  toTransaction() {
    return Transaction(
      additionalData: "",
      account: "",
      responseCode: responseCode,
      responseMessage: responseMessage,
      retrievalReferenceNumber: ourReferenceNumber ?? "",
      retryAttempts: 0,
      sequenceNumber: 0,
      settled: false,
      sredData: "",
      sredKsn: "",
      terminalCapabilities: "",
      terminalCountryCode: "",
      terminalId: terminalId!,
      terminalVerificationResult: "",
      tipAmount: 0,
      transactionDateTime: DateTime.now(),
      transactionType: TransactionType.P,
      unpredictableNumber: "",
      amount: transactionAmount,
      applicationIdentifier: applicationIdentifier,
      maskedPan: pan,
      cardDataInputMode: cardDataInputMode,
      cardSequenceNumber: cardSequenceNumber,
      applicationCryptogram: "",
      applicationInterchangeProfile: "",
      applicationLabel: "",
      applicationTransactionCounter: "",
      authorised: isSuccessful,
      batchNo: "",
      budgetPeriod: "",
      cashBackAmount: 0,
      cryptogramInformationData: "",
      currencyCode: "710",
      deviceType: "",
      id: 0,
      isUserVoidable: false,
      issuerApplicationData: "",
      merchantId: merchantId,
      posCodeData: "",
      previousTransaction: -1,
      proccessedOnline: true,
      processingCode: ""
    );
  }
}

enum CardDataInputMode {
  CONTACTLESS_INTEGRATED_CIRCUIT_CARD,
  INTEGRATED_CIRCUIT_CARD,
  IntegratedCircuitCard,
  ContactlessIntegratedCircuitCard
}

enum TransactionClientAction {
  TRANSACTION_DECLINED,
  TRANSACTION_SUCCESSFULL
}