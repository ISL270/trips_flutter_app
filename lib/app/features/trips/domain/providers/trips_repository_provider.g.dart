// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trips_repository_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider for TripsRemoteSource

@ProviderFor(tripsRemoteSource)
const tripsRemoteSourceProvider = TripsRemoteSourceProvider._();

/// Provider for TripsRemoteSource

final class TripsRemoteSourceProvider
    extends
        $FunctionalProvider<
          TripsRemoteSource,
          TripsRemoteSource,
          TripsRemoteSource
        >
    with $Provider<TripsRemoteSource> {
  /// Provider for TripsRemoteSource
  const TripsRemoteSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tripsRemoteSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tripsRemoteSourceHash();

  @$internal
  @override
  $ProviderElement<TripsRemoteSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TripsRemoteSource create(Ref ref) {
    return tripsRemoteSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TripsRemoteSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TripsRemoteSource>(value),
    );
  }
}

String _$tripsRemoteSourceHash() => r'fd6e2f862de01568c4d50991e8538285e17d8a69';

/// Provider for TripsRepository

@ProviderFor(tripsRepository)
const tripsRepositoryProvider = TripsRepositoryProvider._();

/// Provider for TripsRepository

final class TripsRepositoryProvider
    extends
        $FunctionalProvider<TripsRepository, TripsRepository, TripsRepository>
    with $Provider<TripsRepository> {
  /// Provider for TripsRepository
  const TripsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tripsRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tripsRepositoryHash();

  @$internal
  @override
  $ProviderElement<TripsRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TripsRepository create(Ref ref) {
    return tripsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TripsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TripsRepository>(value),
    );
  }
}

String _$tripsRepositoryHash() => r'ecb353bad88ad8107f110302e19ecaafa39252f3';
