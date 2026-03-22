import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/features/home/data/model/get_catogry_copy.dart';
import 'package:guide_me/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:injectable/injectable.dart';

part 'get_catogry_copy_state.dart';
@injectable
class GetCatogryCopyCubit extends Cubit<GetCatogryCopyState> {
  final GetCategoriesUsecase getCategoriesUsecase;
  GetCatogryCopyCubit(this.getCategoriesUsecase)
    : super(GetCatogryCopyInitial());
  void safeEmit(GetCatogryCopyState state) {
    if (!isClosed) emit(state);
  }

  Future<void> fetchCategories() async {
    safeEmit(GetCatogryCopyLoading());
    final result = await getCategoriesUsecase.getcatogry();
    result.fold(
      (failure) {
        safeEmit(GetCatogryCopyFailure(failure));
      },
      (catogries) {
        safeEmit(GetCatogryCopySuccess(categories: catogries));
      },
    );
  }
}
