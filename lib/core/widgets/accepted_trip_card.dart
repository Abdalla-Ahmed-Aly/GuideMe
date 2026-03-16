import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/booking/domain/entities/booking_entity.dart';
import 'package:intl/intl.dart';

class AcceptedTripCard extends StatelessWidget {
  const AcceptedTripCard({super.key, required this.booking});
  final BookingEntity booking;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppRoutes.acceptedScreen, extra: booking);
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.black.withValues(alpha: .15),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Time
            Text(
              DateFormat("hh:mm a").format(booking.startTime),
              style: AppTextStyles.poppinsMedium14,
            ),

            const SizedBox(height: 2),

            // Place Title
            Text(
              booking.place.title,
              style: AppTextStyles.poppinsMedium18,
            ),
          ],
        ),
      ),
    );
  }
}
