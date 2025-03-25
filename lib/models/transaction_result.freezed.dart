// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TransactionResult {
  @JsonKey(fromJson: arrayToString)
  String? get additionalData;
  @JsonKey(fromJson: arrayToString)
  String? get applicationIdentifier;
  List<int>? get authorizationCode;
  bool get canPrintReceipt;
  @JsonKey(unknownEnumValue: CardDataInputMode.ContactlessIntegratedCircuitCard)
  CardDataInputMode? get cardDataInputMode;
  String? get cardSequenceNumber;
  List<int>? get cardVerificationMethod;
  String get declinedReason;
  bool get isCancelled;
  bool get isSuccessful;
  bool get isSupervisor;
  String? get merchantId;
  String? get merchantName;
  String get message;
  String? get ourReferenceNumber;
  String? get pan;
  String? get stan;
  String? get priorityMessage;
  String? get receiptReference;
  String get responseCode;
  String? get responseMessage;
  String? get terminalId;
  int get transactionAmount;
  @JsonKey(unknownEnumValue: TransactionClientAction.UNKNOWN)
  TransactionClientAction? get transactionClientAction;
  String? get transactionDate;
  @JsonKey(unknownEnumValue: TransactionType.P)
  TransactionType? get transactionType;
  List<String>? get cardApplications;

  /// Create a copy of TransactionResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TransactionResultCopyWith<TransactionResult> get copyWith =>
      _$TransactionResultCopyWithImpl<TransactionResult>(
          this as TransactionResult, _$identity);

  /// Serializes this TransactionResult to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TransactionResult &&
            (identical(other.additionalData, additionalData) ||
                other.additionalData == additionalData) &&
            (identical(other.applicationIdentifier, applicationIdentifier) ||
                other.applicationIdentifier == applicationIdentifier) &&
            const DeepCollectionEquality()
                .equals(other.authorizationCode, authorizationCode) &&
            (identical(other.canPrintReceipt, canPrintReceipt) ||
                other.canPrintReceipt == canPrintReceipt) &&
            (identical(other.cardDataInputMode, cardDataInputMode) ||
                other.cardDataInputMode == cardDataInputMode) &&
            (identical(other.cardSequenceNumber, cardSequenceNumber) ||
                other.cardSequenceNumber == cardSequenceNumber) &&
            const DeepCollectionEquality()
                .equals(other.cardVerificationMethod, cardVerificationMethod) &&
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
                .equals(other.cardApplications, cardApplications));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        additionalData,
        applicationIdentifier,
        const DeepCollectionEquality().hash(authorizationCode),
        canPrintReceipt,
        cardDataInputMode,
        cardSequenceNumber,
        const DeepCollectionEquality().hash(cardVerificationMethod),
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
        const DeepCollectionEquality().hash(cardApplications)
      ]);

  @override
  String toString() {
    return 'TransactionResult(additionalData: $additionalData, applicationIdentifier: $applicationIdentifier, authorizationCode: $authorizationCode, canPrintReceipt: $canPrintReceipt, cardDataInputMode: $cardDataInputMode, cardSequenceNumber: $cardSequenceNumber, cardVerificationMethod: $cardVerificationMethod, declinedReason: $declinedReason, isCancelled: $isCancelled, isSuccessful: $isSuccessful, isSupervisor: $isSupervisor, merchantId: $merchantId, merchantName: $merchantName, message: $message, ourReferenceNumber: $ourReferenceNumber, pan: $pan, stan: $stan, priorityMessage: $priorityMessage, receiptReference: $receiptReference, responseCode: $responseCode, responseMessage: $responseMessage, terminalId: $terminalId, transactionAmount: $transactionAmount, transactionClientAction: $transactionClientAction, transactionDate: $transactionDate, transactionType: $transactionType, cardApplications: $cardApplications)';
  }
}

