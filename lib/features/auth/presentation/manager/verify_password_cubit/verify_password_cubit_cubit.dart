import 'package:bloc/bloc.dart';
import 'package:guide_me/features/auth/data/models/forget_password/verfiy_forget_password_request_model.dart';
import 'package:guide_me/features/auth/domain/use_case/verify_Forget_Password_use_case.dart';
import 'package:meta/meta.dart';

part 'verify_password_cubit_state.dart';

class VerifyPasswordCubitCubit extends Cubit<VerifyPasswordCubitState> {
  VerifyPasswordCubitCubit(this.verifyForgetPasswordUseCase)
    : super(VerifyPasswordCubitInitial());
  final VerifyForgetPasswordUseCase verifyForgetPasswordUseCase;
  Future<void> verifyForgetPassword({
    required String email,
    required String otp,
  }) async {
    emit(VerifyPasswordCubitLoadings());
    final result = await verifyForgetPasswordUseCase.call(
      VerifyForgetPasswordRequestModel(email: email, otp: otp),
    );
    result.fold(
      ifLeft: (failure) {
        emit(VerifyPasswordCubitFailure(failure.message ?? 'this an error'));
      },
      ifRight: (success) {
        emit(VerifyPasswordCubitSuccessful());
      },
    );
  }
}
