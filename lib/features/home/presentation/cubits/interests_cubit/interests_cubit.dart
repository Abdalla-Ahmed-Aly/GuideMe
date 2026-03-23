import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/core/shared/entities/category_entity.dart';
import 'package:guide_me/features/home/data/model/add_interests_request_model.dart';
import 'package:guide_me/features/home/domain/usecases/add_interests_use_case.dart';
import 'package:guide_me/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:injectable/injectable.dart';

part 'interests_state.dart';

@injectable
class InterestsCubit extends Cubit<InterestsState> {
  InterestsCubit(this._getCategoriesUsecase, this._addInterestsUseCase)
    : super(InterestsInitial(data: InterestsData.initial()));
  final GetCategoriesUsecase _getCategoriesUsecase;
  final AddInterestsUseCase _addInterestsUseCase;

  void safeEmit(InterestsState state) {
    if (!isClosed) emit(state);
  }

  Future<void> fetchCategories() async {
    safeEmit(GetInterestsLoading(data: state.data));
    final result = await _getCategoriesUsecase.getcatogry();
    result.fold(
      (failure) {
        safeEmit(GetInterestsFailure(data: state.data, failure: failure));
      },
      (categories) {
        safeEmit(
          GetInterestsSuccess(
            data: state.data.copyWith(
              categories: categories,
              categoriesLoaded: true,
            ),
            categories: categories,
          ),
        );
      },
    );
  }

  Future<void> addInterests() async {
    safeEmit(AddInterestsLoading(data: state.data));
    final result = await _addInterestsUseCase.call(
      AddInterestsRequestModel(interests: state.data.selectedCategories),
    );
    result.fold(
      (failure) {
        safeEmit(AddInterestsFailure(data: state.data, failure: failure));
      },
      (success) {
        safeEmit(
          AddInterestsSuccess(data: state.data),
        );
      },
    );
  }

  void toggleCategory(String categoryId) {
    final selectedCategories = state.data.selectedCategories.toList();

    selectedCategories.contains(categoryId)
        ? selectedCategories.remove(categoryId)
        : selectedCategories.add(categoryId);

    safeEmit(
      state.copyWith(
        data: state.data.copyWith(selectedCategories: selectedCategories),
      ),
    );
  }
}
