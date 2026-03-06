import 'package:flutter/material.dart';
import 'package:guide_me/features/booking/presentation/strategies/trip_details_stratrgy/tour_info_layout_strategy.dart';

class TabletLayoutStrategy implements TourInfoLayoutStrategy {
  @override
  Widget buildLayout(List<Widget> cards) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: cards.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 1.2,
      ),
      itemBuilder: (context, index) {
        return cards[index];
      },
    );
  }
}