import 'package:guide_me/features/guide_registration/presentation/strategies/grid_veiw_strategy/desktop_grid_view.dart';
import 'package:guide_me/features/guide_registration/presentation/strategies/grid_veiw_strategy/grid_view_strategy.dart';
import 'package:guide_me/features/guide_registration/presentation/strategies/grid_veiw_strategy/mobile_grid_view.dart';
import 'package:guide_me/features/guide_registration/presentation/strategies/grid_veiw_strategy/tablet_grid_view.dart';

class GridViewFactory {
  static GridViewStrategy getGridViewStrategy(double width) {
    if (width < 600) {
      return MobileGridView();
    } else if (width < 1000) {
      return TabletGridView();
    } else {
      return DesktopGridView();
    }
  }
}
