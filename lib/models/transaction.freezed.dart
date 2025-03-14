// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Transaction _$TransactionFromJson(Map<String, dynamic> json) {
  return _Transaction.fromJson(json);
}

/// @nodoc
mixin _$Transaction {
  String get account => throw _privateConstructorUsedError;
  @JsonKey(fromJson: intSafeToString)
  int get amount => throw _privateConstructorUsedError;
  String? get amountFees => throw _privateConstructorUsedError;
  String? get applicationCryptogram => throw _privateConstructorUsedError;
  String? get applicationIdentifier => throw _privateConstructorUsedError;
  String? get applicationInterchangeProfile =>
      throw _privateConstructorUsedError;
  String? get applicationLabel => throw _privateConstructorUsedError;
  String? get applicationTransactionCounter =>
      throw _privateConstructorUsedError;
  @JsonKey(fromJson: boolSafe)
  bool get authorised => throw _privateConstructorUsedError;
  String? get batchNo => throw _privateConstructorUsedError;
  String? get budgetPeriod => throw _privateConstructorUsedError;
  CardDataInputMode? get cardDataInputMode =>
      throw _privateConstructorUsedError;
  String? get cardSequenceNumber => throw _privateConstructorUsedError;
  @JsonKey(fromJson: intSafeToString)
  int get cashBackAmount => throw _privateConstructorUsedError;
  String? get cryptogramInformationData => throw _privateConstructorUsedError;
  String? get currencyCode => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get deviceType => throw _privateConstructorUsedError;
  @JsonKey(fromJson: intSafeToString)
  int get id => throw _privateConstructorUsedError;
  @JsonKey(fromJson: boolSafe)
  bool get isUserVoidable => throw _privateConstructorUsedError;
  String? get issuerApplicationData => throw _privateConstructorUsedError;
  String? get maskedPan => throw _privateConstructorUsedError;
  String? get merchantId => throw _privateConstructorUsedError;
  String? get posCodeData => throw _privateConstructorUsedError;
  @JsonKey(fromJson: intSafeToString)
  int get previousTransaction => throw _privateConstructorUsedError;
  @JsonKey(fromJson: boolSafe)
  bool get proccessedOnline => throw _privateConstructorUsedError;
  String? get processingCode => throw _privateConstructorUsedError;
  String? get responseCode => throw _privateConstructorUsedError;
  String? get responseMessage => throw _privateConstructorUsedError;
  String? get additionalData => throw _privateConstructorUsedError;
  String get retrievalReferenceNumber => throw _privateConstructorUsedError;
  @JsonKey(fromJson: intSafeToString)
  int get retryAttempts => throw _privateConstructorUsedError;
  @JsonKey(fromJson: intSafeToString)
  int get sequenceNumber => throw _privateConstructorUsedError;
  @JsonKey(fromJson: boolSafe)
  bool get settled => throw _privateConstructorUsedError;
  String? get sredData => throw _privateConstructorUsedError;
  String? get sredKsn => throw _privateConstructorUsedError;
  String? get terminalCapabilities => throw _privateConstructorUsedError;
  String? get terminalCountryCode => throw _privateConstructorUsedError;
  String get terminalId => throw _privateConstructorUsedError;
  String? get terminalVerificationResult => throw _privateConstructorUsedError;
  @JsonKey(fromJson: intSafeToString)
  int get tipAmount => throw _privateConstructorUsedError;
  DateTime get transactionDateTime => throw _privateConstructorUsedError;
  TransactionType? get transactionType => throw _privateConstructorUsedError;
  String? get unpredictableNumber => throw _privateConstructorUsedError;

  /// Serializes this Transaction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Transaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionCopyWith<Transaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionCopyWith<$Res> {
  factory $TransactionCopyWith(
          Transaction value, $Res Function(Transaction) then) =
      _$TransactionCopyWithImpl<$Res, Transaction>;
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
      TransactionType? transactionType,
      String? unpredictableNumber});
}

