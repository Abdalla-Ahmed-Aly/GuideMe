import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/features/booking/domain/entities/booking_entity.dart';
import 'package:guide_me/features/booking/presentation/widgets/accepted_screen_widgets/guider_profile_section.dart';
import 'package:guide_me/features/booking/presentation/widgets/custom_trip_details_tile.dart';
import 'package:guide_me/features/booking/presentation/widgets/panding_approval_widgets/custom_text_badge.dart';
import 'package:guide_me/features/booking/presentation/widgets/panding_approval_widgets/estimated_earnings_section.dart';
import 'package:intl/intl.dart';

class UpcomingTourCard extends StatelessWidget {
  const UpcomingTourCard({super.key});

  @override
  Widget build(BuildContext context) {
    final booking = GoRouterState.of(context).extra as BookingEntity;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 22),
      decoration: BoxDecoration(
        color: const Color(0xffFFE5BA).withValues(alpha: .10),
        border: Border.all(color: const Color(0xffFFE5BA)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextBadge(
            text: context.l10n.upcomingTour,
          ),

          const SizedBox(height: 12),

          GuiderProfileSection(guider: booking.guider!),

          const SizedBox(height: 18),

          CustomTripDetailsTile(
            title: context.l10n.meetingPoint,
            value: booking.place.title,
            icon: const Icon(
              Icons.location_on_rounded,
              color: AppColors.primary2,
            ),
          ),

          const SizedBox(height: 12),

          CustomTripDetailsTile(
            title: context.l10n.date,
            value: DateFormat("MMM d, yyyy, h:mm a").format(booking.startTime),
            icon: const Icon(
              Icons.calendar_today_outlined,
              color: AppColors.primary2,
            ),
          ),

          const SizedBox(height: 12),

          EstimatedEarningsSection(
            color: AppColors.white,
            price: booking.totalPrice,
          ),
        ],
      ),
    );
  }
}
