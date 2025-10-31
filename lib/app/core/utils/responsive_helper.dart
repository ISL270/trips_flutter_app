import 'package:flutter/material.dart';

/// Helper class for responsive design checks
class ResponsiveHelper {
  /// Mobile breakpoint (up to 975px)
  static const double mobileBreakpoint = 975;

  /// Check if current screen is mobile size (≤ 975px)
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width <= mobileBreakpoint;
  }

  /// Check if current screen is desktop size (> 975px)
  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width > mobileBreakpoint;
  }

  /// Get current screen width
  static double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  /// Get current screen height
  static double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  /// Build responsive widget based on screen size
  static Widget responsive({
    required BuildContext context,
    required Widget mobile,
    required Widget desktop,
  }) {
    return isDesktop(context) ? desktop : mobile;
  }
}
