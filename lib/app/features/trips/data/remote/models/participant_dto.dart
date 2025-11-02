import 'package:json_annotation/json_annotation.dart';

import '../../../domain/models/participant.dart';

part 'participant_dto.g.dart';

/// DTO for Participant - handles JSON serialization/deserialization
@JsonSerializable()
class ParticipantDto {
  final String name;
  @JsonKey(name: 'avatar_url')
  final String avatarUrl;

  const ParticipantDto({required this.name, required this.avatarUrl});

  factory ParticipantDto.fromJson(Map<String, dynamic> json) => _$ParticipantDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ParticipantDtoToJson(this);

  /// Convert DTO to domain entity
  Participant toDomain() {
    return Participant(name: name, avatarUrl: avatarUrl);
  }

  /// Create DTO from domain entity
  factory ParticipantDto.fromDomain(Participant participant) {
    return ParticipantDto(name: participant.name, avatarUrl: participant.avatarUrl);
  }
}
