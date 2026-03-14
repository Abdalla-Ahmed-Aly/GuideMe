part of 'resend_forget_password_cubit.dart';

@immutable
sealed class ResendForgetPasswordCubitState {}

final class ResendForgetPasswordCubitInitial
    extends ResendForgetPasswordCubitState {}

final class ResendForgetPasswordCubitLoading
    extends ResendForgetPasswordCubitState {}

final class ResendForgetPasswordCubitSuccess
    extends ResendForgetPasswordCubitState {}

final class ResendForgetPasswordCubFailure
    extends ResendForgetPasswordCubitState {
  final Failure failure;

  ResendForgetPasswordCubFailure(this.failure);
}
