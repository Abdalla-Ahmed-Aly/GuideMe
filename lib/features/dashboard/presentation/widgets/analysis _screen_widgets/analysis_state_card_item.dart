import 'package:flutter/material.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/dashboard/domain/entities/analysis_entity.dart';

class AnalysisStatCardItem extends StatelessWidget {
  const AnalysisStatCardItem({
    super.key,
    required this.analysis,
  });
  final AnalysisEntity analysis;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _StatCardItem(
          title: context.l10n.totalEarnings,
          titleColor: const Color(0xff40C057),
          subtitleTextStyle: AppTextStyles.poppinsBold16.copyWith(
            color: AppColors.black,
          ),
          iconPath: AppImages.money1,
          subtitle: context.l10n.egp,
          value: '${analysis.totalEarnings}',
          growth: analysis.earningsGrowth,
        ),

        const SizedBox(width: 20),

        _StatCardItem(
          title: context.isEnglish
              ? context.l10n.completed
              : context.l10n.tours,
          titleColor: const Color(0xff986C2E),
          subtitleTextStyle: AppTextStyles.poppinsMedium16.copyWith(
            color: const Color(0xff986C2E),
          ),
          iconPath: AppImages.item,
          subtitle: context.isEnglish
              ? context.l10n.tours
              : context.l10n.completed,
          value: '${analysis.completedTours}',
          growth: analysis.toursGrowth,
        ),
      ],
    );
  }
}

class _StatCardItem extends StatelessWidget {
  const _StatCardItem({
    required this.title,
    required this.titleColor,
    required this.iconPath,
    required this.subtitle,
    required this.subtitleTextStyle,
    required this.value,
    required this.growth,
  });

  final String title;
  final Color titleColor;
  final String iconPath;
  final String subtitle;
  final TextStyle subtitleTextStyle;
  final String value;
  final double growth;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: const Color(0xffFFE5BA)),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: AppTextStyles.poppinsSemiBold14.copyWith(
                      color: titleColor,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Image.asset(
                  iconPath,
                  width: 20.w,
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(subtitle, style: subtitleTextStyle),
            const SizedBox(height: 8),
            Text(
              value,
              style: AppTextStyles.poppinsSemiBold24,
            ),
            const SizedBox(height: 8),
            Text(
              growth > 0 ? '+$growth%' : '$growth%',
              style: AppTextStyles.poppinsMedium18.copyWith(
                color: growth > 0
                    ? const Color(0xff40C057)
                    : growth == 0
                    ? AppColors.primary2
                    : const Color(0xffC04040),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
