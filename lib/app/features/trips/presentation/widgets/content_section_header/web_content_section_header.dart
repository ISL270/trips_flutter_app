import 'package:flutter/material.dart';
import 'package:trips_flutter_app/app/core/constants/assets.gen.dart';
import 'package:trips_flutter_app/app/core/widgets/circular_icon_button.dart';
import 'package:trips_flutter_app/app/core/widgets/svg_icon.dart';
import 'package:trips_flutter_app/app/core/widgets/vertical_divider_line.dart';

class WebContentSectionHeader extends StatelessWidget {
  const WebContentSectionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      padding: const EdgeInsets.symmetric(horizontal: 80),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Items', style: Theme.of(context).textTheme.displaySmall),
          Row(
            children: [
              // Filter button
              CircularIconButton(iconPath: Assets.svgs.filter.path, onPressed: () {}),
              // Vertical divider
              const VerticalDividerLine(),
              // Add button
              SizedBox(
                height: 48,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Theme.of(context).colorScheme.onPrimary,
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgIcon(
                        iconPath: Assets.svgs.plus.path,
                        size: 20,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Add a New Trip',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
