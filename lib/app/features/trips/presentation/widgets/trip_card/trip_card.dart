import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trips_flutter_app/app/core/constants/assets.gen.dart';
import 'package:trips_flutter_app/app/core/widgets/circular_icon_button.dart';

import '../../../../../core/widgets/svg_icon.dart';
import '../../../domain/models/trip.dart';
import '../../../domain/models/trip_dates.dart';
import '../../../domain/models/trip_status.dart';
import 'participant_avatars.dart';

/// Responsive trip card widget that adapts to mobile and web layouts
class TripCard extends StatelessWidget {
  final Trip trip;

  const TripCard({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(children: [_TripCoverImage(trip), _TripDetails(trip)]),
    );
  }
}

/// Trip card cover image
class _TripCoverImage extends StatelessWidget {
  final Trip trip;

  const _TripCoverImage(this.trip);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(14),
        topRight: Radius.circular(14),
      ),
      child: Stack(
        children: [
          // Cover image
          CachedNetworkImage(
            height: 240,
            width: double.infinity,
            imageUrl: trip.coverImage,
            fit: BoxFit.cover,
            placeholder: (context, url) => Container(
              color: Colors.grey[800],
              child: const Center(child: CircularProgressIndicator()),
            ),
            errorWidget: (context, url, error) => Container(
              color: Colors.grey[800],
              child: const Center(child: Icon(Icons.image_not_supported, size: 48)),
            ),
          ),

          // Gradient overlay
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [const Color(0xFF262626), const Color(0xFF262626).withValues(alpha: 0)],
                  stops: const [0.05, 0.6],
                ),
              ),
            ),
          ),

          // More options button
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: CircularIconButton(
                      diameter: 40,
                      onPressed: () {},
                      iconPath: Assets.svgs.dotsHorizontal.path,
                      backgroundColor: Theme.of(
                        context,
                      ).colorScheme.surfaceContainerHighest.withValues(alpha: 0.8),
                    ),
                  ),

                  // Status badge widget for trip status
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                      decoration: BoxDecoration(
                        color: trip.status.color.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: trip.status.color, width: 1),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            trip.status.label,
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w100),
                          ),
                          if (trip.status != TripStatus.readyForTravel) ...[
                            const SizedBox(width: 8),
                            SvgIcon(
                              iconPath: Assets.svgs.chevronDown.path,
                              size: 20,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Trip card content section
class _TripDetails extends StatelessWidget {
  final Trip trip;

  const _TripDetails(this.trip);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 18, top: 0, bottom: 14),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            trip.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 6),
          _TripDateRange(dates: trip.dates),
          Divider(height: 28),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ParticipantAvatars(participants: trip.participants),
              Text(
                '${trip.unfinishedTasks} unfinished tasks',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade500),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Trip date range display with calendar icon and nights count
class _TripDateRange extends StatelessWidget {
  final TripDates dates;

  const _TripDateRange({required this.dates});

  @override
  Widget build(BuildContext context) {
    final startDate = DateFormat('MMM d').format(dates.start);
    final endDate = DateFormat('MMM d, yyyy').format(dates.end);
    final nights = dates.durationInDays - 1;

    return Row(
      children: [
        SvgIcon(iconPath: Assets.svgs.calendar.path, size: 18, color: Colors.grey.shade500),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            '$nights nights ($startDate - $endDate)',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade500),
          ),
        ),
      ],
    );
  }
}
