import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/errors/failure_ui_mapper.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/extentions/snake_bar_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/shared/entities/review_entity.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/rating_and_reviews_card.dart';
import 'package:guide_me/features/booking/presentation/widgets/guide_profile_widgets/comment_item_list_view.dart';
import 'package:guide_me/features/booking/presentation/widgets/guide_profile_widgets/recent_widget.dart';
import 'package:guide_me/features/dashboard/presentation/cubits/Analysis_Cubit/analysis_cubit.dart';
import 'package:guide_me/features/dashboard/presentation/widgets/analysis%20_screen_widgets/analysis_state_card_section.dart';
import 'package:guide_me/features/dashboard/presentation/widgets/analysis_card_shimmer.dart';

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
            child: BlocConsumer<AnalysisCubit, AnalysisCubitState>(
              listener: (context, state) {
                if (state is AnalysisCubitFailure) {
                  final error = FailureUiMapper.map(
                    context: context,
                    failure: state.failure,
                  );
                  context.showErrorSnakbar(message: error.message);
                }
              },
              builder: (context, state) {
                if (state is AnalysisCubitLoading) {
                  return const AnalysisCardShimmer();
                }
                if (state is AnalysisCubitSuccess) {
                  final data = state.analysisResponse.data;
                  final reting = state.analysisResponse.data.ratingDistribution;
                  // return FeedBackTravel(
                  //   data: data,
                  //   // ratingDistribution: reting,
                  // );

                  final Map<String, num> ratingDistribution = data
                      .ratingDistribution
                      .map((key, value) => MapEntry(key, value));

                  return RatingAndReviewsCard(
                    numberOfReviews: data.totalReviews,
                    rating: data.averageRating,
                    reviews: ratingDistribution,
                  );
                }
                return const SizedBox();
              },
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.p),
            child: const RecentWidget(),
          ),

          BlocBuilder<AnalysisCubit, AnalysisCubitState>(
            builder: (context, state) {
              if (state is AnalysisCubitSuccess) {
                final List<ReviewEntity> reviewsList =
                    (state.analysisResponse.data.reviews as List)
                        .map((e) => e as ReviewEntity)
                        .toList();

                if (reviewsList.isEmpty) {
                  return const SizedBox(
                    height: 150,
                    child: Center(
                      child: Text(
                        'No feedback yet',
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ),
                  );
                }

                return CommentItemListView(reviews: reviewsList);
              }

              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
