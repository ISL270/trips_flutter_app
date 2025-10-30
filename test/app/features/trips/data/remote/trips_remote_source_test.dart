import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:trips_flutter_app/app/features/trips/data/remote/trips_remote_source.dart';
import 'package:trips_flutter_app/app/features/trips/domain/participant.dart';
import 'package:trips_flutter_app/app/features/trips/domain/trip.dart';
import 'package:trips_flutter_app/app/features/trips/domain/trip_dates.dart';

// Mock class for AssetBundle
class MockAssetBundle extends Mock implements AssetBundle {}

void main() {
  late TripsRemoteSource remoteSource;
  late MockAssetBundle mockAssetBundle;

  setUp(() {
    mockAssetBundle = MockAssetBundle();
    remoteSource = TripsRemoteSource(assetBundle: mockAssetBundle);
  });

  group('TripsRemoteSource', () {
    const mockJsonData = '''
{
  "trips": [
    {
      "id": "1",
      "status": "Proposal Sent",
      "title": "Banff National Park Adventure",
      "dates": {
        "start": "16-01-2024",
        "end": "20-01-2024"
      },
      "participants": [
        { "name": "Emily Clarke", "avatar_url": "https://example.com/1.jpg" },
        { "name": "Nina Müller", "avatar_url": "https://example.com/2.jpg" }
      ],
      "unfinished_tasks": 4,
      "cover_image": "https://example.com/cover.jpg"
    },
    {
      "id": "2",
      "status": "Pending Approval",
      "title": "Santorini Dream Escape",
      "dates": {
        "start": "16-01-2024",
        "end": "20-01-2024"
      },
      "participants": [
        { "name": "Lucas Martinez", "avatar_url": "https://example.com/3.jpg" }
      ],
      "unfinished_tasks": 2,
      "cover_image": "https://example.com/cover2.jpg"
    }
  ]
}''';

    test('getTrips should return list of trips from JSON', () async {
      // Arrange
      when(
        () => mockAssetBundle.loadString('trips_mock.json'),
      ).thenAnswer((_) async => mockJsonData);

      // Act
      final result = await remoteSource.getTrips();

      // Assert
      expect(result, isA<List<Trip>>());
      expect(result.length, 2);

      // Verify first trip
      expect(result[0].id, '1');
      expect(result[0].status, 'Proposal Sent');
      expect(result[0].title, 'Banff National Park Adventure');
      expect(result[0].unfinishedTasks, 4);
      expect(result[0].coverImage, 'https://example.com/cover.jpg');
      expect(result[0].participants.length, 2);
      expect(result[0].participants[0].name, 'Emily Clarke');
      expect(result[0].participants[0].avatarUrl, 'https://example.com/1.jpg');

      // Verify dates
      expect(result[0].dates, isA<TripDates>());
      expect(result[0].dates.start, DateTime(2024, 1, 16));
      expect(result[0].dates.end, DateTime(2024, 1, 20));

      // Verify second trip
      expect(result[1].id, '2');
      expect(result[1].status, 'Pending Approval');
      expect(result[1].title, 'Santorini Dream Escape');
      expect(result[1].participants.length, 1);
    });

    test('getTrips should parse participants correctly', () async {
      // Arrange
      when(
        () => mockAssetBundle.loadString('trips_mock.json'),
      ).thenAnswer((_) async => mockJsonData);

      // Act
      final result = await remoteSource.getTrips();

      // Assert
      final participants = result[0].participants;
      expect(participants, isA<List<Participant>>());
      expect(participants[0], isA<Participant>());
      expect(participants[0].name, 'Emily Clarke');
      expect(participants[0].avatarUrl, 'https://example.com/1.jpg');
      expect(participants[1].name, 'Nina Müller');
      expect(participants[1].avatarUrl, 'https://example.com/2.jpg');
    });

    test('getTrips should parse dates correctly', () async {
      // Arrange
      when(
        () => mockAssetBundle.loadString('trips_mock.json'),
      ).thenAnswer((_) async => mockJsonData);

      // Act
      final result = await remoteSource.getTrips();

      // Assert
      final dates = result[0].dates;
      expect(dates.start, DateTime(2024, 1, 16));
      expect(dates.end, DateTime(2024, 1, 20));
      expect(dates.durationInDays, 5);
    });

    test('getTrips should throw exception when JSON is invalid', () async {
      // Arrange - Mock invalid JSON
      when(
        () => mockAssetBundle.loadString('trips_mock.json'),
      ).thenAnswer((_) async => 'invalid json');

      // Act & Assert
      expect(() => remoteSource.getTrips(), throwsA(isA<Exception>()));
    });

    test('getTrips should throw exception when asset loading fails', () async {
      // Arrange - Mock asset loading failure
      when(
        () => mockAssetBundle.loadString('trips_mock.json'),
      ).thenThrow(Exception('Asset not found'));

      // Act & Assert
      expect(() => remoteSource.getTrips(), throwsA(isA<Exception>()));
    });
  });
}
