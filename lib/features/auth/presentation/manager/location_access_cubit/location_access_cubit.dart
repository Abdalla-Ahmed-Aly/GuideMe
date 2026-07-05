import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/errors/exceptions.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/core/errors/failure_code.dart';
import 'package:guide_me/core/location_core/data/utils/location_permission_handler.dart';
import 'package:guide_me/core/location_core/domain/use_cases/get_current_location_use_case.dart';
import 'package:guide_me/features/auth/domain/use_case/add_location_use_case.dart';
import 'package:injectable/injectable.dart';

part 'location_access_state.dart';

@injectable
class LocationAccessCubit extends Cubit<LocationAccessState> {
  LocationAccessCubit(this.addLocationUseCase, this.getCurrentLocationUseCase)
    : super(LocationAccessInitial());
  final AddLocationUseCase addLocationUseCase;
  final GetCurrentLocationUseCase getCurrentLocationUseCase;

  void safeEmit(LocationAccessState state) {
    if (!isClosed) emit(state);
  }

  Future<void> getCurrentLocation() async {
    final granted = await LocationPermissionHandler.requestPermission();
    if (!granted) {
      safeEmit(
        LocationAccessFailure(
          const AppFailure(failureCode: FailureCode.locationPermissionDenied),
        ),
      );
      return;
    }

    safeEmit(LocationAccessLoading());
    final result = await getCurrentLocationUseCase.call(getName: false);

    if (result.isLeft()) {
      result.fold(
        (failure) => safeEmit(LocationAccessFailure(failure)),
        (_) {},
      );
      return;
    }

    final location = result.getOrElse(
      () => throw LocationPermissionDeniedException(),
    );

    final addLocation = await addLocationUseCase.call(
      latitude: location.lat,
      longitude: location.lng,
    );

    addLocation.fold(
      (failure) => safeEmit(LocationAccessFailure(failure)),
      (userEntity) => safeEmit(LocationAccessSuccess()),
    );
  }
}
