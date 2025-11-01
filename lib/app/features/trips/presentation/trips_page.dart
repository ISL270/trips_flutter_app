import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trips_flutter_app/app/core/utils/responsive_helper.dart';
import 'package:trips_flutter_app/app/features/trips/presentation/providers/trips_notifier.dart';
import 'package:trips_flutter_app/app/features/trips/presentation/widgets/app_bar/mobile_app_bar.dart';
import 'package:trips_flutter_app/app/features/trips/presentation/widgets/app_bar/web_app_bar.dart';
import 'package:trips_flutter_app/app/features/trips/presentation/widgets/content_section_header/mobile_content_section_header.dart';
import 'package:trips_flutter_app/app/features/trips/presentation/widgets/content_section_header/web_content_section_header.dart';

class TripsPage extends ConsumerWidget {
  const TripsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tripsState = ref.watch(tripsProvider);

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
            Expanded(
              child: _buildContent(context, tripsState),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, TripsState state) {
    if (state.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (state.error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Error: ${state.error}',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.red,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Retry logic can be added here
              },
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (state.trips.isEmpty) {
      return Center(
        child: Text(
          'No trips found',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: state.trips.length,
      itemBuilder: (context, index) {
        final trip = state.trips[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  trip.title,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 8),
                Text(
                  '${trip.dates.start} - ${trip.dates.end}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 8),
                Text(
                  'Status: ${trip.status}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  'Participants: ${trip.participants.length}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  'Unfinished Tasks: ${trip.unfinishedTasks}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
