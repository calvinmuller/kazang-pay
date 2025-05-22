import 'package:flutter_riverpod/flutter_riverpod.dart';

enum LaunchMode {
  normal,
  intent,
  wifi,
}

final launchModeProvider = StateProvider<LaunchMode>((ref) => LaunchMode.normal);