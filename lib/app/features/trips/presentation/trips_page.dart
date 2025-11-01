import 'package:flutter/material.dart';
import 'package:trips_flutter_app/app/core/utils/responsive_helper.dart';
import 'package:trips_flutter_app/app/features/trips/presentation/widgets/app_bar/mobile_app_bar.dart';
import 'package:trips_flutter_app/app/features/trips/presentation/widgets/app_bar/web_app_bar.dart';
import 'package:trips_flutter_app/app/features/trips/presentation/widgets/section_header.dart';

class TripsPage extends StatelessWidget {
  const TripsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ResponsiveHelper.isDesktop(context) ? const WebAppBar() : const MobileAppBar(),
            if (ResponsiveHelper.isMobile(context)) ...[
              const SizedBox(height: 16),
              const SectionHeader(title: 'Items'),
            ],
            Expanded(child: const Center(child: Text('Content Area'))),
          ],
        ),
      ),
    );
  }
}
