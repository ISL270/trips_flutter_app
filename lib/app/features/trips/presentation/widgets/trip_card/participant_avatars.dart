import 'package:flutter/material.dart';
import 'package:trips_flutter_app/app/core/widgets/profile_avatar.dart';

import '../../../domain/models/participant.dart';

/// Displays overlapping circular avatars for trip participants
class ParticipantAvatars extends StatelessWidget {
  static const double avatarSize = 32;
  static const double overlapOffset = 16;

  final List<Participant> participants;

  const ParticipantAvatars({super.key, required this.participants});

  @override
  Widget build(BuildContext context) {
    if (participants.isEmpty) return const SizedBox.shrink();

    // Show max 3 participants, plus a +X circle if there are more
    final hasMore = participants.length > 3;
    final displayParticipants = participants.take(3).toList();
    final totalCircles = hasMore ? 4 : displayParticipants.length;

    return SizedBox(
      height: avatarSize,
      width: _calculateWidth(totalCircles),
      child: Stack(
        children: [
          // Display participant avatars
          for (int i = 0; i < displayParticipants.length; i++)
            Positioned(
              left: i * overlapOffset,
              child: Container(
                width: avatarSize,
                height: avatarSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Theme.of(context).colorScheme.surfaceContainerHighest,
                    width: 2,
                  ),
                ),
                child: ProfileAvatar(
                  imageUrl: displayParticipants[i].avatarUrl,
                  fallbackText: displayParticipants[i].name.isNotEmpty
                      ? displayParticipants[i].name[0].toUpperCase()
                      : 'U',
                  size: avatarSize,
                ),
              ),
            ),
          // Display +X circle if there are more participants
          if (hasMore)
            Positioned(
              left: 3 * overlapOffset,
              child: _RemainingParticipantsCircle(count: participants.length - 3),
            ),
        ],
      ),
    );
  }

  double _calculateWidth(int count) {
    return avatarSize + (overlapOffset * (count - 1));
  }
}

/// Circle showing remaining participant count
class _RemainingParticipantsCircle extends StatelessWidget {
  final int count;

  const _RemainingParticipantsCircle({required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ParticipantAvatars.avatarSize,
      height: ParticipantAvatars.avatarSize,
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey.shade800),
      child: Center(
        child: Text(
          '+$count',
          style: Theme.of(
            context,
          ).textTheme.labelSmall?.copyWith(color: Theme.of(context).colorScheme.primary),
        ),
      ),
    );
  }
}
