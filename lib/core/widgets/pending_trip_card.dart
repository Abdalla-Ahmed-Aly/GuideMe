import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/booking/domain/entities/booking_entity.dart';
import 'package:guide_me/features/booking/domain/enums/tourist_booking_status.dart';
import 'package:intl/intl.dart';

class PendingTripCard extends StatelessWidget {
  const PendingTripCard({super.key, required this.booking});
  final BookingEntity booking;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (booking.status == TouristBookingStatus.completed) {
          context.push(AppRoutes.completedtripdetailes, extra: booking);
        } else {
          context.push(AppRoutes.pendingApprovalScreen, extra: booking);
        }
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: const Color(0xffF0F0F0),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: const Color(0xffBFBFBF).withValues(alpha: .7),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Time
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateFormat(
                    "MMM dd, yyyy - hh:mm a",
                  ).format(booking.startTime),
                  style: AppTextStyles.poppinsMedium16.copyWith(
                    color: const Color(0xffC3C3C3),
                  ),
                ),

                if (booking.status == TouristBookingStatus.pending)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF3B82F6).withValues(alpha: .8),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      context.l10n.pending,
                      style: AppTextStyles.poppinsMedium14.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                if (booking.status == TouristBookingStatus.completed)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF6B7280).withValues(alpha: .7),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      context.l10n.completed,
                      style: AppTextStyles.poppinsMedium14.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),

            const SizedBox(height: 6),

            // Place Title
            Text(
              booking.place.title,
              style: AppTextStyles.poppinsSemiBold18.copyWith(
                color: const Color(0xffC3C3C3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
