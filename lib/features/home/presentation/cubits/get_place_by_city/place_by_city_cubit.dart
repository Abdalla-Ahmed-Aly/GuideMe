import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/features/home/domain/usecases/place_by_city_usecase.dart';
import 'package:guide_me/features/home/presentation/cubits/get_place_by_city/place_by_city_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class PlaceByCityCubit extends Cubit<PlaceByCityState> {
  final PlaceByCityUsecase _placeByCityUsecase;
  String currentFilter = 'popular';

  PlaceByCityCubit(this._placeByCityUsecase) : super(PlaceByCityInitial());

  Future<void> getPlacesByCity({
    required String cityId,
    String? filter,
  }) async {
    if (filter != null) {
      currentFilter = filter;
    }

    emit(PlaceByCityLoading());

    final result = await _placeByCityUsecase.call(
      params: PlaceByCityParams(
        cityId: cityId,
        filter: currentFilter,
      ),
    );

    result.fold(
      (failure) => emit(
        PlaceByCityFailure(failure.message ?? 'Unknown error occurred'),
      ),
      (success) => emit(PlaceByCitySuccess(success)),
    );
  }
}
