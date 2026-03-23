import 'package:guide_me/features/home/presentation/strategies/interests_strategy/interests_grid_strategy.dart';

class InterestsDesktopGrid implements InterestsGridStrategy {
  @override
  double getAspectRatio() => .7;

  @override
  double getCrossAxisSpacing() => 50;

  @override
  int getCrossAxisCount() => 5;

  @override
  double getMainAxisSpacing() => 20;
}
