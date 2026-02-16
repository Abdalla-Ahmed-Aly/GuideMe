import 'package:guide_me/features/booking/domain/enums/trip_status.dart';
import 'package:guide_me/features/booking/presentation/strategies/trip_card_stratrgy/completed_card_strategy.dart';
import 'package:guide_me/features/booking/presentation/strategies/trip_card_stratrgy/live_card_strategy.dart';
import 'package:guide_me/features/booking/presentation/strategies/trip_card_stratrgy/pending_card_strategy.dart';
import 'package:guide_me/features/booking/presentation/strategies/trip_card_stratrgy/trip_card_strategy.dart';

class TripCardFactory {
  static TripCardStrategy buildTripCard(TripStatus status) {
    if (status == TripStatus.completed) {
      return CompletedCardStrategy();
    } else if (status == TripStatus.live) {
      return LiveCardStrategy();
    }
    return PendingCardStrategy();
  }
}
