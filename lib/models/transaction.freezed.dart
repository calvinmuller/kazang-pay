// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Transaction {
  String get account;
  @JsonKey(fromJson: intSafeToString)
  int get amount;
  String? get amountFees;
  String? get applicationCryptogram;
  String? get applicationIdentifier;
  String? get applicationInterchangeProfile;
  String? get applicationLabel;
  String? get applicationTransactionCounter;
  @JsonKey(fromJson: boolSafe)
  bool get authorised;
  String? get batchNo;
  String? get budgetPeriod;
  @JsonKey(unknownEnumValue: CardDataInputMode.ContactlessIntegratedCircuitCard)
  CardDataInputMode? get cardDataInputMode;
  String? get cardSequenceNumber;
  @JsonKey(fromJson: intSafeToString)
  int get cashBackAmount;
  String? get cryptogramInformationData;
  String? get currencyCode;
  String? get description;
  String? get deviceType;
  @JsonKey(fromJson: intSafeToString)
  int get id;
  @JsonKey(fromJson: boolSafe)
  bool get isUserVoidable;
  String? get issuerApplicationData;
  String? get maskedPan;
  String? get merchantId;
  String? get posCodeData;
  @JsonKey(fromJson: intSafeToString)
  int get previousTransaction;
  @JsonKey(fromJson: boolSafe)
  bool get proccessedOnline;
  String? get processingCode;
  String? get responseCode;
  String? get responseMessage;
  String? get additionalData;
  String get retrievalReferenceNumber;
  @JsonKey(fromJson: intSafeToString)
  int get retryAttempts;
  @JsonKey(fromJson: intSafeToString)
  int get sequenceNumber;
  @JsonKey(fromJson: boolSafe)
  bool get settled;
  String? get sredData;
  String? get sredKsn;
  String? get terminalCapabilities;
  String? get terminalCountryCode;
  String get terminalId;
  String? get terminalVerificationResult;
  @JsonKey(fromJson: intSafeToString)
  int get tipAmount;
  DateTime get transactionDateTime;
  @JsonKey(unknownEnumValue: TransactionType.P)
  TransactionType? get transactionType;
  String? get unpredictableNumber;

  /// Create a copy of Transaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TransactionCopyWith<Transaction> get copyWith =>
      _$TransactionCopyWithImpl<Transaction>(this as Transaction, _$identity);

  /// Serializes this Transaction to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Transaction &&
            (identical(other.account, account) || other.account == account) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.amountFees, amountFees) ||
                other.amountFees == amountFees) &&
            (identical(other.applicationCryptogram, applicationCryptogram) ||
                other.applicationCryptogram == applicationCryptogram) &&
            (identical(other.applicationIdentifier, applicationIdentifier) ||
                other.applicationIdentifier == applicationIdentifier) &&
            (identical(other.applicationInterchangeProfile, applicationInterchangeProfile) ||
                other.applicationInterchangeProfile ==
                    applicationInterchangeProfile) &&
            (identical(other.applicationLabel, applicationLabel) ||
                other.applicationLabel == applicationLabel) &&
            (identical(other.applicationTransactionCounter, applicationTransactionCounter) ||
                other.applicationTransactionCounter ==
                    applicationTransactionCounter) &&
            (identical(other.authorised, authorised) ||
                other.authorised == authorised) &&
            (identical(other.batchNo, batchNo) || other.batchNo == batchNo) &&
            (identical(other.budgetPeriod, budgetPeriod) ||
                other.budgetPeriod == budgetPeriod) &&
            (identical(other.cardDataInputMode, cardDataInputMode) ||
                other.cardDataInputMode == cardDataInputMode) &&
            (identical(other.cardSequenceNumber, cardSequenceNumber) ||
                other.cardSequenceNumber == cardSequenceNumber) &&
            (identical(other.cashBackAmount, cashBackAmount) ||
                other.cashBackAmount == cashBackAmount) &&
            (identical(other.cryptogramInformationData, cryptogramInformationData) ||
                other.cryptogramInformationData == cryptogramInformationData) &&
            (identical(other.currencyCode, currencyCode) ||
                other.currencyCode == currencyCode) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.deviceType, deviceType) ||
                other.deviceType == deviceType) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isUserVoidable, isUserVoidable) ||
                other.isUserVoidable == isUserVoidable) &&
            (identical(other.issuerApplicationData, issuerApplicationData) ||
                other.issuerApplicationData == issuerApplicationData) &&
            (identical(other.maskedPan, maskedPan) ||
                other.maskedPan == maskedPan) &&
            (identical(other.merchantId, merchantId) ||
                other.merchantId == merchantId) &&
            (identical(other.posCodeData, posCodeData) ||
                other.posCodeData == posCodeData) &&
            (identical(other.previousTransaction, previousTransaction) ||
                other.previousTransaction == previousTransaction) &&
            (identical(other.proccessedOnline, proccessedOnline) ||
                other.proccessedOnline == proccessedOnline) &&
            (identical(other.processingCode, processingCode) ||
                other.processingCode == processingCode) &&
            (identical(other.responseCode, responseCode) ||
                other.responseCode == responseCode) &&
            (identical(other.responseMessage, responseMessage) ||
                other.responseMessage == responseMessage) &&
            (identical(other.additionalData, additionalData) ||
                other.additionalData == additionalData) &&
            (identical(other.retrievalReferenceNumber, retrievalReferenceNumber) ||
                other.retrievalReferenceNumber == retrievalReferenceNumber) &&
            (identical(other.retryAttempts, retryAttempts) || other.retryAttempts == retryAttempts) &&
            (identical(other.sequenceNumber, sequenceNumber) || other.sequenceNumber == sequenceNumber) &&
            (identical(other.settled, settled) || other.settled == settled) &&
            (identical(other.sredData, sredData) || other.sredData == sredData) &&
            (identical(other.sredKsn, sredKsn) || other.sredKsn == sredKsn) &&
            (identical(other.terminalCapabilities, terminalCapabilities) || other.terminalCapabilities == terminalCapabilities) &&
            (identical(other.terminalCountryCode, terminalCountryCode) || other.terminalCountryCode == terminalCountryCode) &&
            (identical(other.terminalId, terminalId) || other.terminalId == terminalId) &&
            (identical(other.terminalVerificationResult, terminalVerificationResult) || other.terminalVerificationResult == terminalVerificationResult) &&
            (identical(other.tipAmount, tipAmount) || other.tipAmount == tipAmount) &&
            (identical(other.transactionDateTime, transactionDateTime) || other.transactionDateTime == transactionDateTime) &&
            (identical(other.transactionType, transactionType) || other.transactionType == transactionType) &&
            (identical(other.unpredictableNumber, unpredictableNumber) || other.unpredictableNumber == unpredictableNumber));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        account,
        amount,
        amountFees,
        applicationCryptogram,
        applicationIdentifier,
        applicationInterchangeProfile,
        applicationLabel,
        applicationTransactionCounter,
        authorised,
        batchNo,
        budgetPeriod,
        cardDataInputMode,
        cardSequenceNumber,
        cashBackAmount,
        cryptogramInformationData,
        currencyCode,
        description,
        deviceType,
        id,
        isUserVoidable,
        issuerApplicationData,
        maskedPan,
        merchantId,
        posCodeData,
        previousTransaction,
        proccessedOnline,
        processingCode,
        responseCode,
        responseMessage,
        additionalData,
        retrievalReferenceNumber,
        retryAttempts,
        sequenceNumber,
        settled,
        sredData,
        sredKsn,
        terminalCapabilities,
        terminalCountryCode,
        terminalId,
        terminalVerificationResult,
        tipAmount,
        transactionDateTime,
        transactionType,
        unpredictableNumber
      ]);

  @override
  String toString() {
    return 'Transaction(account: $account, amount: $amount, amountFees: $amountFees, applicationCryptogram: $applicationCryptogram, applicationIdentifier: $applicationIdentifier, applicationInterchangeProfile: $applicationInterchangeProfile, applicationLabel: $applicationLabel, applicationTransactionCounter: $applicationTransactionCounter, authorised: $authorised, batchNo: $batchNo, budgetPeriod: $budgetPeriod, cardDataInputMode: $cardDataInputMode, cardSequenceNumber: $cardSequenceNumber, cashBackAmount: $cashBackAmount, cryptogramInformationData: $cryptogramInformationData, currencyCode: $currencyCode, description: $description, deviceType: $deviceType, id: $id, isUserVoidable: $isUserVoidable, issuerApplicationData: $issuerApplicationData, maskedPan: $maskedPan, merchantId: $merchantId, posCodeData: $posCodeData, previousTransaction: $previousTransaction, proccessedOnline: $proccessedOnline, processingCode: $processingCode, responseCode: $responseCode, responseMessage: $responseMessage, additionalData: $additionalData, retrievalReferenceNumber: $retrievalReferenceNumber, retryAttempts: $retryAttempts, sequenceNumber: $sequenceNumber, settled: $settled, sredData: $sredData, sredKsn: $sredKsn, terminalCapabilities: $terminalCapabilities, terminalCountryCode: $terminalCountryCode, terminalId: $terminalId, terminalVerificationResult: $terminalVerificationResult, tipAmount: $tipAmount, transactionDateTime: $transactionDateTime, transactionType: $transactionType, unpredictableNumber: $unpredictableNumber)';
  }
}

