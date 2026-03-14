import 'package:bloc/bloc.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/features/auth/data/models/forget_password/resend_password_request_model.dart';
import 'package:guide_me/features/auth/domain/use_case/resend_Password_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'resend_forget_password_cubit_state.dart';
@injectable

class ResendForgetPasswordCubitCubit
    extends Cubit<ResendForgetPasswordCubitState> {
  ResendForgetPasswordCubitCubit(this.resendPasswordUseCase)
    : super(ResendForgetPasswordCubitInitial());
  final ResendPasswordUseCase resendPasswordUseCase;
  void safestate(ResendForgetPasswordCubitState state) {
    if (!isClosed) emit(state);
  }
  Future<void> resendForgetPassword({required String email}) async {
    safestate(ResendForgetPasswordCubitLoading());
    final result = await resendPasswordUseCase.call(
      ResendPasswordRequestModel(email: email),
    );
    result.fold(
      ifLeft: (failure) {
        safestate(
          ResendForgetPasswordCubFailure(
            failure,
          ),
        );
      },
      ifRight: (success) {
        safestate(ResendForgetPasswordCubitSuccess());
      },
    );
  }
}
