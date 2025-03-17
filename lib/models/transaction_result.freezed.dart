// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransactionResult _$TransactionResultFromJson(Map<String, dynamic> json) {
  return _TransactionResult.fromJson(json);
}

/// @nodoc
mixin _$TransactionResult {
  @JsonKey(fromJson: arrayToString)
  String? get additionalData => throw _privateConstructorUsedError;
  @JsonKey(fromJson: arrayToString)
  String? get applicationIdentifier => throw _privateConstructorUsedError;
  List<int>? get authorizationCode => throw _privateConstructorUsedError;
  bool get canPrintReceipt => throw _privateConstructorUsedError;
  CardDataInputMode? get cardDataInputMode =>
      throw _privateConstructorUsedError;
  String? get cardSequenceNumber => throw _privateConstructorUsedError;
  List<int>? get cardVerificationMethod => throw _privateConstructorUsedError;
  String get declinedReason => throw _privateConstructorUsedError;
  bool get isCancelled => throw _privateConstructorUsedError;
  bool get isSuccessful => throw _privateConstructorUsedError;
  bool get isSupervisor => throw _privateConstructorUsedError;
  String? get merchantId => throw _privateConstructorUsedError;
  String? get merchantName => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String? get ourReferenceNumber => throw _privateConstructorUsedError;
  String? get pan => throw _privateConstructorUsedError;
  String? get stan => throw _privateConstructorUsedError;
  String? get priorityMessage => throw _privateConstructorUsedError;
  String? get receiptReference => throw _privateConstructorUsedError;
  String get responseCode => throw _privateConstructorUsedError;
  String? get responseMessage => throw _privateConstructorUsedError;
  String? get terminalId => throw _privateConstructorUsedError;
  int get transactionAmount => throw _privateConstructorUsedError;
  TransactionClientAction? get transactionClientAction =>
      throw _privateConstructorUsedError;
  String? get transactionDate => throw _privateConstructorUsedError;
  TransactionType? get transactionType => throw _privateConstructorUsedError;
  List<String>? get cardApplications => throw _privateConstructorUsedError;

  /// Serializes this TransactionResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransactionResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionResultCopyWith<TransactionResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionResultCopyWith<$Res> {
  factory $TransactionResultCopyWith(
          TransactionResult value, $Res Function(TransactionResult) then) =
      _$TransactionResultCopyWithImpl<$Res, TransactionResult>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: arrayToString) String? additionalData,
      @JsonKey(fromJson: arrayToString) String? applicationIdentifier,
      List<int>? authorizationCode,
      bool canPrintReceipt,
      CardDataInputMode? cardDataInputMode,
      String? cardSequenceNumber,
      List<int>? cardVerificationMethod,
      String declinedReason,
      bool isCancelled,
      bool isSuccessful,
      bool isSupervisor,
      String? merchantId,
      String? merchantName,
      String message,
      String? ourReferenceNumber,
      String? pan,
      String? stan,
      String? priorityMessage,
      String? receiptReference,
      String responseCode,
      String? responseMessage,
      String? terminalId,
      int transactionAmount,
      TransactionClientAction? transactionClientAction,
      String? transactionDate,
      TransactionType? transactionType,
      List<String>? cardApplications});
}

