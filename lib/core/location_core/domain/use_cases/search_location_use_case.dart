import 'package:dartz/dartz.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/core/location_core/domain/entites/map_location_entity.dart';
import 'package:guide_me/core/location_core/domain/repos/location_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class SearchLocationUseCase {
  final LocationRepo _locationRepo;

  SearchLocationUseCase(this._locationRepo);

  Future<Either<Failure, List<MapLocationEntity>>> call(String query) async {
    return await _locationRepo.searchLocation(query);
  }
}
