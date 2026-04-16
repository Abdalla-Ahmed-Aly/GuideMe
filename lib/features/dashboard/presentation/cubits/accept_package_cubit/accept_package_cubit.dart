import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/features/dashboard/domain/use_case/accept_package_use_case.dart';
import 'package:injectable/injectable.dart';

part 'accept_package_state.dart';

@injectable
class PackageActionsCubit extends Cubit<PackageActionsState> {
  PackageActionsCubit(this.acceptPackageUseCase)
    : super(PackageActionsInitial());

  final AcceptPackageUseCase acceptPackageUseCase;

  void safeEmit(PackageActionsState state) {
    if (!isClosed) emit(state);
  }

  Future<void> acceptPackage(String packageId) async {
    safeEmit(PackageActionsLoading(packageId: packageId));
    final result = await acceptPackageUseCase.call(packageId);
    result.fold(
      (failure) => safeEmit(
        PackageActionsFailure(failure: failure, packageId: packageId),
      ),
      (unit) => safeEmit(PackageActionsSuccess(packageId: packageId)),
    );
  }

  void resetState() {
    safeEmit(PackageActionsInitial());
  }
}
