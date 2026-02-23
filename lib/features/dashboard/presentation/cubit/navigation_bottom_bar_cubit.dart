import 'package:bloc/bloc.dart';

class NavigationBottomBarCubitCubit extends Cubit<int> {
  NavigationBottomBarCubitCubit() : super(0);
    void changeIndex(int index) {
    emit(index);
  }
}
