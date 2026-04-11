import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/shared/models/category_model.dart';
import 'package:guide_me/features/home/domain/repo/home_repo.dart';
import 'package:injectable/injectable.dart';

abstract class GetCategoriesState {}

class GetCategoriesInitial extends GetCategoriesState {}
class GetCategoriesLoading extends GetCategoriesState {}
class GetCategoriesSuccess extends GetCategoriesState {
  final List<CategoryModel> categories;
  GetCategoriesSuccess(this.categories);
}
class GetCategoriesError extends GetCategoriesState {
  final String message;
  GetCategoriesError(this.message);
}

@injectable
class GetCategoriesCubit extends Cubit<GetCategoriesState> {
  final HomeRepo _homeRepo;

  GetCategoriesCubit(this._homeRepo) : super(GetCategoriesInitial());

  Future<void> getCategories() async {
    emit(GetCategoriesLoading());
    final result = await _homeRepo.getCategories();
    result.fold(
      (failure) => emit(GetCategoriesError(failure.message ?? 'Failed to fetch categories')),
      (categories) => emit(GetCategoriesSuccess(categories.map((e) => CategoryModel(
        id: e.id,
        name: e.name,
        image: e.image,
        slug: e.slug,
      )).toList())),
    );
  }
}
