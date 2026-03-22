import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/booking/presentation/args/book_place_args.dart';

class BookingPlaceDetailsSection extends StatelessWidget {
  const BookingPlaceDetailsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bookPlaceArgs = GoRouterState.of(context).extra as BookPlaceArgs;
    final place = bookPlaceArgs.place;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),

        Row(
          children: [
            Expanded(
              child: Text(
                place.title,
                style: AppTextStyles.poppinsSemiBold24.copyWith(
                  color: AppColors.black,
                ),
              ),
            ),

            Column(
              children: [
                Text(
                  "\$${place.price}/${context.l10n.day}",
                  style: AppTextStyles.interSemiBold20.copyWith(
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "${bookPlaceArgs.addBookingRequest.persons} ${context.l10n.person}",
                  style: AppTextStyles.interSemiBold14.copyWith(
                    color: const Color(0xffFFB23F),
                  ),
                ),
              ],
            ),
          ],
        ),

        const SizedBox(height: 8),

        Text(
          context.l10n.overview,
          style: AppTextStyles.interSemiBold18.copyWith(
            color: AppColors.blue,
          ),
        ),

        const SizedBox(height: 16),

        Row(
          children: [
            // Duration
            const Icon(
              Icons.timer,
              color: AppColors.blue,
              size: 28,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.l10n.duration,
                    style: AppTextStyles.interBold12.copyWith(
                      color: AppColors.natural4,
                    ),
                  ),
                  Text(
                    "${place.durationMinutes} ${context.l10n.minutes}",
                    style: TextStyle(
                      fontFamily: 'lato',
                      fontSize: 12.fs,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 16),

            const Icon(
              Icons.star_rounded,
              size: 28,
              color: Color(0xffFFDA44),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.l10n.rate,
                    style: AppTextStyles.interBold12.copyWith(
                      color: AppColors.natural4,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        place.rating.toString(),
                        style: TextStyle(
                          fontFamily: 'lato',
                          fontSize: 12.fs,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(width: 2),

                      Text(
                        '(${place.reviewsCount} ${context.l10n.reviews})',
                        style: AppTextStyles.interSemiBold12.copyWith(
                          color: AppColors.natural4,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 22),

        Text(
          place.description ?? "",
          style: AppTextStyles.interRegular14.copyWith(
            color: AppColors.natural4,
          ),
        ),

        const SizedBox(height: 32),
      ],
    );
  }
}
