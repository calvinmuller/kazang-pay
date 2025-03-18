// ignore_for_file: constant_identifier_names
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

import 'app_state.dart' show MerchantConfig;
import 'transaction_result.dart';

part 'transaction.freezed.dart';

part 'transaction.g.dart';

enum TransactionType { payment, cashback, refund, paymentCashback, P, V, VOID_TRANSACTION }

enum TransactionStatus { approved, declined, refunded }

enum SettlementStatus { pending, settled }

@freezed
class Transaction with _$Transaction {
  const Transaction._();

  @JsonSerializable(fieldRename: FieldRename.pascal)
  const factory Transaction({
    required String account,
    @JsonKey(fromJson: intSafeToString) required int amount,
    String? amountFees,
    required String? applicationCryptogram,
    required String? applicationIdentifier,
    required String? applicationInterchangeProfile,
    required String? applicationLabel,
    required String? applicationTransactionCounter,
    @JsonKey(fromJson: boolSafe) required bool authorised,
    required String? batchNo,
    required String? budgetPeriod,
    required CardDataInputMode? cardDataInputMode,
    required String? cardSequenceNumber,
    @JsonKey(fromJson: intSafeToString) required int cashBackAmount,
    required String? cryptogramInformationData,
    required String? currencyCode,
    String? description,
    required String? deviceType,
    @JsonKey(fromJson: intSafeToString) required int id,
    @JsonKey(fromJson: boolSafe) required bool isUserVoidable,
    required String? issuerApplicationData,
    required String? maskedPan,
    required String? merchantId,
    required String? posCodeData,
    @JsonKey(fromJson: intSafeToString) required int previousTransaction,
    @JsonKey(fromJson: boolSafe) required bool proccessedOnline,
    required String? processingCode,
    required String? responseCode,
    required String? responseMessage,
    required String? additionalData,
    required String retrievalReferenceNumber,
    @JsonKey(fromJson: intSafeToString) required int retryAttempts,
    @JsonKey(fromJson: intSafeToString) required int sequenceNumber,
    @JsonKey(fromJson: boolSafe) required bool settled,
    required String? sredData,
    required String? sredKsn,
    required String? terminalCapabilities,
    required String? terminalCountryCode,
    required String terminalId,
    required String? terminalVerificationResult,
    @JsonKey(fromJson: intSafeToString) required int tipAmount,
    required DateTime transactionDateTime,
    required TransactionType? transactionType,
    required String? unpredictableNumber,
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

  get isPayment => additionalData == null && transactionType == TransactionType.P;

  get isSuccessful => authorised;

  get isCashback =>
      additionalData != null &&
      additionalData!.contains('cashWithDrawalOnly14true');

  get isVoid => transactionType == TransactionType.VOID_TRANSACTION;

  get type => isCashback
      ? "CASHBACK"
      : isPayment
          ? "PURCHASE"
          : "VOID";

  toTransactionResult({required MerchantConfig merchantConfig}) {
    return TransactionResult(
      applicationIdentifier: applicationIdentifier ?? "",
      authorizationCode: null,
      canPrintReceipt: true,
      cardDataInputMode: cardDataInputMode,
      cardSequenceNumber: cardSequenceNumber,
      cardVerificationMethod: null,
      declinedReason: responseMessage!,
      isCancelled: false,
      isSuccessful: authorised,
      isSupervisor: false,
      merchantId: merchantId,
      merchantName: merchantConfig.tradingName,
      message: responseMessage!,
      ourReferenceNumber: retrievalReferenceNumber,
      pan: maskedPan,
      responseCode: responseCode!,
      responseMessage: responseMessage!,
      terminalId: terminalId,
      transactionAmount: amount,
      transactionClientAction: authorised
          ? TransactionClientAction.TRANSACTION_SUCCESSFULL
          : TransactionClientAction.TRANSACTION_DECLINED,
      transactionDate:
          DateFormat('MMM d, yyyy h:mm:ss a').format(transactionDateTime),
    );
  }
}

intSafeToString(number) {
  return int.parse(number.toString());
}

boolSafe(boolean) {
  return bool.parse(boolean.toString());
}
