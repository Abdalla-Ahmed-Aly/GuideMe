import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/booking/domain/entities/booking_entity.dart';
import 'package:guide_me/features/booking/presentation/strategies/trip_details_stratrgy/mobile_layout_strategy.dart';
import 'package:guide_me/features/booking/presentation/strategies/trip_details_stratrgy/tablet_layout_strategy.dart';
import 'package:guide_me/features/booking/presentation/strategies/trip_details_stratrgy/tour_info_layout_strategy.dart';
import 'package:guide_me/features/booking/presentation/widgets/completed_trip_details_widgets/total_price_section.dart';
import 'package:guide_me/features/booking/presentation/widgets/completed_trip_details_widgets/tour_details_card.dart';
import 'package:guide_me/features/booking/presentation/widgets/completed_trip_details_widgets/completed_trip_header.dart';
import 'package:guide_me/features/dashboard/presentation/widgets/booking_request_screen_widgets/meeting_point_section.dart';
import 'package:intl/intl.dart';

class CompletedTripScreenBody extends StatelessWidget {
  const CompletedTripScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final booking = GoRouterState.of(context).extra as BookingEntity;
    final TourInfoLayoutStrategy strategy = context.screenWidth < 600
        ? MobileLayoutStrategy()
        : TabletLayoutStrategy();

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

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.p),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),

          CompletedTripHeader(guider: booking.guider!),

          const SizedBox(height: 22),

          strategy.buildLayout(cards),

          const MeetingPointSection(),

          const SizedBox(height: 20),

          Text(
            context.l10n.paymentSummary,
            style: AppTextStyles.poppinsSemiBold20,
          ),

          const SizedBox(height: 12),

          TotalPriceSection(totalPrice: booking.totalPrice),

          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
