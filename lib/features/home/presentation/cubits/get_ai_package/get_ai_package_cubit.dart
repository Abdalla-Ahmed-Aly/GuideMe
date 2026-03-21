import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/features/home/domain/usecases/get_ai_package_usecase.dart';
import 'package:guide_me/features/home/presentation/cubits/get_ai_package/get_ai_package_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAiPackageCubit extends Cubit<GetAiPackageState> {
  final GetAiPackageUsecase _getAiPackageUsecase;

  GetAiPackageCubit(this._getAiPackageUsecase) : super(GetAiPackageInitial());

  Future<void> getAiPackages() async {
    emit(GetAiPackageLoading());

    final result = await _getAiPackageUsecase.call();

    result.fold(
      (failure) => emit(
        GetAiPackageFailure(failure.message ?? 'Unknown error occurred'),
      ),
      (packages) => emit(GetAiPackageSuccess(packages)),
    );
  }
}
