
import 'package:flutter_riverpod/flutter_riverpod.dart' show Ref;
import 'package:riverpod_annotation/riverpod_annotation.dart';


import '../../helpers/transaction_helper.dart';
import '../../models/app_state.dart' show AppState, DeviceInfo, TerminalProfile;
import '../../models/kazang.dart';

part 'app.provider.g.dart';

@Riverpod(keepAlive: true)
class AppNotifier extends _$AppNotifier {
  AppNotifier({this.appState});

  AppState? appState;
  final key = 'appState';

  @override
  AppState build() {
    listenSelf((prev, next) {
      _save(next);
    });
    return appState ?? AppState();
  }

  verifyPin() {
    state = state.copyWith(pinVerified: true);
  }

  void setConfigured(LoginRequest loginRequest) {
    state = state.copyWith(isConfigured: true, accountInfo: loginRequest);
  }

  void setProfile(TerminalProfile profile) {
    state = state.copyWith(profile: profile);
  }

  void setPin(String? pin) {
    state = state.copyWith(pin: pin);
  }

  _save(AppState next) {
    TransactionHelper.saveJson(key, next.toJson());
  }
}

@riverpod
Future<DeviceInfo> getDeviceInfo(Ref ref) async => await TransactionHelper.getDeviceInfo();