part of 'guide_profile_cubit.dart';

abstract class GuideProfileState {}

class GuideProfileInitial extends GuideProfileState {}

class GuideProfileLoading extends GuideProfileState {
  final String? language;
  GuideProfileLoading({this.language});
}

class GuideProfileSuccess extends GuideProfileState {
  final UserEntity user;
  GuideProfileSuccess({required this.user});
}

class GuideProfileFailure extends GuideProfileState {
  final Failure failure;
  GuideProfileFailure({required this.failure});
}


