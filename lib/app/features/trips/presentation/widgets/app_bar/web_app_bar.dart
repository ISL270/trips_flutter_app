import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trips_flutter_app/app/core/constants/svg_assets.dart';
import 'package:trips_flutter_app/app/features/trips/presentation/widgets/app_bar/profile_avatar.dart';

/// Web app bar component matching Figma design
/// Dimensions: 1440×76px with 80px horizontal padding
class WebAppBar extends StatefulWidget {
  const WebAppBar({super.key});

  @override
  State<WebAppBar> createState() => _WebAppBarState();
}

class _WebAppBarState extends State<WebAppBar> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 76,
          color: Theme.of(context).colorScheme.surface,
          padding: const EdgeInsets.only(top: 18, bottom: 18, left: 80, right: 70),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Logo (82×40px)
              SvgPicture.asset(SvgAssets.logo, width: 82, height: 40),

              // Right section: Icons + Profile
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Navigation tabs (aligned right)
                  TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    labelColor: Theme.of(context).colorScheme.onSurface,
                    unselectedLabelColor: Theme.of(
                      context,
                    ).colorScheme.onSurface.withValues(alpha: 0.7),
                    labelPadding: const EdgeInsets.symmetric(horizontal: 18),
                    indicatorColor: Theme.of(context).colorScheme.primary,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorWeight: 2,
                    dividerColor: Colors.transparent,
                    tabs: const [
                      Tab(text: 'Items'),
                      Tab(text: 'Pricing'),
                      Tab(text: 'Info'),
                      Tab(text: 'Tasks'),
                      Tab(text: 'Analytics'),
                    ],
                  ),
                  const SizedBox(width: 12),

                  // Vertical divider
                  Container(
                    width: 1,
                    height: 40,
                    color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.2),
                  ),
                  const SizedBox(width: 22),
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

                  const SizedBox(width: 15),

                  // Bell icon (24×24px)
                  SvgPicture.asset(
                    SvgAssets.bell,
                    width: 24,
                    height: 24,
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.onSurface,
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(width: 24),

                  // Vertical divider
                  Container(
                    width: 1,
                    height: 40,
                    color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.2),
                  ),
                  const SizedBox(width: 24),
                  // Profile section (124×32px)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Profile avatar (32×32px)
                      const ProfileAvatar(),
                      const SizedBox(width: 12),
                      // Name and dropdown
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Eslam Ashraf', style: Theme.of(context).textTheme.bodyMedium),
                        ],
                      ),
                      const SizedBox(width: 8),
                      // Dropdown icon
                      SvgPicture.asset(
                        SvgAssets.chevronDown,
                        width: 22,
                        height: 22,
                        colorFilter: ColorFilter.mode(
                          Theme.of(context).colorScheme.onSurface,
                          BlendMode.srcIn,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Divider(
          color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.2),
          thickness: 1,
          height: 1,
        ),
      ],
    );
  }
}
