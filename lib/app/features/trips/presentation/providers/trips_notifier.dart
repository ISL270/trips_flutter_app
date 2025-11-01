import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/providers/trips_repository_provider.dart';
import '../../domain/trip.dart';

part 'trips_notifier.g.dart';

/// State for trips feature
class TripsState {
  final List<Trip> trips;
  final bool isLoading;
  final String? error;

  const TripsState({
    this.trips = const [],
    this.isLoading = false,
    this.error,
  });

  TripsState copyWith({
    List<Trip>? trips,
    bool? isLoading,
    String? error,
  }) {
    return TripsState(
      trips: trips ?? this.trips,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

/// Notifier for managing trips state
@riverpod
class TripsNotifier extends _$TripsNotifier {
  @override
  TripsState build() {
    // Start loading immediately after initialization
    Future.microtask(() => loadTrips());
    return const TripsState(isLoading: true);
  }

  /// Loads trips from repository
  Future<void> loadTrips() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final repository = ref.read(tripsRepositoryProvider);
      final trips = await repository.getTrips();
      state = state.copyWith(
        trips: trips,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  /// Refreshes trips data
  Future<void> refresh() async {
    await loadTrips();
  }
}
