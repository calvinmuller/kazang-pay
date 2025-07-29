import 'package:flutter/material.dart';

/// Responsive utility function that returns values based on screen width breakpoints.
/// Uses 3 breakpoints: xs, sm, lg
class Responsive {
  Responsive._();

  /// Breakpoint definitions (in logical pixels)
  static const double _xs = 0;    // Extra small devices (phones)
  static const double _sm = 330;  // Small devices (landscape phones)
  static const double _lg = 768;  // Large devices (tablets/desktops)

  /// Returns a value based on the current screen width breakpoint
  /// 
  /// Example usage:
  /// ```dart
  /// EdgeInsets.all(responsive(context, xs: 8, sm: 12, lg: 16))
  /// BorderRadius.circular(responsive(context, xs: 4, sm: 6, lg: 8))
  /// ```
  static T responsive<T>(
    BuildContext context, {
    required T xs,  // Extra small (0px+)
    T? sm,          // Small (576px+)
    T? lg,          // Large (768px+)
  }) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth >= _lg && lg != null) return lg;
    if (screenWidth >= _sm && sm != null) return sm;
    return xs;
  }

  /// Helper method to get current breakpoint name
  static String getCurrentBreakpoint(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    if (screenWidth >= _lg) return 'lg';
    if (screenWidth >= _sm) return 'sm';
    return 'xs';
  }

  /// Helper methods for checking specific breakpoints
  static bool isXs(BuildContext context) => 
      MediaQuery.of(context).size.width < _sm;
      
  static bool isSm(BuildContext context) => 
      MediaQuery.of(context).size.width >= _sm && 
      MediaQuery.of(context).size.width < _lg;
      
  static bool isLg(BuildContext context) => 
      MediaQuery.of(context).size.width >= _lg;

  /// Helper methods for "at least" breakpoint checks
  static bool isSmUp(BuildContext context) => 
      MediaQuery.of(context).size.width >= _sm;
      
  static bool isLgUp(BuildContext context) => 
      MediaQuery.of(context).size.width >= _lg;

  /// Get the actual breakpoint values (useful for debugging)
  static Map<String, double> get breakpoints => {
    'xs': _xs,
    'sm': _sm,
    'lg': _lg,
  };
}

/// Convenience function for easier usage
T responsive<T>(
  BuildContext context, {
  required T xs,
  T? sm,
  T? lg,
}) => Responsive.responsive<T>(context, xs: xs, sm: sm, lg: lg);