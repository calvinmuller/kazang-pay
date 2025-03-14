

import 'package:flutter/material.dart' show StatelessWidget, VoidCallback, Key, Widget, Color, IconAlignment, EdgeInsets, BuildContext, OutlinedBorder, EdgeInsetsGeometry, WidgetState, Colors, ElevatedButton, WidgetStateProperty, BorderSide, BorderRadius, RoundedRectangleBorder, ButtonStyle, SizedBox, Container;

import '../../core/constants.dart' show CustomColours;

class Button extends StatelessWidget {
  factory Button.secondary({
    Key? key,
    VoidCallback? onPressed,
    required Widget child,
    Color? colour,
    Color? textColour,
    Color borderColour = CustomColours.red,
    double? height = 52.5,
    double? width = double.infinity,
    double? elevation,
    double radius = 30,
    Widget? icon,
    bool rounded = false,
    IconAlignment? iconAlignment
  }) {
    return Button(
      iconAlignment: iconAlignment,
      elevation: 0,
      borderColour: (colour == null) ? borderColour: Colors.white,
      textColour: (textColour == null) ? borderColour: textColour,
      colour: colour ?? Colors.white,
      width: width,
      height: height,
      rounded: true,
      onPressed: onPressed,
      icon: icon,
      radius: radius,
      child: child,
    );
  }

  factory Button.flat(
      {Key? key,
      VoidCallback? onPressed,
      required Widget child,
      Color? colour,
      Color? textColour,
      Color? borderColour = CustomColours.black,
      double? width = double.infinity,
      double? elevation = 0,
      Widget? icon,
      EdgeInsets? margin}) {
    return Button(
      elevation: 0,
      margin: margin,
      borderColour: borderColour,
      textColour: borderColour,
      colour: Colors.white,
      width: width,
      rounded: false,
      onPressed: onPressed,
      icon: icon,
      child: child,
    );
  }

  factory Button.main(
      {Key? key,
      VoidCallback? onPressed,
      VoidCallback? onLongPress,
      required Widget child,
      Color? colour = CustomColours.greenish,
      Color? textColour = Colors.black,
      Color? borderColour = CustomColours.greenish,
      double? width = double.infinity,
      double? elevation = 0,
      Widget? icon,
      EdgeInsets? margin,
      bool inverse = false,
      double? height}) {
    return Button(
      elevation: 0,
      margin: margin,
      borderColour: borderColour,
      textColour: (inverse) ? Colors.white : textColour,
      colour: (inverse) ? Colors.black : borderColour,
      width: width,
      rounded: false,
      onPressed: onPressed,
      icon: icon,
      onLongPress: onLongPress,
      height: height,
      child: child,
    );
  }

  const Button({
    super.key,
    this.onPressed,
    required this.child,
    this.colour,
    this.textColour,
    this.borderColour,
    this.height,
    this.icon,
    this.width,
    this.elevation,
    this.rounded = false,
    this.margin,
    this.onLongPress,
    this.radius = 30,
    this.iconAlignment = IconAlignment.start,
  });

  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final Widget child;
  final Color? colour;
  final Color? textColour;
  final Color? borderColour;
  final double? height;
  final double? width;
  final double? elevation;
  final double radius;
  final Widget? icon;
  final bool rounded;
  final EdgeInsets? margin;
  final IconAlignment? iconAlignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: SizedBox(
        height: height,
        width: width,
        child: ElevatedButton.icon(
          onLongPress: onLongPress,
          iconAlignment: iconAlignment,
          icon: icon,
          onPressed: onPressed,
          style: ButtonStyle(
            shape: (rounded || borderColour != null)
                ? WidgetStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      side: BorderSide(
                        color: (borderColour != null)
                            ? borderColour!
                            : Colors.transparent,
                        width: (borderColour != null) ? 1 : 0,
                      ),
                      borderRadius: (rounded)
                          ? BorderRadius.circular(radius)
                          : BorderRadius.circular(5),
                    ),
                  )
                : null,
            shadowColor: WidgetStateProperty.all<Color>(Colors.black38),
            elevation: WidgetStateProperty.all<double>(elevation ?? 5),
            padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            ),
            foregroundColor: WidgetStateProperty.all<Color?>(textColour),
            iconColor: WidgetStateProperty.all<Color?>(textColour),
            backgroundColor: WidgetStateProperty.resolveWith<Color?>(
                (Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return CustomColours.grayscale;
              }
              return colour; // Use the component's default.
            }),
          ),
          label: child,
        ),
      ),
    );
  }
}
