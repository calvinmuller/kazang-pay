import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog(
      {super.key,
      required this.title,
      required this.message,
      required this.actions});

  final String title;
  final String message;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(
            'assets/warning.svg',
            height: 140,
          ),
          Text(title, style: Theme.of(context).textTheme.titleMedium, textAlign: TextAlign.center),
          Text(message), ...actions,
        ],
      ),
    );
    // show the dialog
  }
}
