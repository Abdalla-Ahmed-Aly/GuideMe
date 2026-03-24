import 'package:dartz/dartz.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/core/location_core/domain/entites/map_location_entity.dart';
import 'package:guide_me/core/location_core/domain/repos/location_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class GetCurrentLocationUseCase {
  final LocationRepo _locationRepo;

  GetCurrentLocationUseCase(this._locationRepo);

  Future<Either<Failure, MapLocationEntity>> call({bool getName = true}) async {
    return await _locationRepo.getCurrentLocation(getName: getName);
  }
}
