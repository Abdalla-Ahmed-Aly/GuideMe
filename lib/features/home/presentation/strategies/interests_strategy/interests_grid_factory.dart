import 'package:guide_me/features/home/presentation/strategies/interests_strategy/interests_desktop_grid.dart';
import 'package:guide_me/features/home/presentation/strategies/interests_strategy/interests_grid_strategy.dart';
import 'package:guide_me/features/home/presentation/strategies/interests_strategy/interests_mobile_grid.dart';
import 'package:guide_me/features/home/presentation/strategies/interests_strategy/interests_tablet_grid.dart';

class InterestsGridFactory {
  static InterestsGridStrategy getStrategy(double width) {
    if (width > 1000) {
      return InterestsDesktopGrid();
    } else if (width > 600) {
      return InterestsTabletGrid();
    } else {
      return InterestsMobileGrid();
    }
  }
}
