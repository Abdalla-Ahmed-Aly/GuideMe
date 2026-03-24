part of 'login_with_google_cubit.dart';

@immutable
sealed class LoginwithGoogleState {}

final class LoginwithGoogleInitial extends LoginwithGoogleState {}

final class LoginwithGoogleLoading extends LoginwithGoogleState {}

final class LoginwithGoogleSuccess extends LoginwithGoogleState {
  final AuthResponseEntity  userModel;

  LoginwithGoogleSuccess(this.userModel);
}

final class LoginwithGooglefailure extends LoginwithGoogleState {
  final Failure failure;

  LoginwithGooglefailure(this.failure);

}
