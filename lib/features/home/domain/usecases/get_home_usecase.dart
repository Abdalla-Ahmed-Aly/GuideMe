import 'package:dartz/dartz.dart';
import 'package:guide_me/core/di/injectable.dart';
import 'package:guide_me/core/usecases/usecases.dart';
import 'package:guide_me/features/home/domain/repo/home_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetHomeUsecase extends Usecase<Either, int> {
  @override
  Future<Either> call({int? params}) async {
    return await getIt<HomeRepo>().getHomeData();
  }
}
