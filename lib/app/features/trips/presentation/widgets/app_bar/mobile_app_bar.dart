import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trips_flutter_app/app/core/constants/svg_assets.dart';
import 'package:trips_flutter_app/app/features/trips/presentation/widgets/app_bar/profile_avatar.dart';

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
                  SvgPicture.asset(
                    SvgAssets.menu,
                    width: 24,
                    height: 24,
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.onSurface,
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Logo (82×40px)
                  SvgPicture.asset(SvgAssets.logo, width: 82, height: 40),
                ],
              ),

              // Right section: Icons + Divider + Avatar
              Row(
                children: [
                  // Settings icon (24×24px)
                  SvgPicture.asset(
                    SvgAssets.settings,
                    width: 24,
                    height: 24,
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.onSurface,
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(width: 12),
                  // More menu icon (24×24px)
                  SvgPicture.asset(
                    SvgAssets.bell,
                    width: 24,
                    height: 24,
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.onSurface,
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Vertical divider (22px height)
                  Container(
                    width: 1,
                    height: 22,
                    color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.2),
                  ),
                  const SizedBox(width: 11),
                  // Avatar/Profile (32×32px)
                  const ProfileAvatar(),
                ],
              ),
            ],
          ),
        ),
        Divider(
          color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.2),
          thickness: 1,
        ),
      ],
    );
  }
}
