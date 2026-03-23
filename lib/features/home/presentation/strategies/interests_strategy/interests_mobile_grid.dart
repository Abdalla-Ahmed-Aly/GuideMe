import 'package:guide_me/features/home/presentation/strategies/interests_strategy/interests_grid_strategy.dart';

class InterestsMobileGrid implements InterestsGridStrategy {
  @override
  double getAspectRatio() => .73;

  @override
  double getCrossAxisSpacing() => 50;

  @override
  int getCrossAxisCount() => 2;

  @override
  double getMainAxisSpacing() => 20;
}