/// @nodoc
class _$TransactionResultCopyWithImpl<$Res, $Val extends TransactionResult>
    implements $TransactionResultCopyWith<$Res> {
  _$TransactionResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? additionalData = freezed,
    Object? applicationIdentifier = freezed,
    Object? authorizationCode = freezed,
    Object? canPrintReceipt = null,
    Object? cardDataInputMode = freezed,
    Object? cardSequenceNumber = freezed,
    Object? cardVerificationMethod = freezed,
    Object? declinedReason = null,
    Object? isCancelled = null,
    Object? isSuccessful = null,
    Object? isSupervisor = null,
    Object? merchantId = freezed,
    Object? merchantName = freezed,
    Object? message = null,
    Object? ourReferenceNumber = freezed,
    Object? pan = freezed,
    Object? stan = freezed,
    Object? priorityMessage = freezed,
    Object? receiptReference = freezed,
    Object? responseCode = null,
    Object? responseMessage = freezed,
    Object? terminalId = freezed,
    Object? transactionAmount = null,
    Object? transactionClientAction = freezed,
    Object? transactionDate = freezed,
    Object? transactionType = freezed,
    Object? cardApplications = freezed,
  }) {
    return _then(_value.copyWith(
      additionalData: freezed == additionalData
          ? _value.additionalData
          : additionalData // ignore: cast_nullable_to_non_nullable
              as String?,
      applicationIdentifier: freezed == applicationIdentifier
          ? _value.applicationIdentifier
          : applicationIdentifier // ignore: cast_nullable_to_non_nullable
              as String?,
      authorizationCode: freezed == authorizationCode
          ? _value.authorizationCode
          : authorizationCode // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      canPrintReceipt: null == canPrintReceipt
          ? _value.canPrintReceipt
          : canPrintReceipt // ignore: cast_nullable_to_non_nullable
              as bool,
      cardDataInputMode: freezed == cardDataInputMode
          ? _value.cardDataInputMode
          : cardDataInputMode // ignore: cast_nullable_to_non_nullable
              as CardDataInputMode?,
      cardSequenceNumber: freezed == cardSequenceNumber
          ? _value.cardSequenceNumber
          : cardSequenceNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      cardVerificationMethod: freezed == cardVerificationMethod
          ? _value.cardVerificationMethod
          : cardVerificationMethod // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      declinedReason: null == declinedReason
          ? _value.declinedReason
          : declinedReason // ignore: cast_nullable_to_non_nullable
              as String,
      isCancelled: null == isCancelled
          ? _value.isCancelled
          : isCancelled // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccessful: null == isSuccessful
          ? _value.isSuccessful
          : isSuccessful // ignore: cast_nullable_to_non_nullable
              as bool,
      isSupervisor: null == isSupervisor
          ? _value.isSupervisor
          : isSupervisor // ignore: cast_nullable_to_non_nullable
              as bool,
      merchantId: freezed == merchantId
          ? _value.merchantId
          : merchantId // ignore: cast_nullable_to_non_nullable
              as String?,
      merchantName: freezed == merchantName
          ? _value.merchantName
          : merchantName // ignore: cast_nullable_to_non_nullable
              as String?,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      ourReferenceNumber: freezed == ourReferenceNumber
          ? _value.ourReferenceNumber
          : ourReferenceNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      pan: freezed == pan
          ? _value.pan
          : pan // ignore: cast_nullable_to_non_nullable
              as String?,
      stan: freezed == stan
          ? _value.stan
          : stan // ignore: cast_nullable_to_non_nullable
              as String?,
      priorityMessage: freezed == priorityMessage
          ? _value.priorityMessage
          : priorityMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      receiptReference: freezed == receiptReference
          ? _value.receiptReference
          : receiptReference // ignore: cast_nullable_to_non_nullable
              as String?,
      responseCode: null == responseCode
          ? _value.responseCode
          : responseCode // ignore: cast_nullable_to_non_nullable
              as String,
      responseMessage: freezed == responseMessage
          ? _value.responseMessage
          : responseMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      terminalId: freezed == terminalId
          ? _value.terminalId
          : terminalId // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionAmount: null == transactionAmount
          ? _value.transactionAmount
          : transactionAmount // ignore: cast_nullable_to_non_nullable
              as int,
      transactionClientAction: freezed == transactionClientAction
          ? _value.transactionClientAction
          : transactionClientAction // ignore: cast_nullable_to_non_nullable
              as TransactionClientAction?,
      transactionDate: freezed == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionType: freezed == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as TransactionType?,
      cardApplications: freezed == cardApplications
          ? _value.cardApplications
          : cardApplications // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionResultImplCopyWith<$Res>
    implements $TransactionResultCopyWith<$Res> {
  factory _$$TransactionResultImplCopyWith(_$TransactionResultImpl value,
          $Res Function(_$TransactionResultImpl) then) =
      __$$TransactionResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: arrayToString) String? additionalData,
      @JsonKey(fromJson: arrayToString) String? applicationIdentifier,
      List<int>? authorizationCode,
      bool canPrintReceipt,
      CardDataInputMode? cardDataInputMode,
      String? cardSequenceNumber,
      List<int>? cardVerificationMethod,
      String declinedReason,
      bool isCancelled,
      bool isSuccessful,
      bool isSupervisor,
      String? merchantId,
      String? merchantName,
      String message,
      String? ourReferenceNumber,
      String? pan,
      String? stan,
      String? priorityMessage,
      String? receiptReference,
      String responseCode,
      String? responseMessage,
      String? terminalId,
      int transactionAmount,
      TransactionClientAction? transactionClientAction,
      String? transactionDate,
      TransactionType? transactionType,
      List<String>? cardApplications});
}

