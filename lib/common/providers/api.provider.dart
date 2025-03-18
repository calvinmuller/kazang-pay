import 'dart:convert';

import 'package:dio/dio.dart' show BaseOptions, Dio;
import 'package:flutter_riverpod/flutter_riverpod.dart' show Ref;

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/repository.dart';
import '../../models/app_state.dart';
import 'app.provider.dart';

part 'api.provider.g.dart';

final crmRepositoryProvider = Provider<CrmRepository>((ref) {
  const uri = String.fromEnvironment('crmApiUrl');

  const username = String.fromEnvironment('sonicUsername');
  const password = String.fromEnvironment('sonicPassword');

  String basicAuth =
      'Basic ${base64Encode(utf8.encode('$username:$password'))}';

  final BaseOptions options = BaseOptions(
    baseUrl: uri,
    headers: {
      'Authorization': basicAuth,
    },
  );
  return CrmRepository(Dio(options));
});

@riverpod
KazangRepository kazangRepository(Ref ref) {
  const uri = String.fromEnvironment('kazangApiUrl');

  const username = String.fromEnvironment('cpsUsername');
  const password = String.fromEnvironment('cpsPassword');

  String basicAuth =
      'Basic ${base64Encode(utf8.encode('$username:$password'))}';

  final BaseOptions options = BaseOptions(
    baseUrl: uri,
    headers: {
      'Authorization': basicAuth,
    },
  );
  return KazangRepository(Dio(options));
}

final crRepositoryProvider = Provider<CrRepository>((ref) {
  const uri = String.fromEnvironment('crApiUrl');

  final BaseOptions options = BaseOptions(
    baseUrl: uri,
  );
  return CrRepository(Dio(options));
});

@riverpod
Future<TerminalProfile> fetchProfile(Ref ref) async {
  final api = ref.read(kazangRepositoryProvider);
  final appState = ref.read(appNotifierProvider.notifier);
  final accountInfo = ref.watch(appNotifierProvider.select((state) => state.accountInfo));

  final response = await api.getProfile(accountInfo!);

  final profile = TerminalProfile.fromJson(response);
  appState.setProfile(profile);

  return profile;
}