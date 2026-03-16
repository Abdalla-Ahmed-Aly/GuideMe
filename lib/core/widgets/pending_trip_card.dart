import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
            Text(
              DateFormat("hh:mm a").format(booking.startTime),
              style: AppTextStyles.poppinsMedium14.copyWith(
                color: const Color(0xffC3C3C3),
              ),
            ),

            const SizedBox(height: 2),

            // Place Title
            Text(
              booking.place.title,
              style: AppTextStyles.poppinsMedium18.copyWith(
                color: const Color(0xffC3C3C3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
