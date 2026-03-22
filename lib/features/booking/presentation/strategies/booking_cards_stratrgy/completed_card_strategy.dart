import 'package:flutter/material.dart';
import 'package:guide_me/core/widgets/accepted_trip_card.dart';
import 'package:guide_me/features/booking/domain/entities/booking_entity.dart';
import 'package:guide_me/features/booking/presentation/strategies/booking_cards_stratrgy/trip_card_strategy.dart';

class AcceptedCardStrategy implements TripCardStrategy {
  @override
  Widget buildTripCard(BookingEntity booking) {
    return AcceptedTripCard(booking: booking);
  }
}
