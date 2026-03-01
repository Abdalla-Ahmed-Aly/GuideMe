import 'package:flutter/material.dart';
import 'package:guide_me/features/booking/presentation/strategies/trip_card_stratrgy/trip_card_strategy.dart';
import 'package:guide_me/core/widgets/pending_trip_card.dart';

class PendingCardStrategy implements TripCardStrategy {
  @override
  Widget buildTripCard() {
    return const PendingTripCard();
  }
}