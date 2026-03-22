import 'package:dartz/dartz.dart';
import 'package:guide_me/core/errors/error_handler.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/core/location_core/data/data_sources/local/gps_local_data_source.dart';
import 'package:guide_me/core/location_core/data/data_sources/remote/location_remote_data_source.dart';
import 'package:guide_me/core/location_core/domain/entites/map_location_entity.dart';
import 'package:guide_me/core/location_core/domain/repos/location_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: LocationRepo)
class LocationRepoImpl implements LocationRepo {
  final LocationRemoteDataSource _locationRemoteDataSource;
  final GpsLocalDataSource _gpsLocalDataSource;

  LocationRepoImpl(this._locationRemoteDataSource, this._gpsLocalDataSource);

  @override
  Future<Either<Failure, MapLocationEntity>> getCurrentLocation() async {
    try {
      final locationModel = await _gpsLocalDataSource.getCurrentLocation();
      String? name;
      try {
        name = await _locationRemoteDataSource.getPlaceName(
          locationModel.latitude,
          locationModel.longitude,
        );
      } catch (_) {}

      final locationEntity = MapLocationEntity(
        lat: locationModel.latitude,
        lng: locationModel.longitude,
        name: name,
      );
      return right(locationEntity);
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, MapLocationEntity>> getLocationName({
    required double lat,
    required double lng,
  }) async {
    try {
      final name = await _locationRemoteDataSource.getPlaceName(lat, lng);
      return right(MapLocationEntity(lat: lat, lng: lng, name: name));
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }
}
