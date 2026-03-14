import 'package:bloc/bloc.dart';
import 'package:guide_me/features/auth/data/models/forget_password/resend_password_request_model.dart';
import 'package:guide_me/features/auth/domain/use_case/resend_Password_use_case.dart';
import 'package:meta/meta.dart';

part 'resend_forget_password_cubit_state.dart';

class ResendForgetPasswordCubitCubit
    extends Cubit<ResendForgetPasswordCubitState> {
  ResendForgetPasswordCubitCubit(this.resendPasswordUseCase)
    : super(ResendForgetPasswordCubitInitial());
  final ResendPasswordUseCase resendPasswordUseCase;

  Future<void> resendforgetPassword({required String email}) async {
    emit(ResendForgetPasswordCubitLoading());
    final result = await resendPasswordUseCase.call(
      ResendPasswordRequestModel(email: email),
    );
    result.fold(
      ifLeft: (failure) {
        emit(
          ResendForgetPasswordCubFailure(
            failure.message ?? 'Something went wrong',
          ),
        );
      },
      ifRight: (success) {
        emit(ResendForgetPasswordCubitSuccess());
      },
    );
  }
}
