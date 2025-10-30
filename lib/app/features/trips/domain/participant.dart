import 'package:equatable/equatable.dart';

/// Domain entity representing a trip participant
class Participant extends Equatable {
  final String name;
  final String avatarUrl;

  const Participant({required this.name, required this.avatarUrl});

  @override
  List<Object?> get props => [name, avatarUrl];
}
