import 'package:flutter/material.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class AnalysisStatCardItem extends StatelessWidget {
  const AnalysisStatCardItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(color: const Color(0xffFFE5BA)),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      context.l10n.totalEarnings,
                      style: AppTextStyles.poppinsSemiBold14.copyWith(
                        color: const Color(0xff40C057),
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Image.asset(
                      AppImages.money1,
                      width: 20.w,
                    ),
                  ],
                ),
                Text(
                  'EGP',
                  style: AppTextStyles.poppinsSemiBold30,
                ),
                const SizedBox(
                  height: 6,
                ),
                Text('50,565', style: AppTextStyles.poppinsSemiBold24),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  '+25.2%',
                  style: AppTextStyles.poppinsMedium18.copyWith(
                    color: const Color(0xff40C057),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(color: const Color(0xffFFE5BA)),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      context.l10n.completed,
                      style: AppTextStyles.poppinsMedium16.copyWith(
                        color: const Color(0xff986C2E),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Image.asset(
                      AppImages.item,
                      width: 20.w,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Tours',
                  style: AppTextStyles.poppinsMedium16.copyWith(
                    color: const Color(0xff986C2E),
                  ),
                ),
                const SizedBox(
                  width: 13,
                ),
                Text('125', style: AppTextStyles.poppinsMedium18),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  '+15%',
                  style: AppTextStyles.poppinsMedium18.copyWith(
                    color: const Color(0xff40C057),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
