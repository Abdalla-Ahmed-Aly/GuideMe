import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/features/dashboard/domain/use_case/accept_package_use_case.dart';
import 'package:injectable/injectable.dart';

part 'accept_package_state.dart';

@injectable
class AcceptPackageCubit extends Cubit<AcceptPackageState> {
  AcceptPackageCubit(this.acceptPackageUseCase) : super(AcceptPackageInitial());

  final AcceptPackageUseCase acceptPackageUseCase;

  void safeEmit(AcceptPackageState state) {
    if (!isClosed) emit(state);
  }

  Future<void> acceptPackage(String packageId) async {
    safeEmit(AcceptPackageLoading(packageId: packageId));
    final result = await acceptPackageUseCase.call(packageId);
    result.fold(
      (failure) => safeEmit(
        AcceptPackageFailure(failure: failure, packageId: packageId),
      ),
      (unit) => safeEmit(AcceptPackageSuccess(packageId: packageId)),
    );
  }

  void resetState() {
    safeEmit(AcceptPackageInitial());
  }
}
