import 'package:flutter/material.dart';
import 'package:trips_flutter_app/app/core/widgets/svg_icon.dart';

/// A circular button with an SVG icon.
///
/// The icon size is automatically calculated as half the button diameter.
class CircularIconButton extends StatelessWidget {
  /// The path to the SVG icon asset.
  final String iconPath;

  /// The diameter of the circular button. Defaults to 48px.
  /// The icon size will be automatically set to diameter / 2.
  final double diameter;

  /// Callback function when the button is pressed.
  /// If null, the button will be disabled.
  final VoidCallback? onPressed;

  /// Background color of the button.
  /// Defaults to [ColorScheme.surfaceContainerHighest] if not provided.
  final Color? backgroundColor;

  const CircularIconButton({
    super.key,
    required this.iconPath,
    this.diameter = 48,
    this.onPressed,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final iconSize = diameter / 2;

    return SizedBox(
      width: diameter,
      height: diameter,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: EdgeInsets.zero,
          backgroundColor: backgroundColor ?? Theme.of(context).colorScheme.surfaceContainerHighest,
        ),
        child: SvgIcon(iconPath: iconPath, size: iconSize),
      ),
    );
  }
}
