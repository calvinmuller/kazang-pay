// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Payment _$PaymentFromJson(Map<String, dynamic> json) {
  return _Payment.fromJson(json);
}

/// @nodoc
mixin _$Payment {
  int get amount => throw _privateConstructorUsedError;
  dynamic get cashbackAmount => throw _privateConstructorUsedError;
  PaymentType? get type => throw _privateConstructorUsedError;
  bool? get cashbackOnly => throw _privateConstructorUsedError;
  String? get rrn => throw _privateConstructorUsedError;

  /// Serializes this Payment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Payment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentCopyWith<Payment> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentCopyWith<$Res> {
  factory $PaymentCopyWith(Payment value, $Res Function(Payment) then) =
      _$PaymentCopyWithImpl<$Res, Payment>;
  @useResult
  $Res call(
      {int amount,
      dynamic cashbackAmount,
      PaymentType? type,
      bool? cashbackOnly,
      String? rrn});
}

/// @nodoc
class _$PaymentCopyWithImpl<$Res, $Val extends Payment>
    implements $PaymentCopyWith<$Res> {
  _$PaymentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Payment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? cashbackAmount = freezed,
    Object? type = freezed,
    Object? cashbackOnly = freezed,
    Object? rrn = freezed,
  }) {
    return _then(_value.copyWith(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      cashbackAmount: freezed == cashbackAmount
          ? _value.cashbackAmount
          : cashbackAmount // ignore: cast_nullable_to_non_nullable
              as dynamic,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PaymentType?,
      cashbackOnly: freezed == cashbackOnly
          ? _value.cashbackOnly
          : cashbackOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
      rrn: freezed == rrn
          ? _value.rrn
          : rrn // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentImplCopyWith<$Res> implements $PaymentCopyWith<$Res> {
  factory _$$PaymentImplCopyWith(
          _$PaymentImpl value, $Res Function(_$PaymentImpl) then) =
      __$$PaymentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int amount,
      dynamic cashbackAmount,
      PaymentType? type,
      bool? cashbackOnly,
      String? rrn});
}

/// @nodoc
class __$$PaymentImplCopyWithImpl<$Res>
    extends _$PaymentCopyWithImpl<$Res, _$PaymentImpl>
    implements _$$PaymentImplCopyWith<$Res> {
  __$$PaymentImplCopyWithImpl(
      _$PaymentImpl _value, $Res Function(_$PaymentImpl) _then)
      : super(_value, _then);

  /// Create a copy of Payment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? cashbackAmount = freezed,
    Object? type = freezed,
    Object? cashbackOnly = freezed,
    Object? rrn = freezed,
  }) {
    return _then(_$PaymentImpl(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      cashbackAmount:
          freezed == cashbackAmount ? _value.cashbackAmount! : cashbackAmount,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PaymentType?,
      cashbackOnly: freezed == cashbackOnly
          ? _value.cashbackOnly
          : cashbackOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
      rrn: freezed == rrn
          ? _value.rrn
          : rrn // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentImpl extends _Payment {
  _$PaymentImpl(
      {this.amount = 0,
      this.cashbackAmount = 0,
      this.type = PaymentType.payment,
      this.cashbackOnly = false,
      this.rrn = null})
      : super._();

  factory _$PaymentImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentImplFromJson(json);

  @override
  @JsonKey()
  final int amount;
  @override
  @JsonKey()
  final dynamic cashbackAmount;
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
  String toString() {
    return 'Payment(amount: $amount, cashbackAmount: $cashbackAmount, type: $type, cashbackOnly: $cashbackOnly, rrn: $rrn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            const DeepCollectionEquality()
                .equals(other.cashbackAmount, cashbackAmount) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.cashbackOnly, cashbackOnly) ||
                other.cashbackOnly == cashbackOnly) &&
            (identical(other.rrn, rrn) || other.rrn == rrn));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      amount,
      const DeepCollectionEquality().hash(cashbackAmount),
      type,
      cashbackOnly,
      rrn);

  /// Create a copy of Payment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentImplCopyWith<_$PaymentImpl> get copyWith =>
      __$$PaymentImplCopyWithImpl<_$PaymentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentImplToJson(
      this,
    );
  }
}

abstract class _Payment extends Payment {
  factory _Payment(
      {final int amount,
      final dynamic cashbackAmount,
      final PaymentType? type,
      final bool? cashbackOnly,
      final String? rrn}) = _$PaymentImpl;
  _Payment._() : super._();

  factory _Payment.fromJson(Map<String, dynamic> json) = _$PaymentImpl.fromJson;

  @override
  int get amount;
  @override
  dynamic get cashbackAmount;
  @override
  PaymentType? get type;
  @override
  bool? get cashbackOnly;
  @override
  String? get rrn;

  /// Create a copy of Payment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentImplCopyWith<_$PaymentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
