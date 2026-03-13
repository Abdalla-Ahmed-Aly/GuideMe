import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:guide_me/core/app_assets/app_icons.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class BookingPlaceDetailsSection extends StatelessWidget {
  const BookingPlaceDetailsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),

        Row(
          children: [
            Expanded(
              child: Text(
                "Pyramids of Giza in Cairo",
                style: AppTextStyles.poppinsRegular28.copyWith(
                  color: AppColors.black,
                ),
              ),
            ),

            Column(
              children: [
                Text(
                  "\$85/Day",
                  style: AppTextStyles.interSemiBold20.copyWith(
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  '11 person',
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
            SvgPicture.asset(
              AppIcons.vector,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Column(
                children: [
                  Text(
                    context.l10n.duration,
                    style: AppTextStyles.interBold10.copyWith(
                      color: AppColors.natural4,
                    ),
                  ),
                  Text(
                    '3 hr',
                    style: TextStyle(
                      fontFamily: 'lato',
                      fontSize: 10.fs,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 14),

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
                    style: AppTextStyles.interBold10.copyWith(
                      color: AppColors.natural4,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '5.0',
                        style: TextStyle(
                          fontFamily: 'lato',
                          fontSize: 10.fs,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(width: 2),

                      Text(
                        '(2.9k Reviews)',
                        style: AppTextStyles.interSemiBold10.copyWith(
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
          "Discover the Pyramids of Giza with a guided tour showcasing ancient history, the Great Pyramid, and the iconic Sphinx — all in one unforgettable experience.",
          style: AppTextStyles.interRegular14.copyWith(
            color: AppColors.natural4,
          ),
          softWrap: true,
        ),

        const SizedBox(height: 8),

        Text(
          'Discover the Pyramids of Giza with a guided tour showcasing ancient history, the Great Pyramid, and the iconic Sphinx — all in one unforgettable experience.',
          style: AppTextStyles.interRegular12.copyWith(
            color: AppColors.natural4,
          ),
          softWrap: true,
        ),

        const SizedBox(height: 32),
      ],
    );
  }
}
