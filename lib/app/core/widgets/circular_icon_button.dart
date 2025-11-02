import 'package:flutter/material.dart';
import 'package:trips_flutter_app/app/core/widgets/svg_icon.dart';

class CircularIconButton extends StatelessWidget {
  final String iconPath;
  final double diameter;
  final VoidCallback? onPressed;
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
