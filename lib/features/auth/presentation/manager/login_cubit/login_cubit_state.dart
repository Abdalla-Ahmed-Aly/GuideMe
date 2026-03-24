part of 'login_cubit.dart';

sealed class LoginCubitState {}

final class LoginCubitInitial extends LoginCubitState {}

final class LoginCubitLoading extends LoginCubitState {}

final class LoginCubitSuccessful extends LoginCubitState {
  final AuthResponseEntity data;

  LoginCubitSuccessful(this.data);
}

final class LoginCubitFailure extends LoginCubitState {
  final Failure failure;

  LoginCubitFailure(this.failure);

}

