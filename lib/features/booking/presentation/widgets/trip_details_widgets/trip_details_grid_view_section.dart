import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/features/booking/domain/entities/booking_entity.dart';
import 'package:guide_me/features/booking/presentation/strategies/trip_details_stratrgy/tour_info_layout_factory.dart';
import 'package:guide_me/features/booking/presentation/widgets/trip_details_widgets/tour_details_card.dart';
import 'package:intl/intl.dart';

class TripDetailsGridViewSection extends StatelessWidget {
  final BookingEntity booking;
  const TripDetailsGridViewSection({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    final strategy = TourInfoLayoutFactory.getStrategy(context.screenWidth);

    final cards = [
      TourDetailsCard(
        title: context.l10n.dateTIME,
        value: DateFormat("MMM dd, yyyy").format(booking.startTime),
        subValue: DateFormat("HH:mm a").format(booking.startTime),
        icon: const Icon(
          Icons.calendar_today_outlined,
          size: 20,
          color: AppColors.primary2,
        ),
      ),
      TourDetailsCard(
        title: context.l10n.duration,
        value: "${booking.place.durationMinutes} ${context.l10n.minutes}",
        subValue: context.l10n.flexibleEnd,
        icon: const Icon(
          Icons.timer,
          size: 20,
          color: AppColors.primary2,
        ),
      ),
      TourDetailsCard(
        title: context.l10n.groupsize,
        value: context.l10n.people(booking.persons),
        subValue: context.l10n.privateGroup,
        icon: const Icon(
          Icons.people, //TODO:: change icon
          size: 20,
          color: AppColors.primary2,
        ),
      ),
      TourDetailsCard(
        title: context.l10n.experience,
        value: booking.place.title,
        subValue: context.l10n.historyAndMyths,
        icon: const Icon(
          Icons.explore,
          size: 20,
          color: AppColors.primary2,
        ),
      ),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: cards.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: strategy.crossAxisCount,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: strategy.childAspectRatio,
      ),
      itemBuilder: (context, index) {
        return cards[index];
      },
    );
  }
}
