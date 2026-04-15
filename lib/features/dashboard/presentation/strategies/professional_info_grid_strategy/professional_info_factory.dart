import 'package:guide_me/features/dashboard/presentation/strategies/professional_info_grid_strategy/desktop_professional_info_strategy.dart';
import 'package:guide_me/features/dashboard/presentation/strategies/professional_info_grid_strategy/mobile_professional_info_strategy.dart';
import 'package:guide_me/features/dashboard/presentation/strategies/professional_info_grid_strategy/professional_info_grid_strategy.dart';
import 'package:guide_me/features/dashboard/presentation/strategies/professional_info_grid_strategy/tablet_professional_info_strategy.dart';

class ProfessionalInfoFactory {
  static ProfessionalInfoGridStrategy getStrategy(double width) {
    if (width < 600) {
      return MobileProfessionalInfoStrategy();
    } else if (width < 1000) {
      return TabletProfessionalInfoStrategy();
    } else {
      return DesktopProfessionalInfoStrategy();
    }
  }
}