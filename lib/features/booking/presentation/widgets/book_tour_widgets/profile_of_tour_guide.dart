import 'package:flutter/material.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/custom_rating_widget.dart';

class ProfileOfTourGuide extends StatelessWidget {
  const ProfileOfTourGuide({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 42,
          backgroundColor: Color(0xFFE6ECEE),
        ),

        const SizedBox(width: 24),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'John Doe',
              style: AppTextStyles.poppinsSemiBold18,
            ),

            Text(
              "Mars, Solar System",
              style: AppTextStyles.poppinsRegular12.copyWith(
                color: AppColors.natural1,
              ),
            ),
            const CustomRatingWidget(),
          ],
        ),
      ],
    );
  }
}
