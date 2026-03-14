part of 'send_forget_password_cubit.dart';

@immutable
sealed class SendForgetPasswordState {}

final class SendForgetPasswordInitial extends SendForgetPasswordState {}

final class SendForgetPasswordLoading extends SendForgetPasswordState {}

final class SendForgetPasswordSuccess extends SendForgetPasswordState {}

final class SendForgetPasswordFailure extends SendForgetPasswordState {
  final Failure failure;

  SendForgetPasswordFailure(this.failure);

}
