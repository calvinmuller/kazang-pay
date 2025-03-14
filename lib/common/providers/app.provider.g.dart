// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getDeviceInfoHash() => r'f013c93b2ea40c9fd99c1e5e81e2ab180feda5b4';

/// See also [getDeviceInfo].
@ProviderFor(getDeviceInfo)
final getDeviceInfoProvider = AutoDisposeFutureProvider<DeviceInfo>.internal(
  getDeviceInfo,
  name: r'getDeviceInfoProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getDeviceInfoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetDeviceInfoRef = AutoDisposeFutureProviderRef<DeviceInfo>;
String _$appNotifierHash() => r'3ffbc711d8f564ce55d0d104ffe99ecf7d722d7c';

/// See also [AppNotifier].
@ProviderFor(AppNotifier)
final appNotifierProvider = NotifierProvider<AppNotifier, AppState>.internal(
  AppNotifier.new,
  name: r'appNotifierProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$appNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AppNotifier = Notifier<AppState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
