import 'package:guide_me/features/dashboard/presentation/strategies/professional_info_grid_strategy/professional_info_grid_strategy.dart';

class TabletProfessionalInfoStrategy implements ProfessionalInfoGridStrategy {
  @override
  double getChildAspectRatio() {
    return 1;
  }

  @override
  int getCrossAxisCount() {
    return 3;
  }
}