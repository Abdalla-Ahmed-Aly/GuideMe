import 'package:guide_me/features/booking/presentation/strategies/trip_details_stratrgy/desktop_layout_strategy.dart';
import 'package:guide_me/features/booking/presentation/strategies/trip_details_stratrgy/mobile_layout_strategy.dart';
import 'package:guide_me/features/booking/presentation/strategies/trip_details_stratrgy/tablet_layout_strategy.dart';
import 'package:guide_me/features/booking/presentation/strategies/trip_details_stratrgy/tour_info_layout_strategy.dart';

class TourInfoLayoutFactory {
  static TourInfoLayoutStrategy getStrategy(double width) {
    if (width < 600) {
      return MobileLayoutStrategy();
    } else if (width < 1000) {
      return TabletLayoutStrategy();
    } else {
      return DesktopLayoutStrategy();
    }
  }
}
