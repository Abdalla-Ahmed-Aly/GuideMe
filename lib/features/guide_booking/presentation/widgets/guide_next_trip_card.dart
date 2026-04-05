import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/features/booking/domain/entities/booking_entity.dart';
import 'package:intl/intl.dart';

class GuideNextTripCard extends StatelessWidget {
  const GuideNextTripCard({super.key, required this.booking});
  final BookingEntity booking;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppRoutes.tripDetailsScreen, extra: booking);
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
                    "MMM dd, yyyy",
                  ).format(booking.bookingDate),
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
                    color: Colors.green.withValues(alpha: .7),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    context.l10n.next,
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

            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: AppButton(
                    onPressed: () {},
                    text: context.l10n.startTour,
                    height: 44,
                    backgroundColor: AppColors.primary2,
                    radius: 100,
                  ),
                ),

                const SizedBox(width: 12),

                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Color(0xffFEF4E6),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.chat_outlined,
                    color: Color(0xffF2930D),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
