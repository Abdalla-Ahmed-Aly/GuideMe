import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/custom_rating_widget.dart';
import 'package:guide_me/features/booking/presentation/widgets/guide_profile_widgets/comment_item_list_view.dart';
import 'package:guide_me/features/booking/presentation/widgets/guide_profile_widgets/feed_back_travel.dart';
import 'package:guide_me/features/booking/presentation/widgets/guide_profile_widgets/guide_info.dart';
import 'package:guide_me/features/booking/presentation/widgets/guide_profile_widgets/profile_avatar_with_status.dart';
import 'package:guide_me/features/booking/presentation/widgets/guide_profile_widgets/recent_widget.dart';

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
          const RecentWidget(),
          // const SizedBox(
          //   height: 16,
          // ),
          const CommentItemListView(),
        ],
      ),
    );
  }
}
