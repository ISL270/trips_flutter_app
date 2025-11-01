import 'package:flutter/material.dart';

/// Helper class for responsive design checks
class ResponsiveHelper {
  /// Mobile breakpoint (up to 975px)
  static const double mobileBreakpoint = 975;

  /// Build responsive widget based on screen size
  static Widget responsive(BuildContext context, {required Widget mobile, required Widget web}) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > ResponsiveHelper.mobileBreakpoint) {
          return web;
        }
        return mobile;
      },
    );
  }
}
