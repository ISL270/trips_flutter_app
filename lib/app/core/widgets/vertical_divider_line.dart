import 'package:flutter/material.dart';

/// A vertical divider line with consistent styling.
///
/// Creates a 1px wide line with configurable height and 14px horizontal margins.
/// Uses [ColorScheme.onSurface] with 20% opacity.
class VerticalDividerLine extends StatelessWidget {
  /// The height of the divider line in pixels. Defaults to 45px.
  final double height;

  const VerticalDividerLine({super.key, this.height = 45});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: height,
      margin: const EdgeInsets.symmetric(horizontal: 14),
      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.2),
    );
  }
}
