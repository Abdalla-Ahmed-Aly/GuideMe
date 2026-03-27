import 'package:guide_me/features/booking/presentation/strategies/trip_details_stratrgy/tour_info_layout_strategy.dart';

class DesktopLayoutStrategy implements TourInfoLayoutStrategy {
  @override
  double get childAspectRatio => 1.1;

  @override
  int get crossAxisCount => 4;
}
