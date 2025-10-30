import 'package:equatable/equatable.dart';

/// Domain entity representing trip date range
class TripDates extends Equatable {
  final DateTime start;
  final DateTime end;

  const TripDates({required this.start, required this.end});

  /// Duration of the trip in days
  int get durationInDays => end.difference(start).inDays + 1;

  @override
  List<Object?> get props => [start, end];
}
