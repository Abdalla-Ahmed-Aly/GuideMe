import 'package:dartz/dartz.dart';
import 'package:guide_me/core/di/injectable.dart';
import 'package:guide_me/core/usecases/usecases.dart';
import 'package:guide_me/features/home/domain/repo/home_repo.dart';
import 'package:injectable/injectable.dart';

class PlaceByCategoryParams {
  final String categoryId;
  final String filter;

  PlaceByCategoryParams({required this.categoryId, required this.filter});
}

@lazySingleton
class PlaceByCategoryUsecase extends Usecase<Either, PlaceByCategoryParams> {
  @override
  Future<Either> call({PlaceByCategoryParams? params}) async {
    return await getIt<HomeRepo>().getPlacesByCategory(
      categoryId: params!.categoryId,
      filter: params.filter,
    );
  }
}
