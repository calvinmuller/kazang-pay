import 'package:flutter_riverpod/flutter_riverpod.dart';

final statusMessageProvider = StateProvider.autoDispose<String>((ref) => '');
