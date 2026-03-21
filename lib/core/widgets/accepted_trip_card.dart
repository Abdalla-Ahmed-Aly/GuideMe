import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateFormat(
                    "MMM dd, yyyy - hh:mm a",
                  ).format(booking.startTime),
                  style: AppTextStyles.poppinsMedium16.copyWith(
                    color: Colors.black.withValues(alpha: .5),
                  ),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green.withValues(alpha: .8),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    context.l10n.accepted,
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
              style: AppTextStyles.poppinsSemiBold18,
            ),
          ],
        ),
      ),
    );
  }
}
