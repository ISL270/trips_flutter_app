import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// A reusable widget for displaying SVG icons with theme-aware coloring.
///
/// Wraps [SvgPicture.asset] with consistent sizing and color filtering.
/// Color defaults to [ColorScheme.onSurface] if not provided.
class SvgIcon extends StatelessWidget {
  /// The path to the SVG asset file.
  final String iconPath;

  /// The width and height of the icon in pixels. Defaults to 24px.
  /// The icon is always square (width = height).
  final double size;

  /// The color to apply to the icon.
  /// Defaults to [ColorScheme.onSurface] if not provided.
  final Color? color;

  const SvgIcon({
    super.key,
    required this.iconPath,
    this.size = 24,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final iconColor = color ?? Theme.of(context).colorScheme.onSurface;

    return SvgPicture.asset(
      iconPath,
      width: size,
      height: size,
      colorFilter: ColorFilter.mode(
        iconColor,
        BlendMode.srcIn,
      ),
    );
  }
}
