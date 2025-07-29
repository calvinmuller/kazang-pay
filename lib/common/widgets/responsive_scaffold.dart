import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart' show DragStartBehavior;

/// A responsive Scaffold that automatically limits content width to 70% on large devices
/// while maintaining full width on smaller devices like phones.
/// On large devices, can optionally show a split view with a side widget.
class ResponsiveScaffold extends StatelessWidget {
  const ResponsiveScaffold({
    super.key,
    this.appBar,
    this.body,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.persistentFooterButtons,
    this.persistentFooterAlignment = AlignmentDirectional.centerEnd,
    this.drawer,
    this.onDrawerChanged,
    this.endDrawer,
    this.onEndDrawerChanged,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.backgroundColor,
    this.resizeToAvoidBottomInset,
    this.primary = true,
    this.drawerDragStartBehavior = DragStartBehavior.start,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.drawerScrimColor,
    this.drawerEdgeDragWidth,
    this.drawerEnableOpenDragGesture = true,
    this.endDrawerEnableOpenDragGesture = true,
    this.restorationId,
    this.maxWidthFactor = 0.7,
    this.breakpoint = 768,
    this.sideWidget,
    this.sideWidgetFlex = 2,
    this.mainWidgetFlex = 3,
    this.splitViewSpacing = 16.0,
  });

  // All the standard Scaffold properties
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;
  final List<Widget>? persistentFooterButtons;
  final AlignmentDirectional persistentFooterAlignment;
  final Widget? drawer;
  final DrawerCallback? onDrawerChanged;
  final Widget? endDrawer;
  final DrawerCallback? onEndDrawerChanged;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;
  final Color? backgroundColor;
  final bool? resizeToAvoidBottomInset;
  final bool primary;
  final DragStartBehavior drawerDragStartBehavior;
  final bool extendBody;
  final bool extendBodyBehindAppBar;
  final Color? drawerScrimColor;
  final double? drawerEdgeDragWidth;
  final bool drawerEnableOpenDragGesture;
  final bool endDrawerEnableOpenDragGesture;
  final String? restorationId;

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
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      floatingActionButtonAnimator: floatingActionButtonAnimator,
      persistentFooterButtons: persistentFooterButtons,
      persistentFooterAlignment: persistentFooterAlignment,
      drawer: drawer,
      onDrawerChanged: onDrawerChanged,
      endDrawer: endDrawer,
      onEndDrawerChanged: onEndDrawerChanged,
      bottomNavigationBar: bottomNavigationBar,
      bottomSheet: bottomSheet,
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      primary: primary,
      drawerDragStartBehavior: drawerDragStartBehavior,
      extendBody: extendBody,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      drawerScrimColor: drawerScrimColor,
      drawerEdgeDragWidth: drawerEdgeDragWidth,
      drawerEnableOpenDragGesture: drawerEnableOpenDragGesture,
      endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture,
      restorationId: restorationId,
    );
  }
}