/// @nodoc
abstract mixin class $TransactionResultCopyWith<$Res> {
  factory $TransactionResultCopyWith(
          TransactionResult value, $Res Function(TransactionResult) _then) =
      _$TransactionResultCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(fromJson: arrayToString) String? additionalData,
      @JsonKey(fromJson: arrayToString) String? applicationIdentifier,
      List<int>? authorizationCode,
      bool canPrintReceipt,
      @JsonKey(
          unknownEnumValue: CardDataInputMode.ContactlessIntegratedCircuitCard)
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
      @JsonKey(unknownEnumValue: TransactionClientAction.UNKNOWN)
      TransactionClientAction? transactionClientAction,
      String? transactionDate,
      @JsonKey(unknownEnumValue: TransactionType.P)
      TransactionType? transactionType,
      List<String>? cardApplications});
}

/// @nodoc
class _$TransactionResultCopyWithImpl<$Res>
    implements $TransactionResultCopyWith<$Res> {
  _$TransactionResultCopyWithImpl(this._self, this._then);

  final TransactionResult _self;
  final $Res Function(TransactionResult) _then;

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
    return _then(_self.copyWith(
      additionalData: freezed == additionalData
          ? _self.additionalData
          : additionalData // ignore: cast_nullable_to_non_nullable
              as String?,
      applicationIdentifier: freezed == applicationIdentifier
          ? _self.applicationIdentifier
          : applicationIdentifier // ignore: cast_nullable_to_non_nullable
              as String?,
      authorizationCode: freezed == authorizationCode
          ? _self.authorizationCode
          : authorizationCode // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      canPrintReceipt: null == canPrintReceipt
          ? _self.canPrintReceipt
          : canPrintReceipt // ignore: cast_nullable_to_non_nullable
              as bool,
      cardDataInputMode: freezed == cardDataInputMode
          ? _self.cardDataInputMode
          : cardDataInputMode // ignore: cast_nullable_to_non_nullable
              as CardDataInputMode?,
      cardSequenceNumber: freezed == cardSequenceNumber
          ? _self.cardSequenceNumber
          : cardSequenceNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      cardVerificationMethod: freezed == cardVerificationMethod
          ? _self.cardVerificationMethod
          : cardVerificationMethod // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      declinedReason: null == declinedReason
          ? _self.declinedReason
          : declinedReason // ignore: cast_nullable_to_non_nullable
              as String,
      isCancelled: null == isCancelled
          ? _self.isCancelled
          : isCancelled // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccessful: null == isSuccessful
          ? _self.isSuccessful
          : isSuccessful // ignore: cast_nullable_to_non_nullable
              as bool,
      isSupervisor: null == isSupervisor
          ? _self.isSupervisor
          : isSupervisor // ignore: cast_nullable_to_non_nullable
              as bool,
      merchantId: freezed == merchantId
          ? _self.merchantId
          : merchantId // ignore: cast_nullable_to_non_nullable
              as String?,
      merchantName: freezed == merchantName
          ? _self.merchantName
          : merchantName // ignore: cast_nullable_to_non_nullable
              as String?,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      ourReferenceNumber: freezed == ourReferenceNumber
          ? _self.ourReferenceNumber
          : ourReferenceNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      pan: freezed == pan
          ? _self.pan
          : pan // ignore: cast_nullable_to_non_nullable
              as String?,
      stan: freezed == stan
          ? _self.stan
          : stan // ignore: cast_nullable_to_non_nullable
              as String?,
      priorityMessage: freezed == priorityMessage
          ? _self.priorityMessage
          : priorityMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      receiptReference: freezed == receiptReference
          ? _self.receiptReference
          : receiptReference // ignore: cast_nullable_to_non_nullable
              as String?,
      responseCode: null == responseCode
          ? _self.responseCode
          : responseCode // ignore: cast_nullable_to_non_nullable
              as String,
      responseMessage: freezed == responseMessage
          ? _self.responseMessage
          : responseMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      terminalId: freezed == terminalId
          ? _self.terminalId
          : terminalId // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionAmount: null == transactionAmount
          ? _self.transactionAmount
          : transactionAmount // ignore: cast_nullable_to_non_nullable
              as int,
      transactionClientAction: freezed == transactionClientAction
          ? _self.transactionClientAction
          : transactionClientAction // ignore: cast_nullable_to_non_nullable
              as TransactionClientAction?,
      transactionDate: freezed == transactionDate
          ? _self.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionType: freezed == transactionType
          ? _self.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as TransactionType?,
      cardApplications: freezed == cardApplications
          ? _self.cardApplications
          : cardApplications // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _TransactionResult extends TransactionResult {
  const _TransactionResult(
      {@JsonKey(fromJson: arrayToString) this.additionalData,
      @JsonKey(fromJson: arrayToString) this.applicationIdentifier,
      final List<int>? authorizationCode,
      required this.canPrintReceipt,
      @JsonKey(
          unknownEnumValue: CardDataInputMode.ContactlessIntegratedCircuitCard)
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
      @JsonKey(unknownEnumValue: TransactionClientAction.UNKNOWN)
      required this.transactionClientAction,
      this.transactionDate,
      @JsonKey(unknownEnumValue: TransactionType.P) this.transactionType,
      final List<String>? cardApplications})
      : _authorizationCode = authorizationCode,
        _cardVerificationMethod = cardVerificationMethod,
        _cardApplications = cardApplications,
        super._();
  factory _TransactionResult.fromJson(Map<String, dynamic> json) =>
      _$TransactionResultFromJson(json);

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
  @JsonKey(unknownEnumValue: CardDataInputMode.ContactlessIntegratedCircuitCard)
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
  @JsonKey(unknownEnumValue: TransactionClientAction.UNKNOWN)
  final TransactionClientAction? transactionClientAction;
  @override
  final String? transactionDate;
  @override
  @JsonKey(unknownEnumValue: TransactionType.P)
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

  /// Create a copy of TransactionResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TransactionResultCopyWith<_TransactionResult> get copyWith =>
      __$TransactionResultCopyWithImpl<_TransactionResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TransactionResultToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TransactionResult &&
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

  @override
  String toString() {
    return 'TransactionResult(additionalData: $additionalData, applicationIdentifier: $applicationIdentifier, authorizationCode: $authorizationCode, canPrintReceipt: $canPrintReceipt, cardDataInputMode: $cardDataInputMode, cardSequenceNumber: $cardSequenceNumber, cardVerificationMethod: $cardVerificationMethod, declinedReason: $declinedReason, isCancelled: $isCancelled, isSuccessful: $isSuccessful, isSupervisor: $isSupervisor, merchantId: $merchantId, merchantName: $merchantName, message: $message, ourReferenceNumber: $ourReferenceNumber, pan: $pan, stan: $stan, priorityMessage: $priorityMessage, receiptReference: $receiptReference, responseCode: $responseCode, responseMessage: $responseMessage, terminalId: $terminalId, transactionAmount: $transactionAmount, transactionClientAction: $transactionClientAction, transactionDate: $transactionDate, transactionType: $transactionType, cardApplications: $cardApplications)';
  }
}

/// @nodoc
abstract mixin class _$TransactionResultCopyWith<$Res>
    implements $TransactionResultCopyWith<$Res> {
  factory _$TransactionResultCopyWith(
          _TransactionResult value, $Res Function(_TransactionResult) _then) =
      __$TransactionResultCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: arrayToString) String? additionalData,
      @JsonKey(fromJson: arrayToString) String? applicationIdentifier,
      List<int>? authorizationCode,
      bool canPrintReceipt,
      @JsonKey(
          unknownEnumValue: CardDataInputMode.ContactlessIntegratedCircuitCard)
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
      @JsonKey(unknownEnumValue: TransactionClientAction.UNKNOWN)
      TransactionClientAction? transactionClientAction,
      String? transactionDate,
      @JsonKey(unknownEnumValue: TransactionType.P)
      TransactionType? transactionType,
      List<String>? cardApplications});
}

