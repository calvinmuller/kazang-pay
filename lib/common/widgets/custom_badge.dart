import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'
    show
        StatelessWidget,
        BuildContext,
        Widget,
        DecoratedBox,
        BoxDecoration,
        BorderRadius,
        BadgeTheme,
        BadgeThemeData,
        Theme;

class CustomBadge extends StatelessWidget {
  const CustomBadge({required this.child, required this.colour, super.key, this.textColour, this.dense = false});

  final Widget child;
  final Color colour;
  final Color? textColour;
  final bool dense;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final BadgeThemeData badgeTheme = BadgeTheme.of(context);
    final defaultBadgeTheme = Theme.of(context).textTheme.labelSmall;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: (dense) ? EdgeInsets.symmetric(vertical: 2.0, horizontal: 6): const EdgeInsets.all(8.0),
        child: DefaultTextStyle(
          style: (badgeTheme.textStyle ?? defaultBadgeTheme!).copyWith(
            color: textColour ?? badgeTheme.textColor ?? theme.colorScheme.onError,
          ),
          child: child,
        ),
      ),
    );
  }
}
