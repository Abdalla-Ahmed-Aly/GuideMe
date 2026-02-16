import 'package:flutter/material.dart';
import 'package:guide_me/features/booking/presentation/widgets/guide_profile_widgets/comment_item.dart';

class CommentItemListView extends StatelessWidget {
  const CommentItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      shrinkWrap: true,
      padding: const EdgeInsets.only(top: 10),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          child: CommentItem(),
        );
      },
    );
  }
}
