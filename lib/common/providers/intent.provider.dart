import 'package:flutter_riverpod/flutter_riverpod.dart';

enum LaunchMode {
  normal,
  intent,
}

final launchModeProvider = StateProvider<LaunchMode>((ref) => LaunchMode.normal);