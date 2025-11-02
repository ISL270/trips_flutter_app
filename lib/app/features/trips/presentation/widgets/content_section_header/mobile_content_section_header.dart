import 'package:flutter/material.dart';
import 'package:trips_flutter_app/app/core/constants/assets.gen.dart';
import 'package:trips_flutter_app/app/core/widgets/circular_icon_button.dart';

class MobileContentSectionHeader extends StatelessWidget {
  const MobileContentSectionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Items', style: Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 28)),
          CircularIconButton(iconPath: Assets.svgs.filter.path, onPressed: () {}),
        ],
      ),
    );
  }
}
