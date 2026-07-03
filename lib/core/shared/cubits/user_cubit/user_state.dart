part of 'user_cubit.dart';

sealed class UserState {}

final class UserInitial extends UserState {}

final class UserLoading extends UserState {}

final class UserSuccess extends UserState {
  final UserEntity user;

  UserSuccess(this.user);
}

final class UserFailure extends UserState {
  final Failure? failure;

  UserFailure(this.failure);
}
