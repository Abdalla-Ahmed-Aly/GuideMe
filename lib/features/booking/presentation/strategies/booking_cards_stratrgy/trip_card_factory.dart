import 'package:guide_me/features/booking/domain/enums/tourist_booking_status.dart';
import 'package:guide_me/features/booking/presentation/strategies/booking_cards_stratrgy/completed_card_strategy.dart';
import 'package:guide_me/features/booking/presentation/strategies/booking_cards_stratrgy/live_card_strategy.dart';
import 'package:guide_me/features/booking/presentation/strategies/booking_cards_stratrgy/pending_card_strategy.dart';
import 'package:guide_me/features/booking/presentation/strategies/booking_cards_stratrgy/trip_card_strategy.dart';

class TripCardFactory {
  static TripCardStrategy buildTripCard(TouristBookingStatus status) {
    if (status == TouristBookingStatus.completed) {
      return PendingCardStrategy();
    } else if (status == TouristBookingStatus.accepted) {
      return AcceptedCardStrategy();
    } else if (status == TouristBookingStatus.live) {
      return LiveCardStrategy();
    }
    return PendingCardStrategy();
  }
}
