import 'package:flutter_bloc/flutter_bloc.dart';

class GuideNavigationBarCubit extends Cubit<int> {
  GuideNavigationBarCubit() : super(0);

  void changeIndex(int index) {
    emit(index);
  }
}
