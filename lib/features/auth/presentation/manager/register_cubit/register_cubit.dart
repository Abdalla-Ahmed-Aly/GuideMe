import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/core/shared/enums/user_role.dart';
import 'package:guide_me/features/auth/data/models/register_request_model.dart';
import 'package:guide_me/features/auth/domain/entities/auth_response_entity.dart';
import 'package:guide_me/features/auth/domain/use_case/register_use_case.dart';
import 'package:injectable/injectable.dart';

part 'register_cubit_state.dart';

@injectable
class RegisterCubit extends Cubit<RegisterCubitState> {
  RegisterCubit(this.registerUseCase) : super(RegisterCubitInitial());
  final RegisterUseCase registerUseCase;
  void safeEmit(RegisterCubitState state) {
    if (!isClosed) emit(state);
  }

  Future<void> registre({
    required String name,
    required String email,
    required String password,
    required String phone,
    required UserRole role,
  }) async {
    safeEmit(RegisterCubitLoading());

    final result = await registerUseCase.call(
      RegisterRequestModel(
        name: name,
        email: email,
        password: password,
        phone: phone,
        role: role,
      ),
    );
    result.fold(
      (failure) {
        safeEmit(RegisterCubitFailure(failure));
      },
      (r) {
        safeEmit(RegisterCubitSuccessful(r));
      },
    );
  }
}
