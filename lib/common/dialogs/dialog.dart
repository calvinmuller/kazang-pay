import 'package:flutter/material.dart' show StatelessWidget, BuildContext, Widget, Container, EdgeInsets, Icon, MainAxisSize, CrossAxisAlignment, Theme, TextAlign, Text, Column, IconData;

import '../../core/core.dart' show CustomIcons, CustomColours;

class Dialog extends StatelessWidget {
  const Dialog({super.key, this.iconData, required this.title, required this.message, this.actions = const []});

  final IconData? iconData;
  final String title;
  final String message;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      child: Column(
        spacing: 15,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            iconData ?? CustomIcons.attention,
            size: 72,
            color: CustomColours.gold,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          Text(message),
          ...actions,
        ],
      ),
    );
  }
}
