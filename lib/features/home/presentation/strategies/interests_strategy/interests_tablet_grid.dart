import 'package:guide_me/features/home/presentation/strategies/interests_strategy/interests_grid_strategy.dart';

class InterestsTabletGrid implements InterestsGridStrategy {
  @override
  double getAspectRatio() => .65;

  @override
  double getCrossAxisSpacing() => 50;

  @override
  int getCrossAxisCount() => 3;

  @override
  double getMainAxisSpacing() => 20;
}
