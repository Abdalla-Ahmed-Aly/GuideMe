import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/features/auth/data/models/forget_password/send_forget_password_request_model.dart';
import 'package:guide_me/features/auth/domain/use_case/send_Forget_Password_use_case.dart';
import 'package:injectable/injectable.dart';

part 'send_forget_password_state.dart';
@injectable
class SendForgetPasswordCubit extends Cubit<SendForgetPasswordState> {
  SendForgetPasswordCubit(this.sendForgetPasswordUseCase)
    : super(SendForgetPasswordInitial());
  final SendForgetPasswordUseCase sendForgetPasswordUseCase;
  void safesEmit(SendForgetPasswordState state) {
    if (!isClosed) emit(state);
  }
  Future<void> sendForgetPassword({required String email}) async {
    safesEmit(SendForgetPasswordLoading());
    final result = await sendForgetPasswordUseCase.call(
      SendForgetPasswordRequestModel(email: email),
    );
    result.fold(
      (failure) {
        safesEmit(
          SendForgetPasswordFailure(failure),
        );
      },
       (success) {
        safesEmit(SendForgetPasswordSuccess());
      },
    );
  }
}