/// @nodoc
class __$TransactionResultCopyWithImpl<$Res>
    implements _$TransactionResultCopyWith<$Res> {
  __$TransactionResultCopyWithImpl(this._self, this._then);

  final _TransactionResult _self;
  final $Res Function(_TransactionResult) _then;

  /// Create a copy of TransactionResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_TransactionResult(
      additionalData: freezed == additionalData
          ? _self.additionalData
          : additionalData // ignore: cast_nullable_to_non_nullable
              as String?,
      applicationIdentifier: freezed == applicationIdentifier
          ? _self.applicationIdentifier
          : applicationIdentifier // ignore: cast_nullable_to_non_nullable
              as String?,
      authorizationCode: freezed == authorizationCode
          ? _self._authorizationCode
          : authorizationCode // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      canPrintReceipt: null == canPrintReceipt
          ? _self.canPrintReceipt
          : canPrintReceipt // ignore: cast_nullable_to_non_nullable
              as bool,
      cardDataInputMode: freezed == cardDataInputMode
          ? _self.cardDataInputMode
          : cardDataInputMode // ignore: cast_nullable_to_non_nullable
              as CardDataInputMode?,
      cardSequenceNumber: freezed == cardSequenceNumber
          ? _self.cardSequenceNumber
          : cardSequenceNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      cardVerificationMethod: freezed == cardVerificationMethod
          ? _self._cardVerificationMethod
          : cardVerificationMethod // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      declinedReason: null == declinedReason
          ? _self.declinedReason
          : declinedReason // ignore: cast_nullable_to_non_nullable
              as String,
      isCancelled: null == isCancelled
          ? _self.isCancelled
          : isCancelled // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccessful: null == isSuccessful
          ? _self.isSuccessful
          : isSuccessful // ignore: cast_nullable_to_non_nullable
              as bool,
      isSupervisor: null == isSupervisor
          ? _self.isSupervisor
          : isSupervisor // ignore: cast_nullable_to_non_nullable
              as bool,
      merchantId: freezed == merchantId
          ? _self.merchantId
          : merchantId // ignore: cast_nullable_to_non_nullable
              as String?,
      merchantName: freezed == merchantName
          ? _self.merchantName
          : merchantName // ignore: cast_nullable_to_non_nullable
              as String?,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      ourReferenceNumber: freezed == ourReferenceNumber
          ? _self.ourReferenceNumber
          : ourReferenceNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      pan: freezed == pan
          ? _self.pan
          : pan // ignore: cast_nullable_to_non_nullable
              as String?,
      stan: freezed == stan
          ? _self.stan
          : stan // ignore: cast_nullable_to_non_nullable
              as String?,
      priorityMessage: freezed == priorityMessage
          ? _self.priorityMessage
          : priorityMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      receiptReference: freezed == receiptReference
          ? _self.receiptReference
          : receiptReference // ignore: cast_nullable_to_non_nullable
              as String?,
      responseCode: null == responseCode
          ? _self.responseCode
          : responseCode // ignore: cast_nullable_to_non_nullable
              as String,
      responseMessage: freezed == responseMessage
          ? _self.responseMessage
          : responseMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      terminalId: freezed == terminalId
          ? _self.terminalId
          : terminalId // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionAmount: null == transactionAmount
          ? _self.transactionAmount
          : transactionAmount // ignore: cast_nullable_to_non_nullable
              as int,
      transactionClientAction: freezed == transactionClientAction
          ? _self.transactionClientAction
          : transactionClientAction // ignore: cast_nullable_to_non_nullable
              as TransactionClientAction?,
      transactionDate: freezed == transactionDate
          ? _self.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionType: freezed == transactionType
          ? _self.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as TransactionType?,
      cardApplications: freezed == cardApplications
          ? _self._cardApplications
          : cardApplications // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

// dart format on
