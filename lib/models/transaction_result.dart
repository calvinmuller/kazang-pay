// ignore_for_file: constant_identifier_names
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
    @JsonKey(fromJson: arrayToString) String? additionalData,
    @JsonKey(fromJson: arrayToString) String? applicationIdentifier,
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
    String? stan,
    String? priorityMessage,
    String? receiptReference,
    required String responseCode,
    required String? responseMessage,
    String? terminalId,
    required int transactionAmount,
    required TransactionClientAction? transactionClientAction,
    String? transactionDate,
    TransactionType? transactionType,
    List<String>? cardApplications,
  }) = _TransactionResult;

  factory TransactionResult.fromJson(Map<String, dynamic> json) =>
      _$TransactionResultFromJson(json);

  get isTap => [
        CardDataInputMode.CONTACTLESS_INTEGRATED_CIRCUIT_CARD,
        CardDataInputMode.ContactlessIntegratedCircuitCard
      ].contains(cardDataInputMode);

}

enum CardDataInputMode {
  CONTACTLESS_INTEGRATED_CIRCUIT_CARD,
  INTEGRATED_CIRCUIT_CARD,
  IntegratedCircuitCard,
  ContactlessIntegratedCircuitCard
}

enum TransactionClientAction {
  TRANSACTION_DECLINED,
  TRANSACTION_SUCCESSFULL,
  SIGNATURE_REQUIRED,
  SELECT_APPLICATION,
  SELECT_BUDGET
}