/// @nodoc
class __$$TransactionResultImplCopyWithImpl<$Res>
    extends _$TransactionResultCopyWithImpl<$Res, _$TransactionResultImpl>
    implements _$$TransactionResultImplCopyWith<$Res> {
  __$$TransactionResultImplCopyWithImpl(_$TransactionResultImpl _value,
      $Res Function(_$TransactionResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? additionalData = freezed,
    Object? applicationIdentifier = freezed,
    Object? authorizationCode = freezed,
    Object? canPrintReceipt = null,
    Object? cardDataInputMode = freezed,
    Object? cardSequenceNumber = freezed,
    Object? cardVerificationMethod = freezed,
    Object? declinedReason = null,
    Object? isCancelled = null,
    Object? isSuccessful = null,
    Object? isSupervisor = null,
    Object? merchantId = freezed,
    Object? merchantName = freezed,
    Object? message = null,
    Object? ourReferenceNumber = freezed,
    Object? pan = freezed,
    Object? stan = freezed,
    Object? priorityMessage = freezed,
    Object? receiptReference = freezed,
    Object? responseCode = null,
    Object? responseMessage = freezed,
    Object? terminalId = freezed,
    Object? transactionAmount = null,
    Object? transactionClientAction = freezed,
    Object? transactionDate = freezed,
    Object? transactionType = freezed,
    Object? cardApplications = freezed,
  }) {
    return _then(_$TransactionResultImpl(
      additionalData: freezed == additionalData
          ? _value.additionalData
          : additionalData // ignore: cast_nullable_to_non_nullable
              as String?,
      applicationIdentifier: freezed == applicationIdentifier
          ? _value.applicationIdentifier
          : applicationIdentifier // ignore: cast_nullable_to_non_nullable
              as String?,
      authorizationCode: freezed == authorizationCode
          ? _value._authorizationCode
          : authorizationCode // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      canPrintReceipt: null == canPrintReceipt
          ? _value.canPrintReceipt
          : canPrintReceipt // ignore: cast_nullable_to_non_nullable
              as bool,
      cardDataInputMode: freezed == cardDataInputMode
          ? _value.cardDataInputMode
          : cardDataInputMode // ignore: cast_nullable_to_non_nullable
              as CardDataInputMode?,
      cardSequenceNumber: freezed == cardSequenceNumber
          ? _value.cardSequenceNumber
          : cardSequenceNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      cardVerificationMethod: freezed == cardVerificationMethod
          ? _value._cardVerificationMethod
          : cardVerificationMethod // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      declinedReason: null == declinedReason
          ? _value.declinedReason
          : declinedReason // ignore: cast_nullable_to_non_nullable
              as String,
      isCancelled: null == isCancelled
          ? _value.isCancelled
          : isCancelled // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccessful: null == isSuccessful
          ? _value.isSuccessful
          : isSuccessful // ignore: cast_nullable_to_non_nullable
              as bool,
      isSupervisor: null == isSupervisor
          ? _value.isSupervisor
          : isSupervisor // ignore: cast_nullable_to_non_nullable
              as bool,
      merchantId: freezed == merchantId
          ? _value.merchantId
          : merchantId // ignore: cast_nullable_to_non_nullable
              as String?,
      merchantName: freezed == merchantName
          ? _value.merchantName
          : merchantName // ignore: cast_nullable_to_non_nullable
              as String?,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      ourReferenceNumber: freezed == ourReferenceNumber
          ? _value.ourReferenceNumber
          : ourReferenceNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      pan: freezed == pan
          ? _value.pan
          : pan // ignore: cast_nullable_to_non_nullable
              as String?,
      stan: freezed == stan
          ? _value.stan
          : stan // ignore: cast_nullable_to_non_nullable
              as String?,
      priorityMessage: freezed == priorityMessage
          ? _value.priorityMessage
          : priorityMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      receiptReference: freezed == receiptReference
          ? _value.receiptReference
          : receiptReference // ignore: cast_nullable_to_non_nullable
              as String?,
      responseCode: null == responseCode
          ? _value.responseCode
          : responseCode // ignore: cast_nullable_to_non_nullable
              as String,
      responseMessage: freezed == responseMessage
          ? _value.responseMessage
          : responseMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      terminalId: freezed == terminalId
          ? _value.terminalId
          : terminalId // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionAmount: null == transactionAmount
          ? _value.transactionAmount
          : transactionAmount // ignore: cast_nullable_to_non_nullable
              as int,
      transactionClientAction: freezed == transactionClientAction
          ? _value.transactionClientAction
          : transactionClientAction // ignore: cast_nullable_to_non_nullable
              as TransactionClientAction?,
      transactionDate: freezed == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionType: freezed == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as TransactionType?,
      cardApplications: freezed == cardApplications
          ? _value._cardApplications
          : cardApplications // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionResultImpl extends _TransactionResult {
  const _$TransactionResultImpl(
      {@JsonKey(fromJson: arrayToString) this.additionalData,
      @JsonKey(fromJson: arrayToString) this.applicationIdentifier,
      final List<int>? authorizationCode,
      required this.canPrintReceipt,
      this.cardDataInputMode,
      this.cardSequenceNumber,
      final List<int>? cardVerificationMethod,
      required this.declinedReason,
      required this.isCancelled,
      required this.isSuccessful,
      required this.isSupervisor,
      this.merchantId,
      this.merchantName,
      required this.message,
      this.ourReferenceNumber,
      this.pan,
      this.stan,
      this.priorityMessage,
      this.receiptReference,
      required this.responseCode,
      required this.responseMessage,
      this.terminalId,
      required this.transactionAmount,
      required this.transactionClientAction,
      this.transactionDate,
      this.transactionType,
      final List<String>? cardApplications})
      : _authorizationCode = authorizationCode,
        _cardVerificationMethod = cardVerificationMethod,
        _cardApplications = cardApplications,
        super._();

  factory _$TransactionResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionResultImplFromJson(json);

  @override
  @JsonKey(fromJson: arrayToString)
  final String? additionalData;
  @override
  @JsonKey(fromJson: arrayToString)
  final String? applicationIdentifier;
  final List<int>? _authorizationCode;
  @override
  List<int>? get authorizationCode {
    final value = _authorizationCode;
    if (value == null) return null;
    if (_authorizationCode is EqualUnmodifiableListView)
      return _authorizationCode;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool canPrintReceipt;
  @override
  final CardDataInputMode? cardDataInputMode;
  @override
  final String? cardSequenceNumber;
  final List<int>? _cardVerificationMethod;
  @override
  List<int>? get cardVerificationMethod {
    final value = _cardVerificationMethod;
    if (value == null) return null;
    if (_cardVerificationMethod is EqualUnmodifiableListView)
      return _cardVerificationMethod;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String declinedReason;
  @override
  final bool isCancelled;
  @override
  final bool isSuccessful;
  @override
  final bool isSupervisor;
  @override
  final String? merchantId;
  @override
  final String? merchantName;
  @override
  final String message;
  @override
  final String? ourReferenceNumber;
  @override
  final String? pan;
  @override
  final String? stan;
  @override
  final String? priorityMessage;
  @override
  final String? receiptReference;
  @override
  final String responseCode;
  @override
  final String? responseMessage;
  @override
  final String? terminalId;
  @override
  final int transactionAmount;
  @override
  final TransactionClientAction? transactionClientAction;
  @override
  final String? transactionDate;
  @override
  final TransactionType? transactionType;
  final List<String>? _cardApplications;
  @override
  List<String>? get cardApplications {
    final value = _cardApplications;
    if (value == null) return null;
    if (_cardApplications is EqualUnmodifiableListView)
      return _cardApplications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TransactionResult(additionalData: $additionalData, applicationIdentifier: $applicationIdentifier, authorizationCode: $authorizationCode, canPrintReceipt: $canPrintReceipt, cardDataInputMode: $cardDataInputMode, cardSequenceNumber: $cardSequenceNumber, cardVerificationMethod: $cardVerificationMethod, declinedReason: $declinedReason, isCancelled: $isCancelled, isSuccessful: $isSuccessful, isSupervisor: $isSupervisor, merchantId: $merchantId, merchantName: $merchantName, message: $message, ourReferenceNumber: $ourReferenceNumber, pan: $pan, stan: $stan, priorityMessage: $priorityMessage, receiptReference: $receiptReference, responseCode: $responseCode, responseMessage: $responseMessage, terminalId: $terminalId, transactionAmount: $transactionAmount, transactionClientAction: $transactionClientAction, transactionDate: $transactionDate, transactionType: $transactionType, cardApplications: $cardApplications)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionResultImpl &&
            (identical(other.additionalData, additionalData) ||
                other.additionalData == additionalData) &&
            (identical(other.applicationIdentifier, applicationIdentifier) ||
                other.applicationIdentifier == applicationIdentifier) &&
            const DeepCollectionEquality()
                .equals(other._authorizationCode, _authorizationCode) &&
            (identical(other.canPrintReceipt, canPrintReceipt) ||
                other.canPrintReceipt == canPrintReceipt) &&
            (identical(other.cardDataInputMode, cardDataInputMode) ||
                other.cardDataInputMode == cardDataInputMode) &&
            (identical(other.cardSequenceNumber, cardSequenceNumber) ||
                other.cardSequenceNumber == cardSequenceNumber) &&
            const DeepCollectionEquality().equals(
                other._cardVerificationMethod, _cardVerificationMethod) &&
            (identical(other.declinedReason, declinedReason) ||
                other.declinedReason == declinedReason) &&
            (identical(other.isCancelled, isCancelled) ||
                other.isCancelled == isCancelled) &&
            (identical(other.isSuccessful, isSuccessful) ||
                other.isSuccessful == isSuccessful) &&
            (identical(other.isSupervisor, isSupervisor) ||
                other.isSupervisor == isSupervisor) &&
            (identical(other.merchantId, merchantId) ||
                other.merchantId == merchantId) &&
            (identical(other.merchantName, merchantName) ||
                other.merchantName == merchantName) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.ourReferenceNumber, ourReferenceNumber) ||
                other.ourReferenceNumber == ourReferenceNumber) &&
            (identical(other.pan, pan) || other.pan == pan) &&
            (identical(other.stan, stan) || other.stan == stan) &&
            (identical(other.priorityMessage, priorityMessage) ||
                other.priorityMessage == priorityMessage) &&
            (identical(other.receiptReference, receiptReference) ||
                other.receiptReference == receiptReference) &&
            (identical(other.responseCode, responseCode) ||
                other.responseCode == responseCode) &&
            (identical(other.responseMessage, responseMessage) ||
                other.responseMessage == responseMessage) &&
            (identical(other.terminalId, terminalId) ||
                other.terminalId == terminalId) &&
            (identical(other.transactionAmount, transactionAmount) ||
                other.transactionAmount == transactionAmount) &&
            (identical(
                    other.transactionClientAction, transactionClientAction) ||
                other.transactionClientAction == transactionClientAction) &&
            (identical(other.transactionDate, transactionDate) ||
                other.transactionDate == transactionDate) &&
            (identical(other.transactionType, transactionType) ||
                other.transactionType == transactionType) &&
            const DeepCollectionEquality()
                .equals(other._cardApplications, _cardApplications));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        additionalData,
        applicationIdentifier,
        const DeepCollectionEquality().hash(_authorizationCode),
        canPrintReceipt,
        cardDataInputMode,
        cardSequenceNumber,
        const DeepCollectionEquality().hash(_cardVerificationMethod),
        declinedReason,
        isCancelled,
        isSuccessful,
        isSupervisor,
        merchantId,
        merchantName,
        message,
        ourReferenceNumber,
        pan,
        stan,
        priorityMessage,
        receiptReference,
        responseCode,
        responseMessage,
        terminalId,
        transactionAmount,
        transactionClientAction,
        transactionDate,
        transactionType,
        const DeepCollectionEquality().hash(_cardApplications)
      ]);

  /// Create a copy of TransactionResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionResultImplCopyWith<_$TransactionResultImpl> get copyWith =>
      __$$TransactionResultImplCopyWithImpl<_$TransactionResultImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionResultImplToJson(
      this,
    );
  }
}