/// @nodoc
abstract mixin class $TransactionCopyWith<$Res> {
  factory $TransactionCopyWith(
          Transaction value, $Res Function(Transaction) _then) =
      _$TransactionCopyWithImpl;
  @useResult
  $Res call(
      {String account,
      @JsonKey(fromJson: intSafeToString) int amount,
      String? amountFees,
      String? applicationCryptogram,
      String? applicationIdentifier,
      String? applicationInterchangeProfile,
      String? applicationLabel,
      String? applicationTransactionCounter,
      @JsonKey(fromJson: boolSafe) bool authorised,
      String? batchNo,
      String? budgetPeriod,
      @JsonKey(
          unknownEnumValue: CardDataInputMode.ContactlessIntegratedCircuitCard)
      CardDataInputMode? cardDataInputMode,
      String? cardSequenceNumber,
      @JsonKey(fromJson: intSafeToString) int cashBackAmount,
      String? cryptogramInformationData,
      String? currencyCode,
      String? description,
      String? deviceType,
      @JsonKey(fromJson: intSafeToString) int id,
      @JsonKey(fromJson: boolSafe) bool isUserVoidable,
      String? issuerApplicationData,
      String? maskedPan,
      String? merchantId,
      String? posCodeData,
      @JsonKey(fromJson: intSafeToString) int previousTransaction,
      @JsonKey(fromJson: boolSafe) bool proccessedOnline,
      String? processingCode,
      String? responseCode,
      String? responseMessage,
      String? additionalData,
      String retrievalReferenceNumber,
      @JsonKey(fromJson: intSafeToString) int retryAttempts,
      @JsonKey(fromJson: intSafeToString) int sequenceNumber,
      @JsonKey(fromJson: boolSafe) bool settled,
      String? sredData,
      String? sredKsn,
      String? terminalCapabilities,
      String? terminalCountryCode,
      String terminalId,
      String? terminalVerificationResult,
      @JsonKey(fromJson: intSafeToString) int tipAmount,
      DateTime transactionDateTime,
      @JsonKey(unknownEnumValue: TransactionType.P)
      TransactionType? transactionType,
      String? unpredictableNumber});
}

