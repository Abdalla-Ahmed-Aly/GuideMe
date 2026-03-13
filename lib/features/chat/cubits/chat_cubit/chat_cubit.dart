import 'package:flutter_bloc/flutter_bloc.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatState.initial());

  void showTrackingCard() {
    emit(state.copyWith(
      showTrakingDetials: true, 
    ));
  }

  void hideTrackingCard() {
    emit(state.copyWith(
      showTrakingDetials: false, 
    ));
  }
}
