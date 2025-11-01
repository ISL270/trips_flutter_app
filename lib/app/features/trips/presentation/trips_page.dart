import 'package:flutter/material.dart';
import 'package:trips_flutter_app/app/core/utils/responsive_helper.dart';
import 'package:trips_flutter_app/app/features/trips/presentation/widgets/app_bar/mobile_app_bar.dart';
import 'package:trips_flutter_app/app/features/trips/presentation/widgets/app_bar/web_app_bar.dart';
import 'package:trips_flutter_app/app/features/trips/presentation/widgets/content_section_header/mobile_content_section_header.dart';
import 'package:trips_flutter_app/app/features/trips/presentation/widgets/content_section_header/web_content_section_header.dart';

class TripsPage extends StatelessWidget {
  const TripsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ResponsiveHelper.responsive(
              context,
              mobile: const MobileAppBar(),
              web: const WebAppBar(),
            ),
            const SizedBox(height: 16),
            ResponsiveHelper.responsive(
              context,
              mobile: const MobileContentSectionHeader(),
              web: const WebContentSectionHeader(),
            ),
            Expanded(child: const Center(child: Text('Content Area'))),
          ],
        ),
      ),
    );
  }
}
