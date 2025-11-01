import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:trips_flutter_app/app/features/trips/data/providers/trips_repository_provider.dart';
import 'package:trips_flutter_app/app/features/trips/domain/participant.dart';
import 'package:trips_flutter_app/app/features/trips/domain/trip.dart';
import 'package:trips_flutter_app/app/features/trips/domain/trip_dates.dart';
import 'package:trips_flutter_app/app/features/trips/domain/trips_repository.dart';
import 'package:trips_flutter_app/app/features/trips/presentation/providers/trips_notifier.dart';

// Mock class for TripsRepository
class MockTripsRepository extends Mock implements TripsRepository {}

void main() {
  late MockTripsRepository mockRepository;

  setUp(() {
    mockRepository = MockTripsRepository();
  });

  group('TripsNotifier', () {
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

    test('initial state should be loading', () {
      // Arrange
      final container = ProviderContainer(
        overrides: [
          tripsRepositoryProvider.overrideWithValue(mockRepository),
        ],
      );
      addTearDown(container.dispose);

      when(() => mockRepository.getTrips()).thenAnswer((_) async => mockTrips);

      // Act
      final state = container.read(tripsProvider);

      // Assert
      expect(state.isLoading, true);
      expect(state.trips, isEmpty);
      expect(state.error, isNull);
    });

    test('should load trips successfully', () async {
      // Arrange
      final container = ProviderContainer(
        overrides: [
          tripsRepositoryProvider.overrideWithValue(mockRepository),
        ],
      );
      addTearDown(container.dispose);

      when(() => mockRepository.getTrips()).thenAnswer((_) async => mockTrips);

      // Act - Read the provider to trigger build
      container.read(tripsProvider);
      
      // Wait for async operations
      await Future.delayed(const Duration(milliseconds: 100));

      // Assert
      final state = container.read(tripsProvider);
      expect(state.isLoading, false);
      expect(state.trips.length, 2);
      expect(state.trips[0].title, 'Banff National Park Adventure');
      expect(state.trips[1].title, 'Santorini Dream Escape');
      expect(state.error, isNull);
      verify(() => mockRepository.getTrips()).called(1);
    });

    test('should handle error when loading trips fails', () async {
      // Arrange
      final container = ProviderContainer(
        overrides: [
          tripsRepositoryProvider.overrideWithValue(mockRepository),
        ],
      );
      addTearDown(container.dispose);

      when(() => mockRepository.getTrips()).thenThrow(Exception('Failed to load trips'));

      // Act - Read the provider to trigger build
      container.read(tripsProvider);
      
      // Wait for async operations
      await Future.delayed(const Duration(milliseconds: 100));

      // Assert
      final state = container.read(tripsProvider);
      expect(state.isLoading, false);
      expect(state.trips, isEmpty);
      expect(state.error, contains('Failed to load trips'));
      verify(() => mockRepository.getTrips()).called(1);
    });

    test('should handle empty trips list', () async {
      // Arrange
      final container = ProviderContainer(
        overrides: [
          tripsRepositoryProvider.overrideWithValue(mockRepository),
        ],
      );
      addTearDown(container.dispose);

      when(() => mockRepository.getTrips()).thenAnswer((_) async => []);

      // Act
      container.read(tripsProvider);
      await Future.delayed(const Duration(milliseconds: 100));

      // Assert
      final state = container.read(tripsProvider);
      expect(state.isLoading, false);
      expect(state.trips, isEmpty);
      expect(state.error, isNull);
      verify(() => mockRepository.getTrips()).called(1);
    });

    test('refresh should reload trips', () async {
      // Arrange
      final container = ProviderContainer(
        overrides: [
          tripsRepositoryProvider.overrideWithValue(mockRepository),
        ],
      );
      addTearDown(container.dispose);

      when(() => mockRepository.getTrips()).thenAnswer((_) async => mockTrips);

      // Act - Initial load
      container.read(tripsProvider);
      await Future.delayed(const Duration(milliseconds: 100));
      
      // Act - Refresh
      final notifier = container.read(tripsProvider.notifier);
      await notifier.refresh();

      // Assert
      final state = container.read(tripsProvider);
      expect(state.isLoading, false);
      expect(state.trips.length, 2);
      expect(state.error, isNull);
      verify(() => mockRepository.getTrips()).called(2); // Called twice: initial + refresh
    });

    test('refresh should handle errors', () async {
      // Arrange
      final container = ProviderContainer(
        overrides: [
          tripsRepositoryProvider.overrideWithValue(mockRepository),
        ],
      );
      addTearDown(container.dispose);

      // First call succeeds, second call fails
      when(() => mockRepository.getTrips())
          .thenAnswer((_) async => mockTrips);

      // Act - Initial load (succeeds)
      container.read(tripsProvider);
      await Future.delayed(const Duration(milliseconds: 100));
      
      // Change mock behavior for refresh
      when(() => mockRepository.getTrips()).thenThrow(Exception('Refresh failed'));
      
      // Act - Refresh (fails)
      final notifier = container.read(tripsProvider.notifier);
      await notifier.refresh();

      // Assert
      final state = container.read(tripsProvider);
      expect(state.isLoading, false);
      expect(state.error, contains('Refresh failed'));
      verify(() => mockRepository.getTrips()).called(2);
    });

    test('state should be immutable and use copyWith correctly', () async {
      // Arrange
      final container = ProviderContainer(
        overrides: [
          tripsRepositoryProvider.overrideWithValue(mockRepository),
        ],
      );
      addTearDown(container.dispose);

      when(() => mockRepository.getTrips()).thenAnswer((_) async => mockTrips);

      // Act
      container.read(tripsProvider);
      await Future.delayed(const Duration(milliseconds: 100));

      // Assert
      final state = container.read(tripsProvider);
      final newState = state.copyWith(isLoading: true);
      
      // Original state should be unchanged
      expect(state.isLoading, false);
      expect(state.trips.length, 2);
      
      // New state should have updated value
      expect(newState.isLoading, true);
      expect(newState.trips.length, 2);
    });

  });

  group('TripsState', () {
    test('copyWith should preserve values when not specified', () {
      // Arrange
      const state = TripsState(
        trips: [],
        isLoading: true,
        error: 'Some error',
      );

      // Act
      final newState = state.copyWith();

      // Assert
      expect(newState.trips, state.trips);
      expect(newState.isLoading, state.isLoading);
      expect(newState.error, state.error);
    });

    test('copyWith should update only specified values', () {
      // Arrange
      final trips = [
        Trip(
          id: '1',
          status: 'Active',
          title: 'Test Trip',
          dates: TripDates(start: DateTime(2024, 1, 1), end: DateTime(2024, 1, 5)),
          participants: const [],
          unfinishedTasks: 0,
          coverImage: 'test.jpg',
        ),
      ];
      const state = TripsState(trips: [], isLoading: false, error: null);

      // Act
      final newState = state.copyWith(trips: trips, isLoading: true);

      // Assert
      expect(newState.trips, trips);
      expect(newState.isLoading, true);
      expect(newState.error, null); // Should remain unchanged
    });

    test('default state should have correct initial values', () {
      // Act
      const state = TripsState();

      // Assert
      expect(state.trips, isEmpty);
      expect(state.isLoading, false);
      expect(state.error, isNull);
    });
  });
}
