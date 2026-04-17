import 'package:flutter/material.dart';
import 'package:guide_me/features/booking/presentation/strategies/booking_cards_stratrgy/trip_card_strategy.dart';
import 'package:guide_me/features/booking/presentation/widgets/tourist_booking_widgets/live_trip_card.dart';
import 'package:guide_me/features/booking/domain/entities/booking_entity.dart';

class LiveCardStrategy implements TripCardStrategy {
  @override
  Widget buildTripCard(BookingEntity booking) {
    return LiveTripCard(booking: booking);
  }
}