part of 'verify_password_cubit.dart';

@immutable
sealed class VerifyPasswordCubitState {}

final class VerifyPasswordCubitInitial extends VerifyPasswordCubitState {}

final class VerifyPasswordCubitLoadings extends VerifyPasswordCubitState {}

final class VerifyPasswordCubitSuccessful extends VerifyPasswordCubitState {}

final class VerifyPasswordCubitFailure extends VerifyPasswordCubitState {
  final Failure failure;

  VerifyPasswordCubitFailure(this.failure);
  
}
