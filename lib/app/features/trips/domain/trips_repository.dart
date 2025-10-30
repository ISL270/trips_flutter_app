import '../data/remote/trips_remote_source.dart';
import 'trip.dart';

/// Repository for managing trips data
/// Concrete implementation that uses remote data source
class TripsRepository {
  final TripsRemoteSource _remoteSource;

  TripsRepository({TripsRemoteSource? remoteSource})
    : _remoteSource = remoteSource ?? TripsRemoteSource();

  /// Fetches all trips
  Future<List<Trip>> getTrips() async {
    return await _remoteSource.getTrips();
  }
}
