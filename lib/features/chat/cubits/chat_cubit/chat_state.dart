part of 'chat_cubit.dart';

class ChatState {
  final bool showTrakingDetials;

  ChatState({required this.showTrakingDetials});

  factory ChatState.initial() {
    return ChatState(showTrakingDetials: true);
  }

  ChatState copyWith({
    bool? showTrakingDetials,
  }) {
    return ChatState(
      showTrakingDetials: showTrakingDetials ?? this.showTrakingDetials,
    );
  }
}
