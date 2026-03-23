import 'package:dartz/dartz.dart';
import 'package:guide_me/core/di/injectable.dart';
import 'package:guide_me/core/usecases/usecases.dart';
import 'package:guide_me/features/home/domain/repo/home_repo.dart';
import 'package:injectable/injectable.dart';

class PlaceByCityParams {
  final String cityId;
  final String filter;

  PlaceByCityParams({required this.cityId, required this.filter});
}

@lazySingleton
class PlaceByCityUsecase extends Usecase<Either, PlaceByCityParams> {
  @override
  Future<Either> call({PlaceByCityParams? params}) async {
    return await getIt<HomeRepo>().getPlacesByCity(
      cityId: params!.cityId,
      filter: params.filter,
    );
  }
}
