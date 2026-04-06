import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/features/auth/domain/entities/auth_response_entity.dart';
import 'package:guide_me/features/auth/domain/use_case/login_with_google_use_case.dart';
import 'package:injectable/injectable.dart';

part 'login_with_google_state.dart';

@injectable
class LoginwithGoogleCubit extends Cubit<LoginwithGoogleState> {
  LoginwithGoogleCubit(this.loginWithGoogleUseCase)
    : super(LoginwithGoogleInitial());
  final LoginWithGoogleUseCase loginWithGoogleUseCase;
  void safeEmit(LoginwithGoogleState state) {
    if (!isClosed) emit(state);
  }

  Future<void> loginWithGoogle() async {
    safeEmit(LoginwithGoogleLoading());
    final result = await loginWithGoogleUseCase.signWithGoogle();
    
    result.fold(
      (failure) {
        safeEmit(LoginwithGooglefailure(failure));
      },
      (success) {
        safeEmit(
          LoginwithGoogleSuccess(success),
        );
      },
    );
  }
}