/// @nodoc
class _$TransactionCopyWithImpl<$Res, $Val extends Transaction>
    implements $TransactionCopyWith<$Res> {
  _$TransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      account: null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      amountFees: freezed == amountFees
          ? _value.amountFees
          : amountFees // ignore: cast_nullable_to_non_nullable
              as String?,
      applicationCryptogram: freezed == applicationCryptogram
          ? _value.applicationCryptogram
          : applicationCryptogram // ignore: cast_nullable_to_non_nullable
              as String?,
      applicationIdentifier: freezed == applicationIdentifier
          ? _value.applicationIdentifier
          : applicationIdentifier // ignore: cast_nullable_to_non_nullable
              as String?,
      applicationInterchangeProfile: freezed == applicationInterchangeProfile
          ? _value.applicationInterchangeProfile
          : applicationInterchangeProfile // ignore: cast_nullable_to_non_nullable
              as String?,
      applicationLabel: freezed == applicationLabel
          ? _value.applicationLabel
          : applicationLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      applicationTransactionCounter: freezed == applicationTransactionCounter
          ? _value.applicationTransactionCounter
          : applicationTransactionCounter // ignore: cast_nullable_to_non_nullable
              as String?,
      authorised: null == authorised
          ? _value.authorised
          : authorised // ignore: cast_nullable_to_non_nullable
              as bool,
      batchNo: freezed == batchNo
          ? _value.batchNo
          : batchNo // ignore: cast_nullable_to_non_nullable
              as String?,
      budgetPeriod: freezed == budgetPeriod
          ? _value.budgetPeriod
          : budgetPeriod // ignore: cast_nullable_to_non_nullable
              as String?,
      cardDataInputMode: freezed == cardDataInputMode
          ? _value.cardDataInputMode
          : cardDataInputMode // ignore: cast_nullable_to_non_nullable
              as CardDataInputMode?,
      cardSequenceNumber: freezed == cardSequenceNumber
          ? _value.cardSequenceNumber
          : cardSequenceNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      cashBackAmount: null == cashBackAmount
          ? _value.cashBackAmount
          : cashBackAmount // ignore: cast_nullable_to_non_nullable
              as int,
      cryptogramInformationData: freezed == cryptogramInformationData
          ? _value.cryptogramInformationData
          : cryptogramInformationData // ignore: cast_nullable_to_non_nullable
              as String?,
      currencyCode: freezed == currencyCode
          ? _value.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceType: freezed == deviceType
          ? _value.deviceType
          : deviceType // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      isUserVoidable: null == isUserVoidable
          ? _value.isUserVoidable
          : isUserVoidable // ignore: cast_nullable_to_non_nullable
              as bool,
      issuerApplicationData: freezed == issuerApplicationData
          ? _value.issuerApplicationData
          : issuerApplicationData // ignore: cast_nullable_to_non_nullable
              as String?,
      maskedPan: freezed == maskedPan
          ? _value.maskedPan
          : maskedPan // ignore: cast_nullable_to_non_nullable
              as String?,
      merchantId: freezed == merchantId
          ? _value.merchantId
          : merchantId // ignore: cast_nullable_to_non_nullable
              as String?,
      posCodeData: freezed == posCodeData
          ? _value.posCodeData
          : posCodeData // ignore: cast_nullable_to_non_nullable
              as String?,
      previousTransaction: null == previousTransaction
          ? _value.previousTransaction
          : previousTransaction // ignore: cast_nullable_to_non_nullable
              as int,
      proccessedOnline: null == proccessedOnline
          ? _value.proccessedOnline
          : proccessedOnline // ignore: cast_nullable_to_non_nullable
              as bool,
      processingCode: freezed == processingCode
          ? _value.processingCode
          : processingCode // ignore: cast_nullable_to_non_nullable
              as String?,
      responseCode: freezed == responseCode
          ? _value.responseCode
          : responseCode // ignore: cast_nullable_to_non_nullable
              as String?,
      responseMessage: freezed == responseMessage
          ? _value.responseMessage
          : responseMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      additionalData: freezed == additionalData
          ? _value.additionalData
          : additionalData // ignore: cast_nullable_to_non_nullable
              as String?,
      retrievalReferenceNumber: null == retrievalReferenceNumber
          ? _value.retrievalReferenceNumber
          : retrievalReferenceNumber // ignore: cast_nullable_to_non_nullable
              as String,
      retryAttempts: null == retryAttempts
          ? _value.retryAttempts
          : retryAttempts // ignore: cast_nullable_to_non_nullable
              as int,
      sequenceNumber: null == sequenceNumber
          ? _value.sequenceNumber
          : sequenceNumber // ignore: cast_nullable_to_non_nullable
              as int,
      settled: null == settled
          ? _value.settled
          : settled // ignore: cast_nullable_to_non_nullable
              as bool,
      sredData: freezed == sredData
          ? _value.sredData
          : sredData // ignore: cast_nullable_to_non_nullable
              as String?,
      sredKsn: freezed == sredKsn
          ? _value.sredKsn
          : sredKsn // ignore: cast_nullable_to_non_nullable
              as String?,
      terminalCapabilities: freezed == terminalCapabilities
          ? _value.terminalCapabilities
          : terminalCapabilities // ignore: cast_nullable_to_non_nullable
              as String?,
      terminalCountryCode: freezed == terminalCountryCode
          ? _value.terminalCountryCode
          : terminalCountryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      terminalId: null == terminalId
          ? _value.terminalId
          : terminalId // ignore: cast_nullable_to_non_nullable
              as String,
      terminalVerificationResult: freezed == terminalVerificationResult
          ? _value.terminalVerificationResult
          : terminalVerificationResult // ignore: cast_nullable_to_non_nullable
              as String?,
      tipAmount: null == tipAmount
          ? _value.tipAmount
          : tipAmount // ignore: cast_nullable_to_non_nullable
              as int,
      transactionDateTime: null == transactionDateTime
          ? _value.transactionDateTime
          : transactionDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      transactionType: freezed == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as TransactionType?,
      unpredictableNumber: freezed == unpredictableNumber
          ? _value.unpredictableNumber
          : unpredictableNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionImplCopyWith<$Res>
    implements $TransactionCopyWith<$Res> {
  factory _$$TransactionImplCopyWith(
          _$TransactionImpl value, $Res Function(_$TransactionImpl) then) =
      __$$TransactionImplCopyWithImpl<$Res>;
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
      TransactionType? transactionType,
      String? unpredictableNumber});
}

