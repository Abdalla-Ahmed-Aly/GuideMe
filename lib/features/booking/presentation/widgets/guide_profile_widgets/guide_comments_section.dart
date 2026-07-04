import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/shared/entities/user_entity.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/booking/presentation/widgets/guide_profile_widgets/comment_item_list_view.dart';

class GuideCommentsSection extends StatelessWidget {
  const GuideCommentsSection({super.key, required this.guide});

  final UserEntity guide;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.reviews,
          style: AppTextStyles.poppinsSemiBold20,
        ),

        const SizedBox(height: 14),

        if (guide.reviews.isEmpty)
          SizedBox(
            height: 100.h,
            child: Center(
              child: Text(
                context.l10n.noReviews,
                style: AppTextStyles.interRegular14.copyWith(
                  color: AppColors.black,
                ),
              ),
            ),
          )
        else
          CommentItemListView(reviews: guide.reviews),
      ],
    );
  }
}
