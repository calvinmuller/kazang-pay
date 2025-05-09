import 'dart:convert';
import 'dart:io' show HttpClient, X509Certificate;
import 'package:dio/io.dart';

import 'package:dio/dio.dart' show BaseOptions, Dio, DioException;
import 'package:flutter_riverpod/flutter_riverpod.dart' show Ref;

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/repository.dart';
import '../../models/app_state.dart';
import 'app.provider.dart';

part 'api.provider.g.dart';

@riverpod
Dio dioClient(Ref ref) {
  final proxy = ref.read(appNotifierProvider.select((state) => state.proxy));
  final dio = Dio();
  if (proxy) {
    dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final client = HttpClient();
        client.findProxy = (uri) {
          return 'PROXY proxy.kazang.net:30720';
        };
        client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
        return client;
      },
    );
  }
  return dio;
}

@riverpod
CrmRepository crmRepository(Ref ref) {
  final dio = ref.watch(dioClientProvider);
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
  return CrmRepository(dio..options = options);
}

@riverpod
KazangRepository kazangRepository(Ref ref) {
  final dio = ref.watch(dioClientProvider);
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
  return KazangRepository(dio..options = options);
}

@riverpod
CrRepository crRepository(Ref ref) {
  final dio = ref.watch(dioClientProvider);
  const uri = String.fromEnvironment('crApiUrl');

  final BaseOptions options = BaseOptions(
    baseUrl: uri,
  );
  return CrRepository(dio..options = options);
}

@riverpod
Future<TerminalProfile> fetchProfile(Ref ref) async {
  final api = ref.read(kazangRepositoryProvider);
  final appState = ref.read(appNotifierProvider.notifier);
  final accountInfo =
      ref.watch(appNotifierProvider.select((state) => state.accountInfo));

  try {
    final response = await api.getProfile(accountInfo!);
    final profile = TerminalProfile.fromJson(response);
    appState.setProfile(profile);
    return profile;
  } on DioException catch (e) {
    throw Exception(e.error);
  }
}

// Urovo crap device
// adb: failed to install /Users/calvinmuller/Mobile/kazangpay/build/app/outputs/flutter-apk/app-urovouat-release.apk: Failure [INSTALL_FAILED_INVALID_APK: Package couldn't be installed in /data/app/net.kazang.pegasus.dev-HjPd5LudV2uhyFsqs03m-g==: Verify signature can't pass]
