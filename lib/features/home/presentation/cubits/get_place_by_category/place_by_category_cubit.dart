import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/features/home/domain/usecases/place_by_category_usecase.dart';
import 'package:guide_me/features/home/presentation/cubits/get_place_by_category/place_by_category_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class PlaceByCategoryCubit extends Cubit<PlaceByCategoryState> {
  final PlaceByCategoryUsecase _placeByCategoryUsecase;
  String currentFilter = 'popular';

  PlaceByCategoryCubit(this._placeByCategoryUsecase)
    : super(PlaceByCategoryInitial());

  void safeEmit(PlaceByCategoryState state) {
    if (!isClosed) emit(state);
  }

  Future<void> getPlacesByCategory({
    required String categoryId,
    String? filter,
  }) async {
    if (filter != null) {
      currentFilter = filter;
    }

    safeEmit(PlaceByCategoryLoading());

    final result = await _placeByCategoryUsecase.call(
      params: PlaceByCategoryParams(
        categoryId: categoryId,
        filter: currentFilter,
      ),
    );

    result.fold(
      (failure) => safeEmit(
        PlaceByCategoryFailure(failure.message ?? 'Unknown error occurred'),
      ),
      (success) => safeEmit(PlaceByCategorySuccess(success)),
    );
  }
}
