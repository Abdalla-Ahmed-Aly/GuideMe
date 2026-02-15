import 'package:flutter/material.dart';
import 'package:guide_me/features/booking/presentation/widgets/booking_widgets/live_trip_card.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TripsListViewWithTimeLine extends StatelessWidget {
  const TripsListViewWithTimeLine({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return TimelineTile(
          endChild: const LiveTripCard(),
          isFirst: index == 0,
          isLast: index == 4,
          beforeLineStyle: const LineStyle(
            color: Colors.grey,
            thickness: 2,
          ),
          afterLineStyle: const LineStyle(
            color: Colors.grey,
            thickness: 2,
          ),
        );
      },
    );
  }
}
