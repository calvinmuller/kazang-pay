import 'package:flutter/material.dart';

/// A responsive Scaffold that automatically limits content width to 70% on large devices
/// while maintaining full width on smaller devices like phones.
/// On large devices, can optionally show a split view with a side widget.
class ResponsiveScaffold extends StatelessWidget {
  const ResponsiveScaffold({
    super.key,
    this.appBar,
    this.body,
    this.maxWidthFactor = 0.7,
    this.breakpoint = 768,
    this.sideWidget,
    this.sideWidgetFlex = 2,
    this.mainWidgetFlex = 3,
    this.splitViewSpacing = 16.0,
    this.backgroundColor,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.resizeToAvoidBottomInset,
  });

  // All the standard Scaffold properties
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Color? backgroundColor;
  final bool? resizeToAvoidBottomInset;
  final bool extendBody;
  final bool extendBodyBehindAppBar;

  // Responsive-specific properties
  final double maxWidthFactor;
  final double breakpoint;
  
  // Split view properties (only used on large devices)
  final Widget? sideWidget;
  final int sideWidgetFlex;
  final int mainWidgetFlex;
  final double splitViewSpacing;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeDevice = screenWidth > breakpoint;

    Widget? scaffoldBody = body;

    // Handle responsive layout for large devices
    if (isLargeDevice && body != null) {
      
      // If sideWidget is provided, create a split view
      if (sideWidget != null) {
        scaffoldBody = Center(
          child: FractionallySizedBox(
            widthFactor: maxWidthFactor,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: mainWidgetFlex,
                  child: body!,
                ),
                SizedBox(width: splitViewSpacing),
                Expanded(
                  flex: sideWidgetFlex,
                  child: sideWidget!,
                ),
              ],
            ),
          ),
        );
      } else {
        // No side widget, just center and constrain width
        scaffoldBody = Center(
          child: FractionallySizedBox(
            widthFactor: maxWidthFactor,
            child: body!,
          ),
        );
      }
    }

    return Scaffold(
      appBar: appBar,
      body: scaffoldBody,
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      extendBody: extendBody,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
    );
  }
}