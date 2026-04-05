import 'package:guide_me/features/booking/domain/entities/booking_entity.dart';
import 'package:guide_me/features/guide_booking/presentation/strategies/guide_booking_card_strategy/guide_completed_card_strategy.dart';
import 'package:guide_me/features/guide_booking/presentation/strategies/guide_booking_card_strategy/guide_live_card_strategy.dart';
import 'package:guide_me/features/guide_booking/presentation/strategies/guide_booking_card_strategy/guide_next_trip_strategy.dart';
import 'package:guide_me/features/booking/domain/enums/tourist_booking_status.dart';
import 'package:guide_me/features/guide_booking/presentation/strategies/guide_booking_card_strategy/guide_trip_card_strategy.dart';

class GuideTripCardFactory {
  static GuideTripCardStrategy getStrategy(BookingEntity booking) {
    if (booking.status == TouristBookingStatus.accepted) {
      return GuideNextTripStrategy();
    }
    if (booking.status == TouristBookingStatus.live) {
      return GuideLiveCardStrategy();
    }
    if (booking.status == TouristBookingStatus.completed) {
      return GuideCompletedCardStrategy();
    }
    return GuideNextTripStrategy();
  }
}