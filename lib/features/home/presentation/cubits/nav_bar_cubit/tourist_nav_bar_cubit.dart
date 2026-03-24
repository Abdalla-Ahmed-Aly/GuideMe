import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/constants/hive_constants.dart';
import 'package:guide_me/core/utils/hive_helper.dart';

part 'tourist_nav_bar_state.dart';

class TouristNavBarCubit extends Cubit<TouristNavBarState> {
  TouristNavBarCubit() : super(const TouristNavBarState());

  void init() {
    final hasSeen =
        HiveHelper.get<bool>(
          boxName: HiveConstants.avatarBox,
          key: HiveConstants.avatarKey,
        ) ??
        false;
    emit(state.copyWith(showWelcomeAvatar: !hasSeen));
  }

  void changeIndex(int index) => emit(state.copyWith(index: index));

  Future<void> hideWelcomeAvatar() async {
    await HiveHelper.put<bool>(
      boxName: HiveConstants.avatarBox,
      key: HiveConstants.avatarKey,
      data: true,
    );
    emit(state.copyWith(showWelcomeAvatar: false));
  }
}