abstract class _TransactionResult extends TransactionResult {
  const factory _TransactionResult(
      {@JsonKey(fromJson: arrayToString) final String? additionalData,
      @JsonKey(fromJson: arrayToString) final String? applicationIdentifier,
      final List<int>? authorizationCode,
      required final bool canPrintReceipt,
      final CardDataInputMode? cardDataInputMode,
      final String? cardSequenceNumber,
      final List<int>? cardVerificationMethod,
      required final String declinedReason,
      required final bool isCancelled,
      required final bool isSuccessful,
      required final bool isSupervisor,
      final String? merchantId,
      final String? merchantName,
      required final String message,
      final String? ourReferenceNumber,
      final String? pan,
      final String? stan,
      final String? priorityMessage,
      final String? receiptReference,
      required final String responseCode,
      required final String? responseMessage,
      final String? terminalId,
      required final int transactionAmount,
      required final TransactionClientAction? transactionClientAction,
      final String? transactionDate,
      final TransactionType? transactionType,
      final List<String>? cardApplications}) = _$TransactionResultImpl;
  const _TransactionResult._() : super._();

  factory _TransactionResult.fromJson(Map<String, dynamic> json) =
      _$TransactionResultImpl.fromJson;

  @override
  @JsonKey(fromJson: arrayToString)
  String? get additionalData;
  @override
  @JsonKey(fromJson: arrayToString)
  String? get applicationIdentifier;
  @override
  List<int>? get authorizationCode;
  @override
  bool get canPrintReceipt;
  @override
  CardDataInputMode? get cardDataInputMode;
  @override
  String? get cardSequenceNumber;
  @override
  List<int>? get cardVerificationMethod;
  @override
  String get declinedReason;
  @override
  bool get isCancelled;
  @override
  bool get isSuccessful;
  @override
  bool get isSupervisor;
  @override
  String? get merchantId;
  @override
  String? get merchantName;
  @override
  String get message;
  @override
  String? get ourReferenceNumber;
  @override
  String? get pan;
  @override
  String? get stan;
  @override
  String? get priorityMessage;
  @override
  String? get receiptReference;
  @override
  String get responseCode;
  @override
  String? get responseMessage;
  @override
  String? get terminalId;
  @override
  int get transactionAmount;
  @override
  TransactionClientAction? get transactionClientAction;
  @override
  String? get transactionDate;
  @override
  TransactionType? get transactionType;
  @override
  List<String>? get cardApplications;

  /// Create a copy of TransactionResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionResultImplCopyWith<_$TransactionResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
