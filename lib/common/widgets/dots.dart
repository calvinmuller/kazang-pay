import 'package:flutter/material.dart';

import '../../core/constants.dart';

class Dots extends StatelessWidget {
  const Dots({super.key});

  @override
  Widget build(BuildContext context) {
    // Generate 4 circles of black colours in a loop
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 48,
      children: List.generate(
        4,
        (index) => CircleAvatar(
          radius: 20,
          backgroundColor: (index < 2) ? CustomColours.greenish : Colors.black,
        ),
      ),
    );
  }
}
