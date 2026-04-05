import 'package:flutter/material.dart';
import 'package:guide_me/features/booking/domain/entities/booking_entity.dart';
import 'package:guide_me/features/guide_booking/presentation/strategies/guide_booking_card_strategy/guide_trip_card_strategy.dart';
import 'package:guide_me/features/guide_booking/presentation/widgets/guide_live_trip_card.dart';

class GuideLiveCardStrategy implements GuideTripCardStrategy {
  @override
  Widget buildCard(BookingEntity booking) {
    return GuideLiveTripCard(booking: booking);
  }
}