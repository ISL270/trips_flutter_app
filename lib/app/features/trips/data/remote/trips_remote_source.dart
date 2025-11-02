import 'dart:convert';

import 'package:flutter/services.dart';

import '../../domain/models/trip.dart';
import 'models/trips_response_dto.dart';

/// Remote data source for trips
/// Loads mock data from trips_mock.json asset
class TripsRemoteSource {
  final AssetBundle _assetBundle;

  TripsRemoteSource({AssetBundle? assetBundle}) : _assetBundle = assetBundle ?? rootBundle;

  /// Fetches all trips from the mock JSON file
  Future<List<Trip>> getTrips() async {
    try {
      // Load JSON from assets
      final jsonString = await _assetBundle.loadString('trips_mock.json');

      // Parse JSON
      final jsonMap = json.decode(jsonString) as Map<String, dynamic>;

      // Deserialize to DTO
      final response = TripsResponseDto.fromJson(jsonMap);

      // Convert DTOs to domain entities
      return response.trips.map((dto) => dto.toDomain()).toList();
    } catch (e) {
      throw Exception('Failed to load trips: $e');
    }
  }
}
