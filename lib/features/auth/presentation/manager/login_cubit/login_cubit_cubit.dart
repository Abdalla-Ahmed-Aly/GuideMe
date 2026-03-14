import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:guide_me/features/auth/data/models/login_request_model.dart';
import 'package:guide_me/features/auth/domain/use_case/login_use_case.dart';

part 'login_cubit_state.dart';

class LoginCubitCubit extends Cubit<LoginCubitState> {
  LoginCubitCubit(this.loginUseCase) : super(LoginCubitInitial());
  final LoginUseCase loginUseCase;
  Future<void> login({required String email, required String password}) async {
    emit(LoginCubitLoading());

    final result = await loginUseCase.call(
      LoginRequestModel(email: email, password: password),
    );
    result.fold(
      ifLeft: (failure) {
        emit(LoginCubitFailure(failure.message ?? "Something went wrong"));
      },
      ifRight: (success) {
        emit(LoginCubitSuccessful());
      },
    );
  }
}
