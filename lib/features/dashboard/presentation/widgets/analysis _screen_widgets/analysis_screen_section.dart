import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/booking/presentation/widgets/guide_profile_widgets/comment_item_list_view.dart';
import 'package:guide_me/features/booking/presentation/widgets/guide_profile_widgets/feed_back_travel.dart';
import 'package:guide_me/features/booking/presentation/widgets/guide_profile_widgets/recent_widget.dart';
import 'package:guide_me/features/dashboard/presentation/widgets/analysis%20_screen_widgets/analysis_state_card_section.dart';

class AnalysisScreenSection extends StatelessWidget {
  const AnalysisScreenSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 8),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 23.p),
            child: const AnalysisStatCardSection(),
          ),
          const SizedBox(
            height: 16,
          ),
          Align(
            alignment: AlignmentGeometry.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 24.p),
              child: Text(
                context.l10n.travelerFeedback,
                style: AppTextStyles.poppinsSemiBold20,
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

          const CommentItemListView(
            reviews: [],
          ),
        ],
      ),
    );
  }
}