/// @nodoc
class _$TransactionCopyWithImpl<$Res> implements $TransactionCopyWith<$Res> {
  _$TransactionCopyWithImpl(this._self, this._then);

  final Transaction _self;
  final $Res Function(Transaction) _then;

  /// Create a copy of Transaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? account = null,
    Object? amount = null,
    Object? amountFees = freezed,
    Object? applicationCryptogram = freezed,
    Object? applicationIdentifier = freezed,
    Object? applicationInterchangeProfile = freezed,
    Object? applicationLabel = freezed,
    Object? applicationTransactionCounter = freezed,
    Object? authorised = null,
    Object? batchNo = freezed,
    Object? budgetPeriod = freezed,
    Object? cardDataInputMode = freezed,
    Object? cardSequenceNumber = freezed,
    Object? cashBackAmount = null,
    Object? cryptogramInformationData = freezed,
    Object? currencyCode = freezed,
    Object? description = freezed,
    Object? deviceType = freezed,
    Object? id = null,
    Object? isUserVoidable = null,
    Object? issuerApplicationData = freezed,
    Object? maskedPan = freezed,
    Object? merchantId = freezed,
    Object? posCodeData = freezed,
    Object? previousTransaction = null,
    Object? proccessedOnline = null,
    Object? processingCode = freezed,
    Object? responseCode = freezed,
    Object? responseMessage = freezed,
    Object? additionalData = freezed,
    Object? retrievalReferenceNumber = null,
    Object? retryAttempts = null,
    Object? sequenceNumber = null,
    Object? settled = null,
    Object? sredData = freezed,
    Object? sredKsn = freezed,
    Object? terminalCapabilities = freezed,
    Object? terminalCountryCode = freezed,
    Object? terminalId = null,
    Object? terminalVerificationResult = freezed,
    Object? tipAmount = null,
    Object? transactionDateTime = null,
    Object? transactionType = freezed,
    Object? unpredictableNumber = freezed,
  }) {
    return _then(_self.copyWith(
      account: null == account
          ? _self.account
          : account // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      amountFees: freezed == amountFees
          ? _self.amountFees
          : amountFees // ignore: cast_nullable_to_non_nullable
              as String?,
      applicationCryptogram: freezed == applicationCryptogram
          ? _self.applicationCryptogram
          : applicationCryptogram // ignore: cast_nullable_to_non_nullable
              as String?,
      applicationIdentifier: freezed == applicationIdentifier
          ? _self.applicationIdentifier
          : applicationIdentifier // ignore: cast_nullable_to_non_nullable
              as String?,
      applicationInterchangeProfile: freezed == applicationInterchangeProfile
          ? _self.applicationInterchangeProfile
          : applicationInterchangeProfile // ignore: cast_nullable_to_non_nullable
              as String?,
      applicationLabel: freezed == applicationLabel
          ? _self.applicationLabel
          : applicationLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      applicationTransactionCounter: freezed == applicationTransactionCounter
          ? _self.applicationTransactionCounter
          : applicationTransactionCounter // ignore: cast_nullable_to_non_nullable
              as String?,
      authorised: null == authorised
          ? _self.authorised
          : authorised // ignore: cast_nullable_to_non_nullable
              as bool,
      batchNo: freezed == batchNo
          ? _self.batchNo
          : batchNo // ignore: cast_nullable_to_non_nullable
              as String?,
      budgetPeriod: freezed == budgetPeriod
          ? _self.budgetPeriod
          : budgetPeriod // ignore: cast_nullable_to_non_nullable
              as String?,
      cardDataInputMode: freezed == cardDataInputMode
          ? _self.cardDataInputMode
          : cardDataInputMode // ignore: cast_nullable_to_non_nullable
              as CardDataInputMode?,
      cardSequenceNumber: freezed == cardSequenceNumber
          ? _self.cardSequenceNumber
          : cardSequenceNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      cashBackAmount: null == cashBackAmount
          ? _self.cashBackAmount
          : cashBackAmount // ignore: cast_nullable_to_non_nullable
              as int,
      cryptogramInformationData: freezed == cryptogramInformationData
          ? _self.cryptogramInformationData
          : cryptogramInformationData // ignore: cast_nullable_to_non_nullable
              as String?,
      currencyCode: freezed == currencyCode
          ? _self.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceType: freezed == deviceType
          ? _self.deviceType
          : deviceType // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      isUserVoidable: null == isUserVoidable
          ? _self.isUserVoidable
          : isUserVoidable // ignore: cast_nullable_to_non_nullable
              as bool,
      issuerApplicationData: freezed == issuerApplicationData
          ? _self.issuerApplicationData
          : issuerApplicationData // ignore: cast_nullable_to_non_nullable
              as String?,
      maskedPan: freezed == maskedPan
          ? _self.maskedPan
          : maskedPan // ignore: cast_nullable_to_non_nullable
              as String?,
      merchantId: freezed == merchantId
          ? _self.merchantId
          : merchantId // ignore: cast_nullable_to_non_nullable
              as String?,
      posCodeData: freezed == posCodeData
          ? _self.posCodeData
          : posCodeData // ignore: cast_nullable_to_non_nullable
              as String?,
      previousTransaction: null == previousTransaction
          ? _self.previousTransaction
          : previousTransaction // ignore: cast_nullable_to_non_nullable
              as int,
      proccessedOnline: null == proccessedOnline
          ? _self.proccessedOnline
          : proccessedOnline // ignore: cast_nullable_to_non_nullable
              as bool,
      processingCode: freezed == processingCode
          ? _self.processingCode
          : processingCode // ignore: cast_nullable_to_non_nullable
              as String?,
      responseCode: freezed == responseCode
          ? _self.responseCode
          : responseCode // ignore: cast_nullable_to_non_nullable
              as String?,
      responseMessage: freezed == responseMessage
          ? _self.responseMessage
          : responseMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      additionalData: freezed == additionalData
          ? _self.additionalData
          : additionalData // ignore: cast_nullable_to_non_nullable
              as String?,
      retrievalReferenceNumber: null == retrievalReferenceNumber
          ? _self.retrievalReferenceNumber
          : retrievalReferenceNumber // ignore: cast_nullable_to_non_nullable
              as String,
      retryAttempts: null == retryAttempts
          ? _self.retryAttempts
          : retryAttempts // ignore: cast_nullable_to_non_nullable
              as int,
      sequenceNumber: null == sequenceNumber
          ? _self.sequenceNumber
          : sequenceNumber // ignore: cast_nullable_to_non_nullable
              as int,
      settled: null == settled
          ? _self.settled
          : settled // ignore: cast_nullable_to_non_nullable
              as bool,
      sredData: freezed == sredData
          ? _self.sredData
          : sredData // ignore: cast_nullable_to_non_nullable
              as String?,
      sredKsn: freezed == sredKsn
          ? _self.sredKsn
          : sredKsn // ignore: cast_nullable_to_non_nullable
              as String?,
      terminalCapabilities: freezed == terminalCapabilities
          ? _self.terminalCapabilities
          : terminalCapabilities // ignore: cast_nullable_to_non_nullable
              as String?,
      terminalCountryCode: freezed == terminalCountryCode
          ? _self.terminalCountryCode
          : terminalCountryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      terminalId: null == terminalId
          ? _self.terminalId
          : terminalId // ignore: cast_nullable_to_non_nullable
              as String,
      terminalVerificationResult: freezed == terminalVerificationResult
          ? _self.terminalVerificationResult
          : terminalVerificationResult // ignore: cast_nullable_to_non_nullable
              as String?,
      tipAmount: null == tipAmount
          ? _self.tipAmount
          : tipAmount // ignore: cast_nullable_to_non_nullable
              as int,
      transactionDateTime: null == transactionDateTime
          ? _self.transactionDateTime
          : transactionDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      transactionType: freezed == transactionType
          ? _self.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as TransactionType?,
      unpredictableNumber: freezed == unpredictableNumber
          ? _self.unpredictableNumber
          : unpredictableNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.pascal)
class _Transaction extends Transaction {
  const _Transaction(
      {required this.account,
      @JsonKey(fromJson: intSafeToString) required this.amount,
      this.amountFees,
      required this.applicationCryptogram,
      required this.applicationIdentifier,
      required this.applicationInterchangeProfile,
      required this.applicationLabel,
      required this.applicationTransactionCounter,
      @JsonKey(fromJson: boolSafe) required this.authorised,
      required this.batchNo,
      required this.budgetPeriod,
      @JsonKey(
          unknownEnumValue: CardDataInputMode.ContactlessIntegratedCircuitCard)
      required this.cardDataInputMode,
      required this.cardSequenceNumber,
      @JsonKey(fromJson: intSafeToString) required this.cashBackAmount,
      required this.cryptogramInformationData,
      required this.currencyCode,
      this.description,
      required this.deviceType,
      @JsonKey(fromJson: intSafeToString) required this.id,
      @JsonKey(fromJson: boolSafe) required this.isUserVoidable,
      required this.issuerApplicationData,
      required this.maskedPan,
      required this.merchantId,
      required this.posCodeData,
      @JsonKey(fromJson: intSafeToString) required this.previousTransaction,
      @JsonKey(fromJson: boolSafe) required this.proccessedOnline,
      required this.processingCode,
      required this.responseCode,
      required this.responseMessage,
      required this.additionalData,
      required this.retrievalReferenceNumber,
      @JsonKey(fromJson: intSafeToString) required this.retryAttempts,
      @JsonKey(fromJson: intSafeToString) required this.sequenceNumber,
      @JsonKey(fromJson: boolSafe) required this.settled,
      required this.sredData,
      required this.sredKsn,
      required this.terminalCapabilities,
      required this.terminalCountryCode,
      required this.terminalId,
      required this.terminalVerificationResult,
      @JsonKey(fromJson: intSafeToString) required this.tipAmount,
      required this.transactionDateTime,
      @JsonKey(unknownEnumValue: TransactionType.P)
      required this.transactionType,
      required this.unpredictableNumber})
      : super._();
  factory _Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

  @override
  final String account;
  @override
  @JsonKey(fromJson: intSafeToString)
  final int amount;
  @override
  final String? amountFees;
  @override
  final String? applicationCryptogram;
  @override
  final String? applicationIdentifier;
  @override
  final String? applicationInterchangeProfile;
  @override
  final String? applicationLabel;
  @override
  final String? applicationTransactionCounter;
  @override
  @JsonKey(fromJson: boolSafe)
  final bool authorised;
  @override
  final String? batchNo;
  @override
  final String? budgetPeriod;
  @override
  @JsonKey(unknownEnumValue: CardDataInputMode.ContactlessIntegratedCircuitCard)
  final CardDataInputMode? cardDataInputMode;
  @override
  final String? cardSequenceNumber;
  @override
  @JsonKey(fromJson: intSafeToString)
  final int cashBackAmount;
  @override
  final String? cryptogramInformationData;
  @override
  final String? currencyCode;
  @override
  final String? description;
  @override
  final String? deviceType;
  @override
  @JsonKey(fromJson: intSafeToString)
  final int id;
  @override
  @JsonKey(fromJson: boolSafe)
  final bool isUserVoidable;
  @override
  final String? issuerApplicationData;
  @override
  final String? maskedPan;
  @override
  final String? merchantId;
  @override
  final String? posCodeData;
  @override
  @JsonKey(fromJson: intSafeToString)
  final int previousTransaction;
  @override
  @JsonKey(fromJson: boolSafe)
  final bool proccessedOnline;
  @override
  final String? processingCode;
  @override
  final String? responseCode;
  @override
  final String? responseMessage;
  @override
  final String? additionalData;
  @override
  final String retrievalReferenceNumber;
  @override
  @JsonKey(fromJson: intSafeToString)
  final int retryAttempts;
  @override
  @JsonKey(fromJson: intSafeToString)
  final int sequenceNumber;
  @override
  @JsonKey(fromJson: boolSafe)
  final bool settled;
  @override
  final String? sredData;
  @override
  final String? sredKsn;
  @override
  final String? terminalCapabilities;
  @override
  final String? terminalCountryCode;
  @override
  final String terminalId;
  @override
  final String? terminalVerificationResult;
  @override
  @JsonKey(fromJson: intSafeToString)
  final int tipAmount;
  @override
  final DateTime transactionDateTime;
  @override
  @JsonKey(unknownEnumValue: TransactionType.P)
  final TransactionType? transactionType;
  @override
  final String? unpredictableNumber;

  /// Create a copy of Transaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TransactionCopyWith<_Transaction> get copyWith =>
      __$TransactionCopyWithImpl<_Transaction>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TransactionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Transaction &&
            (identical(other.account, account) || other.account == account) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.amountFees, amountFees) ||
                other.amountFees == amountFees) &&
            (identical(other.applicationCryptogram, applicationCryptogram) ||
                other.applicationCryptogram == applicationCryptogram) &&
            (identical(other.applicationIdentifier, applicationIdentifier) ||
                other.applicationIdentifier == applicationIdentifier) &&
            (identical(other.applicationInterchangeProfile, applicationInterchangeProfile) ||
                other.applicationInterchangeProfile ==
                    applicationInterchangeProfile) &&
            (identical(other.applicationLabel, applicationLabel) ||
                other.applicationLabel == applicationLabel) &&
            (identical(other.applicationTransactionCounter, applicationTransactionCounter) ||
                other.applicationTransactionCounter ==
                    applicationTransactionCounter) &&
            (identical(other.authorised, authorised) ||
                other.authorised == authorised) &&
            (identical(other.batchNo, batchNo) || other.batchNo == batchNo) &&
            (identical(other.budgetPeriod, budgetPeriod) ||
                other.budgetPeriod == budgetPeriod) &&
            (identical(other.cardDataInputMode, cardDataInputMode) ||
                other.cardDataInputMode == cardDataInputMode) &&
            (identical(other.cardSequenceNumber, cardSequenceNumber) ||
                other.cardSequenceNumber == cardSequenceNumber) &&
            (identical(other.cashBackAmount, cashBackAmount) ||
                other.cashBackAmount == cashBackAmount) &&
            (identical(other.cryptogramInformationData, cryptogramInformationData) ||
                other.cryptogramInformationData == cryptogramInformationData) &&
            (identical(other.currencyCode, currencyCode) ||
                other.currencyCode == currencyCode) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.deviceType, deviceType) ||
                other.deviceType == deviceType) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isUserVoidable, isUserVoidable) ||
                other.isUserVoidable == isUserVoidable) &&
            (identical(other.issuerApplicationData, issuerApplicationData) ||
                other.issuerApplicationData == issuerApplicationData) &&
            (identical(other.maskedPan, maskedPan) ||
                other.maskedPan == maskedPan) &&
            (identical(other.merchantId, merchantId) ||
                other.merchantId == merchantId) &&
            (identical(other.posCodeData, posCodeData) ||
                other.posCodeData == posCodeData) &&
            (identical(other.previousTransaction, previousTransaction) ||
                other.previousTransaction == previousTransaction) &&
            (identical(other.proccessedOnline, proccessedOnline) ||
                other.proccessedOnline == proccessedOnline) &&
            (identical(other.processingCode, processingCode) ||
                other.processingCode == processingCode) &&
            (identical(other.responseCode, responseCode) ||
                other.responseCode == responseCode) &&
            (identical(other.responseMessage, responseMessage) ||
                other.responseMessage == responseMessage) &&
            (identical(other.additionalData, additionalData) ||
                other.additionalData == additionalData) &&
            (identical(other.retrievalReferenceNumber, retrievalReferenceNumber) ||
                other.retrievalReferenceNumber == retrievalReferenceNumber) &&
            (identical(other.retryAttempts, retryAttempts) || other.retryAttempts == retryAttempts) &&
            (identical(other.sequenceNumber, sequenceNumber) || other.sequenceNumber == sequenceNumber) &&
            (identical(other.settled, settled) || other.settled == settled) &&
            (identical(other.sredData, sredData) || other.sredData == sredData) &&
            (identical(other.sredKsn, sredKsn) || other.sredKsn == sredKsn) &&
            (identical(other.terminalCapabilities, terminalCapabilities) || other.terminalCapabilities == terminalCapabilities) &&
            (identical(other.terminalCountryCode, terminalCountryCode) || other.terminalCountryCode == terminalCountryCode) &&
            (identical(other.terminalId, terminalId) || other.terminalId == terminalId) &&
            (identical(other.terminalVerificationResult, terminalVerificationResult) || other.terminalVerificationResult == terminalVerificationResult) &&
            (identical(other.tipAmount, tipAmount) || other.tipAmount == tipAmount) &&
            (identical(other.transactionDateTime, transactionDateTime) || other.transactionDateTime == transactionDateTime) &&
            (identical(other.transactionType, transactionType) || other.transactionType == transactionType) &&
            (identical(other.unpredictableNumber, unpredictableNumber) || other.unpredictableNumber == unpredictableNumber));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        account,
        amount,
        amountFees,
        applicationCryptogram,
        applicationIdentifier,
        applicationInterchangeProfile,
        applicationLabel,
        applicationTransactionCounter,
        authorised,
        batchNo,
        budgetPeriod,
        cardDataInputMode,
        cardSequenceNumber,
        cashBackAmount,
        cryptogramInformationData,
        currencyCode,
        description,
        deviceType,
        id,
        isUserVoidable,
        issuerApplicationData,
        maskedPan,
        merchantId,
        posCodeData,
        previousTransaction,
        proccessedOnline,
        processingCode,
        responseCode,
        responseMessage,
        additionalData,
        retrievalReferenceNumber,
        retryAttempts,
        sequenceNumber,
        settled,
        sredData,
        sredKsn,
        terminalCapabilities,
        terminalCountryCode,
        terminalId,
        terminalVerificationResult,
        tipAmount,
        transactionDateTime,
        transactionType,
        unpredictableNumber
      ]);

  @override
  String toString() {
    return 'Transaction(account: $account, amount: $amount, amountFees: $amountFees, applicationCryptogram: $applicationCryptogram, applicationIdentifier: $applicationIdentifier, applicationInterchangeProfile: $applicationInterchangeProfile, applicationLabel: $applicationLabel, applicationTransactionCounter: $applicationTransactionCounter, authorised: $authorised, batchNo: $batchNo, budgetPeriod: $budgetPeriod, cardDataInputMode: $cardDataInputMode, cardSequenceNumber: $cardSequenceNumber, cashBackAmount: $cashBackAmount, cryptogramInformationData: $cryptogramInformationData, currencyCode: $currencyCode, description: $description, deviceType: $deviceType, id: $id, isUserVoidable: $isUserVoidable, issuerApplicationData: $issuerApplicationData, maskedPan: $maskedPan, merchantId: $merchantId, posCodeData: $posCodeData, previousTransaction: $previousTransaction, proccessedOnline: $proccessedOnline, processingCode: $processingCode, responseCode: $responseCode, responseMessage: $responseMessage, additionalData: $additionalData, retrievalReferenceNumber: $retrievalReferenceNumber, retryAttempts: $retryAttempts, sequenceNumber: $sequenceNumber, settled: $settled, sredData: $sredData, sredKsn: $sredKsn, terminalCapabilities: $terminalCapabilities, terminalCountryCode: $terminalCountryCode, terminalId: $terminalId, terminalVerificationResult: $terminalVerificationResult, tipAmount: $tipAmount, transactionDateTime: $transactionDateTime, transactionType: $transactionType, unpredictableNumber: $unpredictableNumber)';
  }
}

