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

  /// Fetches a single trip by ID
  /// Returns null if trip is not found
  Future<Trip?> getTripById(String id) async {
    return await _remoteSource.getTripById(id);
  }

  /// Filters trips by status
  Future<List<Trip>> getTripsByStatus(String status) async {
    final trips = await getTrips();
    return trips.where((trip) => trip.status == status).toList();
  }

  /// Gets all unique trip statuses
  Future<List<String>> getUniqueStatuses() async {
    final trips = await getTrips();
    return trips.map((trip) => trip.status).toSet().toList();
  }
}
