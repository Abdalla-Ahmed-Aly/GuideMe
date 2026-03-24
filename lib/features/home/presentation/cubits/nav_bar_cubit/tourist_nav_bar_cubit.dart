import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/constants/hive_constants.dart';
import 'package:guide_me/core/utils/hive_helper.dart';

class TouristNavBarCubit extends Cubit<int> {
  TouristNavBarCubit() : super(0);

  bool showWelcomeAvatar = true;

  void init() {
    final hasSeen =
        HiveHelper.get<bool>(
          boxName: HiveConstants.avatarBox,
          key: HiveConstants.avatarKey,
        ) ??
        false;

    showWelcomeAvatar = !hasSeen;
    emit(state);
  }

  void changeIndex(int index) => emit(index);

  Future<void> hideWelcomeAvatar() async {
    showWelcomeAvatar = false;
    await HiveHelper.put<bool>(
      boxName: HiveConstants.avatarBox,
      key: HiveConstants.avatarKey,
      data: true,
    );
    emit(state);
  }
}
