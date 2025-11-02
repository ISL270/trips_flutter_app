import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:trips_flutter_app/app/features/trips/data/remote/trips_remote_source.dart';
import 'package:trips_flutter_app/app/features/trips/domain/participant.dart';
import 'package:trips_flutter_app/app/features/trips/domain/trip.dart';
import 'package:trips_flutter_app/app/features/trips/domain/trip_dates.dart';
import 'package:trips_flutter_app/app/features/trips/domain/trip_status.dart';
import 'package:trips_flutter_app/app/features/trips/domain/trips_repository.dart';

// Mock class for TripsRemoteSource
class MockTripsRemoteSource extends Mock implements TripsRemoteSource {}

void main() {
  late TripsRepository repository;
  late MockTripsRemoteSource mockRemoteSource;

  setUp(() {
    mockRemoteSource = MockTripsRemoteSource();
    repository = TripsRepository(remoteSource: mockRemoteSource);
  });

  group('TripsRepository', () {
    final mockTrips = [
      Trip(
        id: '1',
        status: TripStatus.proposalSent,
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
        status: TripStatus.pendingApproval,
        title: 'Santorini Dream Escape',
        dates: TripDates(start: DateTime(2024, 1, 16), end: DateTime(2024, 1, 20)),
        participants: const [
          Participant(name: 'Lucas Martinez', avatarUrl: 'https://example.com/3.jpg'),
        ],
        unfinishedTasks: 2,
        coverImage: 'https://example.com/cover2.jpg',
      ),
      Trip(
        id: '3',
        status: TripStatus.proposalSent,
        title: 'Maldives Island Retreat',
        dates: TripDates(start: DateTime(2024, 2, 1), end: DateTime(2024, 2, 5)),
        participants: const [
          Participant(name: 'Liam Wong', avatarUrl: 'https://example.com/4.jpg'),
        ],
        unfinishedTasks: 3,
        coverImage: 'https://example.com/cover3.jpg',
      ),
    ];

    test('getTrips should return list of trips from remote source', () async {
      // Arrange
      when(() => mockRemoteSource.getTrips()).thenAnswer((_) async => mockTrips);

      // Act
      final result = await repository.getTrips();

      // Assert
      expect(result, mockTrips);
      verify(() => mockRemoteSource.getTrips()).called(1);
    });

    test('getTrips should propagate exceptions from remote source', () async {
      // Arrange
      when(() => mockRemoteSource.getTrips()).thenThrow(Exception('Failed to load trips'));

      // Act & Assert
      expect(() => repository.getTrips(), throwsA(isA<Exception>()));
      verify(() => mockRemoteSource.getTrips()).called(1);
    });

    test('getTrips should return empty list when remote source returns empty', () async {
      // Arrange
      when(() => mockRemoteSource.getTrips()).thenAnswer((_) async => []);

      // Act
      final result = await repository.getTrips();

      // Assert
      expect(result, isEmpty);
      verify(() => mockRemoteSource.getTrips()).called(1);
    });

    test('repository should use default remote source when none provided', () async {
      // Arrange
      final repoWithDefaultSource = TripsRepository();

      // Act & Assert
      // This test verifies that the repository can be instantiated without
      // providing a remote source (it will use the default one)
      expect(repoWithDefaultSource, isA<TripsRepository>());
    });

    test('getTrips should return trips with correct data structure', () async {
      // Arrange
      when(() => mockRemoteSource.getTrips()).thenAnswer((_) async => mockTrips);

      // Act
      final result = await repository.getTrips();

      // Assert
      expect(result.length, 3);
      expect(result[0].id, '1');
      expect(result[0].title, 'Banff National Park Adventure');
      expect(result[0].status, TripStatus.proposalSent);
      expect(result[0].participants.length, 2);
      expect(result[0].dates.durationInDays, 5);
      expect(result[1].id, '2');
      expect(result[1].participants.length, 1);
      expect(result[2].id, '3');
    });
  });
}
