// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

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
String _$pinNotifierHash() => r'b49c024542838c5accbd0613b6a03eeecc0fa7d4';

/// See also [PinNotifier].
@ProviderFor(PinNotifier)
final pinNotifierProvider =
    AutoDisposeNotifierProvider<PinNotifier, Object?>.internal(
  PinNotifier.new,
  name: r'pinNotifierProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$pinNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PinNotifier = AutoDisposeNotifier<Object?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
