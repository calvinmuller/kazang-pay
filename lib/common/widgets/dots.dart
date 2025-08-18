import 'package:flutter/material.dart' show BuildContext, Widget, MainAxisAlignment, Colors, CircleAvatar, Row;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/core.dart';
import '../providers/transaction.provider.dart' show transactionStepProvider;

class Dots extends ConsumerWidget {
  const Dots({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final step = ref.watch(transactionStepProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: context.dynamicSize(32, 28),
      children: List.generate(
        4,
        (index) => CircleAvatar(
          radius: context.dynamicSize(20, 18),
          backgroundColor: (index < step) ? CustomColours.prismBlue : Colors.black,
        ),
      ),
    );
  }

}
