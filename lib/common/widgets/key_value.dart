import 'package:flutter/material.dart';

class KeyValueWidget extends StatelessWidget {
  const KeyValueWidget({super.key, required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.bodyMedium!,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w500),),
          Text(value),
        ],
      ),
    );
  }
}
