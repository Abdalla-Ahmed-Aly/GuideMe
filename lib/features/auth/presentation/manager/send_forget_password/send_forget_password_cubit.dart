import 'package:bloc/bloc.dart';
import 'package:guide_me/features/auth/data/models/forget_password/send_forget_password_request_model.dart';
import 'package:guide_me/features/auth/domain/use_case/send_Forget_Password_use_case.dart';
import 'package:meta/meta.dart';

part 'send_forget_password_state.dart';

class SendForgetPasswordCubit extends Cubit<SendForgetPasswordState> {
  SendForgetPasswordCubit(this.sendForgetPasswordUseCase)
    : super(SendForgetPasswordInitial());
  final SendForgetPasswordUseCase sendForgetPasswordUseCase;
  Future<void> sendforgetpassword({required String email}) async {
    emit(SendForgetPasswordLoading());
    final result = await sendForgetPasswordUseCase.call(
      SendForgetPasswordRequestModel(email: email),
    );
    result.fold(
      ifLeft: (failure) {
        emit(
          SendForgetPasswordFailure(failure.message ?? 'Something went wrong'),
        );
      },
      ifRight: (success) {
        emit(SendForgetPasswordSuccess());
      },
    );
  }
}
