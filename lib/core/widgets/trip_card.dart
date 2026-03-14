import 'package:flutter/material.dart';
import 'package:guide_me/features/booking/domain/enums/tourist_trip_status.dart';
import 'package:guide_me/features/booking/presentation/strategies/trip_card_stratrgy/trip_card_factory.dart';
import 'package:guide_me/core/widgets/time_line.dart';

class TripCard extends StatelessWidget {
  const TripCard({
    super.key,
    required this.length,
    required this.currentIndex,
    required this.tripStatus,
    required this.startDate,
    required this.endDate,
  });
  final int length;
  final int currentIndex;
  final BookingStatus tripStatus;
  final DateTime startDate;
  final DateTime endDate;

  @override
  Widget build(BuildContext context) {
    final strategy = TripCardFactory.buildTripCard(tripStatus);
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TimeLine(
            currentIndex: currentIndex,
            length: length,
            startDate: startDate,
            endDate: endDate,
          ),

          const SizedBox(width: 14),

          Expanded(
            child: strategy.buildTripCard(),
          ),
        ],
      ),
    );
  }
}
