import 'grid_view_strategy.dart';

class MobileGridView implements GridViewStrategy {
  @override
  int getCrossAxisCount() {
    return 3;
  }

  @override
  double getChildAspectRatio() {
    return .8;
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