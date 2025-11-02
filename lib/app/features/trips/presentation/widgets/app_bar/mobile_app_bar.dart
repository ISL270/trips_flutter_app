import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trips_flutter_app/app/core/constants/svg_assets.dart';
import 'package:trips_flutter_app/app/core/widgets/profile_avatar.dart';
import 'package:trips_flutter_app/app/core/widgets/svg_icon.dart';
import 'package:trips_flutter_app/app/core/widgets/vertical_divider_line.dart';

/// Mobile app bar component matching Figma design
/// Dimensions: 375×72px with 16px padding
class MobileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MobileAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(72);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 72,
          color: Theme.of(context).colorScheme.surface,
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left section: Menu icon + Logo
              Row(
                children: [
                  // Menu icon (24×24px)
                  SvgIcon(iconPath: SvgAssets.menu),
                  const SizedBox(width: 16),
                  // Logo (82×40px)
                  SvgPicture.asset(SvgAssets.logo, width: 82, height: 40),
                ],
              ),

              // Right section: Icons + Divider + Avatar
              Row(
                children: [
                  // Settings icon (24×24px)
                  SvgIcon(iconPath: SvgAssets.settings),
                  const SizedBox(width: 12),
                  // More menu icon (24×24px)
                  SvgIcon(iconPath: SvgAssets.bell),
                  // Vertical divider (22px height)
                  const VerticalDividerLine(height: 22),
                  // Avatar/Profile (32×32px)
                  const ProfileAvatar(
                    size: 40,

                    imageUrl: 'https://avatar.iran.liara.run/public/boy?username=user8',
                  ),
                ],
              ),
            ],
          ),
        ),
        Divider(),
      ],
    );
  }
}
