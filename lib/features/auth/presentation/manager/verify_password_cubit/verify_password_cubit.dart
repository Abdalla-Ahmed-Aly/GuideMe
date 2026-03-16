import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/features/auth/data/models/forget_password/verfiy_forget_password_request_model.dart';
import 'package:guide_me/features/auth/domain/use_case/verify_Forget_Password_use_case.dart';
import 'package:injectable/injectable.dart';

part 'verify_password_cubit_state.dart';
@injectable
class VerifyPasswordCubit extends Cubit<VerifyPasswordCubitState> {
  VerifyPasswordCubit(this.verifyForgetPasswordUseCase)
    : super(VerifyPasswordCubitInitial());
  final VerifyForgetPasswordUseCase verifyForgetPasswordUseCase;
  void safesEmit(VerifyPasswordCubitState state) {
    if (!isClosed) emit(state);
  }
  Future<void> verifyForgetPassword({
    required String email,
    required String otp,
  }) async {
    safesEmit(VerifyPasswordCubitLoadings());
    final result = await verifyForgetPasswordUseCase.call(
      VerifyForgetPasswordRequestModel(email: email, forgotPasswordOTP: otp),
    );
    result.fold(
      (failure) {
        safesEmit(VerifyPasswordCubitFailure(failure));
      },
      (success) {
        safesEmit(VerifyPasswordCubitSuccessful());
      },
    );
  }
}
