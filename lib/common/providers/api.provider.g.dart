// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$kazangRepositoryHash() => r'cbea28f17fd75110ec33aa5ae6a4e85ba0b0d079';

/// See also [kazangRepository].
@ProviderFor(kazangRepository)
final kazangRepositoryProvider = AutoDisposeProvider<KazangRepository>.internal(
  kazangRepository,
  name: r'kazangRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$kazangRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef KazangRepositoryRef = AutoDisposeProviderRef<KazangRepository>;
String _$fetchProfileHash() => r'06df913957baa676670cd3822403bd4684ea76cb';

/// See also [fetchProfile].
@ProviderFor(fetchProfile)
final fetchProfileProvider =
    AutoDisposeFutureProvider<TerminalProfile>.internal(
  fetchProfile,
  name: r'fetchProfileProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$fetchProfileHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FetchProfileRef = AutoDisposeFutureProviderRef<TerminalProfile>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
