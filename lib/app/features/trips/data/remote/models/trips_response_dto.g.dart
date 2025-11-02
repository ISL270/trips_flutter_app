// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trips_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TripsResponseDto _$TripsResponseDtoFromJson(Map<String, dynamic> json) =>
    TripsResponseDto(
      trips: (json['trips'] as List<dynamic>)
          .map((e) => TripDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TripsResponseDtoToJson(TripsResponseDto instance) =>
    <String, dynamic>{'trips': instance.trips};
