import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pin.provider.g.dart';

@Riverpod(keepAlive: true)
class PinNotifier extends _$PinNotifier {
  @override
  bool build() {
    return false;
  }

  verifyPin() {
    state = !state;
  }
}
