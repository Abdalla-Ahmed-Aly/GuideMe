import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guide_me/core/app_assets/app_icons.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/features/booking/domain/entities/booking_entity.dart';
import 'package:guide_me/features/booking/presentation/widgets/custom_trip_details_tile.dart';
import 'package:intl/intl.dart';

class TripDetailsSection extends StatelessWidget {
  const TripDetailsSection({super.key, required this.booking});
  final BookingEntity booking;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CustomTripDetailsTile(
                title: context.l10n.date,
                value: DateFormat('MMM d, yyyy').format(booking.startTime),
                icon: SvgPicture.asset(
                  AppIcons.clender, // TODO:: change all icons
                  width: 20,
                ),
              ),
            ),

            Expanded(
              child: CustomTripDetailsTile(
                icon: SvgPicture.asset(
                  AppIcons.time,
                  width: 20,
                ),
                title: context.l10n.time,
                value: TimeOfDay.fromDateTime(
                  booking.startTime,
                ).format(context),
              ),
            ),
          ],
        ),

        const SizedBox(height: 18),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CustomTripDetailsTile(
                title: context.l10n.durationText,
                value: '${booking.place.durationMinutes} min',
                icon: const Icon(
                  Icons.hourglass_empty,
                  size: 24,
                  color: AppColors.primary2,
                ),
              ),
            ),

            Expanded(
              child: CustomTripDetailsTile(
                icon: SvgPicture.asset(
                  AppIcons.people,
                  width: 24,
                ),
                title: context.l10n.groupSize,
                value: context.l10n.people(booking.persons),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
