import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  const Label(this.label, {super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8),
      child: Text(
        textScaler: const TextScaler.linear(0.8),
        label,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 20
            ),
      ),
    );
  }
}
