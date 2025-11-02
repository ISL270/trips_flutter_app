import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trips_flutter_app/app/core/utils/responsive_helper.dart';
import 'package:trips_flutter_app/app/features/trips/presentation/providers/trips_notifier.dart';
import 'package:trips_flutter_app/app/features/trips/presentation/widgets/app_bar/mobile_app_bar.dart';
import 'package:trips_flutter_app/app/features/trips/presentation/widgets/app_bar/web_app_bar.dart';
import 'package:trips_flutter_app/app/features/trips/presentation/widgets/content_section_header/mobile_content_section_header.dart';
import 'package:trips_flutter_app/app/features/trips/presentation/widgets/content_section_header/web_content_section_header.dart';
import 'package:trips_flutter_app/app/features/trips/presentation/widgets/trip_card/trip_card.dart';

/// Main page for displaying and managing trips.
///
/// This page provides a responsive layout that adapts between mobile and desktop views.
/// It displays a list of trips fetched from the [tripsProvider] and handles loading,
/// error, and empty states appropriately.
///
/// The layout switches between a vertical list (mobile) and a wrap layout (desktop)
/// based on screen width (breakpoint: mobileBreakpoint / 1.625 ≈ 600px).
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
            const SizedBox(height: 16),
            Expanded(child: _TripsContent(state: tripsState)),
          ],
        ),
      ),
    );
  }
}

/// Content widget that handles different states of the trips data.
///
/// Displays appropriate UI based on the current [state]:
/// - Loading indicator when [state.isLoading] is true
/// - Error view when [state.error] is not null
/// - Empty view when [state.trips] is empty
/// - List or wrap layout based on screen width when trips are available
class _TripsContent extends StatelessWidget {
  /// The current state of trips data.
  final TripsState state;

  const _TripsContent({required this.state});

  @override
  Widget build(BuildContext context) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.error != null) {
      return _ErrorView(error: state.error!);
    }

    if (state.trips.isEmpty) {
      return const _EmptyView();
    }

    final screenWidth = MediaQuery.of(context).size.width;
    // Calculate layout breakpoint: mobileBreakpoint / 1.625 ≈ 600
    const layoutBreakpoint = ResponsiveHelper.mobileBreakpoint / 1.625;

    if (screenWidth > layoutBreakpoint) {
      return _WrapLayout(state: state);
    } else {
      return _ListLayout(state: state);
    }
  }
}

/// Widget that displays an error message with a retry button.
///
/// Shows the error message in red text and provides a retry button
/// for the user to attempt reloading the data.
class _ErrorView extends StatelessWidget {
  /// The error message to display.
  final String error;

  const _ErrorView({required this.error});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Error: $error',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.red),
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
}

/// Widget that displays a message when no trips are available.
///
/// Shows a centered "No trips found" message to inform the user
/// that there are currently no trips to display.
class _EmptyView extends StatelessWidget {
  const _EmptyView();

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('No trips found', style: Theme.of(context).textTheme.bodyMedium));
  }
}

/// Mobile layout that displays trips in a vertical scrollable list.
///
/// Used when screen width is at or below the layout breakpoint (≈600px).
/// Each trip is displayed as a [TripCard] with 16px spacing between cards and horizontal padding.
class _ListLayout extends StatelessWidget {
  /// The current state containing the list of trips to display.
  final TripsState state;

  const _ListLayout({required this.state});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      itemCount: state.trips.length,
      itemBuilder: (context, index) => TripCard(trip: state.trips[index]),
      separatorBuilder: (context, index) => const SizedBox(height: 16),
    );
  }
}

/// Desktop layout that displays trips in a responsive wrap layout.
///
/// Used when screen width is greater than the layout breakpoint (≈600px).
/// Displays trips in a grid-like layout with automatic wrapping.
/// Ensures at least 2 cards fit side by side, with a maximum card width
/// of 343px and 24px spacing between cards.
///
/// The card width is calculated dynamically based on available space while
/// respecting the maximum width constraint.
class _WrapLayout extends StatelessWidget {
  /// The current state containing the list of trips to display.
  final TripsState state;

  const _WrapLayout({required this.state});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final availableWidth = constraints.maxWidth - 48; // Subtract horizontal padding
        final spacing = 24.0;
        final maxCardWidth = 343.0;

        // Ensure at least 2 cards fit side by side
        // Calculate width for 2 cards: (width * 2) + spacing = availableWidth
        double cardWidth = (availableWidth - spacing) / 2;

        // Cap at max width
        if (cardWidth > maxCardWidth) {
          cardWidth = maxCardWidth;
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.only(right: 24, left: 24, bottom: 24),
          child: Wrap(
            spacing: spacing,
            runSpacing: spacing,
            children: state.trips.map((trip) {
              return SizedBox(
                width: cardWidth,
                child: TripCard(trip: trip),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
