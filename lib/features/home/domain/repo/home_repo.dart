import 'package:dartz/dartz.dart';

import 'package:guide_me/features/home/domain/entity/home_entity.dart';
import 'package:guide_me/core/errors/failure.dart';

abstract class HomeRepo {
  Future<Either<Failure, HomeEntity>> getHomeData();
}
