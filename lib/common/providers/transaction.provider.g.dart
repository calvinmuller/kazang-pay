// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$transactionHistoryHash() =>
    r'cfdbaf7f25894788518c09aed9890c220c85c4d0';

/// API Section
///
/// Copied from [transactionHistory].
@ProviderFor(transactionHistory)
final transactionHistoryProvider =
    AutoDisposeFutureProvider<List<Transaction>>.internal(
  transactionHistory,
  name: r'transactionHistoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$transactionHistoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TransactionHistoryRef = AutoDisposeFutureProviderRef<List<Transaction>>;
String _$settlementsHash() => r'938e44b9a385f6bb2af1d62e2b37958910796158';

/// See also [settlements].
@ProviderFor(settlements)
final settlementsProvider =
    AutoDisposeFutureProvider<TransactionSummaryResponse>.internal(
  settlements,
  name: r'settlementsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$settlementsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SettlementsRef
    = AutoDisposeFutureProviderRef<TransactionSummaryResponse>;
String _$settlementDetailsHash() => r'c5dc6cabc0f1c1716c61eb1398f14a035207aee8';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [settlementDetails].
@ProviderFor(settlementDetails)
const settlementDetailsProvider = SettlementDetailsFamily();

/// See also [settlementDetails].
class SettlementDetailsFamily
    extends Family<AsyncValue<TransactionHistoryDetails>> {
  /// See also [settlementDetails].
  const SettlementDetailsFamily();

  /// See also [settlementDetails].
  SettlementDetailsProvider call(
    DateTime date,
  ) {
    return SettlementDetailsProvider(
      date,
    );
  }

  @override
  SettlementDetailsProvider getProviderOverride(
    covariant SettlementDetailsProvider provider,
  ) {
    return call(
      provider.date,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'settlementDetailsProvider';
}

/// See also [settlementDetails].
class SettlementDetailsProvider
    extends AutoDisposeFutureProvider<TransactionHistoryDetails> {
  /// See also [settlementDetails].
  SettlementDetailsProvider(
    DateTime date,
  ) : this._internal(
          (ref) => settlementDetails(
            ref as SettlementDetailsRef,
            date,
          ),
          from: settlementDetailsProvider,
          name: r'settlementDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$settlementDetailsHash,
          dependencies: SettlementDetailsFamily._dependencies,
          allTransitiveDependencies:
              SettlementDetailsFamily._allTransitiveDependencies,
          date: date,
        );

  SettlementDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.date,
  }) : super.internal();

  final DateTime date;

  @override
  Override overrideWith(
    FutureOr<TransactionHistoryDetails> Function(SettlementDetailsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SettlementDetailsProvider._internal(
        (ref) => create(ref as SettlementDetailsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        date: date,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<TransactionHistoryDetails> createElement() {
    return _SettlementDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SettlementDetailsProvider && other.date == date;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, date.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SettlementDetailsRef
    on AutoDisposeFutureProviderRef<TransactionHistoryDetails> {
  /// The parameter `date` of this provider.
  DateTime get date;
}

class _SettlementDetailsProviderElement
    extends AutoDisposeFutureProviderElement<TransactionHistoryDetails>
    with SettlementDetailsRef {
  _SettlementDetailsProviderElement(super.provider);

  @override
  DateTime get date => (origin as SettlementDetailsProvider).date;
}

String _$getByReferenceDataHash() =>
    r'd4da5d4828a6e67b1b1d52e72c1241e47c24d11d';

/// See also [getByReferenceData].
@ProviderFor(getByReferenceData)
const getByReferenceDataProvider = GetByReferenceDataFamily();

/// See also [getByReferenceData].
class GetByReferenceDataFamily extends Family<AsyncValue<Transaction>> {
  /// See also [getByReferenceData].
  const GetByReferenceDataFamily();

  /// See also [getByReferenceData].
  GetByReferenceDataProvider call(
    String rrn,
  ) {
    return GetByReferenceDataProvider(
      rrn,
    );
  }

  @override
  GetByReferenceDataProvider getProviderOverride(
    covariant GetByReferenceDataProvider provider,
  ) {
    return call(
      provider.rrn,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getByReferenceDataProvider';
}

/// See also [getByReferenceData].
class GetByReferenceDataProvider
    extends AutoDisposeFutureProvider<Transaction> {
  /// See also [getByReferenceData].
  GetByReferenceDataProvider(
    String rrn,
  ) : this._internal(
          (ref) => getByReferenceData(
            ref as GetByReferenceDataRef,
            rrn,
          ),
          from: getByReferenceDataProvider,
          name: r'getByReferenceDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getByReferenceDataHash,
          dependencies: GetByReferenceDataFamily._dependencies,
          allTransitiveDependencies:
              GetByReferenceDataFamily._allTransitiveDependencies,
          rrn: rrn,
        );

  GetByReferenceDataProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.rrn,
  }) : super.internal();

  final String rrn;

  @override
  Override overrideWith(
    FutureOr<Transaction> Function(GetByReferenceDataRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetByReferenceDataProvider._internal(
        (ref) => create(ref as GetByReferenceDataRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        rrn: rrn,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Transaction> createElement() {
    return _GetByReferenceDataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetByReferenceDataProvider && other.rrn == rrn;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, rrn.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetByReferenceDataRef on AutoDisposeFutureProviderRef<Transaction> {
  /// The parameter `rrn` of this provider.
  String get rrn;
}

class _GetByReferenceDataProviderElement
    extends AutoDisposeFutureProviderElement<Transaction>
    with GetByReferenceDataRef {
  _GetByReferenceDataProviderElement(super.provider);

  @override
  String get rrn => (origin as GetByReferenceDataProvider).rrn;
}

String _$transactionResultNotifierHash() =>
    r'b99470cb6f0ea22b9d26ff23057bc4be20eacc55';

/// See also [TransactionResultNotifier].
@ProviderFor(TransactionResultNotifier)
final transactionResultNotifierProvider =
    NotifierProvider<TransactionResultNotifier, TransactionResult?>.internal(
  TransactionResultNotifier.new,
  name: r'transactionResultNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$transactionResultNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TransactionResultNotifier = Notifier<TransactionResult?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
