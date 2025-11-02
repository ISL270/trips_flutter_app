// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TripDto _$TripDtoFromJson(Map<String, dynamic> json) => TripDto(
  id: json['id'] as String,
  status: json['status'] as String,
  title: json['title'] as String,
  dates: TripDatesDto.fromJson(json['dates'] as Map<String, dynamic>),
  participants: (json['participants'] as List<dynamic>)
      .map((e) => ParticipantDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  unfinishedTasks: (json['unfinished_tasks'] as num).toInt(),
  coverImage: json['cover_image'] as String,
);

Map<String, dynamic> _$TripDtoToJson(TripDto instance) => <String, dynamic>{
  'id': instance.id,
  'status': instance.status,
  'title': instance.title,
  'dates': instance.dates,
  'participants': instance.participants,
  'unfinished_tasks': instance.unfinishedTasks,
  'cover_image': instance.coverImage,
};
