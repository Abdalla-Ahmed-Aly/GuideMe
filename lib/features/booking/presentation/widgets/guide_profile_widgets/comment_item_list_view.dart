import 'package:flutter/material.dart';
import 'package:guide_me/core/shared/entities/review_entity.dart';
import 'package:guide_me/features/booking/presentation/widgets/guide_profile_widgets/comment_item.dart';

class CommentItemListView extends StatelessWidget {
  const CommentItemListView({super.key, required this.reviews});

  final List<ReviewEntity> reviews;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: reviews.length,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return CommentItem(review: reviews[index]);
      },
    );
  }
}
