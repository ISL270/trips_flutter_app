import 'package:json_annotation/json_annotation.dart';

import '../../domain/trip.dart';
import 'participant_dto.dart';
import 'trip_dates_dto.dart';

part 'trip_dto.g.dart';

/// DTO for Trip - handles JSON serialization/deserialization
@JsonSerializable()
class TripDto {
  final String id;
  final String status;
  final String title;
  final TripDatesDto dates;
  final List<ParticipantDto> participants;
  @JsonKey(name: 'unfinished_tasks')
  final int unfinishedTasks;
  @JsonKey(name: 'cover_image')
  final String coverImage;

  const TripDto({
    required this.id,
    required this.status,
    required this.title,
    required this.dates,
    required this.participants,
    required this.unfinishedTasks,
    required this.coverImage,
  });

  factory TripDto.fromJson(Map<String, dynamic> json) => _$TripDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TripDtoToJson(this);

  /// Convert DTO to domain entity
  Trip toDomain() {
    return Trip(
      id: id,
      status: status,
      title: title,
      dates: dates.toDomain(),
      participants: participants.map((p) => p.toDomain()).toList(),
      unfinishedTasks: unfinishedTasks,
      coverImage: coverImage,
    );
  }

  /// Create DTO from domain entity
  factory TripDto.fromDomain(Trip trip) {
    return TripDto(
      id: trip.id,
      status: trip.status,
      title: trip.title,
      dates: TripDatesDto.fromDomain(trip.dates),
      participants: trip.participants.map((p) => ParticipantDto.fromDomain(p)).toList(),
      unfinishedTasks: trip.unfinishedTasks,
      coverImage: trip.coverImage,
    );
  }
}
