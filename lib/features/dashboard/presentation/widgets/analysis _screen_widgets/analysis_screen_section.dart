import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/rating_and_reviews_card.dart';
import 'package:guide_me/features/booking/presentation/widgets/guide_profile_widgets/comment_item_list_view.dart';
import 'package:guide_me/features/booking/presentation/widgets/guide_profile_widgets/recent_widget.dart';
import 'package:guide_me/features/dashboard/domain/entities/analysis_entity.dart';
import 'package:guide_me/features/dashboard/presentation/cubits/Analysis_Cubit/analysis_cubit.dart';
import 'package:guide_me/features/dashboard/presentation/widgets/analysis%20_screen_widgets/analysis_state_card_item.dart';

class AnalysisScreenBody extends StatelessWidget {
  const AnalysisScreenBody({super.key, required this.analysis});
  final AnalysisEntity analysis;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      displacement: 50,
      color: AppColors.primary2,
      backgroundColor: Colors.white,
      strokeWidth: 3,
      onRefresh: () async {
        await context.read<AnalysisCubit>().getAnalysis();
      },
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 22.p),
        child: Column(
          children: [
            const SizedBox(height: 8),

            AnalysisStatCardItem(analysis: analysis),

            const SizedBox(height: 16),

            Align(
              alignment: context.isArabic
                  ? AlignmentGeometry.centerRight
                  : AlignmentGeometry.centerLeft,
              child: Text(
                context.l10n.travelerFeedback,
                style: AppTextStyles.poppinsSemiBold20,
              ),
            ),

            const SizedBox(height: 12),

            RatingAndReviewsCard(
              numberOfReviews: analysis.totalReviews,
              rating: analysis.averageRating,
              reviews: analysis.ratingDistribution.map(
                (key, value) => MapEntry(key, value),
              ),
            ),

            const SizedBox(height: 24),

            const RecentWidget(),

            const SizedBox(height: 16),

            BlocBuilder<AnalysisCubit, AnalysisCubitState>(
              builder: (context, state) {
                if (state is AnalysisCubitSuccess) {
                  if (analysis.reviews.isEmpty) {
                    return SizedBox(
                      height: 150,
                      child: Center(
                        child: Text(
                          context.l10n.noFeedbackYet,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    );
                  }

                  return CommentItemListView(reviews: analysis.reviews);
                }

                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
