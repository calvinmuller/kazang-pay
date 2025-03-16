

import 'package:flutter/material.dart' show BuildContext, Widget, MainAxisAlignment, Colors, CircleAvatar, Row;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/constants.dart';
import '../providers/transaction.provider.dart' show transactionStepProvider;

class Dots extends ConsumerWidget {
  const Dots({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final step = ref.watch(transactionStepProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 32,
      children: List.generate(
        4,
        (index) => CircleAvatar(
          radius: 20,
          backgroundColor: (index < step) ? CustomColours.greenish : Colors.black,
        ),
      ),
    );
  }

}
