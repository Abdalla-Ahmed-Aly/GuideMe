import 'package:flutter/material.dart';
import 'package:guide_me/core/widgets/pending_trip_card.dart';
import 'package:guide_me/features/booking/domain/entities/booking_entity.dart';
import 'package:guide_me/features/guide_booking/presentation/strategies/guide_booking_card_strategy/guide_trip_card_strategy.dart';

class GuideCompletedCardStrategy implements GuideTripCardStrategy {
  @override
  Widget buildCard(BookingEntity booking) {
    return PendingTripCard(booking: booking);
  }
}