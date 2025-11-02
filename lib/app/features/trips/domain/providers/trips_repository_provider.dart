import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../trips_repository.dart';
import '../../data/remote/trips_remote_source.dart';

part 'trips_repository_provider.g.dart';

/// Provider for TripsRemoteSource
@riverpod
TripsRemoteSource tripsRemoteSource(Ref ref) {
  return TripsRemoteSource();
}

/// Provider for TripsRepository
@riverpod
TripsRepository tripsRepository(Ref ref) {
  final remoteSource = ref.watch(tripsRemoteSourceProvider);
  return TripsRepository(remoteSource: remoteSource);
}
