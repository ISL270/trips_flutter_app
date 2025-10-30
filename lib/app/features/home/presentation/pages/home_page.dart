import 'package:flutter/material.dart';
import 'package:trips_flutter_app/app/core/widgets/mobile_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const MobileAppBar(),
            Expanded(
              child: const Center(
                child: Text('Home Page'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
