import 'grid_view_strategy.dart';

class DesktopGridView implements GridViewStrategy {
  @override
  int getCrossAxisCount() {
    return 7;
  }

  @override
  double getChildAspectRatio() {
    return .75;
  }

  @override
  double getCrossAxisSpacing() {
    return 34;
  }

  @override
  double getMainAxisSpacing() {
    return 22;
  }
}
