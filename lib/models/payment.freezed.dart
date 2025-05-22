// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Payment {
  int get amount;
  int get cashbackAmount;
  PaymentType? get type;
  bool? get cashbackOnly;
  String? get rrn;
  String? get uniqueId;

  /// Create a copy of Payment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PaymentCopyWith<Payment> get copyWith =>
      _$PaymentCopyWithImpl<Payment>(this as Payment, _$identity);

  /// Serializes this Payment to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Payment &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.cashbackAmount, cashbackAmount) ||
                other.cashbackAmount == cashbackAmount) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.cashbackOnly, cashbackOnly) ||
                other.cashbackOnly == cashbackOnly) &&
            (identical(other.rrn, rrn) || other.rrn == rrn) &&
            (identical(other.uniqueId, uniqueId) ||
                other.uniqueId == uniqueId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, amount, cashbackAmount, type, cashbackOnly, rrn, uniqueId);

  @override
  String toString() {
    return 'Payment(amount: $amount, cashbackAmount: $cashbackAmount, type: $type, cashbackOnly: $cashbackOnly, rrn: $rrn, uniqueId: $uniqueId)';
  }
}

/// @nodoc
abstract mixin class $PaymentCopyWith<$Res> {
  factory $PaymentCopyWith(Payment value, $Res Function(Payment) _then) =
      _$PaymentCopyWithImpl;
  @useResult
  $Res call(
      {int amount,
      int cashbackAmount,
      PaymentType? type,
      bool? cashbackOnly,
      String? rrn,
      String? uniqueId});
}

/// @nodoc
class _$PaymentCopyWithImpl<$Res> implements $PaymentCopyWith<$Res> {
  _$PaymentCopyWithImpl(this._self, this._then);

  final Payment _self;
  final $Res Function(Payment) _then;

  /// Create a copy of Payment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? cashbackAmount = null,
    Object? type = freezed,
    Object? cashbackOnly = freezed,
    Object? rrn = freezed,
    Object? uniqueId = freezed,
  }) {
    return _then(_self.copyWith(
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      cashbackAmount: null == cashbackAmount
          ? _self.cashbackAmount
          : cashbackAmount // ignore: cast_nullable_to_non_nullable
              as int,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as PaymentType?,
      cashbackOnly: freezed == cashbackOnly
          ? _self.cashbackOnly
          : cashbackOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
      rrn: freezed == rrn
          ? _self.rrn
          : rrn // ignore: cast_nullable_to_non_nullable
              as String?,
      uniqueId: freezed == uniqueId
          ? _self.uniqueId
          : uniqueId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Payment extends Payment {
  _Payment(
      {this.amount = 0,
      this.cashbackAmount = 0,
      this.type = PaymentType.payment,
      this.cashbackOnly = false,
      this.rrn = null,
      this.uniqueId = null})
      : super._();
  factory _Payment.fromJson(Map<String, dynamic> json) =>
      _$PaymentFromJson(json);

  @override
  @JsonKey()
  final int amount;
  @override
  @JsonKey()
  final int cashbackAmount;
  @override
  @JsonKey()
  final PaymentType? type;
  @override
  @JsonKey()
  final bool? cashbackOnly;
  @override
  @JsonKey()
  final String? rrn;
  @override
  @JsonKey()
  final String? uniqueId;

  /// Create a copy of Payment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PaymentCopyWith<_Payment> get copyWith =>
      __$PaymentCopyWithImpl<_Payment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PaymentToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Payment &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.cashbackAmount, cashbackAmount) ||
                other.cashbackAmount == cashbackAmount) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.cashbackOnly, cashbackOnly) ||
                other.cashbackOnly == cashbackOnly) &&
            (identical(other.rrn, rrn) || other.rrn == rrn) &&
            (identical(other.uniqueId, uniqueId) ||
                other.uniqueId == uniqueId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, amount, cashbackAmount, type, cashbackOnly, rrn, uniqueId);

  @override
  String toString() {
    return 'Payment(amount: $amount, cashbackAmount: $cashbackAmount, type: $type, cashbackOnly: $cashbackOnly, rrn: $rrn, uniqueId: $uniqueId)';
  }
}

/// @nodoc
abstract mixin class _$PaymentCopyWith<$Res> implements $PaymentCopyWith<$Res> {
  factory _$PaymentCopyWith(_Payment value, $Res Function(_Payment) _then) =
      __$PaymentCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int amount,
      int cashbackAmount,
      PaymentType? type,
      bool? cashbackOnly,
      String? rrn,
      String? uniqueId});
}

/// @nodoc
class __$PaymentCopyWithImpl<$Res> implements _$PaymentCopyWith<$Res> {
  __$PaymentCopyWithImpl(this._self, this._then);

  final _Payment _self;
  final $Res Function(_Payment) _then;

  /// Create a copy of Payment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? amount = null,
    Object? cashbackAmount = null,
    Object? type = freezed,
    Object? cashbackOnly = freezed,
    Object? rrn = freezed,
    Object? uniqueId = freezed,
  }) {
    return _then(_Payment(
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      cashbackAmount: null == cashbackAmount
          ? _self.cashbackAmount
          : cashbackAmount // ignore: cast_nullable_to_non_nullable
              as int,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as PaymentType?,
      cashbackOnly: freezed == cashbackOnly
          ? _self.cashbackOnly
          : cashbackOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
      rrn: freezed == rrn
          ? _self.rrn
          : rrn // ignore: cast_nullable_to_non_nullable
              as String?,
      uniqueId: freezed == uniqueId
          ? _self.uniqueId
          : uniqueId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
