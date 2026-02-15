import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/core/widgets/custom_rating_widget.dart';
import 'package:guide_me/features/booking/presentation/widgets/guide_profile_widgets/guide_info.dart';
import 'package:guide_me/features/booking/presentation/widgets/guide_profile_widgets/profile_avatar_with_status.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class GuideDataSection extends StatelessWidget {
  const GuideDataSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        children: [
          const ProfileAvatarWithStatus(),

          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text(
              "Experienced Egyptologist & Licensed Tour",
              style: AppTextStyles.interMedium14.copyWith(
                color: AppColors.natural3,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 3),
            child: Text(
              "Guide, Cairo",
              style: AppTextStyles.interMedium14.copyWith(
                color: AppColors.natural3,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8),
            child: CustomRatingWidget(
              color: Colors.amber,
            ),
          ),

          const SizedBox(height: 18),

          const GuideInfo(),

          const SizedBox(height: 16),
          Align(
            alignment: AlignmentGeometry.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 24.p),
              child: Text(
                context.l10n.travelerFeedback,
                style: AppTextStyles.poppinsRegular20,
              ),
            ),
          ),
          const SizedBox(
            height: 13,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.p),
            child: const FeedBackTravel(),
          ),
          const SizedBox(
            height: 35,
          ),
          Padding(
            padding: EdgeInsets.only(left: 24.p, right: 32.p),
            child: AppButton(
              onPressed: () {},
              text: context.l10n.recent,
              radius: 30,
              width: 374.w,
              height: 33.h,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}

class FeedBackTravel extends StatelessWidget {
  const FeedBackTravel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffFFE5BA).withValues(alpha: .10),
        border: Border.all(color: const Color(0xffFFE5BA)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  '4.8',
                  style: AppTextStyles.poppinsRegular38,
                ),
                const SizedBox(
                  height: 5,
                ),
                const CustomRatingWidget(color: Color(0xffDD7B03)),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  '123 reviews',
                  style: AppTextStyles.poppinsRegular18,
                ),
                const SizedBox(
                  height: 38,
                ),
              ],
            ),
          ),
          const Column(
            children: [
              RatingRow(rate: 5, percent: 0.80),
              RatingRow(rate: 4, percent: 0.12),
              RatingRow(rate: 3, percent: 0.05),
              RatingRow(rate: 2, percent: 0.02),
              RatingRow(rate: 1, percent: 0.01),
            ],
          ),
        ],
      ),
    );
  }
}

class RatingRow extends StatelessWidget {
  const RatingRow({
    super.key,
    required this.rate,
    required this.percent,
  });
  final int rate;
  final double percent;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.p),
      child: Row(
        children: [
          Text(
            rate.toString(),
            style: AppTextStyles.poppinsRegular14,
          ),
          LinearPercentIndicator(
            width: 200.w,
            lineHeight: 10,
            percent: percent,
            backgroundColor: const Color(0xffFED59B),
            progressColor: const Color(0xffF2930D),
            barRadius: const Radius.circular(20),
          ),
          SizedBox(width: 3.w),
          Text(
            '${(percent * 100).toInt()}%',
            style: const TextStyle(
              color: Color(0xffFF9800),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
