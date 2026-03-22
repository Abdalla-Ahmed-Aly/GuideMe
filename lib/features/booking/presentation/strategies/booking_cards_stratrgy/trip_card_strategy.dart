import 'package:flutter/material.dart';
import 'package:guide_me/features/booking/domain/entities/booking_entity.dart';

abstract class TripCardStrategy {
  Widget buildTripCard(BookingEntity booking);
}