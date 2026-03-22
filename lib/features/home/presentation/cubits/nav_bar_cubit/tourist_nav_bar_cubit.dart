import 'package:flutter_bloc/flutter_bloc.dart';

class TouristNavBarCubit extends Cubit<int> {
  TouristNavBarCubit() : super(0);

  bool showWelcomeAvatar = true;

  void changeIndex(int index) {
    emit(index);
  }

  void hideWelcomeAvatar() {
    showWelcomeAvatar = false;
    emit(state);
  }
}
