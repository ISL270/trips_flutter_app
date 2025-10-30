import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trips_flutter_app/app/core/constants/app_colors.dart';
import 'package:trips_flutter_app/app/core/constants/svg_assets.dart';

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
                    colorFilter: const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
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
                    colorFilter: const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
                  ),
                  const SizedBox(width: 12),
                  // More menu icon (24×24px)
                  SvgPicture.asset(
                    SvgAssets.bell,
                    width: 24,
                    height: 24,
                    colorFilter: const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
                  ),
                  const SizedBox(width: 12),
                  // Vertical divider (22px height)
                  Container(width: 1, height: 22, color: AppColors.white.withValues(alpha: 0.2)),
                  const SizedBox(width: 11),
                  // Avatar/Profile (32×32px)
                  ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: 'https://avatar.iran.liara.run/public/boy?username=user8',
                      width: 32,
                      height: 32,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(
                        width: 32,
                        height: 32,
                        color: AppColors.primary,
                        child: const Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.primary),
                        child: const Center(
                          child: Text(
                            'U',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Divider(color: AppColors.white.withValues(alpha: 0.2), thickness: 1),
      ],
    );
  }
}
