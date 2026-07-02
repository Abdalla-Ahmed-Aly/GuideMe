import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/core/location_core/domain/entites/map_location_entity.dart';
import 'package:guide_me/core/location_core/domain/use_cases/get_current_location_use_case.dart';
import 'package:guide_me/core/location_core/domain/use_cases/get_location_name_use_case.dart';
import 'package:guide_me/core/location_core/domain/use_cases/search_location_use_case.dart';
import 'package:injectable/injectable.dart';

part 'pick_location_state.dart';

@Injectable()
class PickLocationCubit extends Cubit<PickLocationState> {
  PickLocationCubit(
    this._getCurrentLocationUseCase,
    this._locationNameUseCase,
    this._searchLocationUseCase,
  ) : super(PickLocationInitial());

  final GetCurrentLocationUseCase _getCurrentLocationUseCase;
  final GetLocationNameUseCase _locationNameUseCase;
  final SearchLocationUseCase _searchLocationUseCase;

  void safeEmit(PickLocationState state) {
    if (!isClosed) emit(state);
  }

  Future<void> getCurrentLocation() async {
    safeEmit(PickLocationLoading());
    final result = await _getCurrentLocationUseCase();
    result.fold(
      (failure) => safeEmit(PickLocationFailure(failure)),
      (location) => safeEmit(PickLocationSuccess(location, movedByGps: true)),
    );
  }

  Future<void> pickLocation({required double lat, required double lng}) async {
    final initialLocation = MapLocationEntity(lat: lat, lng: lng);

    safeEmit(PickLocationSuccessLoading(initialLocation));

    final result = await _locationNameUseCase(lat: lat, lng: lng);

    result.fold(
      (failure) => safeEmit(PickLocationFailure(failure)),
      (location) => safeEmit(PickLocationSuccess(location)),
    );
  }

  void selectLocation(MapLocationEntity location) {
    safeEmit(PickLocationSuccess(location, movedByGps: true));
  }

  Future<List<MapLocationEntity>> searchLocation(String query) async {
    final result = await _searchLocationUseCase(query);
    return result.fold(
      (failure) => [],
      (locations) => locations,
    );
  }
}
