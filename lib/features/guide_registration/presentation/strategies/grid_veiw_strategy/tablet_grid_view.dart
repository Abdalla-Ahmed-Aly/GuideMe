import 'grid_view_strategy.dart';

class TabletGridView implements GridViewStrategy {
  @override
  int getCrossAxisCount() {
    return 5;
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