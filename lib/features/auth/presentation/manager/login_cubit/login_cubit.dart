import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/features/auth/data/models/login_request_model.dart';
import 'package:guide_me/features/auth/domain/use_case/login_use_case.dart';
import 'package:injectable/injectable.dart';

part 'login_cubit_state.dart';

@injectable
class LoginCubit extends Cubit<LoginCubitState> {
  LoginCubit(this.loginUseCase) : super(LoginCubitInitial());
  final LoginUseCase loginUseCase;

  void safeEmit(LoginCubitState state) {
    if (!isClosed) emit(state);
  }

  Future<void> login({required String email, required String password}) async {
    safeEmit(LoginCubitLoading());

    final result = await loginUseCase.call(
      LoginRequestModel(email: email, password: password),
    );
    result.fold(
      (failure) {
        safeEmit(LoginCubitFailure(failure));
      },
      (success) {
        safeEmit(LoginCubitSuccessful());
      },
    );
  }
}
