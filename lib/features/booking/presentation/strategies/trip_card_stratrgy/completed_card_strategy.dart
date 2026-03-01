import 'package:flutter/material.dart';
import 'package:guide_me/features/booking/presentation/strategies/trip_card_stratrgy/trip_card_strategy.dart';
import 'package:guide_me/core/widgets/completed_trip_card.dart';

class CompletedCardStrategy implements TripCardStrategy {
  @override
  Widget buildTripCard() {
    return const CompletedTripCard();
  }
}