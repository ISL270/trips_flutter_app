import 'package:json_annotation/json_annotation.dart';

import 'trip_dto.dart';

part 'trips_response_dto.g.dart';

/// DTO for the root JSON response containing trips array
@JsonSerializable()
class TripsResponseDto {
  final List<TripDto> trips;

  const TripsResponseDto({required this.trips});

  factory TripsResponseDto.fromJson(Map<String, dynamic> json) => _$TripsResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TripsResponseDtoToJson(this);
}
