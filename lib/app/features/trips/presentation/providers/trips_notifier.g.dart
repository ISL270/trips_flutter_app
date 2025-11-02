// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trips_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Notifier for managing trips state

@ProviderFor(TripsNotifier)
const tripsProvider = TripsNotifierProvider._();

/// Notifier for managing trips state
final class TripsNotifierProvider
    extends $NotifierProvider<TripsNotifier, TripsState> {
  /// Notifier for managing trips state
  const TripsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tripsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tripsNotifierHash();

  @$internal
  @override
  TripsNotifier create() => TripsNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TripsState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TripsState>(value),
    );
  }
}

String _$tripsNotifierHash() => r'2262182141f94d31e3e57ae18735d777c0e188d6';

/// Notifier for managing trips state

abstract class _$TripsNotifier extends $Notifier<TripsState> {
  TripsState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<TripsState, TripsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TripsState, TripsState>,
              TripsState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
