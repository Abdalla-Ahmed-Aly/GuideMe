import 'package:flutter/material.dart';
import 'package:guide_me/features/booking/presentation/widgets/book_tour_widgets/guide_info_card.dart';

class GuideInfoListViewBuilder extends StatelessWidget {
  const GuideInfoListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 20),
      itemBuilder: (context, index) {
        return const GuideInfoCard();
      },
      itemCount: 20,
    );
  }
}
