part of 'register_cubit.dart';
sealed class RegisterCubitState {}

final class RegisterCubitInitial extends RegisterCubitState {}

final class RegisterCubitLoading extends RegisterCubitState {}

final class RegisterCubitSuccessful extends RegisterCubitState {}

final class RegisterCubitFailure extends RegisterCubitState {
  final Failure failure;

  RegisterCubitFailure(this.failure);

}
