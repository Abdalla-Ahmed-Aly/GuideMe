import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:guide_me/core/app_assets/app_icons.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/features/booking/domain/entities/booking_entity.dart';
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
            CustomTripdetails(
              title: context.l10n.date,
              value: DateFormat('MMM d, yyyy').format(booking.startTime),
              pathicon: SvgPicture.asset(
                AppIcons.clender,
                width: 20,
              ),
            ),

            CustomTripdetails(
              pathicon: SvgPicture.asset(
                AppIcons.time,
                width: 20,
              ),
              title: context.l10n.time,
              value: TimeOfDay.fromDateTime(booking.startTime).format(context),
            ),
          ],
        ),

        const SizedBox(height: 18),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTripdetails(
              title: context.l10n.durationText,
              value: '${booking.place.durationMinutes} min',
              pathicon: const Icon(
                FontAwesomeIcons.hourglassEnd,
                size: 24,
                color: AppColors.primary2,
              ),
            ),

            CustomTripdetails(
              pathicon: SvgPicture.asset(
                AppIcons.people,
                width: 24,
              ),
              title: context.l10n.groupSize,
              value: context.l10n.people(booking.persons),
            ),
          ],
        ),
      ],
    );
  }
}

class CustomTripdetails extends StatelessWidget {
  const CustomTripdetails({
    super.key,
    required this.title,
    required this.value,
    required this.pathicon,
  });

  final String title;
  final String value;
  final Widget pathicon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: AppColors.white,
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: pathicon,
          ),
        ),
        const SizedBox(
          width: 6,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 15.fs,
                color: const Color(0xff7C6965),
                fontWeight: FontWeight.w500,
              ),
            ),

            Text(
              value,
              style: TextStyle(
                fontSize: 16.fs,
                color: AppColors.black,
                fontWeight: FontWeight.w400,
              ),
            ),

            //
          ],
        ),
      ],
    );
  }
}
