part of 'tourist_nav_bar_cubit.dart';

class TouristNavBarState {
  final int index;
  final bool showWelcomeAvatar;

  const TouristNavBarState({
    this.index = 0,
    this.showWelcomeAvatar = false,
  });

  TouristNavBarState copyWith({int? index, bool? showWelcomeAvatar}) {
    return TouristNavBarState(
      index: index ?? this.index,
      showWelcomeAvatar: showWelcomeAvatar ?? this.showWelcomeAvatar,
    );
  }
}