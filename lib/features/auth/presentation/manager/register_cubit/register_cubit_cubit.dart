import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:guide_me/features/auth/data/models/register_request_model.dart';
import 'package:guide_me/features/auth/domain/use_case/register_use_case.dart';

part 'register_cubit_state.dart';

class RegisterCubitCubit extends Cubit<RegisterCubitState> {
  RegisterCubitCubit(this.registerUseCase) : super(RegisterCubitInitial());
  final RegisterUseCase registerUseCase;
  Future<void> registre({required String name , required String email , required String password , required String phone}) async {
    emit(RegisterCubitLoading());
    final result = await registerUseCase.call(RegisterRequestModel(name: name, email: email, password: password, phone: phone));
    result.fold(ifLeft: (failure){
      emit(RegisterCubitFailure(failure.message ?? 'Something went wrong'));
    }, ifRight: (success){
        emit(RegisterCubitSuccessful());
    });
  }
}
