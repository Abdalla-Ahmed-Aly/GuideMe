import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/features/auth/data/models/forget_password/reset_password_request_model.dart';
import 'package:guide_me/features/auth/domain/use_case/reset_Password_use_case.dart';
import 'package:injectable/injectable.dart';

part 'reset_password_state.dart';

@injectable
class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit(this.resetPasswordUseCase) : super(ResetPasswordInitial());
  final ResetPasswordUseCase resetPasswordUseCase;

  void safeEmit(ResetPasswordState state) {
    if (!isClosed) emit(state);
  }

  Future<void> resetPassword({
    required String email,
    required String newPassword,
    required String confirmPassword,
    required String otp,
  }) async {
    safeEmit(ResetPasswordLoading());
    final result = await resetPasswordUseCase.call(
      ResetPasswordRequestModel(
        email: email,
        newPassword: newPassword,
        confirmPassword: confirmPassword,
        forgotPasswordOTP: otp,
      ),
    );
    result.fold(
      (failure) {
        safeEmit(ResetPasswordfailure(failure));
      },
      (success) {
        safeEmit(ResetPasswordSuccess());
      },
    );
  }
}
