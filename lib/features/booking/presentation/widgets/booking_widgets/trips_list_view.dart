import 'package:flutter/material.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/features/booking/domain/enums/trip_status.dart';
import 'package:guide_me/features/booking/presentation/widgets/booking_widgets/trip_card.dart';

class TripsListView extends StatefulWidget {
  const TripsListView({super.key});

  @override
  State<TripsListView> createState() => _TripsListViewState();
}

class _TripsListViewState extends State<TripsListView> {
  List<TripStatus> tripStatus = [
    TripStatus.pending,
    TripStatus.live,
    TripStatus.completed,
    TripStatus.completed,
  ];

  List<DateTime> startDates = [
    DateTime(2026, 2, 15, 19, 50),
    DateTime(2026, 2, 15, 20, 2),
    DateTime(2026, 2, 15, 20, 4),
    DateTime(2026, 2, 15, 20, 6),
  ];

  List<DateTime> endDates = [
    DateTime(2026, 2, 15, 19, 51),
    DateTime(2026, 2, 15, 20, 4),
    DateTime(2026, 2, 15, 20, 6),
    DateTime(2026, 2, 15, 20, 8),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 22.p),
      itemCount: tripStatus.length,
      itemBuilder: (context, index) {
        return TripCard(
          currentIndex: index,
          length: tripStatus.length,
          tripStatus: tripStatus[index],
          startDate: startDates[index],
          endDate: endDates[index],
        );
      },
    );
  }
}
