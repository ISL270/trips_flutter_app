import 'package:flutter/material.dart';

class VerticalDividerLine extends StatelessWidget {
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
