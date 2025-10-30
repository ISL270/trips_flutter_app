import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../domain/trip_dates.dart';

part 'trip_dates_dto.g.dart';

/// DTO for TripDates - handles JSON serialization/deserialization
/// Dates in JSON are in format: "dd-MM-yyyy"
@JsonSerializable()
class TripDatesDto {
  final String start;
  final String end;

  const TripDatesDto({required this.start, required this.end});

  factory TripDatesDto.fromJson(Map<String, dynamic> json) =>
      _$TripDatesDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TripDatesDtoToJson(this);

  /// Convert DTO to domain entity
  /// Parses date strings in format "dd-MM-yyyy"
  TripDates toDomain() {
    final dateFormat = DateFormat('dd-MM-yyyy');
    return TripDates(
      start: dateFormat.parse(start),
      end: dateFormat.parse(end),
    );
  }

  /// Create DTO from domain entity
  factory TripDatesDto.fromDomain(TripDates dates) {
    final dateFormat = DateFormat('dd-MM-yyyy');
    return TripDatesDto(
      start: dateFormat.format(dates.start),
      end: dateFormat.format(dates.end),
    );
  }
}
