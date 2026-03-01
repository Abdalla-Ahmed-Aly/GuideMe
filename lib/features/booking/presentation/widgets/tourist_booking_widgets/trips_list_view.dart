import 'package:flutter/material.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/features/booking/domain/enums/tourist_trip_status.dart';
import 'package:guide_me/core/widgets/trip_card.dart';

class TripsListView extends StatefulWidget {
  const TripsListView({super.key});

  @override
  State<TripsListView> createState() => _TripsListViewState();
}

class _TripsListViewState extends State<TripsListView> {
  List<TouristTripStatus> tripStatus = [
    TouristTripStatus.pending,
    TouristTripStatus.live,
    TouristTripStatus.completed,
    TouristTripStatus.completed,
  ];

  List<DateTime> startDates = [
    DateTime(2026, 2, 15, 20, 11),
    DateTime(2026, 2, 15, 20, 12),
    DateTime(2026, 2, 15, 20, 14),
    DateTime(2026, 2, 15, 20, 16),
  ];

  List<DateTime> endDates = [
    DateTime(2026, 2, 15, 20, 13),
    DateTime(2026, 2, 15, 20, 15),
    DateTime(2026, 2, 15, 20, 17),
    DateTime(2026, 2, 15, 20, 19),
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
