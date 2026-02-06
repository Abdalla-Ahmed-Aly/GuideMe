import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/booking/presentation/widgets/tourist_booking_widgets/cancel_button_with_date.dart';

class TodayBookingCard extends StatelessWidget {
  const TodayBookingCard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: () {
        context.push(AppRoutes.bookDetailsScreen);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.p),
        margin: const EdgeInsets.only(bottom: 22),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                AppImages.famousTripTest,
                height: size.height * 0.19,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 8),

            Row(
              children: [
                Text(
                  context.l10n.santoriniIslnd,
                  style: AppTextStyles.interSemiBold16.copyWith(
                    color: AppColors.primary,
                  ),
                ),
                const Spacer(),

                for (int i = 0; i < 5; i++)
                  const Icon(
                    Icons.star_rounded,
                    color: AppColors.yellow,
                    size: 16,
                  ),

                const SizedBox(width: 6),

                Text(
                  "4.8",
                  style: AppTextStyles.interRegular12,
                ),
              ],
            ),

            const SizedBox(height: 8),

            Text(
              'Discover the Pyramids of Giza with a guided tour showcasing ancient history.',
              softWrap: true,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.interRegular10.copyWith(
                color: AppColors.natural4,
              ),
            ),
            Text(
              'Discover the Pyramids of Giza with a guided tour showcasing ancient history.',
              softWrap: true,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.interRegular10.copyWith(
                color: AppColors.natural4,
              ),
            ),
            Text(
              'Discover the Pyramids of Giza with a guided tour showcasing ancient history.',
              softWrap: true,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.interRegular10.copyWith(
                color: AppColors.natural4,
              ),
            ),

            const SizedBox(height: 12),

            const CancelButtonWithDate(),
          ],
        ),
      ),
    );
  }
}
