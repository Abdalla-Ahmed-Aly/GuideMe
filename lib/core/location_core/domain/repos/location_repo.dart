import 'package:dartz/dartz.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/core/location_core/domain/entites/map_location_entity.dart';

abstract class LocationRepo {
  Future<Either<Failure, MapLocationEntity>> getCurrentLocation({bool getName = true});
  Future<Either<Failure, MapLocationEntity>> getLocationName({
    required double lat,
    required double lng,
  });
}
