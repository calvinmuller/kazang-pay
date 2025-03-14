import 'package:flutter_riverpod/flutter_riverpod.dart' show StateProvider;

final statusMessageProvider = StateProvider.autoDispose<String>((ref) => '');
