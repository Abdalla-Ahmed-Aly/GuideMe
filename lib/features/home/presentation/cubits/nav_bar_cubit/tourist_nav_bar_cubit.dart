import 'package:flutter_bloc/flutter_bloc.dart';

class TouristNavBarCubit extends Cubit<int> {
  TouristNavBarCubit() : super(0);

  void changeIndex(int index) {
    emit(index);
  }
}
