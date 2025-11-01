import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcon extends StatelessWidget {
  final String iconPath;
  final double size;
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
