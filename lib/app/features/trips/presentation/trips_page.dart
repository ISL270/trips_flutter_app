import 'package:flutter/material.dart';
import 'package:trips_flutter_app/app/core/utils/responsive_helper.dart';
import 'package:trips_flutter_app/app/features/trips/presentation/widgets/app_bar/mobile_app_bar.dart';
import 'package:trips_flutter_app/app/features/trips/presentation/widgets/app_bar/web_app_bar.dart';

class TripsPage extends StatelessWidget {
  const TripsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ResponsiveHelper.isDesktop(context) ? const WebAppBar() : const MobileAppBar(),
            Expanded(child: const Center(child: Text('Home Page'))),
          ],
        ),
      ),
    );
  }
}
