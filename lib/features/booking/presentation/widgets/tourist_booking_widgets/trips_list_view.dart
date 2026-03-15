import 'package:flutter/material.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/features/booking/domain/entities/booking_entity.dart';
import 'package:guide_me/features/booking/presentation/strategies/booking_cards_stratrgy/trip_card_factory.dart';

class TripsListView extends StatelessWidget {
  const TripsListView({super.key, required this.bookings});
  final List<BookingEntity> bookings;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 22.p),
      itemCount: bookings.length,
      itemBuilder: (context, index) {
        final strategy = TripCardFactory.buildTripCard(bookings[index].status);
        return strategy.buildTripCard(bookings[index]);
      },
    );
  }
}
