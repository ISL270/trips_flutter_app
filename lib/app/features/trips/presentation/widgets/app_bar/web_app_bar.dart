import 'package:flutter/material.dart';
import 'package:trips_flutter_app/app/core/constants/assets.gen.dart';
import 'package:trips_flutter_app/app/core/widgets/profile_avatar.dart';
import 'package:trips_flutter_app/app/core/widgets/svg_icon.dart';
import 'package:trips_flutter_app/app/core/widgets/vertical_divider_line.dart';

/// Web app bar component matching Figma design
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
    print(MediaQuery.of(context).size.width);
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
              Assets.images.fullLogo.image(height: 40),

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
                    labelPadding: const EdgeInsets.symmetric(horizontal: 16),
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

                  // Vertical divider
                  const VerticalDividerLine(height: 40),
                  const SizedBox(width: 6),
                  // Settings icon (24×24px)
                  SvgIcon(iconPath: Assets.svgs.settings.path),

                  const SizedBox(width: 12),

                  // Bell icon (24×24px)
                  SvgIcon(iconPath: Assets.svgs.bell.path),
                  const SizedBox(width: 8),

                  // Vertical divider
                  const VerticalDividerLine(height: 40),
                  const SizedBox(width: 6),
                  // Profile section (124×32px)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Profile avatar (32×32px)
                      const ProfileAvatar(
                        size: 35,
                        imageUrl: 'https://avatar.iran.liara.run/public/boy?username=user8',
                      ),
                      const SizedBox(width: 12),
                      // Name and dropdown
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Eslam Ali', style: Theme.of(context).textTheme.bodyMedium),
                        ],
                      ),
                      const SizedBox(width: 8),
                      // Dropdown icon
                      SvgIcon(iconPath: Assets.svgs.chevronDown.path, size: 22),
                    ],
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