/// @nodoc
abstract mixin class _$TransactionCopyWith<$Res>
    implements $TransactionCopyWith<$Res> {
  factory _$TransactionCopyWith(
          _Transaction value, $Res Function(_Transaction) _then) =
      __$TransactionCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String account,
      @JsonKey(fromJson: intSafeToString) int amount,
      String? amountFees,
      String? applicationCryptogram,
      String? applicationIdentifier,
      String? applicationInterchangeProfile,
      String? applicationLabel,
      String? applicationTransactionCounter,
      @JsonKey(fromJson: boolSafe) bool authorised,
      String? batchNo,
      String? budgetPeriod,
      @JsonKey(
          unknownEnumValue: CardDataInputMode.ContactlessIntegratedCircuitCard)
      CardDataInputMode? cardDataInputMode,
      String? cardSequenceNumber,
      @JsonKey(fromJson: intSafeToString) int cashBackAmount,
      String? cryptogramInformationData,
      String? currencyCode,
      String? description,
      String? deviceType,
      @JsonKey(fromJson: intSafeToString) int id,
      @JsonKey(fromJson: boolSafe) bool isUserVoidable,
      String? issuerApplicationData,
      String? maskedPan,
      String? merchantId,
      String? posCodeData,
      @JsonKey(fromJson: intSafeToString) int previousTransaction,
      @JsonKey(fromJson: boolSafe) bool proccessedOnline,
      String? processingCode,
      String? responseCode,
      String? responseMessage,
      String? additionalData,
      String retrievalReferenceNumber,
      @JsonKey(fromJson: intSafeToString) int retryAttempts,
      @JsonKey(fromJson: intSafeToString) int sequenceNumber,
      @JsonKey(fromJson: boolSafe) bool settled,
      String? sredData,
      String? sredKsn,
      String? terminalCapabilities,
      String? terminalCountryCode,
      String terminalId,
      String? terminalVerificationResult,
      @JsonKey(fromJson: intSafeToString) int tipAmount,
      DateTime transactionDateTime,
      @JsonKey(unknownEnumValue: TransactionType.P)
      TransactionType? transactionType,
      String? unpredictableNumber});
}

