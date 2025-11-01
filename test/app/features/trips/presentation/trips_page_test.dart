import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trips_flutter_app/app/features/trips/domain/participant.dart';
import 'package:trips_flutter_app/app/features/trips/domain/trip.dart';
import 'package:trips_flutter_app/app/features/trips/domain/trip_dates.dart';
import 'package:trips_flutter_app/app/features/trips/presentation/providers/trips_notifier.dart';
import 'package:trips_flutter_app/app/features/trips/presentation/trips_page.dart';

void main() {
  final mockTrips = [
    Trip(
      id: '1',
      status: 'Proposal Sent',
      title: 'Banff National Park Adventure',
      dates: TripDates(start: DateTime(2024, 1, 16), end: DateTime(2024, 1, 20)),
      participants: const [
        Participant(name: 'Emily Clarke', avatarUrl: 'https://example.com/1.jpg'),
        Participant(name: 'Nina Müller', avatarUrl: 'https://example.com/2.jpg'),
      ],
      unfinishedTasks: 4,
      coverImage: 'https://example.com/cover.jpg',
    ),
    Trip(
      id: '2',
      status: 'Pending Approval',
      title: 'Santorini Dream Escape',
      dates: TripDates(start: DateTime(2024, 1, 16), end: DateTime(2024, 1, 20)),
      participants: const [
        Participant(name: 'Lucas Martinez', avatarUrl: 'https://example.com/3.jpg'),
      ],
      unfinishedTasks: 2,
      coverImage: 'https://example.com/cover2.jpg',
    ),
  ];

  group('TripsPage Widget Tests', () {
    testWidgets('should display loading indicator when loading', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            tripsProvider.overrideWithValue(const TripsState(isLoading: true)),
          ],
          child: const MaterialApp(home: TripsPage()),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsWidgets);
    });

    testWidgets('should display error message when error occurs', (tester) async {
      const errorMessage = 'Failed to load trips';
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            tripsProvider.overrideWithValue(
              const TripsState(isLoading: false, error: errorMessage),
            ),
          ],
          child: const MaterialApp(home: TripsPage()),
        ),
      );

      expect(find.text('Error: $errorMessage'), findsOneWidget);
      expect(find.text('Retry'), findsOneWidget);
    });

    testWidgets('should display empty state when no trips', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            tripsProvider.overrideWithValue(
              const TripsState(isLoading: false, trips: []),
            ),
          ],
          child: const MaterialApp(home: TripsPage()),
        ),
      );

      expect(find.text('No trips found'), findsOneWidget);
    });

    testWidgets('should display list of trips when loaded successfully', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            tripsProvider.overrideWithValue(
              TripsState(isLoading: false, trips: mockTrips),
            ),
          ],
          child: const MaterialApp(home: TripsPage()),
        ),
      );

      expect(find.text('Banff National Park Adventure'), findsOneWidget);
      expect(find.text('Santorini Dream Escape'), findsOneWidget);
      expect(find.text('Status: Proposal Sent'), findsOneWidget);
      expect(find.text('Status: Pending Approval'), findsOneWidget);
      expect(find.text('Participants: 2'), findsOneWidget);
      expect(find.text('Participants: 1'), findsOneWidget);
      expect(find.text('Unfinished Tasks: 4'), findsOneWidget);
      expect(find.text('Unfinished Tasks: 2'), findsOneWidget);
    });

    testWidgets('should render cards for each trip', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            tripsProvider.overrideWithValue(
              TripsState(isLoading: false, trips: mockTrips),
            ),
          ],
          child: const MaterialApp(home: TripsPage()),
        ),
      );

      expect(find.byType(Card), findsNWidgets(2));
    });

    testWidgets('should be scrollable when trips list is long', (tester) async {
      final manyTrips = List.generate(
        20,
        (index) => Trip(
          id: '$index',
          status: 'Active',
          title: 'Trip $index',
          dates: TripDates(start: DateTime(2024, 1, 1), end: DateTime(2024, 1, 5)),
          participants: const [],
          unfinishedTasks: 0,
          coverImage: 'test.jpg',
        ),
      );

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            tripsProvider.overrideWithValue(
              TripsState(isLoading: false, trips: manyTrips),
            ),
          ],
          child: const MaterialApp(home: TripsPage()),
        ),
      );

      expect(find.byType(ListView), findsOneWidget);
    });
  });
}