/// @nodoc
class __$$TransactionImplCopyWithImpl<$Res>
    extends _$TransactionCopyWithImpl<$Res, _$TransactionImpl>
    implements _$$TransactionImplCopyWith<$Res> {
  __$$TransactionImplCopyWithImpl(
      _$TransactionImpl _value, $Res Function(_$TransactionImpl) _then)
      : super(_value, _then);

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
    return _then(_$TransactionImpl(
      account: null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      amountFees: freezed == amountFees
          ? _value.amountFees
          : amountFees // ignore: cast_nullable_to_non_nullable
              as String?,
      applicationCryptogram: freezed == applicationCryptogram
          ? _value.applicationCryptogram
          : applicationCryptogram // ignore: cast_nullable_to_non_nullable
              as String?,
      applicationIdentifier: freezed == applicationIdentifier
          ? _value.applicationIdentifier
          : applicationIdentifier // ignore: cast_nullable_to_non_nullable
              as String?,
      applicationInterchangeProfile: freezed == applicationInterchangeProfile
          ? _value.applicationInterchangeProfile
          : applicationInterchangeProfile // ignore: cast_nullable_to_non_nullable
              as String?,
      applicationLabel: freezed == applicationLabel
          ? _value.applicationLabel
          : applicationLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      applicationTransactionCounter: freezed == applicationTransactionCounter
          ? _value.applicationTransactionCounter
          : applicationTransactionCounter // ignore: cast_nullable_to_non_nullable
              as String?,
      authorised: null == authorised
          ? _value.authorised
          : authorised // ignore: cast_nullable_to_non_nullable
              as bool,
      batchNo: freezed == batchNo
          ? _value.batchNo
          : batchNo // ignore: cast_nullable_to_non_nullable
              as String?,
      budgetPeriod: freezed == budgetPeriod
          ? _value.budgetPeriod
          : budgetPeriod // ignore: cast_nullable_to_non_nullable
              as String?,
      cardDataInputMode: freezed == cardDataInputMode
          ? _value.cardDataInputMode
          : cardDataInputMode // ignore: cast_nullable_to_non_nullable
              as CardDataInputMode?,
      cardSequenceNumber: freezed == cardSequenceNumber
          ? _value.cardSequenceNumber
          : cardSequenceNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      cashBackAmount: null == cashBackAmount
          ? _value.cashBackAmount
          : cashBackAmount // ignore: cast_nullable_to_non_nullable
              as int,
      cryptogramInformationData: freezed == cryptogramInformationData
          ? _value.cryptogramInformationData
          : cryptogramInformationData // ignore: cast_nullable_to_non_nullable
              as String?,
      currencyCode: freezed == currencyCode
          ? _value.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceType: freezed == deviceType
          ? _value.deviceType
          : deviceType // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      isUserVoidable: null == isUserVoidable
          ? _value.isUserVoidable
          : isUserVoidable // ignore: cast_nullable_to_non_nullable
              as bool,
      issuerApplicationData: freezed == issuerApplicationData
          ? _value.issuerApplicationData
          : issuerApplicationData // ignore: cast_nullable_to_non_nullable
              as String?,
      maskedPan: freezed == maskedPan
          ? _value.maskedPan
          : maskedPan // ignore: cast_nullable_to_non_nullable
              as String?,
      merchantId: freezed == merchantId
          ? _value.merchantId
          : merchantId // ignore: cast_nullable_to_non_nullable
              as String?,
      posCodeData: freezed == posCodeData
          ? _value.posCodeData
          : posCodeData // ignore: cast_nullable_to_non_nullable
              as String?,
      previousTransaction: null == previousTransaction
          ? _value.previousTransaction
          : previousTransaction // ignore: cast_nullable_to_non_nullable
              as int,
      proccessedOnline: null == proccessedOnline
          ? _value.proccessedOnline
          : proccessedOnline // ignore: cast_nullable_to_non_nullable
              as bool,
      processingCode: freezed == processingCode
          ? _value.processingCode
          : processingCode // ignore: cast_nullable_to_non_nullable
              as String?,
      responseCode: freezed == responseCode
          ? _value.responseCode
          : responseCode // ignore: cast_nullable_to_non_nullable
              as String?,
      responseMessage: freezed == responseMessage
          ? _value.responseMessage
          : responseMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      additionalData: freezed == additionalData
          ? _value.additionalData
          : additionalData // ignore: cast_nullable_to_non_nullable
              as String?,
      retrievalReferenceNumber: null == retrievalReferenceNumber
          ? _value.retrievalReferenceNumber
          : retrievalReferenceNumber // ignore: cast_nullable_to_non_nullable
              as String,
      retryAttempts: null == retryAttempts
          ? _value.retryAttempts
          : retryAttempts // ignore: cast_nullable_to_non_nullable
              as int,
      sequenceNumber: null == sequenceNumber
          ? _value.sequenceNumber
          : sequenceNumber // ignore: cast_nullable_to_non_nullable
              as int,
      settled: null == settled
          ? _value.settled
          : settled // ignore: cast_nullable_to_non_nullable
              as bool,
      sredData: freezed == sredData
          ? _value.sredData
          : sredData // ignore: cast_nullable_to_non_nullable
              as String?,
      sredKsn: freezed == sredKsn
          ? _value.sredKsn
          : sredKsn // ignore: cast_nullable_to_non_nullable
              as String?,
      terminalCapabilities: freezed == terminalCapabilities
          ? _value.terminalCapabilities
          : terminalCapabilities // ignore: cast_nullable_to_non_nullable
              as String?,
      terminalCountryCode: freezed == terminalCountryCode
          ? _value.terminalCountryCode
          : terminalCountryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      terminalId: null == terminalId
          ? _value.terminalId
          : terminalId // ignore: cast_nullable_to_non_nullable
              as String,
      terminalVerificationResult: freezed == terminalVerificationResult
          ? _value.terminalVerificationResult
          : terminalVerificationResult // ignore: cast_nullable_to_non_nullable
              as String?,
      tipAmount: null == tipAmount
          ? _value.tipAmount
          : tipAmount // ignore: cast_nullable_to_non_nullable
              as int,
      transactionDateTime: null == transactionDateTime
          ? _value.transactionDateTime
          : transactionDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      transactionType: freezed == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as TransactionType?,
      unpredictableNumber: freezed == unpredictableNumber
          ? _value.unpredictableNumber
          : unpredictableNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.pascal)
class _$TransactionImpl extends _Transaction {
  const _$TransactionImpl(
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
      required this.transactionType,
      required this.unpredictableNumber})
      : super._();

  factory _$TransactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionImplFromJson(json);

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
  final TransactionType? transactionType;
  @override
  final String? unpredictableNumber;

  @override
  String toString() {
    return 'Transaction(account: $account, amount: $amount, amountFees: $amountFees, applicationCryptogram: $applicationCryptogram, applicationIdentifier: $applicationIdentifier, applicationInterchangeProfile: $applicationInterchangeProfile, applicationLabel: $applicationLabel, applicationTransactionCounter: $applicationTransactionCounter, authorised: $authorised, batchNo: $batchNo, budgetPeriod: $budgetPeriod, cardDataInputMode: $cardDataInputMode, cardSequenceNumber: $cardSequenceNumber, cashBackAmount: $cashBackAmount, cryptogramInformationData: $cryptogramInformationData, currencyCode: $currencyCode, description: $description, deviceType: $deviceType, id: $id, isUserVoidable: $isUserVoidable, issuerApplicationData: $issuerApplicationData, maskedPan: $maskedPan, merchantId: $merchantId, posCodeData: $posCodeData, previousTransaction: $previousTransaction, proccessedOnline: $proccessedOnline, processingCode: $processingCode, responseCode: $responseCode, responseMessage: $responseMessage, additionalData: $additionalData, retrievalReferenceNumber: $retrievalReferenceNumber, retryAttempts: $retryAttempts, sequenceNumber: $sequenceNumber, settled: $settled, sredData: $sredData, sredKsn: $sredKsn, terminalCapabilities: $terminalCapabilities, terminalCountryCode: $terminalCountryCode, terminalId: $terminalId, terminalVerificationResult: $terminalVerificationResult, tipAmount: $tipAmount, transactionDateTime: $transactionDateTime, transactionType: $transactionType, unpredictableNumber: $unpredictableNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionImpl &&
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

  /// Create a copy of Transaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionImplCopyWith<_$TransactionImpl> get copyWith =>
      __$$TransactionImplCopyWithImpl<_$TransactionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionImplToJson(
      this,
    );
  }
}

abstract class _Transaction extends Transaction {
  const factory _Transaction(
      {required final String account,
      @JsonKey(fromJson: intSafeToString) required final int amount,
      final String? amountFees,
      required final String? applicationCryptogram,
      required final String? applicationIdentifier,
      required final String? applicationInterchangeProfile,
      required final String? applicationLabel,
      required final String? applicationTransactionCounter,
      @JsonKey(fromJson: boolSafe) required final bool authorised,
      required final String? batchNo,
      required final String? budgetPeriod,
      required final CardDataInputMode? cardDataInputMode,
      required final String? cardSequenceNumber,
      @JsonKey(fromJson: intSafeToString) required final int cashBackAmount,
      required final String? cryptogramInformationData,
      required final String? currencyCode,
      final String? description,
      required final String? deviceType,
      @JsonKey(fromJson: intSafeToString) required final int id,
      @JsonKey(fromJson: boolSafe) required final bool isUserVoidable,
      required final String? issuerApplicationData,
      required final String? maskedPan,
      required final String? merchantId,
      required final String? posCodeData,
      @JsonKey(fromJson: intSafeToString)
      required final int previousTransaction,
      @JsonKey(fromJson: boolSafe) required final bool proccessedOnline,
      required final String? processingCode,
      required final String? responseCode,
      required final String? responseMessage,
      required final String? additionalData,
      required final String retrievalReferenceNumber,
      @JsonKey(fromJson: intSafeToString) required final int retryAttempts,
      @JsonKey(fromJson: intSafeToString) required final int sequenceNumber,
      @JsonKey(fromJson: boolSafe) required final bool settled,
      required final String? sredData,
      required final String? sredKsn,
      required final String? terminalCapabilities,
      required final String? terminalCountryCode,
      required final String terminalId,
      required final String? terminalVerificationResult,
      @JsonKey(fromJson: intSafeToString) required final int tipAmount,
      required final DateTime transactionDateTime,
      required final TransactionType? transactionType,
      required final String? unpredictableNumber}) = _$TransactionImpl;
  const _Transaction._() : super._();

  factory _Transaction.fromJson(Map<String, dynamic> json) =
      _$TransactionImpl.fromJson;

  @override
  String get account;
  @override
  @JsonKey(fromJson: intSafeToString)
  int get amount;
  @override
  String? get amountFees;
  @override
  String? get applicationCryptogram;
  @override
  String? get applicationIdentifier;
  @override
  String? get applicationInterchangeProfile;
  @override
  String? get applicationLabel;
  @override
  String? get applicationTransactionCounter;
  @override
  @JsonKey(fromJson: boolSafe)
  bool get authorised;
  @override
  String? get batchNo;
  @override
  String? get budgetPeriod;
  @override
  CardDataInputMode? get cardDataInputMode;
  @override
  String? get cardSequenceNumber;
  @override
  @JsonKey(fromJson: intSafeToString)
  int get cashBackAmount;
  @override
  String? get cryptogramInformationData;
  @override
  String? get currencyCode;
  @override
  String? get description;
  @override
  String? get deviceType;
  @override
  @JsonKey(fromJson: intSafeToString)
  int get id;
  @override
  @JsonKey(fromJson: boolSafe)
  bool get isUserVoidable;
  @override
  String? get issuerApplicationData;
  @override
  String? get maskedPan;
  @override
  String? get merchantId;
  @override
  String? get posCodeData;
  @override
  @JsonKey(fromJson: intSafeToString)
  int get previousTransaction;
  @override
  @JsonKey(fromJson: boolSafe)
  bool get proccessedOnline;
  @override
  String? get processingCode;
  @override
  String? get responseCode;
  @override
  String? get responseMessage;
  @override
  String? get additionalData;
  @override
  String get retrievalReferenceNumber;
  @override
  @JsonKey(fromJson: intSafeToString)
  int get retryAttempts;
  @override
  @JsonKey(fromJson: intSafeToString)
  int get sequenceNumber;
  @override
  @JsonKey(fromJson: boolSafe)
  bool get settled;
  @override
  String? get sredData;
  @override
  String? get sredKsn;
  @override
  String? get terminalCapabilities;
  @override
  String? get terminalCountryCode;
  @override
  String get terminalId;
  @override
  String? get terminalVerificationResult;
  @override
  @JsonKey(fromJson: intSafeToString)
  int get tipAmount;
  @override
  DateTime get transactionDateTime;
  @override
  TransactionType? get transactionType;
  @override
  String? get unpredictableNumber;

  /// Create a copy of Transaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionImplCopyWith<_$TransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