/// @nodoc
class __$TransactionCopyWithImpl<$Res> implements _$TransactionCopyWith<$Res> {
  __$TransactionCopyWithImpl(this._self, this._then);

  final _Transaction _self;
  final $Res Function(_Transaction) _then;

  /// Create a copy of Transaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? account = null,
    Object? amount = null,
    Object? amountFees = freezed,
    Object? applicationCryptogram = freezed,
    Object? applicationIdentifier = freezed,
    Object? applicationInterchangeProfile = freezed,
    Object? applicationLabel = freezed,
    Object? applicationTransactionCounter = freezed,
    Object? authorised = null,
    Object? batchNo = freezed,
    Object? budgetPeriod = freezed,
    Object? cardDataInputMode = freezed,
    Object? cardSequenceNumber = freezed,
    Object? cashBackAmount = null,
    Object? cryptogramInformationData = freezed,
    Object? currencyCode = freezed,
    Object? description = freezed,
    Object? deviceType = freezed,
    Object? id = null,
    Object? isUserVoidable = null,
    Object? issuerApplicationData = freezed,
    Object? maskedPan = freezed,
    Object? merchantId = freezed,
    Object? posCodeData = freezed,
    Object? previousTransaction = null,
    Object? proccessedOnline = null,
    Object? processingCode = freezed,
    Object? responseCode = freezed,
    Object? responseMessage = freezed,
    Object? additionalData = freezed,
    Object? retrievalReferenceNumber = null,
    Object? retryAttempts = null,
    Object? sequenceNumber = null,
    Object? settled = null,
    Object? sredData = freezed,
    Object? sredKsn = freezed,
    Object? terminalCapabilities = freezed,
    Object? terminalCountryCode = freezed,
    Object? terminalId = null,
    Object? terminalVerificationResult = freezed,
    Object? tipAmount = null,
    Object? transactionDateTime = null,
    Object? transactionType = freezed,
    Object? unpredictableNumber = freezed,
  }) {
    return _then(_Transaction(
      account: null == account
          ? _self.account
          : account // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      amountFees: freezed == amountFees
          ? _self.amountFees
          : amountFees // ignore: cast_nullable_to_non_nullable
              as String?,
      applicationCryptogram: freezed == applicationCryptogram
          ? _self.applicationCryptogram
          : applicationCryptogram // ignore: cast_nullable_to_non_nullable
              as String?,
      applicationIdentifier: freezed == applicationIdentifier
          ? _self.applicationIdentifier
          : applicationIdentifier // ignore: cast_nullable_to_non_nullable
              as String?,
      applicationInterchangeProfile: freezed == applicationInterchangeProfile
          ? _self.applicationInterchangeProfile
          : applicationInterchangeProfile // ignore: cast_nullable_to_non_nullable
              as String?,
      applicationLabel: freezed == applicationLabel
          ? _self.applicationLabel
          : applicationLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      applicationTransactionCounter: freezed == applicationTransactionCounter
          ? _self.applicationTransactionCounter
          : applicationTransactionCounter // ignore: cast_nullable_to_non_nullable
              as String?,
      authorised: null == authorised
          ? _self.authorised
          : authorised // ignore: cast_nullable_to_non_nullable
              as bool,
      batchNo: freezed == batchNo
          ? _self.batchNo
          : batchNo // ignore: cast_nullable_to_non_nullable
              as String?,
      budgetPeriod: freezed == budgetPeriod
          ? _self.budgetPeriod
          : budgetPeriod // ignore: cast_nullable_to_non_nullable
              as String?,
      cardDataInputMode: freezed == cardDataInputMode
          ? _self.cardDataInputMode
          : cardDataInputMode // ignore: cast_nullable_to_non_nullable
              as CardDataInputMode?,
      cardSequenceNumber: freezed == cardSequenceNumber
          ? _self.cardSequenceNumber
          : cardSequenceNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      cashBackAmount: null == cashBackAmount
          ? _self.cashBackAmount
          : cashBackAmount // ignore: cast_nullable_to_non_nullable
              as int,
      cryptogramInformationData: freezed == cryptogramInformationData
          ? _self.cryptogramInformationData
          : cryptogramInformationData // ignore: cast_nullable_to_non_nullable
              as String?,
      currencyCode: freezed == currencyCode
          ? _self.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceType: freezed == deviceType
          ? _self.deviceType
          : deviceType // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      isUserVoidable: null == isUserVoidable
          ? _self.isUserVoidable
          : isUserVoidable // ignore: cast_nullable_to_non_nullable
              as bool,
      issuerApplicationData: freezed == issuerApplicationData
          ? _self.issuerApplicationData
          : issuerApplicationData // ignore: cast_nullable_to_non_nullable
              as String?,
      maskedPan: freezed == maskedPan
          ? _self.maskedPan
          : maskedPan // ignore: cast_nullable_to_non_nullable
              as String?,
      merchantId: freezed == merchantId
          ? _self.merchantId
          : merchantId // ignore: cast_nullable_to_non_nullable
              as String?,
      posCodeData: freezed == posCodeData
          ? _self.posCodeData
          : posCodeData // ignore: cast_nullable_to_non_nullable
              as String?,
      previousTransaction: null == previousTransaction
          ? _self.previousTransaction
          : previousTransaction // ignore: cast_nullable_to_non_nullable
              as int,
      proccessedOnline: null == proccessedOnline
          ? _self.proccessedOnline
          : proccessedOnline // ignore: cast_nullable_to_non_nullable
              as bool,
      processingCode: freezed == processingCode
          ? _self.processingCode
          : processingCode // ignore: cast_nullable_to_non_nullable
              as String?,
      responseCode: freezed == responseCode
          ? _self.responseCode
          : responseCode // ignore: cast_nullable_to_non_nullable
              as String?,
      responseMessage: freezed == responseMessage
          ? _self.responseMessage
          : responseMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      additionalData: freezed == additionalData
          ? _self.additionalData
          : additionalData // ignore: cast_nullable_to_non_nullable
              as String?,
      retrievalReferenceNumber: null == retrievalReferenceNumber
          ? _self.retrievalReferenceNumber
          : retrievalReferenceNumber // ignore: cast_nullable_to_non_nullable
              as String,
      retryAttempts: null == retryAttempts
          ? _self.retryAttempts
          : retryAttempts // ignore: cast_nullable_to_non_nullable
              as int,
      sequenceNumber: null == sequenceNumber
          ? _self.sequenceNumber
          : sequenceNumber // ignore: cast_nullable_to_non_nullable
              as int,
      settled: null == settled
          ? _self.settled
          : settled // ignore: cast_nullable_to_non_nullable
              as bool,
      sredData: freezed == sredData
          ? _self.sredData
          : sredData // ignore: cast_nullable_to_non_nullable
              as String?,
      sredKsn: freezed == sredKsn
          ? _self.sredKsn
          : sredKsn // ignore: cast_nullable_to_non_nullable
              as String?,
      terminalCapabilities: freezed == terminalCapabilities
          ? _self.terminalCapabilities
          : terminalCapabilities // ignore: cast_nullable_to_non_nullable
              as String?,
      terminalCountryCode: freezed == terminalCountryCode
          ? _self.terminalCountryCode
          : terminalCountryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      terminalId: null == terminalId
          ? _self.terminalId
          : terminalId // ignore: cast_nullable_to_non_nullable
              as String,
      terminalVerificationResult: freezed == terminalVerificationResult
          ? _self.terminalVerificationResult
          : terminalVerificationResult // ignore: cast_nullable_to_non_nullable
              as String?,
      tipAmount: null == tipAmount
          ? _self.tipAmount
          : tipAmount // ignore: cast_nullable_to_non_nullable
              as int,
      transactionDateTime: null == transactionDateTime
          ? _self.transactionDateTime
          : transactionDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      transactionType: freezed == transactionType
          ? _self.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as TransactionType?,
      unpredictableNumber: freezed == unpredictableNumber
          ? _self.unpredictableNumber
          : unpredictableNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
