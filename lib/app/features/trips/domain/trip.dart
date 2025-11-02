import 'package:equatable/equatable.dart';

import 'participant.dart';
import 'trip_dates.dart';
import 'trip_status.dart';

/// Domain entity representing a trip
class Trip extends Equatable {
  final String id;
  final TripStatus status;
  final String title;
  final TripDates dates;
  final List<Participant> participants;
  final int unfinishedTasks;
  final String coverImage;

  const Trip({
    required this.id,
    required this.status,
    required this.title,
    required this.dates,
    required this.participants,
    required this.unfinishedTasks,
    required this.coverImage,
  });

  @override
  List<Object?> get props => [id, status, title, dates, participants, unfinishedTasks, coverImage];
}
