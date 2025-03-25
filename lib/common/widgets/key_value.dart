

import 'package:flutter/material.dart' show StatelessWidget, BuildContext, Widget, TextStyle, Theme, MainAxisAlignment, FontWeight, Text, Row, DefaultTextStyle;

class KeyValueWidget extends StatelessWidget {
  const KeyValueWidget({super.key, required this.title, required this.value, this.bold = false});

  final String title;
  final String? value;
  final bool bold;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
        fontWeight: (bold) ? FontWeight.bold: FontWeight.normal,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w500),),
          Text(value ?? ''),
        ],
      ),
    );
  }
}
