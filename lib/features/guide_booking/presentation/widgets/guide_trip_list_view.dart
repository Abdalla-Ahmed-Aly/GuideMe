import 'package:flutter/material.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/features/booking/domain/entities/booking_entity.dart';
import 'package:guide_me/features/guide_booking/presentation/strategies/guide_booking_card_strategy/guide_trip_card_factory.dart';

class GuideTripListView extends StatelessWidget {
  const GuideTripListView({super.key, required this.bookings});
  final List<BookingEntity> bookings;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 22.p),
      itemCount: bookings.length,
      itemBuilder: (context, index) {
        final card = GuideTripCardFactory.getStrategy(bookings[index]);
        return card.buildCard(bookings[index]);
      },
    );
  }
}
